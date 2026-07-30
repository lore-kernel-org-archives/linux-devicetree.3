Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34123A6B7F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430773; cv=none; b=bTFK7ErHpwbgnM4mTdVAEsEtdr6Yxd27g6cPD+8sfRGwLdl1tskl1Zai1J83AQtiSkmZJ8yExgAmIJnCJQXggdekt0JLCVryF2xVcad29qi29keVR3o4xjV3crrl0uPtrBp/LbHKb0dCgdjUAzzsnVvlJvaDZtkPlaxXPoyHt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430773; c=relaxed/simple;
	bh=3lmQCYzBha89kHS+EhbYd/cgSpjuQhReEslTXaDFnAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNrT4IwqrVPP2dMpxzMSVfmuhuLMZ1ay2bgZROWmmRfXVk8NjC1gWy0yW0S9ggohNx4F5hUma7gH7PbKprK32qr9YrK5yuN4gcwDD0kYbzyNZc/dK42lpb3L4paDQfZyPIh00l7jJJGtA5/Pj3SkRr+Rt1Gcu4xkJmKhV0Qa9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GO9CPQ6I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oYnhXcqU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GO9CPQ6I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oYnhXcqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785430768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HX65Ch2e5L/H3egpVLAiomgwfoL6WwHR/EjKu9aKa8=;
	b=GO9CPQ6IQoYag5X7kWhPqr1CtNBnVmkIUTuyYTyRvclkGqmBxDiEJZ45og0dp1LuqGzS9A
	JnpZOU4FW7j+jZS/CT228FgpWFlwx+aPp8oG0+Cl+tRfZqiEPL0wn3vMpwW2imQAbXoen3
	wsaLqEnPjij67mxOjzY31pswHTIRgf0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-W75f7mmhPFKYNdIMIWH4fQ-1; Thu, 30 Jul 2026 12:59:27 -0400
X-MC-Unique: W75f7mmhPFKYNdIMIWH4fQ-1
X-Mimecast-MFC-AGG-ID: W75f7mmhPFKYNdIMIWH4fQ_1785430767
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e76f0dec0so22725557b3.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785430766; x=1786035566; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HX65Ch2e5L/H3egpVLAiomgwfoL6WwHR/EjKu9aKa8=;
        b=oYnhXcqUcjsMrk9E5LMHW1GE1Hpst9oTNgy3P91XbylN1WxW4oCXhOLYPY7JRI7lnc
         OM8Me+gkQKi5SF/nw8Or3IxIkjh9xLTDpzJdEs2w+ON5+ezI8IUQeEMGVBp++twecGmS
         oBrmH9sVwKCg2j/g8w9AK0QIKHl8eCmC4KVCAK+SY4Zss77qmxKUDboFomSwYbn0XUuW
         p4PrIldcyH3+wZACoMhubKE/y1mgjLPlCC3Dheydn5RWaT6W+a3/8g+2CafT0e1zcFaD
         J2vHMFUw9cHp4v6DDaNIZBvgXfLQAW5RNuLMbUKoFVXdhU7kcDWAJIdUPVuVBD/N4NAp
         Vwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430766; x=1786035566;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4HX65Ch2e5L/H3egpVLAiomgwfoL6WwHR/EjKu9aKa8=;
        b=lH1FLfiWxiIAocTWdYOtTXJhNmO4eC+3BmUzbrwlpZWmUj1KqCdwvh/MgPiaHXWVET
         dk7gBQuAgCwccPM+FQYNxPn8XgqqdwF8LnLcRSdUyjKsGsklhxgQvllAPj0BaUVjf4pz
         DqoWo6wETMQTB2mJRRqraQ5Pv/U782E83JcdFAcHJqgHipRdK4wldxBclj7HcbQQVPmk
         4KldUcQHA99eHCzSUrv8JClqnH2b0vYprpaZpgSYlm/hItB+8SUqsn/5POjlp3+U5O5G
         PUAvnqk2HWbIqUamw3CXF/CdSEJsUyFLt8tAP8T9eCo3ulnyksv3fGwF0NNF+1qnJ+sl
         XusQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGAXDJ/7lXHtu19U6A1cfkrU1mPm63DuCN0+KlZy+wcDooLaJp5+gKEFoaO74mMCjNV882ds4w0VG2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9UGIgcmFOsJK/k4FDGN+/iJo8xl6q1D29ENzPX+RUvgnOj1wQ
	JisUQ9r3QwFPg9TE3fBzebOcFJGqLTbr1Sia0PFk6TT5iq/xbVo5wGSbgysQ7hEOUaUZcbiwtke
	CJOEAmTuIPZi8Rdmf5Shf8MHPpe5tMq4Vp9Z2J565tQjXI5Rf2rP8Pw0O7P+b/1w=
X-Gm-Gg: AR+sD13ixru8WCcEgvcNn9luzCM9yUrB/k1b6+BV5iddyEiubikMTGHRZDJUKGegHy+
	INOqqlILbXNK1tdca+UydAvAAKO444BDZyIRrQ4wjVFPcWCsMgTOmWW8MxRW0cgmaqXPPLx/mpO
	Y4zjfCMl4yy6EiEdvCU6B2uv5fesH4E7NxLYlbRCzRi6IIM7CWpjsTvxwLWgAzFaDtCMmxCE5So
	qFxrC0FldoDWf2J8icNgf4RK1ZHtZg1T/NNHFd2DiDFBFceQeQEKPdZFoNylNmkCn5itSmJfZhn
	SanDU6vZe+FkiIvvqf12aQKwn12zvkxt3ti+eyccow/1ZHx/gZ2BRK8badylzB1DbhzJcKNNkYB
	7p72lzyI/b/wTo721nwL+l4SvLhCsHudJjDo=
X-Received: by 2002:a05:690c:7204:b0:80c:88b8:2dd9 with SMTP id 00721157ae682-81fc1efa6cemr7837037b3.35.1785430766497;
        Thu, 30 Jul 2026 09:59:26 -0700 (PDT)
X-Received: by 2002:a05:690c:7204:b0:80c:88b8:2dd9 with SMTP id 00721157ae682-81fc1efa6cemr7836827b3.35.1785430766105;
        Thu, 30 Jul 2026 09:59:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8af2969sm13718907b3.42.2026.07.30.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:59:25 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:59:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for Si549 programmable clock
Message-ID: <amuC68wkwgNL6I4i@redhat.com>
References: <20260729115310.3490589-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729115310.3490589-1-pavel@loebl.cz>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Pavel,

On Wed, Jul 29, 2026 at 01:53:08PM +0200, Pavel Löbl wrote:
> This adds support for Si549 programmable oscillator. It's almost the
> same as already supported Si544, except it uses different internal
> oscillator frequency.
> 
> So new compatible strings are added, and driver data is extended
> to carry both maximum output frequency and internal xtal frequency.
> 
> Changes in v3:
>   Added missing xo_freq member description as found by kernel test robot:
> 
>   https://lore.kernel.org/oe-kbuild-all/202607291708.qFSxYL2s-lkp@intel.com/

I assumed a pull with v2 for Stephen here:

https://lore.kernel.org/linux-clk/amjbNiVjm5HkPRu9@redhat.com/

I don't know yet if he's going to pull that. In case he pulls that, can
you post a separate patch for just the xo_freq member description so
that we can merge the fix separately?

That way we'll be set either way whatever he decides to do with that
pull.

Thanks,
Brian

