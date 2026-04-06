Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6F62D0614
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493785; cv=none; b=b8ezGhNB2B65krosps7DsyFVFC3zvIPAhH3tbiJQItWIioz24N23hvLC+DDzKqTaHlYubwOSRQUGlgSW8KyPBJvC/JmnPTM141DUoCetKRFQ8SSUiwDvPOMFDLaEWuQA/8XoN3wvpTc5z5jJNsVkFG7iwBTazCsAKXaLL999LVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493785; c=relaxed/simple;
	bh=8AEJNQ4msK6cNTa6ATtxHjzz8LTlHzHID6Q50KhFUmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnBCiidz0aQOlHh+MC7J7/NKRGMR7s6kv/5Gxn6r+khLExjz+o/nltj1DGMf3c7oo7YzDmTuD29hEZ6l+gAA3uxsP6ex42KURyvum0H+PlY1yOTyIRjUpxOsrsE0O1TsVDdxBA5/tYcn4+ubVglaOtI3/s2fr73ZxIIzBWd/ROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BmX3tC9y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i2THfmGK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BmX3tC9y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i2THfmGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775493782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dMwWKVhVJ1fHBaBpDqwIM6d35QgVz9lKTn0YNj6lHps=;
	b=BmX3tC9y9eSXZbfaDpOETbYNuB5gd8vUSvnpbPoFmbjmCraV1bYUL4xHbZ45b4GrLoVWMS
	PlWF/i6bV3VQeicZPmpBWnvbT2ypr7wjhYxqYggjBjIj8yD4X7HqA3H5vZoahvT+2degwq
	OpcKtMjfiheIaClLGFMCu0J1nyF58OU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-Z-mOiSyzOgakfdc-l9v57w-1; Mon, 06 Apr 2026 12:43:01 -0400
X-MC-Unique: Z-mOiSyzOgakfdc-l9v57w-1
X-Mimecast-MFC-AGG-ID: Z-mOiSyzOgakfdc-l9v57w_1775493781
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d411d0c1faso754454085a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775493781; x=1776098581; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMwWKVhVJ1fHBaBpDqwIM6d35QgVz9lKTn0YNj6lHps=;
        b=i2THfmGKcw77ihbpvx/6zeLYe9tVVubq13d005pTdfYzlKbkbfehH8jS2D/AM6aOw+
         x9nnpnveQc/iN7EkBAQe9UWZijxhFQdeQiSShCJNnNLkoeVmwVBDPvCP0jIcXIlMQ8qU
         7G5uLbqp0nq4KqaslSsCS5oPENZOI6s1CbfXy6j7dNZZuB24s5pr2qa1maT1EanI22HU
         rhWZGsG7f78flqt3mkgNxY9lWL48YTCkVyYW6apTAG7GNohd5yfreQ2PNqfqDf2+xv8a
         ktUMWgvrPMf1+fnY2h9i/8KR/860SG+pPTKEabPjhSJ1oxZHBewdZ8hhXBVGTjGyieJO
         9qqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493781; x=1776098581;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dMwWKVhVJ1fHBaBpDqwIM6d35QgVz9lKTn0YNj6lHps=;
        b=Wvgrtw/T2aI/MnXAjhdQ3W2wrgUu7QXDM2sr9uoKINhj/pTNsRb/PdbNForfNjn1Qw
         mVZO0wDVC6Q62yJzFRqIbln61WW/EXhlyPLzGlE8ss0a1tFmO9/N3vois6SpYy5uZPAB
         t6rcGTfkhrCaTClD/X+arTi0eI2mZx6EO+Nnze42qcb8FLFJjztkDbkT9hakFUeL+Z2f
         pHoYS8aYHCNPJRM0Nb4AF2P04uv4D83D7O0weKxCuL5hyk0w6SPjTLc4NTVsrCmCez9x
         3i+UI0Pao6WPj49o4W8XZa9lBlLQj2ugcS1FqBGtN7zc26a8r3SK4CqtQPZ62X9tK43N
         pYOg==
X-Forwarded-Encrypted: i=1; AJvYcCVz0kpqNsV28kwl0JfMOP84ZepHF43CDlJVUEZlGVOCNnNjPoGJzmM+WrY8FxT+xAbV9i0Lll1bHDFm@vger.kernel.org
X-Gm-Message-State: AOJu0YxAwNaBpSJSK5lK7AKsT1aCNPRrNYSPLedsOoNVx3jlhRHZ1YV+
	4Mg192iTcafKVSCGVw9B9J9xw7VhwGpGis0Tj/YtpFzpresOO8zKNx0VkHiyo7Puuxslfi9Hyz+
	oIqMDjGgIz4g0Ht+i1zPxCdL9v93YKmRfyW7/5jJI2c6tn7PCAkSSF8pMm3Gh52w=
X-Gm-Gg: AeBDietctOz2ncTKMS9zQ1qac10KNYXkPddaZcexjJ9Go0HtcYCIR7JbzeAPCLZMP1B
	42iZbjW+r4t+tVxRPZ0bG4pHFFte02+0u+pO3cxJj5IhwHGe3YAl3pLxECJIGht73r/1sQ7Fq7G
	RnQzjSIWB/aBYBu2V5qwysi6HmQcp1uYzWPMHL7IrUxHzTkoDjb0cyDPn7ulCdufsASB5+q33jP
	JfdgVGX6lUHf8m/jVN5u90VonSNgXMRSn89b5zlJ7d7JmQVmi+xsR+1dielbvT7jpwpEJNKmNuN
	AXwFAr84t0oV78c9cP2hF3yjnVRxvI3EmBh+A1hhzL3tsMTrXslc1q0jF+0r0S9LqiWBmMoUILI
	uIGBVgv5pWZc/uzfhA0d91+yqCOZUHhuAdXQ0xRvlstObBphea+CFKnNd
X-Received: by 2002:a05:620a:298b:b0:8cd:b317:b464 with SMTP id af79cd13be357-8d41bcd8f7bmr1894754585a.61.1775493781184;
        Mon, 06 Apr 2026 09:43:01 -0700 (PDT)
X-Received: by 2002:a05:620a:298b:b0:8cd:b317:b464 with SMTP id af79cd13be357-8d41bcd8f7bmr1894749385a.61.1775493780699;
        Mon, 06 Apr 2026 09:43:00 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a806cd69sm1095220785a.29.2026.04.06.09.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:43:00 -0700 (PDT)
Date: Mon, 6 Apr 2026 12:42:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: fsl-sai: Add i.MX8M support with 8 byte
 register offset
Message-ID: <adPikplWEEPfYg7i@redhat.com>
References: <20260404183419.46455-1-marex@nabladev.com>
 <20260404183419.46455-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404183419.46455-2-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Sat, Apr 04, 2026 at 08:33:26PM +0200, Marek Vasut wrote:
> The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
> shifted by +8 bytes and requires additional bus clock. Add support for
> the i.MX8M variant of the IP with this register shift and additional
> clock.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

