Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2E379991
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453481; cv=none; b=dFw1+B/eeeJ/+Y5HZNaBfps8q/aq11ZaIcSpp2qj4tG4zTMNCSxiF0/FefJTTReVRxVvwXmL5Z7SLk3EY/GzKzdmJP1zXH6Eau7NO1rd1sqhgNrTCaDi6CUkx2K22RhRJdjYdy1wbRe0dQxt8XHq9ZvSSkE+8S67oHw+8a1QfUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453481; c=relaxed/simple;
	bh=YcUREMtSTxOJGh+f8EW4X2z3nrxwlKCdhlZHoDf7hEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RNbBRMK6JQoUuA6Hu9b/fWuCLLNq3o6csQ0J5rKgs1A+UoAM8lysvW2Ov+sM7bV/sMeXyT51sggNvjI9iXsOW91JrsE7xf51o2DOQcfbMaxi9KwCExi3Y4Bli1S4o2swYOeUZFV68fscVT4xpm9zv+w9bUaBzF31xr/YnCuOshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=mFoFOaGn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="mFoFOaGn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RYaQcEoqy6orUWR6icG3w0FgGfd8AtiAsN6o/qvFNtM=; b=mFoFOaGnTTTKr5DIXj4QqSrTo3
	5d7IsOC3+I3K0O4+ETuoi+iGZrINflKIaahW8ZDHai5YftYZUnTl5M4x3oND9D2C+8kIRrG+ROLTF
	V3C3Ovluv7GZZvq+7q4tPke5eLHy5S2SFU1qNbilqEgWW56X4slj1puTVWuZhnzv/Y8L6WBE4Do3o
	wjgpFGkLs8EZJFnr2dPqmQmzDZBOXlIXwlH8xCdib2Wetrx1mROyK3l0nxZS5o3unQC0Ycpbldpbm
	PwegqzmxZKhkZHHExOlqHVYo1tMJIMDfBoH0icC3Hzysj5LIuOg3sPcR9FAbk02tdnpHSVp1E81xm
	+n18ps2w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Mayer <bleemayer@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Tue,  7 Jul 2026 21:44:29 +0200
Message-ID: <178345345842.664858.9814271532472718755.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260705181920.8633-1-bleemayer@gmail.com>
References: <20260705181920.8633-1-bleemayer@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 05 Jul 2026 15:19:19 -0300, Brian Mayer wrote:
> this v2 only contains name changes I didn't test. I added the missing
> agent tag and am sending the patch inline. Thanks.
> 
> The Radxa CM5 IO carrier has a Haoyu HYM8563 real-time clock on I2C6 at
> address 0x51, with its interrupt line on GPIO0_B0 and a CR1220 backup
> battery holder. Without a device tree node, no /dev/rtc* appears even
> when CONFIG_RTC_DRV_HYM8563 is enabled.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
      commit: 1945f419277503ebacd87cc221e370c8b6b94a7d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
