Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315641;
	b=if7tv/8KYy0mfX/okJsCBUDnGMoOhrhsjYZCO3/J1yRx7eFZ2cN98DeK+uImM43LvBVM
	 zUQy6c+Lkb2bz6zF0GkAaFrJgqiU9GzHrcLEcYLqXVuJ4B+aJX8xBGcKVfM1AEhDQIiuU
	 8c4RcA3EjVothDZGBHUaRpt59ll6eRCm8kvAtUBpEFSikbYKQuiEfj6XaEkM2YFOMjUdg
	 I38V/chXlmsXWKAw4B8WZOLSwyvDgIk85O7aR+qVAKRM1H5Q43kULfeGee097ndwA0PYC
	 0ZOfJIYKaQDw0mjSZ3ogep4I+ZLGPPGVwH2KqnzqtyFapD+Cg6kcnSICrN0Ra2hMq5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
	b=bx0e14G6MAJDYPoXXa4hGYmzlzldJwu8dE35j+hNmw1ES0B/GXOwMAiLbQpGmVEYcVUW
	 nXoxEnpLItCpzFLnhHweIIhN5kBSWEy2gQkegJHMv2oXjDN2nOYagRbe8Fda++dJl2R4F
	 tS79W5m6RT5leSEtrlv2uT5hAERDbFteu0pxVClhIWbxppD/3yrqAZM+lRXRrr6J1ACpK
	 RCV+UqFUOczKmr2K6MVulynHXyw/VBMBrm6euT6vYDX+E6RryHOfLp2Ut2i7akxcCcT1O
	 DqX4YMCmK7kMqzenN/sPKYCj0WGxL91K7dFMaASfOgDnO3S8oUpVvecL5+P++RztMUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTpUT7P0;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659CD606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 659CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTpUT7P0
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so289802eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315640; x=1793920440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=NTpUT7P0WALtnjRSQA31Kc+hUvpcCorxcI3GquI97C7zXZVZuZmOBtGw1gEKk35KVu
         4zwoO5zE0QoCbAZjVIpTklAsL4dpaCwUn68rFJ1oZDyu7+4VMD0V/B/FHMihp9T+0JHo
         pPqUrfEAHalGu2N5oubbu+nlweGLXOyS1WYqiTe2wV66VjoCHjZu/TBv3O/YsSTjzyy7
         XX2LinTNatUtFW74ZUBL/K6qf4YqJUGWOILjVFgQ7Bon3dIkl03RUf4nyXQYQ8bkSW4R
         QyJwbgPkKyarvRmxmVoV1xilA44It7GcNvlFDhOTHrudsF7mVdXkRSn/n3rGOcpWNmWV
         3Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315640; x=1793920440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=bDBYRr3OBiSYaxuoiPC4Q/vvAQ17MUGkIqsjD9GkWEQaV++UWJh+qRNdOpXmBXnQtY
         m2JSwrmK9a5QfejG4ZI/VehJdLtmx6zh1E7oRXb51AfBQsJ3/meF03mxROJ4mNZpJQkj
         bogQAdtTJRmEiPITlSKTK7JVJrI96VImFBkgQOPhW21KA++2gv8ciHSAgNxly77ML6Xf
         J9EduJTFqU/Zg2SkdeMucSMe5GLkZ6cOlINjeVccCv6BB1PVxx9JWBkrvDLIsEukL7CW
         s4dLb4w+jmoyFt4+C2RTSjEeZkAEofKwf/l/eRwSzPtZTx34lPVWgt03J4ReQc548Rv/
         aurA==
X-Forwarded-Encrypted: i=1; AKwUvBw9dN/oB4o9oGgkb9KfQanjPJQwN08942jpl966kK6UuJSVeSJWMpslwXxaRXXmBsglblcG0jcz7Ec3@vger.kernel.org
X-Gm-Message-State: AFq9FYKnn5Z/LACakpzkoGlVm3ROnt++g+9E4A10fqQnC5V8xRIuMc6o
	3bvDDazkh3vnV9vJWbmsEgYDacEykMgCSaYD42+kdrMwh9I8zs8UuNBy
X-Gm-Gg: AYBFou3cPDPOl8qHV7zg+m4ng4wAtxtleRcpNjXKGCwamGFk/YoT8s05yvLo3UZMaGv
	ADmhibZz+wPyyy1dOr1Z792klRxZkGIg7dn6u4gECWUSt0eoK+w1M3RAs157vCx2gPdhb1tSNPY
	THYvb3tsIJxZPUxaWtfpu7VwCffIlnX4C73TjKGqpptZL7toUSKWMuNwsOQrzk0UNG+m0mSwWZx
	aBiS5i/3/J00n8RSI4HEocT4H/f8UVnE62Z0jjZi5To5hkueVpvLMVuGzfLq+RdUknVtDSLT0k6
	Gu4wkWEQyMigqnCO++Vh2mUzbbtutBgQIkneAlc9A0YHVGyEat1o2NBNaXBxSZndmqhWH3BLu8o
	j1uUic7MrtFWEUZAI4mi12H2scAZQyyYFzlp9PQRhOciiZT9ZMepUJH/dBW5qZeFgg4x84y3SiL
	nO8tGxuI59XeMrZt8+kxoyiCoFSGDdB3ekHc7ZZVTa51hHxRyy7vBIAGq+hb+Z0/EN40jjFguhZ
	xYcn0BKIMqrkqCCMmafhMMb8LhO5XYUSoYBrrypzEv5rRSL5inyxAY241NBcFpxj8YlhVPD7DlO
	GUsWfQfpYayuinagfsdAMC9FfrpHXTk1OG3/YzGIjfslhSQ9CK6SSLrfutkQJBuXJA==
X-Received: by 2002:a05:7301:4246:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-36a42345878mr1118524eec.10.1793315640398;
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Fri, 30 Oct 2026 04:43:38 +0530
Message-ID: <20261029231339.9497-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
References: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes in v10:
- Restore the original Acked-by and the alphabetical compatible position.
- Revisions v7/v8 already carried both; their loss in v9 was accidental.
Previous series and full history: see the cover letter.
Prior binding review:
https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..c2275d7f4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3

