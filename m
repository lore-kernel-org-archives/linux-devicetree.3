Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6AE47885D
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571267; cv=none; b=Npf5PyHEPENWyTm7pS536Qc5P5tJnKoeJGFDlDMMFXH7Yc/qUkTvpC/lrsAuIPRLJKMJtahR9HKrrK05eLcYiyv0bA7uTDRUfHBRgJj/z7NjXSMxIvsjjZ1pvgnuWN8La7cVfeS/ogD80Tt+Yoii8L7bVFnS5DEDvS1yu3NSvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571267; c=relaxed/simple;
	bh=yiaD1q3Eo/UrebdhQBErSSmmy2q8AzQyw5B4P/F0IGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmjnaJDyyYo1P0ytAi8FS5tLg8mHUgDBNc3pzEe5taffm1nyR+CA8iQ1bIUwiz8U2dBvnpcPeErmpacoN0o/a20TtRdiJtX6CZAI+ZZntXSfgVTFaPOTUYJ6tpdX9B82AKaVU7gnaU48PkbqG+wzOCst+hoPqE0F4YfouS/iakc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=QSiH3k9q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="QSiH3k9q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so12396615e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777571264; x=1778176064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3/NzWJWCkR/MPt1qoN4RNWPWVChQ9AWvCEeS02wAAU=;
        b=QSiH3k9qR2JbS39ua2PmFuKK78JfMQui2vKp3Dgl3540GaT2VMIRf2bKG10AfliWLX
         U07UwOdOpxfRvgKpI4mMjFFsnDT3mNxVRaucDZDZghX9Jy+IdB1zIR4CamICAzr6RPbi
         5PmWKNVXQ+rHzLv7O3fA+Eg9fX2M1S63NKJtdlIcKi6tYAm2onaHf9Ct+CYFBpofPyd6
         hE0foCejIGM8RS2sKN277bOgluBACtMtJ7rcNZDaOpPqdTgU4YgaVox0mi2kOlxq39Dq
         h4bZswP1bSeXGxYUbJ1tVjFk1znyugRaCUxj7ZmyCDqpaaXxkf2BUOuQS20fJfHv6dc2
         6W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571264; x=1778176064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3/NzWJWCkR/MPt1qoN4RNWPWVChQ9AWvCEeS02wAAU=;
        b=EE2GOxmhOKXZLB5HxAeQwSL2rZT2xJ5TFmUf62SqL3gJxnWuXCx+kH5SF1YmvhXj1c
         Thd13oN21aQPqhp6Zwyk0Iwwgszji8ixVW6QTNA+tPdocUPUQPCrJX0lVEdX5blSbvfF
         t7DGzX/9fcK/ZOkEEL9qMegqpLDsyIQqRobA9Pc7Ux4uoB7ixqmoLSTinb0TtK0n+Cb3
         8BpmIZ+BQABX5ck8N02YKdqlHe/f9lo/aC5/tyzYAnz8Lq1Cn0qCFkeOJAHlnxOPmR2J
         zPCquEe90OVORI1IGNHcOdbbf3nRzEVqcPtUOkCHEGWxSwtHlvuT9ytAzL3rvvrF/ySK
         LXBw==
X-Gm-Message-State: AOJu0YxNvU2CyuOB8BiglLSjQ5DGIJ/oTOZqa31j4uuPC+TVeSlLfcVC
	fDMe5aA1N8ArBHYLKh8zwQE2STMy/MaWQ+DcX2sxwdRbjo7JZRnrVHXewyZusEfkdMFXRC/fk+M
	YtVD9tBU=
X-Gm-Gg: AeBDieueFo5lQIovD6CgrQqxg8VfxXE+NDHDyzH4aWMF7N2daIKe+E/ULuf5XI1rFcM
	wiGfZ57X/tjj7wp1wb5BHnbS91zz7EvHGEWdi5cIdZ4O1gKpIAfGU0F8G4ZLxQMP8AnP/j2l8kP
	HZTxmPncX7A6r5zdGWmRSsxNFFK6VtTKXZHiLRI3nqMLbLA3Eew6I1IwfJYb2lZnAKora5aR3EI
	aNgd63EOjLRTN8qU5g+QrFzO2h5/qg9/mQLC3ObdIsGBdMsPj5UsHqdrDFJ+jD6QkqG568n+bde
	rc3nH9FXGDOy6PSkxmHUtdAbTFGPC+5Ih9qrFAXLVjRrGbkTmsbqmkuwTvRD9SFUUMstH0h/nzV
	AeI70MdPmM8L+BJNlVu1j+w6K94bmVBZ10VvC9Yyw3mOVCgFuKZSNdaeb2lC4e3cB9kZ1E1seLR
	OuKtGMP4083P3Pg+yqxj7tGM84Mb/XuwCnXCWAVYq7gmbTnWSGdAmlW0oGGtXcTmi3eRzK1pD7y
	MVDlKzcZe5qd+x78yc+zbZ8idhj9EPSXz5W4k5VXgnTvA==
X-Received: by 2002:a05:600c:83c5:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a8448629emr69017555e9.27.1777571264100;
        Thu, 30 Apr 2026 10:47:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fd90:2598:5764:5f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm174449435e9.2.2026.04.30.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:47:43 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 30 Apr 2026 18:47:02 +0100
Subject: [PATCH RFC 2/3] dt-bindings: qcom: Document IMDT QCS8550 SBC and
 SoM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-imdt-qcs8550-sbc-rfc-v1-2-4d2b6675eaa3@imd-tec.com>
References: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
In-Reply-To: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
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
index cc29b06621a9..5dcd794369e4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1080,6 +1080,13 @@ properties:
           - const: qcom,qcs8550
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
               - qcom,sm8650-hdk

-- 
2.43.0

