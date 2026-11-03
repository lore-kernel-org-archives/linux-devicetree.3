Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736147;
	b=MVKh9Olz2UtuROcC/+/LUaacp11rXA1kUdK336tj47EWyBn0s3mxN4/uWiyjkDDHJ9MO
	 4xr/Vif1EmKZ7H36PhoytTbgdKvBskQlEC44560whIT/pt9ociZoqfJekQTCIaFrRhijr
	 GghBA7DyvsODfxsB3QmK0IFjljkKj/h3czXLk85x/mLwbXJoEeuH5mccBAuFz1aBAUIfr
	 P1XsINoLXu4fByowfC+O+7b6emLKpVfjlNcROP4F/7mZEsxxEyglzvUu3fkEsAGP+xkD3
	 pR7nuBbAhOcyK2S8J7cRccav7bkuVeEisM8ijQdIjJRx9iDFOtUlGjbQCStnJz9sEHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
	b=fPya34CHDDPOrEqVOHr3q3HiziEj6RNr7y6HV3k3avVfhKT7E273V7NaeSx+AqmoiGFS
	 DeEoDjDEqtnK8kwhJMFCNTRLNpkIHT9P1jRDB1/jhqhnl7u9/CTikRlXDAem4cNL3Gctz
	 cwy3EP7fdNICWBjd5tgXSDHJdms6uP3suq6Z7KskxH696AssdQNjZ/3PcfTl3+pz3NKOF
	 SYJ9vH+/yFSNUAMM9y/x56E30T7Zwe64IaJVCgCuy5FLvC0CEagEjKnq8eNjU45ZUMasl
	 0h3ufQuXyh9+Ihs3pPZajNiBPHvPZt/GnCCX/8oi0/mQp4JVx36KCOHanVMkTEugsEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVJFz33B;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7E606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E7E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVJFz33B
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679e86015e2so1148473d50.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736146; x=1794340946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
        b=zVJFz33BYukwDtJ3P38GS1DS4+LdpERXGKjw+EvKBOas2winKm0bZ8gqnCapcybj5V
         r00jOnyQNDBP+C1F9MWn2iKuU+Xb0CGBUFcQeASuUWol+l9ZG+hDd9zKYbarerRNrfT7
         iHYQ1PdcaabzU5C4gwRP7XRoE6kSNeLkN7Z2ODypnTX+DakfiFARjANeuH7H6uKfIrlq
         vnv9pGPatj9YmIbOxKTNDiYl6OqRJLic0CGn7p7hweysxd79aMlftrKADB1/vN5bTNn7
         EPj3T3q+w9A6oRPIKvuruE//AKaVriK90di6YqiJJnLV45r9sZkH6i1EnMj7WrcJp7Z0
         3y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736146; x=1794340946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
        b=TZhuE94q3MVqz/gG+I598AmDcAX+N3PhYc6VXHRedMqcI0Rsl6T/kt3x7Qgw7aymX+
         6fTL+1G5aUnD5Cep8vb8W6I8Eod6TnEX3TUUhB762ZpvawqjZQNBHsIMQhARetUMxKDK
         4C9Jjo0hfcrKEXWGxNNW1lnxVF+7JJr+6ZVH19SMGMbldgOJz6rcgNkzp+CGAQKTaZYB
         hUNrgBc3VFPq+URYdFiWVBA1YRmdK2zPUb7doESG3P8Fs0eAg3FBWZS+NWmo9UkSKqP0
         w04vx98hjCYtbrAWlbLSvO4XK37nRhD2wMggD0uyFNNdIydIlP3tZAbwvtCjmhfW1GD8
         zA/A==
X-Forwarded-Encrypted: i=1; AKwUvBwDX7CFzekHUwFFeooioUIaemdYyx+rcszQVumIYm4UL1uqsMdwErgOAFZevrpi5wDCe9HfuXU3mvUY@vger.kernel.org
X-Gm-Message-State: APuU4Z8I8Fwd/iQ62zmJuUP4zteuHWCcwqJ0CCa6ZyEiz5GEY2/ADazh
	SG/4yaVnrZkXX2aJ1aUQ5yAf/D+3N2cAwbDQTMS9ePDcAB7QtpAScDaV
X-Gm-Gg: AYBFou1regjaJYOEK1BXWrnWeywL7CTH/QVci/s7QRS+BCbJsuA+RHnV3Owqaa4XMKf
	rttX9yVGYcXQwxckN0fXDePOYe6LaAqRIAsLbI0FarA3og+e1js0HAN14j7rUoxzQRK1ECPoUVU
	PQ9wsD18FzgCHIqSfa/0vPo/vgq8uiZQwttL517RmoYkps4GNFjobBt7yI7k/k0sFbhf/DvcZbX
	YdhG4mZ24vIFdO4Ec+krWjB30e+i/cUCmiYJ7FpuGEIeAbEKhyKwNkhoWD8OZqnUz4ETmZ+XmKu
	s+soobEc5Tm7wISYKqUuzKr64wYw4Bf3VcbTFLr87OVx1azGehs8B2Rofprrmsxsgfy6YKKLo4I
	c7tFC2r1uA3V1CIXct0XHfGywFVKZSS/FGwRqH5dO64TLGAtFTsTF9T61TpJexVFEn8dUQam4sq
	poxag97mRfXQwtdS2HtvdqWS+0YZU1/3DpJEfW5gMNB2T3yZYIwssB8Fe81nbigSeu2qf3GpJZB
	ufYQzTO1KZCE9+8jvnlCMJviDykY9eIt+rHdZcTr/C+7WRIqiHLuunOpGCD5aJ0Cmn619RCGUWm
	r5YdWhwDPfhjWEdzHCFZ8xzwY5XORTjaZzPdV+hPmD+UmNqgwtE=
X-Received: by 2002:a05:690e:4546:10b0:677:ade8:a076 with SMTP id 956f58d0204a3-67ba50c7b54mr6675580d50.47.1793736141331;
        Tue, 03 Nov 2026 12:02:21 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:20 -0800 (PST)
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
Subject: [PATCH v2 2/2] usb: misc: usb251xb: configure battery charging from DT
Date: Tue,  3 Nov 2026 17:01:54 -0300
Message-ID: <20261103200154.125681-3-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103200154.125681-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
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
 drivers/usb/misc/usb251xb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index fb0693742f018..7c0086a554cfe 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -577,6 +577,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 			      (wchar_t *)hub->serial,
 			      USB251XB_STRING_BUFSIZE);
 
+	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
+	if (data->bat_support)
+		usb251xb_get_ports_field(hub, "battery-charging-enable",
+					 data->port_cnt, true, &hub->bat_charge_en);
+
 	/*
 	 * The datasheet documents the register as 'Port Swap' but in real the
 	 * register controls the USB DP/DM signal swapping for each port.
@@ -588,7 +593,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
-	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
 	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
-- 
2.43.0

