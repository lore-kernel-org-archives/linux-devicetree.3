Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EEF30216D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055620; cv=none; b=JJTlPAtppMuSYoTjcoVWcpsW+gpIuyaqluOuYOiOdafDuwMPzZGvSMNxTTp/pLNYvCckPhV0yPsRmbl8lNgK+JnDglmBAiIZN64Ldla4paEdRfvZGmpT9Gk7qubJc5LQUcsQ4aHGWNEkxu7P1cEby8V+wMLwY8QQKcr1H6R4Hdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055620; c=relaxed/simple;
	bh=lnepe62ela6lbSgwRm4IdlqFIAvgd/kMCe3TfSk6t8I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=S082q8n+LeDJ1cUj6aY73k/BchMpAdCCjoRwNErvgOf07XGl3e4EskkUvXqCUfCZoQrTuARvBw0t/eKkeXSlUsSz5JU4TIxK8Wrlk1rJi4aAFyXWOh9c3dsOInZWWhDCih9/97HONtDzaXiBgnZ16kg3tiuz93tI3I/DVQ31UDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mn+FUfio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mn+FUfio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169E31F000C4;
	Thu, 15 Oct 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055619;
	bh=95O+Q7VON8DtUZzz4XrnUUKql/T2uZsv5qVkQwwpnFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mn+FUfiolc94+f5Pw6cQepJAh80ei+9pVTvI3FDJHYCsIbaYpgYSjXRQ38JNtMe4p
	 LeRkwjHKMOi9/gtAgtNchN6NpPoG/fHimVtMKiTeKEMLlSZ9m1+Qkao1krJk1aPb8N
	 A+K0KMg3HrvPJ6b1WXik/xuAAHnzdwXWDCiSBjMjPDgRDx7MkiDoxmJ9f7nJDUpY5i
	 fM77bPOU/j0L91m8VYsdKb2pWOzoqfKRTVxwmoA0KqKJvUVCdnSfSTufZybnAv7ZgH
	 lnMmylbuwZLdqolaBvsCo/J+TuiHOP27Z/GLs8/7+U9YMetCQz9MVh+FC03Toydp85
	 Vwnb5cxoAsZ0A==
Message-ID: <sashiko-outbox-172549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Hannenheim" <git@fhannenheim.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-kebab_dts-v1-1-1fee1204a18b@fhannenheim.net>
References: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
 <20261015-kebab_dts-v1-1-1fee1204a18b@fhannenheim.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:13:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: qcom: duplicate KEY_VOLUMEDOWN mapping in pon_resin and gpi=
o-keys
- [Low] dts: qcom: status=3D'disabled' has no effect on pinctrl state nodes
--

commit fdf402f94fd160b62e640439999822bae70298f5
Author: Frieder Hannenheim <git@fhannenheim.net>

arm64: dts: qcom: Add sm8250-oneplus-common.dtsi

This commit adds common properties shared by all OnePlus devices using
the Qualcomm sm8250 chipset.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
> index 0000000000000..59f4a3c119c8f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
[ ... ]
> +	gpio_keys: gpio-keys {
> +		compatible =3D "gpio-keys";
> +		label =3D "Volume keys";
> +		autorepeat;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&volume_up_gpio &volume_down_gpio>;
> +
> +		vol-up {
> +			label =3D "Volume Up";
> +			gpios =3D <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			debounce-interval =3D <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		vol-down {
> +			label =3D "Volume Down";
> +			linux,code =3D <KEY_VOLUMEDOWN>;
> +			gpios =3D <&pm8150_gpios 7 GPIO_ACTIVE_LOW>;
> +			debounce-interval =3D <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
[ ... ]
> +&pon_resin {
> +	linux,code =3D <KEY_VOLUMEDOWN>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Will mapping KEY_VOLUMEDOWN here in the pon_resin node in addition to the
gpio-keys node above cause double key presses?

Because the physical volume down button on Qualcomm devices is typically
wired to both the pmic RESIN_N pin and a pmic gpio, mapping both paths
can cause the kernel to register two input devices. This can emit duplicate
input events for a single physical button press, resulting in double volume
steps in userspace.

[ ... ]
> +&qup_i2c7_default {
> +	status =3D "disabled";
> +};
> +
> +&qup_spi7_data_clk {
> +	status =3D "disabled";
> +};

[Severity: Low]
Does setting the status property on pinctrl configuration state nodes like
qup_i2c7_default and qup_spi7_data_clk have any effect?

The pinctrl subsystem generally does not process the status property on
configuration nodes, making these assignments ineffective. If the intention
was to disable the i2c and spi interfaces, should the property be applied
to the device controller nodes themselves (for instance, i2c7) instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-kebab_dts-=
v1-0-1fee1204a18b@fhannenheim.net?part=3D1
