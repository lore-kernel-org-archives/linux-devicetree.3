Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B33AE19F;
	Mon, 20 Jul 2026 05:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526686; cv=none; b=SQcT5xEzOF/EANeVDgZWk2TUldZgckGioG/vobNnzEt5drd1CJ/eixzpbu++AVyPo4MFbg3rqNru6qMYBVbjlGjrbZBXRl+HIAFQQLOOS3ajNd4w48+WI8+ZbdzGZMBoF14Ib8lzMZUGadEqTZrX2QKX3NXlQR1oPEuoVk/BC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526686; c=relaxed/simple;
	bh=9VUSVl4YejNKCbPMmVjvbedSyTMl78edXZtqrJvzK8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIIRe1UA0teMjUcgpKLP6JYA/F2rTSRW9mb+Pi/BA0ZUo9tR2MjHa1fcSgvO1qBCQVMsPIVial4yR0Ft1VK9YHOBpf+gfBtdZI3jzw7AVtBCU913GwUm2a0sPhvCYiQgPIKzPlAXkK5yL/JbHB23vRqkmK1mT85PEm89VvXyOD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cA8IB6uF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cA8IB6uF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F471F000E9;
	Mon, 20 Jul 2026 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784526674;
	bh=oS/ZDamywEZJL7jLgwRBPyvqXU2kgIQiPO75+B0LuSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cA8IB6uF36/vlwqE9GST1M/EZllVJOwnHx5773LTF8s791b/9AeGgn6EJAOizbyHf
	 jCZuzeehA79A0bX+EzDKyrupMV9E1eZuOnAatqhnwpVysIJ9wOzq4YobHHRbYZu8AB
	 ou3NYLrvlHxdJnbtVxgH48ay5b0PR8Pzs6/PSvjlzMuY/U/+0t/lHK3j/Df+Ow2fEg
	 WTuRumpp3jhHs1Y4UGa9o6wxaB56O9zyjEvell6aGJmrefNk29p5xBuzfGZnyz4OFH
	 j1egSp3duztHApRYipoFD/igbe9L2QoJp8sRks+ETAFtIjFy2wZp+MF83verfX4HYF
	 c04Dw462ZQ4Ww==
Date: Mon, 20 Jul 2026 07:51:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wojciech Dubowik <wojciech.dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: display: sn65dsi83: Add output
 data-lanes property
Message-ID: <20260720-international-industrious-hippogriff-dd24ee@quoll>
References: <20260717115002.308035-1-wojciech.dubowik@mt.com>
 <20260717115002.308035-3-wojciech.dubowik@mt.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717115002.308035-3-wojciech.dubowik@mt.com>

On Fri, Jul 17, 2026 at 01:50:00PM +0200, Wojciech Dubowik wrote:
> From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> 
> Add an optional output lvds data lanes property with two allowed values.
> The array <1 2 3 4> for standard layout and <4 3 2 1> for reversed lvds
> output lanes. The latter informs the driver that reverse lvds config
> option has to be set in config register for the respective output channel.
> 
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

Well, I am not doing the work twice (nothing in cover letter explains
why I should, IOW, why you decided to drop my review).

Dropping this patch from Patchwork.

Best regards,
Krzysztof

