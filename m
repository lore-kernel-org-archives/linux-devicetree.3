Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA031466AE5
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266209; cv=none; b=mNh7qkwR22hgGQpXVdp0w78M9F4Zf2iaB2ofChP9+y7HbkNxS+tNqz+aB0wBUK2ZJIgEXQBZU7ZYMuwQBECtXbTtngBPJde6fnOSkRMIUupMXY1DAOFWJ8gb0MMciFTTDAmH5rXIXXis7Aqlwp4zFKX3Z2skNYMDv9xS5BRNV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266209; c=relaxed/simple;
	bh=eJUb7zRWB2X+9XnkIfibxnARcfxCo0Wwe67OI6Gfu5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECws9RWgVKA6GTYFgtUcYAA+dY3h9ws1R6vhLJ0vACcvgCOXn/sUNGx7Ca7LKJdgM8fuyPBcHBQ+Kv9Y5Y+xVi2wSyoPdjpy8HBtHNnFfIc6Vl+e1SaklIWCWSTDrrgvRFtPR4rKMY6GM1hfLHMme5OxGpTB/Vas16j1Mlysqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qDP/caSj; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qDP/caSj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=huxwkT+YIY5j8ccI/eBKthSOzoDq1eAsTS/gveNwfvY=; b=qDP/caSjc4232sZbnKAOButDeu
	LlLhjJ7dANEywkTzJ8DLnSuaz6AFXKvjbALFh/Jt/oWpXlcFXJr9Q1uMm180waQWIaezdOgr/qZ7c
	QcZCC7ezvmjVmxaxXpam/c4Pv30qdVKUaFJ/sfpwAjM9ZulX92BMEAz3zr4VjK9iEg87nXKURZ4tr
	Y/noKsHYTLAx31lNOAObAQcdchFnZRC+JFfli+9zsXNMMGFLWRImHsk5jeFtvDF7eYWY2qkMAN4nY
	G1mgErzIVIeX5WHBs2Ln3pZ4rB9fxwxwRFhK/ZUkcZ7L5BsFT7L43Oxy4Iiz4n1cK1WDqJNJKhhPi
	G8No+aiQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	ivan8215145640@gmail.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
Date: Tue, 28 Jul 2026 21:16:30 +0200
Message-ID: <178526609460.300371.6870449079631609036.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721135450.45286-1-festevam@gmail.com>
References: <20260721135450.45286-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 10:54:50 -0300, Fabio Estevam wrote:
> The TSC2007 driver uses the ti,max-rt property to specify the maximum
> touch resistance, but the rk3566-bigtreetech-cb2 device tree uses the
> undocumented ti,rt-thr property instead.
> 
> As a result, the configured value is ignored and the driver falls back
> to its default maximum resistance value of 4095.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
      commit: 7707e4555cf1d52689621e3206df8ad2debaa0dd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
