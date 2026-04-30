Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C4740242B
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554478; cv=none; b=hgV768UDe5wopuZYXoLrSbUQ43LViIF5exdbhuDFUAuv+HydXg6uQINfubKdVIL4S4tdyryLIR4kMFOXJMWL9jHSJy8EI1Kc5oyiMKEYF8dEQzCFPzdYQ8YXzVaWULTDCm5zQy4eTN5eyUkJIKAEmp0PgAe+kOxpneowsq1+xhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554478; c=relaxed/simple;
	bh=KhRQj+iRqtW+9HWFZenOFSuPZ0WQQSN49Yl9CqgIP6A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u27WV8isPoDiqEVrlVi85BA1pkiKYa5s43UeGRZ1JIW5vPnLX+p/+iPr48xUolvkeY7+qHPKcB8uxbn3CX+cX0YhJhsQZoJ2MVyjAYaElpeTkdiQ0u1bk0XgMxX0MO4dpHUy6c6T3csjz/D3GaAv+CFafqysYtvy5jNVnCLXcdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ttx6BUAe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ttx6BUAe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891f625344so10087235e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777554475; x=1778159275; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=;
        b=Ttx6BUAekpqaGc16Ygjpw/uU2dRApAkiv3xEZObvHlcKWC5otMLkdORqENVRXZaJxz
         0pnBJd2FuVIZXxBe6Led+GIDxzYGoTlSaNE0NoaWdbAR/6KMvzfuyk8cHWRCBd1Rsi/A
         0XrTFrIlAoRVazq3ThcTRMFZL3SWuRdrKPmOvftVEexLSEYzEALy+Vx53YgRzAjVX27J
         FZj+iDDY1EvD6un8sRQ94LWTNG9Y8ZnFD4OCfD/BsXH9v33Yyf9t/TRX84c9LdLEwLwJ
         DauQlxuv4zVHq4ZwdxE995o0BvgMbE+cseFlc6S0XXQgXh6KRUyR7AUPjQjwoNj7jAwz
         m4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554475; x=1778159275;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=;
        b=GvwZ2TcSNZGXp+5gsPo/c3OocgbqxmHJpiIzjYak++/OeiZUeTM2CuDpz0Rw/dkSIv
         uubAlhxOPosWLx5dlQr/iD5/9YvQRh1IVzPuGVmAjjN0m+/ISCFvAc+zdqFLkr+daglA
         XVKGS+8bpwTi33HSUwyw6qBbWMu+t7HcbltbVx8xKwjTqCaESIt2RCBdhgdj+dVrbXA/
         0UCPBb5EeTrq7VPDRnvdulNpUyQ3FLXsRhDwv+y6jpYnzkMtjPEMUYnv4LuKBfNel5wy
         MRn++d8LnShzW/zD8xQwnOy4i5Gqjnh8aYDx5r1249ooL8NCeOlwEFuS07EbAghFcTyd
         H8Qw==
X-Forwarded-Encrypted: i=1; AFNElJ8pr0kEoj+nK5972BMvunwq+hjvkeWlBdX5QBhKGDtLQ08PiTcbXVna4S9naCdAyXYehZ1SxmI/K4MZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrN3KrGLaKpg3UO09LzZCkWSQnw9ZUinW5gk+Q0EuWvGhm2S1d
	gmCnKi+vG9jw0ba10dHTPakr+5ywGRmST9vcL8WooqTwXK3wjVtFADXN0W67sArfA5w=
X-Gm-Gg: AeBDievt4TVsp042TZ/YAhgZ9QdZvHIDRF1JgzCD6gwzPiLF0uUP0AhVGRbp6mXmiOr
	GPouHg7PvqfytZBNbzviD+24yASyPJjwMy4yuQ11LzRXLCJM5bk82F3musUXHu3vA2Ql7zlhya7
	xlzttJD6eElciU7g+AM4in21UBzoUkXiRuir/IpyoThThvzwom1YOE+otNAbdPKTGmIQS920SbF
	PAAAmO12ic9wWHRnVSyiLUjvHd6t47mqGfLyz3sXHdeEUAk+wEshiSFpsAaWlyYBtR6tVNV1nZM
	0COqVGMvvBSlfsrjXiI5GnYtcyOzgufDo4tTSe5tdxkovMRn63lHzNPUeWSFSsBNm6q5riIPBD6
	vbQbXKNb7f1slDXb2tFg7k4oCfEUX28wGsjtsT2KadLM0nx+7ZfgoyWJAmO/tE9keET0xUTKTUf
	Wv1iETYMdc2FaCcq6nKstocygUaAN4X0ZSueYc6b3nrNmagEuty+kyoR+z8bVMpn1FQsHp7x3Pb
	F9l5ozfiNFepqzjZOq2c502iA==
X-Received: by 2002:a05:600c:4b1a:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48a85dc37c2mr23717425e9.0.1777554474275;
        Thu, 30 Apr 2026 06:07:54 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:b0e1:a8:4337:b2a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822d4a9asm71861585e9.14.2026.04.30.06.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 14:07:52 +0100
Message-Id: <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>

On Thu Apr 23, 2026 at 4:22 PM BST, Tudor Ambarus wrote:
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
>  drivers/thermal/samsung/Kconfig    |  17 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 547 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 566 insertions(+)

[...]

> +static struct platform_driver acpm_tmu_driver =3D {
> +	.driver =3D {
> +		.name   =3D "gs-tmu",

What "gs" stands for in the name?
Shouldn't it be called something more acpm-ish generic like acpm-tmu
at least?

Best regards,
Alexey
