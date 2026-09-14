Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A433E073D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394769; cv=none; b=YpjhRp/FwyzptW096J8I7OgceYjFF+Yh77S9ebn/CXKVrER5OeYkIZka9jpNg/iR4D+VlVur5oyWBZYiitPIxgxl5ng4vVD0vwIEGLBS7Ghg+5szgodoPp7n9scG62NwBCmBnY5sE7y0otLHRRaBan5k7H2IFenp+G72ErmSnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394769; c=relaxed/simple;
	bh=ntRH/yJFT8bnr3NA7fpl1u0UWwgPQd1nw1mxGnJ3x0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WG/wpcYJXm9RcGvRyUVRX21f3gaFoC3vGFtau8qN3OdghDBRmNRRziVBiyiUn07haRar6KfE7OEBNzcEVZH1j4n83548UhqNodaO8rH2xdJjBPh/bfp8ENW/Cn30tGnq7FTweBGK4SWUCSr3jPnmbbo96lufgDWel8Wig35OXfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A29KKEFr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VkJlbGLE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A29KKEFr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VkJlbGLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789394762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
	b=A29KKEFr4/WRBT8nEB48W3pgKRxo9FSQewqX/bLn5eZQ+kHz7K2iiaBi0dVd1/Bx5Cfffn
	u4Tst+dRhkoQxayIhn7yowxgpAe6ULXRMvmz/0gwCRUBiQr5nxDqRldx4MaUw16btymuzO
	Wb3zIA9B/UqnwK4cQrtepIHWHHroclc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-MLynwRwiPJmse-iMXTYNqA-1; Mon, 14 Sep 2026 10:05:58 -0400
X-MC-Unique: MLynwRwiPJmse-iMXTYNqA-1
X-Mimecast-MFC-AGG-ID: MLynwRwiPJmse-iMXTYNqA_1789394757
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0050a554so546400885a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789394757; x=1789999557; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=VkJlbGLEz32i8yz7Q7ZzUsNem939tZzGbpGPO86beCNzR/mBD1CnhJ/9EYTdKvU9qi
         EQkCBrUB1pRztnpgCoLnASbsQeQZwBKsggMsqmMMWVg6r8lyjNwiBydJgnfEPze0uT+n
         Gt42rzMZ5aObpBUFIoQlx9gVUPcKGRaOMiw/88qCsH/MqFJzFE1kuNEkkIQbQlVxx5Pz
         Idddjbii1BFy7JgMViZ520wmh6pgyaHmFsc9G/EbYhnWskOHsNHCJlA7rTDoOKiireKk
         UMTe6FOGludRzAk/h9j5bDt7TKYHzBEw8rzrUrPXXPaviCbb/BuxgnBGyRFy43mkE2Xf
         hiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394757; x=1789999557;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=D6MLMpqmuCqfAJlJdOxM1juGuuMg39oouJvzh4EwgMlIXK8Pl8V1I+ZzWtqINJulR2
         LH2+bhU9/h1I/Ad+cFG6yo/bgLZRXQfwme+AIMpaI5iAi7Wv5kly4GJ2dmZ7nkZ5yH+w
         nwYUcmkKUUdEUDtJzLBvN0f+S8H5SVaFMYRfd3nSYdxex378rJkmu9XqAkoW91s1eaY5
         Ihl3oqUWGUHClnv35dpWIZXvFROZKyJRbBqP5Soo6ysalDBkNvMo7yW+rbDiL8p/CEdo
         2gqAjlr0Z2QHZeBsU57lu5siYFqzqmjYjWQSoF1yvPLwjx+Ov/lrXDCUr0VHamsT6bUz
         dd6Q==
X-Forwarded-Encrypted: i=1; AKwUvByOVADomdnZOcHjEgE740fTnVG1J9A3uIzxwL6jbIfVVl/jyxyxOjefLixpEWExR3AI/bEvY2WgHV/7@vger.kernel.org
X-Gm-Message-State: AFuF++k8KEPE7UyN5wjGAI9Ztvn6jv32aPSFY3UIO3Q52SHbrfXPeODV
	1YHvShYvvizWh1XrrdpJ+kSgRxBmsVNfpzQMd5QCMzbsWwO+5Tdwb17M+OeJ+LCIGYU+M6F49tz
	7MzLtd0djBJVjdJeBT8l34qLLogq9I8cpmzWDBLZxy8eaAckyv48HELmmR+6hcrc=
X-Gm-Gg: AYBFou0pA1ZsdLJf3va7s/QKhx3do+nzVUsaGET+bIfjcVC/1CmV2MrnIWDEmJPiknT
	61/6g/F4dAxL5wXfwySKzd10p5VM/bkWIWnffISlYw7cFl07kXp5cjTZhA9frOIJffORf2QgLbh
	DKteyDebCemBD5Ktf9ovcoXFNHYXJaYyYjZmrE3/mgbD2SS+R3pNc5iE+3ipHlqY3sJFZQcX/hx
	Ktom+z/3prtVqWKrL3UTrK9aSfc7JDgec/pdbAZTUdZpgciA/6tWRHXfokoEKY6IKhbyC3MbUJK
	80uHa7ZkIofYE71HLLWkBhJGSoaRCuUn61ZGnGx3SAOQkqxIOzp0ll1NdX6K3gtqNmAlzxnTEXE
	gGcsSddYj79cCDPiTYBuJ/BuKebuslBJ2H+I=
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389774785a.16.1789394757384;
        Mon, 14 Sep 2026 07:05:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389765885a.16.1789394756851;
        Mon, 14 Sep 2026 07:05:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ed67a93dsm906151985a.43.2026.09.14.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:05:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:05:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf_QZpOIj-170Am@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
 <aqf6NH-xrMtCQppv@redhat.com>
 <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Angelo,

On Mon, Sep 14, 2026 at 03:48:20PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 15:44, Brian Masney wrote:
> > On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> > > On 7/30/26 20:22, Brian Masney wrote:
> > > > Should there be a new MAINTAINERS entry added? There's currently 221
> > > > files under drivers/clk/mediatek/ and there's currently only one
> > > > mediatek maintainer entry:
> > > > 
> > > >       MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > > > 
> > > > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > > > subsystem maintainer similar to what the other SoC vendors do? Help with
> > > > reviews, send in pulls, etc?
> > > > 
> > > 
> > > I may be able to step in, but I have to check if it's feasible, time-wise, on
> > > my side.
> > > 
> > > Though, that won't happen until mid-September... because, well, I'm about to go
> > > on holiday (in a few days from now).
> > 
> > I'm checking in to see if you would be willing to be clk submaintainer
> > for the MediaTek clk drivers?
> > 
> > Brian
> 
> Time is lacking

I can relate...

> , but I get that one hour from me is more than zero, which is
> a good thing.
> 
> Let's do it.

Thank you. Please send a patch for MAINTAINERS when you get a
chance.

Thanks,

Brian

