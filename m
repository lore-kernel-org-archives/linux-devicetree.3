Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47681317170
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464458; cv=none; b=RYM0QTj1ZdSWYbza5iamu5GBaZYk60nid1JRNfS6PE2i4yKncv3feuDyF1YWP3n/15uCFufOTlI+40gXH4Qw+GVWEXXbsPMVdv5xRhkXccwBgr79kRiVTGAWKD5I5/cwD49shrRm+oyHJt9Avf/rUbiBTrpeEj5XhQTk+ijqVKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464458; c=relaxed/simple;
	bh=Mc8Dcste8PiXZn5dDJtZZd+nBmIxHxlDzT2m4LkONQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqyMObWKrfhWH/UWR0eu1OJ62LwpxDgfenWqxFt+PIMc3+ofGwx2/Bha1Nrq7ft9Jo6gThGc7SeIljILF0JqiyrXYv4Ernae4TeNBeK2H3qpYC0XHCqNQ0RAGqIIYgsuVqPD20kJnjgx1GThIaZgLM2wYz2KZ69dndBzCrU8f2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geINIh+s; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geINIh+s"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so33843675e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464456; x=1776069256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jzq0svM/CyVwYnCMdFf4d9/HiEVgTFbm0k3312KAqU=;
        b=geINIh+sPAGuIsNiV/nGvf35EUJzj3UYzwejMhC2SPPPMwjxjWyimTVXJgA8Ii9S/S
         loaa3/EtdFVh2jWMb3TtqidaUGrsTo9z7GdqeKJbmrv75eKCdcEtF1E7s0HM7JLb8OC2
         rNtDARKYVwnT2CVhbtpNeAq9JA7M7iaLHT+QkXBxp202GJ/IOxVwShv9zjr4KPx9XvfT
         iB2uAUfrvUOoENQpivCKhXd/17bLoxLLB5AcpHBVpUcZqKBXkhoenYDP+wKISm1iWV0F
         YvHGLS6HQMOpU3gcmkKY1D6LvWHuOvuKND3A2VzGd0Mno+cny3wJzIDq4YnZA6U4gHX7
         Lw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464456; x=1776069256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5jzq0svM/CyVwYnCMdFf4d9/HiEVgTFbm0k3312KAqU=;
        b=aVgbRppgqr9xwm4WakDI41XHpxHeEVJFp5VONMkmbmV7tDj6e4BeXiMFQQSIfWIiFr
         hoTuiR85TYdzqzPztW1fLjXTHZuOkPhC5ZNqwOcySpW/9RQ7cDqW+JOq7dqIGIwJrXvG
         KGeYTrMiMOzKf78SKp59Kaj5wPCxxhFx2AZwT7u9dLMcgVt0H5iz11GGprv7TFOfbLCW
         qrzDQUVf4F3PL0Juj+UixBjpKJsePihuH7fiT8dTZn4xqYCt0CN+xqm4DX3bgULI/TMA
         U1W+kOUGX8WJ3N+bVoURVV048aGYbxVg2H7orEEV9SoQCiAAlE2fCGf59Klj4+CCUGa9
         ycsQ==
X-Gm-Message-State: AOJu0YwbOUjVVOLIKyPZ96dOH4Q0jqvJUoa12o2+v+O5BrwcZ6QfG3B7
	1Pdc0fBh1Dll3X7TzLdaWn3hmiFcJ1dFTl3SfizwRTV1oMX5CxnbJGrn
X-Gm-Gg: AeBDiet7aKiIdxc7jZDJQe3TMGX7CNQEtUqp69eedN6NvV/4PsBwNtXOnd5LIwnm15I
	x7h/E3GrOswwfjG3Y1SnlmDBGNugTiJTHYATN9PQC2aS0DHjOKzjapnRH4eRS2gwd6QPgDMXOJS
	N78mvsv3ijCd+1ztiXZNN2sOlUgUhP2DjME0YXy/XsrLZTpdGDqgIWqu6FdvWfDFPPNqXyASmA9
	jgYY0c1/pCcMXVY1S8+vye78gnCLaC9o1ftFOc+01VqbpYWwJiDgbn8VQ3jQsCcjWSdehbDuhv4
	m5Aqqt0UtOVXGT0eBzhCH7FrFZVfRQqezcULGfAE21zzOtZMFKpdV0gopn2m5vk0lPmNiVZjjwW
	9Iq3w4hMHtwKCF8YnxnSEpueD3qKX7MOXIXk/770C0Uhvf3GO4X5MFKM+gYjrUc3P4AkjhZA3nJ
	4bmKgcFlBod0/2
X-Received: by 2002:a05:600c:a410:b0:488:b726:6daf with SMTP id 5b1f17b1804b1-488b7266fd9mr8967585e9.24.1775464455723;
        Mon, 06 Apr 2026 01:34:15 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/9] ARM: tegra: p880: Lower CPU thermal limit
Date: Mon,  6 Apr 2026 11:33:58 +0300
Message-ID: <20260406083404.31359-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ion Agorria <ion@agorria.com>

Lower the CPU thermal limit for the LG P880, since its chassis has less
thermal dissipation capability than the P895.

Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index 1b21d7628c8c..6b30e17459ac 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -537,4 +537,17 @@ sound {
 
 		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			trips {
+				cpu-alert {
+					/* throttle at 60C until temperature drops to 59.8C */
+					temperature = <60000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+			};
+		};
+	};
 };
-- 
2.51.0

