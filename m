Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240A3B4EA0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868534; cv=none; b=Bft9relGTILL5b0zC+MDqqvy15QvMeFmB9RyMkDHluEOLyYYyAOoMivOv9tb9bMNkmFj2Qo7kWgXaFxYwLfAY2CEyFpWsDKEL74IYCVg6IFZVneEJcJE4+hQf1Gcu/JEYVeWyHalQJame5RMWoxv5GN9vEaWfM6OLtpmHxbcrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868534; c=relaxed/simple;
	bh=mxrzICpe5NIe8GjG8dLZQudvhcALWguXqUHhxL6pajo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFHFpPqWrMV3kGwWUQSQWWbKYQRwJ72eoFgQ9O0u/v1FSPjDh0Bjmv++PTxMmXz+je04yDH9oGI2xyjM+DypoCiz2ysVInTPkX4KFP1AXuGzqbtycOgLGCfE+Fr0NyVlGpkxNejth2Ymk0LbOuBLN45Q77u8uQHf4W3JV8xcszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EljSkCwG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EljSkCwG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b2589c26e3so3685365ad.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868526; x=1775473326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVSxqj5+EI9WDl5Sz6NGHvDhkfU3nzyVbqnqzEf09AE=;
        b=EljSkCwGHe33EG5TPHSsFeTKynciLg+bctTqTdHhQgmfn4/n79PWTz1xcsOmXWMcEl
         BR4XxxFtGD3J8zP/yOwoHBho9PlqUVd10f0zivop0I1jkNHXPWGwV6qdqISb8IErqbSP
         Y4ZpmudGwcKEECRC4fytDZRae1+wG3ksK+Ss1AQ9h+w9xHjUpJKNk6u5G61GkO2iNBji
         Ix13LgkHrTSw4ZLqXPzuASTxqGsnqwmht3eTckg/5iAxYe9yiNCaUvIOQ9/okWEGVneC
         2lK068IJAbpimJW9nHcbb5dW98QogjDedDXb5cjyCD93KXFrDbkAajfeSvIKwbBRet72
         q7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868526; x=1775473326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVSxqj5+EI9WDl5Sz6NGHvDhkfU3nzyVbqnqzEf09AE=;
        b=Wj/zAmUJnsIAmr1/qHxiaIv1JaeXGsAbRbJGXI5OrMEn0bRS8WhhiJQYFId15cVNmO
         5mYdcyPISxe0a+zQBkZljpweN4ZGOGUF6uJHXd7KpC/si0/ama10X2mZccrlekTdYLCB
         w2XEYZgRnaDhaXYzdgQdZpMGOn0EbikhWUjE8NAKAGFPGyk1PusM4ZUNotcRO27m+QiZ
         OTRkZktMUWtU6/A5OoD4MoMuAaRmLm4BUZI3PMFgDP8qinZv1nXVdWCOswfaGOsDfGul
         b8QIb3SY5RNgPjA3hlFp/kZcRF65CinV3TDW6LastfhWVoP23lDp6OX4MdASVwMp0lUI
         sJMw==
X-Forwarded-Encrypted: i=1; AJvYcCVEtpL7EWPbdhC14oW877rK99mH+OPNKApy9ey5ZfTn84cl6jPLbSDzQTXaVt98cj/zyvk18xCTgzFA@vger.kernel.org
X-Gm-Message-State: AOJu0YxL/ckecGYfh5ABb6Lx6Yfne3oKrXhESphTJccdY7h/mJUtxKGn
	W9AV+kfwKVNDTUxiUviR8jsioUcoAJe3tvjPSYdieKxJDFOZkRZOzYUI
X-Gm-Gg: ATEYQzyNGZ+gPR8xBU0DZnIpBkGGGNA0yJPUIRapxWcvuw4dspZnnwzgdRRNzwjfxcV
	VGAEuc8RX/epZzkoOj+RNVYOSNtklVLergmjObRdIxmfss6gONw540TZfKE24Neei7BEm8Dk50s
	gb9pUaYBZd4eM2c0vpDBxAqzSG+WuLQW1fvyO5p3LFS2OKeiYCTQgK63ikHPu79urQ6I9fTMNuv
	lBihCcae1djiyrH8itItrvObj5BbsEFUQbTRA4qfYizvUTXugKC8klVVTRndSEc/iIEImz9psIG
	iTQVJ+vUFLLSsHCKzRm07I/3l/4KiXyHQNfq/qw8qJOUrYQrFJUDxhuq2XmeZLOSqvMN6NLeYLR
	vvYFmsKF3zwdrHxdYeqWV9I7BNizzP9rigyieAuv+LPhqbnNXoJdWLKQgheLr0Un2gmLCNsQUGk
	LPLmvfPrmSD4NZF+xHyzMiYJWdKfDekXso3l7yI0A=
X-Received: by 2002:a17:902:ef48:b0:2b2:470d:6d18 with SMTP id d9443c01a7336-2b2470d70bbmr78007655ad.8.1774868526411;
        Mon, 30 Mar 2026 04:02:06 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9a6e:3eae:13fa:fe3c:864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm77701375ad.60.2026.03.30.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:02:06 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 2/2] ARM: dts: gemini: Rename power controller node to poweroff
Date: Mon, 30 Mar 2026 16:31:35 +0530
Message-ID: <20260330110135.10316-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330110135.10316-1-khushalchitturi@gmail.com>
References: <20260330110135.10316-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the node name for the Cortina Gemini power controller from
power-controller to poweroff since node "power controller" is
reserved for power domain controller.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v2 -> v3:
- Used generic node name "poweroff" instead of "gemini-poweroff".

 arch/arm/boot/dts/gemini/gemini.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini/gemini.dtsi b/arch/arm/boot/dts/gemini/gemini.dtsi
index befe322bd7de..910faabf76ef 100644
--- a/arch/arm/boot/dts/gemini/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini/gemini.dtsi
@@ -228,7 +228,7 @@ intcon: interrupt-controller@48000000 {
 			#interrupt-cells = <2>;
 		};
 
-		power-controller@4b000000 {
+		poweroff@4b000000 {
 			compatible = "cortina,gemini-power-controller";
 			reg = <0x4b000000 0x100>;
 			interrupts = <26 IRQ_TYPE_EDGE_RISING>;
-- 
2.53.0

