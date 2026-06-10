Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E3924BBF4
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054451; cv=none; b=B115WDrbVFNpjpDtP/8/kIxEoN13tmYfeu/pGgd0OeWqLgODq1fwvK+9GRb7fWuNldUwx+ncnFCcbCIolB7vdgL95VT9pCqf/MxMt2ns3gecS4g2mq2A+zs0X9PHtHnNoZUxgu2reqQgX9oV9P3gQbQfPed8BePHOkFzN02lMhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054451; c=relaxed/simple;
	bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSrSMK9LubBxQbolbDcyVTVlqHYducZFd/oJ7haVQI4ZIvVkzLVUBj2CJQq7qzOQ/UYasdxOezjV9UEP6E5xGoogt84oqOapUSmOr6bmrUttfmM9QTUt/XJLypAIV2ZkBPTj63lIE8KD7IGqLs+GL1ZiQLhBTFgWezxq5yolVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2FEOaoc; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2FEOaoc"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso5481727a91.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 18:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781054449; x=1781659249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=Q2FEOaocW1GMGbXJHEBuPbc8HwxtEf5+eIMHaXHPPUN1u80F+pTleJ64oYdjc2IeMO
         3L6NgLeuMbd8QGuiL6/n6NrWQwj5/XUDI7LqYSisSoBcnNRpkILWzb7u4KVgoRZzZodL
         YkjRRy+c00VPWenTA9zGtJjxC5kHUvXXMTVcW620h3I4LjMTKCfW7jvCjrzqfKiXWCJC
         aBSBl+eKwmfqu7lixXu9F0xrxpSCUUH+C7fHl4BbU0/O6+x8mYYxxKF4qnPz/nlCdeJW
         cR0Hq0IRbcKoICLIMLq52tlRX+MJt57EI2W3UsBpdsQ0Dlu6KtVztZXhf+4lTs9X1dVJ
         ZHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054449; x=1781659249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=BgJwVPfIN8mhyNuL5btcPsGNe6o1bUsKCY9BGArkTgQ1VZHaf/g8fn2NFziyWrzB/Z
         BMZNLdMDwCbgN2rxhY86EVcn6NZ4DpATSK8CwL3VHw/Kal2r4VDcexZ+6rukXJqcG6mo
         yQcLsej9CxBCssaIDSeQ5E6JR3S8vzwewGLBT8I/U3hm61CNKiL+2sM5bgsemJv/Jv84
         Z8yTCwueE714vlfPXaLcogFwbccZRhLxcNBSrFcgsukbXPlNqZhHIMHiR+AVo09lcZWk
         g/pvXNKM/BHNZp6FKtYku5ScAO8qxudBGUKVmaWMz8/Fp/fFjVGpi5wOj8SYhmPyclVa
         DbYw==
X-Gm-Message-State: AOJu0YyWkuOl4b0VN6m37hbQCr1nzrSzl9GMAlWgmyvFcnz1Uce1UhvI
	Syb6n1kS+bCsme/Tc6YXV1rqGe1DlPpNSQKI/KjjdvKdnzpa0QFsBH3B
X-Gm-Gg: Acq92OE0yIVqg3qGDi1SdNjqNfd8FdqnlbrbNIqa7UBK9ErVDBavQgYkmSdd5Fc38S5
	IREIVGnjIyi+2vIVRALy/baPzJ0tF2qjqGSvpz7nPVm3qo/2sG13ULMRUSlTPi7lWC9De6T+EZ/
	hAz2k6jZTIXtcOlIbyg+v5NNZTrRgbHC5EmltjUprlt8URCCP7MlwBJSJ/2wCOrGLAh/llyQGDB
	1H0UwNFb9CZPmL+PemgRF2vpZrZEASgCFeqf18N28rsQwxIS3co9RMtDrKcCW8+O/n33t//bXU6
	PZrU9/HmAURZm0TFF4IvkoAXiGmGOgB3O4CxFMVHfjUzAnZ0uCs7mStz/q7EWcqaNDIx2YIOATD
	+CLBzJr2N21Jw8Z7DLk+I4e8ccERy7aLKBNygXefD/RbvY+lNJL0Bu9Fzo8EmtzwAvzWPPmJb95
	9f+UnksmmPw4/+uJRcgYbju2jRtJZJFCKTf6n1uF67ymBKm0ZqCdtso3ERIl3rmGzto8UyRopCI
	xjYaC07ecMq
X-Received: by 2002:a05:6a21:730e:b0:3b4:cd6:891 with SMTP id adf61e73a8af0-3b4cce1eb3dmr27487969637.20.1781054449584;
        Tue, 09 Jun 2026 18:20:49 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b2ddbsm18858370a12.24.2026.06.09.18.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:20:48 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 10 Jun 2026 09:22:22 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ventura2_initial_dts-v6-1-375d8e9d7ebf@gmail.com>
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
In-Reply-To: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqKLxQQGomj/MY0QPBIqzFE4b/nQvxy7GBQecMU
 jN9+PGGewqJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaii8UAAKCRClg0K3CVbE
 gdXPCADAy73/bW+SdL3BxXS48kI2micWMc77f0hTPtW7/ARo38XhPrad/p8y0qxLcx/U9E1PmLM
 ysqm3BOxFtkQfLPmWBl7TwNquRhFRZ+thPHif/iPRp92Pi5q9SGl6F9qm9PzDzIrWPCpytgdrCl
 xsQVS6d33NSECbhZaK9tFT3Iae8PDyqdVRNYtt0liewHKki8wtcdpyecfgxLHWtpeCOsYEesl5M
 Gkb9Z8asnU9gEwDT3EUuoX0YA8PmltZEP6QfCZ/VB3ZnwyT1Tx3BWwpq8gbjXR5vZqLxENxqo/Q
 plQh2rV+g3b3WkjimKy8ClF/nhg6n2PtbzF3Cwe3JVklbb1i
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..d48607c86e8e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1

