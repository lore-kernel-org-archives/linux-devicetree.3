Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD63A6EF1
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064521; cv=none; b=GxBGEGpDGEP2ZbfdMLZD5ylOcrb5qq73PRmoIGRVsOtMTGDRZBzHNJJ9U+idFaOeztiCa3oh8/xQrxNi1X3oGQEYNkD012DPYemCWDFxVAouR/bDM26GC7PhazUcIY3CRbC4Iv0BbQkYjYC6hk25pcHuCZEJ83f7Io/UusXdEZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064521; c=relaxed/simple;
	bh=7Ycn469SFWFeO5s2hhsreUDiy/3RnWxqNOUX56/cLd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBG7C/E9yidZQKqhNeCpJygwWoIXdpFufseMJ8LfLNy0UUH2VJbQIIPMiwssvTorPT024Bm0UiG6mk2wBwFDU8K0EqytmL6koa/6mSZrADxDhQ3nk3zAfJuzi7fuGPKJdeOKKzCMHP4dK9T2mVEWQVGulmcRepMMwuz367Dkegc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gp/5hB70; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=okmY3Ggd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gp/5hB70";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="okmY3Ggd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787064516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqratTSFO85K0UfEW/nA8PLglWUW5y7UwI0MM36KLxg=;
	b=gp/5hB70ytDpRINbwHH6V0GSa+9WeF/q4g6zxezjyput7o0/cbQcqfym1airrD9mYvblEp
	xRXUwQX4q455Fp/i9oOsOxfQE5QhTOc3DdX0I7qlgM6L9a24aatJX7Y3c7BCor5HCfWuMO
	qAdEPy3beJrUD57Nm6tDsweClHlrrds=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-yJQrKNXqPeyl2DS_fhrCCg-1; Tue, 18 Aug 2026 10:48:34 -0400
X-MC-Unique: yJQrKNXqPeyl2DS_fhrCCg-1
X-Mimecast-MFC-AGG-ID: yJQrKNXqPeyl2DS_fhrCCg_1787064514
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so58900401cf.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787064514; x=1787669314; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MqratTSFO85K0UfEW/nA8PLglWUW5y7UwI0MM36KLxg=;
        b=okmY3GgdOAmDaoC4KxPcrC785s8WrhQCmMCygqOwBbi7tRSPWNyQAwdUNd3LNp+Atp
         TMOQDhbeXzcQY/Qin/ZpuMwWHdUVe9ZI1yLQDml0KD4Lx9JBsglmY9GWX46EnpaMhFkL
         rvvYM6a6gx2g6IbhQG/yYXfofHi6WkGGmLkgdvKS0nExx7qeeUgPU7jN+UfUve4mFqoz
         95mT9obJ5KAM4Ja9aj5xHQ/pJ7J2E5EHsln6A/kOqNcCb008R4im52FnwxOFHQhD42hD
         78LXkI6JQYFNGkcTXfAGmn7VJnrYWDV8rQuibEbXQhN0hRlc7Se0alGO7zzwaFa9Do3h
         kFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787064514; x=1787669314;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqratTSFO85K0UfEW/nA8PLglWUW5y7UwI0MM36KLxg=;
        b=jaiIrhjvR2yD1qRAgWrjlBA0TExE7hdIxEBhnTy57vtOTwJVzTNbsCKASWfsBL9lm3
         3pDWN3UA8pFWjgM5nK92lmQ6GX2w2efAaXF2sMpOVSFExtsP0pBdEYodoOFrTzm940XS
         WMxQIJye6dbHFZxBomx4a7qp+6B3A3HS4+k7R2+hrlfmIlUEx2pIhvw6HYTW8VedJMLk
         HLuf9wbMJN+Hxykoa6HdP1FcId3GWzTxl+uVY86ByHktZYD7NvJBxDcYblxNJZR7uhgd
         9whAbcR7wdo5gT7AeNqKpJQpeRzbR8XcBZZDBGkgT94YFS1B03RyUteFAfN9lZRcm5sQ
         eSpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5H65b1DxplyWTeqpbhMG4WyRsmp6hEX1qAML/Th4mb4FvMcAEnHGakRxEZb7ChklQCdSGbCdJoWQf@vger.kernel.org
X-Gm-Message-State: AOJu0YyX8CIZQX2VAG5SMckRXmWIte3vdbCOPSImOcHBQmPPtp7TpQKI
	cw2nT4Tv8NbR88VZgC/7wNVA8kEcLboc7VtuvoHmHqBeSRZ7xyLn6O+QDgO5lUuM/SjW9GBaRKz
	Y46CNY4EQKvKVnjlbshUotUGHslAy0WTEXQzN0VwNwA2YdRgdl8oy+SK58EAS24w=
X-Gm-Gg: AR+sD13YUXz4FacEmUGAAIVvKBA9gthvrZThRq/o1y65MJJP+6nYyIMpM2icPjzlPBy
	vRX0QVsFEFgjYVca3taJAIa2Ccur1ksoG/g7Grz2h8nWECVzePVyyHR2elkD/UopbSx5n1HKGj7
	XFBEkWQqCKNxux1Umvq5gY5/vfe651t3an+RtfrdCXAZzKvrvGhowf0z+H1IDkoKSDV1CNAhqEw
	7DgUjdBpBM6jJ5FkAOw+gudwnk60tkkxUh1921mChBgTAZIW/dFJI12+xr5Ut4pW0dpMitQWnjl
	y7fou0F1gRkH81pjn2nRbXZGBITIEYOdz/B+Pb+7W3SH8FZGpis+HBN+WKR6rQ0I+ae6UFj4yIv
	jxWZEN1cgFxWlEta2dLy33ADDSVebG/YvdrI=
X-Received: by 2002:a05:622a:118f:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52dbd769343mr79745141cf.38.1787064514166;
        Tue, 18 Aug 2026 07:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52dbd769343mr79744431cf.38.1787064513566;
        Tue, 18 Aug 2026 07:48:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db6127e2dsm41922251cf.9.2026.08.18.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:48:32 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:48:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	Brian Masney <bmasney+clk@redhat.com>, Peng Fan <peng.fan@nxp.com>,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Message-ID: <aoRwv93owSaasnC5@redhat.com>
References: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com>
 <20260612085812.AA15D1F000E9@smtp.kernel.org>
 <178672426822.5897.11563790103554525148@lazor>
 <aoLqSA3XOMJnJL4o@shlinux89>
 <178698381923.5030.9178300925075210422@lazor>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178698381923.5030.9178300925075210422@lazor>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 17, 2026 at 09:23:39AM -0700, Stephen Boyd wrote:
> Quoting Peng Fan (2026-08-17 04:02:32)
> > Hi Stephen,
> > 
> > On Fri, Aug 14, 2026 at 09:17:48AM -0700, Stephen Boyd wrote:
> > >+Brian and Peng
> > >
> > >It doesn't link for allmodconfig build
> > 
> > My bad.
> > 
> > I just posted v11 to address the allmodconfig build issue, very minor changes:
> > -obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> > +scmi-clk-y                             := clk-scmi.o clk-scmi-oem.o
> > +obj-$(CONFIG_COMMON_CLK_SCMI)           += scmi-clk.o
> > 
> 
> Ok. Brian already picked this up in a PR that he sent me so I'll squash
> this in.

Thanks. Sorry for not catching this. I only did an aarch64 allmodconfig
build before I sent you that pull. I see this happened on x86_64
allmodconfig.

Brian

