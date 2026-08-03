Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F7E21D3D2
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762070; cv=none; b=JZenwNPXiRBX7QHhxJlAYOctyCw5oHcOZmvqEsQ5RMgIlmtyTwIbaP/PhHTSO3jBPDWJa3CP1jym73xlufQYebFLIj4BvVCL+Twr9P/aRnl6adXznMi6tz1QSZMa12z5So94wPO1JdnxBvqw6C8pn8+2tFGqQVZVM5IPRWw/bkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762070; c=relaxed/simple;
	bh=K1kDLS2yi/4AXDZ30Ng9gIKx0j7kkRu684p805bqleY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhwEp6kM/37Wnu+OOgiLqm5XdcWR9tVOVgtqVHbnVMC7LvsCsvOz///lZHrUx1fYe3hFgbzTt9sRgddUUt4UKjMXul3DtOuBKpk11idAy+eWLeWV1vKG7Cfwfi60mK7CGqKO/rGllttmCrnkfEC+W4AgWQPXJANrE9MFeYTykVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JtvRaXWs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gwigeLGh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JtvRaXWs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gwigeLGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
	b=JtvRaXWs4inZfDmHyPZ/kbPYfKayFusxbp030ahH8PbXJGNcNqbzDY4u7MKBu1H6ytZbym
	fPaDHlbeEsW2NvHMnaU7RZwgNtrCyA8T8/jU6W7B1kDQ9QjilBPt7l0XCHho9uHtZ8JAzN
	qac5amDcIrnAwPUflWMkW8wQbwxLf34=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-kip9FWWbN6GfnQK0TBXzqQ-1; Mon, 03 Aug 2026 09:00:58 -0400
X-MC-Unique: kip9FWWbN6GfnQK0TBXzqQ-1
X-Mimecast-MFC-AGG-ID: kip9FWWbN6GfnQK0TBXzqQ_1785762058
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e71268bf6so117911317b3.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785762058; x=1786366858; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
        b=gwigeLGhJ6fNSaZeDCVvNMZS/4pUzYBfc7fFkICS31T2MDP+u7ngrexY0dGl0S2und
         upO1vVP8WFwxuyd0bkPu4x0UCRXwkQEGXpHO2Q2cU98HkoC41oo7CgpMHazLUTA8ylu1
         mg900FzKtjHrayHg9pe1a5iYxJAbJ5EIpZdSjkPAdeOQylActHqHm6XWmlMqipl+XLBc
         qSBt+5VQLjrWWiclq1Vgvkn/LjRzeM7SkdbMQ48AcbZFBtNx8Kc0fjlqSyRi3eLmqK/4
         eOtjL9thWnpaq1L1vYytV8VprcDBEI/on4+OX2DGzs7czFlvTvL5B/QwHjqBhqyUZ4kT
         We1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762058; x=1786366858;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
        b=oxG6/H3TzJugmr3t2U1ZacZA2ybeQJbcK0P+0Y8H5Cb6Osnn5jT1oNK1/q1UBHia1s
         Ytk4xIjWKnl0+TwTLohqPbfKRMPA0x+3TLMwevJbIvyoaCsEtnTgSzASSvXxAypiOsxF
         Kr8M83SIZ9uHg9V3S3ZWP/ES6/ly63XfdZrNxJ1a98Ghyg+orF5fnprInvl4iQnJRfVz
         VAP4XQsds3v2lSXbHXPplZkpCCp4BJhwNwF3mSAG2m+WPCrG7QT81zpoHa9+jo7DQffb
         XiabMP9OzTgl+iAfTgnY2DGO0iVfnJDwC2QEOiHQVgDd3TUdl9YG6o0FSU23+XP0XvjV
         I6Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rot99orxTYY9cOLW/6H+i/3ISKiF4IgEx6g4rOfnaV47prbPGgVYZr6bjDmuRjIjAneNkOIzN4suQxy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aruLtxPF//FM3O9g+wKRpiSu2lWIpJtTzMtY6B1BzoT75DRn
	M9sYMCtdXAyrH2SWuzZ6G/EB2cdYBMoq+kAv+M1E3BfmlfSlVSQX1dwKuqpEgUV+u6YyEJpBEig
	35PlC2nweBOGwYRWNWvKtiE3KG1p3BHePhJJyDYlgqEMzPph6N/uahZymXa9dwhE=
X-Gm-Gg: AR+sD13bE/r+h3r8oqSks5NXQKm5/j4pu09RLyAPmBRX+JtqER5FPl+qPNtNQu/ugqF
	ZG6h4OZklSTXzNB0fsAk8bNNZaei053Cp2DbTO6U//qrPczy2gT6GR/0cYja8xJu9ZZJZ38iLZq
	toPXlVeojWZL7U8CVOZlSuojQHOuw5JMb7ub7nlU162y3ud7LIfa1IumjUqxuVc+GcY91JKjQzn
	9/akCjv1wM6zXU2xifgfInZR+fkn7PomS7LiExDQfmIeN+92r0TWkUfa30gP1peDDEkuvavpz5w
	eB9JcCiCrzXxMuRTEKqKb6HePZCTFN09Qe7qte83L/6MZDFSyIkDjS+/LWsiaZfAoyVJcaaxe/O
	ordmo5yGJk+MYdfg5YkXpCMsur6D3nT+xTuQ=
X-Received: by 2002:a05:690c:6c08:b0:7d0:79f:339f with SMTP id 00721157ae682-81fd4c09889mr120972077b3.34.1785762057684;
        Mon, 03 Aug 2026 06:00:57 -0700 (PDT)
X-Received: by 2002:a05:690c:6c08:b0:7d0:79f:339f with SMTP id 00721157ae682-81fd4c09889mr120971147b3.34.1785762057045;
        Mon, 03 Aug 2026 06:00:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm54877467b3.5.2026.08.03.06.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:00:56 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:00:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Edgar Lee =?utf-8?B?W+adjuaJv+irrV0=?= <cylee12@realtek.com>,
	Jyan Chou =?utf-8?B?W+WRqOiKt+WuiV0=?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Subject: Re: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <anCRAqhQ93QAihsS@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
 <577a6882b25e457fa94fa199e66f3197@realtek.com>
 <amy47how40BJnHsn@redhat.com>
 <a216b77c125544c0871b40f31c021ef7@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a216b77c125544c0871b40f31c021ef7@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 03, 2026 at 09:56:01AM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Fri, Jul 31, 2026 at 08:17:44AM +0000, Yu-Chun Lin [林祐君] wrote:
> > > > On Tue, Jul 28, 2026 at 10:28:04PM +0800, Yu-Chun Lin wrote:
> > > > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > > > >
> > >
> > > (...)
> > >
> > > > > +     { /* sentinel */ }
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> > > > > +
> > > > > +static struct platform_driver rtd1625_crt_driver = {
> > > > > +     .probe = rtd1625_crt_probe,
> > > > > +     .driver = {
> > > > > +             .name = "rtk-rtd1625-crt-clk",
> > > > > +             .of_match_table = rtd1625_crt_match,
> > > > > +             .suppress_bind_attrs = true,
> > > >
> > > > This driver is listed as a tristate in the Kconfig but then you have
> > > > this. Is the intention of this driver to be built in only?
> > > >
> > >
> > > I will change the Kconfig options for this driver, as well as the
> > > related config, from tristate to bool.
> > 
> > Keep it as a tristate if you are going to use module_platform_driver().
> > You can also drop suppress_bind_attrs unless you have a specific need why.
> > 
> > Brian
> 
> You are right. Keeping it tristate is beneficial, especially for aligning
> with the Android GKI design.
> 
> To properly support module unloading and driver unbinding, I will add
> the .remove callback and drop suppress_bind_attrs.

If you are able to use all devm_*() APIs, then you shouldn't need a
remove callback.

Brian


> 
> Thank you very much for the thorough review and suggestions!
> 
> Best regards,
> Yu Chun

