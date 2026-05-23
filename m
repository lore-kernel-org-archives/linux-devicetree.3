Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9E830E84B
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532624; cv=none; b=gfN6HS9SH37PT3s/BE4JZRoClgqZizBlmmln2XPOxNUYDI6oSDccbj+7wrfEoD3NYvDN2ZpRFzZdIL8H9olg+l3Ldw+KQVMj0pHMxhtWtqc3iJmoxfyPM+ML6mK23qOGqrkHqo4RJ8dD/wHmrUMdlZIakPcU4TMm5tGa9ythb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532624; c=relaxed/simple;
	bh=6o+rg5jp2+audactB5iSTqcDwKLnHcvMgPA6mGJcWcA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cOJa2gSdT4dx7tCyZEiR7/ZaLdH7dsfmvf5L/dhYSHNmEgZBEfnN5itTUgD3d0xUVKdzxBofKlAAEELn2euK7JxAP40Des6g87++ZSk6hf3k6l1DKfA4I/Ioa/ufGDVByNb/6q+PHSvhazIFuUT7g81IoHzkIJdWT306SJavNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dokzOuCF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dokzOuCF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A49F1F000E9;
	Sat, 23 May 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779532623;
	bh=rTzpUiNfqGsCwBw2uCkWeWNUYBdxzwHYifKLnMSBfWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dokzOuCF/bhfnwu4bhx7A7WCnBUYOEN+sXSyA+AHdW7vtJNj0mtoyczuYb/gI3UAA
	 unIYlDcqWY5nhxz+L5Gc8asmA0CfmFeEf0SD+NxjfkVtnTfYVCnh7NRPgTmj1/1K6k
	 YEBwTFLth7rEeV4bpdNHUoXhNNwsOYjhCKy/iatnD15MjH7Qh3q78H66fgzQzPB4+N
	 5xbsmbACcwIPuBUqeNvjiP+VC12OIbquK9//NMS6zyf+/JKW6ixYtpCgJL7wxZQ9OZ
	 fsnjxBumCa8+QXniwm5g5Vpeungs3qpBzm8pWQBz2QCDPU2H7cU2mgMcnpFkHbUU/8
	 DxuUhrN5Bm+nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: add LED and key support on
 Xiaomi AX3000T
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksander Jan Bajkowski" <olek2@wp.pl>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260523101904.293215-1-olek2@wp.pl>
References: <20260523101904.293215-1-olek2@wp.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 10:37:02 +0000
Message-Id: <20260523103703.5A49F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `key-mesh` node incorrectly pairs `linux,code =3D <BTN_9>` w=
ith `linux,input-type =3D <EV_SW>`. Since `BTN_9` (265) exceeds `SW_MAX`, t=
he input subsystem rejects the capability, causing a kernel error splat on =
boot and rendering the button completely non-functional.
--

commit b3e6ab558b15225bf59d262cc68b446d232036a9
Author: Aleksander Jan Bajkowski <olek2@wp.pl>

arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T

This commit adds device tree support for the physical buttons and
status LEDs present on the Xiaomi AX3000T router.

> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/ar=
ch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
> index a314c3e05e500..db399cb3ead73 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts

[ ... ]

> @@ -12,4 +15,37 @@ memory@40000000 {
>  		reg =3D <0 0x40000000 0 0x10000000>;
>  		device_type =3D "memory";
>  	};
> +
> +	keys {
> +		compatible =3D "gpio-keys";
> +
> +		key-mesh {
> +			label =3D "MESH";
> +			gpios =3D <&pio 0 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <BTN_9>;
> +			linux,input-type =3D <EV_SW>;

[Severity: Medium]
Will this combination of EV_SW and BTN_9 cause a capability rejection
during boot?

During the gpio-keys driver probe, input_set_capability() is called to
register the button capability. This function strictly bounds-checks the
event code against the maximum for the given type.

For EV_SW, input_max_code is SW_MAX (17). Since BTN_9 (265) exceeds SW_MAX,
the check fails, causing the kernel to print an error splat and return
early without registering the switch capability.

Does this leave the mesh button completely non-functional when pressed?

> +		};
> +
> +		key-reset {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523101904.2932=
15-1-olek2@wp.pl?part=3D1
