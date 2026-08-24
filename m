Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ED6409632
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569492; cv=none; b=h22DbWeeeQ9RfFXROt7HKNq0TYjoI9fvYWEIkV6T14hmbUHsc0F/W1lf0uovicwm4hvvqmKF7Y20jQvLMhuspxb7svKfrqSbnJY/V73G214na6xpTj8Qgg5p0ZbogyMO289+99BkHAhgqsgtDmD3ggRoewmHS0OhbMwoFXS1SeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569492; c=relaxed/simple;
	bh=bn4q5LJKmckPAghAM5nPmWfmj9VUGItp3IL8CzHs43w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9YUYG5tS/BlRXawnC11hWw5ZpT3KhyVidGENRULMZOdmDi6Z2wkfj8Q8XuHBdJj/CE4NeK8XLeYveYnIYtT1RAlQkvtHCEHZZW0/fr5oLqryM7LXLrK5U9V0c2ccYL/+7rdCMvol+tI6HqHDNbCG4gXFRTMjfaT0ByrUCHCao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=XUE2E7AF; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="XUE2E7AF"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c16794450aeso476996866b.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569489; x=1788174289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEqNGNEN3QI8hqb6DA/beDgL/pDDkQRhTHMi91Qgs5M=;
        b=XUE2E7AFpO2q6LVghpxYB4UUL5/P7isDy0kEXCfdOiJOM8vphYIyz6aY+tJ1emJ8ar
         kVpnB7/o2t4d6ZAJ7va3B0HSXtv3A2Dk4mWSiDWGLZX7O7J5ltIXFpHfjuHF2KIFjv6M
         yoqTpOJFHqlT4ja01LF49G5FUgt4xcT7jJp3t1ktx0BWGMbVvMefzKzpwAIsKd5ZCW7+
         R3jho/zmicaV2KIbYXTtzOk6G3/LmY1st/tIVWmFkJABE/k/GbayBlp5HQ1HqFDg9MPR
         yf8jqEdXpLv7QOGHAzT+LJ8YknH0flHtNSIf7JL43wnaWFydsDV9qsvdEbYCsrAM5wjs
         ijpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569489; x=1788174289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEqNGNEN3QI8hqb6DA/beDgL/pDDkQRhTHMi91Qgs5M=;
        b=KcUTBsYbG4EFd7bdLhtTwefQZKqVazFi2fqs4nbTwS4XD33ORCIxLPJc+UJYvYC+66
         jovGqEmkyB+r983IWKCw2ziruEcQ9zrWwMOYaEQ0jfjuQK7Jk95gDG8vZCfYWT61UFvB
         s/QtnsuvbErWErqsRQsch04olpNPJ8FQUSBxPW4/cAODWiyNWqv7jlZnOjMzVm8gAY8X
         uwDP6kuDTxj8/k0+d0+RPsc05y7T3d074hxeSp8fxwhU8lyt0E9P0rh7wx60v0h75MSS
         eYbplb5LUsLcgiv+e6XFvfb7idJEzsH75yINs6ggvUoM4WXmiIqpdw6dIN4dOJ1VBE4D
         DsqA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7vXzzrx8ex5hauZA5HaWxjqWxeAORjjotEi4CL8uJMOGyDQvFGD2nCEyLvQuuxgTPd8/wpZ5XH9I3@vger.kernel.org
X-Gm-Message-State: AFuF++n2lfd27b53VC6KDYxZJNpr5prSF/COEWNQQejpJhxwRZHcVkFP
	NqY6ZBivGO+i6wjJRUmDFgPAkM0g81Ucy+Km6gL+3w3jPtuDvXWyIUkPjGPYdRC1Ph8=
X-Gm-Gg: AR+sD11kG9jM+m3I+N8HvZegPaf6wnqIDZpfwI824lv3vYVfv+vk/eKnmGZhPzJtCwV
	Yy4esR9+8LY2NBtNepnQb9wMcNYbOMG3bVslTrx/3R/ABSrNrDYE11Sz4viKUqhD0hbohDJCyTw
	QpkrnWvFFC0Xzq/EvGsr6ZWM7LsM8YKN/H8JlpIKLC+/ePlUCsF6WnceofvrYpVMyMGACKoVCNv
	OORmPRO+dQxn/4p/zwAbpJxsQJIjPkd1pTKEXS3XNtI1cJWM/sqFPtiEx43KGmqc1QO6lM6akvc
	I0iTzKFLXTOwvQHxnHhkBo/wVqgjIhVb+5bdvvrdyQxJtk7qjsAuRyAXBrUYlzJQI6W0i9LpP5/
	42879KUl/OQJ2bE1YQqV09xSeCqtZo5ou6gPdbhpTXqEmLj2fH6Xu+0vKAFYdTxliYd7//vSgmI
	JxyjZDr5aUX0RHcGSKS7ff/l8wSdkTmHoDrvR7LF6wojFBRZGfbNghsQghKOyNp1y5djJtHYp0s
	1qQnrMpOxJimh5LNCfuvOtJac0DGwcPBXtFVcm9n7kHYAPuMf90W57+vHb00YeGQBe3Cz6mz1FS
	3756NWH3pOLTBbk8J5ismIpXJ26JD8YezIahsQ==
X-Received: by 2002:a17:906:f246:b0:c21:61a6:8821 with SMTP id a640c23a62f3a-c246a6cd384mr2330091566b.23.1787569489516;
        Mon, 24 Aug 2026 04:04:49 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:48 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 4/4] arm64: dts: microchip: ev23x71a: enable eMMC
Date: Mon, 24 Aug 2026 12:56:52 +0200
Message-ID: <20260824110432.1074136-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824110432.1074136-1-robert.marko@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the eMMC connected to SDMMC0 in 8-bit DDR mode.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 985ca31e74e7..89a161b87d6f 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -478,6 +478,16 @@ flash@0 {
 	};
 };
 
+&sdmmc0 {
+	pinctrl-0 = <&emmc_sd_pins>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	non-removable;
+	disable-wp;
+	status = "okay";
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0

