Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA74A091D
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050232; cv=none; b=VSpw5sG5MCn6VBtfUMnuEGsshh4zyqSQ27az6bMWTaiUhaPOe46jC/FMFUpEXnpcZ9UB8N7/TSDtGhpRFokbkDWWRYwDVH6uW1s6Z2r9By0WcGBpfLuIvYjTPJmRGY95xvSs8AiwhuBUwZOPqVspah5Vnq6aQaoqBh0zQ9R/KOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050232; c=relaxed/simple;
	bh=tWWkXmcLrU015FJEOBdZfA9EEywm+QdMZMe5B7htL20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdifyYK8wS+kRtJGGAMbjX+V/s0Rxu2IZXo7KBfoz1ycFM+JLaCUSoksD6c5psWRAg/5qtzSHQjtuF3bEb7WFjkWVFRmIzYPBTD9Vh85oqzfDrHxnyYtXDCr7PbHvj3GrkQzlWnlCww8odkJVMabHnHiNxvmaHvoVyCe1on+p3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blCTcA+b; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blCTcA+b"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9144e8021d3so14156816d6.3
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050229; x=1791655029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DmBg09oZeDofnXQzFRxcPDaeMRkTYx6eshQQ7dpKQA=;
        b=blCTcA+bfwtE6zYnjTnu1RiP/GjLr5hsYSjRmavCT/Ijp920mVKRPC7vC3akvUhuiI
         +stTe44ptiwlgoBc4BxOfy1kS/BqRCbqAmNb0KX525Pa9S6y6hBMDS7NzW4XUQAkjISe
         J9MsOBMTU24CNr5ELpCGkb9XvfiLF94Vmo7cUoBrxzORjfcLgJWYx7CT2XEGDurUYB2R
         xrdSzWbd+VVUeBaBO8Bxg/grGGMLPE+CY75UuhO791cakmeNv+fBZN+00laKi7+zjhDQ
         AU6WnUy0IeOoSiCqwmbnUN/vCGsinsinBD9ARH4XUqTt+Bc8gjg0mI8CR2Am2YgiOHTp
         P/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050229; x=1791655029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DmBg09oZeDofnXQzFRxcPDaeMRkTYx6eshQQ7dpKQA=;
        b=F4PUMP5pAssUEBY9ZGy6mM/J36/+XsaC+rx+6chhei2DLpY8f6+R2bL+QFtfuoLyCN
         eEnVbn7BLXjYC49dLelHJ5+MsStPvlwg34bTgoaxeOcbyeAdBii3e1PJKJJpL5l0OTk4
         +HjKQnMe12ooOfFN4gdP/6lLKDFx+EuH8neu0EDdUgKDZouksFGZ9gSlYmRCao9FXjxG
         IKPeg7+wbp0AA3e+QhRwehCWHR000Ji+hJ/gAI0zo0S79RbZvY1H5Gbw/u21uMmNLz/+
         dV9YOMlsuAp19iwmA590UnWk+GLn7+WgnwJNUS9ec51TIuKUHV8zMS6Yd63XLo0Md029
         5u4g==
X-Forwarded-Encrypted: i=1; AKwUvBzTrNTy+p+0b7sq1iAAkTzg3YT0FnvpyYdIAMB1TI8WFL779cGQfEw0n/kxuhKU/03D0ubuBPufJxgX@vger.kernel.org
X-Gm-Message-State: AFuF++mFoEz3dFWz6WjL1mpcjk1SQqi6l1Z1jBYI6rum95bp8GItY3LN
	uF+8VDDxlZHALMnbHIeO3WJ1g/uvOTi5NtECWlG1wK99MZ9WaU+2EEGh
X-Gm-Gg: AYBFou3UOf0xsiZYkoQW0TURDVhh7arPrOb0SU5vPxa0alqn9xT9jMPzsbQJicxVQfT
	HjMqy5oo6BG5HPE6pU9+bF11h0SRyP1FBHhc2SBL4aNefv82ylG6ZCL5uBJqPEWE/LmqfchjBMB
	sLFms1M4nBvAwjLgJ25yYo79zixT7V3iXnL/24Glujh7rP+mpYs5HQ3UJD3q6z1I/cgXb2lpA89
	ewM2Kvoa8furrqKjTpXOMbPkmJRU6IPv0BQa3zkvhxnh1Xp/2QTMAUXl7YscNreLY9TehP0uaYA
	kgr9xGWtxnrN7ch9cL9GfakLiekd/D0Qn20IofdasnwGlcJBPUexRIGkE3UiEujYyC0KIdq5RU6
	F7iOEDa+6Hf9H6OuIJ8zW54f3aXQMGQ51gS1JCB6cyh0902bqI6/y/mS4vmB1BPrQgmtyRsD7Ta
	gWgcp1anKzAqvvLeK+/tXCEmTbHoXYrCNC9eDM1ZWHE/Az4FcQ8EaRGPefZXszwzTKqUonDUg5J
	Q==
X-Received: by 2002:a05:6214:1c49:b0:914:525b:8ff8 with SMTP id 6a1803df08f44-9195d15a773mr57022796d6.25.1791050229577;
        Sat, 03 Oct 2026 10:57:09 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b690f3sm48350106d6.24.2026.10.03.10.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:09 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 04/11] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Sat,  3 Oct 2026 13:56:52 -0400
Message-ID: <20261003175659.23536-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDM670 ADSP is like the SDM845 ADSP. Add the compatible for the
Audio DSP on SDM670, with the fallback as SDM845.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..6cf1f11efe04 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -15,19 +15,26 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,msm8226-adsp-pil
-      - qcom,msm8953-adsp-pil
-      - qcom,msm8974-adsp-pil
-      - qcom,msm8996-adsp-pil
-      - qcom,msm8996-slpi-pil
-      - qcom,msm8998-adsp-pas
-      - qcom,msm8998-slpi-pas
-      - qcom,sdm660-adsp-pas
-      - qcom,sdm660-cdsp-pas
-      - qcom,sdm845-adsp-pas
-      - qcom,sdm845-cdsp-pas
-      - qcom,sdm845-slpi-pas
+    oneOf:
+      - enum:
+          - qcom,msm8226-adsp-pil
+          - qcom,msm8953-adsp-pil
+          - qcom,msm8974-adsp-pil
+          - qcom,msm8996-adsp-pil
+          - qcom,msm8996-slpi-pil
+          - qcom,msm8998-adsp-pas
+          - qcom,msm8998-slpi-pas
+          - qcom,sdm660-adsp-pas
+          - qcom,sdm660-cdsp-pas
+          - qcom,sdm670-adsp-pas
+          - qcom,sdm845-adsp-pas
+          - qcom,sdm845-cdsp-pas
+          - qcom,sdm845-slpi-pas
+
+      - items:
+          - enum:
+              - qcom,sdm670-adsp-pas
+          - const: qcom,sdm845-adsp-pas
 
   reg:
     maxItems: 1
-- 
2.56.0

