Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C28223DE9
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896742; cv=none; b=hUV9gidQVFk6V0B8uG1EjpfOggQ1TtHTw3L1H6G6ALguz9ZVkRwqi0detbOEIz/cRg2zKRg+6WFqG9xHSNXhA/tr+NyaGDbLCzfsqk0LsAmRVT0tVwl9OJAExSTfOZoSCeLYBniw05xWdpHfSYPrSeWBEymbGJw26jszx2nWjLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896742; c=relaxed/simple;
	bh=L36nlBpBnY281FzOJjX0G2x2ETccgVsQym4w89qq/L4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u1FlICCDAoqfIQ8y/bDD5wdMh+46Tbg2eMdBDz8A6CYzvD7/+VgSqsv0EuhL6weRRM3w7MKHE92Nq+lU5GQySGlMjFEzs3AW0SEuWj74b58S3lOxPIAdRrBnTiW8JrSR3594Glc7kHed/Rf7GMPM4A+N12lGVZbvMFUQnHhOvE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQm2GqOt; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQm2GqOt"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso2429919a91.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780896740; x=1781501540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OigwQgbSy1UvoaAKfiepGyHvBWZutBpwSHyT2nj2TAs=;
        b=WQm2GqOtcWhUQZAiaHuNHXWHHqwbxhG+1duHq8+pC/bAmBHn/Cu8Nmvt1FvGHhq7kl
         spD4cuf4kxka4P3Xynx70zPIJA/gN6xaL/QLW3SATUvCnpBTx7PWJX2Q9jdfYBT9IgSE
         3UchtAeZj59VOxWj60Z4U3hNubIIQE52nujaokf620Xc50oV7gb0mIogalnop56rYBIb
         4IZbtCFDnxUulhUZDxq65hkGqlFhjZNuVyKS612+CEQY6h8fn1gZBzxiDBuUQg/czX8I
         q+gM8gQ9qOpmdRWH2LvE8QHK7pEYYj5hZrgybT0gN3eps2X9A7KIwnYwmv9Y//xyMHzT
         wS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896740; x=1781501540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OigwQgbSy1UvoaAKfiepGyHvBWZutBpwSHyT2nj2TAs=;
        b=mH5aklqRXaoR70sAczju9RfDmEN0x1Qp5nn0P0JxuPU1p5okLiC19NKymz8+HZgKao
         kauATSklXR/ysIBVSUYmLHfwgCzrFhtn8VCmEjh+UwpLFjC9pCPWeCYbV1eDaIHi4cPZ
         Br4kuerFFL7Ejhgm6tygiSeHqFG8PfmipFbVTJPuaYBuJWD2YzIz0LtH+faLN98rAhal
         rQ5x/AlKBwYyEMbSdXWoKXDPoBOeWUOnlYuihS1ovjwddmNdj62XfhzAAlJWZxifmiEO
         yMnB/6/faeQXFmAAmrA5CvX0rgvchQqWVjZhjI9le1crZGNY1KkL59qpRgDo8HYJ8aQr
         4y+w==
X-Forwarded-Encrypted: i=1; AFNElJ/siIofHsa7ZGuyWJjLLB2uNNZSMNNpOXQcQGssKV27ASPXmXMBSopPMaziQxd+znueRgYFDJmN0elY@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLBjCOvSgcHJ5cgAMj0DBptvWuMJHo/md4qsDmDFDPxVkJRd3
	uibUsWqQUPStnuvC9yYlkEuEp9nMg00FvMkPZ5qvU1Bog6V/OBUdtUmyZJ3Tz0P/
X-Gm-Gg: Acq92OHdoDKzGUxBH4Knf2wdKdfPeVJzynezDOpNRILonxqBV6/RoJ4lfMlQnq4w0Wy
	n9tCSnKcFdmZ9YoWbF+MdAasYhW+5BzYkM/05oVU32P5fKxdKqdD8UGjeLaZ24bjt3mneceYu77
	sZu9ZsRZ1sWR0OdP/Z5jf6ThSGo1VdMBw+9jGpMSwYjudmaqM8g5PXnoHVLze0R5uGiJ1gs5Nr+
	4ZP9AaADeqJk6WMP/dw2KYeiMRaROfNouiinSJVYSd6wQJ1D7CnKl4cTQ/l0pOHhA25lsy04UL3
	s4TgOrAbLRtCBNqBZMWodWLlrHAlvMEj3OztlOQs4Qtt/+B8+pJmRTQZUvSyY3K275K0gRAnpFO
	ACdi/kw+I/cW7eBPSNGOTYJE1oovybbgymz13GW7lCCxrVE5pd1WfNVqzms1DKAX/Y9aoV+hH97
	rPW8aK5onOHBGpQ6itwm809sX7GRhDB0jzsPFajxAqIXyob7FliIHNY33ZO8CPw/uaOn7fb3dpR
	lj6Oq6+WWljUrp1sBgRekhA7T3NDMILw3g6i6/uMh0ytw==
X-Received: by 2002:a17:90b:5345:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-370ebff342fmr14191018a91.0.1780896740281;
        Sun, 07 Jun 2026 22:32:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282918b8csm15867411b3a.57.2026.06.07.22.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:32:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mips: dts: ar9132: fix wdt node name
Date: Sun,  7 Jun 2026 22:32:02 -0700
Message-ID: <20260608053202.12004-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following warning:

$nodename:0: 'wdt@18060008' does not match
'^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml#

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/dts/qca/ar9132.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 4d3c48a9f9fd..77225ed459cb 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -98,7 +98,7 @@ pll: pll-controller@18050000 {
 				clock-output-names = "cpu", "ddr", "ahb";
 			};
 
-			wdt: wdt@18060008 {
+			wdt: watchdog@18060008 {
 				compatible = "qca,ar7130-wdt";
 				reg = <0x18060008 0x8>;
 
-- 
2.54.0

