Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD883603D3
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411349; cv=none; b=k/YPq9kypof5JPq7n/nJwMKvO+nnC/3waANSQ62CrtFWKhbd+ySTtP6EJeXhq3dsnP5QpKFdKYHg86RTKagAICcJ6Rp2y5/Fq6GOV5ALnpcqKJ0E5/kh91MXpG055OWo6rHteUM9arQQYeZL0Zj6iNJvssnOP7iqW2KbtDHIJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411349; c=relaxed/simple;
	bh=DZ2kdbVbYg1pkCIntf+4CYQabG4gloV37Aw1qUTBU/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ku/5zRpJFD+rVmUFcPsHXjQ5377lQIhe8HzdEX+9Lt8i/GM94RrzAfbrF5wSrpZWRGG3FrCeNTMOjBvH6yK9FKk5+iPAhmmMKvhKRJxZV6vCynbAifCDNNR+mQG15RTaa5N+rTVPHsHi6iOS45BL3xQiy99Qj+zedt9N17RIsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLvBW5Xs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLvBW5Xs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1371441f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411347; x=1793016147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXjXKm6gt0TwYUecPdJSnTOm2s6L4h99iDdc56AsF8Q=;
        b=TLvBW5Xs4IKC5mKW6dHnUlt5Ce7Z1M1rVv28tj+Trdzf+jq31ChqnkBeFvA1Le+9Nz
         V9otsN4oy5COrdffcE7x+zgYS0auqIktA9CS/eeCQ0x5n6QUnqdcmROyKeXul/E9Kqzq
         q6FQdLd675orwpTFZoKv5wndYWHD8QtaqzWRMOfVWLsUF+R5vYUAMY6M/EvqgU0tdfd5
         9hWsirQZ4WmqZy0idda96ApymLTOn0R7IyZZUevcO7d2ROeKMQ3wsQWvbi3rvf6C/fyF
         R/YVzYH3lqgcI1Y9DdhDV3mTQ9MlobKfbOH+l9aDyiJrviVX5G6BVp/ygBPol4dos7js
         UzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411347; x=1793016147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXjXKm6gt0TwYUecPdJSnTOm2s6L4h99iDdc56AsF8Q=;
        b=u2H66so/3PUTxeYsqHXH3EooLlnlQ1yQs113UIE9kQpkN+w3EkmT94JVrbIJtOi90B
         9QcJ+6rj2Oh3cbahRSgwwZ12ACjtwZy5GYlTiScihQ5XWRghr8MNISXWrOMun6DQySNU
         +sBu5pO+98+I2p2EFAl8rG1DldPEU6cACJCBxgcLbMMxE/10H5W1kcwcMmIfwqLj9cbd
         GJ+MO/8+Be3ii8RenoGe1tgaEHN8Q8YM/RepuP3KxXOkKIKU4VhnEEZsPO0CyM/7cR47
         JG5jWWFcUogNwbl02x/LS8cZ/QlOt8pmkhxQrUoLR4vtmvO/tBrvb3Yvi8lfG1KO8d2v
         ZuvQ==
X-Forwarded-Encrypted: i=1; AKwUvByGCx1daJd3KwzbFY+g/Rb67tVRW6QkSIZRCHPAud8YlAn+4phwRDh4nUf7vhA+5B/WhFnok+tAIzMV@vger.kernel.org
X-Gm-Message-State: AFq9FYIrfcYvltxcq7j//jmYLv65stHMHwdyR7n56jZrWEJMPHW3EDJp
	sGCnExTAxm2hTFtKnn7ARaQ1Fal89ECOTGAJSxhfvqa6U1h+3Rs4UYKc
X-Gm-Gg: AYBFou1LtKfp1pRhb3URqkxb7xsusB7Iavrz0mEf1RnUKPPX+ha6roLo4gF0wlxR1cI
	W9mPvqL9HDrj5tK71PaBXocDMkrEyczN4EsxInqJUKkBbYM168srh8cuvtKufds84/0QrWcZqgq
	bpsy14G03OpwGIWPUQv8LJxRLUn7yp8Pi+97nDC3uDSfHoWOswAmg2w/kyZ16EeWv8ggMsdu0ew
	DLop3Hjbp9ReUcLsRdu9nsUCcpG/TSs+HSxcVEjHpF2/gomItJSlMm9+s458JsODKlW8R9bv2jJ
	BThAWeFCK6lka3dJ215i1HrhfO0E0LBkVV/rWyOW3d2FdC/mJurBWIK+HGieWBippJ1mXli2bm/
	knjs7qUNu0R3RjOZ90duKgRp3mlY0l6tDRM0wMDefCvcqAhXc2Frk2tIs2ry5uG2azVuSMx+sR4
	kmfzqtJSb28B7g4LP1RAqW2SRIQzlPW4UpxZaAKz7WTRgVWrKgxvEq7NJjeO1fU7qyL7pmaXSYg
	dnzPBlxmjdTSdBT4A5aUGgkSWJhkblTWs6z5J6lGmWVbZpc1ykUkQg=
X-Received: by 2002:a05:6000:24ca:b0:48e:b32:9d1c with SMTP id ffacd0b85a97d-48e0b329f47mr14655865f8f.19.1792411346320;
        Mon, 19 Oct 2026 05:02:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdc4eecasm22400720f8f.13.2026.10.19.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:02:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/G3S has no Classical CAN mode
Date: Mon, 19 Oct 2026 13:02:13 +0100
Message-ID: <20261019120220.166163-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
References: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The description of the property that selects Classical CAN mode implies
that every supported SoC can operate in that mode. This is not true for
RZ/G3S, whose CAN-FD controller supports only CAN-FD mode.

Update the description to say that Classical CAN mode is not available on
RZ/G3S, so the property is not mistakenly used for that SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 .../devicetree/bindings/net/can/renesas,rcar-canfd.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 1a7a9ce45e97..7d3330f8fc1a 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -146,8 +146,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
       The controller can operate in either CAN-FD mode (default) or FD-Only
-      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode. Specify this
-      property to put the controller in Classical CAN mode.
+      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode(except RZ/G3S}.
+      Specify this property to put the controller in Classical CAN mode.
 
   renesas,fd-only:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.43.0

