Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A475434F48F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114298; cv=none; b=LtbbpYPMp6QS1s9md2pSTpK25TtkBRm8xfMB4GD0a6zdeHWN5+3Avg8bumTgwFBuD9RS9BEMFM/kY+J3ZEOisFzlRyLj2cCug7SkPk/yFFlk0h2d0bO/d3AQItlm4eyPdNaenOxYokZdI2IxWVk1zRn+YS+LoNZSiz4JG08eo9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114298; c=relaxed/simple;
	bh=DiEo+/bq8ErrnBnt4nPE9U123/wIPQRXBvgM8yxpiRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHY9MANhCuydHl90swsuvqKE93jxO4Rj5q/RbSzMenP8VNMPgiRGIMPi38T8aJ4ikvqAimEiusy2vUbVZR418hk3bmk27HOEdj7tdDYxvxfD0sb1oiMyaEyAV6eSlX1EHBe1DgY02BvTKBz7PTx6tz2Cnhi3JcPy6eo6tLwQEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjY5cGN7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjY5cGN7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so78797275e9.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114295; x=1781719095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3avyTluAk283iBEga6wGPVoycf0Awj4BxU+6wyL2mC0=;
        b=GjY5cGN7ou2yfRyQ41eAQ7Z7N03FLBFMGgEAy+DhN0ouFqI/A6gT4khKZmQVmKUtIL
         DV5VoqyIrO4MEBC7Aq8suZgNzPbchhj1ufR5/uebsFcQqwPNQYE5dqDBAkENzfZTkDwE
         YflnOwzRSdt4TjbK9hVN292GCNwbDZ05tqZzlxwEcRzjEcahJ71b27x7oLaRiAAum+H1
         4P8uQSyfbcy1TCePpTMm5JI+z0Aq+Y0MJuwSaWaUU/+NpyBzE4yOvlk7IEQca6cjoXgG
         fDVVrok86/SYgRcUIWzxYDXc1HtzwrxgBwBgiy56e/hMayAPkN6i6JHYswFtdSsBwN9f
         eTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114295; x=1781719095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3avyTluAk283iBEga6wGPVoycf0Awj4BxU+6wyL2mC0=;
        b=GU3c7VLEWMgLOmm+7MdOXIujjGahN+oHdi2R7h/i7Tl1/sl2LxtBaaWxLCmcfRQdIf
         LRSGnPneqZXXkXji3PwORYdzVsmbXEQmBQcKHxv4bjY6/TH8NhH0OpNDcge3rSK1S1QQ
         KuARkiBIlNLXTTbq2BtI1oyWg8XOxn2s6IaSgQBomaJrqbECsPhDUWiZjeqfCtqbFnkM
         9TY6vPWcWJZP6z2dV6YvocWaHz3cu4xjeoINaUdTyHteciLED7pxIj4ps385RBGfy9jf
         hTq9XsnM0XCT0cghVBtoZ114/THdFbRmjbBaeqSqRna5eiAMH9+F7Ju87W65XmzAqO+1
         DUyg==
X-Forwarded-Encrypted: i=1; AFNElJ+YFDn0dsJXz5efyHpRVBLNVMz4D+Lf8ou4V6rnRyTgbjONqFJRnD08jNhE66N3sjePRJWkE3FPZkUp@vger.kernel.org
X-Gm-Message-State: AOJu0YwtklVkoeU4iqnhaQp5UfBVXfcifnWncOQYtMXhjO9cPn1Hjqe5
	2qSr3aDgUdhQ0HxyYarPXb1sxnmNOvbjpVjLWGrKToWq3uW4NDF4ku17xGPbbou4iEQ=
X-Gm-Gg: Acq92OGBtsg41s8l6FxmacSXOEUQeEQIx1FVPJ7Cp1De8aTX/mjf4GjiVrT2bZZkNa6
	5Yya34duR3xUyVN7sRS4/3mqVxU/JLMpyZrQGGoWT+hCgVxKZZKjkgWffgbmFlmF/Qy4V9Vxuem
	kRJ7gXoBpFn8rE7vAhp5CV793sfalVRkUjCXQFZt561d8nCXxR6B+jN9ppMpOmYkJKCzSeO078s
	IyFLZI2ATqRgrMhH0pIDRBC09YiGYzzu5GX2ajQopTjsooz+Lvi8A5HfCIOaFkOKCIpZKodZWjt
	gVX+3TBUVFkSsr8N/88U+GBkw0igyGbN8TI40GzTZGJdGsj6mC7CCTXRWTXNq07SuWY+nu3g2G2
	/RBG/CrgT52wIAiclde0/DQnTatz7LFjVaLS/gIQrLTo6GQizq8E6KtmgS5S+Zxu4z7QexNlLjA
	AI62UMs5OiZGr6aP6SlemTCG6sLI+0hDFKSqg21/aus9Vi
X-Received: by 2002:a05:600c:1d2a:b0:490:bbc1:d508 with SMTP id 5b1f17b1804b1-490c258f3femr428587595e9.1.1781114295096;
        Wed, 10 Jun 2026 10:58:15 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc471b6dsm63912895e9.0.2026.06.10.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:58:14 -0700 (PDT)
Date: Wed, 10 Jun 2026 19:58:10 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Message-ID: <aimlsgJssczxBGhQ@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> > The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> > match nowadays is gcc-msm8909. Looking at the differences between
> > gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> > definitions for the BIMC PLL.
> > 
> > It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> > MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> > used for GPLL2.
> 
> BIMC PLL is never controlled from High Level OS (APSS). These are
> controlled by other subsystems and voting should be via the ICC for BW
> requirements.
> 

The driver doesn't really control the BIMC PLL here, the PLL is defined
with fixed/shared/read-only ops so it mostly just exists to model the
clock tree properly and have the clock rate readable for the PLL itself
and any downstream consumers.

There are multiple drivers that do it like this (e.g. gcc-msm8916,
gcc-msm8939), is there a reason why we should drop this?

Thanks,
Stephan
