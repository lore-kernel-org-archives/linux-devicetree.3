Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2583976A9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030907; cv=none; b=aTbQw3PyToeAfl+RzU+LE3hI/urLiP+ebeWnOWB29pwpbDTUe1ntIk+xHRT2VA6CpKMeAZsWLuxEwz7p0b3YZxdk7ASuioaX0dKU0MT13+jFUQdpnJIZm2PSnubHd4rtwGE8hP+BV3ejOxrhGSD4vEGPohpoCJP6kpf9tFRxzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030907; c=relaxed/simple;
	bh=/zQ2QxNLVWr9DOK27NIqnwJqIaMDbkLY+igiP9VtMew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHYL5rYIvtzeS6XEaTm415Qga6H7FT+8rc00vhlXyPWsXbPCV4qmCfaBOyCzXOcuwJi8YTAeYyDfPNIG59h/OjJlsTSW8gfqzbuUnFrTh1ZIAEQkVqKXYxLTtB0tgrraRqbBaqntcpvpKnWmXjtzVBf2o88UMtSCDZ9saDUzmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzNMqwwd; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzNMqwwd"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1624595a91.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030905; x=1784635705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7746hlY1VAGyI9teBFqCgeCZQpUtScgAKDRj8HL1cDA=;
        b=pzNMqwwdqooO1e00C3dPrY7NLD8rlK3QQGsD+Ih/FL8y4V0vQfaCBK45dN4eUMxI9B
         xwGZ+SH6qjyOQrLWTkZcpRypTiZgIYOSrV1fsmNKJmzHc7HUGoUmDh3kfUgTTOuYqQUe
         ZHnzJ8SpfKpCv+AJQdc10pT1cpyo+eQS1fIGWoWWkiBuqfHzXRKdhOZxS0pABdnnedq3
         nCBXOLzKfxvthTNwYUjeqBbYvs1vMp3eIkoBB8uj66rL5oWbq7j259i5wzL3YDNscYrw
         qomk1uAFaYdfW6MsloayLnxsTufcmGqe6O9LFfW2sianXvPnDGxz05re+psvhlkq4zXR
         szng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030905; x=1784635705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7746hlY1VAGyI9teBFqCgeCZQpUtScgAKDRj8HL1cDA=;
        b=DHuTWtd+QxnVbmJHSu2lk1uMgynAAOPUlTOFBtf5gQplJsNbXyxb3n4lxiGW0q5x1w
         2QLpbziNoNvlXzyf5+DDLIbP59TW7aebN6yuZYGn9GxpA4yWOktSzpD98ddiVrcnk/5/
         kbJ7nyufN/DEMk/p/KNbViiBdFKPFdeTNxD8C7uNue4lI291LXWknLbOWfz3QdGVJ/bt
         fc2KMaxoVnZR405eM/pcFy2f2/LijmLAa4YYPSla6BXmxOGBPsZcO+kaGXrJLlnfKovL
         Z7XFwG87vqjHRc0ZAJe+AhyW0H0CpL6z6Y6Bu+5VuwRWmvgOKVudnJ0KMu2mQwT+EaKR
         GI2A==
X-Gm-Message-State: AOJu0YxeI2BHWpu59Vvs3HTB+Xx52YyLgi2am8Gpbni/OBOSHmJhHYsI
	+i6Gr0dwIHB5DHu+ew5EIX+DdMw+1H+AVangn/iobDrEJ9v1eshSOgGg
X-Gm-Gg: AfdE7cloWrKOjPAXN5vQb0ZBgUPJW6ZVmE/lxSSwwfowazAS6t4CrQ8skvLACdwIwbQ
	4Ecg3OeEi43f7Pjt7ncjrF8NuBuFHUJ6NJcvLXCh/CcyjBDsXK7yNLbx6iYKd/pfXji7gR5QOgV
	FBOH4gkPTPdwF9OAurpTFahCMpt6S+yklF+cIXK/itR7M540VfI97VMlB64TQhNOCU3uOWU2Xpk
	uJKCW6vEVK3qjzzc/xUQBBic2DyOq8StW9AJPGXq6YgDdGyVJRfjPHdVGmKjYJk+9c5ankomxlE
	WDeAuFMSJtdNX13l0Q+KHgESmAZpf6qulOMawTETK4alsAYzGxXD7wUvJzbvpcAwxYMZWEsdiIK
	Vimn+UoPgLcI67H9TRjRl9wjvZGl7FGlbGpfmyVY0T5X7tS7YTTBZ1b75QsnhSd2+OSwMjU9ru/
	CEww+frHXyFztnwpL2MpVgohaZDeLVBUpcE+6Fg+4VsyupUzyZmYdt+BHPUxs=
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr8733002a91.4.1784030904950;
        Tue, 14 Jul 2026 05:08:24 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172dc530sm1384425a91.8.2026.07.14.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:08:24 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 1/2] ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
Date: Tue, 14 Jul 2026 20:08:15 +0800
Message-ID: <20260714120816.1504058-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120816.1504058-1-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative ISL1208 RTC at address 0x6f to support boards populated
with the ISL1208 instead of the primary PCF85263 at 0x51.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index d1a04b63d..a966be69f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -865,6 +865,11 @@ eeprom@56 {
 		reg = <0x56>;
 	};
 
+	rtc@6f {
+		compatible = "isil,isl1208";
+		reg = <0x6f>;
+	};
+
 	rtc@51 {
 		/* in-chip rtc disabled, use external rtc (battery-backed) */
 		compatible = "nxp,pcf85263";
-- 
2.53.0

