Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9BF2F7F0E
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206967; cv=none; b=Mrd8JlR1cfu+MSd4tTkfbQdElfKunygpcwfvziMoPfyt/R0wGbto02lIv6Dx0RNcGIa4W/sYJITZgOVT5KYRz0QP+T+hPLne6c8HehzSc+dSSZlGLHSj2Bj2ei3tTIA27CdkDyiB+qjEAVM67MN7+lijkNxBdgnbHLED5/8ND34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206967; c=relaxed/simple;
	bh=es+rJotQRwyypM61fneWNzwmRxWIGX4iJwW6Sl/cW/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bqpj8pWA00ZuXeVvXgtMRpyuUPfTybPdvyvdl2RcUxeLmjlpA4DCSn9LONE71cIiY8GzHvdlUJBEVdinxho4MzkQct9m4ZwzTCDpVLRVixKfeFcZvaZFumTvEdg3OlZWR9HXMacu62kmH1wO10WOKxfmND6kFBSBbPphE/yaXdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqfFKjuE; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqfFKjuE"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81ed2a06b9eso28978127b3.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206965; x=1785811765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=LqfFKjuEKWr81EV6Kfj+Lm7Q5NiRWJ8N0zJe5jmXozn51MIPPUol6SvWSWOzziv9uS
         vYDktY9ECSUEi4kr9e06Inc4XXNkZrYbrZcc+oxX4QJjBeK1nRO/77r0O6Ytn8404mT4
         C8UKe49TTbBdqofrULb5MqSLr6k0KqgzJgkh2AokqFZameE8ynbc8TyzoeEg+zV5w2lT
         t0j84p6igG19PjZhwReTN6cjYYjZSKqtUBkIFSL9N9+SvA7vl5KmqT6rKvItk/TR/Vgg
         v/XAtLaQfpC+P0BWQkuToI6B59+dIMwQk+gEdYSgdxJVuyfJ3BaE0Ptu/SvrL2EIkQV2
         oVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206965; x=1785811765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=AFxPAQ07oeSctA0ojXD4u6G8sOZn+hdiwoaT3szgdpcZby6KglgJk1f3BwpBam6Ko6
         o8ZOnGHAHa2aGdyMXPHJEGJg1y0XykR+b6hsHGtAspQI+5ORbadCTFzWf907Uf3h68S5
         NUM0z7vQfR6NqC9kBK/BB3vPb/rjqodz6Dy/un4oIW5u4LwcxbEDBAzwTeVudqjwAcTh
         liaJ7hkL/5NaGj39fkrtDE2PSQGgbkA2hkbakA2C84vaXdX+sHLe3K1RhIgwtaLDsiMO
         sYZ45lql4gneIflpaLPaoDmdQEcjGhiZjtD5y0dFPlsr6rZBjoh3xdGiurB/tWdB1Tpe
         ovTw==
X-Forwarded-Encrypted: i=1; AHgh+RooIO/ujqEkaCyGDk4aobpntgDESl5MjfStFxi2YGSMJckAupJsMIIAXWoRJ9P//cfBWBSgknCEF3xI@vger.kernel.org
X-Gm-Message-State: AOJu0YwUA2iZ3xiTPejv0Ku13FDfAAvAkI13PELFPmngEXhVjX3O7Z2F
	Bc/1wILPJvcplF6bikle30DCVUqiJ8PS0CqXfZkB8kzfV2HqLqRgTWoX
X-Gm-Gg: AR+sD10IpVQeHmLgL48piF3E1sQ4c4ZeiDUwxkeLOZxmupvnxCjGPxKbwbr732Z4wmg
	gjlskThHkZsMvFCS4GYv/gISJiFkqno7OyLpUOFDMGoVazNHS/Bzr7Qx48asjW+fd+wNTxW32kZ
	gVYwFpso24UtTQ4tJ9e6bLKfy3Kv3Cyvyi2w0CKMikrijRDOb2OqYhUvKkCqHFK7772u2LyxG2r
	hLOgA8/R9TGpWo/2c9eoPd1rmZyvH+9OXG3RiQ22/yovN2W6qJimuVHCUV476Xcorn5s61Tnl5H
	kQ4yl3ILRRvg1P10dN7b5AcCc7qim3B9skY1kysKIbgtag+/J35k7w4IfUGPDVDyvcZ6ZkYWkbH
	joqmEeBoWLZtL/3r8TZAsagsNZqRk0bumJ0jtG0Y4Nu+ng8FDiCFVSpR19tcUnAgRkX7CMcyeSH
	q6e8UuUq9Ks/2Z/jEJi9EghxYe56IEnzxE+LW7
X-Received: by 2002:a05:690c:4d84:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81f99368d13mr1674717b3.35.1785206964798;
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v4 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Mon, 27 Jul 2026 22:49:15 -0400
Message-ID: <20260728024916.993224-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96Q Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

