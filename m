Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877125;
	b=rtONJwvUrhnxRxj7x/a/t3U2jNk0XzPmJSnR9hwF4twjsR+YMsgyNxfPNvWBOxd5Tu7h
	 XHp67b2iDEgKVY0mx/JdX7+Qzd9fQrWUlbdsTLC2mn0I19Td8H5DuexdewjMAwEcEWY27
	 +npCNoqFhmHwJSi6FsCEbW2MW8JPaNbiT9OTkNbH9830Iea4Y9vGL1xGEywts3p1N116B
	 Ljcqrkt4rV5JT18jDWtxUdPA7K5GstX5CERKK4YNv6vwDIpg98i7oi364lUPFkmmb05J3
	 Gyv19Nz4/YDBAN//T8zLaLSjr5iIsg1BsKH/g5OOQIjGdM2wynw6hiP3nTEk/a5+K+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
	b=Y2bZULzIfUK6zYNo1OzeKQCm065iXz/YGmC/hDBhTt42MSy6NF3jiPRp63YH5ykYf1Nm
	 8m5rtYjvxOX7wtvf7puqskzfDBIW6+bTlJYRveSomcODcKUHRae2MWXetQ/8h13UJhOYt
	 aCMZA/YVeXIglv4E3T1t8QVI0ttIQMBAMg4OCzl8TRunONGE5XNYqZyMQp/0CLd+WOpVO
	 ykaX/mcAP6qRyPon/3nB59+r80BHf90/fFNU0POlJ8muVCWLKaMJYzBK+LU9LpVBSzIIy
	 VSnTII/UJHO8BQQJpcUz6k2o3RTP5t9Aut3ekKdctySVqZa4+dSwB0M+NZqajLXKLUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FFY9UXC4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04952606A327
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04952606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FFY9UXC4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19145215e9.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877123; x=1793481923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
        b=FFY9UXC4nEgSwxaS/SuV8AKXzuWttgHbi8x3huR9cAIRIERXXxOiOL1H4056S67fKy
         YHJyipd0Zk8OCh4mygo/AW5Zq4wNUSa0/srwX9oh9WnuMfdpOQpCL7idhjBfQhy4pBGH
         by4wi+S8CG9zXPl8BkJXA9ZOB/bjoDoc9t7EjDySRlmH5FGqzzFnXZsiAdQFzD0biWxA
         gxQL2k2L/AkwbBVc/RT3vdzBLteAzUV0wwaiEGrgXACrd/9+QHw4o94TgVrJS/8Y+8b3
         CxFw7GgFGWvkbup+GIdekR39+ntWGKaXKmbhZHI0e2jCQGhigvdv/mQsQQRqkzhVACoD
         Zcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877123; x=1793481923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
        b=PJYWuNNlQpSt8KBfL/xGyxb6fIOWby3rSUGC0jg43iMvNKZNPf7alCgFOrYb4df7PL
         ifw3ljrhA+Ym+lrq7jYs030V1A3T+ZCBXckclKtklKieUXwW38YJYKVtMYYKrvYRSEsg
         bK+3oqRS5/g/5phpYve+khs8n/M/gEQKOy3NjZhL6H1M9TfcbBeCJNC8O2Jn4RJ8iAKe
         Okono8WUGKFv8RgD7IWDZRCzqVNvZCr1sbZfbn21/snOVo5uaVsfVFs6PaExpZ6F/PTF
         pnjVhJQQbGulsK5gkX5tYmc1m+h2TvN8DxYYT8cZppmOcNyJrbXZrZJO1W+n3RLIMV3k
         /qxg==
X-Forwarded-Encrypted: i=1; AKwUvBwFD9p82dLT1fzm+WwVW+l3HyuALwrFR68bYoToE9bVQkc+DvbH4kJsgPrgMuVAmzVxklL5P5TffsT+@vger.kernel.org
X-Gm-Message-State: AFq9FYLDffeT88Dounew1iVSEFuHb+f8tqJu1dvirilhc08Ai1gJ4jzy
	h/mMSw6L7uRjwebKqdCD8ql++q2s2aBdBd6FkUf63Y0nao39lDPpMU0DEWNXJEi8+Bg=
X-Gm-Gg: AYBFou09MxM2FfdZ9okl2qiy4Eoq1HoAWWh82LinmNl695TbHhEq/ZWBWMd0FHiL75a
	lbPd8ynBKIhYG2jAJpOryq9ggNv/8X6R44Qmj1ru81m6+29ZSI7dBU9rvjpvRs2y2ziVAqmTuwm
	eJ1DRhRrTiP8N+cnidrMi+HCWe40ht7ovfn0AAToSWZUBotF+gOaa4niAHB1GY4Ji0VKWo+nRox
	v7q8GG4LmCpgjnme70FbneEtT7vnq+LwiCITxXyim6YWxyeygg+tFO557FtfGM2QLOqTNylt1I3
	Wd7W9QRRpiKIflelEqeBu3eTr0Q9ZzRVnOPUV463hHEkoZ/f3kRs8bvmtl5bGHo6iMFLVtBbLpE
	iOXYGs+fDE6FVsPgz2Ey5UMQrmHohK9GNYh2N9ktRAAUxCmRsbvo0hdmw3BAaF7mmpRnVl8D3tl
	VRe4AiwO797/p+9K3XWGt0ookpr6xu1nYGh7GPvJFyHBEb2SgiBgHCALTISNeQ7IRnoswHjbRu1
	UbdoKPfz4bby7r1AOgCclzWq06XglieQJOUOHV+8Xs6TcJZHIZle3WHIdUssX5VlbFE38iaXfKx
	s+FggGQ8On6ecCuIJ7d+XVIW+SuYyXFCAh+lrWJraLaqiB1uwgRkQnAHHYQy0GPef1GgH8GxtkZ
	N4Cf5XmVNWRymMLDK0pQ=
X-Received: by 2002:a05:600c:870c:b0:4a5:4589:24e2 with SMTP id 5b1f17b1804b1-4a545892686mr2153365e9.7.1792877123471;
        Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Sat, 24 Oct 2026 23:25:20 +0200
Message-ID: <20261024212520.91401-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024212520.91401-1-olivier@mgcrea.io>
References: <20261024212520.91401-1-olivier@mgcrea.io>
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

The X1600's I2C controller has the X1000's registers, so it falls back
to ingenic,x1000-i2c.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index b61fdc9548d8..9004f9799fd0 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: ingenic,jz4780-i2c
           - const: ingenic,jz4770-i2c
+      - items:
+          - const: ingenic,x1600-i2c
+          - const: ingenic,x1000-i2c
 
   reg:
     maxItems: 1
-- 
2.39.5

