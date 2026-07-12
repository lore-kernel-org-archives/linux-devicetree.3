Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D85D3B442F
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783888481; cv=none; b=N7elGjmnK0AP8lEZjur67SWofVpac0Yrj9u79hS+2gdGhe3gwNetPqVpexGwF/eY34P1nCfxx9fzTYvomoRVjZW3LNiL555GFtl8yGxx6myL4ctt/akFuICOtItprhJSvPQwrDKF7Mcgt/otp794YXKbfNBFryuthml5bld/l7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783888481; c=relaxed/simple;
	bh=0lCx3uJLC0QvZdkTZxjYJ06ZDgtS9hT75ZAPb0+6KQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UilMU6uQrhY0ICeU0EMWfndAZuHF9Ib2OD5hysPP/MMK8xOkFdLen1mbaveMlzGIGZrnz03geqxzRas0zRbGyRhcU0iLic5UTh79k+P1LkS1deTVMD2OTOeKod47Mi4jKCsm3oCQUboH4K6WkaOJf28OJzxYvCEp5sUaDpAU67E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QbMPaVBb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QbMPaVBb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2westCkTI2EE14pA7ejSU5HuW2PbVOQcSsUv15jFNlU=; b=QbMPaVBbJIp3LKUESMjaC/cW//
	/OJ685b/a2KsTfx4nHDV2MeAJigZo58qN+uPcfT5m1IuTLy85jEFyyGTzicIXDnUmFyS5K+oa5FA+
	wER4jJEciXfTJa1KxbFEeK34wMnFJYUTteUHevdvqrSzWZs+oUhzNriLtzGZBSdjsEQ+Eaf/8f2cb
	6XnOLByglEm67O5Q1EfpOTzXjPXZzpFRddqV5a4pWio/MLWYmvjqLYufIhGcgWhZeQquj5PXJJKOV
	WJVm95S5n8gON8UTLasdz/G7l+YPNWP6CrTNhX/wZN6fo0rZ0TYavtsW/PrP602qsHxIcEqx40Xps
	sdbpYtpg==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Marius Dinu <m95d+git@psihoexpert.ro>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] arm: dts: rk3288-tinker: add eeprom node
Date: Sun, 12 Jul 2026 22:33:59 +0200
Message-ID: <178388833985.1396294.12062484754801637689.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703084645.7001-1-m95d+git@psihoexpert.ro>
References: <20260703084645.7001-1-m95d+git@psihoexpert.ro>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jul 2026 11:44:53 +0300, Marius Dinu wrote:
> This board contains an EEPROM that holds the CPU serial number and ethernet
> MAC. It is used by U-boot when configured to use upstream device tree from
> Linux kernel.
> 
> 

Applied, thanks!

[1/1] arm: dts: rk3288-tinker: add eeprom node
      commit: bd504200195c0bcb26706f363814d3426ef3baa7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
