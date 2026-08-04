Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33646D2B6
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857971; cv=none; b=MR39SXxAm+E0yz9dUHxAAzxzEogHLI/VRF8YbExQbPcpmBOtxU3SKjmU4ha20rC8Ggg1oDgDDtLLgObcEDlXuFqc6G8pybqEFn7Zf7i1q922IoWYyWGsoJriqnD5YALLuEN0tbmeMw699RNROVutYnBhuJBMvQ+Cjftts68vkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857971; c=relaxed/simple;
	bh=HgaWBpkL9n6hxmnNnmsaifcy4rgfDI9phSRcVM39OZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O2yoL/05BSzawIg3cCf6TSh3GUjVMhSs3bpVcLEPKwO3aoB070WpFCkDUJuEpl1Uo9hIR3gkCjD1c0RR0GEeldssuX1RFITQrwTyDqQjVDZqrMlyC6z8fKC/UeVcBem9CFTiOEtrnkq67wGiNQLLcTkgJ9yRAXGpkj1vAMt0kYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2/11gdO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2/11gdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481061F00A3A;
	Tue,  4 Aug 2026 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857963;
	bh=dq84fRvB1qNu+OIBvS23SLRCSJe49IEClMxauGY8FqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B2/11gdOK5UWrUnZODTv6njHjox4hOkjh9sXkWO89Mrzo+wTh41J+VBieiC+OZH4u
	 lHIu6V0QoUJEN7dtiMGquWAddOZCs7PiRrV11SciODuBDO/UAHDdkmi0o+aI0G6fXz
	 P9ld6m8gHLWtftStXtNNrd7/utaURt2BbM5ZfpwgFKBV+orBrcXv3ZYr3c4JSOh10f
	 LibTu0WIy6tzXXEzgWcRlqr0tBz+yhvRgEZBwXtqL+/8DfwPnRIQHIo0m9YVLvdeI5
	 pnLATYjUdcSHXf8Sk4QcE8FbIdGL368CjHQMknfKRxvgRCxPUc34bm9k55Wf6Zwjq6
	 89dSEzMG/GOeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: regulator: act8x: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-regulator-syspower-v1-2-b05af2081184@nxp.com>
References: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
 <20260804-regulator-syspower-v1-2-b05af2081184@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:39:22 +0000
Message-Id: <20260804153923.481061F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Broken schema cross-reference to a non-existent power-controller.ya=
ml file.
--

--- Patch [2]: [PATCH 2/2] dt-bindings: regulator: act8x: Use generic power=
-controller schema ---
commit dbd959e51dadcb9629319a89cca123c97aebf588
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: regulator: act8x: Use generic power-controller schema

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
system-power-controller property definition.

> diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8=
600.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8600.=
yaml
> index b8ca967bc83d1..49f74a9b1eaab 100644
> --- a/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
> +++ b/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
> @@ -9,6 +9,9 @@ title: Active-semi ACT8600 regulator
>  maintainers:
>    - Paul Cercueil <paul@crapouillou.net>
> =20
> +allOf:
> +  - $ref: /schemas/power/power-controller.yaml#

[Severity: Low]
Does this reference break dt_binding_check?

It appears that /schemas/power/power-controller.yaml does not exist in the
tree yet, as only the legacy power-controller.txt is present in
Documentation/devicetree/bindings/power/.

Are there missing prerequisite patches for this series?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-regulator-=
syspower-v1-0-b05af2081184@nxp.com?part=3D2
