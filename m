Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5944014A9
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756091; cv=none; b=hR6fduX3tt6atZRZ5ShEgrl7YMsrjwBguYBx9xNJ5fGanq/LF8KoKY5Gc6azt9hwohxOG6Cxym6sLcQSdABWD6n5k6MGPzwl6n119vWTmT5WZM6uUNKmd/c/JvxPdnz8E+JkODQ6YOw3hYOCIKOf18SrU6uYzaNp02/lfcnjWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756091; c=relaxed/simple;
	bh=exIRHh5ZhtPmLDK7zlvLkZ+LsnhUiPqkjMFjiBT9xSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rmo+Nan//tToxex9G0AZJdSmstJBtWjyYIG9CjfwBa/YyuIt56Vn77cgc1PZfwyqgerJtR8zG1vI0aa5DKusC0CD4+FD8EexD8RtykP7w692asD5uOyuHW+xQOdfisoqKYXXb2EALJ0jvjZVW35azHnnn8bzWiM+dUVJnwIPDMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyFfR0um; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyFfR0um"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4720f3bf164so2527162f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756088; x=1786360888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkZQi8HNIyl+jY+toKPeCTTFAzrs+zl5FwBtHYkecaI=;
        b=AyFfR0umIP5LRJTFQWalTH3nUq7/6gVDgkWKBtHGmuLD0QwsU2y4a0NdG56q/cDCid
         dWzmJFI2X9FRc9HuqQbr4fbjXOspBUc/1ra3gSrFz8sv2gBQw3sykfXHlHxli4N9rn9z
         XOJQ8oNtz3EyqCGba9kfhQwXX5+FGgb3YUYijd0OM8NuaVKhnONQExIaF5jP0jLy7Lps
         njro5Jxo19l1IWp48Ys0mgas3vbi2O/JQVg28h8VX6y8eQszO7hFQcSwbNhj/8oNFPj7
         ugISYXm1EgyXMWPTeitLLhnS26MeLgzYagLFx5tvn5Sg3AlXe06kwYiL99xsuZWHSK9x
         oWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756088; x=1786360888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkZQi8HNIyl+jY+toKPeCTTFAzrs+zl5FwBtHYkecaI=;
        b=qk7iFOXaPbIETmCRQJ638jhFljPZDYMm1OiSSK3tZNassYpBFGKzRIu0PX+OJmMb75
         bj9kYP96GheoLAFS9RhqoSkb9Lbmb9DhY8zj7WZRAleT7MYGEGx7R6H4proVH0mzZPWK
         inABffeKmcHfsdFE5VlY86cHnSC+Nc+RSQNs2B63okCRZwuU32cP3sSiVpb4BTHDOxxy
         YS8M5GpMPgZQToevsLnzlAtaIm5vPSfFhnlsFXFyF0BCiiWupRDWf9ht4PPJg8D0fVND
         Kri0BUg8lM6l0oyh+1V3EVSdYrPSg6f9ydO/iFgK+HTYFVPD3Fw5nohL7SjC4lPqnaC9
         Kh9A==
X-Forwarded-Encrypted: i=1; AHgh+RraAnZCtF6iAQF9uec9/RFy7D/s2ep0x24aCFaiAqtcbBK/eT/E1uz5Pw3siNEgZXUqa7S7hLZ1IXA/@vger.kernel.org
X-Gm-Message-State: AOJu0YxGaV2KRkXc1bPihFFUJ07BDCR8ZhrH8X3S0nwIYd23IPXEupK2
	iPZ0cjVBM8bO2C1QANVpEku+MavnnvDbtaC7+KyEZ8J1mJVYJo6qobLy
X-Gm-Gg: AR+sD11+g7fOUvrQFv/Qvu+WLWlKBGmAixEOmlDaJmafl9n/i+hPeLeCeVmualxtv8O
	eTRaWB3XVagE8gz9EhfzPYg0vfsCfLojjdmbjYkRNylkJ61gdn9PY9j+tKNhWfWdaaXCe5nBBQV
	64PTqoRHwXqZ1Vi4udazajUDMFPU6bqRwhfekuLJ5OjNuulqpVP1etJcUz4Y6M0MGystXMtcZiC
	8NLWl6PPt/mcUsMPqsRdV7V+GtOuyjjvn81SM4Rk/kFGXrS6Z/KSwfVMM35GfkMXbYPMCm6HgYR
	jsrZA9jCc4J/zZmjxywKtFqPls7jFBEuExxgsITOm9oQ9bbGkjfNuWEzRkwuPbpVcw14yTtDj86
	hj+Lqrhz7UPBaNe3xUiTIBYvUHemhcP90XM1xObsbObsKvZwYCjFBBgM8WlQ2kIt629mU5P7JRA
	APbghqmxYbD+biXbcCzrb9CcX6JFUg1l2cXDj+hr5WT9CzFE94SRLr6cF7WP666aVeEhJbVGA=
X-Received: by 2002:a05:6000:2683:b0:472:1424:fc7c with SMTP id ffacd0b85a97d-47fd32b982amr27124917f8f.10.1785756088129;
        Mon, 03 Aug 2026 04:21:28 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:27 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v9 4/5] arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
Date: Mon,  3 Aug 2026 14:19:05 +0300
Message-Id: <20260803111906.1931384-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the pre-existing NPCM845 EVB DTS properties so the base board
file follows strict dt-check-style canonical ordering.

Keep this cleanup separate from the peripheral enablement changes so the
functional EVB additions remain focused.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d133..2dc1a4fbb 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -5,8 +5,8 @@
 #include "nuvoton-npcm845.dtsi"
 
 / {
-	model = "Nuvoton npcm845 Development Board (Device Tree)";
 	compatible = "nuvoton,npcm845-evb", "nuvoton,npcm845";
+	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
 		serial0 = &serial0;
@@ -17,14 +17,14 @@ chosen {
 	};
 
 	memory@0 {
-		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
+		device_type = "memory";
 	};
 
 	refclk: refclk-25mhz {
 		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
 		#clock-cells = <0>;
+		clock-frequency = <25000000>;
 	};
 };
 
-- 
2.34.1
