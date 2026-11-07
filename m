Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060997;
	b=fYDYIlN4E+qvSB4iQDdzIv5lDhKSqIjYMcT+QBHzfcrJHzQGzeT2nvLFVO+OG55Qrafw
	 oEXkRF/d8QxNbph+eb2aDkhHB5bcTcXEAm9vo+qtgbLgfnkcBta3s55WQn6FvW3s3Slwy
	 v75h0z9h8wRJ02Up6ml+12e48jKO4cYGYZ9IADmBalc/LwWt0M+sU0fxdHwiCIu9I60R6
	 EhQ7vbaBe0GXiB/pr6TTNvJDLwncWVOsQTtkcsZiqwfqaWxz++YimJqDoIC8jRdz3AaTx
	 gmkVATwcDq/tFCHykXRE/FGIYKWLSwxQUK+XQCkotPftjOoJvtoSqzMQRjlqvLc2Szg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
	b=SRamWv27onMZOS4QP4zi9eARcuoSwl7gM0nTR0cbdbFU81XEc4LI4OplK91tk5EFlVqM
	 dRc7lypd2tMfytx0B3hgf9JucBZAHZFx2meZauLUzMeOYcYYZeqKgTmKdBECwWDsvTVd3
	 LQbG79KHRRgbyi8oj5nPAxLAfx0BHdN7KarbOTSeeBR00rwBhiHe6ZUOpXbmBIE2Tftjm
	 bFkrLIOYHHObfA4CXxLQv3a8Z0xyoUhSTNKUYZuIH0M0tWnb2aMllzHgCEBTg/004JPxD
	 WvX26EUo+ywjI47ZqRCwgzUbg3hYBSNbmIgbTy7CI/ti2jS/y7L3FhP0v/EN6rksfuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgsNWJML;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB6606D804
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EB6606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgsNWJML
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso719018a91.2
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 06:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060992; x=1794665792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
        b=DgsNWJMLaWLaY7DRlU3QPpnB+WCMugD0AjOdjiIV10CyVDff0zqfGWYulb2kQmxGTs
         lpVx7Z0G0BUq4/UZx2qVv3zlh8C/LPFOsXcn7tYps+KUavPbwOk7gWTxq8TKvJmT7vc1
         KYrk5uTdsMb3cCns/IHKigfz3uVYiCDK7V5gNgy+shhIgb8fCr+w2gZhMkEqvM5ReVVt
         FxCSfqx2QaHAvpXsvpSWm4MTRneoW1diM2H/admtHsdGKDSzguBZJqZKLdLTxtlYPbUo
         s2sdkvyiwBtAMwg90+Azb8Lz8F0GxXwLy8zagsEMJjYDXpIxnsmS59xyK/Rxtj7WIoDb
         bvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060992; x=1794665792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
        b=xZGUzFuR7mAsXclxZ7L7pknksUKLYVAlDIfiHvegpzerACe64xSc4MQMeizIAhPW+K
         U07C3twopaRXTPE38hAOAjhul/f6udqic+a30DGZM8vXQ58aKWLwORon+gZcVRQUpQEq
         bDfIGnhNIpldgD9+8Zxwx6cKXTUAK1Yoq1SLXfD0cjUrtk8LRxFAQvvbNnab5HhxpBBe
         Kc333p3rrjMYXCgqgCmwHqQMklqZJplcqqiFLWcZvnNmB9npgKMYDxzXxS5zlTg9lYxY
         MLCoqxYLDJQ4ajAmCkjhxiPX/7feHNVdxBfnGthSTlY/cpS7vUfZeiSaI+0D6USDSQHA
         qeNg==
X-Forwarded-Encrypted: i=1; AL+hErEJRTDeWkyRhp2CAdUNi4jfZ1MyUw++jrTwIRyYVacNFPiUk1zm778P4NOjZpfyEEtuB6eZX3aQAZ8/@vger.kernel.org
X-Gm-Message-State: APuU4Z9mcXrOCId2ugan64f/rAiFlG5oeoe2EWG9WB9NaT7A2hz64i3e
	8vjbpuYmoVTh0+5vKdbCPjFYgYZqCu8OeelEZnM25p00GUCCUySfsrPC
X-Gm-Gg: AYBFou2trmhdWoVvpqhHQ6ZXoTrltR34Uh92V1xUEQp1hyS1IcOyefwdXq+bhrWi2hH
	2PowdFAaFO8LbULUEjgSt/7fBHPAKQPQWicqiHUT/7vcHtsm3amDKNdW+wOtvvAJNtDNRp4R+N4
	mRl1+2PBpSLwJs88QDjt+1IrNfxWWFK9+qwadG75i5gu8sywiGuQkE2U9muwD7RICVlFP3eQAKc
	BMrC743PbBkztolvRzkr3mVhpaBhsyoSwRqyIpJbdOhGWWOCxoUmI+CNzjhQ1bV4YaFrPyHrkLV
	hZKuOCs3V33Tmr7nHXJSBJaTp6DNNF+fjghW/hIy14ziJdahJGc5mB989utPCsn0McJuoKokL5T
	/YN2fnbw8nKXSKMeO8ViMwwdJjS6xqwh7oJTTrDrgyw7wG4u0IMoWvI69JhpIkWnH4/CLfr705Q
	AzD5xWuXWat3hYFOZOM0eFVWJVJ84woc7/xk0cX7FqCNwtge5D+zW9Up3T+pferrcOZwpSfsRFf
	RE4bSXzR+BK93XJENadpre6gODJREQN/CFqRqiurc9ebdKm+mZSDDD9Y4p7+nQ/lYbR2gWbbclU
	wNMHU/8P/r5ebSlFrP/TsmCWeTmZQ1Q=
X-Received: by 2002:a17:90b:3d81:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3b0db6bb44bmr5357577a91.27.1794060992102;
        Sat, 07 Nov 2026 06:16:32 -0800 (PST)
Received: from debian.lan ([103.189.116.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm3503778a91.6.2026.11.07.06.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:16:31 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	barnabas.czeman@mainlining.org,
	a39skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Sat,  7 Nov 2026 21:14:30 +0700
Message-ID: <20261107141432.39099-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107141432.39099-1-killdeath104@gmail.com>
References: <20261107141432.39099-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..8d2e4f0e34 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

