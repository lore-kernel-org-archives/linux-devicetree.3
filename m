Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235823;
	b=GJYlXbL5b5Q1ybSChc4oKD5mG6QNh+mKaWpgGRIfJXmIiWL3Je7B2lTGuHByO29UqzAV
	 Fb8akyTlDHDGeDMeL/ETZEpfl7Sl+nXkDU/OeiqPU/ogoNx2q2H6qlhlToTZ301ifyL83
	 FfdcetCIhZZLMJ5xRmSmvNpmYD21jsjY5WUFXvlLCbbuEEAjP0AeNAf5iBAGiXbbff3Qr
	 b004zq8BmJw+fr7AX30i5Vo3nh5ytUPWYWGcDOPnfLrXNb515tSIA+dpW2UvsmSQGPPOU
	 NW9yZB71Q//QOqTCuonmt9Vvn5h58bdMkBltIGH1O7bKwD3movrJWevsZNmrncT+lsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235823;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Isxpt8JmxIpOP820WX7AZrOIxOtljH4Ce3Bs9TvOx/8=;
	b=5BKAIiJbmZIf+BWlIOTxiHSu28eRY2Mqoz/wurgqWYWbu8oM4MeTBmtRumYfLuPCSXkt
	 wo/Ep4M9/sRIM+lBk3dRG036ltzjcwFC/Q2UBnKl0vzpxXadtyqsOwMofd1duaXnDtkMt
	 bJreFJyyzSFwW5yh2V03SjldQtBIFdBib/sENbaoY4J5n0l+mXqeW/uKgegehnQumQbd/
	 +lKLbe5HPWm01WxwBDxEnS2cU4+tkT9pGfLhwsoiOnsMCkMR845tR0R2FJX6+NAshARd8
	 rV+ewZaLK/ka3zxBdUGvjsZ9cs4o4eTJStCuBqiLNPreT/68aiLTdoHFLRnM4tDaZWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYxOKRWi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFED606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYxOKRWi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684621F0089F;
	Mon,  9 Nov 2026 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794235822;
	bh=Isxpt8JmxIpOP820WX7AZrOIxOtljH4Ce3Bs9TvOx/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYxOKRWiQWjRvoHR4SFkOGQ5ZKVQEnA8U3Rl3+Me7H9paptqz1UGUSRrtKf/ThICD
	 xb0S88hTDbxzti1tOqSL7JyTNas0pZFOM5MRBw6DMGuNaHJ4hLCRkik8qMI8tIV44T
	 v4341ArwcB7TV2BJuKOnnoI0dc95OAy+XFyfOS+O/fwU3IIvXNhUatbs+ctZde4DPG
	 luR9jDe8ZrxE7CLeH1PsYNfuuWonsTHb60DkKUVJoUosVk0f73TYcBPIju9VHA97F/
	 l0ffZeXPkZJSeL/pcrl1nnFuRWa+4WKLignFCM+bkFXGVsKjfotXWWuY9YiJqkCfqh
	 BBg4Jxjnphyqw==
Message-ID: <sashiko-outbox-205130@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/4] bus: simple-pm-bus: Populate child nodes at
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109140916.90625-5-herve.codina@bootlin.com>
References: <20261109140916.90625-1-herve.codina@bootlin.com>
 <20261109140916.90625-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 14:50:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] bus: simple-pm-bus: unpopulated grandchildren in
  simple_pm_bus_populate()
- [Medium] bus: simple-pm-bus: auxdata lookup table dropped in
  simple_pm_bus_probe()
- [Low] bus: simple-pm-bus: missing Fixes trailer for commit
  98e96cf80045
--

commit 7ba99d9ea04b1e1a29eebc1e1525489b300fe107
Author: Herve Codina <herve.codina@bootlin.com>

bus: simple-pm-bus: Populate child nodes at probe

This commit updates simple_pm_bus_probe() to populate child devices for
transparent bus matches (such as simple-bus, simple-mfd, isa, and
arm,amba-bus) during probe, and skips runtime PM calls in
simple_pm_bus_depopulate() when runtime PM is not enabled.

[Severity: Low]
In the commit message, this patch fixes the probe behavior for bus-only
devices where returning 0 without populating children caused
device_links_driver_bound() to create wrong fw_devlinks. Should the commit
message include a Fixes tag for 98e96cf80045 ("drivers: bus: simple-pm-bus:
Add support for probing simple bus only devices")?

[Severity: High]
In drivers/bus/simple-pm-bus.c, simple_pm_bus_probe() at line 104 now calls
simple_pm_bus_populate(), which at line 64 calls of_platform_populate() with
NULL for the matches table instead of calling of_platform_default_populate(=
).
Does this leave grandchild devices unpopulated when a child node has a
device-specific compatible string followed by a fallback bus or MFD
compatible string (such as compatible =3D "vendor,syscon", "syscon",
"simple-mfd")?

When an outer of_platform_default_populate() creates an ONLY_BUS device
after simple_pm_bus_driver is registered, of_platform_device_create_pdata()
synchronously runs simple_pm_bus_probe() before the outer
of_platform_bus_create() reaches its child loop. Inside
simple_pm_bus_populate(), of_platform_populate(np, NULL, lookup, dev)
creates the child platform_device and sets OF_POPULATED on the child node.
During device_add(), simple_pm_bus_probe() rejects that child with -ENODEV
at line 100 because the generic bus compatible is not first, and
of_platform_bus_create() returns 0 at drivers/of/platform.c line 371 without
recursing into the child's subnodes because matches is NULL. When control
returns to the outer of_platform_default_populate() loop,
of_platform_device_create_pdata() sees OF_POPULATED already set on the child
and returns NULL, so the outer loop also returns 0 without populating the
grandchildren. Calling of_platform_default_populate(np, lookup, dev) in
simple_pm_bus_populate() would pass the default match table and avoid
skipping those grandchildren.

[Severity: Medium]
In drivers/bus/simple-pm-bus.c, simple_pm_bus_probe() reads lookup from
dev_get_platdata(dev) at line 74 and passes it to simple_pm_bus_populate()
at line 104. Can this drop the caller's of_dev_auxdata lookup table for
devices beneath a simple-bus node?

When a caller such as sysc_probe() in drivers/bus/ti-sysc.c (line 3243)
calls of_platform_populate() with a match table that includes simple-bus and
a non-NULL auxdata lookup table, of_platform_bus_create() only attaches
platform_data to the simple-bus device itself if the auxdata table has an
explicit entry matching the simple-bus node. Otherwise dev_get_platdata(dev)
on the simple-bus device is NULL, and simple_pm_bus_probe() synchronously
populates all child devices of the simple-bus with lookup =3D NULL (setting
OF_POPULATED on each child) before the caller's of_platform_bus_create()
loop can recurse with the caller's auxdata table. As a result, child devices
under that simple-bus lose their auxdata bus_id and platform_data overrides.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109140916.9062=
5-1-herve.codina@bootlin.com?part=3D4
