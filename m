Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E233546EA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114545; cv=none; b=FDva20EVt14VaUKu5qThBe0nHV2+S4lRUT+2R0fwm4eubxXmdFZrNn79srnqvBbi/xXg0F2xDoq4S5K7RCYuhR0uq4ekOJopFucn7A76kLCp0lihZfcaTWsUKU7lf63KqIeHNsraiKxt+9I9t43CMSTHXwTUCu5hBPCxb2cvkmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114545; c=relaxed/simple;
	bh=Vz+Qc59Rtxnn7Ch0IoKjnR0GEZtH0evFqmN691McLno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frlN2SlwR6jvzQTwrMwYmU2HnMWlyZmiNWcHhiJUgU1NMCZrpkUMNiCKf1WCrTE/QVBcAVSlMP8MAqigqkNPAhY9sqlqvPwty27AlBpi8+4dzbjPE4wuBD0SeYjDIIAepGsTnz76kHDdp5JBcQ/xI8Av3WEyLbeESeus9I1CGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbwuKLYP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbwuKLYP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490af320e2aso77881555e9.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114542; x=1781719342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/N0HFnaXP6N5NwcEmCj/hg4YcEjr2pINzjuo8Ndg+p4=;
        b=xbwuKLYP301fprJi9BymQ7ox3HmMp/A1JXUqS1pPoLxjVDvgYEVuqU2hwUfcykg7m+
         kNjY0JwszPjwtuLg//eINEX5XZuso4w+rcqJvxOpujcoJQxuAVtKvpiM2obqiU3qAMBH
         JGvlKmNdesGgjZ8D4rQjnQPd7jvPWYKD0jN30TS/32QULrC6KUgw46u+62tdM/7PK0sf
         ZaycmsWL0TYbxjyypyrOtdkRSCjIZBRjQGRq3u9fjGQnHXE1UswwgK8uvo02CB8aBZuB
         xg7ALIg8gCMmni83CcMs7jaPyNtnNZwY7afoM+hgmpjOaLeGKy5aXsVOLKWbFonsnYxN
         qotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114542; x=1781719342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/N0HFnaXP6N5NwcEmCj/hg4YcEjr2pINzjuo8Ndg+p4=;
        b=WR0JqptXQTIHNjhNWgitgZukm2uKG/Cm0xJgzsVRYL23mUa2qdOJLtamM0gNrrR4kv
         Q/MSXmm7/QzzFaLJCHxGWeGISfQHyPaZfJiSmFufbrPUWCPkSFN9eiEwHvoZ8Nn4kMwr
         F7vEJJ63WycWL3AGfYnDft3uViHUfwmm1Cl1GtlGa3RaOyn8fZV6R7kHXP2/YqCpGpzt
         RBmagnHxty5oGxBAkFeL6DIXtBO1erG7A7bWVOjQP4ETXxPM/rP8IscTqDAp/bjBe1ow
         8/TVpKJytB5Tge8u7dedSufT0e1344FZWYijWme6D8ePqiRNhb0mt9jnIsu/qcqnMv7w
         WCNA==
X-Forwarded-Encrypted: i=1; AFNElJ+WGb6najfSEn0oKOwGrcgKpTebvMjyrPN04h15vqHnvUsK2mFIOWga5/2Kph1kibzgkQfzXdPL9Ane@vger.kernel.org
X-Gm-Message-State: AOJu0YxDyA29E4BHo2Qn7OUIxi5nJuvHxQIVc/p5n8nYqYit23mUd0VL
	/VKi7SV957s5AWleypeglD59u0egCN1aVdNzzOItQJlpGQTzVJS8mCL5f35n7TIIAFw=
X-Gm-Gg: Acq92OG4w4Pvqv1EUc89O524e5Lp7PG+laDIYczUx5TgKmV429T8d+UydNwDrnp5cB1
	eo+gbzYTC8kk5gLWU4OmtdoxnxKKSyMO1wTJcysI6BwboU1QFAO05wAzYFcIfwmqMbw/Urk+tTq
	Nmn3vnzRubvbdsYvh6KzxHsNqGfq5JR/FhHZlRXJYBHpvz+cPli1dTNF4X1uGYjLwMza6NX1sUm
	pOA4ZMHOkmyWb2H1hVNV9p3QbbaEj3a1YbL9M9siuDTSO0MQSDtacaf8r2b0DAPEaMEGhROhNuD
	bDxeIGjztuYxzSR06VvQb9iivUgAhgwoS9GuG35rRo3Ir9UXKMepQurMzrO1VUsQKt9BhkoehpB
	6JMiNBJjs6xMtavQO8emPPc0yAH8mPVZW8u4jObzjzg44fx7DhWlTbPC3jfgTFWZnoEZ4OtOzvk
	K5ymQj00BtTANPGCu/bbBne4NXtdn6xm/HLrv281ZFW7cE
X-Received: by 2002:a05:600d:8444:20b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-490c6c20071mr235234135e9.3.1781114542530;
        Wed, 10 Jun 2026 11:02:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c0d360sm3170715e9.0.2026.06.10.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:02:22 -0700 (PDT)
Date: Wed, 10 Jun 2026 20:02:20 +0200
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
Subject: Re: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Message-ID: <aimmrJn3c0cJaYc9@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
 <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 11:01:34PM +0530, Taniya Das wrote:
> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
> > since it's used by the CPU and also various other components such as UART.
> > We also vote for this bit in the actual GPLL0 definition, which will be set
> > as soon as any driver in the kernel requires using the GPLL0 clock.
> > 
> > All in all, this makes separately voting for GPLL0 during probe redundant,
> > especially because the "acpuclock" in the comment is a downstream construct
> > that does not exist in upstream.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
> > index 0bd4c12483cd..ce78ebc8ffec 100644
> > --- a/drivers/clk/qcom/gcc-mdm9607.c
> > +++ b/drivers/clk/qcom/gcc-mdm9607.c
> > @@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
> >  
> >  static int gcc_mdm9607_probe(struct platform_device *pdev)
> >  {
> > -	struct regmap *regmap;
> > -
> > -	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
> > -	if (IS_ERR(regmap))
> > -		return PTR_ERR(regmap);
> > -
> > -	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
> > -	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
> 
> This was to ensure that the (APCS_GPLL_ENA_VOTE) vote indeed has a vote
> from CPU. AFAIR, the boot up was not using this particular PLL vote
> register and no piggy backing for the GPLL vote.
> 

Hm, I'm not sure when this would be the case. The original LK bootloader
source code also sets this bit when enabling GPLL-related clocks, so I'm
not sure when/why this bit would be missing.

Either way, I don't think it will make a difference in practice, since
it's pretty much guaranteed that one of the later clock enable sequences
(UART, USB, ...) is going to vote for GPLL0 as well.

Thanks,
Stephan
