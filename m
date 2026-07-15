Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAE391E7E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126365; cv=none; b=RWU5h8n7QBe5ifEda58MxLIG4nH3uDhmLNCk1qD8K7apwtcJkK63ODyjbe7vKIyc6MTa63Zc57pSMFCTzNdk8QTgHfFU11nBvj+qplymytLhe89DrYzQNgwhad3hHm/vAs7okMEFogA+RGKLUNOtggedNpn8fxCe+6XqBjX6TFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126365; c=relaxed/simple;
	bh=+buY84u9G0Rr9JPAXUg8CXH2pTk7vWvqZX56w2sMogA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GLH22JEim4Kwy8Pl5GXrjpWxwi0Z8fDq4MZtFc0dyqBPdMfYY5FzZ/aY9hQG5RYvEzJwH/dty7TSbFPIcKw+7uGgSXxr9pKsmrtgwZ51ebO9i/U2ZenXf1cMHm4mj0n/cXN98Cicux2QaAKPT8cdhB0zk2SGgTRkdHw/7QMMEgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLS85059; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLS85059"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BF01F000E9;
	Wed, 15 Jul 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126363;
	bh=+buY84u9G0Rr9JPAXUg8CXH2pTk7vWvqZX56w2sMogA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mLS85059s/6GyTU+wCN+unAogXQ1cfGcz6jhYBKhQsXMuVtgfWCkvzyKnrYGqgInC
	 xCO1uvBd952EYIsQmSqrVhgwpd4uurECa/5tvI/BKNlBPTLLLdNpzP4/LRfHj8sAXn
	 6+2y0YBzQsNK0b6Lt/iO7R/OoFKnfmR1WXa5Jjqjkp1aCZPScRoYd8turfFn1mU6nr
	 okO3GvneEXmZ0+wUAajbsGx+lHxpI7aJOMndZ/OZgClwbiOZDL0njomzgtYO46TG1a
	 hOJwx/rCcqtVTuSL4IZYV1gYs8GE8SKUL2AWqhwYu1gDcV4ho+oWx6DNB9XXJWmjsF
	 GigIy/Jo712EQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/14] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715-glymur-v9-7-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-7-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:39:23 +0000
Message-Id: <20260715143923.84BF01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Bundling global device OPP rate adjustments into per-block helpers=
 drops the global OPP rate to 0 on error paths, potentially crashing active=
 hardware blocks.
- [Medium] Multi-core platforms will fail to power on/off secondary hardwar=
e cores due to implicit array-to-pointer decay.
- [Medium] Unconditional use of optional power domain structures in VPU4x h=
ardware enable/disable paths leads to NULL pointer dereferences.

Pre-existing issues:
- [Critical] The `sys_error_handler` delayed work is not canceled during dr=
iver removal, leading to a Use-After-Free of the `core` structure.
--

--- Patch [7]: [PATCH v9 07/14] media: iris: Replace enum-indexed clock and=
 power domain tables with per-block structures ---
Note: The format of this review is altered to provide a free-form summary
of the findings due to restrictions on quoting the original patch text.

Commit: 67736d0c8e0f502135f0c4a867f560515cee6311
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: media: iris: Replace enum-indexed clock and power domain tables...

This patch refactors the Iris driver to replace flat, enum-indexed arrays
with per-block data structures bundling power domains and clocks together.
It aims to simplify platform extension by operating directly on the block
instances during enable and disable paths.

[Severity: Medium]
In drivers/media/platform/qcom/iris/iris_vpu_common.c inside
iris_vpu_power_on_hw(), and in iris_vpu4x.c inside
iris_vpu4x_power_on_hardware(), the code passes the core->vcodec pointer
directly to iris_enable_power_domain_and_clocks(). Since core->vcodec is
allocated as an array based on plat->num_cores during initialization, does
passing it directly cause it to decay to a pointer to the first element?
If so, wouldn't this leave secondary hardware cores unpowered on multi-core
platforms?

[Severity: High]
Looking at iris_enable_power_domain_and_clocks() in iris_resources.c, the
error path calls iris_opp_set_rate(core->dev, 0). Because core->dev manages
the global OPP state for the entire Iris core, dropping the rate to 0 here
affects all blocks. If enabling a secondary domain like vcodec_vpp0 fails,
could this starve the already-enabled primary vcodec block of voltage while
its clocks are still running, potentially hanging or crashing the hardware?

[Severity: Medium]
In iris_vpu4x_power_on_hardware() in iris_vpu4x.c, the code checks the
hardware efuse to decide whether to enable vcodec_vpp0. It then passes
core->vcodec_vpp0 to the enable helper. If a platform omits the optional
vcodec_vpp0_data but the efuse still indicates it is present, the pointer
will be NULL. Since the helper immediately dereferences pd->pd_cnt without
any NULL checks, does this introduce a NULL pointer dereference?

[Severity: Critical]
This is a pre-existing issue, but looking at iris_remove() in iris_probe.c,
it seems the sys_error_handler delayed work is never canceled before the
driver is torn down. If driver unbind or module unload occurs right after a
fatal system error queues this work, the core structure will be freed by
devres upon returning. Could this result in a use-after-free when the
delayed work subsequently executes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D7
