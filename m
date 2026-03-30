Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D48233439F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882928; cv=none; b=MD2Sz+wpBAEsDUEnY4T9E8hbf6JbMQNd8o6w0/RcgHr0nqbzOZZwBGy6j4WD7CGy6TACqfsLJ7cTNbfq7HY4DRqbh20xzWPvLl8nGrbwmpvUDeT+W/X6iArPiEOgSvhtmey3eHDaPbbjTRm20p/uAlx7ShCkkgB+kVYOfsthEwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882928; c=relaxed/simple;
	bh=fVkuWa4a6/cQxsnJg9pRm7tn6P2ndJyKnXupZf2dZoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ac1eIUuanenXO48ATp3efLRN3PNgP3j82NBJmTSUtfhouJi6RuWyXGZ7Bu3zPPbXFH4pzeMbZfdbyGwEncqI9DXi3b6ZhldINNNKTUtvWsUwuCxG6pZCMyQmWOzaDr4BkSPY1vqHomodOcJkhhO1BskHTejMpbR26viI6HkZp5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cSnCQC1v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJtfOKq0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cSnCQC1v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJtfOKq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
	b=cSnCQC1vC7tbWlnR4vS3hUzdtWwdN05EhRHEFdi8f2wxvYX8N01fzjMUeueCxuaz9C2MUo
	+9HNol1PtSbr9gyMEs0Ml1ktxJuptQ2ImO8YN2pheHdd6FRkoEoO5c6euEt5vY6Qqxy3Ev
	tgl/DMwjp4yC23YlukVgqSxebZ9fv3U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-ieN04gcnNFut4gRx4PYLgg-1; Mon, 30 Mar 2026 11:02:04 -0400
X-MC-Unique: ieN04gcnNFut4gRx4PYLgg-1
X-Mimecast-MFC-AGG-ID: ieN04gcnNFut4gRx4PYLgg_1774882923
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd8b56114so13749366d6.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882923; x=1775487723; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
        b=cJtfOKq0lZ6i/yu1JBQBHyPriJHNaODHTnTGIib5Who8FQp5rOcp+wqs9D7SX1NGkG
         iyVRNVZfSBfmmYosF1xa3GnCi+k8+V5FW90GnpRJv771BB6wTIeBjyxGCrjFIpQIIrC/
         Jbjei/04AEHcqITxrB3yLMUrqBHKDkBnTXxnwVwQDJwGYHZ+8r57C98aQpsPdBzk5+Js
         EaLDPIiqtSnw5oqHJBY4QfxXHVDXzS1zxrlvLciJRJVtYTqbFeOynMObjrqEsyvug9B6
         m3FM7+wMxIOQEVEXTrWHfBWbcYpPAlZATqVbnEl6tkGiD9MalCbrEKljYcwljSDudkFy
         iL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882923; x=1775487723;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
        b=Z3khxoh3Z6H2XpRKmRugXXfsj9WR9MwDDI8OsPRG5Ig26f4JOnpTxOBsKP8BOa7hEY
         RMIdZZk9YlusVDHnnHZX4K/FFtktomADleUkHdX+JBjJ3sFyV5VRU9A7JdVEgtFOzbeT
         HPdmOXW9SkEQiN1LHDBCqs/gLjlKYveSqsuE4409NqQnzFKcn8C1q4LDBRNjNUA4G0XL
         qRaxh+1/aystkS07CTWVUOwp5+CL+dFxWKhmKs9ukicZvVJ4A4aBPHFeukMREyGeePQ2
         M+r+Nn//Z5UPFWNXsIXbeQ4sLVcwID5Th1vMClIvrZurzqhsRRrsLPjUNQ3mJr+JXNOq
         VGJg==
X-Forwarded-Encrypted: i=1; AJvYcCUUjXDG//FOlQkQcksJTon5RT612mV8nv/T82jjFVddfsMSAdYb09818TOt9nEzPbswjRxHYakWZB4H@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlh6RefNguR5BJmeICjrjx5UKYG6R04Es0c3qBgD/QzIz9053
	6MTa9sJtyCC6jXU7MqyNfisv++9nqeIiexJBuBYDReOYPD2lubFRegQCXKtoH+G9JHIt2US41fN
	GYEJ6Yd0FQtI29cZQE0S6wDEnQFIfskpK1XexmAzuCRms/v/fD+fKJ+m83LcJrno=
X-Gm-Gg: ATEYQzzeE88gaXQU6sUnJYndQsiZoFccGROfwK579KOmfIepaDsNNBFf5bpTTB4i968
	2FW5VrqdXyh1e7cpVAnqRPC6fCBRao/0RaqPnxLtAYPe2pAE973CNwwcxcHUGefqzW6MhepW6mm
	S6Y/SMj1NQtIoET4KSkMf9DkcHgNk0wSh90jScphFkOyWftVU54NWpas0jq1S/6dNctNtXeaVvs
	8434s+FFEAcg6CYWBNFOSFyB1lSF5MAEGpzjTUBfqWo9IaywQtjSu7R+HmAk6Mcy+jL8Gt4uTnk
	TcO3Kq9m5B4vvQOsrRz0Vy5tckA8+qlOx8UtnZDFb/Y+4x0bSEeaEfi26O8xQ29kLmSH6lAutN4
	nlMGPx1X9lGATpoBKrdakBO2yIY98m5En2a6tUUeDBmGvDPALeY+Dd31G
X-Received: by 2002:a05:6214:498f:b0:8a0:7c8:409b with SMTP id 6a1803df08f44-8a007c84819mr89272066d6.33.1774882923320;
        Mon, 30 Mar 2026 08:02:03 -0700 (PDT)
X-Received: by 2002:a05:6214:498f:b0:8a0:7c8:409b with SMTP id 6a1803df08f44-8a007c84819mr89271186d6.33.1774882922650;
        Mon, 30 Mar 2026 08:02:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89f49cbb8besm57387836d6.43.2026.03.30.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:02:01 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:01:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
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
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/16] clk: Use the generic OF phandle parsing in only
 one place
Message-ID: <acqQZ5sx_WZrr4KJ@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-9-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-9-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Fri, Mar 27, 2026 at 09:09:31PM +0100, Miquel Raynal (Schneider Electric) wrote:
> There should be one single entry in the OF world, so that the way we
> parse the DT is always the same. make sure this is the case by avoid
> calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
> is even more relevant as we currently fail to parse clock-ranges. As a
> result, it seems to be safer to directly call of_parse_clkspec() there.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/clk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 591c0780b61e..93e33ff30f3a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5375,8 +5375,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
>  	int count;
>  	struct clk *clk;
>  
> -	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
> -					&clkspec);
> +	rc = of_parse_clkspec(np, index, NULL, &clkspec);
>  	if (rc)
>  		return NULL;

Reviewed-by: Brian Masney <bmasney@redhat.com>

In case a Fixes tag is warranted, it's not exactly clear what should be
used. This was introduced in commit 766e6a4ec602 ("clk: add DT clock
binding support") in 2012. However of_parse_clkspec was introduced in
commit 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()") in
2018.

