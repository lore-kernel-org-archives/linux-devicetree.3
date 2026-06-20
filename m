Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0964E345CC9;
	Sat, 20 Jun 2026 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956158; cv=none; b=qyz7Zl+/LQZLj3MVqNH9oGo609p+PKB0S0WEMOLMkQ+lIlDBqs8ib4w5JdRVAr4fvPzOBaxeSizfGabGxBC5zqiVyHuZ7RBHiLjaKFOsxRjWyA7fc6B8GW96QZEZrvuqw78jhrrKsLLyyrfQCTGnU3SeyKeoPJk8MMKf6ubmmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956158; c=relaxed/simple;
	bh=DXXU4HtLN2x/Zg/aHJpUs5YpYCcdyHAW+G14zqHmT+c=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=WrraH9S2B7YuK7M0JeOZUbtt8+RuRE0UcImsvxo2fAo43cVv22L/aNGkULemMGe8JgqfQwVCHiI5/wKU1Ls1CBZRYetYCcH2e9VofJxN2vbWHxeiumApmpytBIdE0wS+sUhPPUslfEf3pdH9yeDtD0s9BZiXpt8SNw+uelBbRb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QB6YpFHA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QB6YpFHA"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AA5092767D;
	Sat, 20 Jun 2026 13:49:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXuWGNteZpvQ; Sat, 20 Jun 2026 13:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781956155; bh=DXXU4HtLN2x/Zg/aHJpUs5YpYCcdyHAW+G14zqHmT+c=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=QB6YpFHAp+xwyMiN2MmmfEOcEOQgap3emCKFZXosC3gwuGQQ/HfUEWev4G6ZxQDgi
	 vHzDQdNFsZcTQtebfAA99s4OkhZ9coelnU+b/QPsv8fsYrfvLY0jCDF6zYBiCbTRRf
	 1M3mKgT+FZiKIM5lULh3LqABPjh7MkiFHFtW7wWDfzsGvdaI7zXX7FNSNM3HDdbTkz
	 MhuSSa25FIe4zjEiss5ImYb0Ph09QrZpnqoqv50pLYNYNsU2lDgKeuJ1GlbynlWnuI
	 enstLmS2sAlb8JA0/fBSpYG2IrnJYijtLqsfDRcawSCzASK3q/LWf3kD6asq4YDg7j
	 3GFnFltYpF/Ew==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 20 Jun 2026 11:49:14 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
In-Reply-To: <20260520175728.720877-1-adilov@disroot.org>
References: <20260520175728.720877-1-adilov@disroot.org>
Message-ID: <ad45accb8136605d3b28f4ab4992336e@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

Just a gentle reminder as this patch series has been sitting idle
for month already. I do know there are a couple of reviews sent
by sashiko AI but they are only about pre-existing issues which
has nothing to do with this patch series.

And the issue about "[High] - The driver attempts to access the 
PHY's memory-mapped registers in `probe()` before the newly introduced
reset control is deasserted" is not the case because rtl9607_phy_cfg
contains the [4] = {0xe4, 0x6a} in page0 and thus doesn't trigger
phy memory reads during probe (in update_dc_driving_level).

Best,
Rustam
