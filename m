Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5CE425CC6;
	Thu, 30 Jul 2026 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412621; cv=none; b=jkY9l1k2yjK7ntQA5xHO1N8cMnA5X8StoKo1keLN8VkBKRP+03SNzk1b+zeGbLFD34VvDEDMKTdyUpFjhvET/HGqO1CBcbATEIZanZmWCbRrW4zSUPktHDY4Szd3CBKvMbPWov8EcikAizPhWm0raQ6lkwdMTFJ86hNxaczFhVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412621; c=relaxed/simple;
	bh=OqMjMUqq8wsocpLCOauc9Zcb03/6vLXHup9gjfs34dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jnd7zYi3Z6sapN8qorw5qO3ps01oQMfUvH4xVpWtUiaXLvw9B9oiPII47bZsfrZ4+mD9lN8YTHNfN1aQfaMOFs97BLR1xySkPcgDdVKxDk2uC1pL/7FlMTxFKQHRCeatlIf3RtgP5hHw20Vm81Lm9ufRPRk67AvQAGcWzTTYaYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=IJ9KA5ka; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="IJ9KA5ka"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uoqq1t7wo5rd6IE4QW2AeY1PA9dd7LzEhkBVOmAfXAQ=; b=IJ9KA5kaKVbh9kAGoIuAs0737n
	9KwbWbh80SbvMTcZZeuiWrY0drRB52Sgl//jlu2Sq+NI5ELjBO21p78aAq+1Pr58IU/KB8Q6eOtFj
	yxp2ra/AEeBbAiPZBvSb2KdgPQN5fSN26n08OXX+KjgKyLb0cG/YJqxuSyBCCBWrYRhBrrqwJJLEA
	deYS0ROJtc6Yma+esHRqKQUuV2qbTQgATAUCFgM94YQJik1RQjeu3LtA9HexaCd3xfkyl9myj0WtQ
	9ggGAkSFC8czPcuutPi0cb9P1Tn//427Bip3RojIlPsQwJxR58QPCRsXmlFK3dklWgzegwMUiHbTy
	WTCwYcUA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v10 00/11] Add eDP support for RK3576
Date: Thu, 30 Jul 2026 13:56:17 +0200
Message-ID: <2154821.UkFFEUeh36@diego>
In-Reply-To: <20260601065100.1103873-1-damon.ding@rock-chips.com>
References: <20260601065100.1103873-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 1. Juni 2026, 08:50:49 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Damon Ding:
> Patch 1-5 are to add missing clock "hclk" for RK3588 eDP nodes.
> Patch 6 is to use automatic cleanup to fix OF node reference leak
>         reported by Sashiko.
> Patch 7-8 are to add the RK3576 eDP node.
> Patch 9-11 are to support the RK3576 Analogix DP controller.

Not sure what happened, but I don't see an applied mail about the DTS
patches (3+4+8) in my own mail archive, nor on lore.

Nevertheless I did apply them to my dts64 branch [0]  on july the 24th as
[03/11] ede2ee37f0a445cacbf24760f53befa10f64994a
[04/11] 09820811c549ee2c408defe36b210b13c7a85fcf
[08/11] a41687b89005f50909e59130a4c0b08e82996739


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/log/?h=3Dv7.3-armsoc/dts64


