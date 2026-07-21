Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB321F3D56
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653895; cv=none; b=F6GbH97+2P+kbvRYYY4YA6YU2LypJ3QYTG2kTemNSYKs4s9Re8L8svBbn3IcyrHMg5vQwInFcOjNqVa59EOc5P32WePRYzW2sMwxpBmREWQ48B/Nzci3At4Z62Ye8oLn3+dq/NUXbot2ZH9+m/xaO+iE6D1zRpoUS6OGlea6+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653895; c=relaxed/simple;
	bh=dQnacLOtfh1x/EVTAVwP8evevCXXsKE9KJDE9DiR4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/Gk3os6LNB80FqNhg5xln/VTTrT92H+Ag5nCWvL7eqHQq1Kb3cI4aeK0NoTpzYLNEd+4YaBjoGFf5MzTRPom1YPfK/CaYLJfMSGIYul67tvQjJRJCIj5i+VSCZnIOeRFUJv/VU4DkylGvXzDaBKWBr2dYd8Ni3cOt2XknOunDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmEVnDkl; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmEVnDkl"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a40bcc8d69so7519148b6e.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784653892; x=1785258692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=kmEVnDklYPiccnJaJyqA8M0vSfmGU60IFVkvzVLLec3Qagb2v+bOdzF9yF1sq4k/Tu
         lu3FuAnSfjMe2xci+V8ov1FzZ+LAes1tPzxQ1JuQdEWaspx6XoIRTS1Q0YkdX7OPaEDh
         hpiN9zuiBicWE4nqxhQFErGZymYZTjdNFuelopqQZidI1Q8264fS5WcfR7AMbeuQ1agO
         0KSbXGHXrqbYUrCFNtfV/v4byFIbcrXywWWfZGJaSlZ8jRyhEuZ8yTnI3ey854+LEE7g
         z6FxIZriv+/qNNQmD4D/4TvZfoMP1Sa6+E0MQF6Zt3IWlRg13YWWT0dS9d8FiEwyfZTL
         6T6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653892; x=1785258692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=DZTGNUZWmhP0FhNM0N75VQ4SQbRjq5duC35um59Mq0fIBV5glozcbp6IYJ9BsCIODa
         BMUdzYJHJEMpTvzOZRfDI4vBd+wfGUoGAsxhHi6W2J+ewX8GXcf0e15cfxYSx0kVbfgv
         7B0l1AP5M2woFbEmgDeAeQnUyDRs4car0L5D14QMC2ebbDqTPabPuOLXYovq1RnhYZYg
         IyjWwCfgQS84Xy4NLYH8lJCDnmKYoB00ALAILkIQ4Wg3ujmDHtWaf92UdqLZ7mW7tdVs
         rUZ6owR9u3OP98SUzrcCrEDMmzRIJ9htLu7g6XSIgE7W7KCORq0HCmvRsYpBobz233OT
         1NsA==
X-Gm-Message-State: AOJu0Yx3LGXZO7GaO7HCiFoK8MfAUbtfOfsDSpfiHJ3yY3NCSgGwOBLS
	F6wJWrhEdsfZhKj/8zlDtuP4ojRynl7SQkhMMuMjYxxkEjmTI2Fx7z+a
X-Gm-Gg: AfdE7cnaH0Y0lZVoJ3r5PvwhXmQkfMb1bPYtS9V5QKgY38sf5zAqJWlHvtMZcmV9aKJ
	KDprRt8do5bwJheMr/yU8yFtkjfqlRTjVnsN1V7VWJgfZGWE/DzyhRKfQRIVgrHdO1Ut3EqJ3fT
	wKhvvPWAxvtOP5KCzJ3P9tmElLMs/jII923lu6UDwHza0J66drTDXuLxsaVRvGEIp0fagtisOeK
	MIPY4e+Dd6mrPoPzVwg9q2sEJD6aWYASe3vrAbalJRC3I3cRRZS9d5AOiDf9JN3U0zzQHYwsKKs
	341IbXgMmEprTShOPZ65zkwQlmBPxMdxxWRUdl2WD+Ex+phRepmcHx6wDD0ok+ywR8EzGbHdlxF
	ltmJNM60BxqGaMQd+KHPSzYuBBo43OBBINHNnfUuYoC3Z5f4f/rcA95cjk145pD1BLCqugy/a3l
	dpVbFqgHuqjlA=
X-Received: by 2002:a05:6808:1303:b0:4a3:f026:5895 with SMTP id 5614622812f47-4a4d0569e52mr9095293b6e.41.1784653891997;
        Tue, 21 Jul 2026 10:11:31 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cadb50sm10213953b6e.9.2026.07.21.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:11:31 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V8 3/4] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Tue, 21 Jul 2026 12:09:06 -0500
Message-ID: <20260721170907.131731-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721170907.131731-1-macroalpha82@gmail.com>
References: <20260721170907.131731-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Anbernic RG Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b8babe9d3a26 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -66,6 +66,12 @@ properties:
               - anbernic,rg-ds
           - const: rockchip,rk3568
 
+      - description: Anbernic RK3576 Handheld Gaming Console
+        items:
+          - enum:
+              - anbernic,rg-vita-pro
+          - const: rockchip,rk3576
+
       - description: Ariaboard Photonicat
         items:
           - const: ariaboard,photonicat
-- 
2.43.0

