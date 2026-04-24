Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32338AC7C
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023029; cv=none; b=rJqf7FlmeQT72BJ6WawiJSohKjQXgPEbT+T76sPjA5RwY+89UQvyc3r6iuaxysvXOWmOjwixd2UsOZvxaGVn7m9zQ0ugQ72N1TJGjE5ocLr99tC3NijKrpDQj4tkBWoBWhwfsQMi5zB88MWIR09u+0DaT5ybGMU8pzAw/TxJbxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023029; c=relaxed/simple;
	bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+1Sk2ha5Esn1TEVxTcqudoGuKEgVvPlw4lXBP/MVWnnyI5WGpVlmB1eYK0PEqO452lcrqAvr/wQmtn65BWzTlEzFKWB3l2jPSJky6FkvhXVo8RGFHu4Fafjsn0HZDqeL2mEGtqs0v0Z+zdSfBv7meKlfcEOarfhTkJgqQcl9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGbE091k; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGbE091k"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82faf871346so4516788b3a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777023028; x=1777627828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=XGbE091kR3IBMLUpRutgzudtSwsT8o3/Zo/DvXyT//uILRba4YfTW6pVzXyHACO8Ns
         LqZEIk1zpAALYIWU12OCAK8rGoTcx2e7rtUMdR32xikrEUaMxzxy9GtoC2HkNnaC/t1q
         TqJ/K9wA1S+WgTf96IcrE8JDojL5qI6bHqh9xegpB+6qXejPwB4paT5UGQPtF54geuST
         eQRCAxra6hW2n3clN/NloKmaCVfoZAKNQyLySTm7B/+Xc2e0Z0aClKu+bBEi/EJMsbBf
         8MlIzkkkFBfAp1wKpA+buLHvwh4Daqhc+xzTsY3IRjEUHHA52mCVCts2h6bUZjUNeziq
         aeqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023028; x=1777627828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=SeZpp6BFjN2g6NQJHmPBBAEALcHENKRQGMugV/fmH0W8h1/2NwtZRkYtU1W/0lU239
         EWXnUNacb45lUc4SuSUpmeBn24PBNXe/r8eThoPNLvjfBwjEDArk7e18boVqeW9ETNc1
         F6uvgX/tk/SzgmSSBqZTAaJBZo2z9ckYd3IPXk96YheEA/zf25oW3Y9+rXT/P99aqacd
         J1NMP8/CFEOk0bYiPtT6H+VXsWBiwlFMolPu7ASsaLIbgHhahL0YTFnQCQHvecB+5NEN
         PXemd9IC7BAMLOS2VJn9DdJtRjpK8oss2zhX44+kQRD3so4wE6uKUlb0x6LOiPDMbe2h
         Z01Q==
X-Gm-Message-State: AOJu0YwL9lGwt5K7zf0IkLQgJnOp1v6ar8FLpB9o0Tl19FxKhBYWG42P
	sqIimDTVmVnga/TRnGhodjbmrxOUPAC4F91vqeM4++fBM8YFcGEFnXiSzWXk1A==
X-Gm-Gg: AeBDietjq4A67pDw0kHzw3/xzx/o4h03escpYf3Y/jmci4VFgfwG1e/hMGNyU1KHR8s
	VKCAMecectc6ni7i2WAAowscPiabEibn5zSzV3hN1CvScGCtrd6gwD2JKQXyy2gq4kYzWdV4KWM
	SO67vb47Mmq2pNV8ZWk2WeNtlo9egxpdhoW6hNcDuWYpSpC2Rs57XIrEyko9tknacf0MXKIo4F7
	bmbI2lyXthfZaWumy2AWLgc4jgo4WmC7qidCCNF5bEPGADjHeYzAe2IVI/3RdQII1Dfcqp1+xtW
	OuJJO4/kCDgzfofhokorUNJZAbSXjrMCLmhBz3GxVhnwWMgJAxzL4/oEhigoR+JXfy+UyxuF7JQ
	4I6N0asquPunczM41ueHhOrKU9Zy4gcoN1CMD3i0OKuMGz1HNpP8mLmsr0PmEOt64qtG3NFTB7S
	2VmW7SJwwaFY/z6aCbOHjmUBuQ/ch3m48RZZMV09NR3/H11voAyNI3LE4mkCRW8OywRPz3ToWng
	g==
X-Received: by 2002:a05:6a00:bd0a:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-82f8c8e8aaemr33764558b3a.34.1777023024496;
        Fri, 24 Apr 2026 02:30:24 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm22658143b3a.44.2026.04.24.02.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:30:23 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 24 Apr 2026 17:30:49 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ventura2_initial_dts-v4-1-806b00ea4314@gmail.com>
References: <20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com>
In-Reply-To: <20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com>
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
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBp6zhNERSg2LprjO3NpjL3691xSDiTsEpNmAsRa
 TWu4uACS/mJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaes4TQAKCRClg0K3CVbE
 gWQVCADEDV9vxWqxPFTp5UP8ETlwdmjYzpbjb25VL0GNAo2M6d2NcYQC+lIzeq2H2LQKFZ+vIEs
 8x0Js9eAEZtEJJJMfvMTw3ldf2V+onaTXiPfRa9iWvLzlxBPrkx+iVWxAMTgCWbBO5anuB+dzVX
 MARyd9Z9XKfpPM2rrPS4Pdwx9Kc+H7JjP3cwz2G5HOF/YgbYeHbs3cK5eW4NXOhqkOANzngkFba
 jDbQPESXJdHGs8wr5kmiKBQnzHB0IFH/5Nn0ro5a2uQXhUVRzEzbT2uCPlKoR2ODZOWt9KNgNre
 chIhC2L3as5AhSRsoM0b8Hl4j6vutFSgjouOmrD9MV0/5cmq
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

