Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294090;
	b=4Zg2dToHUhVNZb380tr7vOQqahqLGRTZxi6mhlZpFoPNH/FvW3DV3DEJHDcONAiCsFPm
	 we2lV7JF8NjLqBooNk824svklF++cXOGqaoxLefMAC1Z05OlqoAF7r9Xa4cWu+ypiuYuL
	 juU8uJsJNp8L0gCOeo1S5VchD9sN10xzrQqBToGG9d4ZZkRSbO0T5wyJIyjTf/yBCWtAR
	 omqSnm7iCsC1VjazGIdtt7Y7MzD6HKYIjBDCsxQclKagxXfFMV3t+Qy8/a2wrLOhwGY0r
	 NQkJ06LKzZ/f45aeHxoQ3TqHNyTJcosyGYS7Sc7PqgQQ4xTj3aSTNxwzPqCO/v78QOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294090;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XK07TSWDWnxzG2qdvXTXdDgIKWsOp8T6FOtQiXhPIWc=;
	b=mMM16m+HRn390sUwYJeQZvBY0CYExZw48XsirQPjogfIDVrKnQ1mYkbk+LdSzsseeSmt
	 0n+XEGrXfYmaMMb9JRL+pCrjhsfL2G3ppiCdwNoh4s7xoPxRef7+xSainusnzB/QTNltb
	 CdldLDDpbD6GsKe+ooYV4nO2YCLLBVqiCjvS9jyCUSFTN0PPJGdxuA228cGLuoXG57lMH
	 MZW0UXTMNngb+rXeBOzpIckZj12D04I4aPEoz7YvIj9xBYc0z8qDl0GVS3oCvrcC1KvaU
	 uL+xT+Q+ELe9iQLECeSP9911/LezvJ6qaY9fbBZHCCeqgy9IICrwsTz0qkpb/FHu0Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3GZbcTm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F6E606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3GZbcTm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FE11F000EB
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294090;
	bh=XK07TSWDWnxzG2qdvXTXdDgIKWsOp8T6FOtQiXhPIWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c3GZbcTml25n8rFAHKG6bq0uP/NEu45WnXFxPgsvRVuUAgBX/MndE/fX6SNIPo4/2
	 oHuMz9TQAcSP4LHPSa7BZyeidZX+R2Pio1NXT2vH2Kx7Fgq4cbTuhsHZ5B4yAIf5xw
	 WwmqsJdVyT9PQ97GSuNC8dx6TBHUQo3xXLRGw4pb/cwvqhZ43vpSQeuWoxFZQBzu56
	 aSoSknmG4ZUlJQ1/+I1Ihpi5U0qv8yMk9yPTSW5QGp+IunXyu8Sf5DNoC1TxXKGXZk
	 LOVJyjvd7a72fOQaNtUtcKXe7KHfd3uIPdNvXruMLhd4SOPlIdOz8Wrfq6Llq/yMhk
	 lv9ANN2Hx8Q1Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae85e3685cso11707881fa.2
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 12:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHDmpwoq1yc1jBuVyDui82G429zVSbqVgD+OO/8uBHVJlrLC+dCjtBPglzlk7jPCZWmvmsult/n/QIz@vger.kernel.org
X-Gm-Message-State: APuU4Z9XKn/GYmEZvHQpAn3Pc21W4jWSk0Nv2XiiSUlAcFJvdualGsPv
	O67qbdxvJUu+6KBm+lvTv1wqiv8KRfMoVfyEyu1kimhNLpZnjcOf7iSXInt0NUUABBWPwtAJfGO
	CEdRE9IhA96eDDBS0qk407bL5qF2kcDw=
X-Received: by 2002:a05:6512:3f03:b0:5c1:ac35:a0bf with SMTP id
 2adb3069b0e04-5c1bc7d09d3mr1949194e87.19.1795294088796; Sat, 21 Nov 2026
 12:48:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com> <20261110-cv75-gpio-v14-14-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-14-e586aad0467a@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:47:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=JVvHgw-oDsy1mFess16RbbuincK3Db6PpX-_kD2rCjg@mail.gmail.com>
X-Gm-Features: Aa3M54qArBucxV2CiW08e6MHP50jl5g5xtF0lKEEvYNPO4RJA8CF8fUH7qfi4I8
Message-ID: <CAD++jL=JVvHgw-oDsy1mFess16RbbuincK3Db6PpX-_kD2rCjg@mail.gmail.com>
Subject: Re: [PATCH v14 14/14] gpio: pl061: use string_choices helpers for IRQ
 trigger logging
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, devicetree@vger.kernel.org, 
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:32=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Use str_high_low() and str_rising_falling() for the level and edge
> debug lines.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
