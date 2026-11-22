Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387848;
	b=CnR4LfFPgLWy4WdIspwfZFHDcMhpD5aKk7wui+7lxzYSotZlnABFD8hCuKNQUqNOlH18
	 MgYF/f5Vpe9JEuwQuUjf09mV53vvDSG9+cvwCqqCRCqR3QZlp2K7l+WIjC9Y+QMoMhRtN
	 xAwzsWkh7oRRlyvZe64i0ui0arvo6eF3BzEgzxEkp0DDx73rJeb4XcuMbCyR64waeydlK
	 1AWczTgK3RASa8ex+y7mb0M8eOIDJ3xbus/MnR9JNRQSfVjDWsP64CjG3o0jDNBcIDDfF
	 irPR/kt2T5FCbt0pYPT3dmOeXA3IFh9cPoFD0x+9MEluZOoon8autebR+BlPlO8AFGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387848;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yWaFCq7JnwSDWKTvNogLNZK80Tf50prb+R7v0cgYNHw=;
	b=ujievN5szJ7wekB1sLMplJi5sLQ7j9VzXO8Mw1GaiXtmLzCv80JbKQwSpaL+yymT/OB/
	 19dzPOz4eGKIOtXguXB4FVqKLCT77hdMSpFbydczD9N6s4F0D39arhBAwUlU9kWTQxLWo
	 1urr2tF8TjOUSb3HVqLj6ZzKwHmF34ZX9jet+NsthE5BT0HUDq+2zVCeSbFW/sBPhjKxo
	 cAXTCwGin2eJoUrnitItWHSjJWjluWX/Bg0AIzDNKmFcMObmWJ3ec9cjbbNT/oOfeWIAn
	 mZTYrLZjUhxAYQA7mT6vCmNUCEbdRCJc/vlCOUs8aB5wDpd7XnF1Eh0rDma6D2Oh51g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nOBwVEwi;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5ED606A689;
	Sun, 22 Nov 2026 22:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5ED606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nOBwVEwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yWaFCq7JnwSDWKTvNogLNZK80Tf50prb+R7v0cgYNHw=; b=nOBwVEwicULrSbOpd7FOwsEDZT
	RM5B58gCETz0HpRYEJHhtG8598ZZxNBOFuhsBARM0iwUsVrmLpQ4GHkHZ6NkZRw0zhTSe6waHQdcj
	HV0gd8EJMuSxktNsfSoCJrnokWM1FDqUtqMXnxwEnFJELvqeh0hK26bKfRhWBDaIXQtOl5PaghTmb
	VLZxs0nbQ07xhdUC0mGzrjC2RonLMUe76zOFX7PDhMmYetiOvoKBdkUC8+lijNRO4M5UsftEvYujX
	+hUA/osiDCfCyOqQnChA1Rvw3lTKTbfLDOAQp3tzViRVqI+ei7dgWHrZ8sa4FmtH5bYsx8+a4ZCU5
	f30e8rQw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi 4
Date: Sun, 22 Nov 2026 23:50:23 +0100
Message-ID: <179538782481.3150822.15935425724986295169.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv>
References: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv>
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


On Tue, 03 Nov 2026 06:12:10 +0000, Igor Velkov wrote:
> The SD I/O supply vcc_sdio (RK808 LDO4) is pinned at 3.0 V, so the
> card stays in high-speed mode at 50 MHz. Let dw_mmc switch it to 1.8 V
> and enable SDR12 to SDR104.
> 
> The card supply is not switchable, so after a watchdog reset or a
> panic the card and vcc_sdio are still at 1.8 V. Linux and U-Boot proper
> boot from the card in that state; U-Boot SPL loading from it has to set
> the SD I/O domain from vcc_sdio, as it does on NanoPi 4 since U-Boot
> commit 210ab4f60df8.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi 4
      commit: 149ff2e99d6aa12d7a971a215723b8e92a5fbc05

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
