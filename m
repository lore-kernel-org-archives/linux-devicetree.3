Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20ED3D905D
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011808; cv=none; b=NnpSDFb0aulz24/gQQYd5ak9uKx1wwW/he8A9vcbyT6REXYgud08bK81eP+utWwBpLm4SbauZJ7c1FY5xWLNg5OOMgX7MjBPdY7j9vF5YkdA/6a9/4UViKdDwe7iGAM/SbhDvSQRcwpCgi0wOjOzTpyx0bbu/BRgO0FPC20nJFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011808; c=relaxed/simple;
	bh=TRGEKvJ6Iqdx7ZQx5DnaJWhu5fsdHhi59qNdlDoEd18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gH5ZsbeqGhKoV+jrEOVKTLeitXhE+Tmect07tFc5nrTYYU/MMp6iUFCdBx0Mpyoscc8IMvWqKx8lgtEvFWVihDtjnKcd+D+XZbj+QcwkcCEDMwPctSkrbTkgxlwH3nCaaQGjUlUCsd+QCvUQDnTZzNSX6oYa+LuEvkoPMvDBwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=T1G44FKD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="T1G44FKD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so54327215e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011805; x=1778616605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuhOGeMWVCVXpPXG4XXMNEC+xjr0XhuplPJVkm91/Rk=;
        b=T1G44FKD3KMZVvQqANPMuEUAC7HZW4NLIUJosrfjSas6kH43a0ag4oTnFLh004l0jv
         2pJw2WNTm16sAk/Yag0nn9zLAzxag58kVENHsQfDIijSTtAgrqTQOV6qteFzQCM5ozLm
         grRQHyZY8msWJ4IfdbiWoqcKXMBXn299VeHhmL4nQ2cEsQaAtWNPq2k0hcdGPmq5W4kO
         B1nNj/vDH2nXvURQ2l2S8pdgkTnOEXOYYygCRP32VJv4Utx39+sTehtM6YE2pqJ6X1Ae
         4YyoWTP8F8lQPI3S6640xxwwWbaiJN60aiWwdEi1LDK+UuvvLytdUWUp62/HyZ5ro1fB
         9fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011805; x=1778616605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IuhOGeMWVCVXpPXG4XXMNEC+xjr0XhuplPJVkm91/Rk=;
        b=mGfmVy3LyS2a3SvM2VIjaYQGIAW8T0uhHWZNKbINQOaZ7uJ8Zmr8c/ddI7BfpfBMOv
         ve2d65v5PE4SgxC0oLVWgoXNgk6hLDZhgzo9g3TjLMHpdD2l92IJ7arrc9H028wXrBPn
         D2j7WRO5ZxcSu+qD6Pmj1E6bvsWMTbjKJYLgYM7RcsdtEXPhtfTuHqak0e0GRg+i3COz
         mIC2BwjuGU0u0ERk5bpKMDWJzidj7j3AgkQZsjnlLV9UHzwK1xI3RLXO7OLJ3NyUvjZh
         vRavNY0mH6OeUyOajoD8ko4APP9cv3XyOwPy4uU+Fi5M9Vj+H+rEQEMhgcQHGEXRlvZD
         03qQ==
X-Gm-Message-State: AOJu0YyeRq8w3iaAF4cmg8EeaHgUSZqABiq6u2001B3UoYXw83bj4wBl
	HBt2ZDX66JZQzWBG4KC1ShaHF59JvOwa67feTytitDiTLhR+2X/org0GcigiUXyp1vhKiJX1QeI
	d/8uvcMs=
X-Gm-Gg: AeBDiesJtPzuMouqdcmYHdDyO6jCskhIcN7vgWtUHKuXES1J3Tve5loz+BsT0jzsisv
	TsCGPaZQC2OkNK9srtGJewoz+eCcoAeNZp80WXR8nCetqCJY0ThXiScRRwJt/Rn5jspmO+Xioki
	ZlTDtoW+lROrkvaoRk8Ljps/AQz/UQRrGCVVx/ldULJ0C1zJiwsd4xHazAKnMotYhogJU9XarLn
	tOroF69Mf4JQwy76Xlt2FBkKxyZXfa1FSpVsZCoEU40NPVaZ1oUJuKrZk9XE/p4TIaDdU4NgLDn
	ueG2Xs74TTgfVXhYWMu4NDsoRRFQ/P9uoaZEVAvxPTyojLPOnmxU7a/RowfEpcaebe/YcQgJ9lE
	h5Bft87xEuDd4Q59n95m9WUHL/qdV3dPHyezj8tQgikru7/pD3GRk4ouNV14yBHM2JsrQv+ZZnQ
	I4MgJVrvto2GlmgcukmqTvwQUGI2rZz6azHGsK2sMFP0QVszx/IeoafoREyG2v+E1d5YT3lQPvV
	ybQVjQTNq5GYr/nxKESEPATXOwDjb160WmfdFG4mY3qfQ==
X-Received: by 2002:a05:600c:15d1:b0:48d:112c:f582 with SMTP id 5b1f17b1804b1-48e51e1e415mr7733565e9.11.1778011804953;
        Tue, 05 May 2026 13:10:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:04 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 05 May 2026 21:09:52 +0100
Subject: [PATCH v2 2/4] dt-bindings: qcom: Document IMDT QCS8550 SBC and
 SoM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-2-b4767d0dd421@imd-tec.com>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.
The IMDT QCS8550 SoM consists of a QCS8550, UFS and PMICs.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cc29b06621a9..97735d31f1cf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,13 @@ properties:
               - sony,pdx234
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - imdt,qcs8550-sbc
+          - const: imdt,qcs8550-som
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,qcs8550-aim300-aiot

-- 
2.43.0

