Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342352;
	b=r7UJcOXLcVpiH7OIdTzE4SwzrfoDay/WZnRIKRtE4Z5caO9fdq4K/tSI6UWseXTBsOId
	 CPhZ8nUbl844B7FzxBfKyKRzZ5Yetegxsx4ulS01zDSCVHTf0bU7FbN3JJCiYhI/ZtJnd
	 TfecZ1IqYI2KhYoM7yk2PNAY8s0xywdPa5M75v/f/Y8Rkaq+9iFmH0k8KuV8jcjfkoELF
	 KJOXHlxyIIgUchUl4HvZ/lzS4sxqDkX82CWtXL7bjakvknyPHOMedJEGsy/4M8bglBdVh
	 utH9anPr7pRJlsGw9Gh6fZuXzhcXLzbhsh5jC1KKsDWKs/Metwsbuj0f5/1JdIQtHLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
	b=rHnz69NFAaM2ees3+W4hjniNnLULy7Ry05SbZXhAztQ7lobYbe9s0plkOUngEVmAOk4o
	 Fw98Pd/fJUUvtRLDrAHn/MbN08UN9KVkiCI4FcVIj/aom/siAEhePI1l1JM0lwkGMbtmK
	 H5FtYWMaGFNnR5gcoLBgGey1/B4tHK16RZ/OFs+OxyXVGCKVNUwEVrvBdaEhIGWQzZ/9c
	 0K2k1+kwirLJkzjOfFFfTb4hvfXTOscOHyDjhkvbEmSsklRvEtOgiuqijpo7EBEhcmWye
	 70kXtmaafNRC9G29gvZDteyKzc08sZxa7dmcV2I8K/Kw4nox/A7+dfyjpZPkE751g8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWN4Qepk;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C439606A890
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C439606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWN4Qepk
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-703be215729so1031956eaf.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342351; x=1794947151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=EWN4QepkIXCVIdcKNmzFh36ehq8MrWn5PnXbuYBRx4cSX37gjR0oS+0Cs8X7utggTx
         hfOXC/O5QoRI/uM8+EWmnlP9JYuAihv7Ikg6fYJYpzL/sj30Oln7vW+jYkPJAbdTmr/K
         uq9qV2iBwRWdpoe5a2mKAIgxNMJhFISq7Sxtct9eJxcVY0fFYrOjde/3uW7iBeRvyxOP
         MG505TuGjvQZBr+D1dKg5KezNUOE3S/FlBegk4ZGChrKotKmmXYs81fa106oxqs/rtV2
         gvjSXGok7gq87RucKQuCeqd4KJU0MTXl+FvFzHXK0Dh/yAe+ozAOV1LMYrLgjvO+hRMc
         vh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342351; x=1794947151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=eRww0ZRppBYqWq2j3jA2XNBq32Pvx9yoQiTgwETX7fA55lvmFdcsgUVrwLL6Gtuhmm
         9uJlQekBXwlVYbFWwaeYEX/Rz+WTYTApdPT0R6UNV5GySmxlVD4/389MU+1ms63Ss/Ew
         P8ApUcP9cSBFyqhwzRU+p90EKJxGLeoBRJxEky65Qkww5Y5gUIougH+B5Hk0M2sCGBBV
         nhEqy1smmW6/FvjSnaUYDq/GHt5tC41CmfTzaHB9whmCli6YBvxtiL7RGFyugGqmwP72
         VxGHdnYqpM7I5l/Nrb876CL2L7inT52SPlyvHnTLWxoYoHEF2epLx43z9S6/adglhvpK
         WTFA==
X-Forwarded-Encrypted: i=1; AL+hErEyMTRdu3TLsnOUnBWkPbgpdVhFrBXUbEP5jqE47CCVh5LO6p9Mp2Fva0BoqHg/bcyqdghM+AoeH4dx@vger.kernel.org
X-Gm-Message-State: APuU4Z9h2zgHz9MevL5lOGQu+URf0MqcZ7NZoyASreQKAsj6keXP3dEV
	VkGKwplg9QKTh13Hl+Be/b5RTVJ8GXnADywBLi4+GU9OXb15q0DMxKwG
X-Gm-Gg: AYBFou0rSlBt+pMffhOMxFH0DXH25c0iCpViGBgGwJ1KjC+jTlH85hpSJKkBFFLdVOB
	NMioRzMa8i7GYDxl5541eTwjMgXqTT9gAQaMbd0+IaHzGXHv411XDRoQ6VsdP4CU4127HB05IcE
	xtYTnvv546KpZP4quNGDfnpajrgTs0A8OuywdDXsO6OOu1cKIeWegMlHdMNtml8NjPtAVHuFLm6
	Mm8jH7vQxw4P0tEo1LCmwAOkLjl/AAFwe4gXYFvCBO9pdjhcMkpIRXaGtQhDLWPMPKnjuGqFlBr
	OsnoXCXvglo184AFViaQ9PJOw/60cg3P7PqVjal1covxi1phe7fh2rhKhBPaJqeAayX/7wivqMS
	HgaIGGP7FFAKZg4yCO0nLXwe2Jx0EbQVe65SKQnQO/0zzafmKzY1q6edoZk6TA4pW6pWfmIFH0K
	T75rYL0JQXRie5rv22VPeNi3wTnl3WC65sa+6QVoLccwsSxwaT04lLtDKH5rnj1QyLZNBQaHlrL
	ecqcABE+vVcMvpfvPWny9QnrwHNVKD+WVylANxwsFrxxU9ex+MPUANSsviSD3ecJqFdDhZYmgBK
	NcOCxj3Pn8GeKXmWQfuJaMYBCHb+GphFo9mFcfkcV6ex1hDyj76FYA==
X-Received: by 2002:a05:6820:c0c2:10b0:716:cea4:5adb with SMTP id 006d021491bc7-71917976877mr70777eaf.68.1794342351084;
        Tue, 10 Nov 2026 12:25:51 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f645d4sm2353252eaf.5.2026.11.10.12.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:25:50 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Tue, 10 Nov 2026 14:24:44 -0600
Message-ID: <20261110202445.14100-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110202445.14100-1-jeff.roach0@gmail.com>
References: <20261110202445.14100-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f6998..c3b6014ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -212,6 +212,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
               - qcom,mahua-qcb
-- 
2.55.0

