Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA18A466B5E
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266209; cv=none; b=OXiAQ7N85xT0I333p5egw23+tMfK7mebL+0EFvI0pJx3GGbRFl3ZVwW/7oPShVN57iJppfhxyFbLsassHiQqwhFvIyAokSH6XtaNiqsIgheJIFTI9ccBE8zzP1uFmjBdpvaJ1bCDF1IPGTI8kRPZ2BsIx8walpmBcEJV33m2Yxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266209; c=relaxed/simple;
	bh=7cFNQGdgEzVH6alSnuJ+jG/AKmnqUPWIRtU9K8oFlkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B0nXCziK1sT64WdQAXQG33LD+I3tXG1Quqv57ctqVrhTVsVXe7mgtxthfvddFXZuD9jBVs61Be6fa1XmZhYTOf/PKvZSLkOXILWNp8mfWC+7Kio2z4SdACYPiarO3PPdURs/+3tIuORpKV/yIihFV9StAfWEApmXnDmSqP/gMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=s6n2LzQS; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="s6n2LzQS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LY5oVYdUILHJ7bMyICNzRnyWNtmpdOraX3azrsWKi/Q=; b=s6n2LzQSHVBxfWFaf/WwA/Gmuy
	C9RNLdRAeKgmiDs0gIa7oy5V4y0D7uRbiVQC2inHN61PgZWjub6EWXn4HKllTHC8Xleq8B87DJ7/H
	VLRt4yshEL9EhQ3JH3O0czaKKi7TxIMvPC9/ItTvrXGZc9I15nkyDFb6JPVF4g283bd5tHpe15v7m
	xzLbLK4V0AxX/uodcK9MELyskCq/5fMgSkpWNgVpp/2ZPctnchpRQmCAkcUmlBIYTBuS7R0/XDR7m
	8eRTRNV+B0SiantSzzb/IN65D42o0rYhEVhzcJl7JDErQvUJfmYmN0g4E0+wUKBRFL8pHd/HuTOG7
	xYKTC5XA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
Date: Tue, 28 Jul 2026 21:16:29 +0200
Message-ID: <178526609464.300371.10816180268283621892.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721133421.44258-1-festevam@gmail.com>
References: <20260721133421.44258-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 10:34:21 -0300, Fabio Estevam wrote:
> According to brcm,bcm4329-fmac.yaml, "brcm,bcm43455-fmac" needs the
> "brcm,bcm4329-fmac" fallback.
> 
> Change it accordingly to fix the following dt-schema warning:
> 
> ['brcm,bcm43455-fmac'] is too short
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
      commit: 7f1f09ed517de6b98fbd64393a3efc8b5055c2cc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
