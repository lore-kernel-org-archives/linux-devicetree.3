Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C443B895A
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292617; cv=none; b=qh8eX3Kwl6y9ivuXJn47yXMJbaprWPcZpKG67JAFf9eA++N0n5VgC5VbeqaPTYGomoMKmEW9639dHOrwTRxG9BuKD0SrJFtcVFmJjOaJnCbjLp4XAdosQfJWozBt8rEMwFkVfoXKDzqmlgGYB9ODgJu3ZGP9vzljHT69TZpp6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292617; c=relaxed/simple;
	bh=urZWKUzxY3iuGJwbAElm0a7R7sHpJ1yS+m5X7xo6Y+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNbAvuymDbigbO0M3+kLyDmhmvDp5FWApt9eLhUwDdcFIhVBl9KKhlKiJnRvFG4iH9tKgd1tOXZXl6Mlz/b2/MkGCgQ7pEzBWtIkzfR7LG4DUZsV77aSF+OriFHyl5LYlKgAKCTWAOdgfqrv7Peq5rckXvyCijlnDKYM08BVGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xVqKCCv0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xVqKCCv0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zeFeA8nEaH9kZMfpZm5xXYFixMSDmpxZ1xCx9TDqN/E=; b=xVqKCCv0kMcDlK/inDVgAbW1YR
	20JvsPAQYBkVM7N5YR0qQPvhtes7iF0iIWlVgns9h7P/1LjmTqkGesWUyzLYbDQf2BpX8F5tBmjPI
	wCF94ze3RmwhTUAs5cEnkd+9e6Jx1WYKMhiqEJVyDBVuqSyY2LtjntQa8qjOnI1rKUAwfBTniQV+C
	MZN1JATxA5l/uT0iMzOQfko3Sbpejn3KBOEP+E7oFTxWW2/tB0UySMaq9p86xztSGOMZSAkVoRqG2
	JTYn8if6oy9n1D4YkE3ik2wn/HuYAfvnPGrSgYJ8CS6IeKD3Wb2/cvpi4wrPExY/mK4Rk0SF8+Xkk
	dIcw3fMg==;
From: Heiko Stuebner <heiko@sntech.de>
To: MidG971 <midgy971@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	jonas@kwiboo.se
Subject: Re: [PATCH v6] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
Date: Mon, 27 Apr 2026 14:23:22 +0200
Message-ID: <177729258234.1866089.15459100278998354452.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327091128.2458-1-midgy971@gmail.com>
References: <20260327091128.2458-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Mar 2026 10:11:28 +0100, MidG971 wrote:
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
      commit: 8df9160f6a50dbdae8ec287d429efc9d2d9001bd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
