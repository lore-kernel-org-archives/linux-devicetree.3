Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0025EF87
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776620025; cv=none; b=AtEqY9yZMIx4wv3vEBjprAUEMhRmfV49oWa+4uahOC3noDjPJrbjTuh3fsX89cfBooRJQELgEhnDdQuyldjRD+mdz1VVnpYQppWapgqyao3Mfu108wWi+zlMrIifPbYpIX5sf6fi8b3mpHsoccyKnfInZKBL7rCP2nuR7BpRnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776620025; c=relaxed/simple;
	bh=VfP9+j3JJS8OnZilAvB7Mr5mri02iMAluBnOBrDPduM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHCjBGOPJoy5quNYZ1xmz5uWXOOdtq80Ah/2nUu8Uq7XG8BoHmmC6b11t0TGioJFRW9j739kp83dDN/uThPzdSTa9Y+a/AlRVNztoIh2nCpl+sqaOMYzn4ajGoa/uXbxSGGc6S/XJuik0Xbcg58jzak9DY3FmGUx9SGt7qkFwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7lLwrQy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7lLwrQy"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296d553142so1334887b3a.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776620024; x=1777224824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ3KdgLgxvb6g2g/BE5TW9o0z4+hlSLHmQpjSJrtIyY=;
        b=B7lLwrQy+xsG71sV7qOh6U0lnpQpJHKd5MoqUei2eguOaSjCgtiLmnXFPZVQvFdkXa
         plMvO5wBliQtJa0sPqbdX6n4DZojUUZM9x3KWQtqmcPEIKSmJcqGpbRvCQVu8XGG9diH
         9NrVP3QBjxrq1J5xnree5aAIcSYUCbhZ0qDL6lRel+McVcDaNPvHGqzuVXVYiM13xkwv
         8daJtHCB4jDNdbrmfM8nXv/a4e71s5eqfqV4xt4zL2qakjJWxFBUw3ciclCQoh6MOVce
         eUMm9ZNfp+fsBHhIpouvdtQ16iQqRo9pRXTSNtwcGIW99tFEtETL8hEzIHsAgiFoGZV5
         ER1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776620024; x=1777224824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ3KdgLgxvb6g2g/BE5TW9o0z4+hlSLHmQpjSJrtIyY=;
        b=CSrrcjnRlMJY61JMYeu47VZgCXBCLNBNaDwSbQIACr8FV1mIazsKmHFii5K1vAnPOb
         59ZNH5YQGblquE5UudDFzSOOfxj7jGVmT7JekjdqgFjfq9keSXPz6RfVappY7YjVTLpY
         lOz0PmuAckmAEmDeEPd1Wxle1mBGA7Zndx+jxnnCj4Jw3J0ypRB4E6wBLHl/SUSkUk8C
         D6WftMbHfuAcc3hP1G6ti/0GxKrCKGw0UaVN39W5l453u3xrQqZm2HX1Wsb7sFYWi3n8
         I1X0J7rtblHQd+ihaplbDrQHB5MjRV8b9QA3zIRnL/zJYqqwP/AIpeLtOf8a4IFUr6gi
         tp6w==
X-Forwarded-Encrypted: i=1; AFNElJ9aiZPhSdzV4dO7EM9QENaA5gFuVkUPleYW4qd7OxnH6VBNK7BMaxPT0tFq8KjPVG2cQlheZBkURHkE@vger.kernel.org
X-Gm-Message-State: AOJu0YwNk1LrYaIIWjyK6kpV1579n5jU+S9U6c2dhAMjs2/bqEKYnSF5
	SfG85QJHUA2Ccsod2haU/7GWyAqHoH2HZYkbgQEAnCjMuPEfLQMonPOYtly70h8qpS/F6A==
X-Gm-Gg: AeBDievo9E+OS2z0PdxfIzJylwamwoaZxmhU+8zn6kTQVe2WgDJY8gtvz60vy7JNHT2
	cgS1vLf9+NM0s2Ei/LoBcLyrkIXvYSVLf0vpsn+c0uyltF3hPiDdJCGWsK3HSY55hkQa8+w+WeZ
	6N5Q9GbtSceiAXI+YMOqFlDbwRTGhsQrautKGFDa1Vymh/1seIFTEQke4lamxO1hHtaj2nVBbfC
	BRIeYKInbEnDhCwshtheiTiYbxpzjofyfHPCcbs6rp9x3RSXHyB8Osgrk5FFJuoDI4MQPKtWsnn
	7F/slbUPvi6VXwBuM794f+TkDylad4XWs9n1g8S3RfgsWQVuUaQpic86z8YTpqIFIT8KjaodOId
	qF4KqHYyRHInRRa2GBBu5bm4+ymoi9i64xJfeyfmbgt9aIBT3TH2jarqDSKdCzSZMjwCJHjBVQv
	UZjImatm47AXKzcg==
X-Received: by 2002:a05:6a00:10c5:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-82f8c830fcdmr10858118b3a.19.1776620024073;
        Sun, 19 Apr 2026 10:33:44 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::6c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm7954833b3a.40.2026.04.19.10.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 10:33:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc map entries
Date: Mon, 20 Apr 2026 01:32:49 +0800
Message-ID: <20260419173251.1180026-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
are mapped to them respectively, so add the map entries from pdc to
gic. These entries are reversed from .data section of qcgpio.sys

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 8d526ffede36..fa1bd27aa16f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5365,7 +5365,7 @@ pdc: interrupt-controller@b220000 {
 					  <211 699 1>,
 					  <212 705 1>,
 					  <213 450 1>,
-					  <214 643 1>,
+					  <214 643 2>,
 					  <216 646 5>,
 					  <221 390 5>,
 					  <226 700 3>,
@@ -5388,7 +5388,7 @@ pdc: interrupt-controller@b220000 {
 					  <252 798 1>,
 					  <253 765 1>,
 					  <254 763 1>,
-					  <255 454 1>,
+					  <255 454 3>,
 					  <258 139 1>,
 					  <259 786 2>,
 					  <261 370 2>,
-- 
2.53.0

