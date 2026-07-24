Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CDB363095
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921048; cv=none; b=Ks/tWopZSmEOogiO49DYZ21E94zZF8CW4uDpzBDOD7AWMMcqnzLMkEf3nUmcXU8Ar5Fiqtu7/46IvL/yLpb/+HabtQuYWipZLm0CkMv6rABgbg9nswXNUgqZ/JKsqUDUadoPBYuC4pnAO/yVe0LOi0kmaP5ixVTkHgh2bFbmKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921048; c=relaxed/simple;
	bh=hieC/kyuGvbUOouu6D2lYg+NmV0Y0CqegVgla8HlJRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uccefLKaK94R7CRVEB1kiDz775IjcRu+e5KmbONwAchsRvMuf3c4TizUcEOjQB9ZATD8zLaQ5jIJbBx803jGbJm+0bsGzWDTdRmryaZpecfAUNkHo6VJEG2+lUwLBkXr8nEID0j5jEDAaKpNTik8t0rK4YQaAWyXeaiUV5M7rjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qS6GaHjm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qS6GaHjm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad8076b01so9223415ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921047; x=1785525847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzWZ3WF1iTTyJII+h6wIVAKbIfkK/TqWCpKjALnDATk=;
        b=qS6GaHjm+EtoF58nzoqgbIQJjCta0wGM+sc856WkYhg3KbaTl/fmLddXsedzDEHNxA
         SF/jnMk2ESZr3MMcE/qDPRC6LQjUXYN6aYP6iNa07l+tuOFUba+ydNcs+UbvxNlhv9xE
         9JVeIVAhTMLX5J7lZNI0EqBcIIGqjHHHmDxo6UF30/QSm+jfecKMJhVhwbi2K28tKXrr
         tifFXagMx5aPTKwehGI+uHgd7bSbVAHu/AsmW2LSzUhvNA2bNl7XcsYOFk7l46jPGw6K
         45sVvVdu5YlXZZUchGJcUT9IVcRZ6ogqJFizEuvH5Kq5u36lMQFok9EyERUt+1j4WAiQ
         HBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921047; x=1785525847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzWZ3WF1iTTyJII+h6wIVAKbIfkK/TqWCpKjALnDATk=;
        b=IFIBSjvG8YpQoA67CP3bQ6hJNfPNUrx/jT3lnVQb5OUrkJCMDq6+g8PGrjRqKQGFcH
         p9nuPU5ry261+FXI12BkE3ECkcJQUyYwSWZkCvInsAJBzt19l1xfjjKRS7cPZIXOpgnE
         bCg7yPeNLvgj/zzYAJmNxSTUrsuTQHf5emto0QxP1KvwWXH87V+oNlf2bQOHGBxcWLwW
         pEYk2KKGNUXdnECT5iev6mp6UOWU1hizG78LCyyZPM7DDzzT2jmvq0ty17AQSp8fNZ0w
         tenptIuKkLosCZ58IoWfBYGe0uyXLUZpnAk8ylWayAOheg48FfoKabePx/FHp5RsUOtY
         ahUw==
X-Forwarded-Encrypted: i=1; AHgh+RqGtfNtaZURced9Esn5+BxyIpZzJEYOwEjaH/VEq+SpEn1XnUoGDH1fSTn+FR4w1ml/5UFBFRPSfOPs@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAip8o5aoGDE76PrtodPD+Uq+0cxUKYjTktyLOSVOYiTjVF0x
	zdTmbcR31scfFBX0O0ymOOdUCvFf6ex7SRhEnwDkMPjnrIIQq2vmUmCL
X-Gm-Gg: AR+sD12N7Kl7dnYTjJlpUpxj7CDrO8k9RVDgZvi3RPaRDzk1w9p+dtDUN5kiuhtZOam
	+TnfNsoQAhzjEFYm4wsqSfQnGs80meEgKoomEJq+lKOHB85d0cnWztcJegOiIcIjKakdzWyuPrB
	BcS/RSfFtaqzFLpHzb8UMMCVEppj2ySgW/TNUtiT+u8yTStTNi2Dj4F3p500L7g7W6by+1zi3tO
	NNiPzXaOOuf+lEVGEhPLgs0Sb/g2rNPYW0tOpxxlXIX0NtQErKi0URhCh0WCLY1Eh3VyJqYhKhO
	WqgyeZ0dmDA9KuyW1FyLmIKKj7j4Y6MRfivjyBvoKXrVrUQIKMNDUJTPz3ae8+yRgJLHuxBKcAd
	5+mSF8vvxtqXbYrggzUYlryKBSmaGE7jXDYW6sfWvbykEIsffQNipMoalGJuRbmy/AmPKudpqOc
	a5B/51hJ191hFSxy1b3yR9eEj2B6uHiwhAuteRNdmNoOBURNnyOK1t4g==
X-Received: by 2002:a05:6300:408a:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3c44afda117mr9145039637.16.1784921046575;
        Fri, 24 Jul 2026 12:24:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:40e1:40e4:dabe:543e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm3436937eec.2.2026.07.24.12.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:24:05 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:24:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Linus Walleij <linusw@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] Input: zinitix - do not ignore non-moving fingers
Message-ID: <amO1AWyjGltjO0lZ@google.com>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-2-f6df7d86a878@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-zinitix-modes-v1-2-f6df7d86a878@disroot.org>

Hi Kaustabh,

On Fri, Jul 24, 2026 at 12:54:04AM +0530, Kaustabh Chakraborty wrote:
> With the ZT7548 touchscreen present in the Galaxy J6, multitouch does not
> work reliably. This is due to the fact that the driver reports fingers
> only when their state is changed, so it's either placed against the
> scren, moved, or drawn away from the screen.
> 
> The function which is responsible for this is zinitix_report_finger().
> This function is called from the IRQ handler, under the following
> condition:
> 
> 		if (p->sub_status & SUB_BIT_EXIST)
> 			zinitix_report_finger(bt541, i, p);
> 
> This implies and ensures that every valid finger must have the
> SUB_BIT_EXIST flag.
> 
> However, at the beginning of the function, it refuses to recognize any
> finger if it has none of SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE. This
> excludes fingers in reports which do not move from the position since
> the previous interrupt. Add SUB_BIT_EXIST to the list of valid bits.

This makes the check basically a no-op as SUB_BIT_EXIST would always be
set when we reach this function. It may very well be that we want to
delete this check altogether, or maybe we need to add SUB_BIT_UPDATE and
SUB_BIT_WAIT. I am curious what status bits you see when this condition
(original) triggers for you...

> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/input/touchscreen/zinitix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index 3421b8ffb19b..fdcb80f52c91 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -406,7 +406,7 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
>  	u16 x, y;
>  
>  	if (unlikely(!(p->sub_status &
> -		       (SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
> +		       (SUB_BIT_EXIST | SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
>  		dev_dbg(&bt541->client->dev, "unknown finger event %#02x\n",
>  			p->sub_status);
>  		return;
> 

Thanks.

-- 
Dmitry
