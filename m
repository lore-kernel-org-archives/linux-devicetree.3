Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785123806D7
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261765; cv=none; b=ZSihmTrLjEflCG9ESu8OEq25aVzZpRWuGCjdXwOX0LDONUlalO+SSA6cc5AzWp3qZbP9RPCIFYFUf/sIMRcadQ3ilGFBTZp7kxiX074YmnD1s38AFabEpAAJlMpK7DL5caqoDgO58CechZ2xlFaLqdgg7vZKUAVAF9Z1n6iK+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261765; c=relaxed/simple;
	bh=wFr5Y86M5KQ4p0pgwW5LDGp7lkP5OjBgz9reRpjmvqM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cdvrLTGvaz3Z98fnDlJi3o7uSBo8GBlpiUhjMLIDxhTpWFDO5XXkfGkc8Tx2fxKdWOa9wBmf9c1uj06Y7vKtEbuQOkMcZ5ExtVQJbpCstNkZ89A6CtYjX5FHuzHp8/045fVCdvF1FKOUEsljnn7qTSjuATZYYvwammnmiWVIltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UBalcRBn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UBalcRBn"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso154161366b.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781261762; x=1781866562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBCl5cCfEjB8KtDNmXCPzRhVFXfyDWsOPQ9sKNOvYaU=;
        b=UBalcRBnlIAfFUTrVUOe6LC8D7vMqKFrbOYILd/Dx7UBXr1haQCUeD5f0aJ4bsCncy
         7HT1y5iv89fKN/ObSR5cT2DJXE1Z5IA+vbpZkmSptDnMItaeWwPj718FdYkrZtExwT+o
         deOZT0fhYg5ed/di8Mo5HVZ3YBb7gWkoN9dpknyG5Mbglb9lynxYRg536l6e+3nOMg2p
         xDJSkVfyn2lRUVnHz/brpe/2bfSeMZ4kjgXoJALEGGnFFVy/CcsPMtLumvIA3bM14cWb
         89PHleGt03sgJZXnkb7FM35piPHcZOR1Ixh70Dl7RYjbyS2aCgXgTv8HTzNU19js+6V2
         4AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261762; x=1781866562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBCl5cCfEjB8KtDNmXCPzRhVFXfyDWsOPQ9sKNOvYaU=;
        b=KkngNG5QoZfzkw3WwzonJyPq29siMq5F2okiqJv/dVMv4i5DnEYiU5GNMqubdezAv3
         lNWkCSu+OXKNneVMoAgyOTY+It7o2OwZrUj3ll9D6MwkQwTh/DhngPrXkXXrTE9lF65n
         Eq7JhbUhJuMo08TXVHeGYsh2PYw96P3L5pclF91Bg5VhT7oXHf+CJ2ztMsNanSoeuUAh
         +QTQm4fuN6iIX4EGG4o6PN2c2GBOtmgQ2L+xcxvjvDOvGKm1O4v2pI068A1l+H66jNoK
         Bl6/UQFtckVOUo/anMp1ZaG42xoqk5PU0K9mYKKbWUYxnLxDztZYKmdjN7LaiKuMYHew
         HB1w==
X-Forwarded-Encrypted: i=1; AFNElJ+9agej8PTW76O4AU4IARPOIt+fFnsXGhv+hobdVc8eQ7JiaFraH+jo9PeKhWLRqA0X8O+7yTGjMmgI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+kztyvHJEdmHtYk9fPVA3b4SCXzyziubi4VnPQPIxp2B/evi
	v2swmr7NoPEZ8hU5ozJ5TGCIyW3OSuqcJ00vkJdbpiY7fJPzbHmbYMWuNhAuY+g1ASA=
X-Gm-Gg: Acq92OF8aYt0/5W6BXdqcPrASBP9mQI4cmkttlBebiXiX4SoOU4OEfnfrX5A7+G+agD
	O0MVMP9J73bTpbTNQliMoNlLxhDlGFNig5t6pgZFPpmyaxPkPt0gQMdFNF1NLpk1cBmqDj0O1hl
	iOsfVCDcK2UZbY/wEWh6uvHc7l0iaWm4kZkS9ViZ6q7+AOJNkkROmpwhvTUSWN1Y5lBPQ3t8vkK
	75lggtmkIkQDNiP36GJ5FmpU/yN2YNRykp9lKwLFKNsr8+7dnO6Rn6jWEb1i2Sh1YnqEtzvbnj8
	7NjmxbzIdMaUPH3J1sFMlA4JszhLqdK983Uxm6b6GLBXtr1hIIRrW7W2Nt1zVZnVqNLpgBo2GSP
	UhIE/AdY9FiYRABkJa5ATgGytSeMhN2k54+Ohm2rWBo1L5/Uyj0TZX5JNlZq0sDQ//iqPNTOobl
	z5nlazFGmNX8iz8yxc6vNa++s7+mYyG48H1JX4T5iBhhYyg6QyCIx6tzTz9DY8urZr1Vo8pu+cg
	wHUm3oF/4d6oGV2YUYUA9n3A/rmU6FNT9gVbRu/6FlwWPdX
X-Received: by 2002:a17:907:c308:b0:bf4:9f78:8399 with SMTP id a640c23a62f3a-bfe2acf357emr117904366b.42.1781261761918;
        Fri, 12 Jun 2026 03:56:01 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm91583266b.53.2026.06.12.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:56:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Sort kodiak pinctrl nodes & add camera mclk
 definitions
Date: Fri, 12 Jun 2026 12:55:50 +0200
Message-Id: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Mj3ez8lMzEbN3kxFzd3OScbN1E81QL8xTTJENTC1MloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loAyNd1CXMAAAA=
X-Change-ID: 20260612-kodiak-cam-mclk-a7e87d5b1585
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781261761; l=704;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wFr5Y86M5KQ4p0pgwW5LDGp7lkP5OjBgz9reRpjmvqM=;
 b=JDb4H6sSEzWpZuNT4YY9jzkb8Myz1vbnJisiKns1kVM2EVGQa7W9H8MWDn7RYLoeOA85wFL98
 Kynnoq/HiGjCYH/vOlyakAUJue3zOo2kEQQKziGv2plVxdLVFPfVhwr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

First patch is just cleanup with no functional change, the second patch
adds some camera mclk pinctrl definitions for preparation of adding more
cameras on different kodiak devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
      arm64: dts: qcom: kodiak: Add camera mclk pinctrl definitions

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1413 +++++++++++++++++-----------------
 1 file changed, 724 insertions(+), 689 deletions(-)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-kodiak-cam-mclk-a7e87d5b1585

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

