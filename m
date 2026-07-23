Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B543B6346
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830706; cv=none; b=qvNsUUZRXBsIEDQW1RrkUOiXawXC7a1kcVpfQSu5jGLxiWshNi0eXtGrQJy6lJ96i+YwjgdEIS6TAxNe8y+IUKderrXyJlKEbFAxBw05u98XShn4M61d4KgQFkivg/EV8qkop0wrVOlmffFx6iZGxVFeG2sDK64flIfCe0cjAEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830706; c=relaxed/simple;
	bh=YNnjlmdOOeK9GU+75gVS9bzIZJJubhpoaDjK03p+XYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aT6L4qpKpzjx0jhk35IlZGaPta/X4hQ0e+PYwJySvN0++AkmRlcOC/A7e914iSFtTJ3d75TJ689PYXjJg460aF3oRlmq47YdPAQG5Tjjjrakv+/Wd25hpFw35GOayvZt9ySWAeaSq+SV1ptchkk2gFpBMEbDAV5zfA79yzMBnMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=cgjpFXUQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="cgjpFXUQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso7213145e9.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1784830698; x=1785435498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fi3P82Ix1Tb8eWi6q5vyGVMfBwFnpb0LNapIFC8mek4=;
        b=cgjpFXUQWrDixieFdO3OZIHJTQe9gRQLwIh942wQaju3dqhgOJ19o1kjKAeXB2LWTn
         CF61aEZ4k2cpFVU5rJxU6BfxMPTlKWIg1vbKtY+Q0/4E/9RjDaNqZeKWEoqjGiD+1M2g
         Rbdp6cFfHyFMN1lY7JmyRS+qAD+fSrTmMWLRcSOl/3Sz5d1BvNaHLzvT14T6mXhlbcv7
         ddRubHcwPhI7gCEJv+Cff36wAuUiOVi4ZD+6ItlMRGSKVb+YXxRyV+IGSjUzqhr1IzjO
         UPaJ7/afdwtxmiRHRRypygN91e9KSV9h9F2JAVtP4I3+jlqPRqhmNgai0FWvkx9M16D0
         Z1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830698; x=1785435498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fi3P82Ix1Tb8eWi6q5vyGVMfBwFnpb0LNapIFC8mek4=;
        b=UZ9eFu17R9sY41K7JKNg/af1Yhtk5lnA29HXjhraBDN87rLlvSSGbifkck7iWKGYhy
         ZANRXaqYkByQepJSCVKQhlqc+x9j0rSX4kzohaI037IM5ppAUHwiTwuTL8oCyvqIn6de
         1ARQorsPT1dHTccS4TfacLLseO/Z6AKVEoJ8JMA6TdwMuK3ntF+yyernJ6fSXMDeGf0w
         QTd3heluPJTxcbqyfWzLNQnYFNy5wMmNc3CqSlTsPRDZaI3phTWV7iRA00x2SP25Sh/W
         nDj2M/pjR8wEwScIFAo9soHHMuFp5s5mZ70nf/ociSw5vL/QM/4JaXOGXKVU2b7XdX1w
         kfrg==
X-Gm-Message-State: AOJu0YwhK/BxemEgip5Bo2V5pS12dOiZqAZoopCQQoOf0snVOpKacsKb
	wEla4VNquYSWGKHXkDNFNodo4/XWIZIFw1jZug9oPXN3NTrnoMS0bhMLIbXs0n9oRq8=
X-Gm-Gg: AR+sD10yYOwb/ZQXmk/Ezi32PVQvY7250yvSOFsv9SY26nyb+OZxHKj/vUnu4GmOG6o
	P7pwYKMgTDo2w9iWFIVZdqhiA5P2FqZ1634Vdl+vKo8z5LmgrbQXMJv3tVI4QVEWiPyLEc++JuF
	/yXELR2yHcb19UtyvtT+hKesQsmanX63Va0xPbSmlTqlpo/qgt9/fTDG5530mSqgmzaOqI8DK06
	OKJnSM94FiZDyWubGIrHbPIb2y3MROqVCnQbbyYgajSUgjKA3LWhoOJmuD4WCdgS2dBUOEN+z8s
	ixc3M2Dqja0/eKeFA0M9lPY+YroX2shExzH9stvCPCmVheyCxmaKiTQquqluqQbABnsG5gJQ3bh
	MkDmEYsj3Qbq8KpzI07MuAQgNltdEc506MGTTNAZ/krzN4oNNjtJcASOMF2jLX2YHg1q1GIvYeR
	+niXux3idGNz402hxXzdiAbSLTI2ROpKsjJtPeaIrbAWk4rsrrKlrIMeOPoliFaIJhSIv4dYRN3
	K7R2gWPnZXckQSSgAXfcU5do0GI8KERBnVzASms8nb3Ztk7s3G8zCgaIlwc0au2
X-Received: by 2002:a05:600c:1d29:b0:495:699:84ca with SMTP id 5b1f17b1804b1-49573d142bamr48720575e9.28.1784830698142;
        Thu, 23 Jul 2026 11:18:18 -0700 (PDT)
Received: from [127.0.1.1] (host86-157-235-39.range86-157.btcentralplus.com. [86.157.235.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af914a9sm10799055e9.15.2026.07.23.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:18:17 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Jul 2026 19:18:08 +0100
Subject: [PATCH v5 2/4] dt-bindings: arm: qcom: Document IMDT QCS8550
 SBC/SoM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imdt-qcs8550-sbc-rfc-v5-2-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f8c37096df46..8d01cfbef8f6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1137,6 +1137,13 @@ properties:
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

