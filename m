Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991405;
	b=NEM3ucQh3kC3j0xZ47HpkAf4Dn8m/VFPupQz5fJcfWiBmxI7ixjKa2IBPWKTCFZ6D044
	 TYXwUotTEjwdYE70uIlOhSMZgJ7FDnahLaje0+tm1WH/4+U4P2mOl1PTDGM7EIZfVk9ep
	 zXAnaUbAxGX12Jil7vHxlXXwbIe3sX48NjWOiVJz8RqT63XNNdOvdXOhzO8+ULnGs4sBa
	 j499Vx1NeUHGEUfzSILMIuD3op86H80c8201oAEzzoDMRm1K/G4POZ6DtKEAe4f3rzgAU
	 /Aw7+VVVzGhBDwQANcor2u4DADBexemhn9wWXYkkjXhwHsjeQUJvcMpH2Gy89Jn7k/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
	b=w07OKzb7sM7EUt+J2PRzcCITuJ1tP54PYlwm/XFo/1+RoJeOUmEccr8FL5s6RmYyyS2d
	 6OcygHO6e23MIdjcK3iIp1FlS6S//wLKSG7WKGMBcGyBMsV5trMDO3cg6BCEuA0hsNg4Y
	 DyI/yWeVJTIFr+5RBc77WArER4+j3Z0LyuU2oEGMImCjmR7gN/pOSISeJol88EMeGhlR8
	 h9HpO5/oBdEXrYxaB0E8WX+dUoAjNsJuRfx8SMfAj182wgYek6hU76ZAOyqQTQo+YM0yL
	 qRN1WriuXRxXbUNLyOSrbwRXnvM7bH4We5pwXpt7/8bVewQ/OSUlzPsj26Up9FMsIiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB59606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB59606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1096153eec.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991404; x=1795596204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=RjW9wJMxBIaMicc98otnJOiMl0a1Yu3BFmOqdcpDp9B5AkZJr5Hox6m/x2IrOo4xHC
         IF+3eFwuS0Ymf+BE1X1VGW9jHnvT56gUg4zmnV3298ZZ1IVExtqDffg5jaOEm2bDowfz
         rvxkclyiwP1y54h2htM4Q0SCk5iW3rt5klpywKPH7QLiqw1jx+W6Y+i1qVMH6pHekANs
         FCGXtZ0H9OA29PD0YAKTCCgWoWQZgM63xd2OwswLmRypebAUWriQ34XKT82JzXRE+yPx
         /ZnSEtE7WPP9lUPOWdknOLhpbrA561rFilQla9YLThJMPlmjDo5JT3VRx2V85Udt9PBC
         QfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991404; x=1795596204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=seSk+wYtN0+RNnPQaGN9lOG9VubVntaMfhBMCPs2n+GCjUZ+HN8J2UJ5P2QMzoKUqA
         Zq3cSGi/oBA7/IJI8iKoRCU25O4Rq0WI+N+XFw3vfcZ1OedMT83r1aeGYEjS7JN2Ue8I
         ZYGuZooB3Xxjrpyuo53e5AP/jDTQHsM6Jl75SV7xQIcNWpkJXixJJ/LMgwwOyHaBandM
         TTv17Rdy+msBzjYM6ymTnUNViksoMVh8YVQkzFKHQi7HcHVdzAaKt0sYa5eQCVbJ5svr
         +UJQPDaHd6AbSSuWt0SNIA4egtfSEay3+eXjwVRdAqu1earxLrfuLaSC1MifftVFnJOy
         BAHw==
X-Forwarded-Encrypted: i=1; AL+hErFQEdzeE+gtt45QRQGKLlvK2KAMUpfGnzSy49t+QOpQ9vti2n5evhBAcsw4E82kTVtTDy6sKY3gOz3T@vger.kernel.org
X-Gm-Message-State: APuU4Z9AyRBwUdBEHQ9lJS+kx1A/RI+uftEAwz6u7dLf6AD2HjWtXPog
	bSA9QUulPS4HpxDPDHoN5UHngrWFOE3JTnbSkQEMhiKYJctuGPP3L0Hr
X-Gm-Gg: AZFdTZeB7C1/81hs26VUOskxLP1TDOCir1IkYvLKAtml81v7I3OzBH7XgtJg1qm48C2
	OHibZ5Yxo2q/RtvDa/3TiSO/gafdVDE6mi6nwgbLfrKmBFeECt7UTG2HvRhXa4EesfeCCCA4Lwp
	2cg3lkrLW34KFXqJl9LkN3kCKKRy6NIJE4Z3isOIasAEOcu18Ig7KebcNxpRxW7us9CvTvlxeQ0
	Z7oC4zpN1HshDE3u87FaFSRVWdvb33V1y4Ql1Y3yE3ewjrli6vLIOg60F1Mi10mzM1YfN6ObA3I
	V6skDE8Nhf2V7IFQXTfu7oPWmhydbeeiqU83HqBbZGg562yVGOLpNscDulLZI14bxbYc9j8wAsk
	HDIr+jyDXjxk3PMXeV6Xmx6+Lc4ow7IT7xWRnoYk7laOgBZanOnhs5AwwB08LSLNYxX3V06fG74
	5C0W7qYbTEW5QkXxvSvJq+/2vp+0FfIHrGLOpyzQ7uEh16ak75z5QfuGUwXcLQ3F4er2OMbmZcr
	D93MOB3mEWyblqRv67Q6JMbVb5HNwFCvqR8AkMkwasGuefWgTGevJOTc8cyYhKSzokeqgo9lB7b
	/Zj6L/oL2Alm55OGJrqZhpg06G1GdbS+3Jl8tRX8006LOgJHGruqvYq3TO0wFQy1K+DdrIQJi82
	jxuTzwA==
X-Received: by 2002:a05:7301:6f0b:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3828101fb1fmr2002654eec.7.1794991403757;
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:42:59 +0700
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-1-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0

