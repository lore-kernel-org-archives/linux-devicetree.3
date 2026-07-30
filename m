Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137E43E4AC
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433097; cv=none; b=k7XuLxfRhNx5Vfs0eJ/nLSpzrxdDv5zw1ZmPfyY31catNQjTlrA5QsHQ0zLxiWToK9hFV0p1Ij1NToKXYqjnx+jkRIqKrgfEj8s8qPu5Z5RZORrPerpcPU7PFrM8TIzUNO7i0qMys2GrqG+91iL0fuZN8BY9yb9g0kP0aU2+TZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433097; c=relaxed/simple;
	bh=tcCAaJdWJcVjCNXkGXLQhu11kXbWbdF1H1Q7waoPhQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv8X6BBL+ebr+84mH5nrYoIaH1GK4SDcdUIVYUyQPWeaZndQnKma5GE/vnqC5TmZXXGfe/oPrPzxMXbhMxiIaxtdP4NLeSoC0MlocAikFhl0z3/QqNb807isA18gBIXVBuHy37ejFh+qbcBsyZGHy7WuiNoIbU02zi6qSaUjGd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MAx9AqKi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qmv4/Aed; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MAx9AqKi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qmv4/Aed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785433094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
	b=MAx9AqKikPvn6iGcLjQRe1I8PVTczFfauGZlO2+upx1zr2ppAySmazVzPigFDSfY7T5nl8
	6/iUNA0G9BU2d4Q3xe7U0koYmw9RLYl7N+M7B/cx+ikbKu+w/V5+DAFC0vy9YydWDCsu3v
	6S5wInLcL4L0gYfsQ+4EAGl58wuWrpM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-gfUdc1hWPPqPYKyqT5iqrQ-1; Thu, 30 Jul 2026 13:38:12 -0400
X-MC-Unique: gfUdc1hWPPqPYKyqT5iqrQ-1
X-Mimecast-MFC-AGG-ID: gfUdc1hWPPqPYKyqT5iqrQ_1785433092
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e8a76a273so2899747b3.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785433092; x=1786037892; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
        b=Qmv4/Aedan7hcQz8zdo06qi5nF2HNxgwap8nyZp7bAn8QBUXc3TOzbpUdal1eFiUML
         C0zklhtMi0rR5A4m1KlyOi54aCNThRh8/1nCR0poZuqEpAMZWpI1k/DAz59nd8p+IaMY
         tcDhI1OybMqq/BZhZQAQEUClDgzELJ/OmpAQ7zz1XpJpsyyMRqmE9+HU9O65nNnsBSrH
         BWhkVFtHlc85dNdGdzJX7tyBC+ue+SZOH37guVAEXzPs1KZKGve+ATqOcWuo0ej0lQLC
         PXEBIFcsfmPmaxWRLYgZNRJi9fHbAS5xw681j6aOK0IiCdUBfa5K2YKQ60ft7Ur+VwzO
         OLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433092; x=1786037892;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
        b=Ct95bkL9HdfubXs3DJqiPgl83yHphqG6YSTI4ecckASbYiKPONtzDgMD2coQJtJZ3L
         b59yLsBfFKPTLYqTaarBKr9bPkw0mmNW0WWf58gxs473SWC9s1QR044NDDiJxgq9fSFs
         oWfRKTCx8D1XlgYVMtxTeDfhTkrk0AugK96sSksyCjgFuaxHWno/0a6c95apcF9a1AMu
         XGfnWQE5UvdVmyxYhI4MzvdslTX+UgasGP/eLRnyo5J4rrY6+fZvi2Sd9oF169zuW6SZ
         FnbmIEBvkRhYZ+WkH3vv28pDpts1U0yTLAExw0ovIWm2YQwGSKJa1BpLtT1NoKOCgDwJ
         jFNw==
X-Forwarded-Encrypted: i=1; AHgh+RpzmYv03a/FV6impcE0UHxQqIM1y11ldiXfO0Iw1c/9kXDlIEeeVZ2SYp5cUlCehBdZvGSnPtEDAqbG@vger.kernel.org
X-Gm-Message-State: AOJu0YxMbnFnzvb83IG4qGmXpj0BuvQoKVL///hiimcEH1X+dEoYetdi
	sKPlecIzBo8SutZEjJZFTVPtwt8cDKUaCQWPtIxQUw1Ckg/QAS1JEQqJU2p8TA0hswJJx7/P5h8
	EA4/yso00G2xINDbsC43NQLI97ZxR/XWbLaMFn58Gdp1wGDhF0+mGi/O45KmUkJE=
X-Gm-Gg: AR+sD11vWiKpviX4ha6n1cXipwsGWcHtknHyNnjR5NObH2zZDMOmVsAeiuHmKjfQs+n
	kN71Akh5zRHYqNjQJR7OqLohnEWVEwA0m2BmdB05/ANJCPXij08huSo/TjkduZ1zsffqrNHsXrg
	J88RfaICvsLdyLwZWQKw1UFJq5aAG4AHokJNMiZ5T3pzAiUsVCRAOWmODqsWyIPoJcJa4I+WOBJ
	PBg/FL3dB0r4oNGjNAshvceqtz0QPtGtIZvY/DFNc62YP5dFgR9+IWvfvUX4ubEC7izTKtYGOfb
	0q/I/TDxl/o6d7rp13lForb4/8aehhTq0FhdgRNCinUWrf4ENJEDZXkNtA2swtk9TbsrKfFRuux
	XuzfZ32IZp9JeOUR/O9JQKVGx5VL5a1GzWxw=
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018707b3.5.1785433091941;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018367b3.5.1785433091480;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb87315cdsm14274757b3.0.2026.07.30.10.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:38:10 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:38:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <amuMADxexEuJJG44@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
 <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stefan,

On Wed, Jul 29, 2026 at 12:25:34AM +0300, Stefan Dösinger wrote:
> Thanks for the review!
> 
> Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> > Looking into the other patches. There's more mixing of the clk provider
> > calling the clk consumer APIs here. It looks like this just takes a
> > reference and holds them. Would moving to parent_data address this?
> 
> I think so. parent_data::fw_name is indeed something I have been looking for 
> and didn't stumble across myself. And I suspect when you say "use 
> parent_data", you don't mean "use parent_data.name everywhere".
> 
> But it raises the question of how to handle internal clocks, e.g. foo_gate-
> >foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
> found via fw_name, and only foo_gate is exported.
> 
> For the other clocks I currently rely on the string matching to resolve the 
> parent named in the static init data to an actual registered clk_hw. The 
> alternative I see is storing the struct clk_hw * in a table by index and pass 
> it in parent_data.hw, but that'd require managing the extra indices. Or build 
> a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
> matching.
> 
> Am I missing something obvious? Is there a canonical implementation somewhere 
> that implements modern best practices? I learned that looking at existing 
> drivers isn't always a reliable guide.

You'll want to register all of the clocks with the subsystem. Take a
look at drivers/clk/qcom/gcc-sa8775p.c and here's an example I picked
at random that shows how you can reference the parents with the
parent_data:

static const struct clk_parent_data gcc_parent_data_8[] = {
        { .index = DT_BI_TCXO },
        { .hw = &gcc_gpll7.clkr.hw },
        { .index = DT_RXC1_REF_CLK },
        { .hw = &gcc_gpll0_out_even.clkr.hw },
};

static struct clk_rcg2 gcc_emac1_rgmii_clk_src = {
	...
        .clkr.hw.init = &(const struct clk_init_data){
                .name = "gcc_emac1_rgmii_clk_src",
                .parent_data = gcc_parent_data_8,
                .num_parents = ARRAY_SIZE(gcc_parent_data_8),
                .ops = &clk_rcg2_shared_ops,
        },
};      

Brian

