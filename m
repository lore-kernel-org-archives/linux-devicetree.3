Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852940;
	b=h4ovHdMya5AiwbRkWtNj0hDes/8e+/Bc5fs5FaMqOpiXKDUZTpwix4mhJ2ppZfXD8xCp
	 /fw9FUSzCLz4SnazLIlr5UqZY1zv87uQ3YzCwpZDFN4xD6UFwuIrY7j8z7jHUu8PK7gEV
	 zAmP2GfQop0QuboQnwzH4IaDxP0W3nQukgN/UU19mV0kOdk2P2jfVMRquR8nCeuDY5DKf
	 MKkJOGwITFk7VQWDy9PGwphoUY0ardwjgaXtmEpRv3GEq7AVLk17UzBwFWJQict66OqV1
	 hlPtRvkenYOSivOthUroH9znTwTdT3mKxtOZQ+SnVVl62+FWhOl8dnzwPmtK9vNna2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
	b=XW3LMFnJOLVrbtYCCpOpoI1GowIcZGRnFawIxpeoqwK5btRNPbm65cdA9yZsfrGxD4AN
	 rv04YsdeNfLIvmeE2CT/bZKLW/Vyk3hS68Al40tdqTo0dItla5B8Oj7ZDaMP3dxjufbet
	 YLbWl3fe07VGFRzpU8pqdf9Bks8aV1cV2aGrgEOIs0x2A8IFQMihRbCBtM5l4jDM38H6k
	 TaGT8r/CeCyi1ijvQDm4JL+IdS93l430uiP6c2sJzvQVOlyGAixLtkOPwc4BMqgSKepOZ
	 sRcS5jxl/kF/pEdXJph2rJcUNwUdGVMSljYxeAlMWwOCNAo8lqr0LBjwB00cAx+1Z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49748606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 08:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49748606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso85154975e9.0
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852939; x=1796457739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=LdeAbaCmG6aGvR2nb8gxW5A8NUpC5be/ax/tgsLkZ3JfclnVHSCztMsXwwaOxtfCbs
         Whn6R4Xgag5vvedOlLOOqZIFnO8p/ma9v3ewdMLMmUyJbXJcCYsbNL5BU8NrNcJm0+oO
         eSwAcSAwqLPgE02R/6QTtbzMaR7x4ACNhuLU3ilAUFgQLJwW15oDv2Zj8CLXGoYhlgUI
         KPtuMWxjbplrMNqe/O/GPbWscg6EDpj7foYgYY/edB2p0i/glCFuhZ0rShexO1TvOxJ0
         V83OwMTYNND+twHG115GRwZtJlnojvLS57hCFDQamb/4om6vZZDhNJMq1HEeB6yzOL4r
         qeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852939; x=1796457739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=qKUIoxTyREdCPI36dNzDjihjLsYnSDfNUxZw6NN1GziaIJUKjSscavTRfKFRdRgrs0
         n1xij1mGWzzwc3zx09XveAAuiGmlT3a4llzVcgNnO+yuZwMoXLojI6RTs9MVTtiahm1q
         Xu50W3if6JtufQiew/B+6yMQyinqDi1Av03Wwz5AC4CQK34KPpe79apri256htRxQ9f4
         tyzCBS4FL/sOe2h+sFdxA29oxkEnEcekWHSmk7HXHXbFuqHqb05jfFY+obCXxea5XDYF
         Phn1ys+wxup/Sg3pJQXvFWR/aK1Fzp0oqwiMlaq3l3XxBFptYzij4JfmoLV9/1+7sjEw
         DrJQ==
X-Forwarded-Encrypted: i=1; AL+hErHfOYE6LpV01brsj95kX/n4ucnYWGXXXUw5WFtrBY2J9yiz1ONaGDD/wXUlqqDxAimPtv90qqp0eZNE@vger.kernel.org
X-Gm-Message-State: APuU4Z/SACip6j5yOgjC7KtSAfPq8hfF0Fq97j+y3nQrnOI/WxJM6DHB
	w5895AZKmBSHXJQP1C8UU8W5S36V+VznObck6WvvpEqjAyNByLJ6eSw84TNGsspnHBs=
X-Gm-Gg: AZFdTZed5CqGP9xgGXQFs+sRyOUX2lmY4tEQbo3za2kmBiUnmcdyLSxUdSn65Dkr8+q
	i9Ks80P9gxWBMn+l2SHrpebueeHnfTIod3Gdim/G5iG5quIr3Gu4k1vY9xi2O/SyQxNL7BqqMDk
	nfE2ficb7vAMdzqRCYwlFr7tJaU9gUOhxokf/t//u1SnW6oi12Ajt1PSBmGlXGAZ2CfB9T59zFb
	Osl/HfFHraf/C2yd/Lbw/HIDdzE+vittPqklguABrtfTQPcKVCK3I8u+OMo3MQ5ZEgkbizVZy6Y
	HCqT70gMGpOTdZuuHVi4loxk8unw6YPG6tq1UPi1O2BQIeWnZg6PJ34W2IVnhBL0813H1wHcjHv
	r3WkRATeicoYsWqlo1oFYX9E7vmBmXXaGwvDdbWFluQL26iVz7+xmKqzyIC/Fz7T1puUB9lRVOx
	wxzjcZ8DiF0gMETtFFSi6Ti/A5/ojaE9ygaj3IuX2bWSneweRT086QQ5NzmlT/NYReNnYymxLDV
	x+tziHtj98rtMTiL/AaXhg+DaUckPjXIx7u/ybi4KRVTmDceno8FNrE94JjTmr2DPe8wWiMOYyb
	x1xGs+sGJ9G45Xs2YO2SjoGKoP9p6CZV29BRYdU8vt+eDOkcE0Hkbo3bTrlD4oDpyXSMFL7ZK3I
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr505581765e9.9.1795852938637;
        Sat, 28 Nov 2026 00:02:18 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf680fsm59330195f8f.14.2026.11.28.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:02:17 -0800 (PST)
Date: Sat, 28 Nov 2026 09:02:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
Message-ID: <awqKD6EufgpjsjP8@monoceros>
References: <20261127073231.1776847-1-alastair@d-silva.org>
 <20261127073231.1776847-7-alastair@d-silva.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xgu3d2pgo3fouvi"
Content-Disposition: inline
In-Reply-To: <20261127073231.1776847-7-alastair@d-silva.org>


--6xgu3d2pgo3fouvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 06:32:26PM +1100, Alastair D'Silva wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> provides of_device_id already without the
unneeded build dependencies that <linux/mod_devicetable.h> comes with.
So please drop <linux/mod_devicetable.h>.

There is no need to Cc: me for the next revisions of your series.

Best regards
Uwe

--6xgu3d2pgo3fouvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKioUACgkQj4D7WH0S
/k7jYAf/QI/UwQ7qh2BbAqLJFatOOEv5i4Gi+vBVMqy7v16wMvrk3u7U4/ECqS/O
C2/R+NZfyAK6CTe/5t37K/v9LeyvsEN4IbMSK3b5rwXFErl5KgfUZIBdgbD/1BJJ
UP2X0g6ABsQZ5fNkNJXk8nerljU4Pxf7OUuWsz42+HHHKiq9AcZwAZgrS/TttgCN
xeKamMt2XFYPMdjOhAhO57r/l3qPChmlWbT2bDdzM4i9nTyLBXrDRghnJWItoaN4
puwi4x03yymrmDrp7IH2TYfNTOy/Lcc0OcjvpqxxhIG18CeOOMBMdMXQofE0HdQ6
Htyr2kbi6xiqECUEVFTnuPE7uy+hvw==
=iKhd
-----END PGP SIGNATURE-----

--6xgu3d2pgo3fouvi--
