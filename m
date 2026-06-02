Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151422848AA
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 19:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429774; cv=none; b=VB4+ZRIopDBbvIrAvHKAQ9ZrN6W+NgTI+95jvWAtlQzY3GN5H4vz3nUOLrDoXsAP3ovYxz6iFyoCj378HN2NY9TXROGaD6VUBDdkeTarVQEtiYgtqYVH1nIE3Z9KnBv8Bq48cgbDdSLVT06w8g1tuTbxACfxN/ChfZp20H6mz9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429774; c=relaxed/simple;
	bh=oBaTI4c79O6vpTgtjlM41+/n4xq+WnG2e+IzVNiDbJU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Pxs/PDZLAsElB+tAz7J1Q/Ew1UumM7coYUkaWBwbEU2mv+Rrwiiq/TRC3oj2W41xLPaLa19qmNlXC6nJ5ew1wj9/5rVbIZK9jc+ha8DVfBbmQhPNnfnqEDKxVDRJymXh+xDIDm8kSyURS4PJkNlkvDY+zipPY9l6vMqsx0XaVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIZL/+P2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIZL/+P2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b613a17bso549145e9.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780429771; x=1781034571; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uspwVvtiltCsqTff8wL3whaP7rrxXxnCkwg5ui4E/K8=;
        b=UIZL/+P2j+ObC1TFknmKvWW+pvVGOvQ65357KvL2WrRK7JuPiejBSgMapE/rDxmsf9
         vQILcjVvuz9mcx6E1ICApAYYjMFzlGOOWQbqcmi76iNBm42WCJHP90Gker3mFVCZO2Nn
         V659XeY3viIK9N55O9XUVVUFkj4O5rNzkGG9cI26Uf9LsxZtNJJf+uMWQNJw8YEsRTXw
         HywqDmVGAihaT2UNIbCuZlxrwfuw7wyA0Zb1HNSORb0bzPaP7Y9uOLd1KIf0xhlpe2GR
         1b+vT2YJZXOtMmWE3fLkOIX0ZmJUW6NV+7Cz9ANpq3NDWCSDl034azL3vulPAmexINHS
         5jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429771; x=1781034571;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uspwVvtiltCsqTff8wL3whaP7rrxXxnCkwg5ui4E/K8=;
        b=GNhotYKsnBqdtVqziqpSlJ49NCODLBn1D1310MPIlkyosK78nLRrake+/CVIWjFQqp
         CooGDNvOBq9GUfsLsGlDIdzh6FzwuIzHxyHXK498XI5jwPQj9jsLLS2mc9rBy0q1/X15
         Vy4egzhaVASbSE47VdG4GoIF92H1snMDgB2Yw2JgIIOJdxvOIQ3Pjb1XEVRJy65aEPD1
         vP8s83dpHyyppkVVFe05okWQ3PwgWWR8U20Mb5yh/yax1p0i8/QLehUE6LEYDbPWQ6wg
         WNto99dmvumWNYcNFbj9B2ChYeuYYwqyuTyv9X5QnJ6svEPmAAyauD74V0lnRuN9YJPG
         drhw==
X-Forwarded-Encrypted: i=1; AFNElJ9r7vrWRYjtr33MRrstkM4R5xWB05EAYpPCup6b3sl/WlvAZVhG5Iv6IG52h+DVP2ElgXSwsPOuhXSU@vger.kernel.org
X-Gm-Message-State: AOJu0YwNXJxtfvGssX4P6Tf8mwKcUtBTBLOAIfy0bNVxvaMusUVxBz43
	wfR/2u+MwGu+3+WRYrWeJEv97JV48FsigTYy38aALTd4lA0fAkjNZXW72Qva3warusQ=
X-Gm-Gg: Acq92OGQVm+PR57VnsCM1HzqBGwif5/t7ld/Jj8Eu6bZiF/ZcEVaxUOmBwtgWMQJtgv
	6BJu9PYCtIcIovcbCXfxQU7MI/XDVz9KS1Pw8Oq7eVN8nxNZULAddqBmQIA5G9xzDAil3FklpQB
	wTK30tHOPQzXgrh8969V+6rxR2oE5aI3hkX80Nl2umByQqom74wovzXeQRXmen2+9okLxmksNuy
	WaPQr9e6+ACVVGNINut1TTE9L7GB4F47RxOpCsuZThv1IdfMz161GRMzESOiEQdf149sbW33K7h
	zwuvDtDOESWjRVMTEoM+JjwJ+FmdB2KnJ5gKqpH0lKviFU+//MFPfV2yYwlC4+r0C22gCywr4dy
	JoW5EkMzMzG0S4bjskknVCOJK2QttLZUVmrBVp3ITB1XEQTxQNHMYLLfXutE87eWyhu8J3GQZmc
	lQCEqNwWdBDDYgvFpPslA3buGgTI95/aeDHkfLTRQA4WspCjyhX+L1Eq1YUGngnuBE91Vh5mZgE
	p8yhmN9qEelA+XV1MmL1yzpLs6l06T+Es4=
X-Received: by 2002:a05:600c:8b61:b0:490:b1b4:d437 with SMTP id 5b1f17b1804b1-490b5d3e1d5mr4934545e9.0.1780429771536;
        Tue, 02 Jun 2026 12:49:31 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b60f6d5asm3064455e9.0.2026.06.02.12.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 12:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 20:49:29 +0100
Message-Id: <DIYTOGU8I2DV.1GKZ59F7AJWTE@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
 <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
In-Reply-To: <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>

On Tue Jun 2, 2026 at 6:00 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> Google GS101 (and Exynos850, autov920, etc.).
>
> The TMU on utilizes a hybrid management model shared between the
> Application Processor (AP) and the ACPM firmware. The driver maintains
> direct memory-mapped access to the TMU interrupt pending registers to
> identify thermal events, while delegating functional tasks - such as
> sensor initialization, threshold configuration, and temperature
> acquisition - to the ACPM firmware via the ACPM IPC protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/thermal/samsung/Kconfig    |  19 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 618 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 639 insertions(+)
>
> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kc=
onfig
> index f4eff5a41a84..383ae3f56cbb 100644
> --- a/drivers/thermal/samsung/Kconfig
> +++ b/drivers/thermal/samsung/Kconfig
> @@ -9,3 +9,22 @@ config EXYNOS_THERMAL
>  	  the TMU, reports temperature and handles cooling action if defined.
>  	  This driver uses the Exynos core thermal APIs and TMU configuration
>  	  data from the supported SoCs.
> +
> +config EXYNOS_ACPM_THERMAL
> +	tristate "Exynos ACPM thermal management unit driver"
> +	depends on THERMAL_OF
> +	depends on HAS_IOMEM
> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOC=
OL)
> +	default ARCH_EXYNOS
> +	help
> +	  Support for the Thermal Management Unit (TMU) on Samsung Exynos SoCs
> +	  (such as Google GS101 and Exynos850).

This driver doesn't support Exynos850. There is no initialisation sequence
and etc, moreover the next section is also not entirely correct for Exynos8=
50.
Not sure why it is mentioned here in such way.
(Not even mentioning that ACPM TMU part is not aligned for Exynos850)

> +	  The TMU on these platforms is managed through a hybrid architecture.
> +	  This driver handles direct register access for thermal interrupt stat=
us
> +	  monitoring and communicates with the Alive Clock and Power Manager
> +	  (ACPM) firmware via the ACPM IPC protocol for functional sensor contr=
ol
> +	  and configuration.

> +	  Select this if you want to monitor device temperature and enable
> +	  thermal mitigation on Samsung Exynos ACPM based devices.

[..]

BR,
Alexey
