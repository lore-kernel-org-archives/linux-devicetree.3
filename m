Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615259;
	b=TAJUHDxnT9vgR6Fvs0qQlUbbCTnjovEVfNwxzY+lk5roExXgwHipVnmKvOy3HcmYTALb
	 N1dX9V6n03ouAm6JKQ3VPHu+Z9uHmJzOux6dYRaYyBQwyTV91ExKjVxGf/pk4qFOb9Fx1
	 tpPHAp4OXOnN8jfAjhviMAEF43pKAPlSSG2XEX7F2dc9FyeJ3/U0a3t/YbZpet1bIgBX4
	 5UCTwNUf/zlGkJo6CSFHbq88UspjbGW5DPSqFNuVVep1zgcMDFqIwEAqIi+hbcZm/trFX
	 6CQeLD/O8ITWKfLaM/HxuizayXQLl0Vruj0eLP0ghwJTd1H/cEL5yAG/4MhYVRZe2TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
	b=NIK1leaCsa4i9llMVVUHrGAPPk0+r8dVmG4Ih57CMbz/PbMHQlTbZPAOX1pVtPSHDj3I
	 07pRuQFSKgFgdrqxF737qJLMA3grvY0Dde0PHTKYj2g/o0H7B6ZJ9szRmh0fFlAWqLFu+
	 Yn4PpTWqTXJJWcthIOUaZHNhyd25tt65ja+aOY1rCdESoX9YN6RWKy0VCtTtLT38wldVi
	 utqlxKXuawKb3+iDnjIC3Xpyqcjv9RKb/Yisq03BlKS2vOsW9QmiR1JZQSxVwO0I+lfPo
	 VG94L9DAZKCJ6ip2hEWnGgbp6m+NNQIx3W0ulbSw8LoAFLcv4MwT7NZLh/fmiuDWwWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHlqr2zW;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F51C606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F51C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHlqr2zW
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1760862c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615259; x=1794220059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
        b=OHlqr2zWZ4IwIO0SF83rbd+aeEj7m3Qmh1uz67O/bNZpFjtIl5D60/+/tkYKmrd8R6
         zKnP6tC0SD+0o9Jk48X7JEQZibnKhQlrEBgwulVPj83riZHRakaK6c0lVIOLkirpkLGF
         eeGfBGdt9uIojiwRbUE2bAQtrugalPaL/KGsI8VvtauX0uQWpI4Onsb+5cBthXPkyVR+
         hl/87SQqqMs/NU4kRREYBTqhmHRXs2VLKKekG9UdpalXyIrsXpB6vEuDA3WqVjR/Z7D1
         5cbyTr4lDeyqw2pU3CGMHQhREyIbkxKCZHgRaCH1bMtXyJ0yTbJdt3iRfav95MPsbq3U
         tFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615259; x=1794220059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
        b=f9cH/hOSkedxkQn0Rsfyx/Jv/5hoT00gwPIsJ7/1zrszvDLl5/5ZXQEcs1YvimxJbm
         J58eS6iuB3QZ4nPN5OK+63Z4at4V4BfeEUhWOX5/aRsi0EoVkYWnYNWaeFtlX5pGXtpB
         0GrJFMlK/O7r9ikNhqtjO7TS5H97an8LcbfFui47/HIy3MLtcyJDMW3XG8yywl/t7Ibx
         Bd/RRasvTXIhPtY+2nPp4vBSMf19PTxiVAxbcD79GC7FvUoKPCpTFP0Aca1mYPgxSxgT
         CC9/H2EK+ogYwtsTqy9HgdjGZ+Epwpo+FJ9S6ooF9KSyr1haXgpdY+qW7CvvCJjCU6dT
         Blzw==
X-Forwarded-Encrypted: i=1; AKwUvByrADCmO5rTddBAY8t/TevcJ1fqHfqIdscoXzjOO6NJvbYbU3SLkjowppf98NynGwdjSw4LH3/zXAww@vger.kernel.org
X-Gm-Message-State: AFq9FYLBSGPQmeH+F42hsCp6reLwTztX6jraMvbsV2261Z13JTzc8uTM
	gtbwd5H9aCx6FmIYZcKPWOFCMKFKWhmW1uTiWk4OCGseo1PMAkOND6x4
X-Gm-Gg: AYBFou0WlbzY4CyMFYjuOr3XmwxSYLjVeYID1vZCaCav3yOOAC2CXuh8GNYaaWCmFkX
	EKbyaad/Xgw98WZ26/QQpieUMC17bm5NEBhugKEmu9e0PzMu238GNw4tD+XQLVyON3mroDO6wg+
	cVna2PrmIRuE+CyP3P5+wYPN4NNxQbf2c00Vzbcrth+ndgrq0qaAp78VaDBeWPQFpExZez1uEKd
	2BFMjyevF2atAo42nJWKCaWlr5urfUV4ic/Ql2P5bTYOrQ1N+lOsYGwNoqJ3haD7oljUmKGZef9
	aJzMEO8SdCF4lAFOTnWkV6p6E+5UwMDambaiqEdyS4C82+ZCFe28uqqdfnK/ogIiyT7RzIEwPI5
	71seJuFBI/iEdlH3uORAZ28GcJzFp6no8tTuvHyNzWrvKFPRqdifoN0nFy0eK9FxkcJtiDIcopM
	QITgV4agobKIufzNERXE5EQTG+krJw/YgeDD7Aa2nwstc08RaECzScP5OqWh06OUjs3zJhQiKE4
	YMVhXWVMaHp6XQhUhJ7FXQanWep4NSZECfe6uWgeGmwwJUkT9i7kQcxacO7fVy/mocahHWs7wGs
	zgvuEIwmtyWOpOfUlk+iw6tQmiJhFODIZc3iHMOOpPM=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr16458033c88.3.1793615258433;
        Mon, 02 Nov 2026 02:27:38 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:37 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Mon,  2 Nov 2026 15:56:51 +0530
Message-Id: <20261102102653.272056-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102102653.272056-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
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

Add the ADLINK Technology Inc. vendor prefix for device tree
compatible strings used by ADLINK hardware.

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..6bbfa5619ee4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -70,6 +70,8 @@ patternProperties:
     description: ADI Engineering, Inc.
   "^admatec,.*":
     description: admatec GmbH
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^advantech,.*":
     description: Advantech Corporation
   "^aeroflexgaisler,.*":
-- 
2.25.1

