Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AEC37DE85
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224527; cv=none; b=i7qC8HCFoS+1+/fDTxWcNUtwrEL1Rul6NoZj8VgczeY8G4YLWq2GqW+eSCvTgcXF16bbeHCUNSxGUmCAN6cJHUJlu4EeaI5q38inVF+V1b8GFkercX1kYYKqLHLeDkObZ99ichEHjiKG0ephXTlxSJSZoQ9grmvIc+AfwkQnRic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224527; c=relaxed/simple;
	bh=bX0RSkEhHMY0CQeWiiphb/xjS1x++AeW72AXUrJMhfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCz2j0M113Z4agvAKs8Mzd6OAVZj1vVEva3k+oRVP8nW8/BVCCWS7oA88MM/NGBXkGRsGKH0ZvER3IkRpc0itXZidPUuRnpMbbD2ZUpMa287D5PrO9FxAOuFS+LNYDQ52H0IibvM0E2hPC76Bbu84Zqz85TZH9uBtVIyViOKY5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eMcDUq4k; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eMcDUq4k"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b93698bb57aso386397366b.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224519; x=1775829319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=eMcDUq4kDbXtJoLjYpvN4DIgSbal4SfAiQ0Bxs0F6N25Fnb15cXqGtpmsKKdnHVpq8
         CqLdZzyAlFZF0Pg6taXCioUz7T70PZlIyUcFqndMcZvtkhWtJdV7ifrGRv4iQoEkzWt+
         LutD/N5YlETUMeRA+y1H5VXvk9QNwV6ekKOL/TBPSmBoBbOkbWWsjWr20FJbFexyVJA4
         6z7DNHy3x4lAfjn+IjV8t5AFlAvu9V17eucFr2iaXX9QwJGtVsziti/srrzqpDfl2WgG
         XPoae8DCwCp2WfzEYiwRVA7m98eNXSbdZ/wcKK0Qz2SJyVvWaVboN2jj8VpK3NgT+PSs
         jo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224519; x=1775829319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=IbfoToMj1mzxBLQ7j2SaeCdQhGuhre3xnRtoAygZma22Pf38K0yMKC9Y7nJCpvSez9
         eIoIe0NUNQIX+7dm6+FQ9cd1i5kF3zX6o6meCFHR/8nDhjqnl8/EFUmSxTkBYc33rOJM
         /Nxtkf8tYpdl7JPkQXJWqhXtLHhnSX2MpwM7aEeXtlQqX8sOUDEcmATxhtWoejOk/e0D
         A0HYnAg5yww9YnyW5UIIiALW58MAl1D7GLu/IZbmMc51qcXgrrOahC06X0jrNvW07OF7
         9p9paM3Buos2/OrCEnawuX8RPKFUiXteS1aqQd9rxiPc0zW+9X1D2L2Hsioo23i1KOM3
         2Ktw==
X-Forwarded-Encrypted: i=1; AJvYcCXreDtXy286xui4QaIARASE+Bf5Vj1SK0OAXK9A49TJWYqgVUKUNcIbX2lptJIdO80NrNcN1HbjVTjd@vger.kernel.org
X-Gm-Message-State: AOJu0YyBwyFC4hwg9KoWrFn6kM79VoXMTTjeya2HIy/okk6UqBYZYllA
	igtkRUvtKZ8BO9vK2DxZTU4j5UvaVIAhs3Kg4IY4WGNdM2APY4GZSJDH1iv1vdSlok0=
X-Gm-Gg: AeBDievSppzILThH7pxpOcS+unf0WcM24YmXYCS39lfzTigiM9cItQS0qpb/JvixSQV
	KnW2Xp9oSUevSanO7EBt6n0oj/OKEDGOHiRRoON74BV8u+oCGi4jljRAXQILPcETf5xPJdioj68
	V8G0cxQl62iS+MKI30Q+XUlTB0X8eV072GCXGzm2EYcr9RHnkoiss33dtGFqrkQPecidkvRLgqV
	ueAP0bXSAL6wjyTk8R4HHoSCEDx8Lp6iTLewPOdY9vbQ+54rqsXPGupoAv1BMs2zrREKu1svAx5
	oKhJxCnBYVliV/xQ9HSXCR/kNFwQRVEMFaFuCuHnq7zsd2+Yvebst4J3lNY5EbLpTu0GZMaGlmf
	sTPbErEvvIeVQbRYly5Ll6v6mplXzFy/I/UmjL0qvezQpjSZHHCzwpVp5AZFbtGCyzdwLwARgXP
	BohIpQxpcjVmDgn4bMHBRuZlp6K8wTXRjuYMF+A0LsSDMp8gkQDfOn/k6g9VFXL8sw3P342MNd5
	TU/cup7izRZtme3BA0+qCsINOvERds+bllheQ==
X-Received: by 2002:a17:906:6a02:b0:b9c:cb1:a61b with SMTP id a640c23a62f3a-b9c658742acmr142510866b.16.1775224516202;
        Fri, 03 Apr 2026 06:55:16 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:49 +0200
Subject: [PATCH v2 3/7] dt-bindings: net: wireless: ath11k: Document
 WCN6755 WiFi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1239;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bX0RSkEhHMY0CQeWiiphb/xjS1x++AeW72AXUrJMhfA=;
 b=DTJTtJ7BKJd8qPXVe3nd0JrxaYiQE2N8bwiN41dxZ5jihuyHGd6fmesGzuo/2w99jisvtHofF
 h8Mx18K34cAAflNUNQSKgyj8B17L/9Yc4dJVyM76qpuovDBjx8PeKjI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the WCN6755 WiFi using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 0cc1dbf2beef..94f8f8551756 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -16,11 +16,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq8074-wifi
-      - qcom,ipq6018-wifi
-      - qcom,wcn6750-wifi
-      - qcom,ipq5018-wifi
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-wifi
+          - const: qcom,wcn6750-wifi
+
+      - enum:
+          - qcom,ipq8074-wifi
+          - qcom,ipq6018-wifi
+          - qcom,wcn6750-wifi
+          - qcom,ipq5018-wifi
 
   reg:
     maxItems: 1

-- 
2.53.0

