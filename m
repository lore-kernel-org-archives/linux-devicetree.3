Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414A40EBA3
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120499; cv=none; b=e1fCPHzSaselhTsKo3wYKtb6ZOuexZCT3oYChfDbLZ8yT5H1TRkeZBDgYSSDPcNmzYwT9B2hDC5kjwN27FiFAe3doBX5Md/I1CiLynNzZ6ATHwf5N2x3p4p10cj/ttLTv3HsWvzkBC/1AHaNgfnNaAqO47rAWN7CfoJLCjVTOUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120499; c=relaxed/simple;
	bh=A9IxaC2jYjvoAPuB3MFJhOdcY+PYA3Vpj/llsUFAVM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLW+OLiPsayX6mVvE2dIzuivsUN57ciN8uco55+ygXnd4530oTGD+8ivkFwx+XIMuhUDel+CHm74fdDASwpgQQuXZ+UhQcfoQZZDI/OzJIDV353/LxOmCMlF9TENFHuMCb4nrUeXVk8Zn9YHkt17/q7VmCPDJs/sTsy4s22UFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScxZ9Xyu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScxZ9Xyu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so540236a12.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784120496; x=1784725296; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGJiBe2GnXkVQ7WvIgk+rUjAfNgMujlbFP2wwqEbWZQ=;
        b=ScxZ9XyueW6CfHq1BUATqrpPa65NehqpX208mL1vEWCvHbXSF2M4QD5vCCifRqXYir
         4KXrBTG53T0GUt65qCj5uJTE9Mc+oYSbNmDbj67xTpxQqOH4rJ5BD0SUNPyJVsf+i2SW
         YiGWjNcB8PJRm/YZ4395XeiDA+r7yhPOmQdfxZnoHBZbv91tJhizxwObFDJqz1DFL41k
         J4I1/3n1Fkhu9qBoKBlRy+/3tar2to6xTvxD05GV8kI85fs3fSnbcFDVoKY2p22rCS6D
         c+arBZiw668F1tlYgUX7vCrDLUWZFBBfrN/7eqtvHWECq+QJFLgT1AlLt04Pdsx+foBf
         2zHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120496; x=1784725296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JGJiBe2GnXkVQ7WvIgk+rUjAfNgMujlbFP2wwqEbWZQ=;
        b=mAQ3jR4TYlFyzJyTACxcKYCQDtplmmaCBMU9mMT9oEG95QIbasK9obbPvpPo+2qVyr
         GwKHlzD4w8RjUKbF2re9ILQhS4H/1tE9pT8HCsXf43coJoXm+IP89Dn0seec2hd5v04q
         H433Cxggg/mi8nxAaAYSYZwerNDj3V28/4O/q6/1azdD8cbVxi1kIIClZXj8rUzc24xp
         0Yd5dkSE0Meyf6Lkni+YUh4eMCRzxo4/ZGljIa0qu2y4br+rjKhG7t7mJK7FK9kv6BSv
         AQkwdSoP1LWN6CqdnUIuMaoZ2Jsqt1xNvGb8kswA5D081u0o3/71RfrgG8A99PlLuN0b
         6QHA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9vcLOxiHvoPRcxkZfN09Vtyer+8oPH6gI5Qe54hecyyyMGWk9x+p8kp732CxNtz4d3YaoLM3udjaA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5RPzPHiPjUCpj9eue6xmpJ4IU6nLhQj8liIHZag7SeYRP3z9Y
	RLlazKxfC/zB3h1McrXol5P5A2NYtvo5XVBNhKysE3eyzsv1sqQOFhim
X-Gm-Gg: AfdE7clDlAUW9YWf3JmUFVi1BLGjuUJ03ZpeGcc7nQCeNKq76EXccHCzSM87eFkrflj
	KyYn56060KivA806ywxZYJBMFOky05MFhmt0sSZqLTvZM6cZjy8ehMdQHPJjou2qqq31s0Kr8wM
	yW0+xeCrzXQ4wrNep70xe3+WjAi6FL8CSfgCqC6OdBt/evuKcjAwXOnRqSs/a0x1sAAfqFT5Nsw
	lyZ3iMHfN6u1XoAC+pp1Bc/8n8M4vMTBeW7VrgqbCCLqv+8/8SYzA4i/5U+cKY1Zj8mnuF3hdoC
	UGiIU0p9MHxVlTX2psNnwh01QQPxyceXhUS2bQyPon7P7o06dZbzmRl+Hq5tqGPmU2TV7rS8Ylb
	78eDaErX8Vp1LST4x//W3dqGTIPt9UNt+HdXRsstEnQcC4hdQ8BFMA+DdYosvLzi+AHRzGvQHYq
	2agpNr75j0LP3hPes18xX7VpLDAk4=
X-Received: by 2002:a17:906:2856:b0:c15:e04e:aed4 with SMTP id a640c23a62f3a-c16792bf2a1mr141096566b.42.1784120496310;
        Wed, 15 Jul 2026 06:01:36 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871962cesm22072566b.25.2026.07.15.06.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:01:35 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:01:32 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nikita Travkin <nikita@trvn.ru>, Maslov Dmitry <maslovdmitry@seeed.cc>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: light: ltr501: Power down chip if request
 irq fails
Message-ID: <7yhbsguvuodmgpmhb6dgnuxfede4x6x3ducrifymcmqlb5vl4u@rgrjqovq2ife>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
 <20260715-liteon-ltr329-v2-4-d18af55edab5@geanix.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715-liteon-ltr329-v2-4-d18af55edab5@geanix.com>

On Wed, Jul 15, 2026 at 02:27:26PM +0200, Esben Haabendal wrote:
> In case request irq failed, we were leaving the chip powered instead of
> powering it down again.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/light/ltr501.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 379e57ac5f5b..9d4de798e5ab 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -1571,7 +1571,7 @@ static int ltr501_probe(struct i2c_client *client)
>  		if (ret) {
>  			dev_err(&client->dev, "request irq (%d) failed\n",
>  				client->irq);
> -			return ret;
> +			goto powerdown_on_error;

This looks like a fix so we should have a Fixes: tag. And being it a fix
it should be the first patch in the series (can come after bindings
though). Reason is for backports.

- Nuno Sá
>  		}
>  	} else {
>  		indio_dev->info = data->chip_info->info_no_irq;
> 
> -- 
> 2.55.0
> 
