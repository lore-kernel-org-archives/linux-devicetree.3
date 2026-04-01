Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117622D9EFF
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052274; cv=none; b=hIsev+neRX/I/QXNJLICDWEgIJvg8QAtBoNgmXYg3fAYSKcmTAO7hvpTrni6A3pJxRWmml1RDr+VBGHPt5xTV15vvnxK8YjCkE7hNUfUnU9jHUqBlcd9D6smBc+KA9dwTG9iUZL3Wwqn5Iw4D32aErJrM3wa4cX6At83NTscVAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052274; c=relaxed/simple;
	bh=ENBbqPvMtgDBrtNY5Maiukm89IlJO8HyVFmraI/eHfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hR0+OrL9Q9yZHriTWJPFR3Ee0HATCUeqPFqBXLkbNgkSpE/2J4HuVCiWgyhpy4bIXj9/PS7FqEWt/i/r4yYiqP29Ks6k7lA8V4o+Qpq9KSuo4FrjpsW9T4A/ABqE6g/Dy7aadnIyDoD+bIYnsxTrvejoy/9876/2ZfBSSuAJWxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNvgfAp4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OsP54f9/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNvgfAp4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OsP54f9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775052272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcMceLtrrOoF9OBObZDKWhIp/2bPn54+SJ2oUftQ6n8=;
	b=gNvgfAp4bsaQnsgXclxH003xigZAg5RnFJZtwy4Xbv/5EApBqHnZU8H6McqAvYTHVi72j5
	D5j3K53EMmqYAYvZmRgYxHao1NA7GTt3Osl3VsbzWZ0wqHqOdKx8J7+hwtLpyXO3oapiEE
	uRwfkdcjbU+IcXsVKrEpRlj7sqBCwbo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-EyY6d4cKM4Kyd-X4t3rgEA-1; Wed, 01 Apr 2026 10:04:30 -0400
X-MC-Unique: EyY6d4cKM4Kyd-X4t3rgEA-1
X-Mimecast-MFC-AGG-ID: EyY6d4cKM4Kyd-X4t3rgEA_1775052270
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67e1bb8b14cso21510742eaf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775052270; x=1775657070; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcMceLtrrOoF9OBObZDKWhIp/2bPn54+SJ2oUftQ6n8=;
        b=OsP54f9/cRkV5KVwx73LS4B/Kq7ktCySUtk9oZFpaM6W0upTXpY19rwVHfRsavgDEp
         GE4vL7VsNbVNjWJgDf70xKDWQTw/zWkPiX97MtiG+m+YJoGAwmzTqpfjtAA7H+hf/Nw7
         0m2Doue+m/Ih9mYhVFugzbeluApxsdcFLLim/E7FBhjdqiUMmUz4hESiZZNywAJ59fYq
         mnGcwXv3WtDYFdN5L+5rWUn7yC/v6j3XdWWM6xY3RsjxFwl7bDI8p8E2ogWE5jOokpNX
         4dNO+7YcSMFQYjQMlYGklsOXKkXPiwGx+Wphq12pjvI0aPqM/xWnfBJ6BgUVHfEnnlJL
         T7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052270; x=1775657070;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tcMceLtrrOoF9OBObZDKWhIp/2bPn54+SJ2oUftQ6n8=;
        b=WIMuAKzP6OxHTitBETXlffmVVTl9aar6DuB54DyNgDQmN8jkuoQ1VJzgdA49My4Gif
         XYPLH4VXgErN7eHX0pXXWAys3AKQeFFLaaO7LrgBUUJ2YTqCyopFMTO5wlO5iVjbFHkm
         ran1MrAK31tnh2OakWoMICKwhUNS0bkJLAJ3bp4ixoI7KAZmqkhS3awT+bs6+STwR6iY
         9CQGXZGfXR6vLuUvR/8wM0Riqlyf4LU6dBpsbH/8rbL5Z04/1YD6umkWa78V53MY/9HS
         bjFGg0rmUayOmGNpflWXFCmh0OrWKImew7Xf5e1hp+PFWT30YJetl3QUOrgpE9S66aTc
         yKQg==
X-Forwarded-Encrypted: i=1; AJvYcCVB7XQpgAOckMqqZcIObmfB9vil24Rm9KQmDoDT4U5h6hQ/gG/HpNgcMjsA/8XkCH92o8BMK69rxEAR@vger.kernel.org
X-Gm-Message-State: AOJu0YzDuS/BxlhzULaqTpYGjtdmn88c91ujPMyh2T5sdPOs79F9Y4Dh
	KrzlctqqWndT4bcfdk+owDKuBqlXF+2MTVNalt6m4jQrQyX46zT4JQzslCBkzBiXBDn4ksZHov4
	goGA7A5v5DQtM+ERUEvXsXNpAEO7dq/yCpQNaMHH6pFoKYN2o2p0hbLoT5L+0Ls0=
X-Gm-Gg: ATEYQzxmcne/P2kTb1qLG7rXwojC+fQFhQMwu/UbyoTDgPzrQry+GTgdciwrVVEm61+
	jUzbg8QmlD3WrAWfUUHaji4h87dhMcWO2GvekNcjTKm7QekSDb45zFsaQ6rQxHFeZGU6OewwkoS
	hfLKRNqPuh4RfxcB27Zd4zXGdRY3N2iVc0TH1lPMFl3aFOYrPF2LdWTagVIiFooV0oiHaAlmKdQ
	EDjdxoVjAg46YcmBP6DiooIeT9HhnurURvvCTi11nZq1cRqBasX06bpBLo95uF0ludyRvuKhMOm
	wIx2ajwlu9CEoxShBhJf6VzUbWsPx41VNFFk9dQ6q6kHd+n6l568uGBpX+F8bZA/4OBTYJAuVSh
	JtzvgaU+/KNqPnBCDQUTdGRXCfK0qNQ+Rg35qUzzQGxyYVxGRHu/Q2PV/
X-Received: by 2002:a05:6820:4b81:b0:67d:e102:da05 with SMTP id 006d021491bc7-67fabd323a0mr1831341eaf.63.1775052269884;
        Wed, 01 Apr 2026 07:04:29 -0700 (PDT)
X-Received: by 2002:a05:6820:4b81:b0:67d:e102:da05 with SMTP id 006d021491bc7-67fabd323a0mr1831271eaf.63.1775052269221;
        Wed, 01 Apr 2026 07:04:29 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf960d2esm117933246d6.34.2026.04.01.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:04:25 -0700 (PDT)
Date: Wed, 1 Apr 2026 10:04:23 -0400
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
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 10/16] clk: Add support for clock nexus dt bindings
Message-ID: <ac0l51ikCd_r22da@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
 <acqT3Dh03y3JiLLc@redhat.com>
 <87y0j76p8o.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0j76p8o.fsf@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Miquel,

On Wed, Apr 01, 2026 at 10:47:51AM +0200, Miquel Raynal wrote:
> First, thanks for the whole review.
> 
> On 30/03/2026 at 11:16:44 -04, Brian Masney <bmasney@redhat.com> wrote:
> >> -		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> >> -						 index, out_args);
> >> +		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
> >> +						     index, out_args);
> >
> > Before I left my Reviewed-by, I should have double checked Sashiko. It
> > has several questions about this patch. The first is:
> >
> >     Are there other places in the clock framework that need to transition to the
> >     new map API to ensure assigned clocks work?
> >     
> >     For instance, assigned-clocks and assigned-clock-parents are parsed in
> >     drivers/clk/clk-conf.c using of_parse_phandle_with_args(). If a device
> >     specifies an assigned clock that routes through a nexus node, will it fail
> >     to configure because the map is not traversed?
> 
> The goal of the nexus node is to isolate what is behind. Are
> assigned-clocks et al. supposed to traverse a nexus node? I am tempted
> to say "no", but I'm open to discussing this ofc.

I agree that it's not needed as well, however I want to defer to
Stephen's expertise here. I mainly brought this up trying to help him
with reviews.

> > https://sashiko.dev/#/patchset/20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994%40bootlin.com?patch=12563
> 
> I have mixed feelings concerning Sashiko's feedback. I will go through
> that page nevertheless, there are interesting comments in there.

I have mixed feelings as well about the feedback from Sashiko. It finds
issues, however not all of the feedback has been helpful. On the whole,
I'm glad that it's available.

Brian

