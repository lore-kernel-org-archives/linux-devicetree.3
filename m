Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25902475E3
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072541; cv=none; b=o9LfcOd9NIAUFXRuOR6ke2N6LWmiiltxZ61iTOKAxXJqB9KnSr6l9MxnDpOPWLLmDnzQAJarpSxnl4femL00v8GiZRDfxXy41kBlS3L3Sa8dXEinhA9IhGGVXz9bjW/2IuwP3GWbZEWBi3Z68a5kwKQptl+RV9YlOacVBE45MTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072541; c=relaxed/simple;
	bh=utTy2N5m6iLLqToduaQBSAYCHJiDkqInO3VstDOPoxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPSRBox0Lgvs73DJOBR8rXpGEACxVs1MFebKTRnGN4WCBgKSiykFJYV7UTv+JON84zVtkMC1D4Fc6mPXC1C9/3zirTCbpnB7+MOdp44Ft6jb9nKyLq6BYU4k0G0NQDRuMgSGttelZAPKTWNFtMq2tlCaQP9IsoCiI+NLudoHrX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZmhMJFN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZmhMJFN"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso2843725e87.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072531; x=1778677331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMeTRBDmDnSb/6bNUDbfXXIg58i3yRtlbEoK09izD2M=;
        b=EZmhMJFNJNNVMTZ+7PcOF4SmSdCKTkD7UdnayT02OPLJYAvaYrKcyPedUpGli/MNr/
         U9VXBBEZkB/YbOPQejkloXvnm6LQo8nPmG4G1JamXvhO5wsiJyoxW9OPX+Ig1fIa3A/q
         s2TLzCuw+f66lplZ1yjTlo1zHtFT0isc1lKeEpHQk3A+ADa0vFLETy2edBs+1u9nRFgh
         GCeFPPVxWjqeZJNxD2GSG0p9gg1/fb/o7OTwC0W9aia6iFaQ3xXUgc1oM/b1Vi44r2Rh
         8pX5OuoCq6a9dBQD+sVjPpEeW/ypaKZPde/vMbXOk4gRUrdnSLe5PLP9Phin0pbp6NV/
         zfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072531; x=1778677331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gMeTRBDmDnSb/6bNUDbfXXIg58i3yRtlbEoK09izD2M=;
        b=L0RoBCRoE3edtCj6ScwxAyClQpyNh18tjjBJxPws6N2O8+0uTI8uJUTBJLAbiUxTFT
         S6r4i1/Wsdsay/+RdGZP2qIel5rqgYXIZmmERSn8btOAiV8KIt4FmdCo3jyhQKgdfWNJ
         ghUMgSLdEiFfG7iZTUV+rVGnCS1xJS1q3ih18jkVPIzg1ailBsaTvd48gMPrYghkjQRT
         AUmrXyfK5i+3ES0YVlbdLZpGhMx965peySJj4N6ahzy13xSZ9iicwaJt5nv0KzPc56k0
         G0fIzrEAJSJBudy0DrdiXgklSINONia9O3aBpZNo0gOdsnueuKfZnbIIf/KhWGvs938o
         tsMg==
X-Gm-Message-State: AOJu0YwGSkebQUsg9UHyTrFhsSeynID6AltlfAKAIimzD19psUAJ3yUo
	DXx2JSblLamaK6Cx1/fvQqTNXDrD5Ig6A0S3fz9ZcqFo8/5gvy1dt3Xi
X-Gm-Gg: AeBDieuWjnJylHnUWMl/z8t+t14RijOyzI+phMFgs1/Ue+gg7wIumjWP4nZPaQaJOiN
	BJGdKIYM/q2LojSE2kEN4G87zVxQmZDjZYWL9YOmOlHs2nwNgvdkHE4nyPeAz1vZlzfbn5KNw1l
	HWYphXtC6VVYXPKbwnUUfTnJGRerVf5UcEyOerZffIjNRw4fv6b70MxBv9QoNH3cxhS5TxuFvSv
	DQoVmPTWa0qbZ08yGsD6uqk0UDI/V7F8oFkPnG8Rfk/qzM4WccRgethg+1O/IBnZfV7XGqdO40K
	d8xpvy68ZujF6YJNdG4M1HuyfJ7aZ6nrsucVCEBwudjOi+7qJO29c4b14xInM/pkqP5fUwTZh3U
	JR5PHC+8c4vxv4DPhJj6O5xX3WUuUqRMQRrfMbmh9t1cCJC7Jh0De6LFuGPO62MVTyAToJr+k5D
	G1T/721heDvbzBSpjX9OZhzIz3xEUYTSh3FQkbmSyfO6QdYu/BSlicrYFlCTY6Qclw6vdYWOe1K
	S8Xgv1w1LGZlEzeao60+gGfB8RZNXbQU1UdKgu6hGNQ/wGg2whiC/pZBb4L52sVEmqZdQB5YKrb
	jmPNZ7BU7nc=
X-Received: by 2002:a05:6512:6c7:b0:5a8:9135:127e with SMTP id 2adb3069b0e04-5a891351b19mr136583e87.18.1778072530001;
        Wed, 06 May 2026 06:02:10 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:09 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 06 May 2026 15:01:55 +0200
Subject: [PATCH 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
In-Reply-To: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0

