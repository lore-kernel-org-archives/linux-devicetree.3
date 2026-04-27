Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AA3043BE
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320776; cv=none; b=LJ/brdTIK7KilwR6aDIFjYkrdCw/GyVeXAIuo7qZOtiE38f7nYKSCW0zg3MHzCuGZQ3avr1jmpwRhTdgswr9n80FWKKy05FhgoC2Vi2HysaHp1fhTZ10GOVNuyVU7RVhD6ODfzQZizl2fHH37osW1S/dUdQBWD+XvCY5wpgeZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320776; c=relaxed/simple;
	bh=mBAgnSsUNn3fsc8pfQtWtaiDDL5qRMehlyaAO/YC9RA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WQXYuC/r0vYkf0mMAolXsOjhugAsh1SrHPj85jo1wgYAve479huOXI3hWHli3kFcsfF+xCGRvzNJwlckjjHWWpArc6jcmuWEoEg3fkGntvoGB1P8rPDYwG12dK7NYs1RmR78nfI7ZBWNF4TOVjZ4BUPnTUmY7LT0FGLfERlrHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LTzf0Djn; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LTzf0Djn"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-35e576110adso7335074a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320774; x=1777925574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6HrkrEMv+Q+KsECCy2j5IGNVAW2RVCs/l06xUaahDY=;
        b=gwI5vkqDaS6SStvdgJKVoPp/73HpTWovlgs30MgKFnrjJQV8PLk8G6qv6Fe7vHgNij
         YHtnh5ZMcLbQQy2JmmGKFVSMLKC8s379XjiTlnN8Mzxns39LV11355Fm2Np352FlCtC4
         lqapQfNvXi+kN30xMJHDgW7EuHgXpuc+x5+8gYs+4Y84J5D0Ea7KtdLRCSuNriGg3Ox3
         fbzm8a0y2fM1SAOfkcLTCqCTxRPmO1FNWydnzGXxCnyPnY6cUa6mMr6xJpx9Ptohk+pl
         0U9NaD1apuK8EKF/b9fYoPso4CmKn/Cvke4BMN5doLjduk00P29ie10FJ/SHxCzdL9pZ
         fabQ==
X-Forwarded-Encrypted: i=1; AFNElJ+76W7ZQqH4m+cg8hJslKpOjxDGDTOVJBZc17Uj93riel8JugKDta2vIxJg8M16dTGX3UpwN1w3kQy7@vger.kernel.org
X-Gm-Message-State: AOJu0YylJ2g6iG7uaAOi3tzWC7i4s4fP8Kg0if1PHPO4fS7/pgPtfePN
	8/uWzXhiZ6b5+eO8o/d/YJOGy+j5YI1zUpK5scnL/kX6mF5ZVCvZh+ynJExP4oi01ErWXwbJ0jm
	yXNX+AlJ/WOFY8KZ0YQVUgZEr/2SgAhwOu14/vPOthnoYjH8We7DKpLsPBTmxCTru6pvYZBsY+q
	6stpWW3qfg6qAqXeTzeD4pv7ALPbRirHCkLTo+KHWA88SYlwbRzmpBrOEsXj9thQu4BylP5BLYi
	XTVti8GWtfV9w==
X-Gm-Gg: AeBDietuzbt8wCPlpSBdlSlANqbjLypYdMU9EIqBM/SOnljA8zTSPfK5MnGt0twwBvg
	3cyNqtU0yD/N8dJ3TQEChUG2ruRCT7X//rN59pEU8iFHLOfEaeB+WC47zciwcNLyc/VrAgdHpdX
	tSnjgg6xaw7l9+WfS6yl8cj+aPR15s73/hZw40+Lz1tVhjSC0Bralos17zbIqAyQxfMrJ2nipE/
	Gw67Af1yasae3jl1qm77JSFNhaMImdpyBCJzMBfk8BipX4qsLgG7u4GSNSg0GO37RXbsOIBQVh6
	netWRQaseZtpi1D2gtzLM4v6SPFHEwHOs05fOf2dPPakk4plzfcNd73act9QIp+ejVfS/3KAOcS
	DvIBSOe6thAl1XqdGSrCMJONr7wLkL/YmzwIIp7n8N/tlpNsUPOIAESYWVvvkcc1Y7NDqwJ0VZR
	qql0SyqL+/3iB4cCmy1RknsIMQR4iqiN+LOwRtJTkiqwx77bPqiOEwEnuj77+1YQ==
X-Received: by 2002:a17:90b:48c5:b0:35b:e4d4:8290 with SMTP id 98e67ed59e1d1-36491abd42emr182292a91.9.1777320774452;
        Mon, 27 Apr 2026 13:12:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-364908e61e6sm24639a91.1.2026.04.27.13.12.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so9540714eec.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320773; x=1777925573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6HrkrEMv+Q+KsECCy2j5IGNVAW2RVCs/l06xUaahDY=;
        b=LTzf0DjnQdOVs+eFKAdGOQJcbwVDQS+sxGHPI8lkzd3/2rMk8STdgrFFl+PXAe3wCy
         KJ5b/laJdCNnJksgRRfuNe3z0Mj1pScS83IjaNMvTMVPKqCID3TrtrwBKyj27fCRM2gm
         o1dlIk4izQUSPOVPTBKExYAOy9M5vW+RWn728=
X-Forwarded-Encrypted: i=1; AFNElJ8nK6AYJ0Hc6T2aynbQkHShL+QyPGBIgr0UqJqABNRHnxcbPss2ZipGP5DNU8Jr0NO6svHqTHqB5kgR@vger.kernel.org
X-Received: by 2002:a05:7300:dc85:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed0a530457mr90796eec.11.1777320772628;
        Mon, 27 Apr 2026 13:12:52 -0700 (PDT)
X-Received: by 2002:a05:7300:dc85:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed0a530457mr90770eec.11.1777320772079;
        Mon, 27 Apr 2026 13:12:52 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:51 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Mon, 27 Apr 2026 16:12:33 -0400
Message-Id: <20260427201233.380314-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Adding myself to the maintainers list for the hwspinlock
driver on broadcom settop platforms.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..4f3dfc6a090c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5244,6 +5244,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1

