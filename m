Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551079;
	b=A35h/rIYq/I9rSGeYFh86trnt0uVzGX+edzfg/LBbvfKQKULk06VpeBLtnUQTda6q6sp
	 2HpAtv9ZZvfxlXT+r6oOIjruIKVFMliVgLwPwoTuD8jcrZPsw9AbEdAEjFc9+W/oJMfaj
	 UlDyOmRd+ZopHG9VNL8nevkm2fCFiCc+ljBEhrxAzXo9nysNSCCwO4XADYYNX23cIL2M9
	 XW6r7SMVJUhf8l7oNLvpEP52dbJn/JiTL+QK+Xwurf5yE8RUPQ8C4/ZD0cGxStwtx8/td
	 qiBfSQ959K/x2earJzMCVYbh2qpvGyObVfCEgXzGSuTpcN1Xkk5ljDN0TIHT74l3O7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551079;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BUOM/pw3EPem2znFd85kknUWld1XRJydYwICtGMnpY8=;
	b=4mzLf9s/vO0fmI5QmxGpmNVoXDfJ2YIjzGXu+cFz8MNEi2LE3Peo0A5X6Qf6y5o0CVw/
	 +o6t+5xjFok64O1/62S+IZGpY1J8W+R5/KjU2xUUMuIZbtpcsFfaK15RElQiIlznWABqr
	 4HwwbyNr/8eNFUr9cXpq90pRHIW5XYpQP9Z5VLoflr6FEF4RHFVom2CGuwMmWlpicgCa5
	 X+XTe/eErdAtdYJxDwDwr12mas7LaUm8o8ZeuckRjrfTGVlvWadtFmEKbYIvWhBPZGgUO
	 4mIH1RLmi0GdoKChC3gg4A/iULnxFdHY1WQChjPmdnqZHTscDGmlklN7JUW07SyxfTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=XbypoaSb;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE7606A321;
	Tue, 24 Nov 2026 20:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2EE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=XbypoaSb
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 649BC1FB70;
	Tue, 24 Nov 2026 21:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795551075;
	bh=BUOM/pw3EPem2znFd85kknUWld1XRJydYwICtGMnpY8=; h=From:To:Subject;
	b=XbypoaSb3rZ8QDSvopbLldDok1saNhtoQUuNEoy+DZ5zWVbRU/OerIecVBfXjCbeo
	 MP/w7okOc3p+Hky5VLK8AWBWB6U7mGvpVEckwVgjJPWsfstqXa5aEQfPCA68F/nMrw
	 RwZtd5LZvKYNbLAMkFrDUnGUyWFaXsY97UCOqADhtIl3a0Jw3KdhEDX8ud7lutppcn
	 vLs7s//I4BiynvdEeriU7F7nzLUEQE4s4NEvBc3rDgZIKFUy/va+c7KHXhMSQHQkZ3
	 Av3eXAx9H7RJrz0IE1WkvB5wKvdsoSHEuoWfLUK32Eno6VcEBNJQ+33PP2Xhd4zR1M
	 flv2RIwwqef0Q==
Date: Tue, 24 Nov 2026 21:11:10 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI
 controller node
Message-ID: <20261124201110.GA366860@francesco-nb>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>

Hello Frank (both),

On Wed, Nov 11, 2026 at 02:31:17PM +0100, Frank Obergfell wrote:
> Add dsi node to the i.MX93 for support with mipi dsi panels.
> 
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>

I am not sure if the other patches of the series are ready to be merged
or not, but this seems a patch we should merge in any case so that we
enable other users of the DSI interface of the imx93.

What do you think? What's the plan for this series?

(yes, I could test and review it to help, I know :-)

Francesco

