Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C7481650
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120154; cv=none; b=rnUgIJFX5deNgpFJY/UCHuRXyY2w3r+SsfVys78u+23coHfP6eRSv8Bp94kH/a2aNocrILJQ9x27OLW2lojxSlyj1oP7Zh8QxVvGZxv7z9oeiKG5akYYyGF5ku/g0EshLtx3bhSebhFuX0PNPP2HwaLMup4OYmA/ICTemAXvDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120154; c=relaxed/simple;
	bh=+ef9aDLlQHobsPKwugMtNj/4msi/nZfgAIa1/gNlCko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqzELhUyBIhHQSvS75hWrlVXv/bDYhgkAoxlVdZUWqPZJ9Dueaj2gK+1XNrdUAlblvcv38/7LVzZxQQPKL0ApaylR92xrCkstKGU55QAY6jtC4Zx/CaNelz3KOHrMxF/I5uTeVoB1aiZcF1KRKYHZ/VEBaq2Hw1hC/CrQtLdW/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Er6LGKNL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Er6LGKNL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-474560436c3so1567323f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784120148; x=1784724948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hWIxKyRHkQzvuNSfAhpF4QRz/MvqM4Y3NLoKIJevpA=;
        b=Er6LGKNLp+UIGNqV5ziTH/JxevpcIAEGvmCm7da1DvZQnAKibL+oz6YBD74o2DKDep
         KEUSS1ugn1vOKmfxRarQ/yeo108qMHVnUoI7B0PUiT13dAg+Vf4MAMgcdQ2r9D90TiQJ
         ugEyX/VFywo9GSStgdNwITRRlJdZ5dWhm8pyRXPvTfs3be4KVMq7BF1XaHmeyGJ0FWHB
         J2p8QTq958kctk0uvKQA6ZSWlVQyMs02i1dswuiWLnvGBeYpx4AIg8XRT5ko0zvCwECh
         E1+kCmxD7+B0eV9USrxCVUiijv9b5pN6pRh8zIndVjoX2CNxgHwgycg0yl+D7+g4cy+M
         AhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120148; x=1784724948;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hWIxKyRHkQzvuNSfAhpF4QRz/MvqM4Y3NLoKIJevpA=;
        b=qmJs8ouFE1vwvUsSa4MTH2MJ101BKAy1j0sTVKV98AFfdwtt6ptrtMHUXEg7RrVlX4
         XMYZZP5vg+qQwGQxTEE/kLbJrY2tf/i9+/LCefKeVq/AVs4eiNK0/FX/ia2ouDEcQS97
         ivOFeAjxAHVBc7R846HtZogZUEDXAzMn/iMcVI9fqCzDUzPOjyUewaQuB8v1jZ8+5eTJ
         V1a10aaY+7WVGzmkUIOV0F2m8vvjX7NpuAQLbYri2pBFQMkvJEr6AotDznKQTIbncTh8
         lBS9ArBRprG9lLTy2mwXEaaWcedUCZWRSDzHbfHrLIeuEqk09ltznAAkSxZSqOplduBt
         METw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2st/CVmDUTwXciTGNPjOPwaqUpiR3l1P+8RZLYYrW2Oy3Wk/dj6OgILLdAshX5H+g5kHiWYpdhZ4A@vger.kernel.org
X-Gm-Message-State: AOJu0YyttmrjlnxHKDg9wiUiKyhTr3jMV5bLvfqZRA9+zvmwL9jbt4UK
	F2sR8kuymwPRaBUTBI1GP6xOWQoEWawBDMDDC2BVxmAyPeujrzReTBew
X-Gm-Gg: AfdE7cmSb0OKumiujnORUbp9bm8ptqfvXl0k1/rmYdSReObh7FPrYkXOSwKvZpVmyF0
	h3q4cHOSexyYiscXDIGygCQNfVRfO4tMmY1OD0IlOs8VL2Wb8fxej/qOQl+L5n+U3f7jIqNL31N
	dLr29uKi5ucRHl7bHNVXbxx0bLZXaOtVqwvt1CBSGsqWYGtFAusMZuE/dr2lgSFIjsn52oHo4/6
	1ZSrGsLOkY0X6xXVIXW5GJ4g+CipMbBajfe1cgSaV7EfPRWGR6xxs2ZqxRXuKkmEKmVzThGOL5/
	n7krsJbcpQ+CzJ01vghXpQmsp6+P5irdfkjUIdK4YtC/HgXrq3GbYr52lEPV+eicG78EDK8EDhX
	aAdyre+bodi9vJ2s+Gf4ZYij7zfnd4a/PJmTamE6SCWdvusXhMKxSrePn16Euk3Ffz31iUo5n+y
	oBrkmz7oi1NLcy2APWRs6S/IgWH9hwJhdy5rKKla2djzrKRhvXK4XH0F9y5Pc9NG5vuDJLEYJk0
	x51mh5+Gu2Ajk6ky9wS1DxBU47pajsnQ0nyD0MqAFlwoOhw7IrrFwFsIgeCeddydjfbNwTyw7g7
	IvbfU9plmyLhJARSnsNAMRF/k9p9+jV5cuxH1aFmDVNLM8hkR8pYOyJpsIoTuiFMaGHqiRIwV/2
	qGPBjhZwqXPLsPnY1TWtbbDo=
X-Received: by 2002:a05:600c:1f8f:b0:493:e79e:da6b with SMTP id 5b1f17b1804b1-493f8815d42mr231250705e9.21.1784120148039;
        Wed, 15 Jul 2026 05:55:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508732395sm149662985e9.5.2026.07.15.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:55:47 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:55:46 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nikita
 Travkin <nikita@trvn.ru>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] iio: light: ltr501: Add ltr329 support
Message-ID: <20260715145546.00005bc8@gmail.com>
In-Reply-To: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 14:27:22 +0200
Esben Haabendal <esben@geanix.com> wrote:

> The LiteON LTR-329ALS-01 chip is similar to the LTR-303ALS-01, except for
> interrupt support and related registers, which LTR-329ALS-01 does not have.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
> Changes in v2:
> - Fixed error handling when irq is defined for a chip that does not support
>   irq, powering the chip down again.
> - Added simlar fix to error handling of devm_request_threaded_irq() error
>   handling, powering the chip down again on failure.
> - Added explicit #include <linux/array_size.h>.
> - Link to v1: https://patch.msgid.link/20260715-liteon-ltr329-v1-0-31f027051594@geanix.com
> 

Quick process thing, please wait at least 24 hours before sending
a new version - let it sit on the mailing list so other reviewers
can send feedback! Larger series should wait a couple of days.

-- 
Kind regards

CJD
