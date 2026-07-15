Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2198A3CA4B6;
	Wed, 15 Jul 2026 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784148966; cv=none; b=qbmlS+6YKgaLixnKjkqbYEkoklUvkjmrdjx8LcDFbJAFoeDAsjq7iSvjkCsxWRqBdHd10wLnzyIrXZ+052qf5/F/AFrrz79WsGiSSLrk1H/g/xd4sWg478b6IPveBWiogToGp9VQWJWQCKHkeUg4zECbXSNxuNUX2WY9+fDPALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784148966; c=relaxed/simple;
	bh=dAO6/cvZqR0OfTXjJxL1HuYsYePdbt3DAN8lT/4kZg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM9ARI7B1SX+ijgItMKiJtAlqmUNwMz3rvpP6b4Fmi3an0t2Hsr4KSO+zuwqh/qJiqcaTWEhSMd0YiMP83fhsR/u5tk3cju97bRPLu+WP+T38t41ZxRyxD31z7vUHG7Q4XBKkWd5VkWMqXP11dVCvTg+XfsSGiNvvAiEAqVt+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkCbj5iV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkCbj5iV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7873C1F000E9;
	Wed, 15 Jul 2026 20:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784148962;
	bh=m4XmsXdgfJ/7kH3sualvLazcBXFKF6f6kDqvJIEEgsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkCbj5iVJfU+LrvOIrZnVTa0oy+9XoN3XHaZ+IEPklQhed6GuGmXtzJn0uIyBXBI2
	 BsjjJvWy+hFAdkOBfpF/e5+OuPUdxwlMobkbhF/ORwIEn+sRHv49X8p9xREUDBXSYh
	 jIDLAv8MoVaceI1UPG680F7xGFgvUEgutmCC7HQBllcYGmYwKtMtmyCZB6hEG67BP9
	 SyUchYqwkcjrGVrpCwpjHfGLApAZLNSMkQXgS7pCi1onnnPwCYWHkj6wgjiaxTJRaX
	 gf1Up7DGqmfDV/YbDstC0rUP6Tm8+p+vBUEP8s31pEbk6idGQ+tpNidcO0qnBABHlf
	 3BA0yzRsgCSZA==
Date: Wed, 15 Jul 2026 15:55:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/8] qcom: display / dts: Few corrections of
 address spaces.
Message-ID: <alfzlxrqu23e9AgO@baldur>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <178339449937.1938770.7041355905157380217.b4-ty@kernel.org>
 <b50912e0-b7cb-4986-9e62-63a15792a167@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b50912e0-b7cb-4986-9e62-63a15792a167@kernel.org>

On Tue, Jul 07, 2026 at 07:57:22AM +0200, Krzysztof Kozlowski wrote:
> On 07/07/2026 05:21, Bjorn Andersson wrote:
> > 
> > On Sun, 05 Apr 2026 16:33:56 +0200, Krzysztof Kozlowski wrote:
> >> Changes in v2:
> >> - Patch #2: Add dai-common.yaml reference (Dmitry)
> >> - Correct subject
> >> - Rb tags
> >> - Re-order Eliza bindings patch
> >> - Link to v1: https://patch.msgid.link/20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [8/8] arm64: dts: qcom: sm8750: Correct DPU VBIF address space size
> >       commit: 4fd832d6aed496c7111746d2c1e36b006659f89d
> > 
> 
> 
> Only this one? I guess I will rebase and resend.
> 

I don't know why one this one. As far as I can tell they are all in my
tree, so it's strange that b4 only noticed the last one.

Hopefully that rebase came out empty? Or am I reading things
incorrectly?

Regards,
Bjorn

> Best regards,
> Krzysztof
