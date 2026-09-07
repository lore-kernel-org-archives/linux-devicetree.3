Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53587501F30
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794567; cv=none; b=kHxdAwI/NA5agScYSEx0dKzHUNehkWaj0WX7STSehSjPad17LgYC7AktAXfCIODG/4W6Wu3W6KPTka5kDeMpiL6qzOcjcsng+EQ56X9PNu3YmzaOxG70QIYnr/E8tGyD7rATUrpn8FzcKYvWadkt1DD9WZTZKzS9+BbZsRFofN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794567; c=relaxed/simple;
	bh=jmfCKOrsEAkeGu4GxNdLlIPtSWNSStX+SxoQ8W3mBP0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=HKhg43pdxN4yDpCyOIPJOx1EUp/eP3sS/L79spQ39kqUp8ZZgzp2aKTxGzQlcnpzhUipZKfe/ZmJ+fi5CWFpnc+yr1S0YZivKAqcAWFflq2RDUY4osXpZX1lrF8B69fyef74UZblhh70A7E7lxXHESjMBQQ8gPVs0zCyCQVuGBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Zyr6KoKX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Zyr6KoKX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0d2d37ceso8897085e9.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794564; x=1789399364; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5xsM2PpkE3MzX+tsKcHsoYtIZRtT3xChs4/YMhT9N0=;
        b=Zyr6KoKX5ns6XsCuWwRXFOJKSZPUFP6fwJXE+ITi7WYbpdwS3OyZb69/QQDCJCv45y
         HE0VinUJs/LVdoloKO/xinKV0fVZrXAKeGKw/DNEUzvrmQgqETkg+BjEC5dWyLPC/LrL
         YJO82YnwdUMpfvmLW27beD/qceIQ3hVXZUD7QxEIcB+C9Dz615RbpUzjbKydkyaxmbZd
         5NF+ooQNYF+3y+UTuiGP0HDhcktm0qQpBLY8//QqJgz/5gte3NLrncqGKTdQp2kou4fC
         LkO3KuXeNxjYjxu4WD1G/O3LHpA0wIWSUEhQkyLIaCogfVyawL5ToZpd0o4OrFqdeBur
         oh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794564; x=1789399364;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5xsM2PpkE3MzX+tsKcHsoYtIZRtT3xChs4/YMhT9N0=;
        b=drI2Z0RJ9qu9L/Oca9mXCfrrJRon6Z0EPHVlC1yYWOXnhjqfyN4t1hdt74ZXFBeONZ
         0mFywayI6zCmTMxD1DTcLLvsvcctr3WYnutoBI5+mapF8cgSRmO5SJn0dOnzG8nqr/Je
         iyq/jxJMfNqrLMcoWZ1GNDnv9YdRenZiPv/UaBqB0O5vF+KxVqNieqciEzTxfcKbzjGc
         tIGUSfSsRI4KrggZxPOUD8i93U+oT4NM7sirBGfts7y64N2CabudSkfvRWAdzzKdtDFm
         b9U5d5U1ydsytu9iUgR/YpqL3FqVb+m1QnHeHBK3IBGVe7yx8/AuqonnFBU5AoaPQrY/
         zsow==
X-Forwarded-Encrypted: i=1; AKwUvBzV2GUN6cH9pMCjx4ZnwTrWl7ss+knUYh4YOz96MizTUlusuztG1XAqwT/Nr593mkm1znb2Fv4xWNKK@vger.kernel.org
X-Gm-Message-State: AFuF++nYrWx7nZkDmptvjcf7DNyWHUb6s87/ZHcZCw8fjaszwV2r8k/T
	McVCNnyIbLzkRZ0yS4mQ+NHdbCI9j4H/K1mxDqbL3cS9RwbhJEpzoO1DAwYx6ZCicbR+H/k8ZoX
	jivZ1euU=
X-Gm-Gg: AYBFou2nE/ekAa0DXZmazM8c8Py/rlEeAqaaiwWH7qEM8SBEKpbRCTCe2F7GZxqTQ1y
	T8XgZfHh2xV2UCBlrjDWQLbmEdq1+Th9aFehIwGQLYLzePvviUWTGphdjuqSmenUuB1QYiYmTlV
	AfqlpEMSI6pdAAVHJSKR7B3S/+Jw/k2edjMVTZUP8jdzSzOBpdJCLitfd+jEfqNiqf4u2x4jj4o
	NDokgwUIqa0wE8Rv9n9U8wC97SgfVeZD0/sL4MpT2zIwvoiZdsbrsV1cbJVBvnyWiTo/nASYwlg
	MGexZJPAuFp+m91Is3PRdqT3Mvbt6xWeg5XkziowUZrXyqF4h0OYtwozgS4pGNnLdtt0uV3Li2T
	+FC0uIJdsKEbsniGtaDsQU0BWF8ve37JtOtXpQkzs2iUWasSlk+Fs8Hz4eat7A8dkh+lC03UrLx
	B0EIflHuoooZOEh7CWqBTGbkyVFNjoOHBhGXK6objWruhC/ylEyczB3ya9vf0NtdokIOyU6rTbB
	uzIZVhsE7hwMM7K9BwCtkN6nNCT/KLH
X-Received: by 2002:a05:600c:3b99:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49cf81fb72amr250088355e9.1.1788794564491;
        Mon, 07 Sep 2026 08:22:44 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm288319375e9.11.2026.09.07.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/4] pwm: meson: use bulk API for per-channel clocks
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:22:44 +0200
Message-Id: <178879456435.2256446.2005394820666057840.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jmfCKOrsEAkeGu4GxNdLlIPtSWNSStX+SxoQ8W3mBP0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntbFBsgbKyAhkkOJh84p2SvPyoyzSRQxstw9D
 3A9Z/x836eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7WxQAKCRArRkmdfjHU
 RemCD/9wGgVpKIFJRn8V0zICx86yvsAf6Pfmw2+t+HFAw/vPmcYJU+bEl+gXhNs+6LadQTaWZgP
 Vf5un+G+NE2CloSjsUmEkSlIUP2vxAhKXYup9NC3Lq399aqtzRnP5BqTrJp2rQQ/JeX5s0fDCna
 4EdhFl0ZMgzvr32vurCm44ZywSUGEWiKuGh6t5/0ApKOt0hubBGyc5h8jB5cxAumR9ovgGQ8xUy
 a0dKoglN5NWtk5FQNyrkDOKGIGoPTv7FBx7/ejivTWfRVvmA3EszeGZZ0SGykbdPVj0a9B5vnQE
 agxxO7E1xb7Uxlc9y7Dfgspf3eNU+8j8vIitR0BGPubc+0g1M/X1nwiBLcGCdnqcG83PZgnTuhg
 lxf9rLZcSQTDlxb7016YbagASF6TYHqdoRpHvg5olFqs+3+Xi4Qzd6Y768geLSEsb0J15Xg6+9o
 ytO7ADXO155fq9rdpIZBvIDekDlvfTGW91Naur8Qb3jAAq7NHTVvAkRkUeMRPgz7R6egwCGaGoS
 NX0uBEDW1vmlya4cdM5iMGhR1Jq5javGzdX5N1mF5gxmCiFjpkCMYLG6h6KedB0wg9SRRtm+p03
 VKjXhlKgR9SKCbnjfFZFUUOlugy5dbqSGld55eFhblnv4GNTPndXjvQ49fK9A64ZuhFLSAsdBVt
 9XRe2nETnLlSo1Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

> The S4 PWM driver currently gets each channel clock individually with
> of_clk_get() and uses a custom cleanup action to release the clocks.
> 
> Use devm_clk_bulk_get_all() instead to retrieve all per-channel clocks
> at once. Verify that the number of clocks matches the number of PWM
> channels and assign each clock to its corresponding channel.
> 
> This also allows the per-channel clock initialization code to be shared
> by Meson PWM variants using one clock per channel.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 22cefc6d5dd0..6f151464d7cc 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -497,33 +497,25 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>  	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>  }
>  
> -static void meson_pwm_s4_put_clk(void *data)
> -{
> -	struct clk *clk = data;
> -
> -	clk_put(clk);
> -}
> -
> -static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
> +static int meson_pwm_init_channels_per_channel_clk(struct pwm_chip *chip)
>  {
>  	struct device *dev = pwmchip_parent(chip);
> -	struct device_node *np = dev->of_node;
>  	struct meson_pwm *meson = to_meson_pwm(chip);
> -	int i, ret;
> +	struct clk_bulk_data *clks;
> +	unsigned int i;
> +	int num;
>  
> -	for (i = 0; i < chip->npwm; i++) {
> -		meson->channels[i].clk = of_clk_get(np, i);
> -		if (IS_ERR(meson->channels[i].clk))
> -			return dev_err_probe(dev,
> -					     PTR_ERR(meson->channels[i].clk),
> -					     "Failed to get clk\n");
> -
> -		ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> -					       meson->channels[i].clk);
> -		if (ret)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to add clk_put action\n");
> -	}
> +	num = devm_clk_bulk_get_all(dev, &clks);
> +	if (num < 0)
> +		return dev_err_probe(dev, num, "Failed to get clocks\n");
> +
> +	if (num != chip->npwm)
> +		return dev_err_probe(dev, -EINVAL,
> +				"expected %u clocks, got %d\n",

Small style nit: the continuation arguments are not aligned with the open
parenthesis, whereas the dev_err_probe() just above and the rest of the driver
do align them. Can you fix it please ?

After that,
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
