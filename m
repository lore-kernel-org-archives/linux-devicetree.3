Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CC33A16AB;
	Sun, 12 Jul 2026 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783888486; cv=none; b=MUQgZrX8qmg5P+zZI0H66Cky7skKbBw8K/wnI9ntEXDNEzp4IxPt2fEADgrb/o9CrUHEKNO/TizQxriNi5AiZDbSHeKTjG/J/QYRoF+bzKs0XkKUKFxDS3cXXbgooHOXuNIkF0W3D7Bytt53DF96elMQlIzaLTPp2rq3WIleG1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783888486; c=relaxed/simple;
	bh=bnBi/J5DvZ+dW/ubf9xUSg4sRCfvky+IZTXuwMxwQ94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7J3NQak2dJt/lWaKqrsi3yR2GFFTPIcaSnqRV2wSakXohN+F3GaeB2v0I3XwsncrRANqNNtQ6/v5ltPwCmF2O3dxuajxSjEKWRnbscGhl3DdEpalx6thdw2LJcXbDhnwYdHD5iCgl/LEN3GVWCOhxLYwa75icClpz7UwnRZNms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=uewt+Db+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="uewt+Db+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RdRuHzdXq91B4Ck5zEM60mSrg0JXF70TNB6D0dYPrtY=; b=uewt+Db+AXf5pcMwAPqVJ1Fvep
	9q6dbRiHNLbISblseRryVfgqRMoXiOH9YLvwrNMGvt/fjR2sAFOuzX82Rc0GJAsx2SiUiVQ4zm8em
	o+FbSrAv5eSJl2cHYS5qWgPNj/MWnBCgezbkbg+5cT/ooUhBia2GV9s7kY9GhvbqNPKHLWd4LYLn/
	xjPeJzhtdzlt3dxcwNhQiXzy7AvmqZVFjUMIVWLIbJUju2So+Rig3coEvKAWVCJHWv+0Nc9M7Hzu9
	0SpW3Sx590zvUoyIeMxh3CRFNFnL+pbRutWBQaICE65/4aeqkKEnIxF4US3E+FsTeHQpuPB/7pfOx
	8qRq77Ow==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: yy3588: fix HDMI-RX signal detect GPIO
Date: Sun, 12 Jul 2026 22:33:58 +0200
Message-ID: <178388833969.1396294.14102109354699035035.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709-yy3588-hdmirx-d5-fix-v1-1-900a6790386c@superkali.me>
References: <20260709-yy3588-hdmirx-d5-fix-v1-1-900a6790386c@superkali.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Jul 2026 08:58:38 +0200, Daniele Briguglio wrote:
> The YY3588 declares the HDMI-RX signal detect on GPIO1_C6, but the
> receiver never sees an attached source there and cannot capture any
> input.
> 
> That value was copied from the vendor device tree and is wrong. The
> core-board schematics are not available and the SoM documentation does
> not clearly show where this signal is routed, so the correct pin was
> read from the device tree in the board's Android image: GPIO1_D5. With
> GPIO1_D5 the receiver detects a connected source and locks, and v4l2
> reports the input timing (1920x1080p60).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: yy3588: fix HDMI-RX signal detect GPIO
      commit: 3cb7054789d1babe484dcd58a921609ee5a687a2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
