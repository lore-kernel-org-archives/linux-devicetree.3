Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314833F37A
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693633; cv=none; b=toNIDIqtGZ/ETvmMMRyzVlfOd+46c8VylaGJVhCmE32NcHYqSIreIOcqk5yLT6/43Or0ZTXGCqeN6tUg8OH+Zo3/IDFN/NgyLTmjB/fUeSSAyR3Dy/fmZBhgOrZUdei+s0Thn28dZrmWzJTbjCmV45pKZOE42/uO7XLa2Kk+qNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693633; c=relaxed/simple;
	bh=5hx4UJmto0lkskh26+QnsuW5IA/b08Z/iE0weO3VEF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdUHJSZuPFWseBs92d/yHWsZQOabXAOYLZm0jD6vXoZq3PtB5+lmuDxLIBX6KZVaExEyzN+cRrMCuhEQZZ5IHEQynzg5mAyFDfWXJJck9EeGPFZmJu98ACuAWTxmlpcfF10U2fcU2KFxHYnkn9OESLapJ/Vp9Zhk3DQ+S/DcI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXKvoxn9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXKvoxn9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49557167508so6461625e9.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693626; x=1787298426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5336+SrGN5lpWmSppcc7MRbo0dB/S5DAQkLdylUDNM=;
        b=rXKvoxn9zuo6pcaQkgbGf/V76AwgOyu0MadsoGtUWZqAjrYQvqhac97Xccn8Vb1tnc
         XzLatmjMBQsDxBeXN8uoHpCyyMcKqEIVVWPPiLUlbbCo4G/5jiOrhgJ3AEBjPCq9viy4
         9fzN+xTZRXIc3jYD+rFTY+UVLWq+cJiiJmaP2xBggSAKJCHow5P+zwHqGtqpFl40JESV
         NTGKChxpxJLJ5OdRsHU++0s5+Shc9CK4ETsJkTUKmE6gomKGQZ5zKpw96JH1hBvY5J7N
         757cgSTt5rUcl/WjV0WJKW1OXsoe+Red2qRtw3UvCGFp9MLJFbut2EwmSoNn+YSDcdBP
         ZL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693626; x=1787298426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W5336+SrGN5lpWmSppcc7MRbo0dB/S5DAQkLdylUDNM=;
        b=ijYu9miAkSPC3wPVvq3/THBsHJJtM3rm9AiUWlXAtfxFUvT6eCQp94S3ZxlPeObn8p
         KX5hvZLswwZDiMvIZKvFnCYEnEoi1vKvoMFVPccCnN8oJKqwaklUDwxQoDJHPSUxq/bd
         yalzn4HsUZbP0BEwQ7Av3H/yZP3tveoK8SMJkqfcbog0o+QUxWP7525/4e5pfIQCpzax
         FWaUmM9WWu/+nKpEpyzBXbnY6jqM2wXEdBMqo6aLqEbzj7hLrVZqeLWBxz4LayefNQPY
         cwgjFiHKSrvmb2NI9NVHo4S9xUAT5AfAPVcrqigTQC0N/BOZdkCogQw452CK/svZucuI
         g7XA==
X-Forwarded-Encrypted: i=1; AHgh+RrgLGo4gRAn6c12pjF/Z0c9PGPyCWZLsewW7nhD7mC8O4gBHW9Y/nQ4OELHkrm+2/7omcQA5k4qak8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5m+hVsbBfMeQf3nuDh/umZjtgmG3w+A4hivVjlSUBrGLcHXlq
	zwmyL93w4lgbTTAMdHsYlQJIMiablH20ILOiYmpR8NFKXnEXb+LHdsDg
X-Gm-Gg: AR+sD11NJ+eHn9hwmE0wtS89dznIa9kAS33G/CQ83wEaoHXc4jhPqYJFO0QgrbKX1ws
	uAFpEd6d8d+OFmkIy+eG1Cj3Pv711s5kSTSjjkymTvsGWbf+PtyICDGjoSXd0tdHuoS1mJHkoUT
	tmYcLWYF1rb8gmfDzJbQrNbolUgrCYIE96bXjxhIEelpp+rScK6muiLD8AuK2CMVchXB8OHE0cp
	KNoPJw6gvXKgspEUJ2jxCS2Dc7tPMQI8akijLBUVTRvGTD+y/+KvxJT30TBc+mxB0mcb6H/Xv92
	8fPvVYm+98kgqKpwQXlPL4CtFzfAQfFJnel1qUYsH2g9tB96M+HNB7myBTEoOjrtz1WZn3nfHgA
	xPu9peWm4Nx5XMD96myxlW5C3M/VsrQUl7ntUN4txeTrLi+ndOp0+RNQD0Y92Jlf7uxhXX6KL38
	BJik+YWMbJq4IEe2dZ2EIGO+U2YaPFKQtE2wnBIZa+DVlRKSocqxAIELj/B8t/QQPC2okChzz+v
	rRI
X-Received: by 2002:a05:600c:1385:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-499879a50afmr38622825e9.16.1786693626273;
        Fri, 14 Aug 2026 00:47:06 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Fri, 14 Aug 2026 09:46:59 +0200
Message-ID: <20260814074700.2491256-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0

