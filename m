Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09F4BA1E7
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824514; cv=none; b=WfLyQXjfiOeS4fyb2rI+QtcLKeo1wcUZLQB4sW9Fj1tpQtnc25AAWpQJR5avwfQlPxh/JO4b9GuCDKPgbeISK5TPbxulxXn7PfJ+Es6JrW7fZ4tuYW0gc4DUTi45Cdnl2RrDFVoylDE1Tkke1+Xz5auK4GYc57dCDW2t/ED5fag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824514; c=relaxed/simple;
	bh=pc5hKW3Rl+BujC0Y21fvHrisrTvPnKUkQmx9hxWwQ3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3X5L3dgyatyfl4bjJjnBIRBoPPrJfSodVxE/NzGKcceWna1U0l4AqL8rpEdO0hhU56REsL4tfbpl8nGq3+WKRvwv1XLrosfTNFN3LzRnSdLjjPyhLKBOKpCFg/xtduTSGlm4gSOVBd/Ya21Pq2rVlkbtfv1NsZaSZb1nZNLTJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=P3liMVcZ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="P3liMVcZ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533972e0cccso24486461cf.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791824509; x=1792429309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3wiTGTDliud7Ln/IFjDUiuTj441xbuhKgaztxNYZhg=;
        b=P3liMVcZbHqMiYUGhaVJ5XI/uw/L++Lbt2rxMjp9y2BkHLLNpGgnH/tdgpB+I/dhez
         jlxC6lNf/3W0MpNaGTmOl5pKQd7vHtMeMkI1iqiklc2BwyFrAUB3+Hmkd5aTFbZMXJ3K
         aKv4vJRfonq9Hsi7Dk5XLNi+XtIjriL9htndUcXpF2l8ppoFXQ4UmIz6/D37/G8qTyn2
         GylVY922FSwXFfjPgb+F/9Fc1glRY/0v1iN7j57MSbtLgBKtR2OUs9q4aBNKokuDxupl
         MMz1dZJuYzdQ384317d8JslesYt+/r0HZ5vRaGgKHOk/S+6sm65+nPYtJ2fIFHvzXooZ
         /41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824509; x=1792429309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3wiTGTDliud7Ln/IFjDUiuTj441xbuhKgaztxNYZhg=;
        b=t1bMqxRRbwkav/5XXRen8o93a/L3UuwX9xxaLn0uys91X8d7IK5QBw/DuO7PX+Ytpf
         JyIKXztpSmSwPY9RpedM0ymRyBWsfTUdjucJSxbqSrUDwvET9KpbbUY8hh3fHtLxn8LZ
         sB4s+KvwJrYOg1ibjuNdW4c4fAaj96Q/hLpzM+DXcuQTQDv81hA3n6Td1BQA5YuxcpCn
         dFpwlVLou6AAq1WzSQuCoshGVuij7ZbXJsRJnxpv97q3VkW83pBMCHPiLJvPUhQM5kKD
         SJXBobSqz5PtxTShB7ZoC/B62DWGTNvrYXaVILR5QCdGQ7SpirXLmGWG6HM+EG9+1G+R
         hHHw==
X-Forwarded-Encrypted: i=1; AKwUvBzPdYbtVL8PGIZ8gFl9raeMkwA+7ArImJMflzXOTlY9JnW4gVj3frhiBFtC7a6C3MKQqvBJ12md0B8G@vger.kernel.org
X-Gm-Message-State: AFq9FYLGvr4AeV4A8vgfbaKgEzvx6LLkpQnWPnilimhz91Bwv+NHS7Nl
	DVAXoj4KX24YUgYNua/hHMhJ57rqARsW5O9zxqZBc4dZ8dBra+AkyTHeCxcTorMLhIc=
X-Gm-Gg: AYBFou2c0DGnm3BaDJT3HCbyRtuIlm+OQ9mi+fumbg1oER/T+vIVj6on8d9yzyoHmzm
	T3cnmmBuXqykua2oU7ZwSYhunx6+PkiyeVz9AbYztMm1VdUadSik46M7AiM9OhiBHl5CIjDDfmd
	VXXfeNWX87HshEjVDhQpJw2RJzblAp1YRNBpiy/gd+KfAMK+sQJjcjKiFqHZwcMJCPOeG/K/FVI
	QaSz0WPsJvBi/4qFZxZVaXkmKnDuKvewpm/xSVClnUGZSSMKCRY0hGx85VSZFvPeqrlA0iXBgEn
	/5/qFoGpG0w23safHslEXVcTO5OjOnGfHeAlkN4ITZCdTu7Mggi4uLjZRUfaH/nxRrxm7r5nJou
	uRs7MmcNxfZo5UWr0NM0oiNVy1NwDvZDJ3cd1ReVzRgTIw68hDflSvklDpOTjRQVLepAjcVJ73Q
	tyk707R2T2TK5S6t9fuD/DALKeD+VDrK3bZEnrj/ZFRsQvYnMi+TpHvPIDUcF9qebt6bhpqK6o
X-Received: by 2002:ac8:5e4c:0:b0:535:1111:d00c with SMTP id d75a77b69052e-5359f06784bmr179957871cf.0.1791824509473;
        Mon, 12 Oct 2026 10:01:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b79a2easm81681521cf.21.2026.10.12.10.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:01:49 -0700 (PDT)
Message-ID: <ecab492b-dfe6-4f45-8474-cc710cfe3dff@riscstar.com>
Date: Mon, 12 Oct 2026 12:01:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] reset: toshiba: introduce a TC9564 SoC reset driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-3-elder@riscstar.com>
 <sashiko-outbox-168439@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-168439@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:54 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] reset: tc9564: hardware state initialized after reset controller registration
> - [High] reset: tc9564: active consumers forcibly reset during driver removal
> --
> 
> commit 504236856b96e78b9064b4d58c3ef7ba166341e3
> Author: Alex Elder <elder@riscstar.com>
> 
> reset: toshiba: introduce a TC9564 SoC reset driver
> 
> Defines a new platform driver that manages reset signals implemented by the
> Toshiba TC9564 SoC. The state of the resets is controlled via MMIO to a
> region managed by a system controller.
> 
>> diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
>> new file mode 100644
>> index 0000000000000..0243c2e0efd54
>> --- /dev/null
>> +++ b/drivers/reset/reset-tc9564.c
> 
> [ ... ]
> 
>> +static int tc9564_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct tc9564_resets *resets;
>> +
>> +	if (!dev_of_node(dev))
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	resets = tc9564_reset_init(dev);
>> +	if (IS_ERR(resets))
>> +		return dev_err_probe(dev, PTR_ERR(resets),
>> +				     "failed to initialize resets\n");
>> +
>> +	/* Force all resets to be initially asserted */
>> +	tc9564_reset_assert_all(resets);
> 
> [Severity: High]
> Does this cause a race condition with consumer drivers?

I hadn't thought of that, but yes, this is a good point.
We would like to ensure this is the initial state, but I will
rework this so that all defined resets will be asserted
initially by "directly" writing registers through the regmap,
rather than doing so using the reset API.

> 
> tc9564_reset_init() globally registers the reset controller via
> devm_reset_controller_register(). Once registered, consumers can
> immediately probe and deassert their reset lines.
> 
> If a consumer driver deasserts its reset right after registration,
> will this subsequent call to tc9564_reset_assert_all() overwrite the
> consumer's hardware state and unexpectedly yank running hardware back
> into reset?
> 
>> +
>> +	platform_set_drvdata(pdev, resets);
>> +
>> +	return 0;
>> +}
>> +
>> +static void tc9564_reset_remove(struct platform_device *pdev)
>> +{
>> +	struct tc9564_resets *resets = platform_get_drvdata(pdev);
>> +
>> +	/* Leave all resets asserted when done */
>> +	tc9564_reset_assert_all(resets);
> 
> [Severity: High]
> Does this unexpectedly assert resets for active consumers?

I suppose that's possible, and it's easy enough to simply
omit this remove callback (and the assert-all call).

I will adjust this for version 2.

					-Alex

> 
> Since the reset controller is registered using devm_reset_controller_register(),
> the devres subsystem will unregister the controller only after this remove
> callback completes.
> 
> This means the controller is still active and consumers might be actively
> using their deasserted reset lines when tc9564_reset_assert_all() is called
> here. Should the driver coordinate with consumers or unregister itself first
> before forcing all lines into reset?
> 
> [ ... ]
> 

