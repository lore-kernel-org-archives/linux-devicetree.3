Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C936167B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309226; cv=none; b=MXr7OkEErx8y7l35SjklaAlS7k6k/LkslIULa6qFwf++NLjnhrtklXqzSrHVVy+87hIiCzv7tWhwUQylamt2HlAxoU4nhtIT/8TpR0zVynDfLZis5MOaN4Jzp6MSFVZJRImzEo6zK7mF8VH3qzDA3dPSmy21OWjKAfUW4b+ryJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309226; c=relaxed/simple;
	bh=du/qT0GGnkJKl5HML/LNlgpduCoW+JvpYWmTe9jqOX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kS7nvQ7bYfmFQcI6gqnMs7BSScXsADkn+vIbO1VtZKY9HXAbO6XvIfEj1F3yKmbc0qe9DX2powcie6ZY9RMq8gGtng6Cq+nb/ztqFgFS2O5PgMIReYwhjjw5VyNk3gOrCGw3wYy2tm1dyRWRhHNJ67nCDxXtlUCQBYXVWqXRTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=D9ON6zcb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="D9ON6zcb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vih2sX10b+YArA5nJOOYULDdBvv4rp3a7PZWZiMVUhs=; b=D9ON6zcbalTLogTwXgo7c1NWnM
	Up6/GzpKX+SPOdmb5q+1aOa1+KFsx1bUtj1XeTNv5vUpxXWoQkk24E9Xx5OnWGuUzE4adybg6fioK
	AqExpHpHbg1+yiui+kZsne4Lxhn1Lk72cO0sT+Y78Iqgqfv1t8c54GYzK5LZoL6QhfdgOrybN+dUB
	2xYdR16d/m6to+Urwic488xkTO5h5WNkb29XesXxLO0Plg3rWyh8ZnoyseLVpPFUfavXimdtOPUVi
	x3YAs6v1fISNr4V0cQ7O16CzD5Z3MjF9Syqd+Rf8zqyPgaY1NoKG1el5ldvnNOczFO2RkLhpDHTpb
	XzRgVBtw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399-nanopi-r4s: Disable removed devices
Date: Mon,  1 Jun 2026 12:20:02 +0200
Message-ID: <178030918398.239725.10006310705727779216.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505172903.33271-1-wens@kernel.org>
References: <20260505172903.33271-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 May 2026 01:29:02 +0800, Chen-Yu Tsai wrote:
> While the design of the NanoPi R4S is based on the common NanoPi 4
> family, it is trimmed down a lot.
> 
> Disable all the peripherals on the SoC that are not used, and delete
> all the external components that are not present.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3399-nanopi-r4s: Disable removed devices
      commit: 8333fe46b0010d110b36f1628dd8dfc77d2c389a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
