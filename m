Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778868;
	b=HhonkoLF1t07UKeEMVpjamVU1+DfaOiVGqeaT6Bs8eU7VMXPAUjwAL2X9XYb+65nH140
	 wItw1YtMyLLwyD9GqdVpnHcX5r9WlVdXRB4l48cVoEtMidCQ0U0Jep/G+Tu3AYpMTwbGM
	 gj2GLOWHOuWvVX+PivS0HFgSa090Grg1rCOqxHauwEOdH3Wh3mMJRr1SByPYE20rwizar
	 qiqFEfHwnIN3r9ODM72lm6WPAgAWj7ThuArjy5t4FP9MxgceiV6l/6P0SCn0salB76ZKo
	 bfm2hfS/MuqyU/5D2K//wXeqA/l0KeeyKEOVDnl5e7XrJ1KFUJLOMDSWOOGgbB9WCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
	b=L++hAh6grhAe0U4SVuU8mwyv71aAB8ujKcqgDferUozATrzhVwJYjjj280kJC8G7JW5C
	 yEDG9iyXIunQL3VUx3LNsg9HuBeO/46/6NQr4rJKV6ScZlOQVMb6CWVTuagZt3+BuYIOl
	 0fbge2iK2ELrVNPiD7ZO8A4G2Ce+rx+yOQSGOaOyx4naMWCDv2j51tvGMYP4/JS4drbvb
	 1mESRIcHuVSd4XgLZbpxxs5QXaJaFl92uGayC4k2QJmUQA5XGeYReiRxjdZGWUxhCmUNo
	 immc0VyQhymmRVrDYvJz+hskQuLi5pQ0stZ56Xt1HRSN63ERaNhEGw4eVZJ2gYsLwmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IpDukG6E;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7A0606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 18:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7A0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IpDukG6E
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so1863129c88.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778867; x=1793383667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=IpDukG6Ecza4l9ficU4xJSei12/9cnvu/plig6HIPO8dWMC+GZnHt1DkJrofxFrtf0
         uWXDETdXyZ9+55jsb5mw7KPKyS3tOFjlhQ9LYnD0ekveyEMPIjX+PNeTO7SVtFhAoKac
         Hb5UzcL/1erhWsV4PXGeJ2N1Spqgx156bQ+a8zBCwUh53RQXuMUwUn0dxdCl5eFs3LoY
         RbMlHKg3WUtIg1DMV4Of0xO+7ARSWX69LUFFnZR3WYpYuSMkux0cVwya1e0iNiHI/6wa
         1ntuGPvnyIF73v4zF81e8ndWhUmQSGxov80XK5yZkCTNlfc4j/DhLP4Wn4Z548Gkk0HC
         RG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778867; x=1793383667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=WfrICqvaAE5ujqFKKkyT3Of/mCUrwasS77Pvjaae+ZQ1XS6tA4O0E5XgL+xHSax9n8
         Xnu7BKsrk6pVUyABg1icLfOnKTPdvTM4NRk35L7oYxO6FLfLKssrVz7W4Yh4dbo+uEV6
         endDtKL63M2CL0ACSI7FshukjkyR4rBKZ2N5lXvubpi8+ujHcknZcxHc4iUl7+beHNlK
         IYDV1itx4kxIpB6nzZY+v5OiW2yxqeOGjJBljwi6R7LuL/FZZfUZV9MkxK2ftt5n0aSe
         AIHmGp5WgewqYwi9i4Pw0HzwDoPrXCyyPv6es+Pt4FXpkP+3cnc9V5EvZj0EnehEeiio
         qy4A==
X-Gm-Message-State: AFq9FYJvy6xa2PDuXSzFRh2Qel2VEFLM9a9wiF69WrKvFNXhK0Ybue7t
	UYg8ras/BY399slO0tAtCM/BecqpymOo3tmHQX0Nvm0YKM6Ju71GiDWpjfrTvrUX/VY=
X-Gm-Gg: AYBFou1s7eKpOFcJd0KPhRKV4NzrTS+lP6VR06YNkFbPZkpgc3T76S8rlOT1yfXB5ma
	pNIQtEJjOh1NEN2Y9nyNpYDe2BDwcK/+k4+fyXlhO06JOS2OmJ1qgRbBrKo2QcOESYSpi/KXAVE
	WEdaGN8fLAGk5BjuaBv1YTdRoyeUI/gCKJUqKK+GusUkI/qnrHturm81V2Yg4rO4J5F1Sd/G6iW
	51SBa3hHvz8l4ChNyhjx7lLifbetM0QaOBHCdeswp5Cy0Oc9leVuAzruQXvr1hRu2z70hfVnz/x
	9Jbc7O+MPMKcLk4PxBpyFl5Rl4NlYWlJpjK6xUsvdRkPbmG0jNKPF77tGihTXRHSs/zg8IVUAjP
	Jq8dVaXyJ8hY/X6aMPBO+OU5p4I8IG+Hmxq7wyOiONqaEz2+fQVqe0chPNowrq45EyH2NV53w+F
	wFBpYAZCZaXfvweMNpZ1I0MpcHgAAr3+MfTdME8woH3/7GJ2BtFCN4+JhkME34Fg9Visvd1R1SC
	69XnRwwZ/KsKFbugMeGygzPhV/4BABvhm/ha6L6yTP/AkG+/+PMBixsIY5uE4s=
X-Received: by 2002:a05:7022:250b:b0:13b:3132:6e99 with SMTP id a92af1059eb24-195c5ad17e3mr6055983c88.20.1792778866606;
        Fri, 23 Oct 2026 11:07:46 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19886f790e4sm326318c88.0.2026.10.23.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:07:46 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Sat, 24 Oct 2026 02:05:12 +0800
Message-ID: <20261023180513.36417-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023180513.36417-1-kaipeng94@gmail.com>
References: <20261023180513.36417-1-kaipeng94@gmail.com>
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

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..027207758cab 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1240,6 +1240,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

