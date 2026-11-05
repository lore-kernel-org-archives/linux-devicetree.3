Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912857;
	b=K1OBT3R788KrP7NSIJifrN+EMqDhGkvCuBj7Mngf0gkjGCicpOK/O1AkY9GHpn5ZhVfQ
	 wopGLtts/0ybHRgun5z/VU2ZuuTNG8dcHS/PLlX+NStDGRBSM71I8zOYVXaB3is2/pJjN
	 Ccf3xd4fsr8zdZDf/LZf7oGdzDWg7iVlhtdsto/lYxsV/r5rJRRj6t9aLlyVZ8kJFDeuc
	 /POVfk1ASGl71OPIlptR4WXLEx0QMvorxh1w6mx8BtDcQqCyXnO96wxLi5ErGFFebzYI4
	 Kf5yinqDPfnDM5o2862UdEpWzRC4iGNCACIEXjlB6y5v5M39bBOjK9PTPUMSculr0FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
	b=p5MoOkzUhDHiH9sDmv3g5kXSi7lUe7fU2x/Qr+oSnAofPZ4wDIqwz8t0g8UDMkCRY5/r
	 Sw6bbDIuDH7LfX8w4BerLEPjRNpoG4Ed3JfWHz8w2tV9RuWKJonyz7h1YUUnbNY9D/RbH
	 cU2d5AfMgd8Q1jxxbVougZEVhWaXUEUYadqTL5NRBl5sGCDyBlwwM8JNJxwgNhrHjIZ//
	 Dgg7Z1P2bfkHMv85siDafNqtKe5XtMEtoRPieJgitZZlA6+yBU/E9+EoF5g2pq+vS6mde
	 BcpYcAt7ahBIgS2EDTHAoNULmadYSSMkbEniYPxpy9v46S9pqkEM5O3QclAJcjtI0mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLPNAKXz;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40426606D80C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40426606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLPNAKXz
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so182737a12.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912855; x=1794517655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=xLPNAKXz/+2OL1JIU9fSF/H9o5CsVHDfkas3Hk64JrZ4snO3WXPYSwFKiAIh8gSBXS
         zMgVGMXCUz2eiUONqXDPtuhTEm89cvnTx1g8KMBVQvAoYCOTcwGuMLtshO9AkGcvt+DB
         Bzrpz3wTHnoFKB/fnNdE261xbnPdVJNzTLjkCkjJ9cFS/kMSk82kIAp1Sfs+GDSsHP/9
         0OY0U40cNiA03aVAgOTcmcfhaSkHVm6Xg7cEjdgvw9Ev1aGiCBl4D5S0m/2GiY99S1+S
         GwYvuSPZBFPpmFUjyUY/bcDXlYkycOIALxwZkiWRdHdDWpV7MbDEuNPt3G2mcHJlDk9E
         1GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912855; x=1794517655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=2Q2V0RtzVW6c1YhjutQgpfzakHOYMDrFr48n8sWml/4HlOmU03j+b35y5c98pvZ3+m
         nFaIxuRygn/QQgqgLExSG4qABiunQSCldMtyrTiMeNIH1g9VmNz60tQCLUCXOp9XSfLp
         Cu/mP7Tg3w+VBBBTqMpkpugrGIowQ7VYTBz6jjnMp7E7cG3oJdQShon5q2e9P7GOavYl
         FRV7O+jR4jsPiARro4SOMnJ0/wcsHOe5MWZZP9Wuejcq+zokHdPRWtLg08Z0dpF21UZM
         ppsaoS8OAgVQ9o+ntr+6uzZZFZi3TQMN/dllRwGaL3qAx6nsZID7Zr2Hiyl8MFPh7kT7
         6sRQ==
X-Gm-Message-State: APuU4Z/tGqve0R/Ox81yEeOu6V3D/GUEYLLQa9YVxbv7jGAQB+V8oJ26
	XgYsTxG3IXRKFLBNzF/vK4mvzgAjTTSZgxD7Wdud/e1GvW64cnPrssOyTloiH9UDFYNrv206
X-Gm-Gg: AYBFou0/n4/K5uG+atZTUN6Sr7i50J+8ZTesPxF7yXH96ZfEcOOr1/mToRSasJv5xUM
	/+vf5K84L8viSBDNYJS7dwkKk9kMUsPE9eDu/2Alpq2RsHxyO3AZvrnmsr2FJI7d3xwyzYxEM83
	iEDIqJZGmb//KrOpGzhbdcZBApPZRZTdVSQg5RFYB6T808HDxIkU4SVC03aXVSBC9Fe5LJ0ci8I
	BMOZisOS22SOCwgBF6b4L8et0mE1UprggIjGyCSYmiXZhnV5OuWh6v768Zh3zoM0BauT+TlUZ08
	e8vpfKQHkpLr6fC5Xz0KUN0QhmG6L09gCL6CPlhsmaJWkh0hI+93Wt/E8O2bFNqqtjBKkFLU5ya
	hD5OAw1o/dXG7Rij6CXA8gxZ9c1AW2Wo/rPcNMV2uPW7XVsI1kKul9117IBjTCHGif+kv9DPD5P
	vYiY6o4/UxZNQJ91tc/BwlSXLNmUt4IAbDwQTTsZgu7Nlsmfa6y5I3jL24Kjvil5Rv6TQ8xFlp5
	Vg9HjBuPyKYtn+hxscfkCMgdqmuvAVEOfoZLVaFFS/ePWA8l/tof0UElFxYURTTsjCFcUzK/EPS
	0JV/zI7ha2hdcm3XBefspivbcbE6cP5s5nHR6sZcCjrTWM5c/QiuUyl3Y8xQmMljXeGrWHU=
X-Received: by 2002:a05:6402:234b:b0:6b4:bd6d:2eef with SMTP id 4fb4d7f45d1cf-6b597475582mr314181a12.0.1793912855525;
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zakariya Hadrami <zkh@mailbox.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
Date: Fri,  6 Nov 2026 00:05:59 +0300
Message-ID: <20261105210622.523747-2-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add the compatible for the MediaTek MT6895 (Dimensity 8100) SoC, along
with the Xiaomi xaga board based on it, which is sold as Xiaomi Poco
X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64
-- 
2.56.0

