Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3988A40BCB6
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099776; cv=none; b=o7iWcY2f57k1WYVbQgHAaaTcNbI9Af+Il78c0XvJr+Dmj86uBJhiWix8qnZuIHE7Bi+yJHAUgO61waGruJb2GuaSWOcBnwMERatq4sSk+4aZP7pbY740pNhcJrsXPfWFO1esUKyqvphwFZWTZptHQyVt7YAPgmtMIrFyV85Um0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099776; c=relaxed/simple;
	bh=vce+NqjQ7OjaFBCXPFO1vr5ngJPOjbpOuZAOPi0vtGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXrN2ttr72QFRhWygR3GTnJF1q5t0lGb2FpUfRQzGzjBqwv0nqW6oR7tZrHfzi4y6sgfRI/RETjPhQy7qEGuZ1/ECLjKp9Vi5TFTys9Z9mBX+cjhijwFgNfkfUpZ4Wgrr2hj5kTb+OoNpqPZ4Rlv0uoogjpr4wLxKfVb0zPPjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDf90Vp0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDf90Vp0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso78650875e9.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781099773; x=1781704573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6x/S1LXWAlJufNMKimrj1YiILxNLEh0GgAmijqMitjY=;
        b=IDf90Vp08ivu0qRkijHQYXx6AE4dMuLY3EEGc4KYjfAisGUGyYGViF2AMKKrVtT5aL
         AB93YZBwJo9h41L7aGFbude9ZUQOqbkcaHCp4qlQxSqlWxDJXS9BJnT31CecXdPQtfMG
         dRP9aYkKDAgaJYYr0nD6F/il8qPzkvdQM785K1UWsmV/1z12ADMK/snw0wD6DIEYsAr1
         L/A4lmhxauH74r+5Po8C/dvl7QRtWm998q3TejijL06KGur7uRu6y9Yh1UDv610UFs0w
         WNyhxS1AyB0VkaHDsPtALTDCjuZPbHfXENq1JT2vD9o+slBzQRJZEKp+DXWkXwCGdN5M
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099773; x=1781704573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6x/S1LXWAlJufNMKimrj1YiILxNLEh0GgAmijqMitjY=;
        b=BIQzJETfUQ197d9KToNGOq4hWwFx+lCUkN1CG4HGYjYsy/f2o87deQtTbaHfDGLogr
         AffDMtFIgzCLeChjsJ9AtWas40wg5blXCQqAbdQnrdFL9WFU6FIwSwalQBPfhC+fDV4Q
         V/uPI+kKp9oAk3DbyIeaQSTx0ID3xvsTPcYFiQXO7rjp4UAi6NnZXoiCaa0hhelMPQKy
         F4i6hNiqQT6/j77btL1zrDNyY6e6UnLxIg2qnMKBSZc3CfCw250sdtjcZcmXn2VI08fP
         JXfwmhn7T5UfW2xnJcRtOw057tG/q3gkrveQ/vKwUMn2+F2kZ36JVELpzxaYjUdWIJk0
         rTHw==
X-Forwarded-Encrypted: i=1; AFNElJ88pzbMG+tsQm8oT1YRRwsUHeU1Xgdy9sQlijJnXCVM4uxoGmcw+oaZeL+grEX/nTh5ljfQdxm0w7/W@vger.kernel.org
X-Gm-Message-State: AOJu0YzEPG7SQu8+35PmmyDg/wuw4l/AxD9E0QD0JX+6pu7INPmXQx23
	EfjdnFHytRWPgJZ7kcuA2211JshzRGtSo/w0/YVwG9TvPQF7YaVqRhUq2uXo2QFEtHk=
X-Gm-Gg: Acq92OEHgCOVvG4zYO2nK7vA47DIyXftfnYSYRX019xC9XlenR1EoE9brRU9MXMqeEh
	+S+6CHhWbPTvp68G5iEWMZwsf45EVb5kwvtvvvCc1qFCO8EyjIsShU1SKt+NRydltojAO/YriqS
	98GfRsWAL62OqdI/4I2D15yaoi06eKLm+YKOKpABpOzfWK/e7vnCLNMzWa+2T6My5P0eyQrhV75
	VqyCz74/0lj68Y1toFkM+OLTk8v159S5x+py6ZzB8x73L98VPdBABbThyJEwQNNSw/gYGdjAcH6
	5z0y/RdKKjaQ0zK11AUcZOn+9CHgXY8GMgbixdCtT0PtF5K7uUJ9irDdIUDncbFjiXCE2h2YTZw
	LZ6hszQo/k5wz/ZEyiBK0KGUvYj7PWPDEhjW3WZNOQ57g4SvyXhkg+P/GwVhw49ORSNo+8l2KMX
	LVZvZi3uu/lHJZMXVmpyxQzmGhqNc29IJhya0HypQUS/1ynB4Z17+LWyVrAg==
X-Received: by 2002:a05:600c:c491:b0:490:b9d3:a9ce with SMTP id 5b1f17b1804b1-490c2606a1fmr426581085e9.30.1781099772623;
        Wed, 10 Jun 2026 06:56:12 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm606240735e9.14.2026.06.10.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:56:12 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:56:08 +0200
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
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Message-ID: <ails-CZAOrq_wWBm@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <69cc948f-bb4f-49e7-b050-9e3805aef758@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69cc948f-bb4f-49e7-b050-9e3805aef758@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 03:46:00PM +0200, Konrad Dybcio wrote:
> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> > match nowadays is gcc-msm8909. Looking at the differences between
> > gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> > definitions for the BIMC PLL.
> > 
> > It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> > MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> > used for GPLL2.
> > 
> > Replace the definitions of the BIMC PLL in gcc-mdm9607 with the ones from
> > gcc-msm8909 to make sure we read the PLL status correctly and don't make
> > accidental incorrect changes to the PLL configuration. With this change,
> > the rate of the BIMC PLL (600.6 MHz) is displayed correctly in debugfs.
> > 
> > The clock naming typically used for Alpha PLLs differs from the older vote
> > PLLs. There is no device tree upstream for MDM9607 yet, so we can still
> > safely change the dt-bindings. Nevertheless, by keeping the old ID values
> > and swapping the two entries we can preserve ABI compatibility for compiled
> > DTBs. Previously, BIMC_PLL_VOTE (71) was the final PLL clock to reference
> > when needed, this is now just BIMC_PLL. The previous parent BIMC_PLL (70)
> > is now the parent BIMC_PLL_EARLY clock.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> 
> I think we may be better off removing the NoC PLLs and defer controlling
> them to RPM, on all platforms that define them..
> 

Well, this is not controlling them, it just allows reading them. And
that works pretty well, so I'm not sure why we would need to remove that
on platforms where it works?

Thanks,
Stephan
