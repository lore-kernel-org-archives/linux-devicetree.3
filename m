Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0872D246762
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786283306; cv=none; b=ScGyU3X5C6zU9d2pvGVSIQrVklD48ZI4StB/LuWmFMZv/hGjP2jXcUcCXRdX98sP/jwqU4TFxt+EN2pA1kjxwWZNqPxB95wJJ5aaw3V/vyEDqhA/dPrYuR8c9oeSN8SJyQMeDyQDyQpu9xzpbXYPHTiAwEyyc4Drt9QzxY2JoxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786283306; c=relaxed/simple;
	bh=d0n6LwfIXgcfPcqj4wlS4003TMmIJ+evbLSBHiKgQjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jEqecF1iAQJE0hrxBoXaTSzRghNDS8TYUCp+x+Lhbo6unS3A4MpkepdRD6q6HbGO6C3lXfHKPOO2dlhuS4XXaNUiGjcR8I7OKde0DCEE/PM5CkrcKy8sGdaBoUGSYwGlv5WHCkjorR3Y6OFBjjISP7JHMPLZSOY04sKWqQxJYEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSyGqerk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSyGqerk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574761F000E9;
	Sun,  9 Aug 2026 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786283304;
	bh=y8yPDhFSR85P2DF02FPMhKQZDxnYjLmtDZqNRVZFfXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VSyGqerkXogNkdqirO/3hV+YeboLRsOWfAMyzOf9VQ1xar3YHb9HEj93NlGWsFqcr
	 t9c6ZUiO6h0Pnu3C+FCBXVpkAkpSMV9yF/tWEwa+YUu4jsY1rEVOLj/5TxY7t4U/I7
	 wAtajdEiI7PXPoEbMS/bRsr0PP/4Ffjck+QGdFnUZEeVI7bgKhESo2c5Gx6ywdPdVD
	 YjgYrRzfwTTAJHcoKY6HT5WmXhTA2qyXDpPUU2hrr+ysc/o6NlvfuG0qEaYZhq8E80
	 dPf3HEkx2u8Z4L5BtNJMmVaq/1LPeC9S7wg9oOHbb/Gm/ybDHmyoYTJND0fG212m1I
	 IiBHgmxn3pYAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-dell-xps-9345-ec-v4-3-88306dbbc7aa@vinarskis.com>
References: <20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com>
 <20260809-dell-xps-9345-ec-v4-3-88306dbbc7aa@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 13:48:23 +0000
Message-Id: <20260809134824.574761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces fatal device tree build failures by referencin=
g an undefined label `&pmk8550_vadc` and using an invalid parameterized mac=
ro syntax for ADC channel specifiers (e.g., `ADC5_GEN3_AMUX3_GPIO_100K_PU(1=
)`).
--

--- Patch [3]: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: i=
ntroduce EC ---
commit 6743702dcb2539a4e554f58c14ddc3bc1f52a527
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC

Describe embedded controller, its interrupt and required thermal zones.
Add EC's reset GPIO to reserved range, as triggering it during device
operation leads to unrecoverable and unusable state.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index ce7b10ea89b6d..8d8d8014049bb 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
[ ... ]
> @@ -759,8 +759,32 @@ retimer_ss0_con_sbu_out: endpoint {
> =20
>  &i2c5 {
>  	clock-frequency =3D <100000>;
> -	status =3D "disabled";
> -	/* EC @0x3b */
> +	status =3D "okay";
> +
> +	embedded-controller@3b {
> +		compatible =3D "dell,xps13-9345-ec";
> +		reg =3D <0x3b>;
> +
> +		interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 =3D <&ec_int_n_default>;
> +		pinctrl-names =3D "default";
> +
> +		io-channels =3D <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>,
                               ^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Does the pmk8550_vadc label exist in any of the included files? It appears =
this
might be an undefined label, which would break the device tree compilation.

Additionally, are the ADC5_GEN3_AMUX*_PU macros defined to accept parameter=
s?
If they do not, using them with (1) will result in a syntax error when pars=
ed
by dtc.

> +			      <&pmk8550_vadc ADC5_GEN3_AMUX4_GPIO_100K_PU(1)>,
> +			      <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>,
> +			      <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>,
> +			      <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>,
> +			      <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>,
> +			      <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
[ ... ]
> @@ -1025,6 +1049,57 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
>  	};
>  };
> =20
> +&pmk8550_vadc {
   ^^^^^^^^^^^^^

[Severity: Low]
Is this attempting to extend a non-existent node? This will also cause a
build failure if pmk8550_vadc is undefined.

> +	sys_therm0: channel@14c {
> +		reg =3D <ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,ratiometric;
> +		label =3D "lpddr5_therm";
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-dell-xps-9=
345-ec-v4-0-88306dbbc7aa@vinarskis.com?part=3D3
