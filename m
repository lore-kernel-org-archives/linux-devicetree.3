Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9292B364029
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823751; cv=none; b=Adf2LnKEAEssk50q8QkVrvJm7YwSKsW1te4tw/ktr9K/etU2oOkVOawvxjyphnwJLPUxVenTpayrtTGpgXgbyYcnAjwEUnuFqY7Lu0EVtCb7KN2KfspjnSr5mj4/G/oPB5lPjOyW+wYsE9odw+9d3RpCryYFuFOFFDRikT1G92I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823751; c=relaxed/simple;
	bh=aVdFf5OymMVSZ4KFTnooyC2hd0qHH4hvBzmghV4dLpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvTnqrUNI7DuqXq1kbs7kxPXo2EPJoDt5VlzjmI3nEjRbJtOshfDhK/dyVb2xHzGiM/IzzxNdBbU0y10kBqL3H5fnp3oC1lUM4bnyrdZoA1JA3iCcw8FVsm93B+IvC760iUPtTf+l4Ys5NaDYXU4GH4AkBqBBwk1wA44rCvR82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4zjnFXG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4zjnFXG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f8b60e485so4387719b3a.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 22:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823750; x=1779428550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=P4zjnFXGHsF/eBNiA1ijEPqz/NFATd7mTH554p4nTpVHGlaiIPzSNPOmme5yz7k36/
         DpR+N6STAkUWLTeCPyD/lw6+zaxnuRujKlOW9C/Mkk8GC2CGSCTTQEQ97eSY2tQcYWUJ
         ZQnYF1HtCwdD2QRW8eNCHv0gDugHAcmUGi7FOAPubXii4tDsSTxtzhEPxtSKK8YwhQhg
         ZgvtVdaNIo61i+GjMueX74rfcfVleUAT6JuR7FrXQd4MMDwJDhQ4Ghn3AN4a+drWzJdB
         mPQ9mL55ufgPy3oqpt688fTl8gcE0PnrU8Fm/9F3nkoe7CQ5j4byS8klEGelMiWokk3w
         Gvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823750; x=1779428550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=s3U9q4SMgh4fD9D/i4jLAl2CAZuvZ5kX2v9hV+tqSvh6vqPuApi1MB0yiE3RWCVEIE
         OggYRBbPqLfXLGktWktL7WsjAIou/DtY7BzJ8tcUNkPLlDv3bYzNbV+lKK4Vjd8cOzRr
         LWKZnXNaSLHy+tcLgi2kr3le9sAm/aGQ10f9mdxCAcl979V1XDblrXlL1YrYnlhdpPhQ
         2EbGwDaANzXOTVFbi6ZlwmIp8mcSb2+W0XoqJhVpb66lHJWwJX+evhdMARiErXlIELVT
         xT6L7R13qvC+xhfGUgdb+w5q+kjkCBfoJaCgQqAFZDhAr5EqZai7QvBMCQqf5GMZXB7a
         HAvg==
X-Forwarded-Encrypted: i=1; AFNElJ+DkJdvdgllhzFZcMm+zJl/uVpwhpE3hI+xhGzvi9tTTEKSEcU4Yzh3ag5pnNHtpQXoXav2mvV+adA8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+b8OF6+727RiOr9KLnY5v+pgmjNyjPeE53RDwm322+46XCebA
	DJrpISEvNNXhA2shkBYj+zKckE9Vz5lbzQFA/Vl6b4FWVJEvc9zWfAgA
X-Gm-Gg: Acq92OG7OpIArkVh1MUipz5xToc4pZ5H3XbeLrYvb7MzWaVu2mx7LvIj9x3rs1Uct6s
	OA87aXxWro81jbUmDSYHzOnQrLpqUpvYOrcteloqXb8E5txuHnnN341f1KHJZokaDC7Z3MYy5gd
	agxd8iVsMq+ACrqPV0dKjVpwBW5FXkXgYldVAAxGkrGmzrjjaRelEUFsITM5u4TM28MNOClUAKq
	D+YeT2UiesIAHvqOx0CseY9dye+rjIog6tZu59Gkegb3xMTFw84wY3ckemGvW2tGv4b+tFQq6Ja
	Gtiu1eicvPr9DxEmir4285Z9/diEKKx0vW+WgSlQ2JixLnjhbeM3J3EhkJ0unsWR9h3S4Ktzvd7
	iaodb7MtjY9cu5pr79SdDDNLYleXJw9LpfT/dvErM+LK0FClsooVh0aREF70DnTRXzSdI/yhLno
	DXBVdqm5zKjjw3gwddsWLiAo2ISo+ZV4GxpcSmRyUHx1C4277b2xLimhCozn0ybyzhYhFSc9yu1
	LJjZQ0pP9KTrCGbIVrHXCHiucY=
X-Received: by 2002:a05:6a00:2793:b0:83f:2568:d456 with SMTP id d2e1a72fcca58-83f33d277e9mr2723997b3a.29.1778823749726;
        Thu, 14 May 2026 22:42:29 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:29 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
Date: Fri, 15 May 2026 15:41:46 +1000
Message-ID: <e54aa6c1e190b0e26d58504c5ea1b05fd09d64d3.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the Microsoft Surface Pro
12-inch, 1st Edition with Snapdragon, based on the Qualcomm X1P42100
SoC.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..aaa9a129908a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,10 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - const: microsoft,surface-pro-12in
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - qcom,purwa-iot-evk
-- 
2.53.0

