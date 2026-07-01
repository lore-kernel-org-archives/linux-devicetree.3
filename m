Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ABC36B07C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924422; cv=none; b=MCCXXb1XvP9gXq52taUGCbDqXEvHprHJhg13Zfsuqnnetcy1AR832nmtQJpUFOE4UCS8FpoMPRGnSrMTF1YCJaGa51FzfLUPvdT3nIX7pLhdaZEPZ3fsARD9xyYMafPwdPpDYQMw6FSVfOaWRRjwa7P0VPKVqF4vwhb9pADKX6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924422; c=relaxed/simple;
	bh=sQHELRsc1NbOmaM6rVh4L7StNjPdVuwaTDS+H0e9BCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+QH8Snp0QDjPbHl5OwK1sjRCKYIxWR9LpW1WaH1w1owqMorBMLZL6/GBIdsePobLNrKdkuX4KL7jRcezRrQxPpKrTRW74G9fq8etj1izl7UYRVnrNkE4Ln7/ElvnYC8+Pm5iugwcEA0c2eDfihjepEPoS7vTNKzsYO5ASf9zug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irPvFuFQ; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irPvFuFQ"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2c9f52ad059so3178935ad.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924419; x=1783529219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=irPvFuFQjvp4xUD4/WM2i9vxAe6vZEkU41jrc/Q6cRctJGbv1SASKGNtM5tg+ilC43
         6f9JJRkOb1IMpQeFYz3laTox3VEjWAyqEGUM52V8DHU6LapgrD5Enpn66jG0QTZs0Mhp
         Yi7JmpoJ1ADVFOD9VNbyjHrUTNG8xDGLoKpRadlL7wdKXZy6fgu9AZGdLUm2ODfLAfgn
         LBP8ETJ4XFBMxxVGYDdUQdDJWNz/3ang8+Eh2hBewxPyV04Rr6J5S2NhiBlGFnSgT5KA
         Fqlt73AiJydBpQyRUXpdZg0GAMeKG6ySQNjCPtUZ9ibXVKB4zlQrMnsZ4JAJLWSy+mv3
         PhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924419; x=1783529219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=bwP2lxt21IMfxVa6BjqTAeqDgyg/umMEwV02ayiRpxSTf1/signlweqY5E+lfRVlB8
         I5p3dwc4KK8FZE8wKatuLhcklv1w9ZBccnpmEVbInUU+vIpG8iLXsLY1K0DDBYrQTPyu
         XvYi9vKNLPO5l20AG22D8OCZ1cxrWrTBoM0FRuDhgUEeBKflQ8uNNHUq3g+JiEBn8o8q
         WkHejebMEEXXBELznHhMpLWB/PyZsJtgPC6vtxLvrBzt3tzX3+o2gQtnVv6doOZ9mNiU
         64cyBVqIpjff0Rn2fxmjiPUxrcw9cq1ZoCkfe60JnLa7UH4QaEFQohlbHznyd03jc/fD
         k09w==
X-Gm-Message-State: AOJu0YwIo7gtwhK1lqpcOf+TZbuo38aYUET8FEEHHKziZXOm5rTFxs81
	juXP0ghLzbpQNfBxYLKWDHNREGLPQt/VVKTWK3qrsGIBfRs7sg1NQqbb
X-Gm-Gg: AfdE7ckVW33TJAJOoda8lPgHGA+MKqkq9OFNOxokg6vOtpGNa3GZtiZDZmP9AvJii0D
	6158JSEuoZ6x2V+F+VOnsaySYuMfSv4kblYYf5h6R98nbCh/iXeTi+p2Vo6ynkg/GCGrRfuglVL
	h76gmEQXZqL5nvA6u/ehJ9zwZmH2Fx5JwY/HZhK1UxhgA20yjGWwqNrJSYOTqyaGmwK4gwG37FM
	bJpbwIafCG1Zc/s/CNnfijEGwXuIpvDiESm66amNuOg3O97tYPxb0rphl3IhZYucwVtyOU+4s5m
	Rb3prwtA7ODgUOVg/vMTsQVPV0160SAL4leb7oQCO2AMAhIXsPn0TMDAmKHBflbThD/fFzBy7De
	61jLiDNPk1RRKhm8MT61hEPvFBaNpohfaJqYU4LQmt+UN/DbLZ9KpkE+2fC2D7YkCyXFSNV/F9U
	qj+BUqTTRtpq0=
X-Received: by 2002:a17:903:1a2b:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2ca7e6a6731mr28150095ad.18.1782924419477;
        Wed, 01 Jul 2026 09:46:59 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a911f4csm985015ad.29.2026.07.01.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:46:58 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Thu,  2 Jul 2026 00:45:43 +0800
Message-ID: <20260701164543.3967388-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260701164543.3967388-3-coiaprant@gmail.com>
References: <20260701164543.3967388-3-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3

