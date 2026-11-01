Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521473;
	b=mit/34icqS9gSYleV7CPf2el3elY+d7cvVTWdtdOCPMoY9w/J0fs705Kml9LMJAwpV+4
	 3sgKCFXTj9hKmVropAEaloAjHuQy860RdU2POieEs7F2zKf5jrgUUJVTcPld3dl6KcA54
	 Mi0iTR8EgBsIMOpOca99HjnNN9L/IB1+DrGqMSuXnmJQD9j8/ohmrH5Prurg4Pf01nxk0
	 hXBlQXNM3sSAY3t1RJdhRbeVkGXxj/Qe5rF7F7Rr9IEC1aMpg2r9MWtA347janYFjCfxP
	 Jdh5EFEAP6++EZTivLO6m2BcwICGVpu77rb+W/MZy9IvWiKOV8wrGXFXcHbdQClx+OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521473;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Wz+fYkTCr7Okjzso8/sJigIF8iC1QkX8G79jwaGo5+4=;
	b=KOgQN9d7ikvE7witsV1XRpoK1E+m1YqfW3SSgspurg2jyiBIVQcJuqDUGg5cSO86pDcO
	 JjLcTGQruVmA3pGZkJlTmelip6bKwuvzQ8hCm1fNfnzsJAFKj+5sCYbbiwBlVBesbjNv+
	 rcXvlfm7ab8fMm7gmMvqQLUTDBlZw+VvbCkd58jesecwJivvKvqsGAqBfBCqKcaPfQQKY
	 6SviSxVera6+TVPsb9r+FxkIxtQsdnWt0L2ulhvCI9x9GmocF4qwXLSn4YsicnxwPHr5H
	 RIYpk/riVWi+7hPG5WuE+KJBwZe7UY9KVxAdiVHdrxibIH1fvJdvcr+KOuR+yCq8FSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b="hmW4mW/+";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=g0NnamYk;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B799C606A326
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B799C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=hmW4mW/+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=g0NnamYk
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2F41E140030F
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 03:24:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 01 Nov 2026 03:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793521472; x=
	1793607872; bh=Wz+fYkTCr7Okjzso8/sJigIF8iC1QkX8G79jwaGo5+4=; b=h
	mW4mW/+aPVBZ12gri7GuURka7Yb3p9Y4E44hVeEwoHCvOm2aq8DZAvueo1jOXfVk
	pMA3+Pd8FRAvn7Slg0gqEv14XuSSUi11EvMRhCq32TD//tImCQMLnMaD1OJ4vCdN
	V9H7v2ZH8jqSV9dAtJC117IfFXyDAsx4tansCzd+BA7RcCmIuYnPX+zmK6p+kRyE
	qXeux/0NB1loSvMMZMrEWZh2BaluAmibHSJyN5hgukl0Vp7AAEDbpl5ieemVfJnt
	dlYoteeiAIXdVhXpxGJ0bKevq5Krd3O3Gdth6sPwuS3Nk66qxHTjTdAUi62YAE+a
	k2gN/3n/DWhyvKzzkfXNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793521472; x=1793607872; bh=W
	z+fYkTCr7Okjzso8/sJigIF8iC1QkX8G79jwaGo5+4=; b=g0NnamYkx/KPdK/In
	PvdbCaZmjQkFTAu7PS5IxejRr7YSED+aSUS0hr03lVDc+U+AgfyWSOIKVzZpB9De
	L+EHkvVfQcfj32J9rkubcyaJJg6DaZts7ZouRy/dMpgCUL/8SMSqNCDi/RmjTi8V
	YLHo5U77xFX9XtdExOgnmEjZCcbVsHJh975/uJHaaJ6sSyPhhB30dPONfM3dULd+
	HnhMNCtIUO7I4yTMDufXmwosBmeKZw95P+bXP+cUjJYdb/lIukFIOLSGJigPtYZG
	H6trEihD3TBPMOzwQPYZn6eKhtD+B2/ZQ0StXCx5kidZcDhVSeYTGdE6FmX+ye6M
	w6ZTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793521472; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:rmLXj1dnfw8mSzHCeztOr7xdHGOHX936dEFa90ItjDUZog/
	20izcRWWSzr+a7HYdBw8e+uEoT2hb9oyDl1Ak5PK+Tj49ckHZP8fGWomlNbHo/aS
	msGr7csk3uSNw8yerEsdWpsutiqvk7sfuw9Kco7AMVuzSU6Tvu/RRNYF871i1GAI
	MK5wBFJiy1foFIqispqEb9B5XYIgX6XbxYRmuBju7qaaMjUz3Qd+PCCah0chy9gh
	X+H7YLEzncUYeskpsawIRGhN1Y/rKZFQh7APUx3xo7xbaesQYSenZLpMM1oaAZeC
	yREDWgYaOpYRkIalRtn+8RMqHn0GvqZjP3DLNZQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:AuDY1rQ3xE4m6EAZjBzoq6dlquujFZmA2PQVC4HCjLw=:TN3aTeRgXt68gG87dISQ7raaJX+eIrztSRy9WTHvnVY=;
X-ME-Sender: <xms:P_fmaitgk4_rRnpAACXTmKhb_9UVHphmEFKhntW2AwFZtkcyj6JT7Q>
    <xme:P_fmah18Oxocb3bNQ0hi8reSp79ckXKzBDIpnyrQxfE98EyazNhW1xxCRLxfMIK9l
    lK4XZaGtxUCua9IEQxLqP7DbzabC9CJhbIxkGIwS4VIfvW4uZSDeNgh>
X-ME-Received: <xmr:P_fmapVna8kk-hwAW43lPrUsxjcFIqt2XYPu2lfOyIe11pnEpnO3qLa1YcKfr-U4Y_nMzPyA>
X-ME-Proxy-Cause: dmFkZTE59zONyjwT0eThdL4FPYOz+8ja6SLa5l4V3bgwpmkkDmFkoqDTfNyo3apIgr+5zA
    +GX40G2i1WjExuIg5f5j0S/Ul0HK4oypT7/1B1/SHJWWpq2lopVq+LGYa22qMV7xnKcOP7
    nRamCIXVbfPCWyur+KyeL8Jgz3udE+CkcK/xQ7qb2IPu5P69VI4I9xemnhlkMQog0/jfKC
    oYas2+gp2OvHPeMU6mZxc/LQ5WKZoTqdbza+oPxY9QtBcecYkd+Ww+gWTbHJc2mvPlzBGk
    WhmlNlJQOs9rb90D95CuWSzhQ9o2nA9QMy/4PmQEE3kbXGgLzjYG4iahzc7VhQuu8rHVIs
    QRXj8IcUMCV6LqOsUbX8MEKLnWMZkyqK5P/8oawKO0OwXr5tFPSUQ/FZCKOqEWegYrbq0Y
    yEg4Zqtz1RhXaYrCrREFs4Wil0lSsx0c+ymoyf0Olx+xoxk6d4skSFbyTMWPUcWgkxrT6J
    aB7N56U9RV+/r0vBB+iAsp1dvOV+rFGi1kfBGaZgFnWwV1clNb6ztPS8TzkerH2vyWpZcT
    F7QhknNQlUQnb7u4Dsay7UkITB1PwwkwEj0s7vB1qvXgp+enFLULJDji7a9TwBrvgKYWLn
    60nmASarAT5aHHEn6VDz9kDb+nPe9ELb67ADMhpAR3kxQTGVkw1aFXPWsaVQ
X-ME-Proxy: <xmx:P_fmanOzxkL7WT5FwgQiOhjo-gpWXKDZDOYLo73jvsGGZOjLow3a_Q>
    <xmx:P_fmasxLEOuZuxJ541X4aClTtgLXeYvyy32_HFQjVOYG3yjrnnEYWA>
    <xmx:P_fmakhaQVQyvX_dT-jPshwCAa0G8TfaRyLuTYKui5vL1kOSZPflug>
    <xmx:P_fmarTYN0so67cnY4B7Hq-ywrSXcfiMUArZoN6YNCB70tqhX06MzA>
    <xmx:QPfmamu_M-sm0g9knLLqJjsqc-3fbwzrWju5nVSvmXUWe1f1BhLS8uy1>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 03:24:23 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v15 07/15] dt-bindings: power: rockchip: allow resets in a power domain node
Date: Sun,  1 Nov 2026 21:22:59 +1300
Message-ID: <20261101082307.151957-8-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some domains need a reset cycled once power is on. The RK3576 NPU domains
are one: without it the first access after power-on takes an async SError.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/power/rockchip,power-controller.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index b41db576f95d..83741f048716 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -136,6 +136,13 @@ $defs:
           A number of phandles to clocks that need to be enabled
           while power domain switches state.
 
+      resets:
+        maxItems: 1
+        description:
+          A phandle to a reset that needs to be cycled once the power domain has
+          been switched on, for domains whose logic does not come up in a usable
+          state by itself.
+
       domain-supply:
         description: domain regulator supply.
 
@@ -216,6 +223,7 @@ examples:
                     reg = <RK3399_PD_IEP>;
                     clocks = <&cru ACLK_IEP>,
                              <&cru HCLK_IEP>;
+                    resets = <&cru SRST_A_IEP>;
                     pm_qos = <&qos_iep>;
                     #power-domain-cells = <0>;
                 };
-- 
2.43.0

