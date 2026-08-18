Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1831327A;
	Tue, 18 Aug 2026 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086689; cv=none; b=uysOV4tzKXerSfQ/6EbnSqWaQM0+W/VPnOc2I3hZlPSbIIytte3nMZD/5EXE5K/zKsmoFkKGaLMrCuKD8PRBFtxkV4SnRri9be3qjq2DUuxb5uLVT0aab7UjpB/hMIEyc+I8NAGRV6qYqCJywhF5z2trwtJmHx2tnsl4+y6SnDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086689; c=relaxed/simple;
	bh=VpR6swvbGHlq4v61S7Tjej2yQmfac/a2e0/nc/8FPPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKBGH3Vns817w60nEGT8m20dBHNrZpktbPP6lCXlTKlo59tIhxBkUI/hQbgY0ALGhq94rzIfL+mFoLULvC0GnD2Jc/zGAozJ829woTFre+AKBDR+zylHLjdLhRkx9OBHMu+X7HBlxErpUrj7fJ1mmudifhR9c3wlMuhlClVzzC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjbKgeip; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjbKgeip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B031F000E9;
	Tue, 18 Aug 2026 20:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787086688;
	bh=G1umH/P7M0QM9ZZL2yU9Z4octxqls7SjudBogTFxhrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KjbKgeippzZB/6zkzwf2+nwHZg1BhyRrrVd8byF48jyRTPn47wwV5PUwp8DC3MvQQ
	 Bx+KsTtkDBWLLNTsvVlC+kpXUSRK5HMLM7Ms2QjL+s+gV+dRQPOp16cMxyKWMHb1kZ
	 gHP5/sNtHjHa+Bu4IoqftprH+kxXJ2y6vHvLbCBbvttE2JdpPlcgDtzwQmBvbopCFM
	 bP4cSITL6tOawjKUdQ6TgiexXTB6TtNpcCRqHTpxIWAYtvr18zg42msvl5ykPM6gzw
	 DDMxpsAqnuVGx/TwyHph9lPyvqer92OXNvilfT8dWs7qEl4MYJLJuMUb0HxmuIzRSl
	 o/qngCMp1qyjg==
Date: Tue, 18 Aug 2026 15:58:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Yedaya Katsman <yedaya.ka@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH] dt-bindings: display: panel: samsung,s6e8aa5x01: Allow
 common properties
Message-ID: <178708668632.548309.1196715575996049760.robh@kernel.org>
References: <20260818-topic-sprout_panel_warn_fix-v1-1-ded1e8d5f121@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-topic-sprout_panel_warn_fix-v1-1-ded1e8d5f121@oss.qualcomm.com>


On Tue, 18 Aug 2026 16:00:56 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Change additionalProperties to unevaluatedProperties to allow
> inheriting properties from panel-common.yaml, preventing this warning:
> 
> qcom/sm6125-xiaomi-laurel-sprout.dtb: panel@0 (samsung,s6e8fc0-m1906f9): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
> 
> Fixes: f3e1caef597e ("dt-bindings: display: panel: document Samsung AMS561RA01 panel with S6E8AA5X01 controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

