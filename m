Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07E400E09
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218978; cv=none; b=V8jg60j0m3OKMqpy2zmf7/0DCzu+9UW7VH471S9vEeUro9XQsxx+tQAkGOXGqyd94kRyIJ3YcIVyZiijXxDI7w+ilBre9VrI8ExMUKVWQg/2xYB4ws+SLx6CGZT4fZM97pc+Llx3TCLbfU8I5fEebg2wlRFGCzyUf+HmcbH2AlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218978; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLmQAkno/iPbKsBHOG2HabikulWqhk47FEolReM2WzG7uP6l2yTN2oR/eSmN72FQbPQNJPS2n4bQ5ZJCfKUWxZhuGckQhrkETAQRuiJL9nH3IZ1eBfcXjaHoU9aYK7HGukwsAFh/C2byaezGciU3ODXVcRPJtOJJeHCUELyPExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYQrHhqw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYQrHhqw"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4815b8781c7so988035f8f.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218967; x=1787823767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=JYQrHhqwDunqVDwPcJHQUvP9aXnxfrHW9Xwakk+BYY1l3JiTN3MewFxDzsoGljwHKp
         scScVkTBq5ZndXqf0MPLPiISlydMfqdIpCicEDMH1o6xfXCQKeha5Z3UbT0/BV7xWQsU
         WXP7CaktAaJ5K5Z6vgBhFrRDGHiREoCGnh/RvcQ2Oi56gNpgJdrjQMKkdxbZul1vNm5+
         rT5DCVHXsAfhugDOzBbhRDakI3cr4UQgIzfNNloJLwI6qlbA2NI35C1JAC0AywadFr2H
         lZ/Pzd2qPGjgcUsO9S76xU6gTRupEyVWoCN09LMWk6IgKhN2x/rpiXJzDEMKrSd7kSh+
         mNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218967; x=1787823767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=VlT6IteiVTKjtTP68BpvbMDKB5hqw4boPsG9wT6ZA22Z7y5obxX6PXqZAJG2KNpZOe
         Z5XcBftDr+eLVsg5R8FQ5+QdFgKDFsYCzEndL2VcYTwbVr6fA6ULePXooCAhixvqYtGI
         RjsX9CZc9+1jrgqNdPu1Wbs0sDkh/Kq87Xrvyixz5ZjA55mVjShdWgoros02rtUGuDRC
         T6c/OgH5zdLkA1KLNLE+8V1jbCKSdzTJPREPBh0GYVLVc11OXuTPWcBv0xE0LhY/hyrl
         WMlRaLGxivJh0RWkx2FWMfD4Z3vIVLadewptCPqXM7C9unlqO/T77P038fstlhJlSqG9
         Sj7g==
X-Forwarded-Encrypted: i=1; AHgh+Rq7gxNdWecnU1lLqpheaPfHVA8mQvsSjvDZGV1PRuTwHXYuYvOA80PPWnYX788/NnAmFG3fz+VCP+U0@vger.kernel.org
X-Gm-Message-State: AFuF++lGoxlGXk/IfsZTbQdCkvv2hXDiaF93EWwSbmON5ul6rAeHdOZs
	eBwpXsXmquTZ8oXh4mlnhj8gVhFQfOM8XrPLE6ucB7F9KyQtKHyYt+Ec
X-Gm-Gg: AR+sD12RT7TkJYCdzT13Y+bPWIzKMSyl/IjsfhQcDI0a9yTpfZlG/MWz1lt8HHfgj02
	3ZRyt/Rc20uU1/etiHfgcpOjQevZQ/93Ynr39474hfYrjIbtvfgAnYL64FdivtNgVVVVEl/SfOH
	NPSlLg0ZkPD0lCdbWnbXBnWguaFg0jkd+YAVoGvQvErLsjH7Sqr4+XdTfXYNPRFMHP8AJd156Bl
	1UvEEq9kSygfSX9Fz449V+acB8T9q71aurDHT0uv9Rsw6/Lsy4mHAjERVgbddNaBdaY2HyQvpjm
	iOxB6xHRekC3XtlTDYh0ziatmhkrFt/1xmWUHC5ytUhpmK6XPpN6oUdx0zbv8UMvSBtbl2O/XWl
	MpkQJIgB8j7BJArNgV5tqE96DDtooFzH9tVo9zSV+bhh8rMXVTwffoFto7c91pw+MDdmXCwEOvl
	VieZzkdnNGm1HSJzd9gSTn9T1FVFnUXGho7MrnJeFOqLUmXr687kuwmOTm9WyFsR3QXdYvzBE0S
	T1R5hjjHSvqXlj9Z7FJu/mD
X-Received: by 2002:a05:6000:4b08:b0:482:9a18:d753 with SMTP id ffacd0b85a97d-482b1e872f0mr21368794f8f.5.1787218966783;
        Thu, 20 Aug 2026 02:42:46 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:46 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:29 +0200
Subject: [PATCH v2 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-6-7130d68183d9@gmail.com>
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

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

