Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527887;
	b=gPkNaAiFrVxaXs9ZU1KH+512dU/Aa8CUekxe385YlCVpzk+gumXoLPP1+j/W/J9fFuwx
	 JJRlbWsb4bUzUSwIKTCLei6jbaqtyai+DnBbqTDMr4KbvzeE0P/RMhODS4d8ZlbfXZeoU
	 6iQKP5jzR6UANIhhB+Pr3p8Y5kxzFW4/hxzaehFli+CHqB3jkhf/RUGsJuTFYA7VSWsll
	 RewSbC6OyZIMxwwPtLlamFpQnMnTlCEeV6ENXOhFtN9ruNwMorLuUJrABQSOkrnjsl8eO
	 5RtvBCHuudFd7IuXWpJrED6H8mk4J0Jp2kdBtGraBMymgLTBBn2+0uxq4YuHAnkE40Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527887;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6wsKLq9kxl5csJ8c/oj+CJg3ej4KmwWP9pDuJWodbxI=;
	b=i/gyGNR+1zJ8h3BeqQUWWF09uUprLri3udl9LAMZqiX5b7JxHdXDOK9NLFCEaDvaz5Zr
	 lXghmFW4irb4W47rYPnIEfDDg91mUZpRK5v0xNT7NzC1PKi0l8Uf4YIddE7EKbNysSeUX
	 o6AfWZuMkGaSqCqwH8ye14H2xaihe6V9opS+QMI7iiaQQf6UhN1n0scCu4cbbAA73Z7F1
	 MaG6n+iJtCuY1xVFTzxO2cJ9D5swizHr4YjpxRzIt/6RK1DfYjgyxsRBilSe3G09lFOcM
	 rwO1hL5dKBPY7uwwy86pwfvvvRgWsN2YYG6O9NPmWSoSMmCHjgxsmBtx+izX2j1qsDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MF6CPISN;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20194606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20194606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MF6CPISN
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C00C9BE1;
	Tue, 24 Nov 2026 14:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795527732;
	bh=Nj3YniFrzVnITRBYaPQKl7wSY/zEuckU+cg5R2aciho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MF6CPISN2fCrzJXba10MkU3qtJaBi9SZ92H4Wp38+lsUI8RQF25e9/gy5Th8uUSbp
	 lH6daagHqHo6aRNf9L5kXgereuYX6RWJnhkbqbGjzHw8HeUjCghwSC0T+8hEhhVYRd
	 ahZGGa+kk0z0noN5r92mmWrWSTbk80Ux1YKeTbJc=
Message-ID: <7a94fa5a-ddfc-449e-b014-387d8e868e97@ideasonboard.com>
Date: Tue, 24 Nov 2026 15:44:40 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/bridge: tc358762: fix reset handling
To: Andreas Kemnade <andreas@kemnade.info>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@nabladev.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/11/2026 13:54, Andreas Kemnade wrote:
> The bridge driver desserts reset after disable and asserts that
> upon enbale. That requires users to workaround that by declaring
> the reset gpio wrongfully active high. As an interim solution,
> ignore polarity, until things have settled to fix it afterwards.
> That will break setups with an additional inverter in the signal
> patch but those should be uncommon, at least not seen in in-tree
> devicetrees. Fix polarity in the one device tree actually declaring
> a reset line. That patch has to go in after the bridge fix.
> 
> The issue came to sight during experiments with reset lines on the
> Epson Moverio BT-200.
Indeed, the driver has it the wrong way... But what is the way to fix 
this? Fixing it will always break the backward compatibility with dtbs.

Is it worth it? Or is it easier to just adjust the bindings doc to 
mention about it, and add a note to the driver that the gpio is set the 
wrong way "on purpose".

Or, if this is to be merged, I think the code around the 
gpiod_set_raw_value_cansleep calls should have a comment to highlight 
why it's calling raw funcs and what the plan is.

  Tomi

