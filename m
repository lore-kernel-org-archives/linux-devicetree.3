Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5603128150F;
	Thu,  2 Apr 2026 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117854; cv=none; b=fvJm8b0FnYaRbg4ban9ipDru+nB4dz0FMISyWIL9yjosn6dm0PNVbPbJbRy+OqNHuPXExG3zG/Ktixh8xLnq6LT9krJNHsbOjMGN6iQYMHTWlfQo5j/x7GqF+v6GqkJQPIfDonl5YqR14gOH1uj+hYeC3Cu3x9gsWrNzdMUGOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117854; c=relaxed/simple;
	bh=0k/6HiZL8r/iCmuuOr9Vgz8qBuzBN39ZPlsoOZJZuY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx0Fosl+VO4N8oUiW1A77oBdoRjGzK1oHCTMuEdmdBDBUUqAYdTArj2NILzpRiMB79gd6Puctf2JDtltN/YVa2NN1NU3h/XDq4ICMHudWsL+G+z08p1qghSLEqbilksk3Du2sQYBRyjmmB45SgMgzjWAb+2MmmkvU7GNSJXRcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjaF3RhX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjaF3RhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64ABC116C6;
	Thu,  2 Apr 2026 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775117854;
	bh=0k/6HiZL8r/iCmuuOr9Vgz8qBuzBN39ZPlsoOZJZuY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjaF3RhX97IXIbCCVm/LHVkfrhEmrbRgqJtyVVzyd1Bu5qoQFuLykvx2jo3Kt3RMn
	 e3EUf5XZHleFbalag+RfJbhO9oA0m7eYAta5xa2/e+U8OI19sTNUOHBwYOV6NjhQeD
	 Pfx8LSGtpsh3G6hl7UyAAZ1LuXhp8hxdM0z1jRGC7cM7ItOY2j2dGcElkNHqcdDgzj
	 t2B4NmeUIC923E0M4TVTXp7IGvldIjTyEDy0moP1ISbGBEiVjulpGMxc4U7hVekrQS
	 YyqCXB9wrMxfo8zPXJFNolO9iY2otfWItJXlfO9Ip3qewvnaDvmzy6e/eL7W/pheUU
	 gkRJhM52C+8kQ==
Date: Thu, 2 Apr 2026 10:17:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display/msm/gmu: Document Adreno 810 GMU
Message-ID: <20260402-noisy-frigatebird-of-chivalry-fafff1@quoll>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-1-725801dbb12b@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-adreno-810-v1-1-725801dbb12b@pm.me>

On Wed, Apr 01, 2026 at 02:16:54AM +0000, Alexander Koskovich wrote:
> Document Adreno 810 GMU in the dt-binding specification.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

