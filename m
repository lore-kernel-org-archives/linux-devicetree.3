Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018473;
	b=eALdevcBFJ6UZTiI87dhvmcuQ4SSW0xTN/UyzsfeMx9vhl2QRgQv4UJ+xWPdPi3zBrFd
	 SfLhosmTvCdIscjSpHf54sOrQ1cBmyfF+BZGEhn/QIKWq1mwyW4VqCIX6U9JWJVn8iP6k
	 hcdi5oTm+Rut7m4ir54uWpZXakSM9N+fwirnkeB3TOyPoBKx/4TYvfRk/Ce/zJodEao7w
	 KSLz8Ji7ilK3IMwnXxO2BzaX3eQA0bmfHo7NE4iyVGS7LaeKDs/GK5OsTXracSJP3rOER
	 2s4xQ0AjU3/QloRDBu0LXHj4q7GqWfZJXu6ZJMii+h/Z50813dDnfATSAGvAM4Dg/4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
	b=o4umSuIIcSap6Su1bY9JedtdjUxlUAwXzQ1nhXLPWz34I8wwAIsA+qGIz868jBfZaCz0
	 n2G7r5cc4oPq2OW2FcrXElL/8WoY2cbnDmPixkosyoKbUs8D421KRd+4MIX+0THSZUt+k
	 bXDr5lSFwChhjchMQNmZ5iniwSnJlgN1PE0XaJ6kgUIjhnf8jPzx6SYzyhWuvwzTo4dDp
	 7gd6ocwHKsqR9jSLM+62j+4nYBNN+qTPVNDZWuWJ1ImoiH4uBAqvm56abZrkF/jIx5ihS
	 nbAC1DxfTgmuDkD9qr9ZSD4FX9xhLEyKHvurarTdzTrYAas56luQoazQZaAdItcGwLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E036606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E036606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so563894a12.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795018471; x=1795623271; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=N8cHuzSGx59kCzVaVvnnVDk+m0o/5FzrJte3k8qYPYBAfARJ7jS1mCpj1MFBk/8ZW9
         X+OfTRhuYHACV1grTRV7ntmN2SlvUZzZLFp5CtIoyP9ooDJ5c08mcoBgez6alR64ZtL/
         9XL20VL0fme5aCnLjXWVBXb4+AyWV1RYbTssZAZXTtlL5OdCBWcb3NChgu7RSw0TRJJd
         pS+Wz11rnhsmi4o3ezQuy/xAtokMN7lW+v1CRT0nFs+ZsUlkJWacXB46MHijaOdI4Mi9
         mrskFTmQmTk9qbVPdP1K0DZsXpX+Mi3+phzqlcnyfTe5JHGMeNY53i2/JiYH36bJsvNk
         e2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018471; x=1795623271;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=jibky2oksNynReZHydUWkm85gPuYxqAZT8kW5TY9iJaXaJrQo/rZVHGdzvoMH3J72p
         ysHYMFQLLgGnOJhChiwZomGp0UbI6ah8B21yGf4JOagcfXJIUrbuB1pRDlFXM927Anpq
         V7hvjhR433MdWRJvytQnTNmzig6JQu8ap5oqdmCyhHCFA3zpGN3kBWgqUT+anNdUUGPJ
         27EJF8/mPoN/xJSUd7b3POI3QXkuhnTlOeCbDOBCIB/uhQP4n+yzB64RGBmHNfhkVeda
         nrz/GJ5tCAtbUFdxfMabyIkWQuCaFlHAfPpNvGZGMUeOYRfr++OeZnHdkLcrCSdsvAQU
         6iZw==
X-Forwarded-Encrypted: i=1; AL+hErExREAdA2V6dj1RFae4edR3/p+zkZa5Nml2EZ1AbwA82si4SW4b58cgYB5j2AsMixfptwK9P7FJv8Xi@vger.kernel.org
X-Gm-Message-State: APuU4Z+2nrS0AYm1K7/eAEfwtfL2Mpl9sgHFSDMKMPLT5rTv+SvQ6Mgi
	CuEZzP8qlZlcmfCZyWbIftLtFQgeam90h6eLamL/4T9QvWMPDP1WtBvQkRz0DVSltas=
X-Gm-Gg: AYBFou3+TAeGTR51RKBEHU702yGsdcGptaveCaOs1GEfHbdtm8S8OjX3IOlnm5KIB/a
	evmtvnursHgLm6s7XDXW4FS8FdHwClRR3jX23ROSpV9jAZSCd/6J/voBWtjz91RhXc4+m3LSQs+
	bJEmkiNSuVccQ16f8AgQNstf4k/LtMzkqFz4KaQv3FjlTDz1QEwYRXX6Ay++ZlQv15tq0nbevj2
	WLo+ixUXsC3ePfgM94BDA4QZbMwoEhwjFzbIt9ZOOEnUj05zI3fTai64ByQ/DSvhgBQhq5O3jpZ
	iEE31uKUHFOQ7wLj2WnWEzYSmG3BEhm9e2m+s/s38Itn0322tDrXx0YWkjqXolVYdWG8zE3cW7K
	Hea2IXWDnAGlb2gf8xYKtVht4iSUawcBKplqryTNmM4GlRn8ABdMunvV4dCPQQMasLFX+CmFRb1
	YHVoeF0NBAbTVInwE34qY5UKsINiVgQ+gpX7Oa6wrikLeTBMrdddlSMl3ZH8A9tvfTT7EqicYUf
	AWEted11sCMeRwLJy+0EWb9uqz/udMjnCQ3kqeVKiAWkEP/k2UO8ufiDA/XjQF05PNHpmD//u79
	93WbJ8HJDh+b6B3J4bHsnPPUAwi5Zn9++bau6K8cPyBrLktXRV6i7put1O/Pc9hVe7i7mvGoHg=
	=
X-Received: by 2002:a05:6402:5409:b0:6b6:7231:7ebc with SMTP id 4fb4d7f45d1cf-6b887e50d5emr2734312a12.14.1795018470789;
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b888ef94b0sm1356826a12.5.2026.11.18.08.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
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
Date: Wed, 18 Nov 2026 17:14:30 +0100
Message-Id: <DMYGXX4GAHRV.2I4NFHBVVJG0V@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wcn36xx@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <arapaille@atlr-engineering.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Luca Weiss"
 <luca@lucaweiss.eu>, "Eugene Krasnikov" <k.eugene.e@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>

On Wed Nov 18, 2026 at 3:57 PM CET, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.

Looks sane, I've had plenty issues like this before with other SoCs.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>  					wifi {
>  						compatible =3D "qcom,wcnss-wlan";
> =20
> -						interrupts =3D <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
> -							     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
> +						interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  						interrupt-names =3D "tx", "rx";
> =20
>  						qcom,smem-states =3D <&apps_smsm 10>, <&apps_smsm 9>;


