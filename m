Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2703D3CF8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512181; cv=none; b=dsPqFOC9NI9JNqgOE/ApvUZQZYiPW6mIcL3I9CXv95Kp0tkTgi0TnFZ0+LowjR9yi/FWNipKBbAxwJWFbJFoedfH5IppiSymHnVWAe2kAgh9cLdTj9JO6GeIjSdmTHcO6qsCQvcl8ndP1DhgzpeVtKt/Vwu9og/AIsljYsX2N5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512181; c=relaxed/simple;
	bh=SThDNfz+eH+8w8LXSR+xbq1E8+NG3qLaNLs3QrFQAZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mfcp/kXP0pgZC7zCsypRTMACxSE/o3zRC7zDc88IuWfq6WJlRP5EjqWuXEVUfX9EcZ/+XvvVCrUPfs9Hj2tS1QMh3M/r8vi8Xqu7J+wsOrYEYeIKtE4ss/q+uxt9UFxDMdGkKR1mNv7zBGqmMgJ5CPim79YT3jwP6TkwOdFr3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+dyTJly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+dyTJly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB3F1F00893;
	Wed,  3 Jun 2026 18:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780512180;
	bh=JAqDYvntffn1kXXZAlA7jigxX851i5OHx+L8F8kp0mY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N+dyTJlyENKIxrZNR3/MQBfO9bv0NhMIzZK8sSpV0zzcsK/pT2dcD/dYT2aUiSPzo
	 A37eE+giwycc+AWvmP9/reyRigPlFWGiJ/iW//2X0Gl0mQWvEGpjs4RhuSmvm93s6Q
	 5tPFxjYa/mHQ6hCW4UgF0bqOCBKepojgv9K7nIk5E+XCv+26fvMguKVXHd9a7z1Oum
	 +BgsZBUoTuUG1f1OcNBH8SleVq7GPSDUkbqKSp9K4lkCjqJc1dATlQvb+spyh25NW4
	 dI7zWPYNI3mL4kYlFlUNjA2woHCIGPxz3Rq8GpXHc8gacIkg6aPhOFI50E4wjatg65
	 Z00oxGKNNzbAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom: add msm8660 fabric
 IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603163410.2312712-2-github.com@herrie.org>
References: <20260603163410.2312712-2-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 18:42:59 +0000
Message-Id: <20260603184259.EAB3F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message incorrectly claims the associated driver models =
the SFPB and CFPB fabrics.
--

commit f2c1f888ae217770de22883ba69e0e4f0206a9ee
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: interconnect: qcom: add msm8660 fabric IDs

This commit adds the interconnect master and slave IDs for the MSM8x60 fami=
ly
fabric mesh. It defines IDs for the various sub-fabrics including AFAB, SFA=
B,
MMFAB, DFAB, SFPB, and CFPB based on the legacy vendor driver.

>     The chip's
>     NoC fabric is split into multiple sub-fabrics that the qnoc-msm8660
>     driver models:
>    =20
>       AFAB  - Applications fabric (Scorpion CPU + L2)
>       SFAB  - System fabric (DMA, SPS, security)
>       MMFAB - Multimedia fabric (MDP, GPU, camera, video, rotator)
>       DFAB  - Daytona fabric (SDC, ADM master/slave)
>       SFPB  - System Fast Peripheral Bridge (RPM, MPM, PMIC SSBI)
>       CFPB  - CPU Subsystem Fast Peripheral Bus (GSBI UART/QUP, USB FS,
>               TSIF, TSSC, PDM, PRNG)

[Severity: Low]
Is this description accurate regarding SFPB and CFPB?

The commit message states that the qnoc-msm8660 driver models SFPB and CFPB,
but looking at the driver implementation introduced in this series, it appe=
ars
to only model AFAB, SFAB, MMFAB, and DFAB.

Could the commit message be updated to clarify that SFPB and CFPB are not
actually modeled by the driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603163410.2312=
712-1-github.com@herrie.org?part=3D1
