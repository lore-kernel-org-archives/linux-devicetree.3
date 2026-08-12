Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02F33F594
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528669; cv=none; b=MoFKgB154TYJC1YmAUng8yx7weNbsMHIJklQa+n/kebqfP3xafEOTkffO1t4e8nt0lEd9ld0X6Ar+kWASnCpD+xbBvGIEvkeO+lsY90oYPFyCDiFQzx3kypDKnMjQG+UOVVvVBmGrZrE5mm96YQEOFpuE9SqBIS/EhC+CFWyP7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528669; c=relaxed/simple;
	bh=oYWIG0vU/zY8NVxx/QcYYampzUG/nko6zbXAJbLtjIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ucEquG5OeHrp45rWHR3jvI0ZZm/3ReUlUOXvmESZrdc13qKhvL3mYWmVDoF9kqH4uNTLmEmuwXXHf5Uv406H/SvMQTbD7L7xOlqm+41GqYO5vmOlXgrAG7ed5gWV34PhXLXbPafXC7JhYaqiNtV6cfP7lkadA74SHAR5ZVvwYKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPOC5B5T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPOC5B5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3631D1F000E9;
	Wed, 12 Aug 2026 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528668;
	bh=P33XxggVjyiU7AlmiFxI1p/GMWAmhvTFjt6wN+CHGd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPOC5B5TI/9vB+q6/ASeuzUGUIzJoQpb3h7icvD1u8fCGRq8qbb+dxy6535HV0jys
	 9hFVbL/+x/wG5Qf2oJVYYVWVWchwh1Rpe0ya/W29DjwKVNx0m2ferpmgjpYut8CWuh
	 BTJUJoiB7EyL15xhwgjGrNKgjXslqr8rnJKNj5BLXqXQmgutr6p2p4dTzafRWrEtvh
	 46auUUd06NQK6u3JVokJWQzmnuA47cBnh1yY8hKNkd2UdxbeF1XdCVEqMXPztKVI6/
	 fnYMYfMdTwLvoJod6iiFbkyj62RgIegVGe3FR6dR8haIbCxocXxi44/1fPPYjsx6sf
	 dNEYlL5jOXNZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/14] arm64: dts: qcom: ipq5018: Add Super-Speed
 UNIPHY to USB node
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-ipq5018-usb3-v2-11-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-11-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:57:46 +0000
Message-Id: <20260812095747.3631D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing `qcom,select-utmi-as-pipe-clk` from the base `.dtsi` brea=
ks USB initialization on boards that do not enable `usbphy1` (USB 2.0-only =
configurations).
--

--- Patch [11]: [PATCH v2 11/14] arm64: dts: qcom: ipq5018: Add Super-Speed=
 UNIPHY to USB node ---
commit cad428ffac4e6a077748bf0a342a5d6933fea31b
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: Add Super-Speed UNIPHY to USB node

This commit adds the USB3 UNIPHY node to the USB controller node in the
IPQ5018 device tree. It also removes the property that selects the UTMI
clock as the pipe clock, expecting the pipe clock to be supplied by the
USB3 UNIPHY instead.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5018.dtsi
> index 82e9ba6020ebd..87c3ade70217f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -618,10 +618,8 @@ usb: usb@8a00000 {
> =20
>  			resets =3D <&gcc GCC_USB0_BCR>;
> =20
> -			phys =3D <&usbphy0>;
> -			phy-names =3D "usb2-phy";
> -
> -			qcom,select-utmi-as-pipe-clk;

[Severity: High]
Will removing this property break boards that do not enable usbphy1?

For example, looking at arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts,
it configures USB but lacks usbphy1:

&usb {
        dr_mode =3D "host";

        status =3D "okay";
};

Because qcom,select-utmi-as-pipe-clk is no longer in the base device tree,
the dwc3-qcom wrapper won't fall back to the UTMI clock.

Since usbphy1 is disabled on these USB 2.0-only configurations, the PHY
driver doesn't probe and the pipe clock is never provided. Does this cause
the dwc3 controller to hang while waiting for a non-existent clock during
initialization?

> +			phys =3D <&usbphy0>, <&usbphy1>;
> +			phy-names =3D "usb2-phy", "usb3-phy";
> =20
>  			tx-fifo-resize;
>  			snps,is-utmi-l1-suspend;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D11
