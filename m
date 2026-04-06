Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117323507C
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513114; cv=none; b=Bh/PGo3echZHWkTUnwx0OLJasJTEDdZMapq4pFZID6Er+EhZmLMRaS8rQd8RAeL8kRJ1BQTHodrsN6T9BUtVWWnLhWtKpE9G+fi57r/0KiMNTeFd5UwWJLTHC++r5MnuJu6AYa2W65KILR6WJykvnnfwLYuaEnPUJr9TPX+oE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513114; c=relaxed/simple;
	bh=1Jni+T6Wm+NnU7euzrHEHBNksu0ci718TF4CCmg8QIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tz3Qh0pDrbgqd9h2aVFBYRLtxTnJfRWeHqqPlvzHeRzUlz0SMBQT5Ru1hskna46cn6lpU959goWbmu6r4qJKoZWEVEr4dUvt27XZFwHVDr6vX9VAIpM3AVIUL/IEsQI8ppDsZka2nk+YS/LIvGGiBBJzuT+2hXfLs5zSfFHJIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dprKZLPQ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dprKZLPQ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d4694105e5so223056385a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 15:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513112; x=1776117912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+deuk9HJHmm4GfV1lNuEcq28B7GQyr4EKky13KWcBY=;
        b=dprKZLPQaHD8b+rWGrBXCoJjH9D+9apRh8uZ9kRQEJL+3JkermkEPUjKZNuDdthAEl
         HbvQ+jSstCtU6BbOV8ftRwX9QnNUUZVoUl05uhswA8ej2ILAVdG2Tc6BDdSWlhq4GHZC
         NVIGN7ITB4i4nsk8dUMJAYzL+rKZMZHXN76H9CxlHUIyI2Hn9bVNXP95/tpjWG0Txe4u
         wUb1y49o64+o/CDACsVk+Y8RgtOtRvJR1HrgouulwYa8z7xcT1l+8OHL37J0GOt5JBd9
         SfvHvHB1P/3lUkrhHTI7OSd5ejlSH8yLthlLrHTMI63aU53toXHM5H8LJoZaSbHcJyua
         SbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513112; x=1776117912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+deuk9HJHmm4GfV1lNuEcq28B7GQyr4EKky13KWcBY=;
        b=Hz1U8wxpHQMFhKahhOurir+ptw84L2I34eb4WoAej55IwzSBzo7qs/Ip+qddoHFWDt
         7kGF1r1KOz0hG576UCxfM953TwL77FZjojdLxKJmcV/6wLJQOuIo9uKKSJu14KFCYpH9
         eVAKzHAW279XqMNRTzaKDMx7+s3Qzs7iI1q4iMji8WIe2C0tyOd+HZcKq08DBwXZWS1a
         LgR/ERN3NNY+8Q0btKGioHOm5ft/fv8qYGwHOs+GU4J3wC1EIXnOA/+ydh9LsAHQrAPn
         LK+YWSRyZR3H6gBFkxUf0hQWVPY3xquI3F72esq87zJ04fqFhSPyjjHYE4GPVMqjb6D9
         cvYg==
X-Gm-Message-State: AOJu0YyjJpdnZW0KaZJXfFrx8WQT5kCpftdZ4njUeCU9Ves6o0Bqe4D6
	X1UaSa2Ig2w8yPQxGNz7S89t9qnIHlSPrssppHUgteuUbezyMjlp6K4hasmXYA==
X-Gm-Gg: AeBDieusJpnNPBLJosB88jtTTl/aawOdTYwoIOtmoHvoBJDeE6VHSS5A/zelNrwUJuu
	dxep/IzkeZG3pWM6Sfkq2DazQ2SPkLy6zH3FmmfZwryUrz1DLsZRRLJc0qaPEh51GwcEDA41fPU
	69MgZbt7oZxQIwMtzMLnA29KqCHFO5WwiFi+1oLk4P+w/8rjAc/Gqdo4JUcIdPEx5cO5KMX0EH0
	AFBtBNwdJyr04FTKaEch5a0SMjT3wTe1Siz0xPxEC/5waUMYoRrymvGyWs4AEFLeXAqDHiuHrBU
	QEA3WAmdsCpM6Ou6qavZOiAlxxwiiZvIiChLulUKH8lrgLhcMRFsYBVosNV86vHXyffdSZK7RZz
	xfEaIy/ZyzeiI6QlX8w0+o4Ex09viTWg2+k51IdS5PusNure0Z5lWBaYc8iabCxGbIwms0zvtWb
	mmZnE+K9h9CfHkf4Y4qaOzlgbzPfPYOmc/EJEmUMnESg/OVDyIFWfUmo0=
X-Received: by 2002:a05:620a:4003:b0:8d6:bd01:a684 with SMTP id af79cd13be357-8d6bd01b434mr1091538685a.7.1775513111721;
        Mon, 06 Apr 2026 15:05:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a806cd69sm1157670085a.29.2026.04.06.15.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:05:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: R6300v2: fix USB3
Date: Mon,  6 Apr 2026 15:04:53 -0700
Message-ID: <20260406220453.101185-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB3 needs GPIO to be pulled HIGH in order to function. Add vcc-gpio to
do so.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 77396730bdd3..55f0d9e90d5f 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -86,3 +86,7 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&usb3 {
+	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+};
-- 
2.53.0

