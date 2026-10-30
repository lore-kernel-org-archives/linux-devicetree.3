Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346260;
	b=BDntP0pORTr/U82i/Ck9uK6kJA3kCtmdR2gFgoYEHJv6ImmmtUDexWJ6c1hSXqxeZnQ9
	 oTwV7GO4yDrsIO/+k9DASeNOfv/pWWwrzTlwaRLM6Bh+6LKd5JjXeflUJkUr6BPFgbzY6
	 7AIhv2rwnHupp7QX5wx3R08ZNOJ+2Os0XeAYLRLEiqwiufIRxkvdjxaEUBQKg9T3qzDrT
	 s6iQd3z2a2ZavU35sQhBLbNruedVc1/5a/SJH1H80Hlu9nivYchpyl8nrPDYkYYNp6rDq
	 dr4BUABjFi1kK4fywZB2KU7N15coFLB4wu859JOWZEvb5gK7HZf9MlH2OnrPW9IXwqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
	b=KsexMlW6FhHGBqBJuvr11ODZ7jCzKdhxO3GWoetKh8kxtRgdmghj4ehGODSnUNMOC7ck
	 xSLRQfYJHpnq7Vl8Pl7G/RPBfPssVXCSOw1T7No8UsgaXzJRwUDHUNv79MO54mGyUmDfZ
	 ph/ujUyInnOGn5yQ+BiVvF0c9fPjJBEW2YpSBsKnNogypigypWcl5ITSo6+HuI2K71vjR
	 ku4uqHyQ4d9+gRD/V3ec5/4muBtY9ONqI8thcQIOqvTru89vQLjwQk4KGnKbqeLafCXme
	 qFw4kyRKyga1bs4Zg7mjRMsJtzv+eO1uD9lcEg8wgI7V9PVzsm7z76nKnv5wO7CtrLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX8paL5q;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B216606A31F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B216606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX8paL5q
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-188406bb948so367345c88.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793346260; x=1793951060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=wX8paL5qsDtcZsMgSgtZu/jOrHyINzw0qkafMwUUmyCKUP+cPCQ4QfoXL86d1EgC/J
         vrzscfNIIQQmsTpvtNi5putEQE64KNqjVHVR24bmfCR5IHqBbNc2O3KY/wajJsj47gTS
         eEelyAd1XBePozajS58A8fF5wVnwcLI3gIqhFgWdFyKQjuE2EfkO3QhNJeQBRJbjHSDi
         llooS3PoM7dSrbJerzmjnNuBNBQmx5BNdSrHxVzao/urNix0sPT8tzQnAZAso40RJXnJ
         7CY24bSy3DNsj8I9VxC2okaOrzxo3NVrwDd96BFgPyaxHRE6J5tgyigpCStizvxa9EA2
         sCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346260; x=1793951060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=hkxyTZ3xuqv9xfUmQVtiuYQza+bMqwunLvOzgOY8/4pLezm+k3JC5mP+oEqi/WxDvj
         Jpu/ENG0A60W7fCTooXJkGNoWMdhTYDE6t5MB0WoOciUphlY42q/e77CkagfL7fsJugJ
         sEN/ynDCndMp5KTeuld0isl7+Xz+HikvygPRcXPH6uIXWRPX8LjrvO0F3csCF4tSoh5z
         SzkdWgefxd60opqETC68DLSEqIoBDIFrmnplYoxb5X76RbnrhzgljjnUwwknMSnTbScD
         gPq28StrntOU5Jsq9hDq8l6wyGnCRA1nv6BVq0UBjoq/C9ceJAE2JjbMg3H3clu6KxAZ
         fUmA==
X-Forwarded-Encrypted: i=1; AKwUvBwiV+EwS/qJLT4cbQ71PfndvdcePdeS44WGQaeWZosUv2AV2QkXlstOlkGdMY8p4fy8IVFlGfWd4Izl@vger.kernel.org
X-Gm-Message-State: AFq9FYIeJlWmqyo0mZHs060fuNjOaTE/hxbtk0oBP8F9e9DcMoWsRDyk
	6l335C3+0LRcwY1Erchbmz087a2jqbwd4FhD2hgY8iihn/L9ZQR/CzbW
X-Gm-Gg: AYBFou2g1OVu0cUrvrarE0EImwOj8IFqBkpbh+Ynmj1lJJ0bADpMoRxzeYJLOESF3l6
	IQO2iVrn1sY7jdbI6dLyMB3j9UGJjFw3EcOD+I0HlsdhYq00O7vzDN3lkIygtHLtCTYfHhsAzr0
	+BvKA7SjLyT1dIenaFjTivy7+3AQ0R8MCx8/BrqvXf/8FHgflr0P+rfsKpgVJVDjYGVKSVFlh/y
	ynAiGcEMtGyB5w1uqJzCkJJAt2v4+A0wnZ2DsX+m0g/P30e1iPQ3FN6gWJKErs0Qg/ZdtEqlyZE
	R6FrW1Atzjpi/i9JgFijbRiJSy1eQGyJvg9pAZqq+xmeoTIm2Kyqqqajf4y+qXPmD/MqBeDsCwd
	+jyF0fZvfjTj/b3pQAgYvGj8odEcwdrhtXbsJ28bhlT0Z1UP9SN7NWOjwz2ZC3Jqw9GbgqkJ8u9
	bKnzrOmwEjrah91/c0GzCZIuzcNMoyXeOCiFX8wTiMDMCXIR672hJbt0RzSxlgwo/tazQpPSWJ5
	H/iFVhdKLpxM8j4Cwa/qE9QRnSl+sqq8L5DCEKMAxb7uNvSWf6XlRCK/n3+xooCYbHUzNf6yvAx
	bQ+C4ckM6/lLRj+Q/g5zpcixuwptnANrVKXtLJrserz814pP2IZEXg==
X-Received: by 2002:a05:7022:b0c8:b0:1ab:6b10:461 with SMTP id a92af1059eb24-1ac5e3231demr1805763c88.45.1793346259452;
        Fri, 30 Oct 2026 00:44:19 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:fd6e:e797:613b:a5eb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7466562c88.10.2026.10.30.00.44.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 00:44:18 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
Date: Fri, 30 Oct 2026 13:14:03 +0530
Message-ID: <20261030074404.33517-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261030074404.33517-1-blfizzyy@gmail.com>
References: <20261030074404.33517-1-blfizzyy@gmail.com>
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

Add the compatible string for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..02c0ebc3668e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -472,6 +472,7 @@ properties:
               - qcom,lemans-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
+              - vicharak,axon-pro
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
-- 
2.50.1 (Apple Git-155)

