Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA4403EB3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089862; cv=none; b=jcFqZ5A7nvFXwvyfMXonaXphf3qn3OsALuELtY/oWTAuIYlUjLcpCpZtGGNZr9+r+XDZ2A3sHf1TPMlaFiJ8Pn2nc1iSNr/5YVQGdwKbNGChhqLZCy1UH5zcbUOyWpmb0uVZ01KuBaGdJyMDCjZ/IQYMaGz2MFQ05ybA872ophI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089862; c=relaxed/simple;
	bh=XHn7KPrJ2p0ewsN97d6TWFtfPpubwutN2aH4bFYak88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFrPaXIipuC57QCEmRYGdIr0oz/zBTdGMhyToujP6F4V8Ovm9VB57gb2Ja3s290uKjJcyiVKpZiZ19dEpjvZXpAe97OQJH4G/30BFxGVn073SuSZyLLbUdgmPMuVR/yJ7ICx8oc48UDkzUjRJEX+VlynGanfgZGB4nei63Fu8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4G329sX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4G329sX"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so55702165ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089857; x=1781694657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPG5xL6X64inzSZqvGNNgIEqvH99YJwMXuPIgK1PxVY=;
        b=V4G329sXR9TGPJ0o7W8pSRWUe1t1SS1ClwHEoSOUNxqUB6abxKEozkX8oapYjNWyoW
         UuB9Dd7eq9xSFk71wQ9x2efNKy4NsPuqkNAmfTtc1d6fVnO6SafsdtusdOj7BCf7Mv4i
         kxQVNqoW1c3eSzzMX0OlB7EHaDEm6r/DHAFEfaMelUELTENZReGOOaO7XVlFKtC7z7gx
         tfeMpYeJL5BYrsPWcyJhAGpPzKZlunM/ZJ4lFDSWu88+r7eoqCnhMAdiQj7tGjnOSikc
         GSHGb6iwCm+/PaI8G6tSFzv3/OehaugeWJM+8a9ls0QZY8M0a4idofOhoOyZXUnxfUOG
         rEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089857; x=1781694657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tPG5xL6X64inzSZqvGNNgIEqvH99YJwMXuPIgK1PxVY=;
        b=KFMN/adyjCifxCx4Iu1EOG/nQs0jATSJecdnH2Zikz4VQbmXAgNaldyXuM06DLVb7X
         2eelKN9AawUlKgogwWbAAs3+FMviuqck8KfTCxU/BrxEQs76OdaQMHCOlAt0SuBI6Q0I
         QbZwthM3YKPD5beKrJsLjbJPTOJoRGgGhlc1QLVZNUP0O05BCT/VEh3ORnRwKvr6y5Hl
         kRXre+70xrvE501BKWLsfwzM7OrlKsPb9Tka2Zm3Rq1NfvFMVrm7nD6c1uibNlQf4GdQ
         Owj/7seHmoVqkFycDiYl3jVlCpadqtouUmevUO2tPIvwePM4mv0rjsyue6FJzqQ4CRu8
         tVmw==
X-Forwarded-Encrypted: i=1; AFNElJ+FMTzKMiUojXGXV15l72z7f608PNDNkaPcZChWJhn2trGJqAx3YHjoif2sOQdenysOIN+uOgFlZbGK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6BzSiJ0HcM8WW4syuDGxX6x29bMe6hqc+esADHlQkCBv/ZgvP
	cDRUYwQ4iLA+Pyh12FxVYIDLKeMzvpuwRHzHpuj/gm4buJZF/74rIY4z
X-Gm-Gg: Acq92OH01TsFPdg9eEzkrgvKTWHob6mCX3IJLi7i1ONfB4rbHQs+9zTyaG+7MfxvHZ+
	Kfp7s2m4FPrcH7xQnedzNR1Nj8mBuSdJ0G2Xu3FAej6Tu2Yve3U0cFC2kz8oNEOpsLW8yy++Oxe
	T3BJ/Uwn2tdaU3EMvRo9w76XOiFexprO1qDI1IZV3s/8lYahkT+p7Zs31cQ9dYvJ28BDWgc64Us
	ofgL0waiSHBVlhKsqYzSu6NE8SS7w8HpyXgr61I1Qj2zlI1oLGMpTihNoqD0Q8FCpSDhwukRDec
	33gNVdiegRIUGlvn+F0WjBtMXRoRqRCOtYpz3JPgMMBtNxder2lytQqCshYtcziVrCenpOTpRKE
	p1tug4S17U2V+m12dR2ybKW12Nhe8f3opy1QDoSwsiI2SqZGo5wLzZxwX4eVWkFrcp8K+pvlrMJ
	PynMEyIBwXMZsMUKBdh7JHXiumyJUk6HMjyJZBoLKEmsfxFShH
X-Received: by 2002:a17:902:ecc3:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c1e8339808mr278966455ad.33.1781089857057;
        Wed, 10 Jun 2026 04:10:57 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:10:56 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:29 +0530
Subject: [PATCH 4/9] MAINTAINERS: add entry for the Himax HM1092 sensor
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-4-0c9907da47ed@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=822; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=XHn7KPrJ2p0ewsN97d6TWFtfPpubwutN2aH4bFYak88=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYOY+2bxqPX1ojdxk+vvzgmcLZnSyOoaAYMQ
 HpRDlIdPFCJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDgAKCRAVlYpeERwF
 3qDsEACjzb9x/8nckfrFGo0m5UCdxAiUwRrnwyY3IU+svHoFZIYklIViyHgK99TWKEme6Rzj+Tl
 7hCc8VP8aPvNBTa4f4VbAFPTboeLZaJ3aUk025O6s48y0w1M3gM4DCE64PaejgoRkMosAvJB+tA
 DSpV2dvKVAcHscHQ1hIJnBr4YHzyYDAlcDi2XSgmYTQhy24owgngdMiIjULBZo6pqyrGxHI2PC9
 Yzlwba0LHtLgBR/aRUSbSqAZVzbnFxIz06bdsEXcl4MT/lsT+iQ5S+C04vOn8tnGJqmlMPcVQr2
 VAn6ZlyxG5qklxons9I2R6fMXzxjyT8IGpw31An4ix2W0rEf28e191Q11toJgcDYuRCA9nULjNd
 r4lERaJ3ELlOg2KPmOLh9eEbf/w7pmo5lxCSQe2N6qkzxu2iA2lA+HNFp6KzjmOl6rCqJBkkXo1
 nmvkLdCoAU1Saag/vz4OX6Sek5ayCX+Fji/GEaMsYdsmfH03mLExJoyvcoMxMN7WJMXzG0Dd/Q9
 g2y83UwvQ13A20GKRcxiS6ImZXIaoU9EP+BRevhPxlJt7V5OMHlF58/1rBoiT/wPbd+YbESwQUx
 f8MTtEpRj9WD+Jms4Y2wSSShDOln/Z7BhsL75NMHMg4hWWd2JssyT8LXZViHyFv8s+TrUsCC68f
 yHhNgvuRKASw2Ag==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a MAINTAINERS entry covering the Himax HM1092 NIR sensor driver and
its DT binding.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dadc54fe2bc8..ece71732e6dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11643,6 +11643,14 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/hisi_hikey_usb.c
 
+HIMAX HM1092 SENSOR DRIVER
+M:	Ramshouriesh <rshouriesh@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
+F:	drivers/media/i2c/hm1092.c
+F:	drivers/media/i2c/hm1092_regs.h
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org

-- 
2.53.0

