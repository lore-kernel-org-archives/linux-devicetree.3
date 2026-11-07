Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018319;
	b=jVQeGSmklpKEN83ltn8uSoftKo/QBwP/UCTI9hTxw96YvTrP9bjXLm68eIhg/iC70B1j
	 NM9INlg+5Er4pCxuF7fAAL1VTaVcakiGfSAMmgo562dFaO5uVqJcxkkk7blR/Wl3ttER3
	 vzZfNGIG9788wzyJoXE4gdn4riNtrFzeT72KuDEmLqliigmxyVun1mefPG+oD6VbtmHxG
	 lYZVxe86UWSEs6Qy6PH9QUf7Xh4AgU7tlonpC2JZrOZZTYBEEffnRwdg7xODKi1+w//J/
	 nWs5AxlIdYGqRtoSYsl1rRJdy+eWCI2jwa0eb/1TSM8fFtboGtZGJHmvgyhwaB4PnIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
	b=s6Sc/jaku6QvChoyMAqbwjJpxqQIS7i2JcSSafcMdD4+NyMtFZmrM3VR7zl9x7FsYYOC
	 22P2KKKlg0WH5Lk6XXivlBARGv/i46MeawVhYHwzWq4oyWlEahGsja1C5yJZcDY1Si1ng
	 CYAn46TTuOENjMeLSA2j+g8xzyx2Huhf7jGioB1sl/rX9EWeu8PI/moKPe7MR1CuNs1lF
	 7dQ+MBE/uqOv6UUB4xEVrXqPm/LbsYSKb5yMktDkWNhIUtiRd8Uqw0MWLWxh9i1PVRZxI
	 WXER7vVi9E5KI3DzltOoLbTivekx7M8xuSn8ndn6xaI1NtIrdTlMNCL3ZtlwyoAY9+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwycBg3c;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE34D606A32E
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE34D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwycBg3c
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so247595e0c.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018318; x=1794623118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=KwycBg3cH1HqVRW6kJ7+USn537IV3Da5g66Atl2Gquu0xboormo2pgUjXPRdJlb04C
         4YKWvr3kM08HShpURq3K4VuvPSVt0YCavDKlYhTYWcOB4DH6I/uJ1h9cKa1W3i9HVR7P
         AGSVhlFcXjBI4+sHhECBNAmCTpY9Uwg0gJrQhNVBUQBL4WjAl6X7tlU8Evl2Jc+zT2UP
         3bHl5WlJX8OAweqjEVhLsfN8dNjZ6xcLCdFWe/AqdeqF9bfTbVurtxzve8zV9ZuY6Cm3
         3CELI7dLRTJCuv+u1+F7KdpZh8PEuitufe9gAVbFk+YUSVlU6dFoEpMKPkByf142hStz
         rdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018318; x=1794623118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=VSZR/r4PdK8H5v7hHxdNDE+jB3Iu+jEtlE5vR1bYaq79ei6Kr3YYt8HJuoMSZ0WCy8
         Gv2EPNIijgyXOvlJnu0BSMZrcKLVfVlCJRbXSt/Dsh97eemabS/0vQYDKoK7a+zpU8CN
         gwmruyUO3DKJ9GAS+BhFh97AxhVTdbaAAOTi6GQi1MfTrOuXfp8djspbNXwwHSGEmKlR
         vXfa9qrucsbbeCiGmzOdyREkWMBC9xV6L4cePPxifkTLexraNJXHvGS3P7v/snmtMmhb
         Cm7ACofxkGOaeHt2f28EEmmVqY0i9iRzn3JkFrLnRXodS0kDBCQjCz/hE7y3gmp8+XFX
         dz9w==
X-Forwarded-Encrypted: i=1; AL+hErH7enoHIaZKuRMNqY9Xcn5HlTf8KjbjX+LSLrBR+HMfZ6vL6hEiaiBTMv5uZwIb/SgEIGZeJ1OYmmTT@vger.kernel.org
X-Gm-Message-State: APuU4Z+yrE5FT5DXVZbB+qmTLo+BBwXvce7VfPvhPm/fG71G4W+C8IWW
	9vVmba45CHBNwoCFCiacgtIOGIRE580l0pibLJI/rrb80D7t+BpzfSQF8IJTZw==
X-Gm-Gg: AYBFou0rjDhP+H+rWMPhr2iMLY8iLe0u3gpk5HYBnw7tEBssDbOro7t5FhyqXR4Zh4W
	lQZBQo9kQrnKG5OXoSsYyFasRt8A05TKc9yUQsVlNLDOAWSm+fn8qoin8qFvqjOUTefPRmKgRIm
	w+bVYyBgF2w/yxaOd4s+z8VuABM+k9ENwAqDkJ3LzlfdRU9z7jju5Zly1Gq/kLsEQAXsZtMjEHz
	ZWrQy5tpVpDRyqDQ+6fqfqOLkMrAnjYaJTtJ8wRgyhDFkJAcy8DAbgvZqzZl0LC5IdS4Wutr34g
	94uJ9/SIWvSJzrCneU/JtmKQya0BNU6FnzJc8Pfqp0A6mFuhZumM96GxMnjfYw2ynTEEd567USZ
	+OaOaWk5pEQ8sQG42iFPaaSU+r5RtrPKf6lp+8AvQOXWatrzjmW5YGI0hYGPj3fxvVj3VcptVCV
	mNgsA+IspSZ81e+luYbDZaC5skOuSTdFGXM2qAyOWrB4IBJ8ld9+VQxF4HL/umR2c5ZOTDy5NJU
	w6tOwpCUXK6nSf8hMcopkcBigCafThPQQm6wFeePI8AO2tDZLANvBMRwNsGp8Ny1hEAHowFN5/Y
	eSD382+dM1vGQ8/SyYwx8aUta8eU
X-Received: by 2002:a05:6122:1dac:b0:5ea:aedd:6077 with SMTP id 71dfb90a1353d-5ecd1b5db23mr209349e0c.5.1794018317800;
        Fri, 06 Nov 2026 18:25:17 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64ce125sm2548910e0c.8.2026.11.06.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:17 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/9] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Fri,  6 Nov 2026 21:24:45 -0500
Message-ID: <20261107022453.159341-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index f91276822858..7862d68c9678 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.56.0

