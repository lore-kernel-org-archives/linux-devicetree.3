Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6BC405C41
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100574; cv=none; b=rAIwlKXWlS9fdxgAbekjV1/Xmdt2E+rtSZIxdEe1QEpg86wI4W9JE0o5AQI4XBtac6JDijy8QsJg87h8AZCkj86zjj7UeGn4u+ZpM/uZe31MMZiUeQVEK8BRzfGK9xm5zFQAyfEQhV6xybNMiGeFx2ANu+SKsugLoRKdg5BWcpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100574; c=relaxed/simple;
	bh=xOBnAKbfMwDSEwiOfNlKTQ/sIOMtTg3T6ON0DZHh4gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBVHeGxBf6832qb+HJPkfOm5LdkYKpCVvCCJ1NalvZeqm9q/AVi+YfXaOwzuJ+NwezMqF3nz3dLQUnkTdH/yMwTRnxkj9oiHzckDtlFKHvEGCqSohETSaiDzVP0gpXSJ2xQQVKIKCtEOcg3w7uM7vcCLOwsd+kOKKm1f/pNh8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0LL6f+u; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0LL6f+u"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso58079685e9.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781100570; x=1781705370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Yp7dQIH3qFqTFCTwClldJqvJ4eJdBAvpo4TLN8Qmpc=;
        b=N0LL6f+uTVBdblveTqDHTS79wedP5+/lItTb5xiZmk11jHcWHRP0qYD7PTINm6tfrP
         sWcUsVITDTYAG2HLwO0cM16/KVaXPtGa6IcDvQq7FKmQczuWXbwGKo1UnJ4+VbYOZci9
         8IHDBDqrLzLUxh1UXLsvXtwM7GMxwj30OnAOUNFDy5nqS/0SA65VjbCgkCS3RxR1mxnd
         P6WpfwyME7QQo+niO5/H2jBNkwIeIm3W4Q40dV9/zdTBUnT/JJPlhPs8hDFE9hIclAEd
         WpNvFp1lrmvrYOOsEJpiZQpy/+9DFz2iXJ2kgaanNCk4Rc/zaH8mmXfGGPBFO92VXSi0
         9I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100570; x=1781705370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yp7dQIH3qFqTFCTwClldJqvJ4eJdBAvpo4TLN8Qmpc=;
        b=g5vPq2TDpjZIlIDqhvC6thMsHXq+y8/EPOwquh6a22VVz0CYOcP3AESgKGAevA6rmU
         Qt7GrX7XlyOu2g2DuUyxfAPhH4fjnQ0rqPfjG8rqamFtXrz8wq+BGV6P/PoP5zCfEMXw
         Buv5WKLV9nn6Yi9F/HW/7XCMN2NY2fy+5atktONijmX5rTpBFgFpykmTCJP8eGbHk70d
         o5WtOddusAXb9DKhpeo4b7Mtw+21u8h2YwnK6rvGb/w7UP17Ef8Eu76RH24FUmFfg7ub
         nn+ZauuTnhtI33hc7RZRu+fo4EL0O+6LRsC8W/abLyuv80CDkxq9n5et9eCGf+hcVpHe
         n94A==
X-Forwarded-Encrypted: i=1; AFNElJ95hM9Mk0ibKGNo1KHS5oInb6QGOD+G91Dl7mxZ4oDSgr3qae5+t8Gi/c0+9gIyyN9iUM+9c8wHIn8G@vger.kernel.org
X-Gm-Message-State: AOJu0YzfgxC0t0+4hgdQNHtp66frkGOXcYrDmnpjrVUEb8qIuW5WrEl7
	AaLklTY404R97nBwT3T1vITDSUaiAFZKxkLFrWus6g+qTRSI6WS4s6D6Hvnd7Pdog+U=
X-Gm-Gg: Acq92OE+XzJyTMsB4zsbXTdSQHEYVnJHoA6LQXzguvzPE+sqKzhunCO1UoiTajWZ81/
	RsboQ3sCZ3/VwehV8mbvRKIeNswftDrI1hiXeHDhLVUkvvHt1AxD5LbtSadylzeOyikPAV4ktkN
	2JY6jfnnppciCveV2J708oOm4xtgafafRhYBZg92Ei73sVtEzQf76tj+ynDaT5GZtde3nprDAnj
	dq2Gzokv3T+uIKWNYx1VKIg7xswQ1eCBeYk3pfDBtKqLkePFO4UCtM3bgTI23ZA08burPQuAaA3
	ErtKJscg4WtFjM1CAmE78unYGTLs/2XOEYIJUtxICODN7N8XamKcbgpMY07viv3z3U15OieV9Wq
	RqVTnmZ/bmcZflx6tZBvnJDIsi0sqrWZBOK3KkaFPMlvfTCRVPXPoVuQwhV/zbjHYHnaD8SoqDF
	4SCncvP+BSNMG13V18N1ivISHHOO50leRiwuDZNXEj246p/J4=
X-Received: by 2002:a05:600c:4e14:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-490c2600ebdmr362021485e9.22.1781100570315;
        Wed, 10 Jun 2026 07:09:30 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm559839415e9.8.2026.06.10.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:09:29 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:09:24 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Message-ID: <ailwFPgY13_7dZ-C@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
 <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 03:50:11PM +0200, Konrad Dybcio wrote:
> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > This clock does not seem to exist on MDM9607. Reading/writing the registers
> > always results in 0 or crashes. The math in the frequency table is also
> > broken. GPLL2 on MDM9607 runs at 480 MHz, so:
> > 
> >  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
> >  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
> > 
> > Presumably, this definition was mistakenly copied as-is from gcc-msm8916
> > (which uses 930 MHz for GPLL2). There are no branch consumers of this root
> > clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
> > parent instead of this clock), so we can just drop it.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> 
> It does, CMD_RCGR @ 0x37000
> 
> Interestingly, there's also an SMMU instance.. although downstream doesn't
> seem bothered with it
> 

Thanks for checking, but that still doesn't give us enough to work with
it. In particular:

 - What are the frequency tables? Which parents exist with which IDs?
 - What is the hid_width?
 - Where do we hook it up to some children?

The way it is right now it's definitely wrong. I don't think we'll need
it so removing it like this patch is probably the easiest thing to do...

Thanks,
Stephan

PS: This platform has the weird TZ-managed SMMU (like MSM8916), so there
isn't much you can do with it from Linux. Unless you are running TF-A,
then you can describe it as "arm,mmu-500" and use it for everything
pretty much exactly like you would normally expect. But you still don't
need to do anything with this clock.

