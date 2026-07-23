Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8573D967D;
	Thu, 23 Jul 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784836460; cv=none; b=BCKTy03AgcCME0z6hEFmW8bayyaofVpjos6muemJz7Nq2KXJ+i6yd4lnBR2mytAs7Uf9qp4aaqJwPDE3VFckMh33U0X83DiX7mHCcoLcIzov/gsWEfjh0U490fR70lp9WiVyBmMxlRnPdJ3qASdAhvgSuLDNgMTq+nMP2Bnw3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784836460; c=relaxed/simple;
	bh=hVREnA/LCpknVopno0hooULoKcHPQxO/r7jfuM2LSKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSYTImX2MSOf6vkyLJeVt/saznThM7Fv8q9OFcrXEW0k6V7//QhE663AY8LxC2DscYXIubE++7lUeYfwSk+ExEADxdKiauqCUaTtnfFf24BoP/QHyJb+UaxQBiX+EWeMMevNYDmcbNZtUHebb69BfwgDeGEAxOnpcsbwqZU/iXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfCk4U8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfCk4U8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4677F1F000E9;
	Thu, 23 Jul 2026 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784836458;
	bh=andR8ruG0XYGzZpByKE2xQIhsxs+u6ZQ02iMoDnC+gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jfCk4U8Hb4teYRyzJ+IbWZvQIJschJp7dMsLLFTxTpOzsCzi1+E7c2NJ3vbL5J0T5
	 a8hzZ5X5cRn0oh9Sw/K8yJ+R+iYI4oqefwl7h5ZsXLNoasKZumzHa0RvaqqIh3WN2c
	 Rbxag9fszj1LB/zBWVQwLwhn3AQeek49+/sPIaitH3NJb8lCUnWmGwSPuUodYfW6z6
	 uXkGVrT7vbDHkXQQdldhDHWzIDoPmf5Vl7xKf7Q7lyPUqw1Vc/Jt9EPTXQg8u5UbIO
	 1NreSj/i2rFvA9PVBWeAvELWcV7TvHZYnqKCu5AKXGGCB+AKIL6ABl+JD7PHXL6mWR
	 zc0d6tK8u+K0w==
Date: Thu, 23 Jul 2026 14:54:17 -0500
From: Rob Herring <robh@kernel.org>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
	Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
Message-ID: <20260723195417.GA2688724-robh@kernel.org>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-3-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722142342.990384-3-mchunara@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 07:53:40PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Document the SDHCI controller on Qualcomm Glymur SoC, fully compatible
> with existing MSM SDHCI v5.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Missing krzk's ack.

Rob
