Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E72A7DA66
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784251015; cv=none; b=ic5sIx96rHBkFNEVKyq0M5KAN9mvzFATX9J4HPfaZHfSG3c1srt2VfxVzSLY7vvb56z4an+kkelJqDzUX7+ieyJtv4RThwPd6JmPp6ucxOFv1hPafr/BOcnArxWbJMSVkkWz0YnrY5oeTg0Uba5rd3OCX6PwyI7uXL6g4EWd+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784251015; c=relaxed/simple;
	bh=VjbhpW01oab5aAZ0KUCWRvc1J+jo1NZlZhPITS5EBrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y3ZV6ES4eEmTvx5VDLtZfVbClicOS6NvlX5FQHAAY4F8HqzPq7mnD2JcZV4xqD5t5xr8lZRWObd0ylGVzn6cNaJqorK2HUuP4fYAakMorDn4z/rY4VUFnnDQ+zzy+o0+sAYYCsCKkn3fOdNgzOVI5fenDbdwpTiihgnnwzQrSc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4mFBV/M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4mFBV/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27C61F000E9;
	Fri, 17 Jul 2026 01:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784251014;
	bh=ej+3Ux0C3Fmsu/uT0/gSrQLDbNbuAJ96Aw0hsyVRQgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R4mFBV/MlW1yiOMmnkzuKOtwe5WHMg5BXX9ebCnRjNJmS+Egn043wOJDGXoz4DGg2
	 3lo6Z+4B6Asg1ZtStZKjrpmzjGdEJFk/8UKKsEtYHl+B/K3E853s6OX44K2f7rd6Xs
	 HYp67vALurh10lir98Vijs3tI/k4cux9OL6IP/PElr80x+DoATjry9W30v9l0Oukni
	 lIaAv1I42IKdtJWcnywvRMghZvIvYwiGZjoVLsbpSBbxMVk1CyNfH/iSMZdHz+6bye
	 Vy97CexpZsCM10jyc3/d3w7kbl+ZBb0frqwfc5AFRLKsuKfStGoF/WZ02+O3n29BK3
	 E2q8AL/iiRF0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable wireless on
 rk3399-roc-pc-plus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717010736.578419-2-festevam@gmail.com>
References: <20260717010736.578419-1-festevam@gmail.com>
 <20260717010736.578419-2-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 01:16:53 +0000
Message-Id: <20260717011653.F27C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing the shared 32kHz LPO clock from the SDIO power sequencer =
breaks Wi-Fi initialization when Bluetooth is disabled or probes later.
--

--- Patch [2]: [PATCH 2/3] arm64: dts: rockchip: Enable wireless on rk3399-=
roc-pc-plus ---
commit d6496a6030e5f440c56fb715094eff4f9078ed81
Author: Fabio Estevam <festevam@nabladev.com>

arm64: dts: rockchip: Enable wireless on rk3399-roc-pc-plus

This commit enables the Ampak AP6256 Wi-Fi/Bluetooth module on the
rk3399-roc-pc-plus board. It describes the SDIO and UART interfaces, adds
power sequencing delays, and removes the clock from the SDIO power sequencer
to allow the Bluetooth node to request it directly.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/a=
rm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
> index f6d62ee51f1b9..f87bc7b6afc14 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts

[ ... ]

> @@ -180,6 +198,28 @@ i2s_8ch_mclk_pin: i2s-8ch-mclk-pin {
>  	};
>  };
> =20
> +&sdio_pwrseq {
> +	/delete-property/ clocks;
> +	/delete-property/ clock-names;

[Severity: High]
Will removing the shared 32kHz LPO clock from the SDIO power sequencer break
Wi-Fi initialization when Bluetooth is disabled or probes later?

If the MMC/SDIO subsystem initiates its power-on sequence before the Blueto=
oth
driver probes, or if Bluetooth is disabled, the LPO clock will not be enabl=
ed.
Without this clock, the Wi-Fi module cannot start its state machine and will
fail to respond to the initial CMD5 enumeration from the MMC core.

Additionally, if Bluetooth enters runtime suspend and gates the clock, could
this crash the active Wi-Fi firmware?

> +	post-power-on-delay-ms =3D <100>;
> +	power-off-delay-us =3D <500000>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717010736.5784=
19-1-festevam@gmail.com?part=3D2
