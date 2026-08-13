Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777FF440A3D;
	Thu, 13 Aug 2026 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609386; cv=none; b=hiv0pHPjBjGBTnywuHOTkYt2aQNEmeOlYo9B077Co6wgbztwzX7g/H9I/OTtQ1YjMdIsuxZJPF7r6MAWGd9lhkNnoFJFGFbxKQsXqiKuEWP4cyL/3e7s9z+RTFBnraFqAcTah3GOMwdPxT3QMUWjhmen3rfq9WUEW9nbMBwamlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609386; c=relaxed/simple;
	bh=I+JT4jQlfpRDLR0RwDfr7X+njwXyfKxgzMVXBAonfW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ro6MKXEJbTP3SBcgOEOETOlcTJhkH4uyzFO9LoQsK/ER92g0Yz23iacZ8JAEDBcjHFa5dLNRfV7Z9jqc18l+z1hehdTfRDx6V3Ug7aQRW9fDirg1C1xKM0LhFpV1avW9YCS1B1q4/yKCeAqWQ6caoW8ex9cqccRn1Vs3O7GoAEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0rGpXSM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0rGpXSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A5E1F000E9;
	Thu, 13 Aug 2026 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609385;
	bh=S0QwcmZYI7pJpaWM8SXgn74XQT5EU5EKwIDYoBEKlZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G0rGpXSMiSQzE3O4qvKxVOqftowq14uazFlydY4rNRzU/H8PCy/jN3gnQzzRI4J7D
	 1+eB0RB34rGSkIYaXtMpljfEOOgKwYpt657wxjyc/5hjJDj6UFK1N4MNzr/01e604F
	 9C7eIJnxD4w97fmfqt8jIco8HSqT3AAhWq66VIRWaC1Zg0YQdYdmzsxny95DjDvpOz
	 J7pGINsixgAqM36zt7uy57MHfUO1sXMLFsE70fIX0x0Mi54HHAa9HWYjn7a56WcG17
	 fo/DGthKzzxj3W0XfVEBCY+2ZtYVGQP47puSynHleOt2qIPfBc4gzdAYdJdDdYIQPu
	 N2mhTl7QS4jbQ==
Date: Thu, 13 Aug 2026 10:22:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
Message-ID: <20260813-amphibian-handsome-mustang-68aed9@quoll>
References: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
 <20260810-b4-lvds-panel-doc-v2-1-f2c2fe309989@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-b4-lvds-panel-doc-v2-1-f2c2fe309989@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 08:27:29PM +0530, Vishnu Saini wrote:
> Add the BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel
> 

Drop blank line.

> LVDS panel.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Best regards,
Krzysztof

