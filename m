Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0058306749
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779503447; cv=none; b=kfYHDc+4kCziFNdsVLSweVB5fF80oPQYDQUvZbvKANgDPt2xM3wZivKdoc6HacATAvkSLIdYZLcFrzduvt66rbihFhDBjr6k2lxl/AN/h77rB9HqwfN5BUMAFk5OeaGb68ggAzUVVDabtios6bC8NqC3yUIJ+2sJAPE7nIcUGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779503447; c=relaxed/simple;
	bh=Q4E3ZBST3Q3ly34aY2FsZlQq16jx0NpfboLmFcFmWh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7mkaha1Fp9EE40Dx4U+22+1DZ/6TDqpO8xksnT3WqCSr2PLftAiHXZGchE9TILNDoEnwQGfR33qpq0rRE7tOCerDXA0XQe3/8+iK4zkPnpaXi76v+daX+Vx0sJ+M5GIUwYqBynQzLYtHgO+ABdgy7awlcHTIhWBpJcCqP6kVx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVS8EQ89; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVS8EQ89"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-367d88b9940so5208576a91.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779503445; x=1780108245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHPUJ3czC5a2AiOeeio5W0mr8v8tHvSIXMOz+fsp+lA=;
        b=PVS8EQ89apErYjuIMpwCo/qFNUC5SZWy6UyAblvb6dCQCDib6WAe6oMyMSiQGEIAie
         jjmPLAc2vnZvr/LXVFl9fIyqa9subt3D/5CuUoHPb1Kg6mT5LSOdG/w69fb2Gg8Pfp92
         joX3B90iWxxL2fEWk8chncwrOM59mKWTQY5Au0rMkI7BRr4S/ONueVHZZs4v3Ea1cOWd
         BwwQQCMrcVzfT5V1119Hsv1a+jQlRGZDR3eCR9vf2R8+26AfKlqVUz/3s9adyc5lDdyo
         5bKFbZy5TAHDYnt3vOyyAhr4emk8RBWeMtj9F8igcdVqrkGQOZbCt8ecJftupUQ5ncZQ
         +NDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779503445; x=1780108245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sHPUJ3czC5a2AiOeeio5W0mr8v8tHvSIXMOz+fsp+lA=;
        b=semp+R7wm6myqhydf6GiYYrc1eAStN/0PUEf8XJQsmlVql/VwKJTvVaDbHaUycHvgv
         0hC1zDdTXbcCMF/mNkGzcniWhjzy3EIZj2TkSVm3Ev34i7SSAAwCEUa2gFP6Yq2aG/hQ
         u+8N9EdE7O5aHuezQAjDwJXK7xNJ9FBUERrEipfdzzfMvN/2VxYGLgX/hZKTuL5yg4OE
         aMLnINz0BgTX8XJFtVCLkIpWt7fHF4pHzSHlZL/wU5hQsoLMXSdBF5d94wX1ViOBYfbo
         q7aHxJrMGDkt4JjUMTuwgCfJiZx9lb+oQ5H5bS6j7lcuUgtEhXz8kxMzjc+R/e3Xaeir
         I8uQ==
X-Gm-Message-State: AOJu0Yzi3HJrcf6r1gFco3w/DEKoyIHRiVbazxYXv9x91t+CxHb2on5y
	A+/KQv1oPoOeVHrLIkRLhQgQ6PPCIhgKcC3HQYY1MrJg42u6QKmwKhLv
X-Gm-Gg: Acq92OGymdIWKborv4WmhJj58GcD2y3o0j6UR+1FIMHlwjQ52v8KC0lGMU2XJ0ETPVW
	68dnUS/8eigw5VOnDgfNq2U0igL8zHMUT/rQKeClhoePdeVq6wrxOoT9ePMLgGgGHZ6BQ8fqDeI
	IT3jYzGxe7T7NGDoJbjc4Ui/1YOC3EEdBZcZUw7ZJOp2bn1ry9xQaR4Zd7+DEjb/bk+iLFUqag2
	5AO7QhZhEOnA9vZbCZv4N6TTDp3Eq75Y66UU6ePVeBX1r2Q26ddaNHI1q1pGlowC3hepbDv3W1X
	GVjcRchgNPf91YlKdOunU2uTkRrX5kEn1ZCWZOa+c50qEcN2JA7zhZlha5S9/xpwr5E40r9v+eE
	Ld/l3eC6YZEZ57VEPn2zvKQlZv1QbtOgV+yYRlH/2/sOAjyCrt+vIbUlziTdoO8W+mmfPpzuJ+v
	to9OSC3b7gLGzotwjt19pxTz543hLizEF8q0FvhGVvs4U6y8MgOH6e/7yy6DOCufaCYQ==
X-Received: by 2002:a17:90b:2f83:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-36a6784d120mr6270352a91.21.1779503444976;
        Fri, 22 May 2026 19:30:44 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm3010287a91.1.2026.05.22.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:30:44 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Date: Sat, 23 May 2026 10:28:08 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT
 linename
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779503436; l=1342;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=Q4E3ZBST3Q3ly34aY2FsZlQq16jx0NpfboLmFcFmWh0=;
 b=Ruc+O4VL0C7Z8Ul8A7X6wFf74EjrJxDSMlytQIRn/OlyWuyYFoLNzwlw/mw93ArtJMjKo7bJ7
 HOfUx0FVyttDLIBwrTXOHZ490kWWtc7AqhVgNJDr5A4ZiBF7wLIJ0VE
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Fix the GPIO linenames for CPU_CHIPTHROT signals.

The signals were incorrectly marked as output ("-O") while they are
actually input signals ("-I").

- B0_M0_CPU_CHIPTHROT_L-O -> B0_M0_CPU_CHIPTHROT_L-I
- B1_M0_CPU_CHIPTHROT_L-O -> B1_M0_CPU_CHIPTHROT_L-I

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 61dbef45f8b0..d7ed497d7227 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -224,7 +224,7 @@ hpm0_ioexp_20: gpio@20 {
 			"B0_M0_LEAK_DETECT_ALERT_L-I",
 			"B0_M0_RUN_POWER_EN-O",
 			"B0_M0_RUN_POWER_PG-I",
-			"B0_M0_CPU_CHIPTHROT_L-O",
+			"B0_M0_CPU_CHIPTHROT_L-I",
 			"B0_M0_SHDN_REQ_L-O",
 			"B0_M0_CPU_SHDN_OK_L-I",
 			"B0_M0_CPLD_READY-I",
@@ -398,7 +398,7 @@ hpm1_ioexp_20: gpio@20 {
 			"B1_M0_LEAK_DETECT_ALERT_L-I",
 			"B1_M0_RUN_POWER_EN-O",
 			"B1_M0_RUN_POWER_PG-I",
-			"B1_M0_CPU_CHIPTHROT_L-O",
+			"B1_M0_CPU_CHIPTHROT_L-I",
 			"B1_M0_SHDN_REQ_L-O",
 			"B1_M0_CPU_SHDN_OK_L-I",
 			"B1_M0_CPLD_READY-I",

-- 
2.52.0

