Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089511;
	b=3F5b3q3DTeaP7k4H7RRG1lN1nmjFL1zgp2dnhZWL2u8Dr4+odoZrorNngpJuZFxYJZ1B
	 GNXsXv8ChfMS+URVDEudNb+r0wOnG2JCbqhHvzdFv6CA8NQKXHbPF9FpLoSr8Xk91gYk7
	 GMto8JH9yhC7WclYQeIhLmFH+kP4kQYen8WDoGYeh2JIHVLp3RXgTWRNmpZgkx5b3o5k2
	 V9+lyj/DLkNcAr5t6NbmUR0G1bWE9O/xdYPOkQPBpOsNLyFViBt2zQnn4fMfDz3zb6gJn
	 vWfb4JmnU9/8sJaM0+UA/ydfLIXbh2tABru7N9tCLesYNoYTtn6PgZ8wUYhaBi00TYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089511;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=8pKyecCVKJ3P2/DllSf4QADgUTwIySkDcGXpaKJszRo=;
	b=Z/mhVftFs39IlvwhZkiErGw++3phdYWcuE5P23dsKkWkMv788fhTKaCqEa73X+yQ2ifX
	 5MQ96/q3t2/iZm52UgBfm99LesYWQpYM0oYWwmr7WiWUEPqato4efQZ6eNScYZplYX+ua
	 ZILWJuvBhxQvcfnKlxWbYJSzH7uAOy4IA+ZWc5YMyBeA6p9LXQ5MD8QX43jzSKMjXCgAc
	 2JsKYWvZWTV93cPXgvGVG9y98pOfDqtQaquwarvMkoCFeF1yg1q4bXt1fQWjSkjSTlDSN
	 2UcsjPWV0+MVQAX0kSIT7HS/TIWjJw31DxvsIPK4qyV3pgdUGxveCYbnGYase8QB4NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lVOzcWV8;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94A606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB94A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lVOzcWV8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A2F81A16F7;
	Thu, 19 Nov 2026 11:58:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 490C860237;
	Thu, 19 Nov 2026 11:58:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFB3011BC04AA;
	Thu, 19 Nov 2026 12:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795089502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=8pKyecCVKJ3P2/DllSf4QADgUTwIySkDcGXpaKJszRo=;
	b=lVOzcWV8O+0BgL+87QRl2KBYiDz9tcVvNzQIeJ2CmmtYY33VlT0tOKm6VnE+mN33wFsbuc
	BNRv49hvyR2Bqs4xtfCAMpVgd4g9dQ3z45YF4zAqM9xPatZMW+DqgqGq3n6NfIcYNjeDdT
	UdkJCCT9HH1zPxl8/eaJ1M2tGB+h4xeIDwbwjwtuG73TE1SPFoqvKn6fHzl2dEnEF1eunF
	KOyB9zBildxT/9RVuq/xhbsVmUBQfiXLfmjTfmwvE4y0EzM3KZEs+x9kPKbfWa6q6MOg30
	EpmxuiZuHIW6cslkUH5GSfCuflQvoIWWcAVomu0VhKi8Gocm96CFWoMqFlusUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
  Clark Williams <clrkwllms@kernel.org>,  Steven Rostedt
 <rostedt@goodmis.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Philipp Zabel <p.zabel@pengutronix.de>,  Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland
 <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,  Richard
 Genoud <richard.genoud@bootlin.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Masahiro Yamada <yamada.masahiro@socionext.com>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-rt-devel@lists.linux.dev,  devicetree@vger.kernel.org,  Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v10 04/26] mtd: rawnand: sunxi: reject pages exceeding
 the ECC step limit
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-4-dca1f6ed29a8@gmail.com>
	(James Hilliard's message of "Thu, 05 Nov 2026 11:55:20 -0700")
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
	<20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-4-dca1f6ed29a8@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 12:58:13 +0100
Message-ID: <87ik1tdodm.fsf@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 05/11/2026 at 11:55:20 -07, James Hilliard <james.hilliard1@gmail.com> wrote:

> The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
> Hardware-ECC setup checks the strength and available OOB space, but does
> not check that the page fits those slots. NAND identification can supply
> a larger page size, and the NAND core does not enforce this
> controller-specific limit.
>
> If enough OOB space is available, an unsupported geometry can pass attach
> and reach DMA code that indexes status and user-data registers by ECC
> step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
> number of steps must fit the controller even when their user data fits
> the register bank.
>
> Reject excessive step counts before allocating user-data lengths or
> installing the hardware-ECC callbacks. Check the final step size, after
> strength maximization and the conversion from 512-byte to 1-KiB steps,
> so valid geometries retain their existing layout. This also keeps PIO
> fallback from accepting a page that the controller cannot handle.
>
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 662d96fc2535..1a61f608ad91 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2223,6 +2223,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>  	ecc->bytes = ALIGN(ecc->bytes, 2);
>  
>  	nsectors = mtd->writesize / ecc->size;
> +	if (nsectors > nfc->caps->max_ecc_steps) {
> +		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
> +			nsectors, nfc->caps->max_ecc_steps);
> +		return -EINVAL;
> +	}

I'm fine with this patch, but if your manual says that the controller
support chips with pages up to 32k and you wire a chip -that does not
exist on earth yet- with a larger page size, screw you? This is again
one of those over defensive approaches...
