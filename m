Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679672;
	b=akPTOM26TCnhAP4BNzAaVZZtp0+ADtQFk91ttT566GSd4gVAMRUlHb/wGGd73XBbL47j
	 uJf4dwGduf5W84/REQCeY9QXTmOLOLDDK0HQifk8Ric3z7joN+fzNXSKLaJS/3kZTET5j
	 iUbtB5VBbJsMiPlEK+uXzZG5ZY/6h23Y0gjFWNX2PvElEtd/l8qjviA9mM7lpUOxURjSJ
	 JfCc1bkKx71QEgdFy76jDvK83sN4heejnjTb+E24E2dxjd+xJrfhhm+iHGCAOtIVf85oP
	 d5ETB1Zbbm+dvXHpX5MjIiXSQh3PfjJjhqxiFDwGAiQP4turRBNle/+3kjp+rjtoVbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679672;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bUb4hYTBPcgn4fPSOAlue7i31G1iMQmFecbSBRUfqRM=;
	b=wbvSXo7rC6flgaYlZw3AF1HIzmZmDD+tBAYVVxXc4fX+r6nPwYIGUcVN5tzpwdb8VqZk
	 Q2Rr9cwhy4zGZ5DW2I4vqV4RFn/bmeKZpUejv5todKWV2f7CH8h21mBpmuwq2bVj758mW
	 jbWHn30495FOwoLu/pjBYk+91LHtWugEH1sY+vAPxo1ubMVh34vu8yEKYVHU8Om+fxGKi
	 6g4O7Kn7Mu51v15wdfrzNgGwM1mYU0OqESKm2JzanmIeR+PEdjUTvCNgMVUw8cejpUBXS
	 MY7n7VYLmyrx8skaQlfyjeSM+S94/alydhhXFi1KqrPKxQshYSVPfl4znJjW9fVm89A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=R1wUduC9;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2D1606A31E;
	Thu, 26 Nov 2026 07:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=R1wUduC9
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9C2631F953;
	Thu, 26 Nov 2026 08:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795679662;
	bh=bUb4hYTBPcgn4fPSOAlue7i31G1iMQmFecbSBRUfqRM=; h=From:To:Subject;
	b=R1wUduC9jw5X/rsJjGoL7cVRJLM2iRqNJIwvkvI0Ds6VCr7ZLJ3c/CCbg1mWc1+iM
	 Gv323BquroyQdG2kncCJd4DISfwyMHFGs+0/gxwDkw/jnr0+GItx7Wof5VNsfELzhx
	 B0zwbA1eNYI/9mf/W9X6zIODhxL4DYnlSWleByrL+Mip85hlmHb4tqzSVOZFtGCNnb
	 8pygiKYUARwgN4Y0lYkKa672YyRB6QbsooDaNHNk+9JP+3xBcrnK46da59VAL/JDGr
	 KAzBnpwaevPTC64kV6PwRH4LNBbQ57t+9hTDJlLpoY4ETtq3CuHvhTza5rYIqohRIp
	 3+1jxc9mkhX+g==
Date: Thu, 26 Nov 2026 08:54:17 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <Frank.Li@nxp.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev:
 Fix SDIO_B interface
Message-ID: <20261126075417.GA12954@francesco-nb>
References: <20261122171931.295307-1-francesco@dolcini.it>
 <179562955482.3138640.15368712550107593780.b4-ty@b4>
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
In-Reply-To: <179562955482.3138640.15368712550107593780.b4-ty@b4>

Hello Frank,

On Wed, Nov 25, 2026 at 01:00:29PM -0500, Frank.Li@oss.nxp.com wrote:
> Applied, thanks!
> 
> [1/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B definition
>       commit: a9f5577f21dbdd097f8bd0bade4777cbc2c5b804
> [2/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition
>       commit: 25e472ca356c0395d7af26cb325b80bb09b2a183
> 
> drop tag "freescale", every one know imx is chip of nxp.

Do you want us to drop the `freescale:` prefix from now on (it's there
because the prefix is the directory path, not for other reasons)?

So just "arm64: dts: imx9[135]-toradex-osm-dev: ...". Are the DT/SoC
maintainer fine with that?

To be explicit, I do not mind, I just need to know so that we send
patches with the commit message title you expect.

BTW, please check https://lore.kernel.org/all/awbs94RtiqAOqhEx@sirena.org.uk/,
it's related to this "freescale" removal.

Francesco
