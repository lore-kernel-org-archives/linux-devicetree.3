Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD12388E49;
	Wed, 29 Jul 2026 17:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785346812; cv=none; b=ApiNNoWDllryFzfdV+XDRiNdicYpq+5Joky8k1rYXna7zOEWbxwfxlUUVxSL/TPM5DyFrubjpMsSLMWgPSdbCS6x7vVmS2pe0rULBgrqs4h2sVdHCZWgr+5OxEQ2LrcSz67lufuZ6eRiaYC/McQscb8/IcecsWAVa86AruUGX6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785346812; c=relaxed/simple;
	bh=IZu+EwibWZ6UuGQN5eTj/eJsOJwNz0XRL2pB4ko3p1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J3H+a+r+5qmoM3Vg4m2JZecLeVGOVQULL6+pArzxkTW+/CkE/FQSYKNpZl8BANz6xRB9JCKLNp5wxCf/vGmSc1mY/FVxAWFIFGL/cGqbdP+XCvInWUYms99OtRMqxDF9j6jNL0hTZ3xXKOQSTawg3Bds34syasIsWY+Lgt0H2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=p1Tj4hZh; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="p1Tj4hZh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oni6Vg/P5vrta2IB3oW5wSxiUtRzniW6mGMAbb3BO4k=; b=p1Tj4hZhhbsTbQ7P0KwTEHfvl/
	VIz7RJgrRgUlLH05WVNOKnz5xNkHhuuUqlJYtUi/AzSzk9/x92PxZP5kFuHv8VV9DfmMMvTTbY1rZ
	4eH/7Kcls1PKgsDzKZeOQDyIr3kmjV5IMKjW2BkryFrUdUiG/WJiewcojCSSf2mlaqQm0mDiiITlj
	YmrEHX6UuNkvdhMSPqSNldp8eNNI5SA/UvSWqju34pfM/p4xWPZxsvnBZPRka3/JbSzgIx+Jq4xQ0
	tVkbbRN2pKi1i4Xkk/M4qRdJHyIc7za19AjhNJb/GdFMfr4wwXRjFpsISCWDDJ5CEE3xKTv1dxdjm
	vSv3pggg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Wed, 29 Jul 2026 19:39:52 +0200
Message-ID: <178534678977.563748.16244548635154085260.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_0DA92AE62C08A802ACC4FE9E47A0192C8E05@qq.com>
References: <tencent_0DA92AE62C08A802ACC4FE9E47A0192C8E05@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jul 2026 00:36:31 +0800, Pufan Jin wrote:
> Add compatible string for the EmbedFire LubanCat 4 single board
> computer based on the Rockchip RK3588S SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
      commit: 181a06fe549d0b2a805eb112c0f7494bdbeefecf
[2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4 board
      commit: 6d9430d58714909071853c0949cdc93756aa3ad4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
