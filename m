Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232748EC68
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473409; cv=none; b=T2VUhSb7c9lqCalRO/JzbRBwBtaTpSp488IAsqQGdIVGZnEPQ97M9qfcHnbL6/6HedEdoP2sVptn3Mads0Jb34h8VNjWN12ILoA2b4NgAUls4IubzMwRrUvDgrkvRxfOXV8WkpG3tuIk0J8EiKelYyzC+2SWI2y2aIiGBv5OSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473409; c=relaxed/simple;
	bh=76t/6TvrHo/ckJ30OYPKat5fWAU1rA0fOHpl6d6Cs/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtleEXKnViRMLzCvjCD2ugKq5S9E6H1G2w0wilMSGbw5xDyQqHgVpcXELmjz06u8T/uG9NtUUMIV4PjNQL5fea1HwKDz1wXxNHkVrsGESkY0AEKBiXqrNfoWMHM4ILkthZYEk1zUC+EGg76t1xnDGQMJYCMVum+LZfXP0FeTaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbNUilRB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbNUilRB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so1193245e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473406; x=1790078206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=qbNUilRBfx2vJPP8G20CKAJ7eBDm63tFaKm3cDhBIt0RfCZL2vRSH2nsF6E8Cia2D0
         kO7KbJOdhpGIZEcgAI1RoxzlABD7aV3/UeI6Uek4jgm00TpRJUPiliYzyeOQpgZinRaT
         4u4d6QpBsSc3SdrEuKGUBfdeg7lyBrOqoONXxog/EwNmb7Yb8I2awK4pHFGvUmqrqEYs
         S2dIyd3UAcxAjILTsLnY6vXiyQKnNUBXPcR8fyn0bKDONkv8py4toI1sKuXT6eBxCkkX
         GvszUpx8RSUqpuOBN/tQWgpVbTH81QMsH8BTr8Ym1rWZzT/nIQjt49XcNebQOnAFuAC8
         t0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473406; x=1790078206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=mPEuNHQER3a6GmZmiwPfiheLfAUla32s6Ky3194jXbSAX7kJOVjOjtidx9bf1fLzeg
         zqwomSzFfKQ0nnftSIy3OQabf6koWBGsJrwZ3W8+IT+XQEDhbsdw53hZDmGmXtHlRH2Q
         aTyhUJfOF4W6uh7++PSlGDDrl33PpxS0tc1yuuR9RGB5jnK2t2zR4wx2GRNSpYlvsD5b
         PaI4qWo46H+dnxdfF4+Vy6ifCpSqLvujPuycFoi0uQrYdOmY1R1q8gZ0VcpKhPE3olp7
         MrCi6CCoai7gCZsg0aUFhlRhkeE5jBDwMFiiLWy1r5L5uk62pX8MGPuKOfKlf9s5yORD
         JCUw==
X-Forwarded-Encrypted: i=1; AKwUvBzwT9fFrYWL5qCywoblgQtu6Ii6mNy1+HvrbXw8g87mmpc0yoyttQ+KlVAhoO8c1KprfzblIq/2wV5T@vger.kernel.org
X-Gm-Message-State: AFuF++kjLrT2OVbgn63yFd3W+Ly2mM8KL7j0nu8rOod/Rq4m4NJ3nWvI
	ufiqf3E5kiattK1dnCkq0ThGwd+V8rFQxywTi3mvgPia7idu66OlpCZOO27Jzg==
X-Gm-Gg: AYBFou1BCI6VtAl77evDtB9H1mxcb9GUzF/ZTo0AYdX5ws+V9wWWMlnlOI96iAry4ec
	CIyCXuNjaL8yMtznKPk3Vgm1w1BnBME3mH1RHMXEkFC3rxvb4U4fS53pNj0ZJdHPnXiSXok4yoq
	9UHlvP32JN6QxeQU50/i9r7Gbrqu1NcUs06ovKQJK/0IoydA+eXnWQiHhm0QsoLDcfe6l3iQ6NN
	fNLO4fhDSgEMY4nQhP0v6mEnP9JJljbQEp8msELp5IHI3AcRA7kYs5aV+X8HveK07u4rOJNZoRp
	eeEtniZLzOTSWIQ6bPVSKzGs01mYRgyfWC0cTrN6QRDYnpzqQgMl1V5wRS8I+4W6JF/Z4LGgkCw
	bDyjVwq3CR8hr4gk/xcEz1HqOQK2USIe5rhTcrf8YSqw2xuc6qYWzIJhn++ww2BpgHKBbTsw+yW
	6FagOoOKtwFv7+uNQ+RLRAUMetuCq4+Sgq7tX2+C156uhYRhDsLoSHnMvL/KlZM1/4yeBYA7Lxb
	MwBCBREOQeA6pUrf/IUrVnTEjRuR8mRcb0bGHXac2NstUQJWhW6b3qU7f63JYTj/oQ=
X-Received: by 2002:a05:600c:4e51:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49e822a63ffmr11750555e9.29.1789473405919;
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 13:56:40 +0200
Subject: [PATCH v2 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-csi-2-rcv-dts-v2-1-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=1108;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=76t/6TvrHo/ckJ30OYPKat5fWAU1rA0fOHpl6d6Cs/A=;
 b=U/+xcpmDD44TQLOMhpTWGOwHvugHp+qVjCLKGJpJc12iRo2mVKucsEvPRwhvI7BINPCfkaRtm
 ERXc22c4d6aC02BGFdZ1GwYSFiZhhii8gTNoE53pdNPf+ra6wSiiQVc
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3576 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568: the register map is identical. Add the RK3576 variant to the list
of compatible variants falling back to the RK3568 one.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 8bfad0fca3b7..1898f3787a98 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,rk3568-mipi-csi2
       - items:
           - enum:
+              - rockchip,rk3576-mipi-csi2
               - rockchip,rk3588-mipi-csi2
           - const: rockchip,rk3568-mipi-csi2
 

-- 
2.43.0

