Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650577;
	b=vFtJGI1ks/dhpCKOP9UOxfJ4V7kq8f+KFjFdfF0pRjAPYVOBbPGiyuCY74jPKNO5uqQN
	 8t1yxWju6jJfQL75xOSOmRD7XldYtMhJGjr4XP87xm5u/uMU8KZPL1VTSlJJMwJy97e6j
	 l0E9i150Zp5P06wuXqBjuUaJqmdzCK13mRmlhl0fh45cVKHicyqBwyXhlf7x4tV3C05PJ
	 KNLJ918qw/qFiaMfwpllm3RJFGNFkTYWDIRsUWpwlu0Fw8ZWXWXflVrh4feL3fWGZ+160
	 wW00m42E6Qy74UEPyQEQCxW+tRMCM7JmnlQtdSR5fE660uFMv5HcTbSoCmufxh7ETvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
	b=Y1FwgzZ6HbfD4PFdSP7whJgt3ud0xPbCJH+Oj21GyjKKghOhc4uKRB/eQEWXUkMyPPBI
	 rOT06LEwghwfZnMBYau5GKQGotJCKsvTeMaM5zYPFAXALAIqY40KuZ84/6FVScy4QUati
	 KODXMp2XXmUhqvwMc+HMiR/u7ojF/zjgDYlo50ubbzD/sfot7BaurrtWw7p/0kJCItlXK
	 ubCMeuehujWPhe5hIk7o0BOka34lkohHEIRHHpNzfUklBQSHw3M3R82u0C7+WncBw5KSR
	 4Bkg+Amvykv0WefykWnK2mqLSBJojwRapygGG2STpHFFPSfDfOZj/xYWfmD6/EeamYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ph8O0va6;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574FA606A32E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574FA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ph8O0va6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so34867815e9.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650576; x=1794255376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
        b=Ph8O0va69qi5KtzeMAZfOR+XDswm9owVaSD7cGWwAQOJ96+cj8DyDmSW9R9AqpSRi4
         qSmxp5fV32iyNS0bzLuXiMm6IDaPiIah9HKWcvPAspPHdsBu+4ga08lN5JkARu5OneY+
         WtcH1ltRJI1RFnuHq4mqfFog7/KanXx6yxLLcYS+/YiINNRA99O5eekCF1o1hw8+KROh
         fyQYMFqDXUnzrsODZWc+ntNXOGuWG7+3u/aocO/UAbmc62K1R464txfBlM31BxpZ5BfL
         j3gkGR6vZ1v65LHnizKzbdOttle62TxIbDRLXj4tPqG8eWMB0++KkAsyZeaRiBaMyjD/
         cC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650576; x=1794255376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
        b=g7NHm50LItAuTpm9jJQjnYNJEWY0vJA/ZpaGuZhR1oR4wQK14gk2q9cy9JM3Hgg0wP
         7Gyhw5IPd8ET8eRVjWiket3ANR2+Wg3Jk1Btqh12/HhIg8IptbP5FvoejP/i89qA2Atn
         uwAMs6H4dhbFNyTwEYCya+P+qI2LADvTanu2uvNqm58ClDInrjUZbNR/jsPFrZxTj4jQ
         apdW75TXkiGaY3G39b8t5zyGmpwQZB+m3onvSX+o967s9nX/+jJeJGt9kP9M7JOHiuCI
         mRJECFgJ5jSxf6wVpdTJcJ7SFgD+E8INXfDwwlv4xbViXRVHI92/J0Tfa3bLL7hiYavb
         Lgjg==
X-Forwarded-Encrypted: i=1; AKwUvBzS/+UyIFTbp4AnHY7wIJ6E3tV3cgbVABxELw64LN/L+wAlvwAL9VvJ70fVPdGPAUwJVABrU0g57HdF@vger.kernel.org
X-Gm-Message-State: AFq9FYJV+awSHCNJoLcIxBL1qSBKx9SzuWlpD8p4OAPF7SBEtyr/FT/f
	LL9Ncs3U2PcIocQqo6dA6o1c3h0Syx3iRHipil7I0UNbTHiGvRN6Tbst6qZttH85nl0=
X-Gm-Gg: AYBFou3xiMxcRGNxQSjTmgToQW1Gf2jfyZJNmI3+rIacRH9RWS4WzY3hS3EHue+X7wP
	ZAgKDgG4urAyOlKya0eg8NftIA8cFa2OfZLqFbxNqgloJtX+qSgC9AOsLo8QoKYukhnZNGL1UOS
	4UGi42kJYIl9z7ui1nKIqeQUevWSk1qh1Fx7Lm4f+MmcPTmiIvE4dbPa2n5SH9ztznid9lgZI3W
	X1CP1//oqyeAXsJEjNE687O7wmKbNsfG2z+M/hn26BDmNsvQjIVLvn+goeTmh9W6qrP9Ro4zjih
	+fTYDQkIgcMcOB/bnFLyS3k/LSNz7EkFiyQtJ2MKRNQxDcoUq9UzQNz1E1K42GpnEUGcE7VjChx
	0UoGQGm+8V+dv3D+JEEQPhwyAoLmkoqHoILJR+9krrS54F+YIZ3B8q6v/DkAwc1IafaR3o+fakp
	yjHeUOOr7kp+MRG5pUr9AIPeGZTSjgkgcD9TYc6M41FdegpzCxSDaWpC4G0aZ0FcJpGWACBrTro
	oHBNHmX/7INc/oo8zy1UwspfcW1nS9/s2juJRHDtnsiUKroVrzBt/PD23hKMFRyoq7KC24YVeo3
	GhtBS11lyY3KF2I4ewNsQwiZahFrJ/HP9N9lH3rZzfZCWh9MWToktPkibs5C
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr269807015e9.29.1793650575803;
        Mon, 02 Nov 2026 12:16:15 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09bcc967sm220013905e9.3.2026.11.02.12.16.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:16:15 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: serial: ingenic: Add the X1600
Date: Mon,  2 Nov 2026 21:14:59 +0100
Message-ID: <20261102201459.49284-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's UARTs have the X1000's registers and 64-byte FIFOs. Add
ingenic,x1600-uart, with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v2:
- Drop the driver patch that set UMR and UACR at probe. After a reset
  the X1600's UMR already reads 16: the 0 the manual gives is what a
  clock-gated UART reads, which is also what Nikolaus saw from U-Boot.
  What needs fixing is a value a boot loader leaves (the HiBy R1's sets
  8 on UART2, its console), which is the boot loader's business, as
  Nikolaus said, not the X1600's.
- Move the new entry last, sorted by fallback (Krzysztof).
- Add Krzysztof's Acked-by.

v2: https://lore.kernel.org/all/20261024220712.23250-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261024051515.55639-1-olivier@mgcrea.io/

 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..0c452f20e103 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -35,6 +35,9 @@ properties:
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
 
   reg:
     maxItems: 1

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

