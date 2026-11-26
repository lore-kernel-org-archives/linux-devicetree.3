Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674675;
	b=QrLg/+0OU4g07vpsFWJPLztQEO5o542EP0tR4WlsF7BtMClVJ87hHlHslKEasH3EzpwV
	 x7cdTnynQmA/UzCjaGHg7hVJxBmZCRkGn00uX/crGAih/jfWYNlcRS5gQzWOHo9nwLik3
	 s+Qn+pLMjSytOMFvDERSAYsGsjBiWuPoWt2kEWS+nZuy9+UHuUSYpr7Ay0tLI8lP03GYg
	 0/kixN0MNUL4a1eobMpqfaekYOhPuqQX/nYni7ZooFm4/koVfrYIY5ZSK3Xr6CA/yxCWE
	 MG7mZ3JYF4FUBHHzVxKJRy1gzazybB0plE7MRaXu72rNAHcS+IrrGE6OtLbXYnStl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0rpAfURq6UOsPiwQ4FgTkXmy2v7jkBq3d/kmCK91TF4=;
	b=Ys+WYWhx1BQ590v3W0XBZsRUDM0iwMomMUtxVFHfgKevW2n4dBLpfYgsJZsPTSJ7hBYi
	 Z6yDF6UVXj7TOLNcbUcj3L6mKi5ZzKFqL0I5OBLAR9SDncVIau6ksiz6H/1z8EHEQmz8p
	 m+woi+jcJvuCOGEq2GWzMdvN3lIWbve4Tap6UAA55v3KZNomAgCdgDd9qbe9VWxoOU4sy
	 PPiP876hPtgSmaS+Pl5BUlGB4u8joEuSByUVICMTpw3aMlnn5vbxjrXxSDL6nHDFp0tPD
	 +iXhzHmYgNhDGiDxy9QgQrF1VFhvWHt9/kk3acM7uSAsZbj3kGBFkNYl3fzbwVVejYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJrfEagZ;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6538A606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6538A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJrfEagZ
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b40a522c00so766198a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674675; x=1796279475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rpAfURq6UOsPiwQ4FgTkXmy2v7jkBq3d/kmCK91TF4=;
        b=SJrfEagZnkHwRnLOHyJaCSiMBCa59J4gj0xoer+A4ZL1BnihskxU6ZIu6ZMczmMStX
         +MeLM1KP+eWScUwxegYatJ5MnoOtBMgEFjUQGji775loTtLPSlb9RXDegNEEED9dFKmn
         cBSY2YL0tDDJ0msJIA6IKXIxoSZB9LP99leLHpzD6GRuGSKuD32L6H1UWm2bYpBTcI4/
         HcQJqliFm0BtU8uXy5upFCBuFQOVoOi/Xyh57/FLIJMFiqXrDeLsaTBydXss7Qc+2iFJ
         nKlDdHBXSyzgLLfBBGN8EQgHZuCnHGOjhzV25J1mR8+isQuzvuA7cnZ8hDL+PUeQsgKp
         CKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674675; x=1796279475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rpAfURq6UOsPiwQ4FgTkXmy2v7jkBq3d/kmCK91TF4=;
        b=vQGwQ7mwY8RkaeYUlCrfMJlms1l4BkiAMLOZynwSyq29MXxF2FlAL5LwIe9Eji6mns
         4egP/sKdY6sjV2y1fC24IGGtGWTZv/Yq2ifTWgldzxUPCGOqhr9ziBwO0Ghmq2eqYfZn
         idkFdhsDh2asePCrakZCtz1teekNMDyCwlzZ9oTJxENpXXIBHf5W8Yp7OeQMx+eSWGWD
         1ef7J0TF0GWHqPlauREK9Jpnq6O+jFTx7ZkAg+diK1jYXo23Cjb0DiqxTQz39252bgip
         4mL5MhySGRiSZ0n88J5lnJD/JxDNkOokNvAkIMMy83hEk7k0T1Xkv4bVBPnIcmcZU3qh
         6+RQ==
X-Gm-Message-State: APuU4Z/XusmkH/FUBLvcnX/gOgczGwNHN2yY847iyTeWYekNn990/wFh
	uNx9N87lrPMAwcfdR+S6hjPqgzPsZ3SV/2s6YFcEDx7HgelFEQ1GanFJcHTBtcCu
X-Gm-Gg: AZFdTZdT1IyVVvBIs7kQKq6Y8/CHpS8yp6ldEArD2saj9vBvYNFmzmxI5fZMG1ulmAm
	kRkygwwKEEfmqV9maDF7YLtee5VXXsnTTnccrcwQsM5JLhKqNUmsqcdvOPtrF1RsESdGijJf3Ba
	BZg5bwQEjofNXW1ilQHc+cIUl9e5L6ahwwyvAWZOcXXOhxEKZ8Q4bt3nzzGvYI/Xg4asGbhrSaM
	E6i/as/eKjPPgxGFEOjf2p8ZK3OET1whZb9y0YAnpGSQE2iJdscIoJEndDPoBPpHSLcY4L1V6qP
	Fg0zY64jxIoPBpsWYOb5/sTHeI7NY5CeWy1AJsQsHhf5ZJXbt3WxkBu1MgoCcAYVDifHlDjMo4A
	u/ElDI1tUODBwRH8yvIY44/VWEMcs+y2lKeq61ngiiGjMwpxLk/oW0Y2VRoMs6J4VyCrlpMIcUb
	+Tpf+IqcpsgILRe5dtbfmEOx+uDs2p1qgnyWndeKrdpnHVVX+ZsLgA9TDIZ1XTdrsOpnzrUjjkN
	LpQdu/1Sd7ekCfLhjTQvZlgwbnZj1pWgdeSOZ8mtkJa0hCN0zDUk28LVdrb3jc45cWI/g/f3owo
	6MA8F3lkdnosH0iprcK/+UchfhQur3yT
X-Received: by 2002:a17:90b:5346:b0:3b3:c107:8458 with SMTP id 98e67ed59e1d1-3b41c961ee4mr30654785a91.5.1795674674808;
        Wed, 25 Nov 2026 22:31:14 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm7906328a12.27.2026.11.25.22.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:14 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Document Xiaomi elish panel variants
Date: Thu, 26 Nov 2026 14:30:33 +0800
Message-ID: <20261126063056.2276703-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
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

The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
display panel. Document a board compatible for each variant so firmware
can distinguish the corresponding device trees.

Keep xiaomi,elish as a fallback and continue to allow the existing
two-string compatible for older device trees.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870cd..84ae2d991d628 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1192,6 +1192,13 @@ properties:
               - xiaomi,pipa
           - const: qcom,sm8250
 
+      - items:
+          - enum:
+              - xiaomi,elish-boe
+              - xiaomi,elish-csot
+          - const: xiaomi,elish
+          - const: qcom,sm8250
+
       - items:
           - enum:
               - microsoft,surface-duo2
-- 
2.47.3

