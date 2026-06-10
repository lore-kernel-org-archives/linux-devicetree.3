Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738B395ACC
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081873; cv=none; b=frfn3bljokJnm90MGEcWo9YZSQQPCp/VYQ+N+v09foGx5r/zQ4WzxxEqSgkxZaBApMJUMevbF2mc/HzhlfxPzDh5gfFXL+7UdUHvpKDoE23AbEmVMio4/LK1w+CqQRURyg6mMY2TfJ0dMYV//CekttsfqJnkYWz2nxdMxyckm8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081873; c=relaxed/simple;
	bh=JPhO9x7o+eXG0DD7v/jS2/9/mNNS+zlAlSvQUO5urbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrHqxVHawPdJJw7gRJ4smoV2DEGgcTpkUI7fQG8HfUwxassjmd6T0vh8ECFIG+GnVlHNlHkZkQBY+eD/J8FU2cEkc+N7D8iJun9biJzcZftX6UN7fJNpn/A9SdWPrxM2h425/66k7J9bdU9a4CbxdeHEOzJXm4lZrr+w7Vc+hs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=LMZcOLVg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="LMZcOLVg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so82461305e9.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781081870; x=1781686670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPtggOOglsf/NIJWJbOc45aOSt1dH8YIYoHoL72b/o0=;
        b=LMZcOLVgS9xHay/9bSWzjVLze8reib13vOvL+xwVNvFu5S94f5yXspQeqo7mQRfsD/
         shb0RB76tCtcWEB8p3LU0HZTnCD9og5NXIyxnjXAvUHIiw1fBAfTi8hW01fHx/bjY+Ru
         P+sryujNlykxCGV7Y8CNX9tn4n2bLh0gRqf7XxY8ZqmhxViBVjKxsoqdrq1gtFXJajbR
         McFQ1y733nqIIKvhwWJeNVM3uHwWTFk8xrqGjeg/hCiCn2qqzmGiubkb6SK+L7NC6QyY
         vghmeA3owTZjTIObssCFybWGcNnfu2ixGezkDn3JHv5Gv3nGKwRbS5EHQsgy4Q7mB3Lq
         WbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081870; x=1781686670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WPtggOOglsf/NIJWJbOc45aOSt1dH8YIYoHoL72b/o0=;
        b=EunFcjy5yR5mNbI6n2S3GVLC2b5X8rPNiH5EWqyv9yWjwhNDiu8RjR4gDt7FmZxQwW
         /YAKIi4DmXUi9lWE3bTwD7h2BmSaeHssAJipgecT9gX6pHfssiQQktLXBu3IaWy6BpWu
         jDpnSrBT7sdUkmxooI4XCyF05pZt0x5x64Utj63+0SW4Ze30Vk8n+llppTIpBvvdasX3
         QW/T00gihxuv606ErtXjQqtq7KkCcnyiD8JZ3vdr4vA0ydq416YYj8Ya2DN/AKYiRkXG
         qQIgHptg/S+sYAtTjV3PBgd4uYIbuQcPrgZZamnizVSAJqaSr9rLEpYAVv1/CbUVtupb
         yT1A==
X-Gm-Message-State: AOJu0YzvlS4HMGKhLAJvWwzrXsqS30dlZZ7OudnycrzoQpil+DmczF3N
	82iYO15jBfFopRlv//YlaXhwWhZBY/jONk0xRh2QwNVw6KrhPKHDmKlL/Wa7NZOqF8A=
X-Gm-Gg: Acq92OHDoEVI1jzfCRfLFbmJwaaYKMjtb6If5PsuPdycQG5zXQmUvPYskPElQdrZ9Jq
	vWBKdpNWHB+9FO7wxeZXvlqjrcCnifxM0iqTu+CejSWB9wP8aAtgfQ9i7+/E58CAE6ZCPm2WWI3
	sPshiqii32vN7hlIm2dh/KX3l5aXyrxrAOviyqjMASOLBQiL709TqpiTMiZuWDgzWPnT3N0p42C
	M4sHMwFYwiKir5AJiYQcSWQcfWDtjPbkplt4gCzG6yobVmPMZKTPTxdySXtSrcHXQqEWRlInikZ
	HsU3bYd35kRorDuRkPp4A0hF4qWdDK6icIJLMmdDyuc0RtNG2vCYZhGmaQlQu/PqHph113KnsqR
	7IJ319XDgG2NZwdOzf3MDL9OIoozRWsu9xP6dg9RuZmGDEIFQQAGdwHNA96mlbDgW+ZpeS0XsKG
	MJj9ex+Qg+3kHkCElaw7gYO2iNoMrVEF5otJ5oWCSnRJ7xJVx68jfBoKRsXRWaF5Y5SoTA8aPhZ
	Yh/H4EleHvHb6Rh8JrV2Hj84BpZIfJhjA==
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-490c25b09a2mr399439675e9.16.1781081870227;
        Wed, 10 Jun 2026 01:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm584495835e9.12.2026.06.10.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:57:49 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Wed, 10 Jun 2026 09:57:46 +0100
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Document IMDT QCS8550
 SBC/SoM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imdt-qcs8550-sbc-rfc-v4-2-358e71d606bc@imd-tec.com>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..ccd7b478e5c9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1105,6 +1105,13 @@ properties:
               - sony,pdx234
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - imdt,qcs8550-sbc
+          - const: imdt,qcs8550-som
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,qcs8550-aim300-aiot

-- 
2.43.0

