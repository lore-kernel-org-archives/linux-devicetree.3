Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638083;
	b=ynHo4il1V5OQIsN+cCOLWiF5/JG3ONl/V6Klsa/4cjCQRQbazP5X5rU5zHTfmX0pwLkB
	 znueqq20cxKxpVhIaM8g0Et11EaNgtReDYra0LfF7ptEVJgFwT+/hltVDSjr1Vij6bnDJ
	 aYhdE6lXAoDKgoQHhklcJ3GK+I2+DNW4Id4Qvl+SKM1xTcN3N+pctfgnIMyBlTt3wHtxV
	 1FkeSm2EVIyJBopzTPVUrU3koLEJAuehMkm82WqUKs0Gfu7JdDyDOEbONfpOD+QYI2hra
	 Pj9WM+GOzqseDZb0AZh9YEf0h355Fs/OsIeloN7ct/kYFrXE8mJ63kev7MUQFCev1Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638083;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q1f0lb7RWc9Q15urz+o+3HMy+hoargnMfYFL2uvHrRU=;
	b=bZveyTWjeISJC8+v/9i86Ipd+Q2w3WeRRSh+movwOn24l5uWdG/cGPZe3hRurVTN1uuB
	 E/hcx16S+0DldFk3ugABpY1ZcwCHqmHbp3wtXII6LFf2yptSbXh3j4lxytmcIqlrUDdjI
	 Ym+gnbaqX7uasVr4r30foW/zqANbSmw38pdNGQV2e+gCoGWrXR7prB/VNnRZEXpXo96+G
	 pgvcM+R6ndUAMP/eBXveZTCDkztmAR+apEQ15ZmUMGkBs+HBnj84aj6lkzbm4z2o0nLfH
	 7FL5BojQWBNgJ9X0Mq/e0lWkb9gl6SDJSy2KXwtAw3p2LtmI0kxMq6lnJ/GcwgQKjmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=K1dX8zWL;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067D1606A323;
	Wed, 25 Nov 2026 20:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 067D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=K1dX8zWL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Q1f0lb7RWc9Q15urz+o+3HMy+hoargnMfYFL2uvHrRU=; b=K1dX8zWLZlhzTMNu8QgVojp258
	Xaij/I2WT0cmw1TY1uFV6UetbqGiDcNe9lw9rIDc8bUw3kL9HgM8Jat8lQ7lcw4V/Zesi6cFqDFBA
	yoxp/Hi8WlHIbi3CrmVaTRipAfA5GKpZLE8EbEMLfrMaJWV7VJdBaoFejUnFn0thM5s7WsjLajJed
	/rWkqmv3XAPW+bo8CiN3IrVKHIv3dt8a3wAizh/SbdoThi6CxgObO1bhDQXyE8nK08G79cHEvTQ17
	/QVXOmGdcT/M14LgBi+wBQN44heHaNqD2Bz/Aeo3EyOCm2azRE3F1PpliM0JmVTlayCwDo56zqOZ/
	4WMdHF5g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI RX for Orange Pi 5 Ultra
Date: Wed, 25 Nov 2026 21:20:59 +0100
Message-ID: <179563805244.3885553.95572502382355679.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120090712.68178-1-jan@jschaer.ch>
References: <20261120090712.68178-1-jan@jschaer.ch>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Nov 2026 10:07:12 +0100, Jan Schär wrote:
> The Orange Pi 5 Ultra has an HDMI input, enable it. It was missing
> because the snps_hdmirx driver was introduced after the Orange Pi 5
> Ultra DTS.
> 
> The pin definitions here match the schematic and the DTS in the Orange
> Pi vendor kernel. In the schematic, the hot-plug detect pin is named
> HDMI_RX_DET_L.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI RX for Orange Pi 5 Ultra
      commit: 74ed9de2297d3b7e1542a263966aa8aad8617579

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
