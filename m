Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937084;
	b=y1dJaUcIrZV43A3sHB86FnHjrX9hIr9/dvU53N+iz2KbeWwyEYlJDEwTrAEZkr0d/bhr
	 A3kaxEzkXDR4KOV5PJeJpkjt8bieX3pdGHtn4cZXScXzZ9Q8esSlgeRCxGtcH3BJ9Es6Z
	 BX6ccbeH9fpep4ktAcgS2iGQc0a6fWAbqCGrQVF5wLxl0Ix1+fyiS+TBojoZqgPyMI+T6
	 zswz++TwXA3n/eoZ3vFAjyckwX76UK4pUIjHg6X3PTg4+rFMlUBMW20z05z05iIH9bbcX
	 DqZIXbU6NjzyLNpvWxHTIAgEEjSZoWSkEzbqy3TQ3gIg7iHHZ7VhdCQnqfzdmI27BkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
	b=EOLwic8heOKnbg1UDTxtLx9nRLm74FURPDTiO5hcUoi/J2Cr4Gt4x0FppstKSwyfbDj5
	 ivU69x4exo15KIK3Up2xmyvCra0GDuhfyBAATeY8PwgD3qzECA73Ycy04ygoi62mwZqDn
	 0l+izop5xMKalYhr7eUk4N6h7iTkx06HWOOIRyOkBFDWE1yYoFx4u1ct2KmQheYkVYDPJ
	 GpvaWG8lhqDLTqB48gegsweethJrmmN7/nxeRF9s7Mwz4MDax7fFqKe/VrVq8xzCZMFqL
	 QWINKcgA8VCZlvvIElU847OTAvkNPsGixFsO8X1RcQKEX0rSnOMJzWRtwie71X1wNKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="JvkyLz/Z";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D621606A321
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D621606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=JvkyLz/Z
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so14143165e9.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792937082; x=1793541882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
        b=JvkyLz/ZNZaUn5KvDlRMFowHcFjJnQwtRGtucdh9VQYbheAbLH5l83M5ujW1w0K8MG
         t/M2ycE/8cXAyROJC8vJ80SmRrO29JVPGxugVEkAAztqPVJxz0oYRBhT6N7oIRiroxbd
         pnMnWQ3UCMLFgxtDDkDMO8Ci1NRIcrBH+pheYYOhWnJiV+4A/PE72b/THGoPbVYsHu2q
         8vXAm68b4hSIY76GjyrBKtef/M8p9wIMsP2M0Y5C4ikEp/LDXcI1MlG3LTUMOmZudL7/
         xfwG3qCrQ0oWW50A3SVc6hypDeRGOQqA6AleGsmiadzHOtXL/jCSFa7b5qs91zUAL+vM
         4fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937082; x=1793541882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
        b=0VkI5dZQ2scyx6q7fqgp2trkMMgT+asNDNy3YQ5LNTIjIeyt/Hyaaxhg+RqC0KxKtS
         SnGUgbagPtDYnIjvQhXK1cM+hpkvQ9ICXR7ns74nBs+X58HWdVJ7+qaEF04bXTnMy0/a
         Rq+N5R7lofeDga/rFtl7jM5U45mJSYmIc27y2jwsI3MWoSQAd2a/bz6kJ9MRoc6alVLK
         ih/PF3nY/Bwk54g/RE7m1m0+9tKOVfYU6nZhWXs2s4lJVpPIHA9gwpU01rZfS8uOakkj
         YCFUBT42Er28g/hvYcCURjjo/H5H/N2XXzDPRR/jRypE6kj7ZxIMQc3I4FrULMcX6zAL
         lBIA==
X-Forwarded-Encrypted: i=1; AKwUvBxtEsF/YQExOnI6lc4IUu6FQyOwpxFy/4aQ68Fdo6ubU5o9Tx56gnL6Wy3IF+zoQGPpOyWQYC31XzXI@vger.kernel.org
X-Gm-Message-State: AFq9FYL2yOrHv/PsmMlR1CsdLrwlZIpd4aIGSSQQ3I8UNR/QvFmEB+y9
	hEf2883/ph6coxXsSiJ/ckdZ6jQkQNrYTRCjrEyjLF+3Md4ZuPALaUiE5RsF/6qaxEQ=
X-Gm-Gg: AYBFou01zHpwYi9/4qNsrS/TY8SmhDhGON76TNY+0OFoFU0nLliy2IrjbmbdhYVGMLd
	TxJiZEPtEdvH5DjRL46o1kzJEc2C7npL450NntU58bN0j3FyNQb3xxotlsf8Xnv1Urg5KZQheUr
	7S+mwt2dd41SxwSA1q/Fr35iYbWtlbYu6lbAhjp7+G4AKeWmvqqUmXFcQR3MhEyTg0KR/y7J0tT
	3IbZP2a2+QtKf/s1uIZUgekmWneoxWL5NReH8Izup/MHO+SxYpVZq0sozDOBrFdgABHOPm/wv+s
	rlc2BuztIajyfFNa+ufiB81FmwLGD+SbfcGCZDeae+zxbnrEoe8DgS+CEUXzUs+aZFNEtY15yfb
	0iJEW62ZVniwINfZkg3dIQenq5N7wBra9528jj7KOAs5lmwBRs+ddkc2NSr5Ax60WmWx7MuXL5B
	r4eFMT5vlg3zLSUsX2h8oiWqGVad6y7COKOXSzHsJEHTzsACbGj8n3eFPUITDX06sSimIcnU+vC
	ljoQsFzxmzhx8nWIl+H8HzMlu/NLg8BEnyxucey8uySKbME2VSvZSwKujDqaNFjHVwvUatkdLiB
	rKUBb27x/YZ0VavcQSj5zJRO7Xo6Lp8mIY6irXy+NpzKMK4fnx2ygmZxgTGa6J8vTQnl72dxVA=
	=
X-Received: by 2002:a05:600c:37cc:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4a35acaf08fmr74313465e9.24.1792937082605;
        Sun, 25 Oct 2026 07:04:42 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm112317695e9.9.2026.10.25.07.04.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 07:04:42 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH RFC 1/2] dt-bindings: mmc: ingenic: Add the X1600
Date: Sun, 25 Oct 2026 15:03:24 +0100
Message-ID: <20261025140325.73204-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025140325.73204-1-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
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

The X1600's MSC has the X1000's registers, so the X1000 is its fallback.
Unlike the X1000's, its MSCs have no request lines to the system DMA
controller: the driver uses their own DMA controller instead, which needs
the X1600 compatible to tell them apart.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
index bb4e0be0c893..6b26a17982f3 100644
--- a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
@@ -25,6 +25,9 @@ properties:
       - items:
           - const: ingenic,jz4770-mmc
           - const: ingenic,jz4760-mmc
+      - items:
+          - const: ingenic,x1600-mmc
+          - const: ingenic,x1000-mmc
 
   reg:
     maxItems: 1

base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
-- 
2.39.5

