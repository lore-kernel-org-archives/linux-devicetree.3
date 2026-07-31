Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89016434E2F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510139; cv=none; b=BbsvzsTOss10Pbk/HYXge7wivfVsp0oYq2a1NPd8qeKjOWcTKuRr/V/THhylQc+ENTd8NlXRlKg3FA8jt6Ox+4lLT1lalLAKO/B852gBk0uXgk7jR88chCuSi3V+6vVePyUx4dHtQA6CscoeNmUlOkrTqRSnqcK1aaoaQyoX0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510139; c=relaxed/simple;
	bh=3J5ljbX6F8qfZ/q4Yho7WM5F7BpsbTZh0SmKlt8VwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHoh4KWVEZQsW6t87rtcN7jFuacWzKakLlGNmbu8OyLt8G0komCarT4BefvPoeXZzDZypLKMdcf3Ikl+K7RYcLbup0x5K/oWORARq3FOLNg9TyVSXrFLfqE0DQPIShbNH8qyKfTXAPGLfXUhxKp5oiZ+OfdjLt1t7b7I2/5qnpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3nmaw8c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sqDIEsZN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3nmaw8c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sqDIEsZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785510137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
	b=S3nmaw8c8w7ZPXEmvxjHCXWyTtiv4worUi2EP9J0dpkSUcjQYl1iWxGffKbQri5kO+A4WR
	ay2lNKU4PsfbuwknWqzwEPuBQWxenU/Xd1cLLC+IagXAgySpEqGgin1Vvjv9OGFrySmAWO
	s4uuAcy07ox0Yw1Vz16vswPADr9rb1w=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-Qtc2nPaVOD2sBwlXV7ibsA-1; Fri, 31 Jul 2026 11:02:16 -0400
X-MC-Unique: Qtc2nPaVOD2sBwlXV7ibsA-1
X-Mimecast-MFC-AGG-ID: Qtc2nPaVOD2sBwlXV7ibsA_1785510135
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e735bcceaso16498527b3.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785510132; x=1786114932; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
        b=sqDIEsZNKu4X/U+TL2d8kcPJLgyfI3F4OBeZMDvk0kKaxZSE8diP85QEgCkJxgkh+B
         O3IsvGHDHZmAga7ja7POlScvSqGkGTEu6NSxar2bYMeA8psIqWHTkBhaMdLbzCbO/IAR
         Sxnqm6Hf42KEIQZ3N+C/BsQVj/XzMM//uNdND2g/wYgScW/RBBPBFt+hJHN+oiLpj8oP
         wKPvAXBzgfET+IZ1TDiVKLWcTdFiwBNfzOBG115sVWtDUvzME7l+glI/FFtGEkUT1AXm
         cM8hSs3YpFKf5/aYOY50JvifQSUe2GeN5pzuA+UqK6GCOcRDUDsQciURI6SM6BcX569K
         gcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510132; x=1786114932;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
        b=Aogctrpw5zpcJ9LgHGzc5Ng+ogE0bpMfagXu3f648pT56J9KhA5XVGgDBl40Zuis1d
         GA2Asvs7br6cwflH3d+9swEm61BWomQnDQi+VUEe/LNNIQFj0bDqGaLzNIGdkOLz2e7B
         twD241lGAWYRvSuhgUZeR3cIugGF2IWV6mId7UFFkJb0F47hsQncMomVEPgr74LMmNFv
         VIggGUaXFvAbYfQI2juDzF4ejmgqncUhwTuUAs2PtgK8GxX1XHakgcArRK8KR5uyrqhN
         lEisvNsWlnJv7iC9ubDsNSOi/U+oqqlhA7CSRf3rKgdfKLRYX6wonWazLIl127LKubiK
         XWnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLVKLDfaQiomdgGOU+P7e9my86+kbg5+Ord57eTEUulyEFPJH+9l4guZTYV7ntaGdVhACzxMMtQPGc@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMPyKJZXsdl/8gqbdRqWf3ozEjNuMh6rF/EUqHzzGAo+myEra
	ZKtJFrz1+RQBpxT9b3zK7/LQ8FdKXaEn5JTq97KGaPfec12GEH/RtOdKx0zGpDEhE/WslwqrTWt
	z3Th1Or4sk1Q96Tu9o3/WuSkbg5Da7A+9ieDwLM42gvEzpEpqY9BXzBlaFANnIRY=
X-Gm-Gg: AR+sD11JttwR8zku0Djim9zGWsHS5T+FyuoBk96PPodc9j04+ET6wzppzA0tRXt8LZd
	wqvA2hQXWKJNFaMv5YPsLc5ZqHHQ5kJgqm24xjJ7k96ACgSCYaP6o7gTDDLlWl+dyuukXcx3WHJ
	VPbjpW5PR+xA/vQ17NMSGPqZGWkncre1OtSj38jFV8Gd8vO8zd5MYR30x9UYCEGnNh8EN+UWciM
	hmVaTvJeUnLbkQOl001D8MdHaL++KhVMdR+Z2KULm/qO+GkaaQDs+yg/m4mH5K2iG0mEuep6lgv
	pfk2OKGiWysmn8dfLlil+qY3elGr4+PqAqflZxX3CFoXss9Qae8z2gOfAnPu4ukj91OkxROxgwf
	XHPmTNr+tYLXvJRivneKcfbgrXyBsxyb+1Us=
X-Received: by 2002:a05:690c:3705:b0:7fd:e030:23db with SMTP id 00721157ae682-81fd4bc5fbamr1315657b3.31.1785510131715;
        Fri, 31 Jul 2026 08:02:11 -0700 (PDT)
X-Received: by 2002:a05:690c:3705:b0:7fd:e030:23db with SMTP id 00721157ae682-81fd4bc5fbamr1313677b3.31.1785510130851;
        Fri, 31 Jul 2026 08:02:10 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd11d08esm7875547b3.37.2026.07.31.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:02:09 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:02:06 -0400
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
Message-ID: <amy47how40BJnHsn@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
 <577a6882b25e457fa94fa199e66f3197@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <577a6882b25e457fa94fa199e66f3197@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 31, 2026 at 08:17:44AM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Tue, Jul 28, 2026 at 10:28:04PM +0800, Yu-Chun Lin wrote:
> > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > >
> 
> (...)
> 
> > > +
> > > +static int rtd1625_crt_probe(struct platform_device *pdev) {
> > > +     const struct rtk_clk_desc *desc;
> > > +
> > > +     desc = of_device_get_match_data(&pdev->dev);
> > 
> > of_device_get_match_data() is deprecated. Use
> > device_get_match_data(&pdev->dev) instead. You should be able to drop the
> > linux/of_device.h include at the top.
> > 
> 
> Ack.
> 
> > 
> > > +     if (!desc)
> > > +             return -EINVAL;
> > > +
> > > +     return rtk_clk_probe(pdev, desc); }
> > > +
> > > +static const struct of_device_id rtd1625_crt_match[] = {
> > > +     {.compatible = "realtek,rtd1625-crt-clk", .data =
> > > +&rtd1625_crt_desc,},
> > 
> > Add a space after the { and before the ending }.
> > 
> 
> Ack.
> 
> > > +     { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> > > +
> > > +static struct platform_driver rtd1625_crt_driver = {
> > > +     .probe = rtd1625_crt_probe,
> > > +     .driver = {
> > > +             .name = "rtk-rtd1625-crt-clk",
> > > +             .of_match_table = rtd1625_crt_match,
> > > +             .suppress_bind_attrs = true,
> > 
> > This driver is listed as a tristate in the Kconfig but then you have this. Is the
> > intention of this driver to be built in only?
> > 
> 
> I will change the Kconfig options for this driver, as well as the related
> config, from tristate to bool.

Keep it as a tristate if you are going to use module_platform_driver().
You can also drop suppress_bind_attrs unless you have a specific need
why.

Brian

