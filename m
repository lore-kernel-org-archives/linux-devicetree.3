Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE63033EA
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513000; cv=none; b=eTDlv3fwrQjoOk6RDDQDxPD421A39K5WdA7yLJauO59BK+Fzp6UjgHr0enNFtpUby9Sz2tdhmruFf8w6TWyk4rom1mp0ROxBRKswrfBGX+SfusU5uB7Tql4sc7kAAYV/AFnoJF8A4aIOIxLPnaS+C6t8BS7zcq8K/xNLvDIemEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513000; c=relaxed/simple;
	bh=c8Ubkm1ziEsqek//mhjbW78ei+1dabe/IIQaIcSfvHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAOOPLCEIGtQKzZbq1dkDe5e4wu/x6W+pTPDwDGw3ADJ1VrVfCJ03hmTmWZh/Hn4MbWyccOFMQwh/2QiSDXaNKwCTIHfllSI7xzfusSB7swIEkdL4jYlgFD2lg7mAMzSJDTUma+iOnWm3Zskv15SDgqMPwW+Pi3VUW8Jno6ctJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AnwW090b; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ijkD5Brq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AnwW090b";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ijkD5Brq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
	b=AnwW090ba2dfnfam8rbWmx6D2eLzmpRMA3YSN6AdiKz9waLZ9pwwtN3mlzBOgHbELpsa3T
	1pR9T5OFVs9GnaVHgI1v1TJWnjHFXucGPPdfO5M8+1fdYC/MsWWKTDQScTDjjdlFeGpt2v
	fowuHfjrHYcTqvqOheJVYC61ckbV3vQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660--JUbyNGmMRqjAfxLRcVGFQ-1; Mon, 11 May 2026 11:23:15 -0400
X-MC-Unique: -JUbyNGmMRqjAfxLRcVGFQ-1
X-Mimecast-MFC-AGG-ID: -JUbyNGmMRqjAfxLRcVGFQ_1778512995
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-908ab01aacaso542072085a.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778512995; x=1779117795; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
        b=ijkD5BrqXNT+QOhM0+zz1tuuf3O6Dh96S2QahvsCheJTk+ag3aZoaOjbFm4T97FKyN
         CzoPEDnQH2gPpzR50IGfCeJOYZYiohvoDIdywmjyJpnZQjhpYAXNpkdZ6BF0CSJIIQbN
         3ZqKsMC/GqcVjLviUM/BeVu7BQa+er5xh4/pkr+MJpP+aOwslV/pKhKDR9U2OAsZt3QT
         3BJRuCDAco7BgmbrWXHxW+cYnRkRRfkS+/u2ee4i4s+U1dW1s58VS9dsG43R2uCvaPp3
         fZs9Ge99ZaB+jrtOESqSEn5SsMRpmuzL1siucwnibknJVbmjBapEyu+osiHw6ufEEc9e
         P2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512995; x=1779117795;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
        b=hk43rjqRsGwU2Ro/REUow0f6serroPJ/HjCP0tbeosi2UylA04J/hEUlUSQKYR8BQA
         onS03AT6kMTiAGSdYnWDFRuakJhFs9VGzjfeSFVXvAKqOJDWuxxXJPJt1+F6CFUgbyzo
         vkPmAe2yaOscdWfjUDGI3emI9ftk/7mtmd69WaKmiDj+tGt4/SEn+gc+JKFnzYCirWnx
         da5+XeOCar70/z9AsnTqBT4hh9sr2hVnvNSIUukpkuFpgAfLVX7IZ5SpFc+TgyjYZOih
         miSyiV5St35dNE0CI2aeQ4Np2+S4h1P41iFeABfKx1CDDwCOUphwSSAurveN/A+qjXQo
         nSuA==
X-Forwarded-Encrypted: i=1; AFNElJ/oUaAuD3rr4GXwGTkYfQCLG+Q9ltOO6gmJRqg8mhmL6q4ZbTLIQ36+/Rcd3meAlnZorCO3OKSGpzBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyshUPGWLKECF2OQ7U8mF2oYzhqEpxwibA3mKdj3FrVX+AxwvnY
	eapu0QBa8cZcWpYWp0170Td/9HqGu79uGoWEZFLvv234tXJEx2DKZVHHQv8oqdrz+IDwrvXtRIK
	FNK4SdVq1OZ0VKkqo9UzNLpLfwUr1Cgi2WbA9l/M2Pd9Z8z/Qi4Zwwv1koD4qm+s=
X-Gm-Gg: Acq92OFSKjXVTWkGbwGjKSDU0fpvSF8Ojgb9CFdJElawoBxkuXOTakW7Xno5LclKG1A
	AdLbCTMczo8zhoSxbWk1jH05qV0G6hu1KkwtDiDHG67Ep9jQ+7gBNM+sN4V6G5qqx7NShHmS22X
	h6cz8ejEB1R9N8NYLkVkIELkfPy0Es4iIFc3RczgeCkqnLfjZXkqkpyLLZGtszN0LXQoGT+y93U
	0wFsP+LZL8lPc6IMKbmSf3To7LLjsVtnkf5EHd2PaxNR6BTOExCDeIp3H2SP39jMAa/JVMOuoIp
	LeX8sKt9l6/iPNrWNsezuTGNHZ0T/mzHWVb9hB8KguZ+5pIrHrUsL4DuOMg0zJBJLP20utTylTY
	GWFpBtK8FI9SGAqNS4mWp2EDYnWZCSSiQ8cFKkIpzPMUZtP2Jt7v+/McL
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602270785a.44.1778512994983;
        Mon, 11 May 2026 08:23:14 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602263885a.44.1778512994300;
        Mon, 11 May 2026 08:23:14 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c02fbsm1151478785a.25.2026.05.11.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:23:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:23:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
Message-ID: <agH0Xy0hD4MHjP7n@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, May 11, 2026 at 08:47:29PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
> duty cycle of 50% after predivision.
> 
> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
> pre-divider division factor is 2^n.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

