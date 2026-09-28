Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA54B95A6
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596918; cv=none; b=fuDr0YaNB7MbmNP16Qx/xrB9NFCB1GIo/HlCv2E/Hx2gwZlOjfQse9b9W+a9d/l2IdowbQQflWB5VX6kU2me7QSbnL8nwg5vEjINsZf+qCz0g4xoO6Yefp7UfrG8nlgKwinCofAWKZbW9qGeI7k99G/2xSiG54eIzf4nliTvB0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596918; c=relaxed/simple;
	bh=8QIQAC1Squ20uW3BFDWzJ9EWESY3KXzBPAIvtArdRqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCGOdwVR93cuFtGI+oYKn6qcsjmmSdudL5RFxxOOTIIEQgLptCutEmFn+d6/cD4JxovBYucecV+GDDxODvCtyqD4t24UYwbADYT5h86JVfPtwKSQrg4w1LP1kTJWulqmyKx6kH7zVx5UGi+cVP3COfGzkR1pwzqPeAnKLcvzLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eA7DeMMZ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eA7DeMMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=8QIQAC1Squ20uW3BFDWzJ9EWESY3KXzBPAIvtArdRqI=;
	b=eA7DeMMZQP+DiJNLwCRQg1gj9L4jE43tfQSNsBRe6OzEzkeW4kJKPGX0mUfCns
	xnlmU1aNEpX/1GfkQBYJJFEI202R8A+VYLF1cvOlTA2tjrrT4srBTyUkbHzGjcvQ
	Yb7W+VIF1A88X5ZLLRWpyyrzB8X2fJNHfIwtsULNl55fo=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Mon, 28 Sep 2026 20:01:31 +0800
Message-ID: <179059689121.26126.16396827799983991795@163.com>
In-Reply-To: <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com> <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgBnTaobV7pqauFxBw--.30903S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWUZw47WF18tw4UKr1DGFg_yoW8XFyrpa
	y3trWUCws7tw1Ig3s3Ar48ZF48ZrWfKas8CryvgryUAay5K34akr1jgrs0q3WYkws7XFyF
	9r4UWas5Ja1kZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRSD7-UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+Rslkmq6VxvoYwAA3C

Hello Andrew,

Thank you for the review, and for the timing guidance - you are right, and my
apologies: v2 went out far too soon after v1. I will hold off on any further
revision until the discussion here has settled, and no sooner than 2-3 working
days. I have also disabled the automated reminder job that had been set up for
this series, so nothing can be resent on its own.

On the phy-mode point in 2/2: you are correct that the value should describe the
PCB, not work around a MAC-internal delay. The RGMII traces on this board are
ordinary length; I used "rgmii-rxid" only because that is what the vendor BSP
(and many Rockchip DTs) do. I will test plain "rgmii" on the hardware with the
current tx_delay/rx_delay values and follow up with the measured results (link
state, throughput, and error counters), and drop the rxid form if it is not
needed.

If you have a preferred way for Rockchip boards to express this - plain "rgmii"
with the delays in the MAC node, or the delay masked in the driver - please say
so and I will prepare it that way.

Two other things I should mention. The enable-active-high issue that sashiko
flagged in 2/2 is already fixed locally and will be included in the next
revision. And for transparency: I prepared this series with the help of AI
tooling, which did the language conversion and consistency checking of the DTS.
I review every line before it is sent, and I will be more careful from here on -
both about the review cadence and about validating the result against the
hardware.

Thanks again,
BG9OXA

