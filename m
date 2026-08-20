Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4DF3EAC68
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217716; cv=none; b=ldMQlkFoNx86JqZsWF8PFl0ChipEsN4UfIrxEXT+Bn20vor/G20qDcXSoqROtKZyUwigdYZENbfnwTljP52+MUQ9f2jvIPnlBhkPqK28INNV+O3hqWrEPmBZuo56XytjVZTfKRZLx6Fmk/sExkVjP0L79oPEQF1HyGXOVJloUlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217716; c=relaxed/simple;
	bh=zoXA/2oGykS15A0P25Z5wlUpKUfxwmJ9PVDsX46zH6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLffU4S22pjAeTvGuRG4IUC+E2EJC2+M9kKzDgqWLupidVsJNDhZUKzS+qLvxemna9Bk2pqkh/Erfedcb9CG/oCQjyQtQFpvK4UY8WXn+bO6vwQr2GJKxnRN9+aCqKkPCLsgz3LZAkAaMt0iBbOYzSiLfKxWnC2a/ksK33SDO+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OFBQL0OB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OFBQL0OB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so23033955e9.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217708; x=1787822508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHco+x3Zh+D/yrx59tyB9cB8wV/dfio0NvYBL4wP8gw=;
        b=OFBQL0OBLw2VW1eVOhHJ+TtbsuIcMGP7OazETB6xpn12NSCySogVkuIgCydi090RwY
         7fQJoWBbvzKHNV7fNvoMKWHxhWE2laQAnZIeqGOK5hlJiQCbpje8e91zju7WOxXLZXz2
         NCkf4CoGTQmx0VisB+xI/msRfTROHGmGU00Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217708; x=1787822508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHco+x3Zh+D/yrx59tyB9cB8wV/dfio0NvYBL4wP8gw=;
        b=pfJGJL5qJc6zwsPNQHbBwlcPWxKixEv+yXy2kXwg+n229AInuCygy+rBEHgpguwPUH
         VKzGyFtjM6IDl+ygoLnVMVfRvzh36d/nZfyoCmA9DxRUquxsj7fSEpKDv9bsbzBP8K5s
         lNRdSWbTndspyqdaq1YZE70pIFPgS5FzWyq+uHY3mdz9OSCDTg1fNYV91alvaT/meLo6
         puaKrlaFOcOR9Dill37s8Bjp8zp1XJTl25uwUimdIxgQMyM3xsjgYeSXEUTnqexNuHyM
         zfXgYq5p+mTlzQTbKYxZswt9cD447PVAPW/igo9edM1VwCgMVb9v8r4w9RLzExqQ3H/s
         Av6g==
X-Forwarded-Encrypted: i=1; AHgh+RqAj3eW05F01uy5UpiLV8cc8cifXlddS6izLhBBsASKusEjbxiOkG5pgHuq9ZCQsz3tSD2U6yzNhtsK@vger.kernel.org
X-Gm-Message-State: AOJu0YzUaentA9mdEoSmGHpCE0Hjp4CJ3dJd7BT1tyRVuG0KsZKgnaLT
	XZcLoIEV6SBfHOU5SYaPKf9Q7bvtcw89beq8JkkEOZg8Y5pgJAdldpvMdprW/6IndBw=
X-Gm-Gg: AR+sD13xLNf01qhsKg3ASRX3eH00EQYo9FFfSSv+KXCwXEqRmQYKzSoyIN4eWiWgPpc
	JcsatjjyvSQluDwevtTI6f6eKCrVfLvOZQabHCYU4Zr2DcttvnSO85qorssjZoHj1l3ZuIE4ugL
	uEaFTNZLah3JalnUsz0Usr7k+B6XxqZqxCujzE1kxpVoO/QO2mBtdtJJywwonLxk7CePAFYmzXZ
	BzPCH1UY+iJN2xQ3oFkwmzoviS3kBdEXv/bgMBZ/yEiRjWy2D0e7UmjXnYWw+CytE33QuSNPwtA
	M1NabTipoSDmyCrSKWYrBTvcQwt8Qe+fDB79ekA9FmUYqiWlC6jGkFR4+l5SosZvobvDJlP2H9b
	24+KMxT8+b5IoJMrG/6/0Ej/weHFBNdHl1QBDm7INe23DkdTIisn+c2lvkk3Mno1OONfRFcAjps
	b6NJauj0/6xMZIgX9TNwxuaTiaSC8hUw6t9SQYLiyobPW8bdvqKl1EutY+SBSVBaFKPtbruQydI
	tAYnI7KjJ7TNIMXTGBabjnC9qquKE55lPOK2LQ2fh1N6EGJpaem6zZkB+s43lCt4W9rqXvguO35
	EpH0BQa3HkFnjDYnk35zMWRrWybD8LHhKxaLorgGyWqgVBpFMaxfJw7SOBKHcWVB/bPepZCqfQ=
	=
X-Received: by 2002:a05:600c:a012:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499aa1431a5mr212624895e9.1.1787217707767;
        Thu, 20 Aug 2026 02:21:47 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd7a9sm165259515e9.2.2026.08.20.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:21:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 1/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f429
Date: Thu, 20 Aug 2026 11:21:36 +0200
Message-ID: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..f94500cd90cc 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -794,6 +794,10 @@ rng: rng@50060800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 SYSTICK>;
 	status = "okay";
---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

