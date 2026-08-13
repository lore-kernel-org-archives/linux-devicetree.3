Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B13B9937;
	Thu, 13 Aug 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613618; cv=none; b=oLeB+cXqiH8qd3r3V03j9RmDakPitd5gNg2uqKeAXk2YPE0wLMJ6+7bnFQBHbNncXYGWECw5cZAX/HenZQdWF6SqtHBm2sZan3egFohRTkWTGppRi8eDNnGKNOdA78CHd/6paYBtLow1ZMyJkflUiN+79fDLVgIFlj0iodh1VCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613618; c=relaxed/simple;
	bh=gKTV4m8KlwEZMmaZaiuFA1ZLlnph1RyZ35y2zlnulDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsR4iRXvj9VK49VYyr24Zzck+EAiSpZ91fVE4NSJDHCZDJZJh91+BjrHoIaA8zmdguzMPdcXMBE//UP7ddaFcqP/D62v+Xt4rDD7pHPTuJTM+oRkP/z9V3E6DvWzAt/6+LVjG4pjGo3k605IPpv/nb7M/yXffps1d3FMlbeXUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqIU/tHe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqIU/tHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197591F000E9;
	Thu, 13 Aug 2026 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613616;
	bh=dEGVOARleeHUWcidmmC2JG4jHPOG9h1aPB4xCemN8J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZqIU/tHeBulul8mJwS/Vrx7EEQdaCznHsJUhPVoKmONEV9WPxUYZfPH+y27SEkeyt
	 eMnqgP/CNX+3jg+IHhaIQl4lE0lFEDFzxCw8ERQhnsfXL75HoZoHhqCxuCni2B4n2r
	 MrCEHPly2nLMQFTY8XGYF5cNhLUTQ7q/RgumFVbTA3TP6mGJtu/V1QxEQq7yCpaiPx
	 am0rYLYYJEnGvEF0a8y5rBuaqFC7+TL/Xrr5oeLY8fayMVEY3sC75RVD/ya5ehKQGs
	 vQOhEakhUtrxC/MpgU/q0dfqZJ6wWWejzeUuzbCWoVKS3ZIhkBa6ZdTiz90Rhld26H
	 CzTCzM6XJzhog==
Date: Thu, 13 Aug 2026 11:33:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: Document Adreno 830 GPU/GMU
Message-ID: <20260813-tidy-warthog-of-biology-e0a631@quoll>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-2-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260809-pakala-gpu-v1-2-207ad1fac1c7@oss.qualcomm.com>

On Sun, Aug 09, 2026 at 01:53:09AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Adreno 830 GPU present in SM8750 chipset belongs to the A8x family of
> Adreno GPU. It is similar to Adreno 840 GPU with some meaningful
> differences like GMEM , register file size etc.
> 
> Document Adreno 830 GPU and GMU present in the SM8750 chipset.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 +++-
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

