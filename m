Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1AD378D64
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957005; cv=pass; b=Zd28yx7qQSS9DpGGTgmatpF7BtDXbsti0C9js+T7yzTuKp/4a0Nhutr1b2VyjWJNLH40PekSyl6QvXew03LRP1lDxM300cwmJ2IVZAZAl/nqTWOEVLjdg36ROiVIh0y/+ywGmKpmJZ/O/7uuhZKzZ96/ey3L0clAwJrqtijyjWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957005; c=relaxed/simple;
	bh=9A8NDFIOttujxgEPXIMc1/yM9qNPFKvJImLYCRjJLE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHBus11RGCx/I7eohxWBPzViGWRHJ5I4DwC7zh37pOO1kwkYEc7vpBvapGPcfYmjnzGm3TqRr2P138tU7jawLMP7AIYOa5cjuwPupGNmEOOz99h21iD9L5w0gs/kCi8qH/69EGFSWqDCLmVIB1tdbUoA4VO+bNw55X1EKKEBt2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK+JW1qj; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK+JW1qj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eec22fab7so97839f8f.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 01:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779957001; cv=none;
        d=google.com; s=arc-20240605;
        b=iYvceXzFljFcoNmr8o3PJVzUIQtNgBvc9Adrna3cQTlK9PjdnWZ2kHgC01KsagYnNb
         6h5FtFeD75y22qH43AS6O34fQWA2SFROMvIoxFUM/zsvUhMA/bT3WCB/uYtKE4WK9bay
         yLo/1UKRDHDvlIMoW2ivUUQnosV48FvHD2J13/6cCwyR4X3i/I4RgHx2ZktqyfNQHps8
         MLV2enGrWizCo57YQeIku+YhFEbxw5X1hcvIl52Jy1FNWG9VQal20hTdhgSNdqB3yS/K
         hnyAreutCm1y8Qpyki5jC14WVveF6IZtBYuN4gs5IZdoxnRd9QZgXcVPz+Cj+/FOUyh/
         H/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ID4UwDlpCCXcsLMnyjkMfD/ZISHe+vJrAY1E/iAzyuo=;
        fh=H8OUgg3Jk/BlBq6EXJOvYBTDaV9snQeTyNkUn5/GeZA=;
        b=hLQVG21WGjALM6y0IWQUEMioHKOKeXdSG6i5fCzbgo3+f9pc4zfCbfLNRUTdnmd9aV
         mAUwigkhzQqiRqbHTrk+zmjxNJeiAHnopL+4htUPplUcN120oDc8QGLwWwYv+5TdyNyM
         ORVNMlDMGL63VlkLjvnX9vkGvM81KmNl/IH+7OdKKQu+eHyWnx4DJ3XaV0735fc389cc
         va8KRuO8S8aO+TPRYZFi/Ejlb3kPhepRqji+LBRS+gd0q3mOKnfx9WPt3+wDd7SRS/I+
         yZi1lfItbpFwgCZAaLf2TSRMpi+xfHFNMBrIb0PUjTlApIq/ZGtBlaJzzSTtKJg5jVP7
         RUeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779957001; x=1780561801; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ID4UwDlpCCXcsLMnyjkMfD/ZISHe+vJrAY1E/iAzyuo=;
        b=aK+JW1qjL//QJmsrPAZnsq3ljscdPYm5bFHlSy2NF9y8BO+4DgjQWlJDYinKk+fwNM
         ceW6pk9QtGbuYOxaCng2oDl3DV85nlgB8NDDcb4YBrhrSdNzbTpjnIKaC3hz9/b4tAUR
         frrwRydwn2Q45hGInltnq9RNhNe4HtkCE8lGnzYvxCZkdkDIQkhbPQd1abfJ/eNClYDC
         CWTjI+bTegUb9+pfQ1j30gTLEoL5I5dT5yr7ii1P730yUn+ee2620AzCBrO8FVLdFS8k
         ndvnMz2C1AJ6zcao2UjxD2TjdL2dYCPyI64F9anbL9UOG+RBWuJE4Xo2gtmELZe5IDqP
         NY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779957001; x=1780561801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID4UwDlpCCXcsLMnyjkMfD/ZISHe+vJrAY1E/iAzyuo=;
        b=AeGDxw2ZhVdzz6zHpmW/3fNwwb5Th64GYZ4BQM8qhLsUsu2kfwrrkSRniaCBeJ49+3
         eBTRQgPvxD0CJ6IimM0tELOqRf/TtlrSYl9USMY+TOMZljTVpwOnngulnCUAYcgNxVEF
         A4w1la0pU4ERp7yau1vwfx4c4wkhC13QnAG78dVoTXEhyH81wh6ftGGaskJDvtFE8clh
         j5RiGRQlr74tZncEaajQlyyZ2elvvAn5pCrPaf26NF+8EFrt8heVO4uf2Xfyu9lxS+zp
         lY9onv2a7KmzQrJxyJcMXeMr5ffA3khWcEIuvMuJo5tfLIVb4ojxX4qJFWqpqdPKq1rq
         qUmA==
X-Forwarded-Encrypted: i=1; AFNElJ+vNa2gLNyCYHJ1QjSgdLPMPFHE6k/w9tQ8B78djMuGaqXVRE736feTfhY0VUsWfep0izSz1/3tO9aD@vger.kernel.org
X-Gm-Message-State: AOJu0YxpULUB5D+g67LY3MWrZ6AtSHF6PSKpK08wDZ69Wu+dTmSrGTM7
	VID6QO5JLBvtKm2en0IIYbuvxWfr/VQvu1V/qxdtrIl5Wn66qIrmd+hPQedhuLpTLweBSjYvOc9
	Cq2QlAsH7Su3+gglk6U4FOxL14pY7r0g=
X-Gm-Gg: Acq92OE8adzGzw7bK9z6BiCyopK9DLInb/njxWxI36yzHjLXI0DyNNrXKNNO0Dw3I7i
	Ad+xQs4yil7O0ctUGbEErMA0XoStAImBAfOCd3PpclquRWoBFMlAvTbZ40l4+yVZYF/X5K9Ixx8
	YLFQ6ehd1cbqIvr47IPmXOgNrkEpj2QgGMAmWIs5at6VHjguA4SEIPllVzkxGHALPmJ57YSAYWa
	P3boI/L0FDlG2rXXpUvI8jNrGduA2ugdAJLKyHmAbVsl2gB2nIvKeBj/BnkDdb7X/cpI/VEbrXW
	dApsyX1VQ0M/Z2FjQRdBU1rJq0Trm60Q44D0S8vQLvPq4k0JAlsUoF2Xf9cRzGZpNs51Lgf1lVa
	jJ/+lBiZCjrt9mKrKnwILcDOfMr3hh0nGIHJkTqDuM1ffeE7RFwRpC/TfnHLClIA8C6h9+nS0E9
	DzLaY3B74sWlljcr6o
X-Received: by 2002:a05:6000:4803:b0:45e:7c19:a328 with SMTP id
 ffacd0b85a97d-45eb38a10ccmr42056774f8f.28.1779957000834; Thu, 28 May 2026
 01:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
 <20260528-axiado-ax3000-ax3005-saradc-v1-3-345dd5f6608a@axiado.com>
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-3-345dd5f6608a@axiado.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 28 May 2026 10:29:47 +0200
X-Gm-Features: AVHnY4JEcnrAWjy5oZLP4EwsnJKky_x459dwwxnNTUDnAC-f8N5TJlVzJGRJzhE
Message-ID: <CALoEA-z-X5p1dfNpcqxQ7ACU7m9o99i-YZjg56+wdPSv8TiFjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: add Axiado SARADC driver entry
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 10:21, Petar Stepanovic <pstepanovic@axiado.com> wrote:
>
> Add a MAINTAINERS entry for the Axiado SARADC binding and driver.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..e6dadfa65ee0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4312,6 +4312,14 @@ S:       Orphan
>  F:     Documentation/devicetree/bindings/sound/axentia,*
>  F:     sound/soc/atmel/tse850-pcm5142.c
>
> +AXIADO SARADC DRIVER
> +M:     Petar Stepanovic <pstepanovic@axiado.com>
> +M:     Akhila Kavi <akavi@axiado.com>
> +M:     Prasad Bolisetty <pbolisetty@axiado.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml

Fold the lines above into the dt-bindings patch. You're adding a new
file, so it's best
to have any changes to MAINTAINERS in the same patch so that it's already
documented when the patch is accepted.

> +F:     drivers/iio/adc/axiado_saradc.c

This line should be added in the patch with the actual driver code.

-- 
Kind regards

CJD
