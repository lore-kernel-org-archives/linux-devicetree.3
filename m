Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86632E285C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794166; cv=none; b=LLwpQXfr+pznCsE/bM+E6Mi7x4k+ZhK+aJtC7vs8K28g1ZssKUn+/QsOEqJezTqFQlNO21pVrf0oMnq16OTKf0SyHfE8cefI/xrHnuvTjHnfYUjPqeWX41iK0ETRmByEfHpP99HnP1dMHiXalBnQmlNgw+Lw1bgsn/H601VD5/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794166; c=relaxed/simple;
	bh=vCLwpxPaICDJ4c4KeOBCQQzpMJjjpHEYDgrl8OPSLxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dra75MBV1OleQ5M0erBcl4wr4rWkbvqyHEH7in/bGFVc/APmhQMWdVoOPW1n0p6VtTkZ0pKRgVmhJ3OqLDp519zOR1W1+jX6e30Eps6oumLP8mScJmsWrPMCmg/FziM3IHe+BArx1jNyti7ZYtYOtBolU127k9M43CJgz+SjHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TOQVQl1i; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TOQVQl1i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rWFsHNuhE9NhgYR6RUPz4/Fgti25tsUK/Ak2q3CpV2E=; b=TOQVQl1iibkQm7QeEjJoVP8Kao
	d5ZjY6dJEAwXYFoR/e2IU5DBvvv0K6dw4fZZg7nbamcAjeg2j9oX3acED6Kd9+JNCj50TQhwFKGZ0
	UmmR0M1X8WpoGF5S1LLQ83QAzj0jFtOhfN2YPHhkBLWGljdaLHIPBzhZuILlEluM6kd1y0SfB69dD
	OCDFzCFzF3B1FszDpskIiqCKWf2mYcR+002UyFdm0cuUIfFU+SSKKyUw6bE5rabQK4q9hDQrle6Jf
	FtsEM56SEtOZ/t1Ykk3TOPc19fo5l7Pbw4INabk/l/vrTExnQ9g8zYLQQDd+jITSY3wUnDIDSYrmp
	Sn1TZOpA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add missing audio codec supplies to Pinebook Pro
Date: Wed, 30 Sep 2026 20:49:13 +0200
Message-ID: <179079409721.2398180.7039996510410106789.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928133122.45765-1-pbrobinson@gmail.com>
References: <20260928133122.45765-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Sep 2026 14:31:15 +0100, Peter Robinson wrote:
> The DT binding for the es8316 got 4 power supplies added in commit
> e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")
> 
> Page 16 of the schematic for the Pinebook Pro describes these
> supplies so update the dts.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add missing audio codec supplies to Pinebook Pro
      commit: dd0c1c534957a1e297460edd1428b251e78b4fc5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
