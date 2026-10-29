Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281035;
	b=eyXnp8HfdalXrlmvlbR8GGwhnH0Iv7E4ehppEQRGbJxMCNYVj2XC6objY975gOeUs8t6
	 slI0MrBuIQ0tYhWz/5hggV7nwQfVSIAXEopTQY5T4TqN48CoARmGxjme4mx3l7kXB5o5L
	 BpQ7uuJAp1W4Gtcc35lhg2CCodN12nZhn1JqzAY59WEH7yJCjXaRuKUh8G7k0bcG3LllE
	 4cllh2FXi5WN0IwZCOT42S9EsV257CcbYStN5KBsmSQ70ven0+1hOEhB45K1H9BN+d6Ft
	 NXWonsVEOZfTObQsG9nugrw4I7y97PR9rr6R4tkFgrb8lKgVAz/KtPnPHkmirSbX0FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
	b=G3cB5zIPpaW9wUwRdhu38Ua9BPsc06G2NV/p0diueiQV3XBiBt6cc8t3lrWZsPcUWvUU
	 WL6XpwpdeOED3xU4AWUJyrY3bs2hiGxcpp7Bzg5Oi7PQ9a6Ozq4WJm0Ub9Na3y6eajhIS
	 11IbT5lg63HPTkFV++prpKd4UXZe0MkQoQpYsFeHe/ebH364ri/teFA+NiO1oJKerox9u
	 Gy66C12CyeJniVt+fVEn4LNjJW6x9X/O0xzSs1NP/ZMZ7b9rnCUh34FApx68Rp+BYr9a2
	 TPtIoy+JIz22WOmcKWVOb9BkiOnBOdIv/xAtHZDzyIrFP7Qj1uytx26zD3v9oxn4rIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5oLrkws;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F1606DA64
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43F1606DA64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5oLrkws
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14fc585291cso1906782c88.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281034; x=1793885834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=r5oLrkwsBBfgVRu+clc7J/4z+MzrJ+IO3jDMn/HO5S6EwD3wkPMG2SDgQH4U/jpQU0
         MGteoPtDNjn6z5q49UiYyeo82qS79WTzHiaStkgmEnF1EOhWDKSIGGeo0BuiXaCiCis3
         ntp3PBm2XOVBv8wx+nnYD5QV/LjugGnnFEt0/NKtrKCYn2pe8Hvp5osnT8MbCzslJS/8
         Cy0qJ6gOhFCltfdAw/Z/E1IYuRnWE47+F2FM5c5+cB8iK5ws7caX6PJe7dinSZKIpxYx
         4ie18HD27IEwrPQOfyMm9RrSKX/ZHto/QLjyH89t7q4OmRpQGtTw8sCRGCdPYbgs4+FQ
         bnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281034; x=1793885834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=Ukfru/0DafsHwLUsu6Z0xqNhdnHakqpEzdX85sPMv8LrG3ERlHCEvJeFonUpWLRef+
         szLapaWxFbYGdq/XYQblQoMBMJjZ+dJ9roB/OfLq3BUhjo7Jqh0azbMGAUWWsqYVs48P
         iUAh8/hvvNet5oRLU+Zfi8fOC8a2isJ0u16Sq2hg0RnMEAjEjtK1zMyunQijI2NfJzfZ
         Pnz+2p/8S7+DPGGgOFSKSfkc+rziap8jMXszVZj1icslcPjAKSiDB4f8k07j7dMHepgA
         pism9Rbs+erpXgnjoReQ+xeixoB0n2YS+3VzpzrWVCxnSQF8SHWJMVJew1PN86duXoAs
         Gv5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxv974jQDRJcvRLUeW1U92Y4nZJ+avLfet3UgcLBrjyipy2SgWrxFt6UFJofA1IZD+17dOkY8WnvFsA@vger.kernel.org
X-Gm-Message-State: AFq9FYJc8eGYRHd8oL/rK5SnORf2H0NyLrAGU9LgOiJTrtbLW1w7cHVP
	NGRB27fBCO5caWlgsMCOx2/0/xfonH1xovbrAXvpWzbcS7qBLIavdRaf
X-Gm-Gg: AYBFou0aWJLtoo+YB73VlPn6punVicNk6obxuR8j1ZxaAFrOUio6NADzfV09j/YFWcD
	3svAdL7nk/7nP+xnieOMgzmYQj5Ik8VCGHR2POnki3B+THdhZn69cp0l2rqDn2iDuzRn5/Jrakp
	BGgbstCmpOmVo9/zCy3UoBTXBgfj+aEf0bNRONxtJhQf0aIe6ToW4r61QneWkx7dMgUYgV7BTUY
	yYR6O3vSHv849TzBmWpa+M5QV5TwnfMHpBjlsmy9p/kadqiI8hxJI9BqWQ95EBsEd5Hd/6JMqly
	U1FwncE0cvn8ntBFSsabqXGoJOpLUwpqm093erJtpgsGeqqpMLL/8pgE2tnEybVt9h8KqQ1svjP
	AYwztyFINpuKKmodzn/vsEameF/35hzgnBE34bM9m1sM3DsP9+VI3D5rvM933ay1q4fYOIhGQMd
	/REw/ndGw4gUG69yAmLCZ7YMp+LdeM0o51NOQo+JDRxGzo++0XeKG/NRtDQ09TbmnLoQq33xcN+
	Aal2BwZgWTQq3SejsEXCcni+8+J2DU3VkBF6uqHGK9BT4/l8LgPF01C9KyREsjZZqjWvjUYWCKa
	66/ukYKFVHAZOaZOEIB7KEVvOjS4HhzVtT4TowFDwsS9qQ/Ed3FfDw==
X-Received: by 2002:a05:7022:c43:b0:188:e51:e86a with SMTP id a92af1059eb24-1a6c7d2be09mr5492426c88.2.1793281033511;
        Thu, 29 Oct 2026 06:37:13 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:cd0f:5122:d067:9a24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm17046239c88.17.2026.10.29.06.37.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:37:12 -0700 (PDT)
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
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
Date: Thu, 29 Oct 2026 19:06:53 +0530
Message-ID: <20261029133654.6585-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029133654.6585-1-blfizzyy@gmail.com>
References: <20261029133654.6585-1-blfizzyy@gmail.com>
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

