Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762717;
	b=XNKEnSBgKIXbj3iD7HWhUXs/yd72p+ovorI1zMe/nO8QuWOQY1eAeZ4n7uEnDS4BqZXu
	 9iD4VQgXjfsBZ/nM00kGXZi/ifGrY8IoEdss+b3ihpfdy6IidMYFjw2Yd0e7ChtvT8LSb
	 FcR2IVm31Be0JevcLuMxyDi+mnyyptbxEY/xVWhwwFYLl2zJPcLnImZu/3YKIwM/jQF4v
	 qtEhFvKhEPNwfE23g24CJHkzFSrURiZJEmPVYFb5++Vhb+d1kY/g1pVmGVqhaxI1w+rTB
	 aCnThcKVGZ70X4CikPFrR83ldYa7AiwgnZ1YxNPWNZlLO4fVfT2hF/v7/hUp5tTKrsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9RWAF1oftI93lc29ycNPKrjj2FPFv1qc0l+KG0PO8Bg=;
	b=JNbuXYNNywNn/217aSAuMCXfZcNf731dTaoTLKAXR6DDA8TlmVqmlRQZjbgZ4oYex4QX
	 rQg39AGB3yJXeACthMsXgirjwp1qQWql7Ngd5WRnEdI3KAFS/qG4rLqoCJhDaMH+jKqNd
	 hHYKr7cEhXxhev71AF8M0WoWD9vEdblTTZqQsY688A98FTOkWMFozed/LwO4cpeeKeb/5
	 p8RR1PykzeQv8tPRKZODzG/4h28dohnakW1bPQ9eAtURS+QzADYuSn7ZidD1ksCIKCJEx
	 fIn7/nZPjgTOQ4kUG2GFOvwI9J0UGh2o5Nx35axl1nyq1qL1ltmxSsRwgITur70QUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=wQG4Lgwn;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BF60A2618
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60BF60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=wQG4Lgwn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso30593325e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762715; x=1795367515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RWAF1oftI93lc29ycNPKrjj2FPFv1qc0l+KG0PO8Bg=;
        b=wQG4LgwnhzHEMVFNFqIAFCh4ieei6Jjq+uMiSAV7Cqo9m/VbI/po3ETct3qEodVq5D
         oR1GyDi9JCZ1ftpzspqj3A9OHoJOUX0dQhJ66KITiAQUKNGil/6Lqw8rxdINaIoRsXAa
         OMBvj4XkL67qTdBSTgbcFY2EqOlUAWU81SRAJ4snrrb5qe0qDl1PUAuLVxe1kPt5NO7/
         3v2Ne6ChpPq8VtW42ffwPk8TTKGc/ewkUeItQgsRFVQbVPEurBUllMVypBzmfHgS8EWr
         aET1APTLU7SKuGdMxWxZK6zN+9/oyLfpOwCipndmP21Q7AFSvbzaTmHHZkV0wWr/2iH2
         dFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762715; x=1795367515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9RWAF1oftI93lc29ycNPKrjj2FPFv1qc0l+KG0PO8Bg=;
        b=ENj7+stDMzKfh8jaXFBYvEFMOOqAxlYl0EcH32Akok4PffTAWv+pd9tVDpqa5aV+3x
         pUcOaY4Nck/XFDR5UYEHqRuoc5VyOL1WkC6Z7ASW+Ftml/jnuWuuWqnonxKN1eGvctd1
         Gm9qy1jsVYm74kQF5t68PIofFukObQ4/lWoUe+XAFVbSAYrT+H0vFR/wx4mOM3Xj6nss
         q3Pn3Im7kYmUsVN0BY3cHJIt5KlCFxwTrnbnB1XZXPXu31li/H//WCFK/vKrEiBDNXg0
         QdyV4xtRehOjbTeGj7WC2uBbZsHRjWRc1TSRBJd1sAisTXsVE7/8pw/sHyML7FDxItiq
         g6jQ==
X-Forwarded-Encrypted: i=1; AL+hErE6c0ULlzMmncIvj/jthbXo0R2uqNAJSHJ4iRQsZe2z2DKnGweBbUW+bVFTpOukZZsI0tp6il8Xv/sl@vger.kernel.org
X-Gm-Message-State: APuU4Z/5QhBN9mwj2kNKRqaDaaGcDS5B0t9Beeznb7CTTq0AdWxahnwD
	cZ7mYcjTjzDDMswc04mLPMhJjY0IPQM7ekOHC/o+QNtGgdt9OhdrQFkRSdjxkZHuXsQ=
X-Gm-Gg: AYBFou2IxoaEtleFraIQKZMxQ8umGNJYsMDTreCiIEhs3fFviFfBA8ny0w+43n8zohv
	T4RS76Gxmd1dBaJ1jur0Fl4E0rtBxyfhz3aIFMU2V/opjXPWBifwhgbsVl8FFiivChHBrRcRMBa
	h4M90Yc4Xa2DCKiUVTYRrYjic5oaIcapykpaFxF1ljoYP4IcXUYWaURG4qm1ygMYBeVgT1wyeKI
	fYMI18mzxQfHBalhYv0W7gVT/eRRDXO/qdSyn6GvDIn8wVgjPzZS8FYIz6S9Rh1SSBDq1cQrAeS
	JDzNledruKTVGeedseoEdEsLqeFkCRBNzt3tipVPDdXkdEvPSjq5y/WwbmwPtEbXHgHlUWOPl3K
	rwdLBWbHhYmRVFMgY5TcRPlxoNg86LTEregecq6s2L8Im3/aID8HAWS1XusaOG5iic2+ICQlQ02
	aed576znb802qB27CIiBjG5L7jSHwcq2IvVxNLdRe0UW620iXNCHl2xNi7L6zOFL69bgdYJQHNe
	DmVlwjP/MAqihmuu7D+BVTMfwpQjZxEA0qGnAa95kIkXuCXDFdCx2mRb1Ya8gVVBOKEIs0AdNpo
	qI4Rre8z02J0FXi1kV5NXkaW2jIn9bGjQSbW4JqELqousXzbM3x0AaQnSfDCzW7IG/DLgfF6R1N
	1rxehqLo=
X-Received: by 2002:a05:600d:82c6:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb55c5f5f5mr209711325e9.7.1794762715464;
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] dt-bindings: power: supply: axp20x-battery: Add the AXP2101
Date: Sun, 15 Nov 2026 18:11:49 +0100
Message-ID: <20261115171150.64431-7-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
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

The AXP2101's charger is programmed from the monitored battery and its
registers differ from the other models', so it gets its own compatible.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index a90d558e7f86..6a0a0c3f052b 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -21,6 +21,7 @@ properties:
       - const: x-powers,axp209-battery-power-supply
       - const: x-powers,axp221-battery-power-supply
       - const: x-powers,axp717-battery-power-supply
+      - const: x-powers,axp2101-battery-power-supply
       - items:
           - const: x-powers,axp803-battery-power-supply
           - const: x-powers,axp813-battery-power-supply
-- 
2.39.5

