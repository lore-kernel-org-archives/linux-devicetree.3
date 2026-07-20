Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B183AFD04
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529963; cv=none; b=Z/2wgoDvfePD6O+/4OjWbHOOY2xyDfH8yFFP7+5CYFdjqEync4tdRcHESs8mO+gfO1tBFKWsBq7BCX/ZdGNk3G5mFbor7kxldQvSzb/OvPYDuwZdIM51bxdLLORTKQXquggO8ahXlP9oWX5TRfMYXN67yllW2CtRcRaw6l+Fsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529963; c=relaxed/simple;
	bh=VF/6NO8GP3mV8GihzCmgD4XqzfLCWaNXUxfujCgRLsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E3OVxJYMgr+YrJm1ck7g0CvXD4/xpMRDc4lsydboQBhhh/kLtZ7Fs5PolD8jZk6AmDhnmr29K+h4tkcOnVm0s0bhJuuSRt/wEBuMKNnv7ol9VJafOzFD0tL+YUtU7MmCkqw4pRmH80RcuoyygdJV2lDzP6R/963ekNsTmACHll4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chk4MhAF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chk4MhAF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDEE1F00A3A;
	Mon, 20 Jul 2026 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784529960;
	bh=VF/6NO8GP3mV8GihzCmgD4XqzfLCWaNXUxfujCgRLsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=chk4MhAFeSYJuzgtHRR+SHWNxGp9EYrNGMe0gFB+ZawPaHbDmR6JglYKK9mMkQuru
	 pS4RnRp92yu9v/wya81L5No2VmMZ6Lt9mYCIxyMqaMLi6oGN423C3/qm06a5JYlBO4
	 2Z5IR+yVX1mHnTVHpjNNy65IZA9bnVmyLmfhvbbbfx+OP3QB71wB7w4CfkV0NkSrNX
	 EZrZriA43fN1R0JX/uzgENxc0wTuqnX8B7zWb9j/G6t8jFqEgJ2AGURL/Je4ScwBQi
	 BrazXmrDQ4Pq6Qnyaghzp47Ulgzn7EIr/OktHQ8AZX3JonIn0Vt5xOcsyBeq2sea2L
	 WxcnQsSXn++jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] soc/tegra: pmc: Add Tegra210B01 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-t210b01-pmc-v2-2-ca5317f8507b@gmail.com>
References: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
 <20260720-t210b01-pmc-v2-2-ca5317f8507b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:45:59 +0000
Message-Id: <20260720064600.5FDEE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The PMC driver will fail to probe on Tegra210B01 if the device tre=
e contains legacy or unsupported powergate nodes (such as 'venc' or 've2').
- [Medium] Undocumented behavioral change silently disabling MBIST workarou=
nds and I/O pad write-enables on Tegra210B01.
--

--- Patch [2]: [PATCH v2 2/2] soc/tegra: pmc: Add Tegra210B01 support ---
Note: The format of this review has been altered to provide a free-form sum=
mary
of the findings without quoting the original patch code due to recitation
restrictions.

commit c36910d71ccf4e86f0df7aa19d1325b68ba7e824
Author: Azkali Manad <a.ffcc7@gmail.com>

soc/tegra: pmc: Add Tegra210B01 support

The PMC in Tegra210B01 is very similar to the one in the original
Tegra210, but has a few powergate differences. Add support for this soc.

[Severity: High]
Will the PMC driver fail to probe on Tegra210B01 devices that reuse the
standard tegra210.dtsi?

The standard device tree contains venc and ve2 powergate nodes. Since
these are omitted from the new tegra210b01_powergates array,
tegra_powergate_lookup() will return -ENODEV for them.

During initialization, tegra_powergate_init() iterates over all child nodes
using for_each_child_of_node_scoped(). If tegra_powergate_add() returns an
error for any node, the loop breaks and propagates the error, aborting the
entire PMC probe. Could the loop be updated to safely skip unsupported
powergate nodes instead of failing?

[Severity: Medium]
Is it intentional that the mbist workaround and I/O pad write-enables are
disabled for this SoC?

The new tegra210b01_pmc_soc definition sets needs_mbist_war and
has_io_pad_wren to false, which diverges from the base tegra210_pmc_soc
where they are set to true.

The commit message mentions powergate differences, but doesn't mention
disabling these hardware flags. If the B01 hardware stepping resolved these
errata physically, could this be documented in the commit message? Otherwis=
e,
will omitting these flags cause hardware initialization issues?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-t210b01-pm=
c-v2-0-ca5317f8507b@gmail.com?part=3D2
