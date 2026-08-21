Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE748CD64
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312215; cv=none; b=cVFFXEYMmOv+0X+/+kwYJdlha41jGTqLvnmL5SXFGDQzm4RfUlKobir63ZgXSoAqiz5zOXi7j6Pb9nR/wf6mcRtXTFh7MDy27cwPS9G7y7wn5nc5YyHu6ywXwewfAYwJPz1LRnV20+EFzN3d5QgGc43qyOKoNvlzdgY5z3Rygkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312215; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJU8SWyDfno1zL4/46PIhzW0DcsvG7n8hxu13MuMgBcoQo3IcEbBHOps0qCoVJyl1+hmVEfJ7lH/c7oPsPE62RzLvjSJlfZw1SNJRJJx1RbbgbU/2H6Y0tdEc1K1d7rr2nYbp7P1NW6oyECelXrs968zxxKzjssxte2eWCX84Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrFkNb2y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrFkNb2y"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so1538145a12.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312211; x=1787917011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=MrFkNb2yrnREKPLoofaLYbdPF3eSLc6z0drf4TGInqntuKYSeVTppHpl+PLKfTAfMJ
         UDJ4L0/uTAq5htHaZyEAU3imO6M3X/b+1FED34nrJzP9a85pgU9r/tkC09X4RWXn2YMS
         4FuRUaUyY7q/dtI8djMUWgKo8bIxQ0o4LaHg1NCP0dv0wGecSUEbSblMXFl/GrqYcJpd
         W/1RKsOcxIfaqrBJodZsNaY6gti16TGCy/pTW3jLWFaQ1dkp2cuVyrycLaKCnFuk1OB0
         Yw45xuoTTujBAXVwMrC7mcaHbS/oQKHErwvy4dAaMDf13gB46kHf5BuW6gSdzI2KtLqm
         INug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312211; x=1787917011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=s9+HMrqYmCx+61QkRisuJ5MzkVOTHj3T+BFJqnESgNFW3AZ6D6lWf6ThBQPZ+1vLbN
         t0+R2Bc9O+raFm4C2XfEf5zgq24nkDc42ULpzVGZbdgt/Ykwq2mBeV9aBA+NiWxEfQIb
         ViRsIvwAkU3jImJze8iPnM3pgdTRYuPAfjKzmCnb8DJGIYr0VRBIU3gH/3hS2FFfXIdF
         WRIMi6EngABgff3MRPVPP6wDe6VarV7aowBiy8ZrGX0o0kkd7LN/QxZ8vYewQ5LdZi+f
         3ELTj+vdBbyX8B/DcxmYqAmR1JaWruml9WoF4aLZ3dN7NrjScau84kuLfFD61pVRWvha
         GMrA==
X-Forwarded-Encrypted: i=1; AHgh+RovytHzKSCQXflCVFIZXlMU0xs0RNN47Vos+z1SA+xgLO+qQBzV0AZ4hJJrpZ90fUP05x7g1OR8Ax+o@vger.kernel.org
X-Gm-Message-State: AFuF++n8XB8iYC4p6Y5yqfChSl2B8OYUmDPapZgySp8xiay4uljvcKdu
	J6mgK3ii2E6nA7K5cFe21uj3XsbOERHjhFZnZFGpQmJiwJBcTOETzsE1
X-Gm-Gg: AR+sD11hUXBq5rud3KZpKD8226HF7oc8vXQzArSmDtubBW51UbibToSJ8V3X8VHFxCa
	IryrrE6Xa88QvUEs4VCy6saqMVtmiIRokUvw55iIGd+p/vtdx+7jtEwK0bpxSoa/j+aY5U3OZ5M
	2NzuJ76yyW0i/N//RlwNHe9bGjgaxDgjV4+VqbhQuqm/msAxhIv1P3K7ZmZs1t/byi/B0kO4RtY
	ciFVnAhoJapO4WPZksvbHijwNcmXtBfOpR03a/Fkn+wbcXlitDiCKx0qvhCwnFE2Trk0HMerssb
	+NYVsr3PALsvSF8KwgZ/aMQdNlEsjCcT9BH8+FBnkLJsYjzj6gCROrviTQrcqxIMWqZBfmBS7QH
	D1ZhOb39znfJLkiodE66d82Az9mOL7TVsFsOBXAY/teNva7n7KIMmZayHlCqKbksJuK410ewmCf
	ErjMNHg0dlcCMMM/9PQg2mX7hP6K1N4KP80nG3EdZHAlWnkRwBozkqhPbKDgO1I8kmF5d5m0+y+
	eVmW0RxRMJJ26n7MDhlDHE0
X-Received: by 2002:a05:6402:270c:b0:6a3:ee5c:8800 with SMTP id 4fb4d7f45d1cf-6a42f1ac2edmr5170860a12.8.1787312211244;
        Fri, 21 Aug 2026 04:36:51 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:50 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 13:36:33 +0200
Subject: [PATCH v3 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v3-6-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
In-Reply-To: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
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

