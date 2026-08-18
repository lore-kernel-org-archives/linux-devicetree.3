Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D54483BF
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045790; cv=none; b=ddEzCTKwSaZ3djvXJiQV54wAFn57DG4aNy9oHW+fZs8khxnxoiVvQs2g0NhceWlKqHT+O70skIBH/CHoGbmc0Z3pBtS5V2Jn4bUYNuqcLdrYUkSvQSDH3sNFqX9WqXFEK807zkWzSxtjSaro9kpMTpmfppa1pwcPwDgvqELBKPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045790; c=relaxed/simple;
	bh=f9kbmYL2Uk7MHhphThP8wMGL6tHpBIxIl2XjkZBRX5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJmRYAnTBOy1EUdpnEerOo2kGJejAWB6b4TeIR/lrFWC6E9N5kQFRA+8f/hZFXcOSBds4uJp94WYSRs5EyGv3vO4nbc3ehqxberJWih3dL7HwAFIlqU8RLp5ZrWjSuO2sjbJDHY8CBZVkg+BAvf8QLSkPrBQQSdI3QcaA1M8zEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8UJkX9G; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8UJkX9G"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacb8416a1so42417505ad.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045788; x=1787650588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9jHdwtTMzFefvHCUtcvEE8spdhNp/YZkCDLFi2Jw78=;
        b=i8UJkX9GVl5t8e/OWVBTGyAhvZKodAWfVdBiIQ9K9AEu6N/PGbb74H6CqzLi8+X4l9
         X9vpEFf6o9TFtRh0RGqhHWMGNL3qBA0371nBmgBusWOGTPr8Fb0JbxF8Xx8Ha9DrBppy
         C2GJnJoorhaaIPal0kGkKlLWwecUHM04VsEE4Qvt7zqFnA55Z3+9XneyBQDwZFt0J+G0
         +v8mdBfsSmQcttIl6H7VR4IkxleQE+1OJ1UJc8NgZteIIK3nxVQec6mw358ObmQrFrPh
         FMb0ePtDbeqIHkwk9CRvSpV2Efd+inaY24t8jHl0jM/4RcXplBAb0X0faDyVoayDhqjd
         hcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045788; x=1787650588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9jHdwtTMzFefvHCUtcvEE8spdhNp/YZkCDLFi2Jw78=;
        b=ROLKZUl0mQ6eijCXCScC62E5eFCQOiok6P4oXxq+APJEBVEvkaXfV1tn061spidHYS
         mH9ERyjXoFn5yxJ0IT6VJz+Z+jksIuerFJPKJBlgd29kBQJsxnIyF7yWlbRMqKcotIzc
         7GJeUl3GfFYRXlsVbnEYmLubFDvbiM+0KyyiIhhyZEBzH/PJwciNxcpHV5PVg0Px2irc
         bK+TUPygsWAB4NWt7Wl39trHQuiw5eBIxtREPzYU0GyvwZiV2Hif9S96HWChQNQVtrVG
         OkLWpk8hfYhiRigLFABRtqFZjtCDgpYQCG65GhRWuU6H6kgzKTnXh6Ah7aumpOieLEmd
         Hy0A==
X-Forwarded-Encrypted: i=1; AHgh+RosjhpSoT4D9V8A2WNNwCC7QkvEN2zZk7gWHAxDHDZq2Ver4xkbCrDNFOpm8zSUzBhbDQlXjA9V7sTu@vger.kernel.org
X-Gm-Message-State: AOJu0Yytn3iCbhXy56zhbNylZw57ORhIXfMAxXUvzNN/vIqPu41W7zoh
	zvXOfFq0y272AeU47oBL87Rm+AFqrUKMrtx66vCiXFb05IkIE1VMiqDt
X-Gm-Gg: AR+sD10+TyIVzrc01inbyi2laZ9bBajYd94aYclkUt1R9iglRAqUbujSW9dbUZTOt9O
	wqLTZSAcqrWbBWGAo50u5IEOMf+yDv53rH2bCOp4ImhL6KBBjaOz3dp3r2GGWxXJXRCKjJtHc/K
	JONR7sauo5wegzG1cTksYPeVdk2Pr+Hqu1915qYjHZM9m5t2MqTFOCUkv9VjS5ipjarvNivzrZ7
	IBX2k0ttckLcMdHeSPT3ttcJoJ8A6ubXPv0m4XydKMwP5fosUL1KWfKNbuSFJi1ICn3GFQCG+QV
	mANfo44TXRx2kJDAg/tRSXrSp3aDI2YiB+l2XEq6Cb7KiYtB8RojrWyV7z6MvRBX4X68kVkkArd
	m0AR5ui2CK1oeZVJ8/VFEvMUFRlbZDJ+ScXnzlBkpeeby67wE9YunuV47E+hOFApPMyfbq2qVHK
	Pvlk9cix3wUmXqkYSoEi/4ZYvabMSaQ7ag1uLEUw274lGh03t2ZutgzGmSmcn41qxz+wqz/A==
X-Received: by 2002:a17:903:3c4d:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d3b0ad30e8mr386313005ad.5.1787045788310;
        Tue, 18 Aug 2026 02:36:28 -0700 (PDT)
Received: from thefoxflat ([125.165.209.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb51e0e5sm15171535ad.32.2026.08.18.02.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:36:27 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v3 2/3] arm64: dts: qcom: Add haptic vibrator support for Xiaomi Redmi 5A (riva)
Date: Tue, 18 Aug 2026 16:35:48 +0700
Message-ID: <20260818093548.27803-4-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818093548.27803-2-imkyufie@gmail.com>
References: <20260818093548.27803-2-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
v3:
- Add vcc-supply for vibrator

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index abfaae502..a066d9d7a 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -27,6 +27,12 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vph_pwr>;
+	};
 };
 
 &blsp1_uart2 {
-- 
2.55.0

