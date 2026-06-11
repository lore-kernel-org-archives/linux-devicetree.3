Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9542D376465
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168723; cv=none; b=LMN5PdSsan5dvbKYapFiEznpviouH6m/wBVYoi37nIeDmzei7z1rBjZ8vLt6TP/toIWeqAaPRgfFYy80xuySXMkpWkPxmt/noUUua0vV1CRPXwiFfZ8GR4SkCYjjXrW+oE7tlwAc9A41Y16FZoEfhx09sRW5buHrf/wo2kiV5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168723; c=relaxed/simple;
	bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjRdaMv/Ax3Mztxjr37ZHORLd5bKZfxZYXXReVTcYwh/3MBzXQh063IRnKd0WP/4Q1nFNzua39TCVTAkXo2jdJis/Vczx9rXuE6OqMlMwanV8+wnf7HQaa2hZjbx/n0Mxlrs+8Ysib3sTHdS2vkO5cLCd5gD80WezQ+wS4KbhwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rsFsiJCS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rsFsiJCS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-842338c18e0so5389710b3a.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168722; x=1781773522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=rsFsiJCS+Q8YCFAvz4zvYsf+bwmPpZRfDjPSAbkTFB+sRqoD58tQSvgNoLMVsp3A6k
         3G0f/ZjSHNFsWTacf3+PNMSb6JwNPD9goZh/59L5UV7S+fKSZBxViHW1H3jnS8cyFuwY
         eWNyM0iqFp+ks8YHNFzghfwpmOQWo77c3fFK4Hw3b4ktuf2D6qXWbxQ+AehhBP8vCV/V
         ZWtRorNOB5+IaFbpEkU3VvnVacvNnWHEJ0EOltCGRrelpDVuuM+Kw12L+OesIqYxPtCh
         6cdJhH2JMAW9NJYDd4sNpWXYwggdeUhBa2UaiZircZfaxHAe2BFlXpg5R4462E/BqAMf
         /8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168722; x=1781773522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=ZyubiV5UFU5hBTg43eljFvjFCfCfVuVMnvcKT4zoLqU1Y+vMZqAoaG3pj3HL5O0oPn
         ANLwnTrnpDkeWveN3wJ0fnyXEKOGTaonZ90RP8lkzUMTJbM+CVIPVYBjBYMqsP3dNVh0
         seFNqVGOwgjAS4WlPYEaV4KRV6AHn8bbEUu5p74ReNIgL3U1V9Be0h6bGMPtGb5iHs+H
         c+KbAC7JLmzuTZoH17Jqf6mM4Qzn4+xF7bMryny4dTFc0a6DYWAYUVaxSeHcZkQjfCwE
         cnPy9dfSYqyWbpSSdOiDKRqcXfQIgqXuBb44Irsi9QDWmedAkG0O4DCIeBFQiwc85Lnc
         2btw==
X-Gm-Message-State: AOJu0YxI79CFuavXEzXL3HLqwhpZTSrZXALUyz3gMQ0UqsETqMBGPzFb
	/Hykrqx9ZcQM/HoWky/Y4sVpgoZ7XTX1zrPIVElbKuq7m9m4yZM3FNKV
X-Gm-Gg: Acq92OGb0vxdNpUJy5d4D1sLX4YXXYqB59u6qOPt8+rjmS+9p/sWANg9ypYaNPfBJ5p
	/erqu5Wc3P4f/V11IbQGUGUj18ELrrrVKlJSvU0DTejmk3V2octSvDUj6HfnxJ6yoOMM/kgcuHb
	ITSekona8QZLDB+k9G3GnvDz68+2ZXvua0m57R5YAWMYIpLxZOYDuWE/j0cR8wqljDFlD/R92wU
	oBBKRdtQMfI1pOjhO8qFTejm45giUrxH6Tuci6lbbH+e1w1G8GzArLVM/GTHSgxQTKBd+8aGusp
	FwgbSeAHEwaruaIJBUeLPX+HnaRUkj+bXci+KVasSi8xbRCG6qXUlwX/gWsmcdTR2VpfhyNHWOh
	UHPwMMOfam4EqFncYaUYfG9ENK85L2uyUHQ/JU4og53xYIck13T7AF32QfFQ0TohXriwdp3Xhd7
	YdPE27iUBsJWxQXGviOTXNBTviFibWzvHkMb+ZY9YVOZnrFm8kIAEaLo+w+4SI2V7pQDmmegioL
	A==
X-Received: by 2002:a05:6a00:84e:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-84336bda738mr2313252b3a.40.1781168722062;
        Thu, 11 Jun 2026 02:05:22 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8f8f5sm1456306b3a.5.2026.06.11.02.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:05:21 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 17:06:53 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ventura2_initial_dts-v7-1-a61d8902bc5f@gmail.com>
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
In-Reply-To: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
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
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqKnqyMNDpdkWIqPHwR0dlpgB0K+02uT58R/Zlv
 hr8jCJ7+g+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaip6sgAKCRClg0K3CVbE
 gTJTB/9N8Hh3uD2G5CWGKkfbVcJSGlj9ZoSzF0Glya/xrOJJFPVtC/ajfoCSwTVy1rhaYUG8jBL
 t/E1VKn5kHNWYTo1MHmgJU5QtoL2Bcc4qXVqIgqN0TLVBBmipTi7KsWH2LEZuJyjKsyw+i8UIia
 vJxfeXnNdPDZ/VPmgBBf7TjWgdDtAN5+04rc2SXuZiiPva+Zie5z79VWAXANblXvXaSZcRwghI/
 8JR/rKkBskqPb5CoijJNRpo+WKR/9uiBpdFyBZFNHVmrcc8R777orB33SUakJlNh/pWCWFW+D25
 lbYo4Is+5fnkYKLwGRnmPOA1mW0xdBjphl9CkVqnkNbDkimV
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

