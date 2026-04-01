Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F740757F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051759; cv=none; b=k72EFzgftoD2rNGTUtGhNdawcDVxc4GTtPIlOnpxmRslBCPVeVtSH/GKqiqGUrOLhMq2hu58jBlnXu8RAw+JSpYlwqToiGVxkCVVp5h/XugYXl8HuZIGkQ/6sXUe47zLK6K0m3nUmb9Ru56TkZqaOtsUExB5cDRMT8JjlfW5ThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051759; c=relaxed/simple;
	bh=3PXNhSJ6bUXpoMEX2fDn34qnDX+e44HuWuIur7Zph68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbqwPnzDyPvAgUtOas94zL8DGGC22Rh7CDwEh3JHin6a7EXSpNRlKVbe67xxpvYf4OHb0qMJ4l33bwdeXrq5Xby6GxZU6as0Pd5Wqh5U8jZaLcIfhl4LheUqe0Y3a4HG6qhjOKcTeSi6OyoWAwYTa9Oi6O74O81x/11gJGkxKzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WkKjBctV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NsHhGQUH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WkKjBctV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NsHhGQUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775051757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quxJoJV99aTQ23EktQqX4tlfqV2G+rFHJBvPV0aOlpo=;
	b=WkKjBctVXCVl5RQxebthsfCsDjqGaokR8Dki7Eoumdj2XJ3KrprgtGHrX51Y/KBLIvZM+i
	g1MekN47vkz+4zlgO7I2u8mr3eJL+2f0Vm/dXvR8Gn7VKQ6iueMwCzf6J90geQtxxVBOK7
	jAwXQat0u15eijp8r3ukxn/xcCFEIC0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-I0gx9txiNySFkRtn4Zl4jQ-1; Wed, 01 Apr 2026 09:55:56 -0400
X-MC-Unique: I0gx9txiNySFkRtn4Zl4jQ-1
X-Mimecast-MFC-AGG-ID: I0gx9txiNySFkRtn4Zl4jQ_1775051755
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b878a8c07so144204651cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775051755; x=1775656555; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quxJoJV99aTQ23EktQqX4tlfqV2G+rFHJBvPV0aOlpo=;
        b=NsHhGQUH5Sw6CQE+fw81ILPfHpXVVqRJFnLgHyQdchJ/pM82dADnXkwVQPpo55cmjM
         cEy3rcV7gsK6bax5aOIHMP2k5FgEWw2paBUMKPT1lw2p2rbX7LWqSKffK7eCI6YYVAQL
         vruJSlTKsxgx0A2rItHXWq5fHo3J1Et6OT5Wo2JOLVrlNVtrqp8KCAPoIfKQspRo37oO
         ZbXS8cABSJe7XheQMTmd49AiZevB/bDNlGzPa1MV/V5oRhWSKrvam/mIXW9pPNj7ubSt
         ZT8L6dg1rF0nxlrQbC5nx3st6rTg7klhtER+/+kz2hAxpe25sVwVPl+k+waFq2lXPMUn
         Weaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051755; x=1775656555;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=quxJoJV99aTQ23EktQqX4tlfqV2G+rFHJBvPV0aOlpo=;
        b=L/wIHW0dj+vqWtgUBxWV3JG6yr8frJJyuBerDXU4jhvj3Zt8svryK3aOfHQfR5ZGsO
         HSIT95jbeOvoSI/URFZ6MEz160pyHw2wESz+W9Z7tSwXHhXXT4WICUETuIJLc4rxFdFg
         GQkxb5DpDXtK2Gc2Aqgk86SgBnLTAntkZxhdYQe0fFYAZcqPCk8KeZBT8P5Wa/bavffh
         Mdn48dEgMSB+cOYYDptEtUfPhoTeJSZBqumSLzh656+4m33FDhRKvz1saVLJpDSpoiUU
         fQbOPr3H9W2QaZK/A6fQcU658kBwhRXxhGJos/+NSE4oAg1i6rHRf1Myc2wi5HQOlqza
         m2bg==
X-Forwarded-Encrypted: i=1; AJvYcCW0gtS2SOX9aDDsnGJ0hDdX49XjvILCbEFtyv2Q4Z4HXLw0EEw9gMTzmp4nKw++Ty7ZQyHHDPNZPvjR@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQ8zEDpHIlmrSt/IHatqsmHpRNw1KM4qTkrbJyneysdyG9QkJ
	zmoWIx44q0bXLcPEcVT4L2NWFZaMZUVK+/HV6qtRHFUs9IrZ0uXzf+tqtqsGi4yuTrlAa86j4Bf
	Fnu1m5Nb2IlHbT08TeacvsmxRoSIoDJlB24PWjKBMMbpHLLjvux1ZbCcVHfT3kjc=
X-Gm-Gg: ATEYQzwmlXpMj1pW/ammpcC3K2mzecHm0HR+947dSsdIOTbFoUxSxCsbe+FBK7nNFl8
	iaQSFZNiL4oH0PfyMPPlOw5kBj3WbW5YSBcyfdD8GWSNlw+347Gz/wLdi3aLv5d8jLABIPCjSN9
	I58kDr5qbCxKtodGnLP1xommqMAH4Pz53mQIgvr+PAIW4a4fuxr9GXVh7GNAD3mp6e7grWMxVBG
	2kZvmvqy9maYmg44VCOvez69ZOTz4VkAGxx41mOBfKRvtxq322dVpY/+0gdP2vNUerQYoUOJaTm
	q8Fbd/CNFxVtBnITMQrwXGnHQcQ+V2zxr6M3opCtHrG2k0eak8fGVA21KkszuP4EBuLCtZEQ/KZ
	L5PJPzTT0zqjsXHlTsZpPKUbWwik62tfIpqTMDmQLrQ0ZQNB5KsVzdADV
X-Received: by 2002:ac8:5d8a:0:b0:50b:829e:44fe with SMTP id d75a77b69052e-50d3bccce67mr52030441cf.37.1775051755255;
        Wed, 01 Apr 2026 06:55:55 -0700 (PDT)
X-Received: by 2002:ac8:5d8a:0:b0:50b:829e:44fe with SMTP id d75a77b69052e-50d3bccce67mr52030111cf.37.1775051754759;
        Wed, 01 Apr 2026 06:55:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e43587sm145843331cf.28.2026.04.01.06.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:55:53 -0700 (PDT)
Date: Wed, 1 Apr 2026 09:55:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 06/16] clk: tests: Add clk_parse_clkspec() Kunit testing
Message-ID: <ac0j5401vyjIvjCo@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
 <acqNRVLrPxABvecZ@redhat.com>
 <87mrzn6opj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrzn6opj.fsf@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Miquel,

On Wed, Apr 01, 2026 at 10:59:20AM +0200, Miquel Raynal wrote:
> >> +	of_node_put(ctx->prov1_np);
> >> +
> >> +	/* Register provider 2 */
> >> +	hw2 = kunit_kzalloc(test, sizeof(*hw2), GFP_KERNEL);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw2);
> >> +	hw2->init = &clk_parse_clkspec_2_init_data;
> >> +
> >> +	ctx->prov2_np = of_find_compatible_node(NULL, NULL, "test,clock-provider2");
> >> +	KUNIT_ASSERT_NOT_NULL(test, ctx->prov2_np);
> >> +
> >> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov2_np, hw2));
> >> +	of_clk_add_hw_provider(ctx->prov2_np, kunit_clk_get, hw2);
> >> +	of_node_put(ctx->prov2_np);
> >> +
> >> +	ctx->cons_np = of_find_compatible_node(NULL, NULL, "test,clock-consumer");
> >> +	KUNIT_ASSERT_NOT_NULL(test, ctx->cons_np);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void clk_parse_clkspec_exit(struct kunit *test)
> >> +{
> >> +	struct clk_parse_clkspec_ctx *ctx = test->priv;
> >> +
> >> +	of_node_put(ctx->prov1_np);
> >> +	of_node_put(ctx->prov2_np);
> >
> > Is there a double free of prov1_np and prov2_np? If this is dropped from
> > the test exit, then they should't need to be in the ctx struct.
> 
> These two calls increment the refcount on the node:
> - of_find_compatible_node()
> - of_clk_add_hw_provider()
> 
> However this makes me realize maybe I should call of_clk_del_provider()
> in the exit() function. In any case, I believe keeping a reference over
> the nodes during the test is correct and if there is an of_node_put()
> call to remove, it should be the on in the _init().

Take a look at drivers/clk/clk_kunit_helpers.c.
of_clk_add_hw_provider_kunit() will call of_clk_del_provider() for you
via of_clk_del_provider_wrapper.

Brian

