Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E213F65EB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397405; cv=none; b=lGuHzdkUEpbqwVpd2bYOUHpEn9nUQSGHaOEvyAEo8SYS1xMqhyRCq+eDvUNXTkHhfNiSpTg/E12vB7PT4ydg4s1Z7/XYzo//If0NloUwpD646EFXNEm1IIydXY/Yk8hWeDj8Mh/n4LW8dm2TW5K5mImJe1CDnnL0CFKq74ki4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397405; c=relaxed/simple;
	bh=KlsRE1nvgMWbUCCfsCqLaBkqTAG5KPcziTSTxm4TAZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWgx/NCIb99xa6NFfjF/fIVEOgjFJG1hSTZf8jn9VXQShhTWBLz7ur6dCX+ezCQctY8Y2EFeRLbWNDYugrwLHgTY5gQpVEpOvtj3Z3l3AzwazeuWLyhExZsVjKg9r/r5NMHMxtxEsbvV7TKUw+yIPaGXNPDs5TuaLWBDa6UeUV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DeHVfWDx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQanWlCq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DeHVfWDx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQanWlCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786397403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
	b=DeHVfWDx3OharkaALPRQ+/TourWXKxPvx74vnZn0nfC3LrVHfoCS4haVIRGgW8SecJmECa
	WlKuxavmEbaXDNpIF3mkHXC5LwZZK+RUIy4xMVYAiFtk24c0F4FcIGrDLn/nhW/+dE18yX
	zZZp5mJOASVvtcOsWT4vdz6/M1tFVuw=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-UswqcjiLO7uRhon-xOlqgA-1; Mon, 10 Aug 2026 17:30:02 -0400
X-MC-Unique: UswqcjiLO7uRhon-xOlqgA-1
X-Mimecast-MFC-AGG-ID: UswqcjiLO7uRhon-xOlqgA_1786397401
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-668a55b1809so7063181d50.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786397401; x=1787002201; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
        b=UQanWlCqhbJCR87lggr5Dnbt7TKuNcLseOKyL9jeNkOvxVLWzUrpeLKz9OjGAznjSg
         J1IWlP5IAXh76bxP+LbeZWAxUsVqNKe9HB83o2Xa4g4OTPCmBn7pbBXUubJXAi5x+wuL
         xwph0BNjX1Q6hu2MNn5b8qrHM0f1Yk04q0X6XKz9pH1YKa65hXC6IiLzNh6Xx/ppsE/m
         dSZW0H5dKKlo2ZMWaWrW81S+fwjpYPrf/GF0nOujLFsK9hxwTZyXs5/BJPyESkihhSmd
         6aa+DwhYDQdFd9PJfcZ2+v5jpjL/h8RQY8Sut80omz0fv+dGMbx8hfnUw0jshZec1bz7
         0I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397401; x=1787002201;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
        b=rmnth67dqjO682JDTiyq0sKVmCB2lI+jDS+buCQEHYIK0cMcim+92v8hDD9fJQfJMT
         /P5RBvDeR4PhVFb0vag9VPaHYLeLTvfBh4OqaMniU7+1zdJBaGqg92QU8UjoDKkvbCUF
         RjSr1IOQnwoqJfQDYpRNtWW5TS5QHx4tvQnXQD+ARjZJeBIEqNYl0Ff2MEADhQQY4s+i
         hbnjBpEVcFmGBkdfXlqqFd0cuX3YMjUUVRT3rXVlq4+S6WuLUfPo26ohcfx5GO9Keiv1
         nGAazDOcyo6Wra9QGlrmucmRgg9GFmguUXVUM4xqeuzZgie4hKdE9m8h9jM9XNhkZcY2
         X1YA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3x5XGyxTG7e/Lowgg5TAepN6YgxaJccAWUlVrUAlSdKBEFyhXUAjAmW3I3XyY84q9B1b4IzgESNFs@vger.kernel.org
X-Gm-Message-State: AOJu0YxQtRBOPxRyz5CN8f8Jaz6sTkgUXZ5oGSApG33JI1B1b5U79oPQ
	SmyNJt8/dVkWfwzjcx2d1p/QU0HEoFgxNvTtgeBrLFQ2Q1DEtSWhaUCp79Lm0MjTPmH/zLHvRDI
	8oRJ0KG8Y0RPnnxkcqc+BUbfMdgnKTYcKr8+ZH+ssLH002Az+8ywujCYho9YjPrU=
X-Gm-Gg: AR+sD11nkFZsKMxKlSLrCk2xH4Im5wir2r+WxwENsKdgzS4pauFcLY23uitOx0m8kFJ
	b5nvza/ydPvu+M/JQ45yHPuQ1FCrj4y/tnsnl8+077vM95J5ZDA6xL7kz8WqVD6RaPvrSyCstvs
	9Z+HiKEWnljTyHkYrSCESCWTNet87li+sJ03PIX/Z5SWKtm0uvfxCSopUnQfVTYZVubmKF/F3nG
	gR7pYoozYxOEk39UWHNw4MMAEIyERqGAj8uFxueDQYd5okO7/sYwb0F+3dolxdj9/2pq3A35OdA
	NvdxlrMkJ6Coobhoy1btB3/RjT/D2pfx55oYuopNuzVs6Xl/i1AOszbiXJzXRbF0u37GlG87hta
	QpbcujYEZCcZ1IG2kTM3x8Nc7zGCfH65FexY=
X-Received: by 2002:a05:690e:1341:b0:66a:faa6:b5ae with SMTP id 956f58d0204a3-66afaa6b713mr7196137d50.19.1786397401494;
        Mon, 10 Aug 2026 14:30:01 -0700 (PDT)
X-Received: by 2002:a05:690e:1341:b0:66a:faa6:b5ae with SMTP id 956f58d0204a3-66afaa6b713mr7196081d50.19.1786397400986;
        Mon, 10 Aug 2026 14:30:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acad2ade5sm7178798d50.7.2026.08.10.14.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:30:00 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:29:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v12 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <anpC1eRq5ajN01En@redhat.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-9-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804163807.1285869-9-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 05, 2026 at 12:38:04AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

