Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026700;
	b=ybK6RtZCWhGTIhU+CJEKJ+wbEgEQtymEbMDjT0Py4KFfNfbnpkbLtDtN5p7GvkfAGmQg
	 Xo7M/CBwLbmRBM+CEMgvkRX41e9HXmIz5v5lnY74nrO29Lo1yp6KCXCNEE7eq4NM4us0I
	 695381OotJ6nPbm69qxkcN2DjmrMFmx/eUxyekKN27T/sZl4DAYl32dwVx56uK/88E2iQ
	 1pir0YjVvcPTbrbnHqg+qFG7/ZMtnhiX0nfcdhuzGHTFIeVQ2BX7VvQn3byrUQ2vDbwDV
	 BdEGY+TiZAS7GqRImgWh0nhicuyZH5ElXaz3be+z9raoXUNPjoUJUN4qJdy+u60OhwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026700;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=n1K8seOsKkPOPbWKSfQ5OwT529T+UjkzED1UxjM8Iaw=;
	b=5JOVFuLzEQY7pS7Av7Dmn5UsDyke/Wqk91+ZS5iaJWUHGmQQ3sJSs+KVIQkbgUoOah7N
	 4Duk4dkefaVHC+svSk5fq8MR1ge8LSz+E8BI5B1W4/vQ3rDf5EjSN0u+MPjphvE74FA3o
	 RtZxmfBL1igJbpARfu56z4D8pCDEAjdbl5KbzO/hKNokEWwPfJ7z7/z2Pd0cfWKctykfv
	 G2foeiR1Y4f954vVUr75f6SvvhoKdIe8sk5PcXtRMYbXFtEtIcyO80klLrMwHerN/V+xS
	 ArkUemJn04MEpk3HieRPKINjm3/3UadaoBkV5w8okQrrxjhvrlYRKAVrEBc105SvgOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=KgyGWn4Q;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF8606A32F;
	Wed, 18 Nov 2026 18:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83CF8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=KgyGWn4Q
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2CDB422219;
	Wed, 18 Nov 2026 19:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795026689;
	bh=n1K8seOsKkPOPbWKSfQ5OwT529T+UjkzED1UxjM8Iaw=; h=From:To:Subject;
	b=KgyGWn4QC1zzmfmuQGu9yfSa246jCGcvpfJIZaVGLWN4ZRWX46+MFucMbVfmItST5
	 yQu42gMtBGpN3wnQXjB7yP3Ld1Z+l2ir41zHS6zEoJBZFaXUqzgssJ7/BSW+TG5XVz
	 /r8fitAWr0f05Y1fZqkVXWddvcfXJefs9MTnjtU6Ouamwnmz2IpVbenDY2bmhA7v3f
	 2LJTSYlqoVAxMRAvu85ow7j6dX8jPsg2vn/YKZMzUq8XMcCNNlSa2aXfEqlENeKYpI
	 JIlJElvlXmcfmL8gniLEUBYccqK8vkFF5M8EiDxuo7Fx1B2bcjdfYe9FgC05B+WVfc
	 Dkykgg66NXraA==
Date: Wed, 18 Nov 2026 19:31:25 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k
 calibration variant
Message-ID: <20261118183125.GA530200@francesco-nb>
References: <20261118123837.651915-2-ivitro@gmail.com>
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
In-Reply-To: <20261118123837.651915-2-ivitro@gmail.com>

On Wed, Nov 18, 2026 at 12:38:37PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
> module reports the same PCI and QMI IDs as other WCN7850 designs, and
> its board data also comes in variants for different regulatory domains
> (US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
> the right board data.
> 
> Describe the Wi-Fi device behind the PCIe1 root port and set
> qcom,calibration-variant to the US/EU/JP board data.
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

