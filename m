Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD63AEF36
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415681; cv=none; b=uyPaEE46+dOEL2o5AGmhuoSKRVjISjRScz26gPWGHrmSgK6ADtY6LA+mMyEI6UPaWFtIVszYm7w1L1EotCLOFJM2SkQeO3lfUY4CGe7+egXgrRd/EwsHPgqxdfpWx+QvfHvVjLHRwUpDmowuf7nyrHiU7Os9drGABJGSF3nz5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415681; c=relaxed/simple;
	bh=ZCy68bKzBFZTZSfOpy3mDznqvrsWBJ+1U7/kAOyrhT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8AB7TZZd4FmFF+YeaeVZIrgwXaFcCq08EUJ9j4JIkf305lg0yigp/ME9gh0PIvs0HIKtcmYcieHUrsAEKBQUJUdDk8549BpYIM0luskyU5oTip2ysvbEDJH8hnkdzZ9MFeEjcKfpb/7xZEIJ4S0OHDxRRhYnE0Rmo3r4HVeHkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHThf5Qf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHThf5Qf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b980785a0bfso67222266b.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776415678; x=1777020478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=IHThf5QfguyiteqSxQd6NhLrXZqQ4nw1EaX5n1YFm+suAGonJ7vOSezC22K5nIYZRC
         x85AW2eZFC0wv8S3F43y7xUOfl5s4HnyC1LJYcfNPrQQYmoWC3jrQcf6NqXtYmVQAx6N
         E/wrg5Q18SVHcPXAYA/8d6R3C3PbV749zeGXD76pYHJECMmZ0KD76oKV3sN714c87kDb
         vTEtmy92DL+y0X/3jk5Z+HWDyVyLp2k2aJzu9+m1h1cO6IUKG7+61sq62HiQbowSoqjJ
         Zm1xCSWUg80Sko6jtOJznmgJ82EGbq+nyouR4t8rmf1XXchbbLLIk1fOmQRouT7U1Y6X
         ATZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415678; x=1777020478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=SK3o7D2x2x+pfrYrYzXxFMYIQjAtC1Q7kPejdyxlzVUjG3GgFJXlTvChldhQnig/QA
         m3gzPa4gkfuYZuxg72sQbeJq1WKzTwAM907UW8cgpUHn7wZDFx51Oahm+K5+HAUFCiFc
         4rGJ3sVFYROa7wFhoKkkspYKqAtjxhWQxKohIbayjZi6ciniJoFod56G6ITH5fBblWjR
         oZrFUA80ZKjHxLtbQReICPPbWSDaEL7Zhg9cW88jq+T+/0AD2vf2RdE8kW21TfxVCKHG
         334B60qp3G0fz1jnmdYaheHIaYaIbX2/i/lT5I8GDxm0a/dz7K3OQQiYdvIB0lleAVGL
         Lvog==
X-Gm-Message-State: AOJu0Yxi6t0Op0rd7UC+k/DKfBqYOq3tSUvdTSTuFmeF1Nr2oCJ8AhEE
	T/xA+ipKy3MjsfecZGx9ECApyD9yW2It13F1RjPTap8q2O05g+J0eOvIim8fZ2Ey
X-Gm-Gg: AeBDievS/DvWrSvYO8O1q0r2JkQ9HsF591bpxoS4q2CNxVJE7zxetY+ib6ajqxtDFJh
	8DZ3nHM/00h+La5i78sUG5sKjaBKrbS9MY1oinW8j2hcLh7kuSY1Ljpr3aEI/Dy9llxuuEKir1J
	A5X4mQEFNN+d5hP23K3fRryeswrxJUKg0TDj5J4kJCBu63QAfa6Mpftssj9eYNTb/hlEul7lXfa
	8u/sKpd+TCbQX/vzCSwWxrTKwga+d0/RLi3YXwOCxma2kpc4ldQplbeRaPcuKzAJ4PEzQu0rxpO
	P0wtRJLUHspfa7pOZwdDYZ/JeC1VGUlhvsjwUoRLIGHk7++UCte3i1wLaPDZG/3zxZxVplDCwLB
	kBgZ+CQ4MPBE4I+xwEUaMWAoBOLLSzUDTTBWOlAAmzDQaXikhiIv46Pj0p66YsrEGJS/iW9lWL6
	e9CYN1hf/WDShu3vuoVYPca4mCb1clgr6TlkLD5hI=
X-Received: by 2002:a17:907:d093:b0:ba3:cacd:b9f6 with SMTP id a640c23a62f3a-ba41907844cmr116794966b.7.1776415677413;
        Fri, 17 Apr 2026 01:47:57 -0700 (PDT)
Received: from workstation.home ([178.230.164.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm32789166b.43.2026.04.17.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:47:55 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	val@packett.cool,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Fri, 17 Apr 2026 10:47:48 +0200
Message-ID: <20260417084749.253242-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417084749.253242-1-zstaseg@gmail.com>
References: <20260417084749.253242-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..711cf3bba6e8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -982,6 +982,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.51.0

