Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BBB3DD87E
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794780; cv=none; b=ulHCGA9reM8mxr/3aov4qB6q9WlEUOBOL3WD6kd6GrdYQQT/pNzoQpUs7eQk/3IKXo7onvdKTSiWJtx6ptqjFbi4TlmjZhJBfo3cfiSgzuAX0EPS7WFZDvEwzv2ibd5viV4+ldlIGhwSEtXXLm3YXg9c71U1A9UbeKPQQTbhZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794780; c=relaxed/simple;
	bh=dNKjpB5Yvne1H8ifySId4E2CFdpl2oBorsWQQ4hhHOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgLyQcAoGdhKCK7yUhsJJfWiuiK86YJ6quNfi+PSehXV1nKyvrmVL7Ra4Csnkw2DBR18R0Hv9hFYkio301wZuEOjUJ3hThcavpPOfrFPXh5h0TLKkI1n/FvRHf/w38YFUqGUvqc2PgqLjb6riTppYiULUL14crVWPhQkdpMFTK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ngPBYQRy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ngPBYQRy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-366330b6751so8203730a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779794779; x=1780399579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFBpp8NzVApWzX7I5rWeDbIZzRouP7VHUSMnOVFZeIk=;
        b=ngPBYQRyb0KpIm815HenF+otF9spwhDbNAuLfgopBSuyT5x154YyLBe5xMsmPW1thS
         KbmSDWi/NK99RWq+yoPOlQeQKVhNLRytPcy9SrEj9jELNv5rLMMC+rt7qFYfYeTNtR2l
         r04V48mk/aPwVueS1lJQOzSSo/082JVr43fMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794779; x=1780399579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFBpp8NzVApWzX7I5rWeDbIZzRouP7VHUSMnOVFZeIk=;
        b=KO6QVQGlU8+DKWZjRjs0wyNeTPlxEATtaA4668CygUjdhaY79q4Kf6lh1OqEaNC2jA
         0pPGqXSRQPOkzdJp2qHOBhZNp5m/1O8NeKoFWVuo8v7AwS3gmJltl1TfMKG+faveCZRV
         ul164Ito1aQ3N6Xjy2mhx1VfnE6n53iVQg9mlx/zClqWy+vh0KrTZr5kuw5y3/mhA3Gd
         bMRGvflncGjZ0GFSEXWKqmlSaUXjEJRkBqlD1rKgq8v0vrNoz6apA/q3Eq7fwIbAAtli
         P/c9K+ko+twFdPuGFrS86KLKXEccmeVG5Lu/auE1Nc/NreOdzz4ZBJ0QyvzWviURNlrN
         Qc1g==
X-Forwarded-Encrypted: i=1; AFNElJ8osY+oX7kADbZcZr2wA6KiYqILMN5i09IgBPcJuKxP1cnSRlOsewysbY0jir5UohEqGdUZj/fhg2iz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4RTEteOuIiixhhFxmBqyxS2KHTLT39Bu1L8R2OCpnCbSvaWWN
	UYCMJ4J0esj9cL+8wtAQnm4gRrL3mTRl2aeJMfUG0BynwvV5HHsyYV5dkADVfCa6wPw=
X-Gm-Gg: Acq92OF0v9CnrqdOltAHbbKCAJ/zm+DEQNnWBPpmT8CHO/zQYIEunyjP1522WofOnMh
	zZt90Kzd4NxbJS8dwYpP7FmWDGWRIK+dKEh3Kv6DSuF/Mog6r16z3P4QhKvOarbhhroTrj1kdcf
	ACsK6yizoXsy1h1WV9mmb8GijtQZiun9nlL+MnKrWvgWQ8yVE9mbtLAugnCajKxeteSXWAzQA0c
	6TPIHAnTfAHl0KsREm14TzO5vr/17CGEKsayOEeNYSu0u2hvB+S2vxih4kH18pd1+ZbMD++pYBz
	rJKoog4duQ3w1wA8AWlUU8OebebMcvxO3544shSxarMXdBMzvN/vpJs3k57Ou0UG49HdcYeG/Ja
	f9ERp3yleLzz09HIuCZsJ3hPPLkXISDDVbJwsQEgaT5OYJrpho/rkjQgdWhgudQkxjfaEfdivLQ
	jGMiNZXfYQJCwH1xFj/So0C9GISGVeR4WGOZ6lBW4L4CCIGd5w3Kzs5yOXwoz8o9CrMnwhFraIO
	JfuVV+7ivbtg33LKfKNEwAxEEetDtkEYDSBskZy5grvb24khw2LBaF7FCu+Mk0u27qMTtL99mNV
	Ib2ZVgwzF4cN6jfRyCjHkYTjHWy5xw8kTIn813zFLuKmEBZZ7y3CFXuauRJRXRfYrblm
X-Received: by 2002:a17:90a:d885:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-36a677062d7mr17000257a91.8.1779794779155;
        Tue, 26 May 2026 04:26:19 -0700 (PDT)
Received: from aegis ([138.84.66.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm12188091a91.0.2026.05.26.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:26:18 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v3 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
Date: Tue, 26 May 2026 19:24:04 +0800
Message-ID: <20260526112409.66325-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
the fallback.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
Changes in v3:
- new patch (binding was missing in v1/v2)

Dependencies:
https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/

 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..813d41769c0b 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -20,6 +20,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - lenovo,yoga-slim7x-ec
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
-- 
2.53.0

