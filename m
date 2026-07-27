Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53513F6600
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150236; cv=none; b=jLeb/0vahZ0TwPJvtPnyUvWrq19RY6/2fSmwHY7cepeDJxrN3kULgou60plY0rxTxBgaUI01c72YAyn9RgGo5F8HjhwUD52PMWIm4OCm99A8fWx4orEmto9LteQRaXlnhYgGR7HLZTWBbLziL252vzhi3C8EaROFv9If0toVZ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150236; c=relaxed/simple;
	bh=A40gJm3ekO82idnf30xDmSrw698dEBPTF6CCNVxUp2Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pcl9ukhI5P4c9bJwfTLRycONi0Fdy5lDUodV8gGwPbVcafe4i/F6qiDPopT3bUO5nh6j+L4sWmgLGirHJC263Kv1JBTk9QP4og8n9KuyDTVIaRgv1wIZR8GtD76xff0+skpVHrqbK3Pk2c2/MsnYLUnLLBpdQo+CZRMwfnPhSD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tca2zV6j; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tca2zV6j"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1c4db7ca93so340565266b.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150233; x=1785755033; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ia0G9LEkGdE7OHYonYczpOBgN2i+djSgDVIwUI3fTYI=;
        b=tca2zV6jyFryLgAnWaSDAg/d8rXdQ5Lag+z7wyLd5eksf8N4t1CLO2aca2d3KzKeAi
         NrekyJoKcOq/FlQNBqTmeesCZX1hFvGCuuzLLnT/+LjZm1lK6ufnvJCvLkY8wvMJcb6Z
         LZQNvg/vbg16aXSUHf98vOcOd8zg42wVb7yXKmZRP3sh6qKe7q2tN0zseAym4N4GrZom
         PgCToJ+9VK9dRStoNn3w82td/i2dKYGIqIa+IBOCn8ATHs8SJQ0Bx+S7L3sjkB0paG2e
         RMyui6Uo6vEupyH6SYzX8R+aS36bEFJaG8IK6xyUeypIe+GNTuC7nbFN237iaVWB3oxK
         lR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150233; x=1785755033;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia0G9LEkGdE7OHYonYczpOBgN2i+djSgDVIwUI3fTYI=;
        b=X9VFxxA27v2W7GkKZdRm/7r+X77k5qVV8XJ6jnyRad21PHCBm1XQUpQQ5+93mTsivv
         AAaufn11vAuX9Fsq5cKRrRG9a/qnUZx2uOpfzv6tjrHr484jaMkvjfYrK4orF1eOjgVE
         5c6bxYRbVhWma1c7LK9DlMozV0KT09swetZ5w/D4D5p3NR4VVWstExKez9vzHaUHcl2p
         0iGmAFfmSJjoa2OQsXfwHuaZGGvq7Vc1ofjro/JOzU2RER6acy3MS8NJUJVal/TcamCg
         uZLzopZYVKvwcGWtaeQ/tSuOV3ompgyiAtSSTxM2/2rB1rwb9nTGSj12pVIfP6wSnPMn
         lYUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpETh4jWc/AbBAo8k9RKhJoGuL5IcIiXZNOTbc4wSH5/fVzACZ+7ZCAaiOkgYlGDFRxSLTNhgqwkzYU@vger.kernel.org
X-Gm-Message-State: AOJu0YxiU/vK8vowoOjRlMeBl/ODQulgQaSY4f0H7v5327iDCsu9CFNa
	2CaknyjJE2er9hbhhc0zIML5j7QPRPTMT2b/i0y0Iluw+0IwV5lr4JUJZ01s2PrAiS0=
X-Gm-Gg: AR+sD13jASRV+TD4L2F03JGopigfElUx3JkqxrbxdCe7DazKG3cAjCVfo7Q4fsuQOqq
	7KPoargnEdYlPJZ80Ijq+MoeAf+V7abpbqmYfXjQI+UincRFf1Si7rv97bTQSbJx4uF1X68GsgQ
	waP4v+LaFhdsq/4mOlwo2CsPV70/Z8GjK68xd8dXwzAWxoKSbQHQ8lVZxElBPV+w2HG2I0qxZ9V
	EsnulJK8oSuPdqXPe7T5MOplPbBbG/b7Y44SSopnlTtc10wVzIKRpd42DyVi+9LazGvi+JZylN0
	HQTahk5jW0OegIZwYypBGbvqQfJY5i3cEQK/eCS07L3H/OIYd2+W+bphn9MjeGEiF5AnoO34g6X
	2hmQ+8iqBZh6xKLo75zevWSYiMUDeI4OupMAa33C/2iHjmRDQu0jc+B7dHY6QnUVnlFYuXsd9cS
	EPHlx87/gtcVg17+Vy
X-Received: by 2002:a17:907:9994:b0:c1c:22d4:3a9b with SMTP id a640c23a62f3a-c1f1f153e8emr313513666b.43.1785150233167;
        Mon, 27 Jul 2026 04:03:53 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c4bsm635352466b.18.2026.07.27.04.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:03:52 -0700 (PDT)
Message-ID: <81160ceaf02ad31c4b86c00dd4bcdcf1fe624788.camel@linaro.org>
Subject: Re: [PATCH 1/8] arm64: dts: exynos: Move 'status' to the end to
 match coding style
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:04:11 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-1-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-1-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index fa2029e280a5..17b13a586973 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -755,6 +755,7 @@ tmu_atlas0: tmu@10060000 {
> =C2=A0				<&cmu_peris CLK_SCLK_TMU0>;
> =C2=A0			clock-names =3D "tmu_apbif", "tmu_sclk";
> =C2=A0			#thermal-sensor-cells =3D <0>;
> +
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0
> @@ -766,7 +767,9 @@ tmu_atlas1: tmu@10068000 {
> =C2=A0				<&cmu_peris CLK_SCLK_TMU0>;
> =C2=A0			clock-names =3D "tmu_apbif", "tmu_sclk";
> =C2=A0			#thermal-sensor-cells =3D <0>;
> +
> =C2=A0			status =3D "disabled";
> +
> =C2=A0		};

This adds an extra empty line.


Cheers,
A.
