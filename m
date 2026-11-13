Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574802;
	b=P+Ud4c53CeYGxrtSzPQZ4Kk/X+gxDILTZ/LPW8Hz0ic6OuLbFwkUiAHOQsWJdc0SlbrS
	 9OC/D/VyK9+orMZ/Ttx62Wk+JjPhggkZHwiZyTDyn6mn4YQU9S1bF63c2PAA3QXNYp9BD
	 AMpIBBbVVPgKLEcJI3Gc07rglw+AivgFjvISyLKiEeLvxZdIw7EJCl08OiwCJQBRZX4qo
	 8sQoZDVMxodk8oQmvPLx4unVJWdhvQmSm6aZhWybbU7KIEWOr8jt82Rq1eQeFYV3ld+TJ
	 jJImSf35BwzFnTzpYgfnFbibIheRblBPWzGkduj4zta7gHMCyMrxNLM623T0HjPB2HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
	b=2UFWtrBbMutYy6ZrnVINhvxCg9Jr0wrNr/1mUDhSXKkAAzfcXn3qd+kNW9SwP5s9vqWU
	 dGTAHw5Pa72n1K0dNHyvZHDxp1HLarvRxBSEGDBlCcOVYH5gkCdiG50BZVyGwZjNYwR4C
	 H79AO8wG0MrN7swY+Si9fTR+wFxfv0qmOC4eoy69Nb6BWVZypGDlQmg65dOwdBE/KavW/
	 fX9c/aFcmU4WO7mccM/1uW8M9IHurhata3nPl1bz2M3QZEgCJtE3b08AB6wcBJboy/Nsb
	 vKGLToKWu0r5wdZtZQ0ug6KhPQ+kF9HGlQOl1vbq6wU6vjO6SWNvWIcofwqsNJN76Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACEA606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACEA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c445c95d553so173406266b.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794574800; x=1795179600; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=UvD9jOHk4SiGf8rkczNn6Eu5dUIyL68LeD8TP0a/E8TFSluP09i1lj2STN+pBd1GXn
         r0uw9Gl8kUyeEgYwk17G4cuf38u7C24RUDfNbWEB3MzjNyM/6nbDz9Hgmi2xs/rV9rrG
         nob/zKmUNGCENceo5OPAplZ/3ct4N147esrwLqNg6j9sc4tDO2bDrXTeu0NHcpwmGHr4
         RyPPSLA5iduIrS4kXN6Szy/UMAP8J6zqbvLrKjW3T6gG40ajhCHcQtfkhLBriUwm2UPA
         pTzPn4HtoaIgXkKNwiZf2qCLzhOe42cXmBhbgp56MJgl7crXxsm4WaNRgdtQ65JxISFV
         A+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574800; x=1795179600;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=ghlEd3ZDBU/HcLEbmxCmz99Ya9AvVjS04OwiL3pqCUqdWNSF+xrXj+dirGHwNgnCt8
         VwWZZchr4m3xvTPnyfJ6aP7E0xI/5tbUPHff4MmhKWjl8e91k3SlziNBYY5Yl7uaFkOT
         Fvn0FLyAiLfrtiOc28IVvCK4u8nM6/Our381W1WhKmZ/iNyiAu06euJYKarsuwquhkXG
         iYWKdDD0XpLAUQFVpOk8D86oU4sQ8OT2TU82oEtTKCzBHbGU6YPHwG4lND557WoEuM2v
         1wRHRX6rmjYwn9Wuuk9lbygbKczJOtPKEZXX1MxhA2j/a1a2n1m+Xm05mmPWW4Xn+BNq
         yY9Q==
X-Forwarded-Encrypted: i=1; AL+hErEvpzsryNQQwY2BcgI739hmAAFgGpmsxREH0VBsd0UFDlogPXMCLDcG/b9sgPKsDW+0+zOFSFMfvdGm@vger.kernel.org
X-Gm-Message-State: APuU4Z8GzXrq2K6YGX691ZnJKlSr3mvLAEaFhM+hExH3S9LC6sQGMFZJ
	AyL66mBRyaLYaqwVEyc7RPZPVpzLN0mrPab1n/G7PL0EAYw+UEJzp+sy66VVSAXoBkGlmU6WhCa
	XFBAE4ZA=
X-Gm-Gg: AYBFou1ssxGa2Znj4d38qDaYhB4QLQBM+qXvzYdPkIwOYUdt4VJjWxQcjo4w/M121BR
	VBATKauFM4KuLR073TCcQ81tnwY7IO5sZx/nVbyrOEAL21VqrDYbF9LwxeeklJMhz9AR0cqILq3
	kgBlz0OmDZZR+G/Ux8msJK9rZUiir1g41iJo+u3wj++nYsjedeFbxAh+/zzarpnOHaNr3jECYqo
	dK9ytYYZiQohgI70d6c/CNlI01LZG7zMbQQoJPPB2VZBzSA8gKrwbGTaS0lICCRrffkTjKTwNhH
	GhmHXtaACGhPtUk818HdUThQsVvfMrBhroXQEap7CbwCqw07A3degDSm/flIr55Pl+56HUMVg0a
	Oxx9W+ymFj/RSLWjuHxwcCKRBusl2N4GbR3eHAK/UaLwvKysEa6y0euqAOAfFaIExLluCE7lJ53
	8Gys2DSk6srI8gN9YTjajjl9kH6x41O3SEr8D4HFT/hO4Nef913qBnRFNiO8wltVTowajXBvjpG
	pX+B70fiT+dx7egBRcKGF/gA381wXJGxwBqoU31kcIht2hhfLGjV/fXUrvPOOEJ1xKjCxgjSuf3
	x4wDn30uvVKR1+8vIPB39xvywfZgIGE49/sNMlvtX7SH0dtK6mFkhhBoiGsLpEeVveVsB2O8mw=
	=
X-Received: by 2002:a17:907:9624:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c509614d513mr218483366b.6.1794574800110;
        Fri, 13 Nov 2026 05:00:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b6f6eesm88283366b.63.2026.11.13.04.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:59:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 13:59:58 +0100
Message-Id: <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Val Packett"
 <val@packett.cool>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>

On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
> Since Linux has gained LCDB support now, wire up the LCDB regulators so
> we can turn them off and on as desired.

Actually after some more testing with extra patches, it seems that on
FP4 the touchscreen stays dead after toggling the lcdb regulator, while
on FP3 it works perfectly fine.

So please ignore this specific patch for now, I will figure out what the
problem is and re-submit. All the other patches in the series are still
good to go in!

Regards
Luca

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---=
------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 37aa272019cc..d592bede6a61 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -72,14 +72,6 @@ key-volume-up {
>  		};
>  	};
> =20
> -	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
> -	lcdb_dummy: regulator-lcdb-dummy {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "lcdb_dummy";
> -		regulator-min-microvolt =3D <5500000>;
> -		regulator-max-microvolt =3D <5500000>;
> -	};
> -
>  	reserved-memory {
>  		/*
>  		 * The rmtfs memory region in downstream is 'dynamically allocated'
> @@ -784,8 +776,8 @@ panel@0 {
>  		reset-gpios =3D <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
> =20
>  		vdd1-supply =3D <&vreg_l1e>;
> -		vsn-supply =3D <&lcdb_dummy>;
> -		vsp-supply =3D <&lcdb_dummy>;
> +		vsn-supply =3D <&pm6150l_lcdb_ncp>;
> +		vsp-supply =3D <&pm6150l_lcdb_ldo>;
> =20
>  		port {
>  			panel_in: endpoint {
> @@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
>  	};
>  };
> =20
> +&pm6150l_lcdb {
> +	status =3D "okay";
> +};
> +
> +&pm6150l_lcdb_ldo {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
> +&pm6150l_lcdb_ncp {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
>  &pm6150l_wled {
>  	qcom,switching-freq =3D <800>;
>  	qcom,current-limit-microamp =3D <20000>;


