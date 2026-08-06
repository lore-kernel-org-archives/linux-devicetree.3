Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42FD3DC4B3;
	Thu,  6 Aug 2026 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000384; cv=none; b=SjFeQMTX66IacV7fFyEYToTKpa8Ff0vRYFg0t6YpXHbcvRiWF3idKeqX40dKLOT0VyHqNKsydXnXWPsMMHaGMGBX3AHNn3A35iu+oKYyB4mNejGj6Ry4/uehdaS7ceJrnJhS3wx/ESKz/P+88ADz3IhvT+mhnxDpLhTLbpSBaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000384; c=relaxed/simple;
	bh=Xud9G6BsHgTE+ne9hZstKyNWl7Z4dOF6i/wArKsZqCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2I1H2Uv3PkPlbOd46oOmfEZWUJgCGiWHghzU4QIRnjNDcJWS/5xBJ+pJiPr6rpZUTYmc2JHGP6an3hvVH5toMplQMQI24yY8u9njQ5L73WBbmmihR3UMVnBDKw1LE3PfMeWqXJk5MOyztOXQ9cwKeoiPkjQgKClIlhQNNm15sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvblLsCO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvblLsCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688841F000E9;
	Thu,  6 Aug 2026 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000383;
	bh=FZGX1YoXphAmgRRb/O9bNcCIg2U5Clbv1d+m6N90JPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AvblLsCObrfjGGp2EZNnnLJl5B+UIrPyZn+fwGbsBfVocww3OCIcqrxZwB9SPWpRJ
	 xliJ0uW8saWYW6G3YykKyU57deKWqmg6RwTSrYg862p+sdOkYvaGhEHt8054l0AMEp
	 +VquCu3Vbdv4zYAyeSCxhPZfvpLS+llVwuRVYLtsXKt0kkR68yksoQ/+9K8IY76m6w
	 /9MvYIcpBaQ0MRYb2uEIruioLoT076x+mIEv86eYffs/DmgtHzIfp0QsibA4exGHQA
	 4yZiOeihVlROfxOI3QY9zsG7R6L2OuOSOxVUbMX3p3erle1VcUcpmnRkAAYotkiKIE
	 p/s0G0mvPGQUQ==
Date: Thu, 6 Aug 2026 09:12:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mohit.dsor@oss.qualcomm.com
Cc: Sunyun Yang <syyang@lontium.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <20260806-gregarious-swinging-cormorant-f666e1@quoll>
References: <20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com>
 <20260804-lt9611c-v7-v9-1-3423a76856d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804-lt9611c-v7-v9-1-3423a76856d3@oss.qualcomm.com>

On Tue, Aug 04, 2026 at 06:10:14PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/lontium,lt9611.yaml        | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

