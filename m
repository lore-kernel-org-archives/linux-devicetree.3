Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01A3CB54B;
	Mon, 27 Jul 2026 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183848; cv=none; b=Wkv7DmWOwIkhEWoGVmImC35QzxaB0cKjhezEl5nZxY/HpM9HB1R2cR3jUB3LWXL0oWkRQOKoKgfGPy/hE7s2XHtoEUWhk/1J/KvFHY2LwNm2NHeIZOcML9C5l0PY8cpCZu0EBbM/Bb7LwjuLGLcjOSIypUpwL2HMxW09neZw9jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183848; c=relaxed/simple;
	bh=1zsX+/hLibeVR8dk98Ayb9qUBCFj724jbHItlZRXEQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWVhWIdm18hkpntzQZ1ru18S94CcPSF5ue/N41QSvOclTdfl8OI2kNA/K2KO5Rv+Z/SGgWbwh9C7j7vrUvlEyqDPzQoIZj/RqM9jUsBm/h/9nQcnZPdlPPCuUBwpm9gZEXrlIGtHpmareBN86vyqkLCpAVqUjYt7yxvq1j1IK/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaRuKq3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaRuKq3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BFD1F000E9;
	Mon, 27 Jul 2026 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183847;
	bh=1zsX+/hLibeVR8dk98Ayb9qUBCFj724jbHItlZRXEQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LaRuKq3sgFAWH1R1f0y0QFO5AT9g1HZWhfB08B27UePLiO3pqCfPFDlio1Wz1htNH
	 MzCIJFa/TCb+/cFleaik0z02VtREs8aCVff2fVbqYH/LdLWsPN6tJ+jJeWkJ5/sqtn
	 NB9cw2vQFOKOpwIU3z37o5IXqPYCTBRAdUbLKwow6TVb/RjKY5UrlZTds8ntbde1PP
	 Z5uXLVuqQdVhyqTyflzh1dVH4WHSudRsykhO/SLdjdCoUEczN3X+D0BtjUzRZ2kvu9
	 dghedHsYizbQXq3lxiieU7qVq5NYqTc0SZW+j89xaceACh3Ma0WVyUjebUWp5kjRXd
	 3n70l04u3D4yA==
Date: Mon, 27 Jul 2026 22:24:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: display: panel: Modify reset gpio
 number constrain
Message-ID: <20260727-dynamic-tunneling-nyala-ede2fa@quoll>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org>

On Mon, Jul 27, 2026 at 04:08:40PM +0800, Jun Nie wrote:
> Some panel support 2 reset gpio, such as Synaptics R63455. So modify the
> number constrain of gpio to 1 to avoid check failure.

Also:
Subject - anything is "modify" be specific.

Best regards,
Krzysztof

