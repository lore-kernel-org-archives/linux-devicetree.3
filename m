Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09BA3F1676
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102313; cv=none; b=KgHItErBCWjO3aQAgw5Bt6+QNVqBLg3GNXTWei4rPlsQ5Yq7tf24s0EwxjuSXOvQhdXRbuj7wdT9mT4jIdq+vnscek2HqnBdwAKuRBNfQrEs6aRfL2sq4WjVFxeA7/zq97D+IVjROwwx7FTtJwGvFmRYGbtgbZxac+L3VkB1qZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102313; c=relaxed/simple;
	bh=sWXGDROdLAAxc1znU3J1G6LN8LWLspEasEGN1GIDqlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgRAUMB+5qgetX/KWYCx/U1m2GOT/bNyCR8UhHXcOI37Jol11re1jb/DLh0pUczd1WAOIAnZX1ieMPOgd05V6pMOrvqDE1H9hJ/sJJY/ERDtWHG1sHSxyIicDKKAt8cvlPwvij9f/eGwdFZLDSnwsJ7OCYZKQXYM22jJAqSGcjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS2YrdSx; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS2YrdSx"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-369002b26f4so966764a91.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102309; x=1779707109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=CS2YrdSxRIgVSiU039ZZLmwwQ9XD35ZcN6avNnQPOPtLxDjo4+6k3fF3nXg8P2qWYO
         nrgGPVj/YjMSSwyRtEku1g1etV9cY5uFEjj9jPwAOngKc7mUTcqpcCHW5IhzHJkudvCn
         P454rpJB11lX9n1Mrq4fQuDiJC+9OJXEivoI8Wu47FW4g4DVos/ATJj+e/nbwM1AJFvg
         ztVnl0SLUPLQz4rSaMgQZ5b5B6S5k2RACKbMJ+OudzrfddpaWKcqCos9GiBIzA21So2M
         DINg3IrvS/Cgifb527fzn1OUkVPvBGmWAmDJkGRAGzBvFQCsBhi7kN+d5qDMuQqZE4+e
         dCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102309; x=1779707109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=IirIS1hUU5oTFSxYGHaJPiXCQTx/mtUcGFyQsCJNq5R3B/4iX/MQv0NdKPHoBDe8gE
         S8ycgokfGp8WsgheyoJiji99+HpPCLgvoF/iaZoDnsIE5CXg6YVqsIXqymTJ/WWueSXs
         NM60HKNXcDp/dGZlO5f3XnlpIMV3Q65C3ScUEssHe/R9Yxd6b0gG+pQW60ystMR4FjcI
         r2Y2qtAuCFYX0poPC+xRLqUpL/Ddm/G7/0cU2PjcmNpAvXKMK6cMT7dX0E7d98W414A1
         //wB+MJrSHU8kAPjz2Pzpe71XYMmPc7NVg7eqciNWtJ0KeFtVw/sCpmkJOx00QXDOORy
         XSxg==
X-Forwarded-Encrypted: i=1; AFNElJ9cp3nRcPMxgr3wppRU+MmjYAl9NalG13PkAx8xaud1ou9C/gbVRB95/m3BtD6J/D4gPbqgb6qLTWbB@vger.kernel.org
X-Gm-Message-State: AOJu0YxBCrFxl0+BJ2+eXI40nEAcdJC469q8CRtBWMgZpHLE0IzHxyyn
	LYv9oQYFDjmer9zxn9ksKvb/bWFbmXvQBUMrMH4UgSVpKM7iS64FLhlU
X-Gm-Gg: Acq92OFMF9H4GqXSBpU+Er5MSyRTVBCgWZqZ4EzWPs9TGnhm8F0h9Gt/EPeLAR1GkUC
	oERRB/JZIVPd5knUXXtaYe/+2ZIzkZHPGEll26c8YP9O0R4JyhOj66D8DLxrjV7ivFNzOVH7+8d
	ATZO250bbNUzVV7HvcYTz+5x+Gm4PEO1dV7FZxUdm/+ENE1xObjWWd45PphB5ZkWxqT3p5n+VDi
	YYSDqskXhQXOEfpevv4RD5GDjPspvO33KxF394oqI+AHhnyX5gL2UhE0GNlq8Fxa1QTSv9EBXQd
	uq9zE+/rPFNhqX3V6ag3UYJMETjmp7QpVe/SxLfuOytSatirmE95wVhTsWALmMYmV/4Cmg/wdMp
	cDyvc/9s9OBL8k4LpylGrxxcatnJStXq010HhM3IgBArq0DaLrFGDY+khUIM4q3osN6EHEDbeBb
	pH/tgM+WvPLPvcTmrxqdfxXuL0/A6Bf8cqdWN43NbjIs36w42P5Iz/unuo0g==
X-Received: by 2002:a17:90b:48c4:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-369519cc92amr14285532a91.12.1779102309169;
        Mon, 18 May 2026 04:05:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm10866313a91.7.2026.05.18.04.05.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 04:05:08 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 16:34:34 +0530
Message-ID: <20260518110435.16262-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..6924bfe7b949 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -361,6 +361,7 @@ properties:
               - radxa,dragon-q6a
               - shift,otter
               - thundercomm,rubikpi3
+              - vicharak,axon-mini
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.50.1 (Apple Git-155)

