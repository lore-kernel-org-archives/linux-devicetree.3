Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDD13C7DE5;
	Wed,  1 Apr 2026 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043879; cv=none; b=hOqk/BEH7a9mDbPGSSfEGMfigoOVzW1CbsecBCyWb7nVSXJsg4tGadEpLk1C3v9bxp+seRvba7/QR8y/Cm+pxAExdWaZ05sCJUP1SZXiV0OGtox/edWhur1uNf/gWEjJhz1600Eey7643MtFz2uRVMaFghq1LbbC1a6sb2KXPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043879; c=relaxed/simple;
	bh=Va7mIxLnyICoaYV/3PFg8DT/TwERBVHi5jqPQ1fMaYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9Naih2u2f70+UVlPgzb7Xtvxkz9rVoIs9osbJKjjWMRndWWxft/WYyXET4MyEW2PHa4nDZw8MlFfKSgWfeCbDhaFG8rL0uRt+ZXMtKe5QY1LHvy9ys0COKF3HaEnnFNE+OPzRULTFIxekRiNboiKE8g6cS2cE6r8pHtFt7du5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjalVSFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjalVSFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1302C4CEF7;
	Wed,  1 Apr 2026 11:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043878;
	bh=Va7mIxLnyICoaYV/3PFg8DT/TwERBVHi5jqPQ1fMaYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjalVSFomMHQw9jrtzoO4BetpMS6WKRzzShqOhB6fQ/SeS8TJYv7IU97r4cYxg1qI
	 7I2FPPs6wggy3tbmfjugp9S1q/bgKQuNgeqXxkzEUgnqWLQ8fBntjEIXXo+wx75Cie
	 gZta2cayQCXmny9cHy//QWW4Ldc0w5uGJ75/exCuMWfP4Hj5Zm4u/XhrI9s+UMuAoD
	 WaevcNFCZWeI7nQNhHNmjYaGxnr+Wx8ocoykbyquPrIVhlUHTiqSrvRZ13RjHRVVqr
	 WKnlR8z4sHL+NSbt3VlQcv5ICI8MF2qIKkKGH+UwCpr9b3Oo77H3B6hStGLvUdyNKd
	 5JtW81FaLo/Jg==
Date: Wed, 1 Apr 2026 17:14:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display/msm: move DSI PHY bindings to phy/
 subdir
Message-ID: <ac0FIqUk6wV74qIU@vaman>
References: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>

On 05-03-26, 01:47, Dmitry Baryshkov wrote:
> Historically DSI PHY bindings landed to the display/msm subdir, however
> they describe PHYs and as such they should be in the phy/ subdir.
> Follow the example of other Qualcomm display-related PHYs (HDMI, eDP)
> and move bindings for the Qualcomm DSI PHYs to the correct subdir.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
