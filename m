Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD9371046
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935067; cv=none; b=tI2P5pJT5RQyifLtz1qczNldQAHHKRx4TuMl5mYO3HJSUo5PmlO03WznLRU3scrld22wVbCOPu5BgXKAL1lhwSP0un2rmbRSqKCKHTe//YfGXoXJoPQfO0I96ljB7K0ixdcjqL1vYMvs++ovTkwwndY1deVO/OCHT9mbG4FpKNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935067; c=relaxed/simple;
	bh=vT12LSsZOtPtTXMuugIv1WYl5n5t5wZ9omyM0DspA7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KwcJbanv1SovdIh7hKqcI0bFMkUT/wKmrOBIMlNBBsZKrD/TTfW3qFBM6ecaWqzRWfOVa31+qdMmCu+cbsvoLu+QkbBuxk1IxIPZbIxzmMkI2ye72h8MTzwg7OT7hIYRuNhu6f4f4+YCmw6gNmRiBzfcW8Ufr1fY694IoeLPY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3C4Mufk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3C4Mufk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4981F00A3D;
	Wed,  9 Sep 2026 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788935065;
	bh=9tjuNQoaPUI12kQTW5Mqn9lHODECg63B/kmx98FeeVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g3C4MufkxHFLvgFbXGh0wjb5yZ2W1v5eB5KT+E4AVxmfJ9sOj3mxbtnBrFBTpOCxS
	 gZxUNO9GbnReB+rM4SyKAQsjkLQO4kan++PvZocCmfzySK0lBOaAQc7gBz0SKWovdq
	 PrPH5ftQBqDAtBYGGvX2xGkzmPPciq9xvJRe6AuzUPXeZTKQMWYd9b7hv3MCVzkuWU
	 Op3UEj6dQhXnm0CfriJBn/kJqjcu5EprPivXS90vOmbTLE3ri4ZFE6m9YvmiIwqM3J
	 tKvlbKaGt6CqwxcTzNAKkGkzx1eE9NZkZFmkE7gSCFE1KTznLbgubnmk99cbdnINx2
	 dlRGAVBBjGezw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH PRELIMINARY 3/5] arm64: dts: qcom: shikra-cqm-evk:
 enable the first Ethernet port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-shikra_ethernet_dts-v1-3-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-3-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:24:25 +0000
Message-Id: <20260909062425.AC4981F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `rgmii_phy_supply` regulator will never be enabled because its=
 consumer property `vdda-2p5-supply` is unrecognized, leaving the Ethernet =
PHY unpowered.
--

commit 02736a4e2fd0c007683a5dc746272d6c69e9e024
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: shikra-cqm-evk: enable the first Ethernet port

Enable ethernet0 for the Shikra CQM EVK board with its DP83867 RGMII
PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79b..d093b80034823 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts

[ ... ]

> +		rgmii_phy: ethernet-phy@7 {
> +			compatible =3D "ethernet-phy-id2000.a231";
> +			reg =3D <0x7>;
> +			reset-gpios =3D <&tlmm 135 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <50000>;
> +			vdda-2p5-supply =3D <&rgmii_phy_supply>;

[Severity: High]
Will this regulator ever be enabled?

Because vdda-2p5-supply isn't a recognized property by the DP83867 PHY
driver or the core MDIO/PHY frameworks, it appears this regulator is never
requested or enabled by any consumer.

Since rgmii_phy_supply defaults to output-low via its pinctrl and isn't
marked with regulator-always-on, does this mean the Ethernet PHY remains
unpowered and non-functional?

> +		};
> +	};
>  };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com?part=3D3
