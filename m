Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65836F91E;
	Tue,  9 Jun 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990249; cv=none; b=lU1weDma8kL28AJNpmHgvXEe7YJBQh6zmNtqr9VEnGs5rPcI0coB48dSkTWXaSOhnaBh0MVhNU1Zcz+kV+gZlZIilNZXjyKCH99TlxSvsS7VxHWxGncg0jhxxDHeQdr4J/se46sff89B7JGfBuNJs+FqUK+dBZOuUAH1fV9gHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990249; c=relaxed/simple;
	bh=NlPcPaYCHlFZQtxsUcAbfvz7oaUI3CpbphWqvc/s/Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+pJW3CtzMNP3eQpmbiUdLNsNsr1fmK1Rycpk1wArC08KD4dRXyTyxLKpRcTSuXuQMhX8FfjrZe+5i+n9+kt9wckM2sp+ayovLceuGXBGn399yv3kL91554Bu/RzgmtHPF1bIRs4HjBRbkpS218TS97Xf09E9q731OJ4cId5txQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1hjsO7J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1hjsO7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BAA1F00893;
	Tue,  9 Jun 2026 07:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990248;
	bh=LTtRKcyuXAOIfQOL4S8lnzbMEijRYzbOt4UwQ4FGJqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j1hjsO7JZuDyD05OUFtQMqvkKgHRXlE5LARCGVVbUYY+svzcT5Fm6eHzMEugotP8Z
	 o2SuwVASo1fo0Y36KWr5eXbBYtm4ObBbuhE/GMrVsO49OrxX4wdfekhIK75XlbHmeF
	 zH5HyoOgdmcO4wl+3nM/u5FDrw0kwr0O9FjyOsBXPmpro/auAG7PaL9DtO3UeEYEIA
	 XxRDFAu4Avq8Eln8g2c8vw8dLGWDy6LbrK9vnSVdCwMk2Y2ercNx4U0Ns5q3GI4UY8
	 RvoKhwQ76Sy8b0f/nAFHmbfHmbaeXAxIs6lYCzDChJ0Pcg+3oXZfIL9oc28MZjwtA1
	 tCkhCcO7lif9Q==
Date: Tue, 9 Jun 2026 09:30:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Message-ID: <20260609-lyrical-alchemical-kestrel-9cc0df@quoll>
References: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
 <20260609-shikra-gpu-v1-1-9d0e09cab115@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-shikra-gpu-v1-1-9d0e09cab115@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 05:06:29AM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
> minimal changes.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

