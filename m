Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FFFC2FD
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286395; cv=none; b=jkJAMBUg3mvI7kXZ2knNrGwtar/ksD8+HFiraWwff29vYGFtMpc6xrQzNSkjWwqL8ZAm/4/3LWY0IZAPMDdZWUPe+nTKEmNMeG6k9zNA44Zy+v+TvDXS7V106EIG4H5qsnCvmFbWJUuh4spY51rIxtq1VhDbTqEOBelwgCa7UHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286395; c=relaxed/simple;
	bh=LfjQbVjrT/AfvY734gvUyrSpeUuTM7cVwFFTrvH2UT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hcp316ZKymACVfm7FLAIS2MC0cRWkTBxNk7Vl4cQkI48/umqLRj1YUshpVYMAvhEtY9OVma+9OCudpDlUQdZa0KUkZvyIuuhcfobbe/YlBoBaQew9+Lftpg6c+WLtfXONwYOlhV46gMQqoHl+D0TiJ77O/K5aGzwtleVMu2beoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh8OQGKE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh8OQGKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056F7C2BCB0;
	Sat,  9 May 2026 00:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778286395;
	bh=LfjQbVjrT/AfvY734gvUyrSpeUuTM7cVwFFTrvH2UT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Wh8OQGKEsKBqgTGYzL30dpFD9lbpPXW1CnP75f5sTvlbp/+ywqEpCXSsgavNHEIhj
	 HCrVCiHaYRYrcOCh+WN4U8QQVRLY71KzN9FB6XNlWxxsChxbJbVWhQF5pSflO54YoA
	 peG69Z/7jaW5Cpd/mcR3llT37w1hLqkxocwBp/U4AlHrn9sINFNYei5wEnyoF3vo4C
	 1q7vlOAxiBEDaK3UDD0SqRmoifFwKnnBupgktnvEz9R5W6Od8/pERvfSoNKttX7uEN
	 8ouiiCSfnmqSMvSPErJkgJQ1IAJHSO7MHShEUqfT8oT3UiqCR49zTfI46gwi9WS5pB
	 roYEBNo/uCk/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] arm64: defconfig: enable designware mipi csi-2
 receiver
Reply-To: sashiko@lists.linux.dev
To: "Michael Riesch via B4 Relay" <devnull+michael.riesch.collabora.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-rk3588-vicap-v4-8-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-8-6a6cd6f7c90b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:26:34 +0000
Message-Id: <20260509002635.056F7C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing required MIPI D-PHY drivers in defconfig for Rockchip So=
Cs.
- [Medium] Missing image sensor driver for the specifically cited Radxa Cam=
era 4K.
--

commit 41eac3bdbc884fc3746037906dd763beee3577a5
Author: Michael Riesch <michael.riesch@collabora.com>

arm64: defconfig: enable designware mipi csi-2 receiver

This commit enables the Synopsys DesignWare MIPI CSI-2 receiver driver as a
module in the arm64 defconfig to support camera modules on Rockchip RK3568
and RK3588 platforms.

> The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into recent
> Rockchip SoCs, such as the RK3568 and the RK3588. As a consequence, they
> are used on a lot of Rockchip-based single board computers and/or
> corresponding camera modules, such as the Radxa Camera 4K. Enable the
> driver for it in the default configuration.

The Radxa Camera 4K uses the Sony IMX415 sensor. Should CONFIG_VIDEO_IMX415
also be enabled in the defconfig so this specific camera module is function=
al
out-of-the-box?

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f939..9171f750337e5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -918,6 +918,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=3Dy
>  CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
>  CONFIG_VIDEO_AMPHION_VPU=3Dm
>  CONFIG_VIDEO_CADENCE_CSI2RX=3Dm
> +CONFIG_VIDEO_DW_MIPI_CSI2RX=3Dm

Will this driver defer probing indefinitely without the corresponding Rockc=
hip
physical layer drivers?

The dw-mipi-csi2rx driver depends on the generic PHY framework to initialize
and power the MIPI D-PHY. It appears CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY (for
RK3568) and CONFIG_PHY_ROCKCHIP_SAMSUNG_DCPHY (for RK3588) are missing from
the defconfig.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-rk3588-vic=
ap-v4-0-6a6cd6f7c90b@collabora.com?part=3D8
