Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECCD405C46
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089893; cv=none; b=DtR0J7TY4EcxGCJ+L/YJups+r8GDAfMu9thFfQhlnAJ6rLTDEbdPFPWSb2O0qkvMEDufAm5qEhAZVAqQ9BTUibUyQnNGTLlMJgr8hjMW1L3DEHv0K6zDQcv/3IGFxui+eWAXGeMeMGh8JKQhIDMBEnrLdsqRGFwVhluoHhm27Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089893; c=relaxed/simple;
	bh=+Hh67PVOILHaAgCMefcB+6yFoZHKO1AbWUQEUScrJW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScUeAuZCJGXkFjDSO6qu3gzhaOKWnH2xVJl1H9oDe5FI4XiVjd5Q1ufZkizNMHJ4kmqA+NQIbWtr63SQw725CYPjhAcwufndoa8LBFtmbEGSOVhFu0wjHw3VXseOp0uca1S4WIEEb96lw2RyBThXYbIBQ0Z47LijZAvHtUpg69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYkVNcdG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYkVNcdG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf55c39e16so29674835ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089888; x=1781694688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCyEbIJgycflS2cdn+qVWDZinKExvA9S1JRweNqMeoE=;
        b=LYkVNcdGUcDVeAXSzGNmptG7XZJXWcJcLhVeJZf3egXGSf6C12Hn0vlYls1W9JUKY0
         Yog6EzplgjE5z2le1IPToUZ8wJS52ygn9czO68cKju/RF7avDdFKIphHBkCib39xc/lZ
         AGCHZg2Eqw8LjdJ2OntO/EWetH/0ahX4PV+CdgstnchFnr9tNihdmuyOIEQG2j+m20X2
         /ftmreNrruHMVw1a6ZNaW8+OvcLQ0/p97JI+QVL+e0B/NQt54yov+SZ+hvBP+9m+IVf0
         b71IKvg3XwrJ/7RdjBPIqgr0x3bhC/NCX8zRVU0ineG03okppziPQrSw+tiLjfg10lnu
         h1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089888; x=1781694688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCyEbIJgycflS2cdn+qVWDZinKExvA9S1JRweNqMeoE=;
        b=GuByFIem7sj5yK7xMfZ7+6uR2LS4OgfMP8F5VOXuWHVC1qXBrh76ARYRsT03LoZMak
         Ib1swVA1HMvJbYAjF8YRYUdOauJQR+9FI5u5FqH+p9DYvxtvdtnWKkOsHXItSD97YpS2
         qVKieIejM7cqIUFFJ81/Vey4NaaoFbuGZ0s1Nns0zPw7t4TrIE8J2C/N2ZxaPmEe4ELC
         Tn9Ax91VjmOl8lOU6Y1tNWSgrFDrIw8LqHo/RPEbVaukKxaHjmvY8L4bAquK5Jt0TFjh
         I6rNl+FH5tu2SyomB7jHZ/kbBedN/GtYgQ9nv27iGWCMIDyJNkQkCg2mKXH1aDyz4rH8
         spLg==
X-Forwarded-Encrypted: i=1; AFNElJ9gIeQrw/fzDmpRdFcITC0R4xTSCoIEOJLicnwA7o8Xdsx3ZkBNxs/sqyr7N+/SptHtLAGQnZs26iiV@vger.kernel.org
X-Gm-Message-State: AOJu0YzT8heXrq9/0U6zIKflZuPXHeKjTpiFiExXa0AvJHp2dqIbV4Qy
	IpE8qyPCeU+4XeJhmsKfLD/Affkw1OLVNyw8E0XLN8aW1cXFnxiZO989
X-Gm-Gg: Acq92OGFMU75rn82CTQ1N0D2+QfdTBZlWXlgldZXpPFAEuRWfK2gUSvuEDXr2hYk2nC
	o2i5m6U02SrkjIYFDWjctxmwQKQBvjgICIOseJVsu3Cr96ghUq9AbON4nsBhGay+JaZYZ9qnNWe
	cotI9iJrtPGRya9M5zlSLsKGCUNlKnhRysNyLui4GCBcWHg6fSF+T1ucvjoqU2gvLIg9pEcSqm2
	Ol6xP2uiBNS2TDigIUD7IZOzH2RzDtbEck2rpCPFksU6Hj9mGZ6f9gpmi/l1eZ2CwlkMoWj1Rzd
	3c3D1YHC3QQ6P4Ah0s3xtHeS9aZWIE02YNESq78TLM7+aruaLmTksI7k6myAFo9iWRNpjsb5rib
	n5zn8nMvAy8mKtLG/igD3sgFVPsybM34a9kvgdeJoJKmDSL7Yj6sxWuHj1eiwwJWZ7fvHR87Zaw
	8hLaiZm+uaLdh6VlifLi12L1ufI7ZBZx/uBlQJUg==
X-Received: by 2002:a17:902:d583:b0:2c0:aa5d:756f with SMTP id d9443c01a7336-2c1ec7c71cdmr207858455ad.8.1781089887644;
        Wed, 10 Jun 2026 04:11:27 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:27 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:32 +0530
Subject: [PATCH 7/9] arm64: dts: qcom: hamoa: reorder csiphy power-domains
 for v8 CSI2-PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-7-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=+Hh67PVOILHaAgCMefcB+6yFoZHKO1AbWUQEUScrJW4=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYQGh6WahDBnQigIxX0k8AxRA7N2XoG0m/Em
 2BxmG4WFrCJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGEAAKCRAVlYpeERwF
 3vLrD/474hk7I5RNcjWVILYpm4xc+LvkBOvjbeW+a2qZC9ZZl7ghSEA3SmvwCPvpAe1GAywpnBd
 zEFL/rIEbAMStB547j0/wQ55MHeR9eFnJPOY2xbbDvpVbBZ6hA/RWrgHcDSD9MqZD0Db/e4qItG
 fBm+6nPeMHl7TiJbh9wexsUFJJjJtCCPxJ/UBzdyVjKLGs1YETWgFkLRPJYm0fpcPL0ErbBan87
 nfox1FhaDgD2eL4/ZkUfb83Lr61GivS/Imdwtsiurd3YVYH9ws8+4bPAmj4KO3LhbRk9i4WqZ1l
 w8LwsK8OPHFmW+BpHBfGHx01A/d5AQMhuylrwZIrbRB3VbCcjwa04eoPAzNh/8GkBn3TPS1YbBb
 59TVbAPVExVaWxJpmkJ2bkATSa2IRUZ2v5btWN3iEMtzH1QguDwlH9yhtS/SOaLMZp5/3Oo6Uob
 4rkLXb21qBYFd1lyN7glVYmECdXOe3Gl+gA2zei5KSeYPz0Jfk7QpMZ1b6V+ectvXjfGGMTFSmD
 nXgn1ot8vTaDAObv3wAu5oCUwqYdyfs/47ViIM7WMUk1+amN2xspyk65jhorUutVGU/oMUF10IH
 uzvDEn75FlA3+/+1UBUY53ePnFcYrN7DarI5aUEdP6pJ2SLe9yKS5CVNZgATmEZdhqZ5YslB4fP
 yH2wC5HAtJ6Qg6Q==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

The v8 phy-qcom-mipi-csi2 binding mandates power-domain-names ordered
"mmcx", "mx" (MMCX first), and its driver reads each domain's required
performance state by index via dev_pm_opp_get_required_pstate(opp, i).
The v3-era camss DTSI listed them "mx", "mmcx" (MXC/MX first), which is
rejected by the v8 binding and, with the v8 driver's
devm_pm_domain_attach_list() + per-index OPP lookup, maps the wrong
pstate to the wrong rail.

Reorder all four csiphy nodes to <MMCX>, <MXC|MX> / "mmcx", "mx". The
second rail stays MXC for csiphy0/1/2 and MX for csiphy4 (the binding
explicitly allows "MXC or MXA" for the second domain); the opp-table
required-opps values are symmetric so they need no change.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4226db30e244..1200101d7bb7 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5853,10 +5853,10 @@ csiphy0: phy@ace4000 {
 
 				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MXC>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 
@@ -5876,10 +5876,10 @@ csiphy1: phy@ace6000 {
 
 				interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MXC>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 
@@ -5899,10 +5899,10 @@ csiphy2: phy@ace8000 {
 
 				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MXC>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 
@@ -5922,10 +5922,10 @@ csiphy4: phy@acec000 {
 
 				interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
 
-				power-domains = <&rpmhpd RPMHPD_MX>,
-						<&rpmhpd RPMHPD_MMCX>;
-				power-domain-names = "mx",
-						     "mmcx";
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MX>;
+				power-domain-names = "mmcx",
+						     "mx";
 
 				#phy-cells = <1>;
 

-- 
2.53.0

