Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06D949E153
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860646; cv=none; b=uy4/pOpVjeqD/cEpwT3W0Gq8rzWm+CmYt1cnpA7tfLFAK/i38EhyotHHX9tE5cT7mTdW1lJZ4OBGRSBZcQHN6VLJltHVBBzaqAuOUDmbQX9lSG/Oinp5W4urEY7BFLhafpxdGrQhgEJgVjBlh2zZpVRH0+zrAVKnLMDRLMGyxgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860646; c=relaxed/simple;
	bh=JSLR3a12wP2yWPzCkWpDLbHhvC5txc9Bj5ET4Yy20ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CXaE/rfF4PR2MNz1TQ9PnfQCynp849wXFqL6cRSU9EBISu1/lqmqwuiX4Zt9SSMYoR2CmwOiQ6XX9Bp26EFOhejiY0BA2YjX5J5SB7ZdoONvjqWgLDbJ556llYT5pBhnu8cir109ERFzKe+BBY+46GErGMVIgU4oDGDu9hNnnmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=otoEIY0D; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="otoEIY0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=gGgCN/UyYep39hXBcQSCcp4ph3CLbo3ezOswYP7AJS0=;
	b=otoEIY0DN0sd7suy6dNZvYK2DQydOhChQaeoy//zBMzEbGaWTPKa+FzYBfLsIu
	OGNA5b8VC+bUBQ5nIMJMfx5mbH6jC/VLkVxUAVvznsPTY2XyhmN+ZA/c65W37tkm
	Q8z7LFnxHNDVYycYm+6KVTDhLzTogD1QcdqBFpvIodAq8=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Thu, 01 Oct 2026 21:17:01 +0800
Message-ID: <179086062104.25951.4172888328376175948@163.com>
In-Reply-To: <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com> <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDXvzxNXb5q1QFnBw--.45058S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr45JF45GF4fJryDuFy7GFg_yoW8Cr1fp3
	yfXrZ7Gr4DKrW8Za97t3ykAryxZ395tF45WFyjqrW3Cwn8WF1ftrnIkw1Yk347Arsaq34Y
	gFWY9FWSkFs5ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR3ku3UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+Q20Imq+XU2mUAAA3Q

Hello Andrew,

Following up on the phy-mode point, with the measurements I promised.

I ran three 15-minute runs at full rate in both directions on this board
(rk_gmac-dwmac + YT8531 PHY, iperf3, 900 s per direction), rebooting
between runs so each configuration was fresh:

  mode          tx_delay   rx_delay   board->host    host->board   retrans
  rgmii-rxid    0x2f       0x00       922 Mbit/s     939 Mbit/s    0
  rgmii         0x2f       0x00       922 Mbit/s     939 Mbit/s    0
  rgmii-id      0x00       0x00       918 Mbit/s     939 Mbit/s    224

The MAC error counters (rx/tx errors and drops) stayed at zero in all
three runs, and the link came up at 1000 Mb/s Full duplex every time.

So plain "rgmii" with the delay added on the MAC side behaves exactly
like the rxid form, and the "rgmii-id" run - where both sides add the
delay - is the only one that shows retransmissions. That matches your
point that only one side should add the delay. I have changed 2/2 to
phy-mode = "rgmii" and dropped the rxid form: the RGMII traces on this
board are ordinary length, so nothing in the PCB asks for an extra RX
delay.

While reworking it I also addressed the two things sashiko raised: the
enable-active-high property is now present, and the codec node no longer
carries a clock-names property, which everest,es8328.yaml does not allow.
The codec compatible list is "everest,es8388", "everest,es8328", as that
binding documents, and dtbs_check is clean for the node.

I also removed a stray phy-supply from u2phy0_otg, the USB 2.0 PHY of the
USB-C OTG port.  That rail is the Type-C VBUS and belongs to the TCPC;
with the PHY holding it enabled as well, VBUS was powered from boot and
the port never finished a source attach, so DisplayPort altmode never
came up.  The full change list is in the v3 cover letter.

Thanks again for the careful review - the phy-mode explanation in
particular was worth the rework.

BG9OXA

