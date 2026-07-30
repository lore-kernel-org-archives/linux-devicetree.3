Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A15243F0A7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429207; cv=none; b=APW3gMY6v3MJbj0A1jaEuUASePct0NLUQcdofIpX3u+RreSMVQ6GGrAKuVjuVip0deTw2fkM8D5+zg/JI5bHaMrV59rVWqK6TH6v/636NHUo7fb7zYx3wlisxjTPjkGLt9q/awRsVn/YzrnGr+F2+5bWGoTIcdQuJlSXFhp0CjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429207; c=relaxed/simple;
	bh=l1ohcCiL2vtbHTs0waGuxxnEle8Z8bbukG23s4TXt2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdbIuYwFYcTivJsbdgIhabsFxCe6Q/cHnRZGwRMQ4GZSNFFeA0JHEqaAYKFb82beLPMS68ljMAfR2BOCd+n/+bSDqs/T3UnkfJcjLs2AZ9zMPmp29pMmJVr8CuPu7sbcKpMBHITYNGo24RvBhubj8CsIcApkfHGk0vype5fWqrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqoI2D0Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8ZrPY7p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqoI2D0Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8ZrPY7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
	b=fqoI2D0YPolh+zoCVdXByhJnbNeYzI0VOp2pZxj9A/LqWYIZ9yV2x2S7FR+CEbZLmqr/dz
	s9Xl8pVVFJi9Tzgj45M1bJIxqQgYCTlOtUzfp7hn2b9V8pUQz7kB/uAKkh9nf1Ow9V3Eq8
	1fw4yJEAM0QfdzZlmzW0GoLkWKNE8Wo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-6XSgaXQ6MSqYZWGpHInYNQ-1; Thu, 30 Jul 2026 12:33:23 -0400
X-MC-Unique: 6XSgaXQ6MSqYZWGpHInYNQ-1
X-Mimecast-MFC-AGG-ID: 6XSgaXQ6MSqYZWGpHInYNQ_1785429203
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6fce9ed7so176397b3.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429203; x=1786034003; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
        b=d8ZrPY7pyn6MctXg+MUJlIK3iAhBGN9meHyUsdCa7UQvhZrkYOL/nHvuBboVRpCpjF
         7zGCvoqrXKaamNJTOEbUiFGDFHIvy6/1Y2SHottCmXa88K79PpINtQaiGH3q2xsTMoQZ
         oheGRn/+4qhD/QABR66oibKpIsGemzKBVaZ73wF3x+CXr3FFpF2+WMLnHa3y56/KUzmm
         8IC62un/Ood1ZG9DtlP+InNYZ3+IKITdV1vfQtL/7GCWS9RnYPipYeDYTyzIMbA5Sg35
         Su1ZHIzcP9rOXcs0cglXo0iWdrPLAT27dbknhTmQ0InZOa9oi3Vdk4kJDtvwBTQJR4/x
         lxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429203; x=1786034003;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
        b=EclGu+ic2qJKNtxd4S3xx3gBQ45J0PaWpLUx/F4hRn3Hrji4MRZRr4yd3LslLNYSJz
         K6JuxkWoVB3U+jXwZ9wNnmbVJ4huuCzFxF9hjh4dm20V5Ovb/6vZJcgKtJe1/ZoLINMl
         RXm82+SVuZx2l+S22n0x6jIVAK9DJwLNBufFY5hBBtHACM7ITF0Gh9ckqBnOm4mKGl3G
         245J3HyAZl374K+wt9jrpYMu9KipFPa0iBTn4erRelFteFjcWXnn+r1DNMoAPEuJEBU7
         3ek6wM1SGxC3lSuuisJYaybLiy/QgHQ2xVG+MnXNBgA7xNiu/FrLqig0DltlCnCruNBx
         COGg==
X-Forwarded-Encrypted: i=1; AHgh+RpGB/LOTXEsZ4OpB5Qy+waw7iHUBLKDKtPQHt0Aj0J4O6OXFow8GmJjkUo3gBTOmMgd9uDSVcCn1ft6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw987OrtQ4K1TIeNQL079LvXbWxMgVzKyEby4Y06EqRxDVnNSwJ
	mI1diNAdrJRY/l30sK/LSAHx+0b+jcNieCTYZ609IKcfkr/bGn7NttYV3tLgPrcNMyxBdB0+V+S
	4oqY5QA3CHJ0mRS0Jhdaq44oRK5NGNv9nRvBJgMKmU4P1qDT2YJNaRTaeIXy6EHQ=
X-Gm-Gg: AR+sD10AHmifVUfje6NrcT4UAtzG+IyKrroyp9ZMxG9hSRwtkzM3M8sTJAzvgvK+Nr7
	npXrPhsANnHlCgEEc2jkFX3Ax4bHtvQ1fNoV0nfDpcpeSeJXSaH7x+qWdZyI6PoV2WEQ58EduVQ
	zOPqYFrrJbdRSwU+Bu7es//G4rjR+H2xYL8fCqWL6OdhWvNmprcZDkQ3zoCG4VwBekntuUoutfH
	+raUH2Rb91FP6ThXxIL3SFYX5PDrNpMUC6f39vLU7LZD2dwOoL6qhbjRaJcwHMgLo3sGd0cz8JT
	crg04fL9AoNaX8Byzn7B90Fhojp/02HNiuTC2tAHxsyZu6TDwSzL2rD7iiuUFz0gfPDjm9/HFo/
	pjurXHGGZXl29FjsvExHwBBLMgQxOBUs1JEo=
X-Received: by 2002:a05:690c:9c05:b0:81e:68f6:f842 with SMTP id 00721157ae682-81fc1dfc3f0mr7119817b3.3.1785429203077;
        Thu, 30 Jul 2026 09:33:23 -0700 (PDT)
X-Received: by 2002:a05:690c:9c05:b0:81e:68f6:f842 with SMTP id 00721157ae682-81fc1dfc3f0mr7119457b3.3.1785429202515;
        Thu, 30 Jul 2026 09:33:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8ac228csm12990017b3.35.2026.07.30.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:33:21 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:33:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 04/11] clk: realtek: Introduce a common probe()
Message-ID: <amt8z3G8lIitanMm@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 28, 2026 at 10:27:59PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

