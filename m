Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3A371D1E
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224524; cv=none; b=A4e1Py8+/W0Dchzz3O+MjTUY+87fsvyA35lbJQlfMwFtWhHubMcqIXFxx+G40ZHZEbgrhBQCUlTxZla0xhQu/NsJ+c8YjCjgPDI2HHc0OtmuOiHfV643Z7sAqWktLf+JMnhd3SivnJwKMezzU4VxUYtlJJqhAUguNgaJxYBLz28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224524; c=relaxed/simple;
	bh=pHexCrMEYsMQQy8zIs+sRrHJ1/ttZ3VMNeWvno6IS14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BNGN+3Xh1FQvdM7K7CtmdpFDtgFxtHrWSP6Du8fLA/6i3RWrXSkmK3/e/MBdvYNGTtlfuC+TmB7WEKRYE4v/94uItVEOH5rvtIpwvd80t9oIT5tCBMRT/XrFId3mxptyDtGOUrOzm8JxvuxqaEJ2TMe3ZGfPnYX+q7smn8SEzT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lhspZ84U; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lhspZ84U"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b982b0889d8so260601166b.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224515; x=1775829315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOCuD1EIBix+K2H4tXL5BYaPaJquyNo2g3/MFSpuIHI=;
        b=lhspZ84UwlEkwAdlqjW5n7AVdmK6VsAiJ46y93iH/lNolffn7OPkbasRDhuPcWmmuX
         BgOMcQcCeBibMYg/ffAMRc998pjmsYuwBu5oPVaP4pdWaJlbXPeIn4Fotyva5x8S2N2Z
         GPtxOVEb9oQa3XB23ngXTYBqUTWnXFSj9FexaYvclASjAlf0EvxQJ7yQWCPqi6hryNav
         fqsnytSrW3F19wTB1X38uE0aQCgxyEaeb1ztiAE57Nir4f9+L/glB++C83mbIgk0+dZX
         w019zZjzxC0qeMU0dlidIWaQwouTbryA+R77eZZRYsUxVsfoWcKCRTvxwFzP/pP5SD10
         nSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224515; x=1775829315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOCuD1EIBix+K2H4tXL5BYaPaJquyNo2g3/MFSpuIHI=;
        b=khNnJcqbHLYQsf4FA6Pz1pHYep9u45b0qwrUA+OcotpbF54o1Ft+GjgDY95JsbfjWy
         9udhWq3LaQ8Sggp1ld/rrifmPs9QrpdOMaivILihyfwhAJxq3SPFYbcnJdrDY+tHl0HQ
         1Jop4/ydLcveNU61TO/BiTQlJQVlWw+HshJnPBpSQvgIu5E8HEbTjUuxKlCsCNu3D/6e
         7q0OheJSh533czDSYR7qwDDWB9o5UQaqdnKAx9E1yaB9mEvQlKqdLE3cdrCbFswJeMWp
         iqCqLrkWz3Z3ACrbS3zBanfc+Wc9xIO16PmQrrCyL6FJa8Ba+GP0ELpMQO/tctH9BnBk
         ZLbg==
X-Forwarded-Encrypted: i=1; AJvYcCVZW1RiVpVhw5ZGacnLO5aV0snECfDtk0w6lFSrpcFKoV+xZW9CGb6Rtf2Ir+bAxi+jG9yIZYYSD2Ue@vger.kernel.org
X-Gm-Message-State: AOJu0Yw235R/+b02EEmB5zjwMGVSCxrujAqVstAVvdalcKhV0c9m4R2p
	Tu36umc6483XyVg1JeeiRI5heXSq9YK8pekNuTXfmKAw6RGRZce2G+PNCBgCEU2b/h8=
X-Gm-Gg: AeBDieuWcgVV5s9isMhMsb/8FPO355E18ZZcQs5lfaW2AvuRMk1z7VHV1Bi6WA3hsWo
	7vsoqfX4u4pdKhOxA8C009t6+t+7zNRt8WukyMYb2UqX8cWL2FtSOOohrn6rPCD71IVBbqHHtDf
	aW75z8NXHM8rStLWl3Yfu9FonWh5z3vzdhHPdH+xRnJu4IlkW0pLqSRMjxXlxWJa6PCxT0r57Km
	s0FmMQaRzetcDROKDOJJ8vCyj8EYGSC3CQWvhImCq6e8RM19K/LX+EJ0BHG4XvSf51lDC4kAWgO
	FYecCPko9Hhg4qBQTRkoXNcOO+qxjo3RuyJ7PM46xHL/Luot0S/fYjYJbojQ4DOnRCDZnvfePvw
	+Wqbi5MedSvzgsKA98SCMtevOjy/RyKLU86HWFnYC3CwxHbOtma0ldsyqsdqxi00puiml1jw9pf
	WYB0gUAgcXWpErrPttrc3rZQuj7rtwmS5l3dpNSWqUJjHFI+ZvU/4xw+DjQoAUoBUO4ggpLwRS3
	TI6TevhbKKfMDbNnFq+w0u/F0avdDK/+1w5rg==
X-Received: by 2002:a17:906:5189:10b0:b9b:1ea2:97d3 with SMTP id a640c23a62f3a-b9c67924de3mr103637866b.35.1775224515233;
        Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:48 +0200
Subject: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1081;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pHexCrMEYsMQQy8zIs+sRrHJ1/ttZ3VMNeWvno6IS14=;
 b=XCK+78nLfEjrwFntw0oaIZ6QCMaMqe0pdyMGnaJ0nfiCKkScqZ/j56Z2tA7Pr/+6ADMeTVzTg
 pRaItd1h5BQBiCmYvoHhG6jioNRifeUAqMjZopZPnAysEnsr3FFCL+h
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the WCN6755 Bluetooth using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
index 8606a45ac9b9..79522409d709 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
@@ -12,8 +12,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,wcn6750-bt
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-bt
+          - const: qcom,wcn6750-bt
+
+      - enum:
+          - qcom,wcn6750-bt
 
   enable-gpios:
     maxItems: 1

-- 
2.53.0

