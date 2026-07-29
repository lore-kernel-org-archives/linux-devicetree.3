Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43773AA1BD
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307576; cv=none; b=XKR7niPzb5U2pyaYYE8D+B17RSe4bdvDDuU23Bfw6/0aAH48tXmGJ1LTPzRCWfPGlpJFhgnl1fk0N/0xfOG72XvJGcKBgxy+QVOSxmja+qtpqoH9CpEcsJFo6wNcaYmdauWUSovq34mdlnKajklWao3WPu731Tj2HccZ+By5mTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307576; c=relaxed/simple;
	bh=DU5hZk2w72UN7XPPKKC0Ei9MPQopHgndGyHLU8P+5b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6LCPNyRlB3M1BxTAEcoVTSS1mJvwkxzu+DROB3b5DIRnX5NkCQF/iQvHJJdGOUR44szcYg8swe+v3SvHvADKCGClQze7xnjTzA44p/lEQvAHJEFhVy2xsvUNXgu0dzGflDGSrFmwRmHDlV6X/Eem9HB9zftCJ4SfkWtCy+scDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2p8c2PP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2p8c2PP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so429423a12.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785307575; x=1785912375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=V2p8c2PPB60B+EinNORlkRwWtHWf+N9kO851CjIZaZ7B7pBP9zmHYmOJxBpI40JXnR
         s5C3b08ZMpWFMNPM3a+aEW5qR+vpc2/PhItZ0xbbBm+8sQzzRrPYwQYLyOIIkCbvJAtH
         YzV5P2os9FfXyZBbkwxIs/gedTNQ/U0OtcEyVsvM+jT9OJW1ydlSdwu4NMcAMTKuXCNR
         2K3o9cLpnd3sk+lk42PnPQEJleGJdk+ehLKWAvlEr8im0VQ9K5PHmVu22f5UY4Pmm0cF
         MSXDsSc0eLxtUJXI3OQyOovoEthiifSdXW0swQTsJ9NzEp7EnnobFPJdKy7NrcChCYUz
         y5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785307575; x=1785912375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=GF8U69ygtn31BfkICxyg8FxYkHOtoXv+N2P2uq81moo3WPgjdEkIvhYqvE2DLAypj4
         M/KMLo45skk5EQ1zcNMRGYISl2YifUgUeU0wiDE/trz12XXPCT9xJ6ttz/TokuZaWPUc
         o8DtVElIb0CmBSPjsPH5+VAA/dRz9a+M+qN0FQ+ppOFEtfaLxmyIbQkC0BMhKSBZUOYX
         a4yRWlKv0pY963HNg8ZTi2X35YwOOtJNGflKq2m0jwf5zuZ71d4Y+reebMCVT7eSupcX
         LKWFq/TdOnwRj9cpWn1bK2wQ1Tw1NrNGlyzcMCtpjbi9Yj5t1obd2YXs58NNlEg+vypR
         AVog==
X-Gm-Message-State: AOJu0YwuVwcVx0Zb+LGY0JDwg39EtIPj8d2ZK0nAFAkGe17WvzsmyuPj
	3+U3+loR8WueQHZppTwPien9NhbT0CFB21o3BsEFomfoQCrnzxbjb4o5tm7NZ76dkWE=
X-Gm-Gg: AR+sD12n7g7IinRrDNwYSKl86qcUa+M3tA22qGdPzsL6dAzNq9uCDVfNKb3egZHkfZe
	NbAo3U7i7Vb86rt9sQZG/n8vnJkK8sVdbnHoma0KdNqMQbtiaMX0SZOH9u/21Cu+e/LmCCQkHz2
	0GgfTmjq2UuwSxBQW49TAGf0r1HNPJTrIlA4kdV9J44SzlBRaUV17ovGqtiRqBCC80qihBq4v7i
	o3PJlMaTUFvHz78114pFlwXI5qV3kWzJ5HbuGR5eorMA+EBev5w8ohoawVkEPBGLl8alPkfitKF
	BqU5hrXbU096UADggIpFLYxSnmEP3vfebS+lVFsJvkRTipG/SIUIArNwSdO3xHoQlC+3xD5yiZ2
	R6xodB/7gFzLqnWlNal8Nkxs5iRFRj8GthlmGyTZS2QHsCRHB+ydRfHzF+C0zElVUa1nCQKnhe3
	dImjL046rN9cfSnrXxGna6ulMG9IkOxOFYlmHOVIpj4/Kx0cTpGN2xujzjUI+I4DVTTB4=
X-Received: by 2002:a05:6a20:7f9a:b0:3c3:8bab:808 with SMTP id adf61e73a8af0-3c8ba616720mr6668535637.61.1785307575040;
        Tue, 28 Jul 2026 23:46:15 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba35196esm480673a12.17.2026.07.28.23.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:46:14 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Wed, 29 Jul 2026 14:45:37 +0800
Message-ID: <20260729064538.19564-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729064538.19564-1-kaipeng94@gmail.com>
References: <20260729064538.19564-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..da653b787d4d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1180,6 +1180,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

