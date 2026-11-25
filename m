Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602843;
	b=jFTFMpo0z5RfyRgDKDn9K7GcdSDc3p9K0JxZ36VkMY17EdDJurfYyzojTbNCu5xw9Hde
	 Sq1Ye2VtjIwtPJegTgPL3SlEs8EEA4nhG/yfwMG5CvxRESbQYiQEviJXZKCypwgYA+6V7
	 r5fqtwtCCsQ03HUjRVXiy8mescdCKLshIIVbURlcgG4LI9WtRA82OEVA85J0t+pM+2QXq
	 dQQkdVQRmp0Bi/wotDTSyhbGsihH3SE07LLD8Dl0mRSQq9KNNSJJGRyT88KN0BKWDfvQt
	 y5ZZt0Y0XZANGRSFEqUTqxmtTWCBNBqnqNJIskxG+/Nu9wZmirW8ou7gS7cnoudGFJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=BS1rCa3FI650n77A5Y3/Sdio8Hg1/CTebUHGnxXpia4=;
	b=tcR7wxiqrAFDtXirB+OHcywhzeh2/2oQZoTIB3EPCnS9OAPdGBciNEd/kCF7zhDwKmZF
	 IurvPK6UoUiO+I6PTjdXLXGsopRwL+iXaMdxu68T2RuNqtCHlJWsIovvt0PBPHwhF3wBS
	 OSCTG/xjE7tbSkdUignUqevlDnuMigsXWxhBan1CEv+D1djzZOrLrirAz6e8FjEDaTOe3
	 uqNd0PP+HeukyVBOZjcR3Chq4VU484UQex9vTsRNjNDoc5yro8aDKCOJ/4Z+3UcGKyOIC
	 S1yDgU/a+YU95EnSer+oSr2v5dxy4ykLJMSitOzhVkkxAKRG533+iuUAh9gln/Pt4RA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PTyokNU0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC51606A326;
	Wed, 25 Nov 2026 10:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC51606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PTyokNU0
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2C9D220227C;
	Wed, 25 Nov 2026 11:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS1rCa3FI650n77A5Y3/Sdio8Hg1/CTebUHGnxXpia4=;
	b=PTyokNU0llg1CszqXt8VLb1B6/8QDW2HBgk4IdPM7/WQoLiLlH5l/BNqyzXqgQPOvfDGJ7
	9N0I1g96sij13fR+CXQdQnsw0w7QrkazZRWQkgHSJzeZDKbKr+LoRT45cECnIVmePGRMRZ
	T5ZutBhQoZs9vrp/cXZ0Q3lFawFSfgE8MSxNGbprADXoBLqmNRGr+16BPOeiIuz7h9sbRi
	rDxpUNJuZzHrMzIWjISZWdCMfDPPNbQ+xqsIYk8hEG8vDuL2qtPeVLo5c2SeY7+kbfLLac
	7bY0U86drRKAZqcPOWYI6jUkokSLix9FsPfb4XkGgdKupce/kele86iNWz34hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS1rCa3FI650n77A5Y3/Sdio8Hg1/CTebUHGnxXpia4=;
	b=GXuVkTas6W7Bz9KuwRZXJpPAiCqHdIMMiN3cKVqaXFGhpSEBbMx/lWOBmG6Qf1uMfLL7Ke
	G2P8rSyQr4uvwvB8q3+2gaaPlQI2LmDbmV1JaFFGfFkXUy6WVNM+Hj6vbKqG1F3iG0/oSR
	XOK9bTBQzUPQ+QIKdHDJ7pQ0TW7T4xGiA5SyhtMN43pP9/sTMySAvrgUavyGUwAAQkKLBK
	nd3oaFeY/SBKo2ygf8jo2myM32wyuLgamg74u/3XqsWqPPqR6TSxQh1ffFpO930BXR7sle
	G5xOe4AguiNw3/b4IckS0O74Jmch6qxVNlVAkttuX5dOrihendX4sZP2UJochQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795602840; a=rsa-sha256;
	cv=none;
	b=AnLnKIUGcXcrbINj/Z3FWQyWASwcb8iole7MsP3zRFDRPLRvexyz2LstvvN16ueTSbyUf9
	LCAoqaKG3y1WS/313I38TAMu+A5GIrZRf+awqXU50iaoATlLRc4FZPsFAXEnWaqN6cyitz
	/kdDcvAhdjJ79ozC+RfUNNvPsW6MnpOxzGYQ/93ES4gydUOlBY5vGgeEhOW7HEqdfJ5rQ+
	oF3fVULmuz5lt+GZoI/im3w/ezU2vrQNnh9aWMvYl+fxlRUsmfsIYHhc3IayOPv8dOqJoT
	rmIjSx8sDCeKC5EI/dyYHb53sUiJAydj8LFxCrOAqxzzMK+V+Up4d3s7nwyKRA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xWAK7-001P9N-1s;
	Wed, 25 Nov 2026 11:34:00 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Wed, 25 Nov 2026 11:33:57 +0100
Subject: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
In-Reply-To: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Midgy Balon <midgy971@gmail.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

A Rockchip power domain can have a supply that is required when
powering on the domain but is not required to initialize the power
controller.

Allow post-init-providers on power-domain child nodes to describe
such dependencies.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 Documentation/devicetree/bindings/power/rockchip,power-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index b41db576f95de..d2b512dd95f63 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -147,6 +147,9 @@ $defs:
           A number of phandles to qos blocks which need to be saved and restored
           while power domain switches state.
 
+      post-init-providers:
+        $ref: /schemas/post-init-providers.yaml#/properties/post-init-providers
+
       "#power-domain-cells":
         enum: [0, 1]
         description:

-- 
2.56.0

