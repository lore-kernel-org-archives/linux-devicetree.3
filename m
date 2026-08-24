Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88F36BCDE
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583800; cv=none; b=UIiIc2qdfeuIiw+DMmoNPyT+3Dm7bsngKjP+6dhBijOp+zdxTWWQh21nKOBREoZW4C+g4SRMR414DxCfetE0z4UYW9/KdZOn7oAWhlwFhMBWQEP7JCHeucLyTt+magLHlN9X+Tu27RFW+0zhdNo9Rll5ybyVPG96riV2osiGN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583800; c=relaxed/simple;
	bh=KyU8fbc7e+jGln1gvgBbCQwRZ+9nqq3IhPL/wCHuXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8oZS+eMviVSc/5S1Zxgk+lwuwZSn90WnY5uVbC0g68qi42qbJp5iQq+AJRjXNiJjeQITJ36+UvpBVGfN6KBuHH5Zx7l3X+G6DHtyYle7k3sbtoWNfx16DJxugtP2KhalyhqAnPu1fYeq7z5/R5EqO8HyuuF3KBoLTCsOUhqae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E34Rp+wl; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E34Rp+wl"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3142791a91.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583796; x=1788188596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=E34Rp+wl0yz1IPG8cRmGYQ5QFdSCKhFZETCgIoT8ZRD8dvKXKrOXRM6kUm0KvrJh93
         8WTVJbbzrEW/tqqWeOxrGYBlx/rlBI9ez3Vsy44dfBMdUaoeuByTzAqSgToIsvjUvN8B
         2Pp4A39Gk4M5AlLi3Lj1MPhZOwdrsILoNRkWBuIOPxvrMGmqHCou7YAQ+GUnBfFAnkcT
         AywKo2tBDbUNcJouBD9b3jHVjAFSdmXLt/c2/pkAyCyNY8oQx41SB6glK360uE6oowHf
         i2gRTSxZ2fDKUe0UcWuOn0dmDfHXE/CxYDXS8svEYodY2npO2ys6WDptZsFrgsyr3odL
         SoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583796; x=1788188596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=Sgv3bedVsGXjkLfTwZ2Y83a3krBarbtgGY5fA7xE8XruVZYzamYdAclcoIZJdQWJUJ
         BdED2THNq+o0uLKBQz/wu6f1TbNCy8dxG1zEa5/3YqorZEV5yt2sNXm0ReY7TRoGZB/A
         TPj6MgW+VPjKAlI8L5rzhVy/byHJfhN/dPGc6rWIAzwmiqq3NQczA3DwJhmTZ2HpSZf/
         BS6OBV4D3JAdlCwxMUM/kKyIUj+a2Z5wNNMa4Ln2VDidKMod+VNLE5AMwSKitWIZEV3k
         WO+E3V1L+lzz4XJ5mjv+9HXWZf78VgGDXa/2jQaQTA7DJYSSUjmhgx+aoItUGApoqIiD
         6+Hw==
X-Forwarded-Encrypted: i=1; AHgh+Rr83PcTH9UEWP4gk44QeSjzARcqRNNK3xy+Whnso3zOjEHBa+dec57bBB63nBhPMtmehsii/edOdDdg@vger.kernel.org
X-Gm-Message-State: AFuF++ml8NdUtWL3N+VyEXW7tFqJMmEVsmQfojUsO8jYk78J0kBf7yvt
	LSZz9aGPdTzRQn2m8SIOGo1kLUIREYbk979vfBUr3UM2ipxcVLfhAzD8
X-Gm-Gg: AR+sD11iBJp/YqUCVdLfxn+NQZ18oxe0yiVmuvSunAxN4CMz2FdDMxegxEsp57RuPXY
	BhJoZ0CI+M4me1xNltrjbCRI2eD9vuqMgwB7/Y3hcynWAjrxnAs2cR7AWWSEqNHVUfc8+OQ+brp
	W4CnKJ3s6lZGpLingWQMuyVIC6Z9B0tqHTWBKOLT+dCWiiuEuhZr+dzjT5iy45TIh1jCq0ln6bb
	f9VZi4XPVk7SDMUNEE36VSJIsJKopA6s1w/QZItxFuQaIA9EcmyZz+hopAWq0Imen8CVWe0gSPb
	7eZxlFUQ+4dRdFxgWZREtwKqYprcHNIIptuolPbxK202wc9pS6s0jeNayuDEX+CzJWEHKYOolIE
	DHilJniHTJuGWAb6PDeWyU79RavYkeZyAz3VhsD7VoG1lwguR0ZRYH2M15sHXHK7VwDTRLoCIJf
	UMytQs1Rg9fFxeR1XOmqjMC9PFaE4FTItlQNXFfqm0YpIC2H7S36cUBqpIX43ByTytUf7G6EqWC
	4D90/CmQHDZ
X-Received: by 2002:a17:90b:5646:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-395c33367ebmr51192671a91.1.1787583795944;
        Mon, 24 Aug 2026 08:03:15 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:14 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Mon, 24 Aug 2026 15:01:48 +0000
Message-ID: <20260824150156.1310-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

