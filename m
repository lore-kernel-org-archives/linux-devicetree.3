Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC06337BBD
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897124; cv=none; b=bCIX/z+pToyJAPl3MQs2w7KVJldtoyhil8DPqy84YjckWGk+7Wzc2Zw2CEkHRqZ7IrKbxgat9LiwFj5eFwxQnqArnj36mnmBJu22/rK2ZYj4LdQAxyQseRwuCVclfRNUl2kZ4eg72hRHnUrV1+yxfI8jR/Q+60Za2kFkXZD/iJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897124; c=relaxed/simple;
	bh=UV1HcC8o2lo+HDUW5AdLSlTWY/QuTMJBVWHiIzQQzPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFDImZ6zIIw6wPUNGtYo6q7h38Yx34gI3wEuQBCw7Xqz8qrZE3ri0s18ANx4i3+ywRErIo6/mm/UXEyK5AKhpVV2Cu8TNy1RDrchpEceC5Jq8tKSfpb055czfy44pjBh9jmi7bGTjG8alW3d4Er9jZy3uUuxR4QCaAPBon9buU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZQFqsqX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZQFqsqX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3186806b3a.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897122; x=1787501922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SDYJOwc2/gQDBPl33jAG6mx3Nx+oLrgTvDpzH25eS8=;
        b=GZQFqsqXFIu9aceoKrpKmecTkAV0gzhzcwAhpy3xO8w62cUV90FX00oCxGWvSU/Vg2
         HtyTH+mI37vlaBbF2bSYNs1e3tj2gKo1wEGrh0FM2C74LIox9ISWxxNj5M+BoOabxPbJ
         Stu5rL2zxqfsf1PTFytZJUatQO5UZFMVpuS/qX9SQJErqoLB7qzehXd6lmPglSo4VnBE
         nPEjqD7WMiq4eSaTNK56MbT6wMcdnpWi08bnx8ipA//byXBxm0t//w3Vu62SaXxr3umG
         yWbjQn7kwurX983ImwtcALAIlg95VNcrZr+zA21ELoJ7AoW0Hh1UY5Rfx/Apuka+wWcs
         mb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897122; x=1787501922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SDYJOwc2/gQDBPl33jAG6mx3Nx+oLrgTvDpzH25eS8=;
        b=GFDagIkhNFIv1n6MaepCSGyi6h+DoCe6cW9lzQq6VFYNUjck74HjYD6h+JosJYs+a4
         lbuTW64zUBsug79YT48ToGSJ4SKKkn0/Gb6xGS4FKL7YoYF0n0hDxv5Bmw3Su1XKmpgw
         Du/RC8fYZ5VJRIwxn1wn4kASqXxM1Gdgj8un0tbRNoTJkqCyUoQ8fBwBlvaeCrLJBhPo
         wYzZnHhYyg7+gXGL04mwepm4BQzAjsdTM1kXOzuxwAstjfvKc4a4mmbDCS3D57NxUzNs
         ZYBPjwVUgwsa/fWHoPHlfveTja5+lvA2qrLnFFeVcrGueFDHMlHLrE4V3CJQ4m9B7hFD
         OcYw==
X-Forwarded-Encrypted: i=1; AHgh+RqTsU1sbcbP8i+pmGOZD6Lwn5g9o5sU6X7hpBTgVWjr096TET9MmtfV6Xh+zdFyX+ayprxlR3jI8F5i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/9IHGkddwAgILDK/GrlANpaYvXu/eVu56qfqSlDts4hZjAZH
	qWWjken9qK7qKg0E6larUm5dlPBztpCfm2klnWWVHYrZPdVVSNLx29+J
X-Gm-Gg: AR+sD10UeA/B7NGx0D/a9dNQ48g+G9MMr29kMD4YPy6a+eJSvojqQww+mGOKbrBusK6
	IK5UREe1HJsmfM++w07QrnV3bPO+jIow4jMmWrZ1eXLbMkZzJFtUxfqc+vgwmXXGk3u039mZOMN
	hDreHctT30RJhflahBP66f78SazkzAuHnLizmInzskF6XzAcYLP7V50SuKSWE1JtcunqoswQYBO
	Q30XIAhD4WZUqOsUVSJomqGN3z7aGqtaYwtlR6SbxZl7e0aXq0o79U81AOSLoT4Llt9IWujau4c
	pTjcYJ5BebQXl1JRLPl8Zw6oVY+3CLhIwiijNcArsa+ovjN1MduXWwoOlvciV0cFzS4r0gvKmJL
	QoG8La41fifGciNanZa36xn82uLIN3CbUCpzwxbdCGJCpiHHkRDhc7ULsG8zHxjL/lDf3tks6rm
	X/IXOl2hN07PBVC6rF38etjaCW/1Hm4+Zqm3A8z98yk17fzSwM0uBdQs6ryVLrR7ac0TOpKtm2O
	ixmuogECEOy
X-Received: by 2002:a05:6a20:4309:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3cc576397a2mr21774593637.10.1786897121922;
        Sun, 16 Aug 2026 09:18:41 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:41 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 3/5] dt-bindings: arm: qcom: Document SM7250 SoC and boards
Date: Sun, 16 Aug 2026 16:18:06 +0000
Message-ID: <20260816161808.12419-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Qualcomm SM7250 SoC binding and the MTP board.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6e..481041700 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1050,6 +1050,11 @@ properties:
               - fairphone,fp4
           - const: qcom,sm7225
 
+      - items:
+          - enum:
+              - qcom,sm7250-mtp
+          - const: qcom,sm7250
+
       - items:
           - enum:
               - motorola,dubai
@@ -1306,6 +1311,7 @@ allOf:
               - qcom,sm6350
               - qcom,sm7125
               - qcom,sm7225
+              - qcom,sm7250
               - qcom,sm8150
               - qcom,sm8250
     then:
-- 
2.43.0

