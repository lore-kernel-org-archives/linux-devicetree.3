Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4723AFCF8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203217; cv=none; b=KwXqsoQLtZJhzBGQXF+vbSMkNMPZybbj9taEYdaS0D/gHKNtTwnuzPAlez7XfatTRmxvUiIC73pBVjOLjZoGQdb2WsXmsWRHNuQ8ltTi3awFB4dtpvWhjLJc9+5hqNWPEjTq+09rj5GldlydFB8jq0FA6oiHxK2oUV7rkKepCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203217; c=relaxed/simple;
	bh=88dpeoaTNyDK3/W4Katvy3gtZObwc78AAVHwpvzc0iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyGB5/dYORm1/QvbTyDfGAuPdLgOlMG6H35nMckxmQcJTS8O5un3WY1pfIvNw1nhVQMqgEY1MfrPEXJ6nqcz73B+q6ix9vSW8NU6+i3v7bm37+NDDMp5UlJFqlSfaTs52y1Tdp0S893YunHtJafntcTUx1pHR1dR6ziAjdNLcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1wPM1q-000102-50; Tue, 19 May 2026 17:06:42 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wPM1p-000mTk-1G;
	Tue, 19 May 2026 17:06:41 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wPM1p-0000000HKzJ-3WNo;
	Tue, 19 May 2026 17:06:41 +0200
Date: Tue, 19 May 2026 17:06:41 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Robert Marko <robert.marko@sartura.hr>
Cc: kory.maincent@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH net-next v2 2/2] net: pse-pd: pd692x0: support disabling
 disable ports GPIO
Message-ID: <agx8gdARr3IrBa-Y@pengutronix.de>
References: <20260515115050.691119-1-robimarko@gmail.com>
 <20260515115050.691119-2-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515115050.691119-2-robimarko@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

On Fri, May 15, 2026 at 01:50:01PM +0200, Robert Marko wrote:
> From: Robert Marko <robert.marko@sartura.hr>
> 
> Microchip PSE controllers have a dedicated disable ports input that like it
> name says disables PoE on all ports.
> 
> So lets support parsing that GPIO and using the GPIO flags to set it to
> output high by default and enable PoE on all ports during probe.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
