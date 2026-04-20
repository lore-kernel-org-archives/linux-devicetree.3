Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586AF3859FF;
	Mon, 20 Apr 2026 14:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694530; cv=none; b=ZTgg0BoqdYpTsUeD3XvTK++YWvSp5L63UDRVQPwvjc/hplFg2dNHEIWVlnSE5XQbHJhXNWRNU5HJVW5NrpvmRz5dDGf1DKL3rN4krsEgFd9izLqLBSOPbE6RghIRW/FiAYwHSWNgAnUjVMPHnd0RamIST4PTMnE4Fgf5xEpsY1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694530; c=relaxed/simple;
	bh=UZz/y334XGeR52ybtu8Bh/e06bVGnVdZ5lU3egC/qCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYGQ7NQm7i+vY6OZl6KLRXzut7k8kIGn2TyTk3QPY9EA91q5hoNwifBuvd7yrFPCHvzJBf8cjhNMpIAE6bBxalGeUbFk0X80F0dHxeDrMgoeaLPyjdqi6+wh7V3eEpnwFul77TxvM7H5AzlgdC8paNiWNWv2nmCHShxtzDJUK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ij+/00HH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ij+/00HH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7538EC2BCB6;
	Mon, 20 Apr 2026 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776694530;
	bh=UZz/y334XGeR52ybtu8Bh/e06bVGnVdZ5lU3egC/qCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ij+/00HHLQhajGcWMlHx3cvr5gnQ2NMSErKPwAmw2K6pknz/yR79u74U3L4sUIdzD
	 8UT6tp1eBLuYaciXi5rGtF265tq2uma5Hfm+/irG9o9sT7Y45MnZWaU3lM6MD9sCps
	 ey5G5DIX8cVDsWJPPm4J2+sz5Ow9jzpazO0SCcrbj2wN1KNm7yBJu1rQmv54wMONQF
	 62r4aqIEYOp4x7Mn8Ym1Cog6DqE85goRZDHSaUh4SymHEd9V9I1AHkpjYpwkPm0xOV
	 oGdJ1gVEDEdtTf5xHJ9klDROg3DzqB+Qzi0kab07MaLk+X7a+BUOForB8JbUmhVdhc
	 0pnH3xQ/gbQ+Q==
Date: Mon, 20 Apr 2026 16:15:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, rfoss@kernel.org, 
	mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, tzimmermann@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com, 
	xmzhu@lontium.corp-partner.google.com
Subject: Re: [PATCH v3 1/2] dt-bindings: bridge: This patch adds new content
 to the lontium,lt9611.yaml binding file
Message-ID: <20260420-sophisticated-scorpion-from-camelot-b9f326@quoll>
References: <20260420061644.1251070-1-syyang@lontium.com>
 <20260420061644.1251070-2-syyang@lontium.com>
 <192f1948-bb9a-4831-a1cd-5ef500cfb413@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <192f1948-bb9a-4831-a1cd-5ef500cfb413@kernel.org>

On Mon, Apr 20, 2026 at 01:33:46PM +0200, Krzysztof Kozlowski wrote:
> > -audio
> >  1.sample rates of 32~192 KHz and sample sizes
> >    of 16~24 bits
> >  2.SPDIF interface supports PCM, Dolbydigital, DTS digital audio
> >    at up to 192KHz frame rate
> > 
> > -Miscellaneous
> >  1.CSC:RGB<->YUV444<->YUV422
> 
> Commit msg is not a datasheet introduction chapter. What does this all
> mean for compatibility? What is the benefit of listing all this?
> 
> You did not even explain the differences between C, UX and EXD, so all
> above is pointless. Explain the differences and why devices are not
> compatible.
>

Also, you have checkpatch errors.

Best regards,
Krzysztof

