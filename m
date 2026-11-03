Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732139;
	b=2zrYuggaVPfj8ZcdZmVWdlbUcPkYlIwRU2eO7l/9PtcPU/f0H6WCzbgdeXxkBE6e/43E
	 a74mZSj4bmtIbgVMbtgqNc18jQ4Qmkuyg519CiJsQFI8BD8qm+gBt3Pgw8ky00ik9/Lrc
	 7MpeKeJqWlAMUn1czEpYbJxKYBJJnuQK4iYdxlhqEP5Bb9FvszoWYMtc9ek9D01jaLzc0
	 3oj8cnTYQqm7Cl9TyFBEkC6J5HqoGml3J0UM8wqfwIDidoBueXSRcEgOv9kkhgLchOpif
	 yAFjqz9WcDqFdViuQcRFZdE7l9YyN/SzHxIuldR8yNR3PoBfj2kGZmLXgR2if/nwdNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
	b=XXI3+6jncwEv6A1KuCgvvp0VaFM99cb4DZud5s9qi8049PeBren/jk27YeY6ZolQzQrK
	 wbmDkXY4JmmnY4zMNz5nBGazU9s9UT/q8jeuhDgKAZEsodH+6nuzRinjbA9vKu9zn5sY6
	 69Bs4Kyn9Vlcp5HaFnRQx5ZJ9Xm9prpQhT9R7Wrqb7RmkP0/6Knb9aE3zcIDWGLppS4kJ
	 0GZDgEhEhlSFRlbs8LRMonYOwFlvac8kXJIPf/gt2TC2cVB3DdiyBqxCR9oaJEc2xN9mJ
	 FwO8ib8MqxGQnMF7Vuh+r+5wYSPTIX8ZDmXCXXwvMX49/sueTl9EBHylHCSn7G1Ueng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL+GuAYI;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F2606A335
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 18:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36F2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL+GuAYI
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8871ada1a26so35533327b3.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732138; x=1794336938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
        b=gL+GuAYIepInqX92HWra2fb9t08+90isckYecQT6yo1uEo15tsVrZh0+ICN8Lio5hJ
         CwT/RtInFpxA+cCjl3F9iy+BfLLM1b79CIjYUNkzM2OYH60a5hSUzcqtCu8bvqvcQQHj
         y37iXrrMClocjSOGEzTWcoUBVV7UhqOx1Vxato2xA3jcjsM+PnCxd8NBc3mOz33JSKWE
         ooErB0z2mGIOELMhbbIhdlmCDTn3x7Nu1+R57Vy5LzGqe/VxnRCTVq4pX8GuWBmGwUt8
         12veGUHUKjcJAw/Z6KB/272Sbj/18VzPe1gJbWOdIwSpCV2s74UZjY7SHzA7NjUYdPIQ
         YlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732138; x=1794336938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
        b=ra8xgH4i3+1fd4PGBS7zyRNyITNvXSbqOZ92ZPkgh0Adf2LnH9haiaP2aOwtNvx/Ds
         CoYjHVhNXfKmdPxYYiTNTzbJVS2fEnsXIanq0ZhpZ6oVXJoKnzk7G3cfEyq0/uDTKDE4
         E9WFTck4kWy8HYSDqOPCxXZaqZ8jh9leOP1rleCcAC2qASMU0SOF4moECRp5SJMtAAQQ
         iRsh4uj1lfHNsO097yIAOYkMdq27KGay4mh9uueTgq0ijasvRN/WRCzVsDcIDntEmOE/
         MCz7BabF2cnJDQZbbPV0+g5aCpeBtLGRKSQzmKDnamDI3fCZB16/92BYJi1vMicxczJr
         P7Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxU0iUCDVZ2Wsyi2tsOQTJa35SUhd8q/BeSM1NdEMbbL/q/b37dvslCwamcpqSDEJ2TE1YpX8toJLZd@vger.kernel.org
X-Gm-Message-State: APuU4Z82btssi0AMwLoyXLUL4yxVmg6sMU+y9tP6NLsA3VReMAlp/Gzp
	+L5kNg/w3QOQ/rAMCpGdnRRlZ9Ko4yvnH5spm7auFvEuElMHfkQ4I/YX
X-Gm-Gg: AYBFou3L28dV4khRkQWqiZish1hcZTDt+pbMCGjRpsL8nN1F+FtlSMOa4R3BN2pMqLI
	UqmB3+0CJzp1XCR3EutM1uDWAUq3vro6b13DNCbOnt7BRldHc5SEyPO0ZEDM3jPdPb9mqIAVqpW
	1Du0dTQRCaF8PDgEMuuNclR0FJNcfzn5qX35nrhLlvMBfESVUbCzJPj2il9LyHEdN8bX6GLwgYV
	Scubv8WBG5O4hoRrd/D0/ZMOqZIb0EIowGjftybXT8An0D8hQWhJNiZdtT93MagnOZ5K1KegEau
	BpezTXqWEY8gr9nDwTgiCpAABzBtX19MdG8DsBsb56n3vQphwaQh1W+f3WyWjSbv75JO+DLDmK2
	eG6USx0SGN79yvwcuC6k8Vrj98yMReOgDAc7IbC2e2/ClNCVzQnVKKx1IxFPL9Q1i+xp+FFYriY
	kU/AEoGojfPhhq9aE2FwX6XTFsI+y9mXxWCqwgakpzXubBO1k0kvsVfnr6a15hjgSn3KybPKEQy
	SHGKcNxLsWCdMmoWhq1A+ocG+YsfZAPu7VT3rhZo/Y9Z/Ihr4q+Tu2iVaMYQlcOmJBdYpPGeyBW
	Quwp+y4CLged1hRMNUt6Yar3EVYEPAHdv4imLYutz815ueJnNT2qXnQLwcwmPrdcOg28K0n5
X-Received: by 2002:a05:690c:7008:b0:8b0:fb9b:8d0 with SMTP id 00721157ae682-8b2b673ca09mr70118887b3.50.1793732137456;
        Tue, 03 Nov 2026 10:55:37 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:37 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 2/2] usb: misc: usb251xb: configure battery charging from DT
Date: Tue,  3 Nov 2026 15:55:14 -0300
Message-ID: <20261103185514.72144-3-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Parse the battery-charging-enable port list from the device tree and set the corresponding bits in the hub configuration register.

Keep charging disabled by default when the property is omitted.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 drivers/usb/misc/usb251xb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index fb0693742f018..166eb541ef161 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -577,6 +577,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 			      (wchar_t *)hub->serial,
 			      USB251XB_STRING_BUFSIZE);
 
+	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
+	usb251xb_get_ports_field(hub, "battery-charging-enable", data->port_cnt,
+				 true, &hub->bat_charge_en);
+
 	/*
 	 * The datasheet documents the register as 'Port Swap' but in real the
 	 * register controls the USB DP/DM signal swapping for each port.
@@ -588,7 +592,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
-	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
 	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
-- 
2.43.0

