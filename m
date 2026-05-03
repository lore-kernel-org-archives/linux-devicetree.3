Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826327FB2E;
	Sun,  3 May 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817435; cv=none; b=HBc3cC8YeVIELZGNwMexlkvaQ8MgK7IGImULSN5feSR8IOWfe1bbhsq706MYj+SwVyxbri6faO2hAqZHDV/QMOBykskb9+n8+O4cAibKSbohE3e+5cY7I858JpscCzF/mWl8/B9HX33M2TZ6y2DHmp6gyyz7fMORgV9/73sHksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817435; c=relaxed/simple;
	bh=1rcIZCaS6azUcf7DopSLDHUFbwcVJfRUlprMrEz18/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz0nVPD0Rl1CxCaXq8AxBvGTV3+Aly/nF/P3fuaIDWkrXbMNb1J9IXu6SGyyoSrD921OluumbvLasAC/L8t7ZNujYePSLqudYO2lQqUop0H2aUrG8BJGzCAewg8s46hp28YCmHyewVtjGrc0aNfdjCy12Y0Nv6ECLagPe+76n/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdcNKJmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdcNKJmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FE7C2BCB4;
	Sun,  3 May 2026 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777817435;
	bh=1rcIZCaS6azUcf7DopSLDHUFbwcVJfRUlprMrEz18/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdcNKJmTnleq8d5KORoAOXHQigdmmG62BCZoyFaZMRKMYqp8bBQCzdaPkrGMP0tmv
	 xf57yDeXPA+MTnCuF3BLYt3EqlCEa/C0fjFtk9B5N/bbyaifFTf+yblduYHFAazKjT
	 r6DjsK6k4NIyCJxo/3RadnLZA3t84IYmMh7geBKd4V1S9gqRcHDhHm7QSmJuX3wXyG
	 xbdbdpKdO9gShp7EP7Ua+ekqbjFc212KqhSJ8WefIy3lRKiDmIxDIpQcR3BAMhb4Sm
	 gaXVqiWKvUIyQ7RV00ivCkJD/WBTj8fhM4HjHhPIE8zQsUHDQAS7fc/fxmrG5lVpb5
	 ubGjPvrTjltyA==
Date: Sun, 3 May 2026 16:10:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Message-ID: <20260503-resourceful-walrus-of-bloom-3ec6f4@quoll>
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
 <20260501-glymur-gpu-dt-v2-1-2f128b5596bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-glymur-gpu-dt-v2-1-2f128b5596bb@oss.qualcomm.com>

On Fri, May 01, 2026 at 10:40:37PM +0530, Akhil P Oommen wrote:
> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
> It features a new slice architecture with 4 slices, significantly higher
> bandwidth throughput compared to mobile counterparts, raytracing support,
> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
> other improvements. Update the dt bindings documentation to describe this
> GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

