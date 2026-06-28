Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B1266B72;
	Sun, 28 Jun 2026 02:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782614677; cv=none; b=uCjAwnID6hedG17WIPYSET4LnxrOqyCErXNWJvYkuYYn+KVJRnoITu7pm01n44smcOcs2DkNC6M+HKkUeXmlJeg7NuPrd/ymOMH2qncOTxWrhR4OzJ0meHjF4XpwD8OL5K7h1WghZDsfg9PaLKh/a/Y3IPV2+Ge7Hy5qShGxfp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782614677; c=relaxed/simple;
	bh=oBo/AMEikq7jbB192C8EGmlAK/tfWAX18hIfPxjCIPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8GI+/BFNJJlTpa0mkxh2nCXKpJWMNWsG6CT9SMm1h4scZQ1KCcgNkdsh2Yno8HOV9A4SMWY3CHyvduJ6qDH/Lup9qtktvycbw9d7ao/QtveiNB5rM1zl4wFjjEobCN7wUSroPwZICLLwfDsJd1HDkKYKbiVlIZ1ovg4FQDJwQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n35NRAFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n35NRAFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70B81F000E9;
	Sun, 28 Jun 2026 02:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782614675;
	bh=8rbBQzz8+AOcEYmskmQWTiUtib75kMIGx92siQxG0+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n35NRAFr5LRyxVBKQ+hRIs+35r8fOaD0DJSjfOJGzjtE++FZ/1Y/i1X5yYXAevClj
	 sZnbsU/9Fc4nNqIhxuH0m9M+ZEiytWe+wtVMrTCPp9y+DjsBwzUEuCpDTko44STUFe
	 XRj5MTv+yIc7/p4I9q+UmwPVhMC4agpwQZ/WRj5s6WSUWBHttUPyhCT3gA2eXqzGA+
	 gg8JUeNQbMBU/Bk/XJtMXr5Lxa1c5ysC+Boja7hSirxMGa4n29sezPoM5mMFIPsTcx
	 XpyHtDG5AlWvekbLLmM6+Ftr2GDR4WXhYsVjIZAFYP/sKA1i6a9ttWJY3tu5UZq+Ei
	 CDsueTWsfYmSg==
Date: Sat, 27 Jun 2026 21:44:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Message-ID: <akCKUAa-Yqh3xEZT@baldur>
References: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
 <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>

On Fri, Jun 12, 2026 at 02:04:05AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 05:22:37PM +0000, Bjorn Andersson wrote:
> > The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
> > INTIDs space. While some of the i2c instances has gotten their
> > interrupt specifiers corrected, even the other functions on the same
> > serial-engines are wrong.
> > 
> > Ensure that all the serial engine interrupts for QUP wrapper 0 matches
> > the datasheet.
> > 
> > Assisted-by: Codex:GPT-5.5
> > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> What about the SPI / I2C controllers which are a part of qupv3_1?
> 

They are well inside the SPI range.

Regards,
Bjorn

> 
> -- 
> With best wishes
> Dmitry
