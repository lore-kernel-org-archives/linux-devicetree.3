Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F2C1F4180;
	Fri, 24 Jul 2026 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885808; cv=none; b=A1pvYmZ/SKdx+kJCy+cse5r2KfyERRz7CEUtpmReLs3MYbcuSIbYFPPPCMlseUIr45klFR+4ZRMzTbRGtznFLwUCfGE2LizqowmQhVgk+RxkbFfG8gqK0in5AzLHkBziin50Fj8KZ7QJHGoNntHnz481T2BsBNtdcQLj4zIOlVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885808; c=relaxed/simple;
	bh=GFvWJJhjhu1p4tF2+Q019cpWkfYk8y7RGfwCH26uWaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soZ8Ft4aY4OqXJmI7DuB9dtT1nQyW/lV9fyqyX0RKk+tMZLUr0soN55hanNv7BRBg5PuxHOc4FXNwfjEgZ/jb7kd4BCgW9OH3oxVqJcrfGHz4zBRDnGjo7kpdwHSvSyFMYef/fJ+jCenR3ZTALxxUdca5WLFfQS7g3nOtZAGhOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UG5SoNhI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UG5SoNhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63BF1F000E9;
	Fri, 24 Jul 2026 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784885807;
	bh=iDc15U1kStf17/3+/VOLnuomPMxAGfj6hbdZDDiDRWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UG5SoNhIcY02zB/cbJO3mbU8GDIHDmzZYMHQjV+m4ticc1ATRv5+6/qwiLgxUFUzF
	 EeaBcmKIRwRvNn2R7DF62jkB0Ex44gTJzfVEBSNFv9Lq5mDBrUdx7SIcYC/P2b6wVM
	 wyG+jr7YXQ6p2XVUPZZ0+XsuwwReewconY95shJrMldqy//hnAzn2ycYf1EBHxGLwC
	 n8u1M8B3pat9HDB59DyKKCasi7klTw7ra9E7KbxAxfT6/vNx4Pd/Ig9QsUrJ0J+xo2
	 amvxqTHgc6rfomtDxrD+DXsCowopoke5h3xlYuKixRRByCHWI85f8Szz3v/wMkzyJq
	 pgVcu98D4s/PQ==
Date: Fri, 24 Jul 2026 11:36:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Abel Vesa <abelvesa@kernel.org>, Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <20260724-cocky-uppish-pelican-3796ee@quoll>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>

On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) and Glymur use two display power domains.
> CORE_GDSC powers the main display hardware while INT2_GDSC
> powers a subset of SSPP blocks.
> 
> Allow the MDSS bindings to describe both power domains and
> their corresponding power-domain-names values.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>  .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>  .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index c6305a6e0334..c0b650ffd9ef 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -31,7 +31,8 @@ properties:
>      const: mdss
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

So all deviecs now get 2 domains and this is completely ignored in the
commit msg.

Best regards,
Krzysztof

