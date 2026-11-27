Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784896;
	b=GJ+UGpHuMKA9TPkgm0y5E0T8Ykikfj3olNqATwbEoLPtubWtwEvEzLZXGhMRVBtPM0hR
	 /0XfKPva6DQ5Jokv6LtTsDcUI0R1Fp3By5pzvmR+vZiWyr7xiz1APL13oE5M+gTz3qZP9
	 SENp8on0qEdRt7Z3u/oclqiUgGeNVoCw7SN7rBmwUl9Kv7sK7iDDbMTnS/34Xah6I9rvF
	 JYYRpSdmvkJRtG79IsKJQL8VZqAkLzw2kWTN8ufC3aoILRB3lXbKhUln0cKc8TzO/HB2h
	 iea9s7cAbjaAPP3zYpSmlN919FVKMUFgBTRJ22R6IyMWGlyWLJP0IdpuCQZAr8hsQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
	b=a6cptk6CeEWEhW540pi6aosAj5O9IAFs3CNX54wsxSzIoe5SHDdsgxLoRN0wm9TsTHw/
	 ecL6ym1AhBMPnLrBREd0SpfFvHSOEP/WUAJQupntdLlhlpkjHfOmvQhMdzlJ/YCnOWdsn
	 GHbsZDyoy0fb2hd4xogpNmCpA8qag8iy/+zrHeAU29fryDuAejlUccWe6VawhNExd8/Z2
	 B0zICx8O4kbWqyQF8Dbt/eTDk7SfxQekogM3sLXRNo6ueVL3OzTnK3Glvg3Vb+fbXTHub
	 fXxA47dEPisDKx2ETHqIeA8Xv+SQj9EVrHWePpDJHZI70eflMQqcaWPQOBDvkOP2G0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qrJaqgs;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36902606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36902606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qrJaqgs
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso4683826a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784895; x=1796389695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=0qrJaqgs8WLgjFuu6uc2Zobv2HU4okUVm+pA7G7tief8EQaTZuk8iUqoCUR9Y2YG2s
         D/+d7LSEIkwcQN4uzvNIAbWNbnBZLF+y+ZpV7kIOHSZd6eO354PLPP3Ilw/QR5v+mvse
         xUh8Z9eOb0g8ncebpdWWIiZ6wjbompya7Ty+qal01HuoJJo4M4J/G5Klb3uxa2gP2WZ/
         0VGqZmmv1gYLb7q7v3DvC/ons6fGj2cnS+GZLAILvhma140nFAFqZlwjvRtzn+ziINSz
         PO0xqmyDacy2+W/ixIKeuKV1hZyNGGiB5OVu7zFohJ29esdZ8NPMMFktLXEM4BnwsOt5
         ifDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784895; x=1796389695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=lojhLk/QJhkO7yhn4Cz2YOZi7vX+YOljKH3uT8KQPSH5kWksZP8/1YO0NO1DgtsW6o
         YwxJuGnEA61V1CcG8+Ul/S1ungBk/VDcAL57wsa3LT+LtwpdzrUneqTaWC27IGS87Ef4
         yirLx0ck4y4e6d+5QJWHWuay9bA+qUq3WHR7JVXQgFwn/xVCaFNDaDbtnoED1evT5RjO
         jBjiN4EhGNfBhdRnXKJ5birqbEa/vPIcpi8npObbGQnIB8HHIXubonnFN11C7X4iXM5e
         5vvlkn2v8TubHfK008DjkM0sJwmf8Uvv6xZrRRN7b0HMGJjylIkMNT0YZFBwTS9QGe+M
         g/1g==
X-Forwarded-Encrypted: i=1; AL+hErGolOXmVqAh0trPMgRrflTMIzLg4APhRaTZNEyh0WOCxhZ0G/noNdBOkVFTfbo7FACpULUpfk3htBbH@vger.kernel.org
X-Gm-Message-State: APuU4Z+NNMRMDJVU7ryWgNlO9o1EQjahJuMMfDthlSfuABxoBzeT88Pe
	MFHHDRDXnTuyk1+mtTOBDZ+MkBjLDg8LCYu5BTiCO99AWT7OxywsRQRu
X-Gm-Gg: AZFdTZctDX3BqKvxcFx2zZ20qqbh9lgfDGIEN/2f4FdoZp6jlxNDOGb1biGMdnTmYip
	YrEAP2HG62d/v0kizFgvbfmP4BuJvmunynovWryboixAtqCvTmLlvgtvv7IEvJ/0KAQ0Hbj1OEj
	5kki4OY8l+QSMgH5I1jUQ/3NC+oF8JoW+W8m2/MU3Vkd8A/yQh3SX+ygA8NTIYKb19N8K0fF/0F
	W5kOj75HfVj0NCFxsEhOVwJJTq0uySGly8+Y3A587vUrMmBMcNAnXoQRT4hMouYrwpIMBOvku4l
	iH0VkH0lm1GIlaCLoWROc2VxlWv9ameV7dJSPg8GQ/43F0+bbJv84JEh4z9gW4mMynLXRHtXN1v
	A+CYIZtym7R/VdAVsFryUMteqNVeLLvOeDblzAfaPXTBfo7y3KF7yxErcJgCQvEFNV/WJ0q376O
	0XHmQuU4merq9fSUKagQVZdqxHsOppbLNODUQttBW4AJf9TkmNKlpg5r9Xf4lxFBXJrImfqSGjn
	Pz9zg3g8lShaH15baFSZenGd2NKNYwHlLECB5EVlROiUcmN3cm6jq+xFGm9G9D9kwne5vHnGkdb
	NKwQ5Q5Cl/73fpd6Za86zCe+6JPjntGZCmfzx/+pTW9Iis5vxuzQQ/si3sWygP6TueNQSVVKM91
	p
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b704:119c with SMTP id 98e67ed59e1d1-3b41c938935mr22519935a91.37.1795784895284;
        Fri, 27 Nov 2026 05:08:15 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:15 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v5 4/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
Date: Fri, 27 Nov 2026 21:07:27 +0800
Message-ID: <20261127130729.1263920-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127130729.1263920-1-mmyangfl@gmail.com>
References: <20261127130729.1263920-1-mmyangfl@gmail.com>
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

With fixed-link there is no phy-handle, make phy-handle required only
when no fixed-link is declared.

A fixed link gets no MDIO bus by default. In such case, MDIO devices
must be placed under the mdio node, and PHY nodes directly under the
ethernet node are rejected.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index a71529825955..2f1c0e0afb88 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -13,6 +13,22 @@ maintainers:
 allOf:
   - $ref: /schemas/net/ethernet-controller.yaml#
   - $ref: /schemas/net/mdio.yaml#
+  - if:
+      not:
+        required:
+          - fixed-link
+    then:
+      required:
+        - phy-handle
+  - if:
+      required:
+        - fixed-link
+    then:
+      not:
+        required:
+          - phy-handle
+      patternProperties:
+        '@[0-9a-f]+$': false
 
 properties:
   compatible:
@@ -58,7 +74,8 @@ properties:
     unevaluatedProperties: false
     description:
       Node containing PHY children. If this node is not present, then PHYs will
-      be direct children.
+      be direct children. With fixed-link, MDIO devices must be placed under the
+      mdio node.
 
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
@@ -74,7 +91,6 @@ required:
   - clocks
   - clock-names
   - phy-mode
-  - phy-handle
 
 unevaluatedProperties: false
 
-- 
2.53.0

