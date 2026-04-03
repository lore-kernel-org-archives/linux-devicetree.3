Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC234028B
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227495; cv=none; b=n3+9eibnwkeljf/LVQ6Rxxn+qdEW0mUsCQ4YSmL6Xg4L3FFUFdC2EuVz3d8StEFODdjDiqHvdBPJea8WFyNf71QdAfaXOw8aA9IaNjlsJFz3DU7R2L5TMGaJVmi5glH/CSSGvw/0WgMG7DIMfwJ38GHxfci+udAUTH5mWaqkOFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227495; c=relaxed/simple;
	bh=MxjZZDZZaEuYiPY927jOxN57562k/MZjNJFyBvG4prg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leyHGn4bRWKi2IFG9WPLRgZTSbKip/aLVNJBmKCASRSqq///OlRd2vk9w+3Zn9w9jammkXzOJ8+bnZnTZ99gvMS6h6b/D0LkHewEdTVFekNG4/mWVaPSDMVrCFnWWO37sy5/v6xdtcrigGV4kzjE+VKU1r/XSIwnrp5Z6/SXQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ayJlZJxt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5r6JxQa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ayJlZJxt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5r6JxQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775227492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
	b=ayJlZJxtgxIpiscjYw+fubbHmBUMY3FKXQUv1WoGsKzBQS6Bt+tCpp/hGmc+o5Gw4kGsxk
	l6R3iiC3VqUks8YDI56JfjT5C3QfNg6pVfGPz2XFkfivFnGNjiGZIMUYbGHsiO1UvKJb1v
	RFEE7+dIQtsrul3mK1hAgFl0MZZk0Fk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-Hvh8XnNzM0u-MLxQlxsJQQ-1; Fri, 03 Apr 2026 10:44:51 -0400
X-MC-Unique: Hvh8XnNzM0u-MLxQlxsJQQ-1
X-Mimecast-MFC-AGG-ID: Hvh8XnNzM0u-MLxQlxsJQQ_1775227491
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso56391001cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775227491; x=1775832291; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
        b=M5r6JxQap+FAZSBq0GEPxSQW0FvWbYodX8dBvnvn6uKNs+d++LuJR/r2kIFm1R2UXL
         4XjIMAhwvuTySzcobvh/I0dHOzbWvkwFEc33zCzTTmc7iyQ5m9lRmBYRSBScIP1NDZtK
         Ht+NEmScv45Pq+2XxVhp3Bb1tBGm3x8L4xZGh7gJWfUKKB1UH4q4Mcdtc5/yGXSHM+6w
         67lmoT8DHU2eyxg07Wn5G/SR2vyeGNoS1lRyD/c94eIBCDsoStmVz+09Ap11X9L2fCPt
         djVKSITd1NB8gp7c1Dxa76BzZZ673ks5ZbozFxIg1eZFJtGsiCMC8Ga0sMeaKTlR9mMm
         nEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227491; x=1775832291;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
        b=kSKOvIu+TVl+5nzVGEuxesEhPhb7DBZw7KH0fj9amy02i1SWboVu8ev//Q53W5V8CU
         qsPn/uQ5udLZtr0lLanv4ee/XTFjKBSyQOhNEdAMop5vzBfAXc9gfz0JKbWZUB9If9Fy
         G5mpBUSKh0Vy3fM8mXTfm/dvMi48XalfUN0M5QInopN/uw1qFVymx8nR0lEQ5DV/CEKU
         Kmrc69zNT7ivWWu3q3WYbDTQF2+zeRBSaW2UyeTWmhqrgMbLYPBSnm59mHMlcccLeuNW
         ko4d5jUSQVJUw1hkJNOSh58lgI5IABAlfmRmGG2Hq4p3HJPZ5tIC2byQRlZmiNGX9wYJ
         FX6w==
X-Forwarded-Encrypted: i=1; AJvYcCXtSz54g7pTx9ocCdoW/DpSgM3RjWHpdClp8TzIzxt9oYBmj56CFwi6Kw3qPnighv6jH/sCIGDwIy0u@vger.kernel.org
X-Gm-Message-State: AOJu0YyItgev5mcfVvzDXRrZiJ8gePGPVG7eCcvWyoqFvpb6fV+um8R4
	KdL59g6OdmP2TbX+oe1vDIxxi/7cYTIJXFaWQtuMIDk13Js0oO0U3JEhGa9g+jN67e8Lqg/ym4Y
	1XTwUR3Ppf7llLj5xDPGP3FCNcT+WU7Dxum1fBLIwUcriOZNrAhF1BpjVLEum2ec=
X-Gm-Gg: AeBDievmoqy+Gqi05w2dFieLOyY4R/D4C/js2D9vgCVlG4RV/zFk1DfWz+MlxaMirwG
	QXFA88J/48/iMZpadpzD0m1PVpshVp3ylWCAltBVHNFR4G5lrvQiy9ZSRdnVWAqHh8RYPgCDF94
	Pzeg8mBmfSMEMLSpcZVKUPEVBfzLzPAYJFEADyIhz+WKeZ7A1ClVzb6DzN3mIpry3ifICq4WUp3
	cHrpudqbm3jaaQ9N+BQ0/Q6Il5Y7HmjOS4uyoe0beat9mi3GN/hpxOGMK8KpzHGPKPvdcweT9gj
	FBGVG0FT4zkbhVf1SEO5P7+KJxg7JERo2QGpQaA8z4pkqBMQw0xkiRZpiR/PBgfsObHwOSIdN48
	toT1kPSZR/+3fkggxncZjxNSeSaSg1p4ehQRoeuX1S5S8PHN4JGRiK1ca
X-Received: by 2002:a05:6214:2a8c:b0:89c:6252:4a4a with SMTP id 6a1803df08f44-8a704caf687mr51587066d6.49.1775227491176;
        Fri, 03 Apr 2026 07:44:51 -0700 (PDT)
X-Received: by 2002:a05:6214:2a8c:b0:89c:6252:4a4a with SMTP id 6a1803df08f44-8a704caf687mr51586656d6.49.1775227490715;
        Fri, 03 Apr 2026 07:44:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm58197296d6.22.2026.04.03.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:44:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:44:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <ac_SX1UJRqiBH2iM@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Cheng-Yu and Yu-Chun,

On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		return ret;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);

I should have checked Sashiko before I hit send on my last review.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

It suggested the following:

    In the Common Clock Framework, .set_rate executes under the prepare_lock
    mutex, while .enable and .disable execute under the enable_lock spinlock.
    
    Could an interleaved clk_pll_enable() corrupt the hardware state by running
    its seq_power_on sequence concurrently with these multi-step register
    updates? 
    
    There also appears to be a potential race condition later in this function:
    
        if (is_power_on(clkp)) {
            ret = wait_freq_ready(clkp);
            ...
        }
    
    If .disable() powers off the PLL right before wait_freq_ready() is called,
    will wait_freq_ready() poll a disabled PLL and erroneously return
    -ETIMEDOUT? Is a private spinlock needed to serialize these operations?

Brian

