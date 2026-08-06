Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD807479898
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018258; cv=none; b=pAzYchRi15zd2ekcusmiRWKL6M55KTNMuJbSarrytUtiphxzHY3i2Z71itz6Sk6/LQoEmMYH5l+RaydjFUre/ljRkBnLYQ8EgQkr//Ev2/0fmkoG+zmp/i0BK/HetTzCGaqvsWn60x98Rm+BzUEAuWURaHg5+BgnrojxdrUQEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018258; c=relaxed/simple;
	bh=+Hs18QPp79fJLqkbKATOWVxcRp9yV7SKumSFW442lMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8Hlp0YJadBQThwPQ/KzT5Q4LGj/v2XsNMIti0azw4xin6JC7iM5cp4slhsyiCFc9ZZ/vmhaFiZj0usnKCAyGdi5E4fDJsJQwMbOTRohDQIngeO6nUx8JGLECEq2hBomGMAxzO6cyRLI0NIc/b2OHGI3YUFnrwvyS92zx85mhPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJkEQTkV; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJkEQTkV"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1791083a12.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786018256; x=1786623056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efDDw2XG4FjgOIVMZFXJuQt8TiVVi2gSSR997D2blzk=;
        b=QJkEQTkVW2ardH/uJwIOpk9jJqwxX+nzZvyyjtCtpUYCKOna2gKsNBSMB/htBc2Fyd
         ssAEeemv8RmmFGN4J6XKUvUCE478GQj116YN6D2mAgny0KRDC5K0Byb3VeYojNA40eTb
         0HE/XrACZWAq1WhL/DRrwpXIuLZCHKDZAZsp4af9NNS/lEjtkYqmzAPpS7wpsKCJprd3
         8psBvdrzcIKddsxIdh276AcbkloMG7NY8DEeE+NIr9wVionAYQcCRSNhaUjCM1G6+Ed+
         Cpb7n3fzoDTIoj+rbtpCBiKc81vz+BEFsQN/PxS+DvjIezmjKgbf2rgnumyClw6NJHIE
         qbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018256; x=1786623056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=efDDw2XG4FjgOIVMZFXJuQt8TiVVi2gSSR997D2blzk=;
        b=VdAsuS/bdMOqNMPRPgxwReSjzloP2TDklz3VRH79/9+e2MOMKLDX4QZ+bqbF3W6VMJ
         XTbRIgcrScFOy4Hedpr/u+IF9+UizG7ymicpdBJmQ6Py6l+pSWvXsB7VzjGyDr71HnUM
         53QD0F3oYFAFkR2xLtbzQXhiR+30H6TsWGqSlUkBlXuqCorrKXHJRrN/pZW/w1QoRQpW
         9bLLg6Fsp1rdwSNmXGFN4Gq7JiDFqOsr6GpZixadRFdDXZPL1Fx3MORI8UX2yGbGvBzj
         mQWs+T0rPd4vDTizvX7pcrbfdfCzFgX3lRCk0lEUrVaM8mvsFB2av7b/fj/+3LP4oMm3
         eB/A==
X-Forwarded-Encrypted: i=1; AHgh+RoXAYQhdAYE0j2BRoRPtmnoyj4IjTXDlOhXPXCmnnpOmzuJwkB7YYsnTbNW6B46en5jVLqZAS+fB+4d@vger.kernel.org
X-Gm-Message-State: AOJu0Yzregw2/64/L6bSOlmoTx+ucURmbnrXJRBL6qmwaPUe8Fg1/Zps
	h14fz+4TWW0b1vPf3uGHv5h4C9YcjHagdn84dNDnEeQQupm7rm13tKeZybUfJg==
X-Gm-Gg: AR+sD10rfZRbZUbZzki18IEXpPZ4INjMbn+Us8hIJTZuHyEcIYKdXkkSQFcrRhniMVU
	N85HWxekwQizb0FIV4nmS4AnWsImmUwE4phyJhT/n79wsKsQXoZsifJhxW+g6Qr9tQNVUvonXlq
	4lt3A0YsbPcyB4dp11OBoDc2mx0jSXMqzr/ECS2CnN6uokaFU09tdNNpLpylUQaazyY62KOWVnm
	xkO66C+fziweCIokasqLwPWychUjN8l00dR8YK4sjkfunxY5mWloKtW2axZVEG93G3wJTlvle45
	QYN9t1W/qur2mipH1JIwP1E5rbGrXPBgDbVqBTf9w7UfYmWrnvLtt5Vx+G1qcdpDQKIRYJA7hHB
	oxaarCLG+nC+DXnJiJVKFWcwPWBCnYTED5E7rPM8jXCDQhqEbGaCvtPwdNZBEgEb2YfjEe7TwQQ
	EXyhtbnPGGB5klPvS1YZGAlBe5GmxAY1FRH6CzBWIBxtQJOpBxFvk5qk6aS9ESZflvT6slgK94C
	1/Zt3456YZHs15mEnJQYvWYzy/uBMDVFSDtDg==
X-Received: by 2002:a05:6a20:2443:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3cb85f4a647mr15543534637.37.1786018255930;
        Thu, 06 Aug 2026 05:10:55 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7b2sm28406824eec.19.2026.08.06.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:10:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710
Date: Thu,  6 Aug 2026 09:10:39 -0300
Message-ID: <20260806121039.16967-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806121039.16967-1-festevam@gmail.com>
References: <20260806121039.16967-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to brcm,bluetooth.yaml, the correct clock-names to describe
an external reference clock is "txco".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
index 2cdc2013c320..c449eaa84edc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
@@ -588,7 +588,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "txco";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0

