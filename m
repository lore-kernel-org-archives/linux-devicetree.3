Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387847;
	b=aas1TYMuboMF57Pc1OT42ioWZpdm3zmxenmrjsurDWENcyc+DjLbOmJ4af0FE0q1qJYN
	 NoShdLy3L74wAdaQS49FwS5Ah1mOO9x9kHuFIYm1VGL+LigruWErrqrEX0RiAmrlaLBtP
	 hrI1L0UhmYDtumGyCHImHUgqKS/hFuUDlDH6SLpi4kOTJzHNlU8bmXIMp9ftSuD0o7ZmN
	 ODSzFi2hP7R+1U/0JJUJgcu7wzkQpNgB2JTblhDREV7XXZmuXoV3I51yEvnPWPbM5pjla
	 oY1Vaof2v+K7SxMIaTImhdeKVuSCKZ5G3/QlySloO3gOucBeesRvBt9XSwwEX+T9RRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387847;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4BM+qrLCQG7Tx5gN7bK0k9cYmhAdjhuB3LguEexBUjQ=;
	b=UWzLKafJ+SD+IR+TdYlr7iAAANMsRAzXb/kCxEVw9jBfH/AduYu1lClXZlVEPAiQSF8y
	 eXn4kHetYWuB6dpoyJphqHiY2GNPeRSdvtSy1vZ2EwX0hPL3eVtMIFi9Dd9JU+DkpKnGH
	 tP0bp3aUEQiWyC6q3BvHpVkEw4DLcu6Kh1lMhAfN6XkcktH1IKH+AyuH9BY+9g36JuZDL
	 JN5j53ZCZ7DPJTqtpUexlK4ckg3pD2lMJHkPjGn8uJ0MkqEzXUj4p+twKc2cGm/mQGYNG
	 CZiZj+eteP1EjZkB6mFJPFY0FUzVwbNaGI8i3LqB9YK74QBHqePz4qgNrsDqNK6AsnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=S9HritYr;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5DD606A33D;
	Sun, 22 Nov 2026 22:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A5DD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=S9HritYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4BM+qrLCQG7Tx5gN7bK0k9cYmhAdjhuB3LguEexBUjQ=; b=S9HritYrDbD8pAM1lmbZNOMEOk
	xwKVm/NnoU5Jh5cQpBcnNZsh2KWd1972S2UC+XBUExB1N0cJUvFy/BEsK65h3S6Qf6Ko5Xell4Kxz
	7LuiJusJZH6CJBF4H6NAZ6OM31kLdIbaGsUGYlW91ZK0HtiqFyKON14PF8iU+bnwIQBnw7sPZBiP7
	oV9vKAzl/aLB+MCV/TGBA3MPwbME9RB9PdAdxK+Yc+dvJUVZKWgnGmZH03JAF5JmkoCENG2XRkQey
	i3uVIBruAt5nNs0nmXMe3bkMLiKQJev2rjxlRZi1fdzk3fDqCJi15byrhUwCtbUBELCBOXOWrxZ1p
	VkqmofXw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	diederik@cknow-tech.com,
	arseney300@gmail.com,
	michael.riesch@collabora.com,
	shawn.lin@rock-chips.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add cpu-idle-states for RK356x
Date: Sun, 22 Nov 2026 23:50:27 +0100
Message-ID: <179538782484.3150822.3368192161153782434.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102173944.312295-1-macroalpha82@gmail.com>
References: <20261102173944.312295-1-macroalpha82@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Nov 2026 11:39:44 -0600, Chris Morgan wrote:
> Add cpu-idle-states for the rk356x-base to affect all rk3566 and
> rk3568 devices. With the fix implemented by upstream Arm Trusted
> Firmware [1] this now works on both mainline A-TF and the vendor
> provided binary A-TF.
> 
> Tests on my devices show this parameter provides idle power saving
> of around 5-10%.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add cpu-idle-states for RK356x
      commit: f38c22652ec64441d4ddfb189697fe0e4ef8f293

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
