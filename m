Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778139;
	b=Egyyqpqkq7kmxn6F3p5q5D5oMAOiz0ENtFj7FsbjsHNTNoTlWgN7GH2sMEtA929DH9QM
	 GYw4FKNXKB/iMSm8qf4g2/spgwY60Vr2MZTsWA0J9GaWB0XgR2KDJA3Gcve+Ig7BTIJlw
	 IUqNwgOLs3d+au4vKeU0g8JsdLKbnU/BW4vjQZqp8uep332I79nEOqgomCfzFaMHmp2Hi
	 0hG0HcvUXQ7bcxXuSx3/V3hhcvxrSTgcz0iGPpYaetq/3JuVsQxEcmxJ9JJQsstv3tSqr
	 rTwvbLtwP+qqNJPL0Mxz2ocPGCA+o99tp39bIaNY2TFpcIQMq4ofWpvp6B4SCGmFU2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
	b=SXKW5f5ecFILrTtJgDLhjl5g3vaRdxnfzNGzJrdB+t4wPN9HLHc474ACdauTX2V/tP4x
	 IPfa4idI1n3hIKIecT2PFGKuI0T1ICBes4ykFosAkRqGWhkb1bsUEl2rQ8H31LgRlmBR9
	 h883eQDqQqUsrutNPBLK6GGtaHdoYplzMHA+O++HYLyFTz1mxRlR992OY77RNfzhKy1yi
	 g8baiUNn6ixkITNQF5qAyOCdPb4j1Ptz4e72H4BMa8V8KBALpxU2YlSWwWU9SDldxBqmn
	 5uWJAPcg8BIVgR1+kNkpdUfPESi1IfRvH4ifesXH18bzx1uDmvab2hWu7cxx5Xizk0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOFw0+rQ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EE606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOFw0+rQ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36cedf1bd63so351102eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778138; x=1794382938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
        b=GOFw0+rQ4Ki57IB4ZW29BzoZiSL96hz+qgDdjQj/oPScTAJi6HjnRAB21NRT9r425C
         xFTZYWbk9VXMZLFutBr+ixjINLhyH8eUmPnDgjRXZEi5NmM/N21ZUhJB+gezsya3SppW
         f40oBw4DuuBXQ7h+VNBCbpqg17daldox5cbY9/+Pt5zItqHpb4bCcdRp/ZejRi/NDrV6
         +o78jxmwCzV6VS3Wpiz5z380+tdLFoyj3ipB3Ths2yn0XTFclU6/E7BXA1sN1/j+SqI+
         F/NYKZ1PW5nmiThlTwpH/cXt5B2wsfDpzxDVU1aULl4tiIoVGfBTP3SNUpB/e0nuxS1O
         VdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778138; x=1794382938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
        b=NVpvVXBoT9ozHLXQm8qdhFXjiqJXhJLGeV+WOThZ6/igCcDv9oA8WoDPmrCS8dvdaX
         W0yV4YLMHGUI36LPXv2KFKyqTt84tNv7FEdlKRmBUclNUXKOvVl6dNFDz4g/Berj6M6F
         i/4AqG7xSCroweDapwPRLyLQ+Nc/SpkolUJlqUSEpPed1O1yf0QEIwh1xom8j8PJ5Uio
         asG1Nf6zcK9w1GsBNfncxcqqACMn0N/LY+e/05Gil0qB5wLIPeeGddNUhHK8WiQJWzSY
         lwjClfDkWxjJBRb31Ao7oYMyoC1Sb1q0BGHv46HxS/zlsnNBhIWQFKPRS+tM3vUeZIfb
         K6sA==
X-Gm-Message-State: APuU4Z9a1GHr7y9hQHHE4zYJ3rfw8ZGiQ5E4/LbP4QWmZ4vWYtujoTT1
	hywPM6OC/rFCWrYHyrEqQPWHMs9+N6Vn0v+TY4thMGM/INyE8HMuEFFQ
X-Gm-Gg: AYBFou2tg7ya8Zni5soUxGYZfFmJd22eQN+KlM6whvxERqVVN/Evd45j/A2uy7GAoP1
	Utx/vFLOZRegyevzNAxLEefgBUwgVNPzXXv50ErRzDhwYOPPMdke+y3JBsKqobIgeCfiKid/sW1
	A2CNWhWIIcuTmBBLpkczSWJkquKpmraXqv/5wdKy0s5jxkE8ASkgjlgInTZDvXOiSWrkRJSqDnj
	X9c11kUN5qZ6A3XHQyOi6nm2eoUqYn8dqrDdEhLP2+2tzny8yGrXqJZJk9nhm4HSbIJAg0T0F6G
	GglS+mgj/OShStUXSUFyoIpYdsOfTQR1RRpO69ZEaZABFWdkiWDGnI+qcvFBzg6jydK++XVzngv
	Ttv+ArwD3fXFxQ5TpxwLg7n79fDIW+DeajPw3NPG54sv+1aqUWlYmc2P/40K3HzDx0XgvkkeQr5
	GP1usRC2iwPUQ4xUHxfp+GUPYEjjJQ22dlCgCpMSy38bOB9pu0uLN/+IdDGLNp2A28t83YMQw3J
	CNRTCqM6QJDnWESRlkB1Wg205Tvr2YoKeP0Phok4EE50d+DN3PNq7rlS0ViNEaECNrqQ8Jw7zsS
	U28HFSJM4ABMjM0/S/S1CXo7PFmodvnBnnOgthpPEViCOLXMM01RUQ==
X-Received: by 2002:a05:701b:4555:10b0:1b1:f02b:2317 with SMTP id a92af1059eb24-1b1f03a6afamr11492019c88.22.1793778138147;
        Tue, 03 Nov 2026 23:42:18 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:17 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: usb: ti,tusb1046: document HPD_IN override
Date: Wed,  4 Nov 2026 13:12:01 +0530
Message-ID: <20261104074202.76712-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104074202.76712-1-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
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

For boards where HPD_IN is not asserted by hardware, the TUSB1046
can force it high over I2C using the HPDIN_OVERRIDE bit in the
General register (0x0A).

Document the optional ti,hpd-in-override property to force HPD_IN
high when DisplayPort mode is selected.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..58e9fde3ca71 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,14 @@ properties:
   reg:
     maxItems: 1
 
+  ti,hpd-in-override:
+    type: boolean
+    description: |
+      Force the HPD_IN signal high through the HPDIN_OVERRIDE bit in the
+      General register while DisplayPort Alt Mode is active. This is useful
+      on boards where HPD_IN is not driven by the downstream DisplayPort
+      sink.
+
 required:
   - compatible
   - reg
@@ -39,6 +47,7 @@ examples:
 
             mode-switch;
             orientation-switch;
+            ti,hpd-in-override;
 
             port {
                 endpoint {
-- 
2.50.1 (Apple Git-155)

