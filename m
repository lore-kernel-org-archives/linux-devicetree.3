Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEA63370E4
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144877; cv=none; b=PJSivpF40dTIqk0gO2Y+ay8LArslm+AEEYFuE/JbyarYyWKWSImavd2Dd33g250WV7hnM/SJSdf3r6QY0cxqtmO1ezzxeAXqG/kFCQeR7nOo39FcRn8pzHW9XaPB1B2VCZWxQKlvNq0Gws67NGId/nZqwPPfHNb6LMz1faqb9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144877; c=relaxed/simple;
	bh=AQ2mAEPbzm04qOGxYXD+C5edEWnqOz9w1cgF2xpS6xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3Tsj8BCA7P3FxaphJB/VVx44WULqKGkOkOG6mkNPGKofDf/mcfRFzGofjY0mVOaN9Y5VVsCtJ4xFt5MYZvrNUZZ2UZqN7tOgJ/JipnXk/Puu/Hn5oHHFHJVPxdkSIYaPbxD/NldmR6eGedkv798epd+JO6JrxykFwvPOQjFg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJoxSCXH; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJoxSCXH"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f23e851626so59724226d6.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784144873; x=1784749673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KEXXjTtbWbMQrJ2ZliFeifCGsiHTYZZHXWoNLTa8NpU=;
        b=rJoxSCXHFcdsLztytxa/oK5XHs3LLUp69efB9zMFiCVcowdfhSRUcNdq4uYmiuP86W
         KE4BuEv4KadIeoYvjGxf9Oxkkg20PrtZhz/1JI/zC+RftS9op9ksoh3xTJo3XTf1F9AT
         1A4L1f2sclIB1B4RrzXyrbk2K0jTJW7kgwEfU/7XbHCmlbSnhY4YLDirDgCx8QuqRqx4
         d2nilcAn0IqeYf1wv9ouTmiX6xpYD2PdHLRHnxpthYukAs1aC6jC03iFSbeitmXLbHbv
         0TiBP2JEwASNli4nhAEi50NrybswUlv/IVv/EiejUbs9mdZbzn0Cj1UT3Gf0eAeTelm8
         krew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144873; x=1784749673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEXXjTtbWbMQrJ2ZliFeifCGsiHTYZZHXWoNLTa8NpU=;
        b=XVkyHvV6WtUYAq/2QH540GmHUFtnKAKN/7IuT7VppzCDdqeiiCF8e8Y3hXgVP3yccp
         JGHhrvJGv/vW7DQzcBdD/XBClaSHRSgd+Xn3xR7z+BQAevSSnmEoDEedl6T6UbRnznd6
         sgk7s1bH5EmKVrD18SBT7JMyV0Uet7b9kcLsfl5ZANZzTwSfgO+htWHb2jVD77xDFJ85
         pzttAUx/W3SQFJqEHHhAfv/MnxWEVFeM+Pccit1l6FUvQ1gEXuDguL5ywJdVeRfe8kln
         8AGpARPYYya8ONYhp4zv9xQ3NXzDTqC1zbhwgwhfIPatpKxDgRJSfWxm9CZtvzottjY2
         m7Ag==
X-Forwarded-Encrypted: i=1; AHgh+RoWJWE3I6XdyKLDbfmRawxBi88cyuaEAzrrc9jtmIwVbO2oHhNsbE6DVHOd8dYQlHUTA/7fBqDSA2cg@vger.kernel.org
X-Gm-Message-State: AOJu0YzQRJxu7cDkSO7aMNfWMQaPucBNjJGSlRvHfrNn1OFQSMftY0JE
	nhzQlA1i8MDiVRW8QINi3GnrOnb7rZ1LQRJVRh25GwwbuA1jxfuOjzeU
X-Gm-Gg: AfdE7ckdeODzkFLMacZaQOhZBI2Kbs5AMq2S+OK0QWvrph+8NvEVTyfzvOA3MwMxUbd
	sfGYiOWjx4Ul7VArdjm9t8O1/GRlr41uNzge7W/KivemPDK6pt7XlezFSsxspG4jrmWx98MnDLh
	5cf2WR3Xg8d0pDJAirnc9ECDW7RGAH7uYmfbVfvL/0KVh7R3mqTUYRTHk2tHOvhx+rcKtPagkvb
	4V6nKR71az/jmpP6HBlRieZ0qqLGC3BDzkaYBp+FkJR70ifrGuwzp74AX6cLJR/KOKMVmFaYRhN
	FZJsukWPlKRp+F6/nqMvAvsqR6E74bf43nEUIo6jOhrUkgQKw2Mp44Yul7Z8GT3/SRocek/3mFj
	lPD2/mdhq8SkYeO9GfH5mLhy1MB+bebLQHKCY9LKOUI0cFodNwi+IDAYNn400/iv8676eZOMEgD
	8j+333DqD38oJsn6+odE4wrFyf
X-Received: by 2002:a05:6214:c4c:b0:8ff:496e:1071 with SMTP id 6a1803df08f44-90747c2eeb4mr111182776d6.1.1784144873147;
        Wed, 15 Jul 2026 12:47:53 -0700 (PDT)
Received: from localhost ([174.89.92.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c8d4csm218276946d6.44.2026.07.15.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:47:52 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:47:41 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/21] media: i2c: imx355: Add support for 24 MHz
 external clock
Message-ID: <alfj3XIkX-2O5BGp@rdacayan>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
 <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>

On Wed, Jul 15, 2026 at 12:43:15PM +0100, Dave Stevenson wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The IMX355 sensor supports multiple external clock frequencies,
> including 19.2 MHz and 24 MHz. The driver currently supports only
> fixed 19.2 MHz input clock.
> 
> Refactor the clock handling to make the PLL configuration dependent
> on the external clock frequency and add support for 24 MHz. Introduce
> a table of clock parameter sets and program the corresponding EXTCLK
> frequency and PLL multipliers to maintain consistent internal VCO
> frequencies across supported inputs.
> 
> The PLL settings are adjusted so that OP VCO remains at 720 MHz
> 
> This preserves existing timing characteristics while allowing systems
> using a 24 MHz clock to operate correctly.
> 
> No functional change for existing 19.2 MHz users.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 77 +++++++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index ac59908f57aa..a6ee7532018f 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
(snip)
> @@ -1749,7 +1756,13 @@ static int imx355_probe(struct i2c_client *client)
>  				     "failed to get clock\n");
>  
>  	freq = clk_get_rate(imx355->clk);
> -	if (freq != IMX355_EXT_CLK)
> +	for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {

Did we start allowing variable declarations mixed with code?
