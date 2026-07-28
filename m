Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EAA4657C0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266209; cv=none; b=r4DQSbvsPnfNmXHMZ1zl2ZgPYhxMcmHRpDJKagiRI3vmPjnRCKcNyPrChdqkbGHPEWKMowX3034xtrVYB/WaEvPWUEbR0Iz3gq29W7MIzr6vNPnwzxAPbVxFI6wEXkYGIX04NyP8j8a14BFFXuahQRzW02wKDPiCs0yy3S8kHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266209; c=relaxed/simple;
	bh=EluNYTyhipoQQI2ph8lCr4Ys3SULpPdn3Lymw95abok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQP/s37HPMc5+URLM9DrLldgoq7yf8AYmy7YEwO+iLSwsvRS/rTsWEjq5zHSna2XHR4l9ebTuh7cmZDkvmFRw6FhOfY8bxXG2zjO1mfkOeNaxxS52gKHz3BRw4IOHW9x8lh51shlGYkp719iElayyddjuCNhWETM71ywFWJTG40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=St1zC0Ax; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="St1zC0Ax"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8bK24QqH1MNg0V4HdxTREFUnJXUUlGEAwlZf4X/A6iM=; b=St1zC0AxH8GKdqWjAI5d1VfXgc
	Aq985pDBFVOZX7ZD28rgjynBDISyml6dkGkUSxa1YV6FtgF1mVlUVCCP86xNAxps2eKyq1LF0Qt1Z
	UsarZiv1jthS1+LbK3wFgg6SP4JzbdwjsCsV82mNs/tuYwL77iIzKxhMgEaVjioMxFfD8jXVmu+Fv
	rUygAnk6Hom6HL2b17XAvoxkaKnpO0Q+STRxYRX8rtI07rTRQbpP9LkkNMG9B8/aFbnpoxzEcfBp1
	Gh7lDcdh/aO1EHhbqRWzP9xgvBby2fa6+GK/uWlJfgUgunxUcxhj2eU4lmoy8pt7rlvH8QouHvQKH
	IvSrx4ZA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
Date: Tue, 28 Jul 2026 21:16:28 +0200
Message-ID: <178526609462.300371.16764379143271807563.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721133445.44283-1-festevam@gmail.com>
References: <20260721133445.44283-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 10:34:45 -0300, Fabio Estevam wrote:
> The Marvell WLAN host wake interrupt is wired to GPIO0 8 and is not
> one of the PCI INTx interrupts. The PCI device schema therefore
> interprets the two-cell GPIO interrupt specifier as an invalid PCI
> interrupt and reports dtbs_check warnings:
> 
> pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
> pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
      commit: a761818d9ee11183df0aefd16bf9fe46cc1c4c6d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
