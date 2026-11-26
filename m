Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703442;
	b=1G2QzZBO39o+CD1pjDqQeWBjEY4Qh1PB6kZR1ScsyRe2kQUPdxWqntF8Eh/Nm8ixRo54
	 Zmmk9KNYb8v8NE/5i8N4wkknZ9t9pfocjEjFIoBwPF9H7N4IXS8i1lah3OZtmKPxfprtz
	 zIGJMlioOWpz0JY1TfiUzI6kFd8g76BGPYSW3AgvKy9WbJbfJs8q8BDAYuoLaFRV6AY9q
	 Nn66+J78dGf/mRxJPR0B68LuCCHX5YHbuQJytrngWjPAurh2Z9XwpAYlBR4k44LqZGbeO
	 3dSy7EmLFh6U/lvg84pLVfxx+ikZ1XNj9SY+5wXvd18lqse+RG654joOURmO0Vj5zYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
	b=10YT+Ow6tDMvs09qq/KcaMLqZ9QQtLmfLnjW4l1HRinZpgGVqG3fxxT2pBL0cw26RjhX
	 H3jqWHQA+odo0oHeLYKJGeW/s7BFPsGU8m3ncg7R57FfCcYbSDVb4xpYdwUMdEPgC+pL+
	 fVHUDnxUtG2KHRNn/hrDvhYZCaq5Q0Kg44dCrbqo30k9GRyYbxIgDErdnzoDjpdZ/eSMo
	 Rk7mBnxdbyGZeghZ9mF15w1jiT5nS7X7d6+1aNYT908iEdlrZ1cnCdRsKvRTGm5FpiHHR
	 NnoUjTKqDxxb6KU1LQJbYmib51eEjbQJ2WlevnC1x2KCzXXN0KJS+LELnuCXuoOpLWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FTLZu6P+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A22606A6A7
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A22606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FTLZu6P+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso87437285e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703437; x=1796308237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=FTLZu6P+3j1KJHT73x9+c1vsPjYURn8Nckh7vU0GQHWO1jaJhr6TFSl0c50PMuyBpg
         DDoM3P0wJtT2QwoXHut4wdwKVyYR7ihk5CGcFhlVrI4iSzxtkk4UzyLTMMly6Vo1mfGg
         0C8751Wmes4UioGJd7HlcYxtRdf/QizDwoM1ogvczZDOtrGu0D0iZNxYzNtkNsu/z/M6
         zmWMCuZc9QtluNZdkUUWybelri/Ch0FTtXNiVeYzPt0nkUWrIEIz5ZrzyVhivmV7OY50
         LgqYpjQkVwp66gQQcqpVB9s67aG+8rfvozx91WlNLCPhji09Ufx9Q3jd+/RSsrKJrHIL
         VCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703437; x=1796308237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=SrrVx0uRRCT7rOx7e/KmpXwU4wUQgPjegpRr6j87Oav9hUDtbDER9pQZCHkEZMLgHy
         4dbqMUuvhu8QkQl+vnJhRUCF1/D5VJJwJ4Q2tdFsT2DNYsEfBgytB4dHII6TZ5/H8wjS
         apQYBYP3kWuv5GZVBoYMvujvuPkItRxcFZO6ZrPU4KOWzZGW98Wa52UZZExHxHgqXRFx
         47vEzFe3WkJAtDvkeX1qmJQH/z7nVf+5yBvHx/MOut5ZNo9KpJG8ODcsHwzyy9QqXrX9
         XLUfk2C/lWuJUQ1Y1RzGX1ZwimRsWJ7awLe4zHPFU25hf5iYROlBxmY82CVy3jGi3y9M
         IE1g==
X-Forwarded-Encrypted: i=1; AL+hErESlT4sap+76gMKgQTFIkBdXoGHFjQI2nsJdDDKlWlQi9ghYWCNyk2phi59fHgoSfKcx743ErA6hVJ3@vger.kernel.org
X-Gm-Message-State: APuU4Z8c3EyVGp+sWWfOi2AE7bFMKoXYMk4dx2JY3NGkmyKHuZW3goQK
	3ZOtfQkMhL/J/by8oDo5qaEpbZr1uZ4wBi+bWooEIuTyZWnBcO6luHkLLsvHjADsSj0=
X-Gm-Gg: AZFdTZfKQEvuDBHB1YUY8wB4+WYxhKjw9aiB5UxTFIvLc4/aUmxiXagANbwk+EezNoC
	yjvz9wiMYNrgZ+sW/MrKbzFOlmq2GRpO2rPvRyB6j9yqCCJyRIimWapIjerL1bce8LZKT3MwQrM
	rHRWkQ/Afu3JetLsGK4debCL8MinOaXKy5oToip1eV1cpmdeDN8GZoV5l+CJz/FR5V5Nj2IYpR9
	0rg9YLYZ8SWuULIc+fltpPvW7WtZjy+It21diYojY1h3QridFbi/bfGrJr+x0RDfMJANBm2xx0e
	gZzSvJqx6+m28lAkcqvMFvkQgrBpAOLA8fEIf4dxTFKk3H8mo5TbqJb7WlEs61fZOKYg26bH+Yd
	LdUqwOzJ7GPC7Q5PGdumcsaX1v8E/+Rskpkt75XITm2S4t70eTPkfRpowFoYu0Uc7ty3vqkr0mG
	zoCWjVqdMDCvdC6Z1cjdxpAReIfmKstXoG0BEdwlhoiPqjhPIUfIpwfUOtGcnDF8Ib/tleFB5OA
	0rnFYOCW3JVaDquKYuA0Jd85cx9mO9L3PXOQFRDQEFFdlmQww7ZAchQpUaAdngj+mpyR+5c/Uqc
	HaeuI0cNVkKJidvg271Cg26i0sqh
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr403770795e9.11.1795703436933;
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm340532965e9.0.2026.11.26.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:34:36 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/28] dmaengine: bcm2835: Support dma flags for
 multi-beat burst
Message-ID: <awhDfF1HNkPPgRbR@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-5-andrea.porta@suse.com>
 <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:30 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:42PM +0100, Andrea della Porta wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > Add a control bit to enable a multi-beat burst on a DMA.
> > This improves DMA performance and is required for HDMI audio.
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 118ba2f71dc8..063e1b2aabe3 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,7 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_GET_BURST_LENGTH(x) (((x) >> 12) & 15)
> 
> Use FIELD_GET()

Ack.

Thanks,
Andrea

> 
> Frank
> 
