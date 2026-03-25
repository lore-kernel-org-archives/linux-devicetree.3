Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CA40DFB7;
	Wed, 25 Mar 2026 23:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774481932; cv=none; b=A6wTY66D5mRqEs4fdWCDAh+OcTimjnFn2P9M8wa4rF3DdjvcOe03+3BcHdQzaFIEcffOWtou6ZpGExjKZUDjA0tKjjYhw8LB/jLTaYHUXfoXHUsOIb0QdO6SeoEZfkXXxzmAMTkU8ye7x+RucZn7cXmmCUKdrKIdIKkcTjRDBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774481932; c=relaxed/simple;
	bh=cr/m43OJN16mpRf3BEPu3m6ByiFKMLvsn5VZhf2VStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B5WZbB+/BKs1TYREgQWuq3oZ3zVz9fgNj+PrnQZLisjeqqzH4CKwNzz2YGRfCNMRXj/wgzEOCxYsc0yEQ11+Q5FxAK+Ph4m5uhPqudaLA4LyxIfTx+8z3M6G1JFH/QcW/OgPwi10JXEeY7fs1uHWfhx5XkPkhhC6Ih1kKZUR4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=STyksvvP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="STyksvvP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cnwxTt1L/KFHjhq4SgpWoQjkbViqtcYR70ypPc9O5cI=; b=STyksvvPwh9MaOK2RojGKf0AZs
	PjDtRWYh6XRe4A8hwDdtY1fQYoljnL2jsyLnbZZ5okWpIsLNUlPzY+bwZyWt8XtalNSwqumyIM0bE
	pUJOJuh8xa6qiiXet0roD8Tf3BXy2+3xSFNsjyzla4wsSduzU+bmft+/+ybAm6rcWTh90rgG9SQ5d
	+Gxyqg9wE++W3ftt03hB3hyvgobJ/dWTB6Ga6GFbmGdNhbrv7D4OVAUzOOO9piBmvbGt+kTuwfcpi
	H+OCQEdt0xuLaQhsmeC93qCLd49dKTLGeMxXmu74MeVm3O7ogaVgnnvVPQJShAfGOcY99rs8N97rs
	xeKMM+mg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pedro Alves <pta2002@pta2002.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Thu, 26 Mar 2026 00:38:30 +0100
Message-ID: <177448190116.1054629.6633892031656832251.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
References: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 23 Mar 2026 09:25:33 +0000, Pedro Alves wrote:
> The Radxa Rock 5 ITX board exposes an HDMI input exactly the same way as
> the Rock 5B, but this was not reflected in its DTS.
> 
> Change the rk3588-rock-5-itx to configure and enable the hdmi_receiver
> and hdmi_receiver_cma nodes.
> 
> The hot-plug detection (HPD) pin keeps the hdmirx_det name rather than
> the hdmirx_hpd name used in other boards since that is what matches the
> official schematics (HDMIIRX_DET_L).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
      commit: 6cb4ec63ba9a5831621cf951b7af55c67beeb97b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
