Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0003400DE8
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218979; cv=none; b=r8iZYyCLAFnWUrReA/ZnRWqG+HfEsCrRphpJDXz6pd1ig6i+U14LexnXdrvrj2FjGMBBNbjslc/rtGHEJFY0/eUZnkEFdjzgrlgOYRM6PBkRCkwsQMJilhuqBXhuSxKx0WDbV+d5BSuVrgYXSts8Mf1NVMWg7hmd94JsC/1D4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218979; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bauX+XgQ9LG/fOemUfvKe/DTjXB7K5dj9Ty3J7ovwL5r/SOs5Ch/49kc0TcSXTtVYM6NKESRy5AO0SGmV5oBaCANsXOOkItf+XmoYqT79Smjv3ttxxplFjDcGG1tV4U0MvYgSPZZdHMnR52Jmqg0QT2VqiDi+5dgvUElLBg2Gbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1BnZDy/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1BnZDy/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f84023916so1929416f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218964; x=1787823764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=F1BnZDy/m6QsJN21F+BsPLH5g2sdxl9F/dRomTXbK7efUQikhc7OQpFvYHRcMQspBr
         mZkHd3ibHRzVnQ0/pwAOj3b1byJoOakKoJZ4Ze1hAAEkTzZrC/l7PXxZrmfTnuhU0jvG
         DM+0KpPfzqtekh1UrxZgNXk0IY945yn8LrMQNmtMoJVsSw6dvRlXy89fjS4muV2fU2PK
         BhGh2wDG38/6j+NTjmDla8J3Z2mVDkdlxt25pJv5y64XB5R3lifMcg4N8bDMt6bZoGsA
         a34/7MmFv8SDJWMEnx0aGVCCFRhUFrF+SvBRk9pQEiR0TcxvTcRaAxcUkDv/ilrQ7k17
         LJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218964; x=1787823764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=eyJnqw/7QPqjuBOJYD2b/jKXU3Twut0M9BwoqqahdAB1cY0L+qZ2oxrIhRAsJMZpqz
         GHlyaeDo03FCYKtlQGXd1uh6bdlhEZKh3MSGNboq9QlBK5xxH5l3yIoGjNAfPUDjHIRd
         vw93CCM4YdPGhXwR9SWSppjE06NxHuVClHTfIZzOne1x4BHPy8NBmnkbEhC9CdGYeHUB
         VWb14BA60uVRwDC6EszIY42xuiF+YlZ+j76DeKuh5guCc6kyrfnL08KakzVjeJeJKn2o
         XHYRVEZzFwR2liAhQgmY5e9LRz/n74zAdo3tnoGIP5hhM4VEEP1TADqtGgX8Hb1u0gXu
         Q9dA==
X-Forwarded-Encrypted: i=1; AHgh+RoA4HeXPuTByJ+1FCOYJ8f+hCP4wKen1nN/DDnUPSbK6A5D72l2oIfNhsEwMBnswu5bMph4pmn7ezTF@vger.kernel.org
X-Gm-Message-State: AFuF++kBa7LqFZbLj/dJCfksZu3SkN7ohQEFKM1OHo5arkFSIe1PBB84
	s3u2OSbDNTONbM8hOBMwBk4ZLj6O0KnGjjeMODSOTK1udlvqe2qKSEb7
X-Gm-Gg: AR+sD12NTmhKQ9U6S9kwguf2YyRnuapswYMTJvL7PtNUBta+cxoMem+ZUUdtqNSd0dm
	LBaxxe09PkaNLU7o60bAUc6F/R5pcr1dOX2vUFE0zC3KJyoH2lyfeA8wZikGZZ4IFufDsp5dajH
	eBllZzMIdWyIEf4oop1g2Yq4OMOSzdj4mcGSEEILzZbFFFHRdePPHlUL27PerUD1bZc0ho0XUrd
	O639jW4XBqeL6CIFpud/iY0NiyLgabrylYpPCpMJSDh6t9ekfGQj/c/zyYqZL7ghx14HvgFBBke
	UJBllGdsZBp3J8eGZY2ogILsI64QdSPG4osC+uK2IUjmm3+VmDkpOqVPJZi5YiA7HdRFhOEQxBW
	B+rpJF4N2NJMjwUjIolFMYmqlWj6W/8AtpoULjyzSulr9EmB2EUiuf4uZPMtxGaOEVee8Ytwy7T
	kFnm3hqUnmlh/3azcD7XTYcwkUNNhiHuzbVNhXyzho0m4tgSyAw+p5coDhezIYIGgNsD77Ak1jC
	1YfxnpebgnGRo1EcOe510BP
X-Received: by 2002:a05:6000:715:b0:481:57f7:6015 with SMTP id ffacd0b85a97d-482b1e96130mr22568820f8f.6.1787218964416;
        Thu, 20 Aug 2026 02:42:44 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:44 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:27 +0200
Subject: [PATCH v2 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-4-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
In-Reply-To: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for LeEco Le2 codename s2 based on Snapdragon 652 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 289a3de1d24b..68542f76df30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
 
       - items:
           - enum:
+              - leeco,s2
               - longcheer,l9360
           - const: qcom,msm8976
 

-- 
2.55.0

