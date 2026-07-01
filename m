Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3E23B3C05;
	Wed,  1 Jul 2026 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889117; cv=none; b=tsXfjGfi/I2d90tX3qdLlr5riiNwrLbWlBhXvbPG9PRtAwAlHwK+Jtos9BkIqL/KnKIdHhwMIa9pzz1BS1oyBcad0YYYWNT/eXNzwvCwJWqIt027trkTJkNmnLTKeRiKyOwR9X7823yBOAgjJdty8SfUOGIeBr9wzP8LfOKIC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889117; c=relaxed/simple;
	bh=p96fgqRAxyLtnD2Wkwo5sRb26fDuAJmmu7Z2bDJ02Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QS/v1iDYQ8xt9IyqssTxZi750dBRNfAv1i8JUJ4saiXkpXy3OxZ/o4wl73B8j8IKUxVX0ozqFHcD5NSveno7erR6iFxuXLaRo9nsYRPWuQ7+Yf3sknPSFMrbevDcP0bOQYEVIXwgAGNXc3PKiLEuLlgSOt9jKOqqgLXY21D3fKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE55aGPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE55aGPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087A51F000E9;
	Wed,  1 Jul 2026 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889116;
	bh=p96fgqRAxyLtnD2Wkwo5sRb26fDuAJmmu7Z2bDJ02Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AE55aGPF7Lc8LHUeDYaoFlOLYtJQaCReY63VcdLuGdeUwzZZ7LfBABDb0WsQglAGN
	 wo2cK5eCAR1OhocVNbQEMOdE1MCCR1MA17rWpNLS1fs9OgzIpFD2TLpQiXf48W3LrT
	 jN5HDxGbH5AYwrIFGvqFRwPmP8C6KgZVSjrnzeru1Fj+64HfC5hcYm80eb/Uyu6pP1
	 7dUxAk+ThGQoU3jZlcfLQ7bs9ab7mOSytgsG7BBmFNYAUYRnSxIS2ka+drJO6lz19O
	 VPUiCfAl2U8DLo8YHCXw4DDPEkLVvgio+aQb4lkAZkyVihlxc9Ie55r1giiLW/pmsk
	 4+T1kk1Kb2Reg==
Date: Wed, 1 Jul 2026 08:58:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] coresight: tnoc: add AG tnoc standalone
 compatible to the platform driver
Message-ID: <20260701-divergent-noisy-hedgehog-af719a@quoll>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-2-aefab449a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-2-aefab449a470@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 09:53:42AM +0800, Jie Gan wrote:
> The Aggregator TNOC can be described either as an AMBA device using the
> "qcom,coresight-tnoc", "arm,primecell" compatible or as a standalone
> platform device using the new "qcom,coresight-agtnoc" compatible. The
> latter avoids the AMBA bus and the associated peripheral-ID probing.

So here it is: you added a fake hardware description so the driver can
avoid some action.

No, instead fix the drivers. Hardware did not change, thus you should
not change the bindings.

Best regards,
Krzysztof

