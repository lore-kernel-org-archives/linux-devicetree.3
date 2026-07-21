Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC163AF643
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784677136; cv=none; b=IZc3lItGi/y6TIKks1/7pPBf/zIq8iMBX8BIAinT7sGPCXkH4qsboblTkIVvRZhSMcAOVkkE2BtAwW6QhNuM7SZosmH7y2twxyU/vxpftyladpFmookrJckNnd7MFkEaQDT+Nw9ne64wfwxmkGeSeJ2/WM/iqLSTD6ZRdgjVOs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784677136; c=relaxed/simple;
	bh=CkGazRlSLBpgXuYuVKGSoZ0MS3eO0M9AdmbY/AcqW1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0WsYw/T7cDRApI9dNU0vhogHHGfJfztRJPLTSSfkiWSmaZpwDRkOWSSsgfCrLlujvPffr8VilspHJhZeJMb8hl6XmSkX9L5C1Uhgg9VFN/De6zUI4xg3OfRR/7cE5Hlbi3j/Ky3MsYwuTQtQ4Pt+VYinMMGYqsKlvhmE8zR5c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7C4itpO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cF3w0/t2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7C4itpO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cF3w0/t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784677133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kilXo1oxIH6hK33OgqJOAGTQt22AcFxstIL18rwWXUU=;
	b=N7C4itpO/cz3lHO9Uv7JwO88EypU1UWxrQdpJaiGDmXw4Kh9iXgIMVD0ZY4KrEsq1scaP0
	L/ph6Ees8Umwy35DvIHbBKKzJ7HQkc1YnZ6XxLzZoVl9cB0bp9nkBZoIxAisBlBZKms0Fi
	qUoeinupHzxQFh3YOiNw2//+k+PwGTE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-xcEyuiz2NAeU6hiSLfaSJA-1; Tue, 21 Jul 2026 19:38:50 -0400
X-MC-Unique: xcEyuiz2NAeU6hiSLfaSJA-1
X-Mimecast-MFC-AGG-ID: xcEyuiz2NAeU6hiSLfaSJA_1784677130
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so1160054085a.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784677130; x=1785281930; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kilXo1oxIH6hK33OgqJOAGTQt22AcFxstIL18rwWXUU=;
        b=cF3w0/t2fQgE2DytEk5lleCSW9y8g9kpJssjZby5evuzBzW66zBeGYdkyndlNI42BD
         f4ZYG80jCCN6Vul/si71+KHFwXjnuAZcfJrFG5/lNxxl3j2YOevGSaL2c9QmoFKPHjiC
         26dCY7ZH2Aw1RrqMm348XE/ERIM+ASY6+lT4arV5cUpf33fwwJLD8xDKtcyiQddyk/qN
         77pyrpaany9MVfLTW6GdLCaGS9G2ufUCzEZRjkRuAK9LUST4uIjd0ZwWK26z3KygA2pt
         ln0kQ4aohiXDV2Cv3hlXmCY0+CYpcrMKywBCTmpzJHUmOUFC6F48bs9aztlL0dN93ytE
         uWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784677130; x=1785281930;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kilXo1oxIH6hK33OgqJOAGTQt22AcFxstIL18rwWXUU=;
        b=Cqxh2U9oJ41wQu32JH2+pPIHoo7TfX3wrvRe8ybrOLM5CESO04U31zZtbcnx3MuXAe
         CGcawfCK+4YXM+X1xtfXArzR2rls1y3qwqQcZtFuxHehvZy6X5xZM8Wxk8C+vKsajAmd
         v2rv3laRWnFVQnhdy8tweWIkOeNcZHsDZa/PflXMF02mw8ZC91xggGP8g4XQKd+brEDm
         9XIXTb7pBgJjsDAgH0EaUwFUfPnVlaRjrJUmR287NuAqr4YaMRBaVgbrYEcig5V5K1T+
         qHvw07wpSCeqtuFnW7uWil+ja7w2PqiwRxMjNNnJqmq+yKrhNhRjufvSZmhUKdx4RRbB
         o0ew==
X-Forwarded-Encrypted: i=1; AHgh+Rp1lwDYGDEjgW+LofIPcI36v3i7enYbqZr3taRQKlKYXDhyrw5YtddTqILq9UnfTaYmvio+Hqy/T0w9@vger.kernel.org
X-Gm-Message-State: AOJu0YzzsdUad5wMRCeqYaEvNYaGJDH9Z2Kwltk5Ef6Bd9OTPIYtuTy3
	LH/s4MDkhhusSf4zwX5YB94MWXkZUgIkxGyFn/UCZlMsSNM6CVUkfTPYq1nwvlopHFk/zqOvMB7
	nYZu4i86kx+S3fEaTgN65yZtEyFC4LgZEgyUVMe2CGHMgU5QBzv48C+RnUXeKoFU=
X-Gm-Gg: AR+sD11mNOry9/FRRZQaHagH3Q//UKKfR1hbMSNdbXAQ/rEP8vZacxjqxsg3j4IUDwK
	Pl2X8DjbyVjdoW4r2AwViUltehAwmax0yNAMQ2/ACNgpTiLcB4RatePIvnd6mGER1ke60LSl0WV
	lyRmEkOoUIGlYfHq8V1I87d+xF0LKW/MMb5QTDMeC1JGrUtx9g94tcbR14XBAGYSoUDmGC6PqQV
	hAaGxsSWfB9fCsgE0n6GaU6JgOdCUQjgu7Ql8xvVGDre0fkK1GZ0Kq7oet3ne6/UYocDRMrCCiJ
	RlnnQL9lJX9m3vx4pdykwTePeuBLiPDhm1XNE5W2MORcrxekNlCBTFsZOU6a+3BaencbxdJEqRV
	oW7B49BG3AG8jNbNVbuAkep2uJJBZRs4MjMo=
X-Received: by 2002:a05:620a:a489:b0:92e:c0ac:aeb6 with SMTP id af79cd13be357-930f302196dmr161608085a.40.1784677130006;
        Tue, 21 Jul 2026 16:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a489:b0:92e:c0ac:aeb6 with SMTP id af79cd13be357-930f302196dmr161607085a.40.1784677129543;
        Tue, 21 Jul 2026 16:38:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68a9c76sm20047685a.13.2026.07.21.16.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:38:48 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:38:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <amADBr_DnBeGh2jg@redhat.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-9-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713155630.3054636-9-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 13, 2026 at 11:56:27PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v10:
> - None.
> ---
>  MAINTAINERS                       |   8 +
>  drivers/clk/realtek/Kconfig       |   3 +
>  drivers/clk/realtek/Makefile      |   2 +
>  drivers/clk/realtek/clk-pll-mmc.c | 430 ++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h     |  13 +
>  5 files changed, 456 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1fffb1fc5de1..0c8b98ecc4a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22747,6 +22747,14 @@ F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
>  
> +REALTEK SOC PLL CLOCK FOR MMC SUPPORT
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Jyan Chou <jyanchou@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	drivers/clk/realtek/clk-pll-mmc.c

2 of the 3 names listed here are under the new realtek entry added by
this series. I'm not sure how common this is but it seems overly
granular.

Brian

