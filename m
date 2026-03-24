Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59E3CFF6C
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371906; cv=none; b=i0PbuOANQQ9kNlTKsv7LhXoYmHcFd79gCE2/eA+yV3afMP4+Z06MRUxNguaI++tIJUC4odjUipqBebLnUgBX8h4aZJpIv7LkB9LBeeM8E+E6KI0E/IaomkQ6iXM5ksYxLcPKT+wAdxHjJLLCe4Db5xmjDejq1DLggyheej4WwVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371906; c=relaxed/simple;
	bh=wwFyes04Tq/NDG6WIPVRN76kryjul7hHQNlZJDE1VyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCpRCxk6ESA3VbENU4UMwfwbsWxlEDofozZWW3lM7aaguLPnqeuZBltP7nDn6sImSv2kNJeSrnVWTh/OKrAtHAh6/cXcvfThO/q3nkOFt3uExMB6itZ51iBEiOP3ZLHxNN8g3OCZg9GfuQYVrM5PtJ/6Op7CM8p8UjJqJU5Ecnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=a/aNQTwe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="a/aNQTwe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pthCqzcNV07zQFAYZ2QgjDyhOkbaR/Ra0oZwRM7xAAw=; b=a/aNQTwezhKlWZD4weZalk1vX0
	Q4pmjertPTAXfiaM5E2huZ3OSJHo0Zl7zSXBmvjvPJl10XsjBL5a66qi8e22sg+8aanLEJIyBCNK+
	tYAUn/9I8mlHI0IrYfd8b0rvseZlsz0c9k12rpqaf80qqlxTS/HjXppkZ+5A6JLWnKrGoDF3mNnHv
	A6i3tgofkYFKl+SaMyoM/tAvZOcaG/x+y5asuG0VXRy9/dAznoXD1Ltwas1+AE33aPGaZQGg7hRem
	vNP2nnCQLBwx5xRAhZYHLOpm06JufznjjYNntKNELNJ+eTF66FeBwQLc5rc7FQgXimJYt+rb4UkP6
	rgP/qrrw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	MidG971 <midgy971@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	shawn.lin@rock-chips.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
Date: Tue, 24 Mar 2026 18:04:52 +0100
Message-ID: <177437177535.786081.7519498810130807269.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320094441.128263-1-midgy971@gmail.com>
References: <20260320094441.128263-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Mar 2026 10:44:41 +0100, MidG971 wrote:
> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
> This chip is currently modeled only as a fixed regulator
> (vcc3v3_pi6c_03), with no clock output representation.
> 
> The PI6C20100 is a clock generator, not a power supply. Model it
> properly as a gated-fixed-clock, following the pattern established
> for the Rock 5 ITX and other boards with similar PCIe clock buffer
> chips.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
      commit: b61f3c69c87b5f061194f413d810723698534b02

As I somehow expected, that AI messed up ;-) .

In the 2nd part of the patch the reported number of lines
in the header (the 15 there) does not match the number of lines
in the diff itself (14). I've fixed that up to not have another
round.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
