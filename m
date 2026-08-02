Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD82E7657;
	Sun,  2 Aug 2026 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785696596; cv=none; b=AfMcdgR7SaH6SVBy4SF+1B1AVCyzDRPnxSTLs2wKZJsqA7TJD/zwbR2x8i3VlllIOagG5KMl/mJ5EmRc+gWoM1FF8zzlOasPP1/maNid9vKKyZFfUhQKtuvYQ6gm6bqPqnfNVgfrgGexoRy1PT+D90Mz7zBgPT+ZCli9ZEXE30k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785696596; c=relaxed/simple;
	bh=r6+sC9+b3aiscshwp37dOzoDRJnmMoQXCH8KfEH+o1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KD9hHLhsXH5jofa5qbeO3Oq+gBEB2pEtiaB9Y+VmZGqOS3HHjubmkUjZJHfau6uElNEH9KwD66cxrOlb/ogDY8HPExWZu0s5Xa9mjcSr36f0eaJ533OimCvvS2t/75eFDGaDxXwrTQFLgaEV/teMTg66erqe1mvMCtJc7Wp74js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PANDWike; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PANDWike"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mvZHB+V44L8GYhi9JYbmmktJzKqbJwzWpTrCCT/CpSg=; b=PANDWike84aLQV0/yndkOCzjfh
	Ie+NnNZxqD7fpmYD0nQ8UbVvRuV/+AP6vjm0rNbVyB0YMQjWguHgZYQIEVYJ6ExiOROga9cZpgcMj
	Q8xiT2OLal9TSM37lnLgqtdHC/WDAbAaomK3bO3wxxQD6sB8DvWJxtiUfqquEXDZXDJO7f5TFI+gT
	Tiyd4pW3UxKBJCzrcVBSVUTohkkKnOYohS6jM0M4T/ik5e+0RHMDSVsHeF04VJHpA2GLOL7qPR9KH
	9cJxu1IjuMJzytkjN1lO/FLF5tayp9gl01FFVbux+XDLA0vJiAXu9Nr/w0GL8kjHt0mU908p/hI8p
	f8jVG5hw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v3 0/2] Add support for Vicharak Vaaman board
Date: Sun,  2 Aug 2026 20:49:37 +0200
Message-ID: <178569657659.1403346.14538834007028104921.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730045947.388660-1-hrushirajg23@gmail.com>
References: <20260730045947.388660-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 10:29:45 +0530, Hrushiraj Gandhi wrote:
> This series adds initial support for the Vicharak Vaaman, an RK3399-based
> single-board computer manufactured by Vicharak.
> 
> Patch 1 documents the "vicharak,vaaman" compatible string in the Rockchip
> arm bindings. It carries an Acked-by from Krzysztof Kozlowski.
> 
> Patch 2 adds the board devicetree, enabling the RK808 PMIC with
> SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet (RGMII,
> RTL8211E PHY via a proper mdio subnode), eMMC, microSD, SARADC/TSADC,
> PWM-based vdd_log regulator, and UART2 serial console.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
      commit: 50208eafca2b1187079c0c5c54e5cf804c0ce0d1
[2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
      commit: c0fe7b7226942eb4e405d3dd08671510510463f1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
