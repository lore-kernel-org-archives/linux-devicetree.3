Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34071388E60
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776687934; cv=pass; b=ZNoUK8IJXfg6YbjkE78YglFzwBgjTD+C3NaOBJHoYVOw/zE8fd+h7ofF+3YKdlEnzYfz2F3uQwy7bVeu8dny/2Me89TPI18FOdbUT2qETx87VHFdeuK3jbQuA0g56quMs8RwX88tFH0pxf04D36RMYBCGsnAYqBp5TQ63LJL9zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776687934; c=relaxed/simple;
	bh=x7limQPZ9fbfVmUFX6+p6BilNYOm67GKW1SfJR896uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwIXFmUzQAST2kUraEMoMGCPSJ5593W28DRAmK8xLW2Hq9vW0zX0RHa55kwW66kmbjgYKIh2Kc17lVMo51SYZbHjrUKFBsQHCyMePUSa0XrZyTFzzrgxLrv37Q6+2rZdzzSKlq+gEcOay2M2Bq7/47TNMcOj9LjP+89ULztwCts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWRgMSzg; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWRgMSzg"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-672bd8d2400so5776898a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 05:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776687930; cv=none;
        d=google.com; s=arc-20240605;
        b=KB7SgpMnLAQe1nIEezJcSaCMN5AJ3xmxu3UG5JXiU2FTKiE7M+c5vV7ix39gbgxgTa
         qRa4pbK0W0mRmHSUG5ZBb803Wit302xmFHffhWzXRUVkFv4TLHL4crXerdkbLrrw3wub
         VMZfioVp0jAPI+FzMVuth9RTBCXqRhtWLw11axgoe24t1Zrpy9Cp0aFJ9tFLp0zkQFbn
         h5wRVVp2Djt6PpRQDtxdZu/XpZE7dQZCYUWX6d745MkkWB7GdSXkvxR42hZ48oGJUXls
         WzKsdrvSB3dyEBL01pYaefZu5xgt4wJqa6h9SM+nQLL7Qz1912Lg2JcSYsyA/b88be9w
         0vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        fh=NDJDLq0XtnjOUteDINSwKXtSF5J2elUW4ps8jZUxBvw=;
        b=fSR/NJxRE+Vetqe3vouLj+M86+Q1jHeKfHdSbiAFii1LrBFs+wqAoToe68Tz7/zs63
         3cOdXyE8lX5IMDy0Ac1Mmwa1agtTArG0QDhHH7W0jH0LCQp0A2AtEuu2stk0QNv0b8bb
         1sJpuVw8rts8oGGBAt0Mk85wsZmdSa6VddcWc7BpTXwZjdMwzw+HPTB0fqhCaZCOh7an
         44Ekl4vFkfMwwma9XjJVaEnezHR0Cl2TbyJEiWYCCbMDPgBtb5uZN/E4eYKI26Ph6c/R
         UuV3gH2Z34GE5doXK327GYDk8guZMemQ3sGd5QNnDJstP2Yn/TQchN3a6CE8NceNENgf
         3/jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776687930; x=1777292730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=IWRgMSzgASfwTirAv+jAMpycvP51eazjjMjcb2OM8zVREW+KcqG0R5iPV5AhRsVHX9
         P8OOK9D9nFMOBxyDJl3XTuNG/+jvwzFcd3lOZZJuQlZdJH7zlD9omavQVFLm6rsNuAhQ
         JFTCs52WOhFqolVQW5cHRHX9fa6KskFQVAPML0V8HH8zqs2zETAlgswj6ga2UtpaZdev
         yLQeOOH7a1tnikplGxS9jA160pRc2my7eBChV6mJsY47PzDlzD9DC7IcSPmzMozre5eJ
         E0qIxoo9QYTub7xXC99gLe+kNmLLlPC8zSOvHZDJRgiwdcIizBd5D+6do11pItvN+Rja
         Bvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687930; x=1777292730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=T3wXgF/rnOYFmqBdONHcXv6IVDO3RZdoJJTIF7tPKLYh07X6FJY0+g1OmNWgxvOmZ6
         Yd16U1vFFaLwqJAOK+kjc7kYiLFdAOu42nG3n1NxrlF0v4Z4Fues5Zs3Cvz+LWRb0Ul5
         MmGpLTu6KUcS4dwjmpLg1JYysDL+sfj+nsKTB89I3bXKP5/q3z1q/mZs6jV4iLNrsCe3
         l/8XzADvlbX8vnDKIgvF2ZXk3nexPhHPgD6ESMFk/hFFI84UtmrKO9aQd05/fUIQlGQz
         Q/9mCYxIFDimtFnytevVPppoAgS7qWY/xJQPvtWE4gRLmX+rBtcylbNfhkLWqP/M978M
         8ypw==
X-Forwarded-Encrypted: i=1; AFNElJ97oahnkRNNnnNirn3k9n4eckw/fGW4QmsRPL73yvEcPfWiHlWMYtPaJHk5GLiWS6oPhWBssaW0BIBm@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrHM/iYv66S5Glr5Y9mZzVjes4dvFVw+iicRFE/d91DTzMz0s
	gBCtRK7Q6tvQH9htqkyl+Zjw7UkX7Nh6P4XxiByZ/Zy+tdysU2o6F/DpHyMe2xTN2UVRSDXXs73
	jS2BWwvBY/osWev3ZI45hmOKgs2NvZvk=
X-Gm-Gg: AeBDietTwejQnG3kRMqt8YW77tRmLpyLheqb1QVqaLASbPybeEZsnwEcTf/Wb7xZJ+Y
	EEH5YPmtMelslkWBxvWTVcGfqdAZseo2hhSgXCBCmPSGbV2tRS+TSLqfAPTMMPy2L7yLF5tU0lJ
	y3oOHnXs3yn63x+tcRktyjtXZ3BG64vPmEMd+TSAv8CV3E5WrrmDtt90YXpGgVfV77CbHwYSoJk
	NUdV1ijnGqSsPHDWNfLo+rynh3a3u/wC/uqRlt2sVBbElWkDE6+mzIxjxFCs4A+Cw/hJsrC7NzI
	0G1D4Bsa3LUuIJpFhSGEcOlmxGsIA8xlbzTBglRy+Tn2eNhb0mfsLhYIos+lXw6ir0KDx+plv/1
	ZHcZaiP/CiMY80kQ2ILkiBZqa6p9iFsQ=
X-Received: by 2002:a17:907:c30f:b0:b9c:bc70:e928 with SMTP id
 a640c23a62f3a-ba41a91d717mr643541666b.25.1776687929243; Mon, 20 Apr 2026
 05:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com> <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
In-Reply-To: <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Apr 2026 15:28:27 +0300
X-Gm-Features: AQROBzB0Pu-szzo1dJ4AB7xUuHS3a3UgZozivXv7bKFQ8_vmaUhxl3EQBT9jCiY
Message-ID: <CAEnQRZC1vtN9nsbR6zBD++VkBVcVxxOBmPfEToeg2FimmkNMFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] remoteproc: imx_rproc: Program non-zero SM CPU/LMM
 reset vector
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 10:49=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Cortex-M[7,33] processors use a fixed reset vector table format:
>
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
>
> In ELF images, the corresponding layout is:
>
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
>
> Reset_Handler:  --> ELF entry point address
>         ...
>
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
>
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
>
>   ELF entry point:     0x0ffc211d
>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>
> Current driver always programs the reset vector as 0. But i.MX94 CM33S's
> default reset base is 0x0ffc0000, so the correct reset vector must be
> passed to the SM API; otherwise the M33 Sync core cannot boot successfull=
y.
>
> rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
> hardware reset vector address. Fix the issue by deriving the hardware res=
et
> vector locally using a SoC-specific mask:
>
>   reset_vector =3D rproc->bootaddr & reset_vector_mask
>
> The ELF entry point semantics remain unchanged. The masking is applied on=
ly
> at the point where the SM reset vector is programmed.
>
> Add reset_vector_mask =3D GENMASK_U32(31, 16) to the i.MX95 M7 configurat=
ion
> so the hardware reset vector is derived correctly. Without this mask, the
> SM reset vector would be programmed with an unaligned ELF entry point and
> the M7 core would fail to boot.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
