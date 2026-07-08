Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91725B663
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489557; cv=none; b=gljTNiEdhGLA+1U5Doj7OB40aN6OxAUZ9rKu47qJWPGvic9ehZHZdJQEN7xqfBOFl/OB/hPD/N/CwrlsTnx/f7/8Zf80PDVsOrLZIgNCOP7TfIp/yVDKKLFE1YbOVWXk7EgFUo7N0HS7mWGIAK1Ae5b+DfCdf1aa4KBNKP3ltuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489557; c=relaxed/simple;
	bh=/A7XikACXkUANpzgW9qCIpivmXAOutxxtRJHVZyMris=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lWOV9Jz31cYDE9RkY+gCj3daa0fqqOuri0NebpQgTUasduL9PMijKWAYQ05MxtuCz3SM9k1WpaZi0vELPKSkRr2zb9zpJG/2BsMQ0dIcAuqODlNcrfJvs+PYrdbg8WLRYF3SmoYuyhR1QOtfu/wTioZsbPysP4YwY3ywAASbxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1whL6M-0003gK-H7; Wed, 08 Jul 2026 07:45:42 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Frank Li <Frank.Li@nxp.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mp-skov: support new 7inch panel
 board
In-Reply-To: <akupDXc1QA4uKfR6@shlinux89> (Peng Fan's message of "Mon, 6 Jul
	2026 21:09:33 +0800")
References: <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de>
	<20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-3-dfc0c8827c02@pengutronix.de>
	<akupDXc1QA4uKfR6@shlinux89>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Wed, 08 Jul 2026 07:45:41 +0200
Message-ID: <87se5ukpa2.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org


Hi,

On 2026-07-06 at 21:09 +08, Peng Fan <peng.fan@oss.nxp.com> wrote:

> On Mon, Jul 06, 2026 at 09:17:57AM +0200, Steffen Trumtrar wrote:
> >This board is similar to the already upstream
> >imx8mp-skov-revc-tian-g07017.dts but uses a different 7" panel with a
> >different touch controller.
> >
> >Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> >---
> > arch/arm64/boot/dts/freescale/Makefile             |  1 +
> > .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
> 
> Sorry to jump in at v4.
> 
> Compared with imx8mp-skov-revc-tian-g07017.dts, the differences are mainly
> in panel and touch.
> 
> Have ever considered using overlay?
>

no, I actually didn't. This way it is easier to decide in the bootloader which board I'm on. I could definitely do it, if this is the way to go, but would add some overhead on my side. I don't see that many overlays in arm/dts/nxp/imx. 


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
