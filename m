Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F63939DE
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806298; cv=none; b=pfvpHkSexhQFU4rpWt55Ymti6EkmZ0RsqkcO3/yFw+Y5KWZYSRFNp/BY2mY/xIw34HJ/3rV1sIjTu94kdsOH2BuByeUE9zKK8E5toHg1yvKjzXZhazVSkqHiemg+llSxKSn3+0gpeyknApFltG0JjFUqgVA/7mliNYkljaJipBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806298; c=relaxed/simple;
	bh=tkPOh9suv+Ph/NP6Bu3BjsLgITZxnb0+dKSWRPPu1Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKguCaeUnEtpuEk2T4G+yCHaBChA8FK0rJ5AUpj7iXLCF0m4xg4r/pO3G8etEIlOK/iz9WPqAGqO+wLC2uJ6CE6aa3oFCm1cQsuD5rdoyGT3DJ2fGh9k52x7nN14FCCsiJFgPZmXXLUxdLeYTUu95AXDn5RqbANfJotDXukBdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BUnQP3Zo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BUnQP3Zo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso243354866b.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806295; x=1776411095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3fsUR4mnupvB8/aouxbwBgwEvITDdKkDUtdFYBqOHc=;
        b=BUnQP3ZonzwxS7uqKSKzT7PWpNm5oBTnRmNOur4NwCtmivhYe8+pwFMOvlGDmIjxOQ
         5P9UlVLAqj4CphKRlpbQabQ0pBVih+HIi3eM70VygOUI7/hzNonXYynuPL5HSXBADmPW
         Qb9RL3axM25bAVqIx4aOLRskovcj2Hwk8bsUCCKHy15a4pfu0F8+NJr+AV2JayPZBAfX
         9HUn4Ze6TXuZ23xtDvujyOoRE56LxrE2EDg/HRM1zq2ab/zlBVtKrk7tnCMssWBW9RIY
         WA60oIWgOPC8UQO+4b8VHVDzalFCVQgaD0gQ9B3y9uaS5axzhLIDxA58ReILOb4P085X
         9vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806295; x=1776411095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G3fsUR4mnupvB8/aouxbwBgwEvITDdKkDUtdFYBqOHc=;
        b=kS9MCGAV4/E2VtBJr2dq+wKqedvhqllKCcKcpnGNKRHSf+6NhbrTtFyyxrj10Us79k
         Xw1O0DF9vF9DaMRj0B2Ek0aSo2iF8Tukaf1iRW44I5+wWv6Kv67959FZHBBl0YpyES/m
         yu36ybjaE9h9EzcV3PFcfLklbR2lVwNWdgDdN/9eWzg1hZPPBPOVErGZjuGrCG+HJy2x
         j9z+NcpDehtmnSlaT0PMmPWFViQFaWwBwrWl7ZOGuOcRkbeYMNoBcbwZcArMuV5zfyis
         MXFvflvh63iTpIF7/p7DIWUkL5ABHzmzBVsF+st/XdxsOoTn/5SXC4MJXkg7R8GGnzQW
         nRYg==
X-Forwarded-Encrypted: i=1; AJvYcCUrvixBAJyeMQtwosebROzxMQtAwY0uKvLADm+MS5SHazDBC5SYDSGOB4oDHc1H93rU9V+pEow4QRUM@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1LJkG77AaibuyPYjGJQayXgMsaEIEL5VRXXMcp7BeYKzMsJY
	TTZzjbeBe4YxaZ43nJMtVBIatdVDjeulAHWZf493z4ZRy4dN/hBOr4cxhlkcxqHUn/lLwJjiIUi
	jCLjTXIk=
X-Gm-Gg: AeBDieu07yoCallql2L1m5IPqqufyjTVwvkZ1H4MwYMyV5+DVDRLoag+WR33Q6SfzPl
	u+pAJNom+RfuNZKwiaGQxCUH/uQHxGJwDp/2+Dp5eH+vaX61of5sTdQVU2I1QOVBOJmc1iZRBZC
	PD8Z5JQapxEBMaWKAeaJekHmoTdLESrG2auhgQlnVNEKcigvQYDC6b7jhrLM7opDZOfyBc13UhR
	piEPgGrPfDoxPh11qQ8XUsHZ1tGItJ3iGHdpsi6i/o2Q+DrkZoSeJFKptlgAPzN1Jd/qXiPXI5/
	kaCjW3KDU5D4zfFqFymUot2D84a8cFQMxBE167NObG+x/Rt9DRmnjFNWjsUDupaSd/B4CW0O6oy
	WU/lkb6BMCrhdk9c0RqDN+922tvW12alJkMc3t3LLvF8HTmaOae+zwkLlat/Rni4q8mrL9w5wQt
	q8KbxjAvpakCKzqSTY+uFtJafwB0jldVxwBDvBPsSueEjmFHzYmkQLVmHtgaYWRwSGIA6DTzvD7
	7Lg/Q==
X-Received: by 2002:a17:907:6d1b:b0:b98:8e42:95ee with SMTP id a640c23a62f3a-b9d729cbb95mr121173566b.46.1775806294635;
        Fri, 10 Apr 2026 00:31:34 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:31:06 +0200
Subject: [PATCH v3 1/2] dt-bindings: sram: Document qcom,milos-imem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-imem-v3-1-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=774;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tkPOh9suv+Ph/NP6Bu3BjsLgITZxnb0+dKSWRPPu1Qs=;
 b=F+NUXlBrW+PPfsNwaVjZbDJTAQnbAlz16g4OOgr4LBCzuYRL/9RvYgSAsOpfQGu/+MLzAIfh+
 F+yPaa9U11oDLIxs21F+PUDFqGkAuJA8goCbn6GYwGXh8+3/Hnl2GJ0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add compatible for Milos SoC IMEM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index d9a1da12dc66..d5955fef53a4 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -35,6 +35,7 @@ properties:
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
         - qcom,kaanapali-imem
+        - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
 

-- 
2.53.0

