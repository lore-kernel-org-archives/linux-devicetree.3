Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B82E1746;
	Mon, 22 Jun 2026 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126273; cv=none; b=W4mBZGxTmQdNEcl80+jdMEjwGFLoJIOWQvMDaTRR7MmPDjnx2cPihwe2fWsvDoieEQ8ZnONphMCNEQ12l8b0tAgimo5OCVc8nJ0RWlQI3J3MCFjdY/qLcGI/aDFySm7EBjuojtufLkc3OFglBGuTASoZrV7gFy38Rtr/Qi48BG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126273; c=relaxed/simple;
	bh=ul3KPSH68nxfJgvRe0DktHRdrkKajBUPjqLwYjvXXM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkNyU3hgUQrdKWjmJ2+yMmAgGXn2Ohz01L2Q66yZe5crb0idBeyI69BNUGRnWy5x3yjSocHqTQwlt3npxTPAd1kUjah+IQsQ7o8GbN6TVPkzmXxkmO7itgZ6bND0PCIhR5uJdN5PV+VNDQg9KDijjW5v5dRtVyhFOW/JUlm+7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+7eGbWw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+7eGbWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8E31F000E9;
	Mon, 22 Jun 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782126271;
	bh=YSs58y/GFP40wa2ZLv0++iuUUCeFyDMAOw4QyEvLl/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+7eGbWwC1BuJt9yXHJSoGrPm9GrXLcfa0L2cSuJ5hyI5ocfhj7HDDu665jv+BJH7
	 SxWF8HHYc6JlZ1o4UEDCfcyIDKlBHg/GWGKg6O8ncugO0xsbM4m1Fg6FOQDx4sjzXv
	 VHBr22BqqsqlLbdmdA9MQEHqEkQR+rhoFtEsH4feXBHwCuRveUma9HmZQtFmBeCDvZ
	 keMJlsSMkN31IDeWd+MGAa+rtEgKOIWBGF/vuzbRQJDxRta5QPJcPG/lMDIZ4RNQz9
	 UvYg6kGuqfzghtAI5HjxCLCDs5kAvIqwG7git16HOmFNhXDBrB5nb6cj6XUr1cP4pt
	 yNTcMcRW/oOVg==
Date: Mon, 22 Jun 2026 13:04:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ayushi.makhija@oss.qualcomm.com, rajeevny@qti.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <20260622-grateful-hypnotic-grasshopper-9de3f4@quoll>
References: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
 <20260618-ili7807s-v2-1-b3f0c109b102@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-ili7807s-v2-1-b3f0c109b102@oss.qualcomm.com>

On Thu, Jun 18, 2026 at 03:54:02PM +0530, Arpit Saini wrote:
> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> 
> The panel requires a reset GPIO, I/O voltage supply (vddi), positive
> LCD bias supply (avdd) and negative LCD bias supply (avee). The panel
> operates in video burst mode with four data lanes using RGB888 pixel
> format.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/ilitek,ili7807s.yaml    | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

