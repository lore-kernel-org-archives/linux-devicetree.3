Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F663F5BD3;
	Fri, 29 May 2026 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073483; cv=none; b=UwCJmdvT9+QTIXofhLWh/S/KgFiIX+n/+FLBombu2h/2N8w297wfnpLAFSOtoi4FZsDEEPuTWD0pK4EC3ylg3MUzNmVDn5/bhixuPZnSOSpG5G6qVsj/umiC54Q2H9RIKd0iDJMU714AV2PtlMCvVCH+x7lmx8cvLzJCM9Tj4Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073483; c=relaxed/simple;
	bh=YxyUM4H2l7fcX8Pgy3fEfB4+0KE/O5CeJ66g/LVc/rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdE+qWovrAEdgFlb2M5m75sapV4uEunkiB89GxPBQmIPXP8WqXl9a8kGP/vkxSqvRzJufNQ7k3qN8QEB/luLKhYnHKTkEBZkjqEE3O6F0Av8VRXQsvR59ETmlVg4j4SFmMlv3I4NxoOEn6p9S/CUkxJEBf/GYX5vXYg258ZYCN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5F7b4Dk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5F7b4Dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131451F00893;
	Fri, 29 May 2026 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073480;
	bh=L5+wHn6IPAv0JkbtVrb75rqnC0AiAfo3kPe47o2FMJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O5F7b4DksWQU62v76qQ9nPGlqNavKqAJLKtElCgI2i8AXZtEEvhBFlR7E2Yg3yk5U
	 G86F2yMcRZWsNOU+GuANmzbKfK+AqFFz6W8wgHwcTYWlVmDwagQQ9kMAXsOXMg4XwJ
	 7VaYW4IXOfHcMN5itlQgZbrV8dD/H+M0kslRA8exIjxX/G3Dbbz0KQY6iqKmT3Yq66
	 I1rNR9fB08SxB6SMbvfE74iEj/rsntMh2utHW9VyXvjGf7KjMFnIxgSzfelq+BSq6l
	 JOJaIx/KYVibZaBfdZwpM5o1Z5umcAg9xuPbyV1OPFxJO4rXjr3g0A6FhyZfBZ3UBV
	 4g7Q1SXaENuxg==
Date: Fri, 29 May 2026 18:51:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/6] dt-bindings: display/msm/gpu: Document Adreno 810
 GPU
Message-ID: <20260529-vagabond-tungsten-worm-5f58cf@quoll>
References: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
 <20260528-adreno-810-v7-2-7fe7fdd97fc2@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-adreno-810-v7-2-7fe7fdd97fc2@pm.me>

On Thu, May 28, 2026 at 09:48:39AM +0000, Alexander Koskovich wrote:
> Document the GPU compatible string used for the Adreno 810.
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

