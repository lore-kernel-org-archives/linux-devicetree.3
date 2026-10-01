Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB8135B63D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821477; cv=none; b=FCGei+xI9oIX7Ztc5R2X0nXMBWrPk8cXjxjhnlRaU+KWy9YArSI+KBqzYgp+4R9NQA0F608yhdF30P+AgN5rjsFfsZTqL7PA/q+8C04qyNknPPfx23E89INdryDKfA0MfusFccwZ9JvoZs4lSnPueS6Jcucbworm3gzqorcxU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821477; c=relaxed/simple;
	bh=ZXJS5JzKrOR11yrKsPhvFOiNFDXrOJb0Qlf/cDD/4pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVStB/gIKsGk7RFTaYGpaIAk1Otn4a67Z0zx8YondxDBY62ZhbCu7WDDGi/QtDdf4nPv30GMlvn6seSqi7V5BIsyPF0SberNwQtaKm8/gKb5VQ+XmM1N9lEHHDcGpImnTvn30L9HsbH8wKMygZEgc05IwkfA98YYXqvzz1Vzqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktg9ZE6T; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktg9ZE6T"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09cso1461292a12.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821476; x=1791426276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=ktg9ZE6TYeiUgeS7JbexePSi59dHShEf0E7OrczJ4Hq1Jh+XvqfrQV/cd4tmojXSzl
         rdVer250PKHH9YTc2LmmHLPQmjPyHcjML1tubjXW9q0VS5I6b+Tq0K3MQyMYNg3Pzur5
         HmjnjAboDfSeEXS0msGDbn6mNmDw1lPvkgEJqtQIYsyXqX78JR82YAdehZjQfrCTfIUV
         6BJ8enWOizYnmoC/LFQjneD80PamUp9swjViaCjDXXhHppSrBYLfTSJtYvfI0GWbXJtm
         +8r1MAe4Rt3TM2PV0nGaBpbSehvDL8TlEdywTym53jcA6+YZqQ0I6fuNRaJVAkpbr/j4
         lSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821476; x=1791426276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=VMpdjkasPCQ8V0XsMLG9vfS051M1tVGgzf0Zj5KdBZR8nsIrVlM30Z9ygmt2yruyNk
         taTPXbfvv8+mEqhTK9ZPpS9iH83u7NeDR9ZTvUeC2YKxhsMrCgq0n8S0AgapmI/nZvbz
         S5YQdx8rdqGtqUfjsparveK9QWxjSsHBpYbh5gqXvVgEX/fJGEhCA9mZBZ6Ip+zjoVD9
         +eIyD9nEBB2ubLN/vaI/calUaW58xo6XO8/2e8+lsDoslXSJUjjWhn10wllZJSlizMsl
         XB9+EqIsYbNj5J1i747wPqY/Wl2kSJmZif7baSx38M2yW/z5swt4Yj1FxiZLKM27RWfv
         wq6g==
X-Gm-Message-State: AFq9FYIaUuEKFI1bjQJrPAtafCzOIw0JrJe9yezvjX/nKTbWb20t1qJc
	ZIlvuX0q1u1f1uUIrct/1B0UBVBHRDskopgK7B8yiGHibLg5HIrFVMBcM2XDlQ==
X-Gm-Gg: AYBFou0rxy+Cd5RI+beN6c20SkuC6PqfYq+xgAB1quYTRXdhHNkIjmvnQULBZwe/lzt
	SndHu8jsPkxMWZBVv8+yaoB/T1fEfO8AcZ3BXPjSNkk/ycc93Ef1bCliRzXc/Ar2TsnJtS4tCYj
	JCeqg54Z+qQd/EPT+OtbT0BC37NsJ07Z2jWA4fzdYUoAlwQmvhfvSbYM+2yjYG21gdh15cR1jSy
	WIGCh+HdICQVW2j5q/praBqAqw8tRvwqrZkKQbvpILl+yAUokR3XDkYmW80dph9PXsA7gwVol0p
	7N0cK9doCSkNZcUG04hL/LP3kmQbz/lR0n4CIMcbJ0szc5/A7z6VkNl+MyFqC2IybRtSXa8bjHI
	W1djyeRF8o2IrYlIE2JB7xqdqPNUQ1Bt2+hyGd1yfOzfL3IxIB6ZZcxBwzzGTbNzG3n1OEX534H
	Prwpsu6B61P/ho/VBckDe6m+2o4U70Cna5w3rSINV2cnYLP6+28ELA8u+y0F/QLw==
X-Received: by 2002:a17:90b:53cf:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3a4d1524695mr2745133a91.15.1790821476030;
        Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:35 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Thu,  1 Oct 2026 10:24:12 +0800
Message-ID: <20261001022415.913959-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0

