Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776624;
	b=ZDb0WEl8nIGkEoU+Sagts2AtcgGJduGU0vmmnYWdvoV4/sy0SaHURIxDsbNmWPgJdOJ8
	 gtusoSiCeEq0AUdvHRVuXfzHqm5tw1Mzshjs7kxIo3Jyy+lulwTyINxm8l4b3TWVmCTz2
	 47ME2h7ZoIxAuDVXq3PPN+D/o79IxAdKz0sdydlRwvFfOhMmnEv+cjWn0mxWpLpsDryNU
	 /tzqQ/uYIrkcxmb9nhvFXcUS7XGV1PQ4Uo2K2TaQc8bIhcGSP0xi2iIGNuDmXAXi662JD
	 DROszRJDTKSQOqXcjwz9Z6xJBbkIuHLLodJxzRdkxZYZGycWKAhhsCStemxu+EdLumg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
	b=E5a/7q+rCVUyh6WJZPwfjzeMMeWujFuw7yEWOeAaeP0MXwBrOeVOiXaP3sZys3IF81tI
	 2Afpse5N3a3YGx+gdu7QfxHlfJq+8MMD/ZXNWTrMBK81sMN4fYsQ1XdGshbPRIvG9f6Zx
	 aI0LF4a8rmjbH/5V5Ad2jMMjZDX7dKktTXNXPBn+yPKQPsvcwpNIi5Nd5olkFXRYtc6lR
	 6fOSjUgVPov5l28JpXA4bQqJZYyuouNmmt2XFslFDwWLYgkV5PdZy9jfhm14hpRCZaBkG
	 eSGC8e89fPwy94rWIQXcSYZppxYzuzo3ofPoGAzFpP9ILWiqfijhcd7YCEp3VYS45Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngk2DVgv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C9606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D28C9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngk2DVgv
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db763cec7so267821d50.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776623; cv=none;
        d=google.com; s=arc-20260327;
        b=AHPyC3lflTbOjSNIeVx2qxAgalj/2SRlkOj1T8qMRHTEeQiYzKS2kUKs9HK6Ki/O6U
         Xl1vRxYNekYnimAllbb/zpoH1IENuURsjo0b6Xk35aAsD55TOlC45RTEmHihoT6KiDr1
         vMHfxNsLh4PH0WBWtzjrMWCh09U9K6xEp8sUYzsZz73FD1i7LM4KohjwdnmVwIH299XN
         LrRlL2Gpo8WMog30kiMHDfsJJgQ0tkjp44R4krnc/PkEq2SEp1yitiQhTKVr8glWWFvW
         /tUHEym8Dz2EOi14KNsmvKz86DiSd0JyMfmUnRqwCAYc8Frq0D5sVjvUwRICVkXboGYd
         Whug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        fh=XGW77AQkNXgCasqzmlBuV3xp4qj5gC2ii/DusI+xUoE=;
        b=V7KGhsFdNfvnCXMWJ4nslDY4BYHliOnsdlyGEdC9t3jqHvXaD2f1+PnJYpRJanBUJB
         ZXZ/ewf9quSJ2UCVy/EpONClBFCOSut0UiJIvLOvjfdexFm2ZIrYzZ+RuWGZ54g2y9SU
         J2ju5XgOUgy6IGazftqA6B3zJCC2n0PZ5ziot53mmiujW15GkxFTNFm5MwA1LhNL6uX6
         gisCmOYV/FBoIOLNPXy7ZorU55w3fHcMKkS8GdBKmOOexIoBDLqWZR2bZLacJviFlXQY
         HEw0NKlJLj9Gh2fSvsEaqNdTW5O+66P2X91Kvo22GVV1xlifgLXcd/0tQV2T0kMG98l3
         wnBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776623; x=1795381423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=Ngk2DVgv3r28OnfOZXzmGqPF9KIldZV4siYG2jnY/eLZA0Q+HpDh3boP93A6PrRNM5
         YXgDavVLkjCRWFSMTn67aArDtygf4xnZWCxAyChn3AGBrUOTNT1Ekq5Qvz8RI8ahGili
         uQcvSDz7PYWGlY4pHvXQhl5hhSzGPpisrAjiSyYbXIEt7QMlt1KVAuPbhmZN6ke/I1Uk
         yzh7X6lzGwWLI0eIB7KgpFK4h4Y3JOt7MQrUiNMwQOQmLnApkCi0OA6cMgPx8rawEyZJ
         iMCbrdjBwyERqd26SjQ8ml6K+OcBQJjIQUN7Gw+1j8fcHoCb1o4wTmqDv+t/gkdi/Afj
         T4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776623; x=1795381423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=zCfW7busFNW96znNeXlUPy5FjNTjH6LTCc9Ra5yjIMI2ed/kZw8l1MHjThKjK5U3i3
         ffiBsg/utxGcHGpROhWNOfyNi2vi9uFQTX1JErwXsWCUqx7+ZosPnz0Aw3ejOGoXOx+B
         sW+//y+y95tAyCp0oSQOlDpFplTAS/ujNnCcgv825wDFA3EJVigDK6w/1wQYaac2N/hx
         Sygo9hqzKU80B4MHDGOsq2XL1DAroKl+Ko+w66KeA6EHLI48GIP8SLB36jycKTdbL/nl
         Rt5dk5gLMIOar1EF7tqbkkgNV1Q6sd4LqqDvRR50vO1nm293mU/DZcLulSlNcWH1PZih
         Gjzg==
X-Forwarded-Encrypted: i=1; AL+hErFn/ntmuXYOdc91d/ZzvotlqVo0j4ZIpjUYwvLHOq/fHmyhk6ei1tLVu+mWt39ZFaYQ4wpkW6bmfMAD@vger.kernel.org
X-Gm-Message-State: APuU4Z8DuoqQO3lowDKsXosdz6h5RZX5NX213WGE+6cem98MiEwmoLpp
	NbDDDACoY8plSnQjexignn4mGzpvAxgHCeL63ALS/JXLx6ncZbV5Ud7blJI1z+kV6cs4WVHiUD3
	SGFO4k2vnfPv5Li9yejxMg5SLSO5cQ8Q=
X-Gm-Gg: AYBFou0ASSgiO898M9OUkh/RrXjo2OPCwYcoageH8/krg/8XQFSKhgR74DTwduEIzqq
	XUm70WQF/l8FhFVykGkrBgNGNLPGGVwoX0fuGe/ID45McDthrN7pSgELBaCgAm2RHdjIWyfTZaX
	3JtQeiIaSFbLsRU0U4qRf2/Gb32/0iQIJMc8fc4FFIDeB+lcGZ7I0gMi02FaRlbeZUq5UH6Qley
	9MOnJYvp8wXMoHSZ5Pc93bGp4Svh2rCpBpha3kP00C9ND/6pxj03QRsU9JXNB7iqSvxq9jxc+Bv
	0ylJuYFBijNsod5PBB5Cgruou9YbNXoTXymnyAM8yG3JMlfIQYviAP3VXYEz6/4hqV/naJcPc3P
	BbVejvOq4f2+SQD4w83EFHZ0ZHV4hEOWa726eFrjwhAYn1B+NvcNfUO6/GZfR0mnB+tH/2ow=
X-Received: by 2002:a05:690e:134b:b0:67d:a747:37cb with SMTP id
 956f58d0204a3-67da7473984mr1788570d50.80.1794776622877; Sun, 15 Nov 2026
 13:03:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:03:32 +0100
X-Gm-Features: AclHuK8RZRddO7WOnvwxzgFddHhyLeT9NtqQThzXqpKNCFZiOf6pqJWI8MgY6vE
Message-ID: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.
>
> The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audi=
n"
> uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
> added so that differences can be handled later if any are found.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++=
++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.y=
aml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> new file mode 100644
> index 000000000000..4df4796623ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GXBB AUDIN audio input controller
> +
> +maintainers:
> +  - Valerio Setti <vsetti@baylibre.com>
> +
> +description:
> +  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It suppor=
ts
> +  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs t=
hat
> +  transfer captured samples to memory. The sound-dai cell selects the FI=
FO.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,gxbb-audin
> +      - items:
> +          - const: amlogic,gxl-audin
> +          - const: amlogic,gxbb-audin
From what I can tell it's even amlogic,meson8-audin compatible.
Although I didn't have the time to test in on hardware yet.

[...]
> +    audio-controller@a000 {
> +      compatible =3D "amlogic,gxbb-audin";
> +      reg =3D <0xa000 0x148>;
I believe the audin registers are 0x300 wide.
Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
that the register area is 0x100 wide.
The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
=3D 0xb8. The datasheet [0] (page 395) lists register numbers divided by
4, so to get the actual address in the memory map we need to multiply
it by 4, which gives 0x2e0.
The 32-bit SoC vendor kernel [2] has a header that states: #define
AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
by 4).

I'm bringing this up because dt-bindings are supposed to be complete.
So even if the driver doesn't use a resource yet we're supposed to
still describe it.
I don't see any additional resources that we'd need to describe and
#sound-dai-cells allows adding the additional SPDIF input later.
From what I saw in the registers there's also the possibility to send
the input signal to AUDIN but I couldn't find any additional resources
we'd need to describe in the dt-bindings for this.



[0] https://dl.khadas.com/products/vim1/datasheet/s905x-datasheet-v0.3.pdf
[1] https://dl.khadas.com/products/vim2/datasheet/s912-datasheet.pdf
[2] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/register.h#L2274
