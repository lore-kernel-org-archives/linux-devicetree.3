Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348255;
	b=vYKC8FP1TR+pBqwz7uh60+WWpVnp5P5XmuzfEBIFaPeguZd1TLXv5nPR0dBZSVeZy0Hn
	 bf7IiwoEXwOSocAGzqa4eWSuKDhGVmL/spvIWQGEInZZg1qNpv39fHpIKBG1q10BcHBlE
	 MigXGJrBfuGNsGSGBu4FPaRy02BDUO62ijhpXxRD34LNsL4rSRKEIgcGNCWEaeLSVVN4T
	 mCn3h0QNHIQRDuQa2KS3fX2YbZlZiR8F6Mdh6b2RMa963QpYnee4tNVapby+IFCzffcIv
	 7zfhxuhiMY2gb9/5rbTC6xYHWz01PSKMDuSlz+cs/haFdEPhKA4JYDNixYWT0r7smOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cB68K9VszL8x8rzgkP/c3kcIxRgyD3G47ftVYkV0bxo=;
	b=MqJ+LOHPSZKlRwh8PlBb+h6UNqaqAKAI6lWkaG0Mx6hLG05+NlZpECRxCPFCFZoCBpI2
	 9yJL6Gm/vgHM2W1vQkcuPTUqW6xCrxIbxqc+/tTZL2+ddJSbIedmOX6Fb1GFi7qaAASCr
	 cFWg6Xf2MqKL1mSBXSWptsdOGgqLaCmAF4Wyewrntlhzla7iVsFKMUgsD5ioaLOPrP5Lv
	 9OG3BATCgz1OjS615bETq40cl10xG6UwuSeYG/Oy9jxKcb7KLVzVAUCvRry/x/sfa2IWH
	 oSzPZBtW2OLsyJGxJgAOOuQHYg1BaL5cmSG6ZNtafn7wvArNwc3nd3iZfDaejvulHaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BXTr1Cpc;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC5606A332
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DC5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BXTr1Cpc
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso29902675e9.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795348253; x=1795953053; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cB68K9VszL8x8rzgkP/c3kcIxRgyD3G47ftVYkV0bxo=;
        b=BXTr1Cpcmy5ZiD6nkwYf1A1L9ZCyVYQHqcj/Y58abuAg0pgE+RhWyVUsieT75cDdvA
         yXOVqq9c9hQTpcmTAl3ScYgP2+pzG94AUnd7Uu4iGgq3E3TMY3RPgcYFU8CIhyOXkAtQ
         6QXhqoI2wKBNCHgXsMWP+XUqvnAlFEPs5i+BUSiOmf60BkH8bKtqwa8wsOG0qCTCUyKR
         PxWNmxMZi9bt3P9i5qg5gwa1pMbvEjvVgMNHP4YDTedsiWQiXKi35IBNUoW+1g8DA+rM
         3l+Y3vBncVdAEAdSfwwYN38uSr/9Qvu50bGdHuTrC4i2USUQZeZDuVTuAPEeaNczUs7c
         a8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348253; x=1795953053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cB68K9VszL8x8rzgkP/c3kcIxRgyD3G47ftVYkV0bxo=;
        b=Zio6FX3msCLEZ93Cuo1nIQYuY5WlaOxuXgq28gBBC4cuVHCP1ZaQF5397FOL18BJla
         ZbsWRWPsVOv2+IiDy2t5pgx8bM3gGjH+OwaKWyk/o4/aavntAlIMsckLk5JNBK//ct3g
         1Fnw4ojtUQK1qHngiyGHEsuwjFbm53bnrZG9rRrNKtp/oi2kmNNR5G/LXSYHjMu/xPb9
         egXQZ0mBCnYzbgzKfFy1Vphs1f7y16x76TJNUYxwkxO0Xi5HI3d6fe8LQ4PGcRQREHxP
         UqR6dk4KZ2WBzTEtH+HWpkvNd35EIzuAUMgzpzA8OkIlJ4TEkZrQtI/9byIVPDqVTi2+
         hcdw==
X-Forwarded-Encrypted: i=1; AL+hErEQJSZ7wkPsH7vWZ5lw/JksV3F/7dfqEkICbSsyBzjMkzdElc7NZoabfCgA9TEhFnUx0YNxWzXapVZF@vger.kernel.org
X-Gm-Message-State: APuU4Z+TY7hsautdfX1nQm80sevVIzhtVLfRkie2e4TLP29RMgRpJHQ1
	enPo1XHunsEfw483uasasas/tDZugA6bypZuniiIYu7WyryCoOVLbCH9ZqDZBBMsQLLImaSXWF4
	A1Xxolf0gfQ==
X-Gm-Gg: AZFdTZeLam0wyO9NxGifkyiGXK5SzRqS6PfY1dK2JhAaLfhqRHgvwARBVEz41iMn1yP
	r+1zs8MJfc8KiR7UmHzfsmznLKtJdXCrX9xeOhi9eM4H0DNNqhnSk6cQTkb6uFXaDHqJiBaXi9k
	hgWm0DQnTa/dJKaRd1VxOqdP1Ni2UGpZUqahIbXYR7PhC3YB+Rkyh2fIJIoxUkgFGNb/8IpqYSj
	JHCgbaI1GKvdYAPWzJt/IccN/oczKZom/obDuVYqZcRorf9Yxv34UnGNCbxVVPAUTnNe7Tdi8oU
	p2XJShEk+ME3FMD6gqTz1KaBDfBZLJ1lu0aoerk6nU9c/mGeTiENqIXnqyxQzcQnS/E43+wsw0O
	Aa6NGlEBMpR2wp9j3ND+KWdZarDS0rxQck6qCvy5i9mX4oiOVukF7vzfysajHHKGWjVXITSO8hd
	UNSGWujI1B6Bc7F0cXJFmgDtirsjuDt/LlHSjjEtyDnFSJsFnjyBSfcgAJeEkHxEo04DIVVDTWA
	SV63JqXQP04CAVd0tk/qKCHG/dZOj0v6raE7K/UwzYZN89Q91WXa9jQBG8mCe/NsmTzVETKPkI8
	9BQiQlvzu4YzoQf1zLZCH9XQ6yafRSRDQ9pZKx46R2BjbEQe
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr173405365e9.7.1795348252406;
        Sun, 22 Nov 2026 03:50:52 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm224616505e9.12.2026.11.22.03.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:50:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] clk: sophgo: Keep SG2042 gates listed in
 protected-clocks enabled
From: Jerome Brunet <jbrunet@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: gaohan@iscas.ac.cn, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Yao Zi <me@ziyao.cc>, Chen Wang <unicorn_wang@outlook.com>, 
 Han Gao <rabenda.cn@gmail.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <awIs42O_vJN3gB7l@inochi.infowork>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
 <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>
 <awIs42O_vJN3gB7l@inochi.infowork>
Date: Sun, 22 Nov 2026 12:50:50 +0100
Message-Id: <179534825090.2640804.3856644920774930042.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=IdvAZSlfVMHZbcbQ9G6YqRxqWmYmrg7EOTVCXlS1rG0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNlM16Wzti9b2Wcj+sZr/8Q3E4TmvSufv1fHe5WQhkfj0
 X8WB/JlOkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRHVMZ/sf6PNWvYa1VURFr
 F0ydaZ7j9G934ovvrXmKRy+Hcz3l+cfwP++79vPLcQoXdE3O1TXcuHF2/95D0RMVjNUXfO+d4nf
 BlwMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-22 07:48 +0800, Inochi Amaoto wrote:
> On Sun, Nov 22, 2026 at 02:18:05AM +0800, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > On Milk-V Pioneer, EFI runtime services use I2C0 and the serial flash,
> > while Linux drives other devices behind the same gates. When those
> > devices runtime-suspend, the gates are turned off under the firmware.
> > 
> > Mark gates listed in protected-clocks as critical. Unlike qcom, still
> > register them, since Linux devices use them too.
> > 
> > Suggested-by: Yao Zi <me@ziyao.cc>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  drivers/clk/sophgo/clk-sg2042-clkgen.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > index 6abc2c973c49..65ab18f701e1 100644
> > --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > @@ -840,6 +840,18 @@ static int sg2042_clk_register_divs(struct device *dev,
> >  	return ret;
> >  }
> >  
> > +static unsigned long sg2042_gate_flags(struct device *dev,
> > +				       const struct sg2042_gate_clock *gate)
> > +{
> > +	u32 id;
> > +
> > +	of_property_for_each_u32(dev->of_node, "protected-clocks", id)
> > +		if (id == gate->id)

If you are going to do it this way, restricting to gates looks like a
pitfall that would difficult to anticipate from the DT side.

> > +			return gate->hw.init->flags | CLK_IS_CRITICAL;
> > +
> > +	return gate->hw.init->flags;
> > +}
> > +
> 
> I have a question on this: since a procteded clock should not be touched
> by a driver. Is this logic necessary? I guess this is a shared clock
> topology between the kernel and the firmare?
> 
> Regards,
> Inochi

It depends what the intent is with protected-clocks here. This apparently
starte as a qcom specific flag and it might, unfortunately, be a bit
confusing with CCF existing concept of clock protection.

CCF concept of protected (or exlusive) clock is basically a clock that do not
tolerate rate change or glitch, resulting from a direct rate change of the
clock from another consumer or one of its parents. Essentially, all the tree
leading to the related clock gets locked.

This is accessed with the consumer API clk_rate_exclusive_get/put().
CLK_IS_CRITICAL is special case where the clock is locked and protected by
the provider, even in the absence of a consumer. Consumer can still get
the clock, enable or disable it but it won't ever result in the HW actually
turning the clock off. clk_set_rate() will error out if the request would
result in a disallowed glitch.

Apparently Qcom use of the flag is to skip the registration of clock,
presumably because they've got something else controlling the clock.
An alternative to this is register the clock with RO ops and NO_CACHE,
this way CCF still expose the clock but does not touch it and you can
still get it in drivers if need be.

-- 
Jerome

