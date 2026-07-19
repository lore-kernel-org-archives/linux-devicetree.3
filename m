Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15582609C5
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784454456; cv=none; b=Lm2Wss2VSKYPDtFhUj7hTgeculxklyb4D0dondzzUnAJSIirWvx3/Z9nNmGdlNnjyyOcd7tGqdtpHIWNtnvVB/kjd1ljZ3w/MqVDZqq8HpECbySJYvH5tinYZ+WrYTXE2PkC2EzA3RyZZHHUBtHqlknE+bP/Gy+71Tw9z73zlC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784454456; c=relaxed/simple;
	bh=M9SHjjSXP4vpheft86YGAjk375lREXVE+1vl7ygc7n8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ovvgDPT/+Y6W76QQUDMEwbyuP4RtP/t+NA3sGOC2BQgBeJ6/FL2WmXEVoXsa3MFYXy0yDQMNcK+C2479zSRQHejAG61aBGtCFNRCyDRODl+hnMt7keJxRL5NdxcBb1wk1XsoVUji+cmz6CbKuZ3QoxLIP/lr1gHpCM4FNmTOt5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAB8z7e1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAB8z7e1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E811F000E9;
	Sun, 19 Jul 2026 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784454455;
	bh=x3nmhEOuiuSh/QrRWREKogxmfV2vojmHwxfMiwTj7hI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAB8z7e1KVBNf6kh70k7NTrtbjeC6eeieRyx9mD2umNbMayytaGyaq+C4dA52b7rL
	 l2y0WIWQ8TL0CnNoqdy7CgohOIs0UJE1/GXCSVgLXaOsS60Z3cO4MBK+CConFhRKUm
	 MUoxqSaisdO5NHl2+YaQ17lGk9epP8q6t194/r4i/meX+gNhIRdl2xwYr5N2+WN0Bs
	 OtSka+TD5O9DZUgYNXZTRvOdE4/aEHzlDy96cpJjxf0fQxbQiwG0w0rpquI1oskRM0
	 Qdo/1oFgA9wV6Ytvi1ezZug5Y74YeGXA742XwVjCZyR6WIA/xpvIYQua/bYM/Fsole
	 gXYHid6JlvWXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700
 Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260719093226.197740-3-mitltlatltl@gmail.com>
References: <20260719093226.197740-1-mitltlatltl@gmail.com>
 <20260719093226.197740-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 09:47:34 +0000
Message-Id: <20260719094735.49E811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] SD card detection GPIO polarity is inverted.
- [Medium] Unresolved `splash-region` node name breaks bootloader framebuff=
er setup.
- [Medium] The SBU mux (`fsa4480_hs_sbu_mux`) for the short edge Type-C con=
nector is improperly mapped to `port@1` instead of `port@2`.
- [Low] Invalid scalar property `enable-gpio` used for the Awinic backlight=
 driver instead of `enable-gpios`.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700=
 Gen4 ---
commit fd69339b25380307f4c2239ad2b73d115e6d80d8
Author: Pengyu Luo <mitltlatltl@gmail.com>

arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4

Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
based on sm8750-qrd.

Link: https://lore.kernel.org/dri-devel/20260709142846.12463-1-mitltlatltl@=
gmail.com
Link: https://github.com/GUF296/linux/commits/codex/tb321fu-full-remediatio=
n-20260715
Link: https://github.com/linux-msm/hexagonrpc

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..602e7322b921b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

[ ... ]

> +		/* Short edge */
> +		connector@1 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <1>;
> +
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;

[ ... ]

> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_hs_sbu: endpoint {
> +						remote-endpoint =3D <&fsa4480_hs_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};

[Severity: Medium]
Is this SBU mux mapped to the correct port? According to the usb-connector
schema, port 1 is reserved for SuperSpeed, while port 2 is reserved for SBU.
Will mapping this to port 1 cause the Type-C subsystem and pmic_glink_altmo=
de
driver to misidentify the SBU mux as a SuperSpeed switch and break routing?

> +	reserved-memory {
> +		/*
> +		 * Use this to tell the BL to initialize the display related
> +		 * resources, so we can use efifb. Please 's/-/_/'
> +		 */
> +		splash-region {
> +			reg =3D <0 0xfc800000 0 0x2b00000>;
> +			no-map;
> +		};
> +	};

[Severity: Medium]
Will this node name break out-of-the-box framebuffer initialization?
Since the comment indicates the bootloader expects an underscore, could we
provide the correctly formatted splash_region here directly rather than
relying on a manual string replacement during compilation or deployment?

[ ... ]

> +	backlight: backlight@76 {
> +		compatible =3D "awinic,aw99706";
> +		reg =3D <0x76>;
> +
> +		enable-gpio =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Should this be enable-gpios instead of enable-gpio? While gpiolib
transparently handles the singular fallback at runtime, using the singular
form will likely cause dtbs_check to fail since the awinic,aw99706 binding
requires the plural property name.

[ ... ]

> +&sdhc_2 {
> +	cd-gpios =3D <&tlmm 55 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Is the polarity for cd-gpios correct here? The sdc2_card_det_n pinctrl
node further down defines a bias-pull-up, meaning a floating (empty) slot
will pull high.

With GPIO_ACTIVE_HIGH logic, will this cause the driver to incorrectly
interpret an empty slot as occupied?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719093226.1977=
40-1-mitltlatltl@gmail.com?part=3D2
