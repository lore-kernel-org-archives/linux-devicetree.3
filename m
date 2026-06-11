Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D038E8D5
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169254; cv=none; b=QARN9TjG0gSHB4ycuTKQfxyArJxSryEJfvTZdcTtmRuMX70gWE0F6/jjtwdsirDZsdmgt7hMHsrKSbPygRKZsvtQsz1JrrWxjyKYF5MVcGcm1rl/5AoyKML5ugMxMDRgcr1dFZl22CknDKcycVWyD+0lyQocsfhSCj8OcXvLPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169254; c=relaxed/simple;
	bh=4CqiEOKp7G7+G9FT5Fh+bQy6KqYzvJWqGt8d9d7QZFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIDH2T7SCaceN3l4XPX+BVuh1G6rA7fdDSeXIW4FQVKSVo8vdkqS2w/YsOrBBfPqL39+DT+1gU3T2Jw0UiooM3yP0TmUkR7sic19x4YyyE+uEUVGe6W+/N/QKQ4buwc/rn1bCtYDsaHFkYMoq1r+ntUVrdXZHZaa83XQg15BKwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBxSmj7C; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBxSmj7C"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b12270b3so46369935e9.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781169251; x=1781774051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3d4LMOrRVe9Dpt71iC63qNlgFeEkSybcIKSVZrkmmg=;
        b=dBxSmj7CXI3Ht3IxAZVlELaMcu1PiEN98SwB7gMz2blQqTs2Rn+CTsVRy86A7Hnv1m
         rF+dJYkWvla6LkuQxSkXgMC9EoW5h8Vu6BXgtIa+SLAyR2EyXNn6KbMj3cJMyy3lPbLG
         iaKxxSl7ZdmqlB/e1iTfiUuhqGS59eymwvq1tIrM8iU6LhaUxMFZab1fQwaNo8rIKTZV
         mfdGrcRzWQFVRRpli/5tcZlTH7mlncfEVoW/XEe+P95ovpq72rdPjhi4Tp6SYdAQQl0X
         wJMkdbOBdiOI+kwWa9QbIV092VqZcCCcoJMDOBcMNJdfmQN7k9qnUN0+Aq0VV6/FemKF
         Y/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169251; x=1781774051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3d4LMOrRVe9Dpt71iC63qNlgFeEkSybcIKSVZrkmmg=;
        b=tZlwmk3+x71jzV69BlshTKm7uj6Lt7vDa9cQdBYm3iyxmz06w4NjqDz/XwZ+I+sRhY
         v4pTxQzgMKt0LGxkRcQj9V09Z8TAxIVIifaMWW/AMUCwZFqOktCpu5L2WjH4M9UC9pBu
         3tK/x1hPxPK6QlkziUF+3XcOGaQ6NMCvto5zoHjUWU0oU6awMX/b9GM2Lf16J8kvr1mq
         gG6GC4cQM2RgwEzD4et4ABQXMFPeYDdKfXg+LyNV47lzo4ZXe8JyPhdMzu+OtHWyEcpG
         Yq0RImN0u6uAnoZhA4YSE6WxeuLXGM+56QwMe/d/lSQp/d0PM2CJTdXTbQ8k7WQzEcDP
         8dSg==
X-Forwarded-Encrypted: i=1; AFNElJ9PHKZzmEu+myXFdSs/OAGlS3oeYZLzNNyN/CLF73unK/ZvLdq4ndtAnNX7uF1vDgsDJg1MC807oWEq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0SyO54EYgCAO0ZGEC5Glw4ogON2SE/ciYOUtkUHKHyGTAKK0I
	0hszBh73ofo1StZdwbAfR4tbpYqBgHyHV3d28EkQogTwtq2DOvjvXaok5e6gXUfJ+Os=
X-Gm-Gg: Acq92OE7RKW+S4OfASCoAMPrGsuS+htx8Swvk6ZQq7cbJxWPqLDCTDlPyRDQRe0e1Lr
	iqr0MV+hs8ohHwHhkPSQ846z+/40SRXqLGQJoSnWn9Sc/CkBZErYqqXxYsoSiqokuNaEJuhrxEq
	u6j31oBRBD5Syo0+p9Nls6v7kObRPmrgz8bF7LuKS96tJ70dGlpvEm4xLRPaVkQ4EPC00RFSibW
	763/0dtw3l2VywLkmTePxBh4nfSjY6X0bMhq9egUPclsxbeuDmFwRkY7pblns14K564qgKDtqmh
	/Q6AdSNZMIbL17HvIFwzhLzO9eSk//SAhudQCh8m0rpCAz6A68G9evB7ojAijVBaMFHx/iW/o2q
	YZTXOAW/z2rrWOjcl9XyZNlZboITJy/ltxhKGG6UevgbtiTfSQtqk7iRsq9IprlbWWY1h6CL4o8
	uMDuDGl3oeTb8XgsjRKOFSMTz41aToY4UWnB/BklSZ12WuHQ==
X-Received: by 2002:a05:600c:3550:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-490e5d0fe68mr19389845e9.20.1781169251573;
        Thu, 11 Jun 2026 02:14:11 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2cf5537sm59201665e9.9.2026.06.11.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:14:11 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:14:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Message-ID: <aip8XtKoS2xTYv4L@linaro.org>
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
 <61fea0fa-d7af-47f4-a3c7-21d881090008@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61fea0fa-d7af-47f4-a3c7-21d881090008@oss.qualcomm.com>

On Thu, Jun 11, 2026 at 11:10:51AM +0200, Konrad Dybcio wrote:
> On 6/11/26 10:55 AM, Stephan Gerhold wrote:
> > On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
> >> Add required nodes to enable the upstream BAM-DMUX WWAN driver on
> >> Qualcomm Shikra SoC.
> >>
> >> The SMSM (Shared Memory State Machine) node provides the power
> >> control signaling between the AP and modem for BAM-DMUX. The
> >> BAM DMA controller node describes the A2 modem BAM hardware as a
> >> standard DMA controller. The BAM-DMUX node references the DMA
> >> channels and the pc/pc-ack interrupt lines from the modem SMSM
> >> entry for power control signaling.
> >>
> >> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > 
> > I'm quite surprised to see this 15+ years(?) old hardware block being
> > brought back to a new SoC. Is Shikra not using IPA?
> 
> That's correct.
> 

Ok, thanks for the confirmation. It's nice to see my driver running on
some new SoCs 6 years later. :-)

Thanks,
Stephan
