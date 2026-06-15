Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257373BBFDE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508142; cv=none; b=MXi2rYv6/D7kErvIS2DOYTHoIcMdeIumzWwJV2N8VFnIgMjki1Vpu6NSWVnlccIN922piblo6mZWQQ6P7GAn4V13LSbX8pedIBf8EscK7oD//RLTGPnYKrvkQLkosIIQ1nlbijp18htLnv2B/O95skhuReAPHYlYTVulfFRsdq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508142; c=relaxed/simple;
	bh=q/LjLwsNZeVWRdpomEsJmQRIeT+eVk51ndti/vp7ZJg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VrG/RlYx1/yuuOtiZWGvcULs5YxvE0cwkMoLIrPkluY3jp2SlP1y9wwh7zFrTt+sO2oGOISa7lZJJGyBIvrEQp1OPSwOHmvAX6/cWoXZxl55BiZLacW2ITPrRfRTGBKZRsBKw2vZffGcvyxQSpJNjRxa1IOTVMxxySPBfONEr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeirWdVV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeirWdVV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so16369625e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508139; x=1782112939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dccX/noafFTQkYLMmmr9krd/IkjkNKqkd36N21cGVWk=;
        b=LeirWdVVNUvD6YWneBMXzByvudmuZ3qN0MPK1EYp+tDeb0xjQN0uzdR/5NQAKOIo8G
         vF9Pu+AbPbnIPycnKYLPsXk5kVJkMR5CKkuf7vmnvPVjZCN+rDo5/PMQ1Kxp38hsVuWp
         i9zhoJZqHWjd5F/9Mp0IJNCGfL3SyhpL2twjTnjQ9u/Bw7eXovSBMnViTkLHBq9wCuas
         fdZ92ZYUsx583zX7WTTnF5Uoq58tHSrbpfQ2spG/qbiSKLBeLOCmU8hQp3gFRj6NJ0NV
         zivEx7yNzBusAdJ0Mq/K25lhmVprVXdfBW6xEYz2roQCtFrdpqZJrzYN6ggNoIOO4oT4
         XSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508139; x=1782112939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dccX/noafFTQkYLMmmr9krd/IkjkNKqkd36N21cGVWk=;
        b=VDVoUiPnHzyZULHFMwjdIFXfFH9n3flhyre5TIa2IrLaDrb+Fj3BSLiUaXVd2FcbTl
         fBfDEPYyc2HnPuipxjdkBj4kwFtR4tjBfEZ2nKEJUXtETRiKI+0FvCNaiDJBNhVkAWyy
         +xZ+ON1lyyey+GcTd68eFacUlzht+dwEc5SUwf6/lz9CHfc8tbQIo4ZKLH8pvA9w0WgD
         /vd2+xmviaFIuQ8rDGR4z9/o9lHM2rPwLdVU2M+pkuDpmVWvrzIwjVJjK+3nIaVp3IDR
         dOQND4J5XpjGc8J7T26xMl1kyfII50cA4T0+J54jnZMtzJAwmV6X/YKZm80Yh0hPViXq
         u2ZA==
X-Forwarded-Encrypted: i=1; AFNElJ9OEHqB6RDalQhiPAYMQTSSc8fdRY4UzE8wmRm/rmN/Vb/BIAupJHv+wLVbOau/dc5/O4gQTu2RGgSx@vger.kernel.org
X-Gm-Message-State: AOJu0YyBHnAdgVCJK19RTdcuDMSf7uZY6sQ9KE+XkGM/EvwZge/VACB6
	mXiH2Fi4PvuGVYLt57OmmQXaLz8NCkpyx/WJUSWEoNbnnht/sMVNbRzM
X-Gm-Gg: Acq92OFwp4upN+Vg4G/H7psmgo5YUj8xG35MUz0fz5PZ5B/J2Vnknifz0h1TqMzcGEO
	GE0f5bSIZnQV0kR/6pCpTLax5CV57m7BcLaVEcuMeMQPrZETT9ftqU2wGxzPs2ej+dDTkRXOpge
	YSdwntkl8SjaJwXUyOAZA/WH8DF0fktq2tLkhpQT6QX6uocCus3MjRjRzxD5CTuGwtAXCkaqP5Q
	QpEd8U/FliwfPATWx2OSNq++fqNMdnXpNykBPIkJFrh7ze0SNBG45eQmz12N2hSeK8KPDFGT125
	YiI337D0gGKdI57nIDr53wT3jZTPqeWeJiaF/srjGhYFjLmTuvfvjl38r0G/Voq5Yrk8pJPZFwt
	jJQmKbveHieoOHgBJABqz8v9vHU/xTHcolJWF/731Xsc+DXJ/pEcv/FB2ZixFTcW2uNOl1xAyel
	9FKxIacJMkae1BRbokVIY2t0xhG8z8L6smRP8e2nb7BBl7D8Le3boqqAdaZff1ZpDBS9AqOk5r6
	nfgmZzvCOB9WUJEQ2CZccXNdbeQa/EAzGO64MjbdHbA5SCrp/UIaiO+iVb3ytsS0bhTRTC253gu
	1FDyNaqvhLv4zqYKMLX2jE45CQ3dm0kU1FsMN36VQ0UZlgmKwZD19vBpfYJ6pjS0DA==
X-Received: by 2002:a05:600c:3556:b0:490:b92f:ef5b with SMTP id 5b1f17b1804b1-490ec4d4f30mr164914315e9.13.1781508139308;
        Mon, 15 Jun 2026 00:22:19 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm180246365e9.2.2026.06.15.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:22:19 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:22:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux@analog.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] iio: dac: ad3530r: Refactor setup to
 table-driven register bank approach
Message-ID: <20260615092219.00007709@gmail.com>
In-Reply-To: <20260615-iio-ad3532r-support-v2-1-84a0af8b83fa@analog.com>
References: <20260615-iio-ad3532r-support-v2-0-84a0af8b83fa@analog.com>
	<20260615-iio-ad3532r-support-v2-1-84a0af8b83fa@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jun 2026 14:20:15 +0800
Kim Seer Paller <kimseer.paller@analog.com> wrote:

> @@ -344,7 +387,14 @@ static const struct ad3530r_chip_info ad3530r_chip = {
>  	.name = "ad3530r",
>  	.channels = ad3530r_channels,
>  	.num_channels = ARRAY_SIZE(ad3530r_channels),
> -	.sw_ldac_trig_reg = AD3530R_SW_LDAC_TRIG_A,
> +	.sw_ldac_trig_reg = ad3530r_trigger_sw_ldac_reg,
> +	.input_ch_reg = ad3530r_input_ch_reg,

You're overwriting this field below.

> +	.interface_config_a = ad3530r_if_config,
> +	.output_control = ad3530r_out_ctrl,
> +	.reference_control = ad3530r_ref_ctrl,
> +	.op_mode = ad3530r_op_mode,
> +	.num_banks = ARRAY_SIZE(ad3530r_if_config),
> +	.num_op_mode_regs = ARRAY_SIZE(ad3530r_op_mode),
>  	.input_ch_reg = ad3530r_input_ch_reg,

Slight issue, this will cause an error if compiled with W=1, as
you've already initialized this field earlier. Remove this line.


-- 
Kind regards

CJD
