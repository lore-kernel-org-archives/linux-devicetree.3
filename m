Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018332;
	b=5kA75ffccbBPsQgty1aOsCdvl4o5coWlGO3UF57C55avYUFVkdQNVz9S6tVRhwG6GUDI
	 cOMCYY+413ydqGLDUogC2gBOkCVOFRYap6nv6bJqAsQJe4jZLRa238rP5fy7qMi3a41Nd
	 PJZvoYmAaZvOqxiozTKEyCUJj4yB8DhKgIM7IhOK9zzbEvXqaiaihMdngX6UtHADKbdca
	 ivmXSMDZ/1P71OCfuLEjnaPK2vESnIcvLLBH88NWI/p5fLNinqhlIHodQR9wA2wVbU544
	 1Ki/uezt2s466BTNbh82/rPn3u76x80dDYQe2N/PQnIDmT9Mr1dx/CEr+35gLYSMGsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
	b=TBSjmHGLBzIA8MKMXN3JsWNG5Q0rLrOPDuUY5hcQsc4ohv2FHjqLxJVg3koNry+5/gfT
	 PaSOvrOL4e20PCCS6LeqgYS4KxUjfuGG6+9Bz2XdsRjVSTEMboP07YD9Qri0T9xoQ1DDr
	 DYmyDQzqwnPS/9hU+NouxZ9zBLfq5RAdwlcra/DRCabeNYPW/C0Al2b5Aii4BIPSIGq6O
	 SlJ3GsUrCS7E7C2iLZInxoLvrJ+BDSxwiNcTwBG1HJwYZnzo4zPKrac/IUL5COqf0W8oR
	 55IqDukiyyL1HuvLk/7unuh0HLNVWKrqyyaVjwzurResfXLDBKWazmq6KPPuIrn0rSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc4WZjrX;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EC1606A32E
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80EC1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc4WZjrX
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-990835cec4bso717804241.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018330; x=1794623130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
        b=Oc4WZjrXevsZ4OTMfIbbyREOaA5y75WYe0/yqmZCTkQey/yR7vtBVeaPl8GxR1UyIi
         iJpHqhmI5aEStHLhYKg1qdE+XYRcR9gCBlx8ZK12Q21r/xhqMwNPUkHVas8ykMJXgA4p
         T88e7YXb1lKhV35J7diCLhvOic5PzFVmXBeB2jwie02oSr429h7R6Uq6nZTG6kcYUTRY
         zjSl/cq41vFYP+VNnZrzgdaF4neWIOFOJAV2PlEtp4wIfvhw7snMOAk55z6PIcwa2siO
         QI9aRrgg4svcH/B5udGBftoTLj6s9lAJeh5CHpXdmxWQqtnk91M9VMpWN6I6PoSd82Rr
         R4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018330; x=1794623130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
        b=iidZIrBJSn44Lbo+UBHiSWOY16QR+otg/R4e7hIHzI2CrpnhjR6Bcqn1vDYpjnRDz0
         BKfLfB0kCU618enZkhbP0E2PKxzVgGfnUAMIg/3jycqgAtK04gUqVMOKhk0AhB82202I
         qGYtPSlmrMwi/M0WPbeLSs6Uxz1BM0f78JWiTE5nbyfdVMtjSbZVW51Ooi6zKd1dxyr6
         wWltT9okTpGP6ecCtGai0etaAXTaBtCEy4/dGOs45Iji+xTDtokejQWjUVftXz1Bw7gq
         uP9VvG2/ePCMGTM+oMQiylo3ws3TrHPphGdshc3/Q3Jl58KzLBYnPwKnHuFmIOuhYd04
         QtYw==
X-Forwarded-Encrypted: i=1; AL+hErFrT3tFPRP+5ewyxDt1DG7rSD38CgzQyMWzgXcXmoS0OVyvpLkoo+ONJA/sGyqzp0b81KfgOc+N0fUR@vger.kernel.org
X-Gm-Message-State: APuU4Z/X608GwZQVXjvLWF3oJ+E0hbYGHLawLTZ/T+kurR+y4tRl/O8x
	7lLb6DcPorjwMhJ8T2KIsfvfd3E7t+DWr4jQ340YunaSrYpxqW7x2cLn
X-Gm-Gg: AYBFou0xq5l8q+bs54YPYmxtXrBItf/Xiyq6CioxosUxcPdYiz7hXPIWSGs6E+p6xc7
	cMOIzBWZ3DvqOA5DdNsUMwVeGy5IjUxbtaIzqERinIC8fECEeJxmXTrBEIAmgtD4k1pFV9vopE8
	zowJGQn0m8EFdV5B9GU8mhDuNO7jmMILLcbrt3U2XlWpugHdpyz3nWl2MwIB25tk1Q51rfaSADt
	WLSMaHXagsqOHp/ZeyiQqs5/5Lnlx7Hn2oTnIxZ9wx2dIKDWcdLVJi6eMWjJ6fAtapcL+nlHEgq
	3/1R65W1qlgJWlDQn3eqgSJUe0ptZZLdcFphIPS2kUQ9kJZc662UR/ruz43awtBHUzk+a/hgAfy
	afmC6kRou5JXNSKiKls/lGXEBgVUpHNV9lSmLwl1j2ZVlDVD9DWevXEPmAhLedpq8cVHaRVMGxK
	WsKsnEdwlLlRhRjXHFT0Pz1RiBsg+IX0bOsH8iq2JYL+oRanH8i57cO4/YkF0lIBi3LPwU8MWJk
	phZY0dwUzIGP+fzQqsPSq81WP5OBvWZB1h/pIFV5gskS6zAqv87uh27HL1p35bIEnra1IStWorB
	MPDoGDupP8iae4c06QGLSGLcTvDj
X-Received: by 2002:a05:6102:e0a:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d2a153ee73mr2430046137.11.1794018330516;
        Fri, 06 Nov 2026 18:25:30 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a89412besm2642472137.3.2026.11.06.18.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:29 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/9] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Fri,  6 Nov 2026 21:24:46 -0500
Message-ID: <20261107022453.159341-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index e94c4fd34177..6a817a1cd395 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.56.0

