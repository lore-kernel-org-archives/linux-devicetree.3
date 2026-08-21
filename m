Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F60486B9B
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315843; cv=none; b=jdhfTilz/3Fm+t+isTcjMipRM3BZsDn3r06tadu1AJxGpYyDRVKUujGU+Yun3A+DjhQHWs51fHoJ+sNx93ERZFEFA8hjkfzYzi/TVoIeILzFWK3hjDnyWcMNj3c976YwhwG91/V6lLF920fr8iLWVtAV6fvnCODKdnjij+VmAuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315843; c=relaxed/simple;
	bh=a2V+I7UeXRDj3lHU2NGFDjdBIe3drc9UQsymhMr1D/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thFr9YNux2tgIutx8E8n3ERaQWKGaYktfPKMtoENtGQTcezvFPkDOeSgvDzJ+QxICSr9n/LwuyEGKl8WeuV6gP16KWTBalFlylydlel2qCyHFwdl48EYgm/BnRwG3eyIfgytNBUyeJ4Ud0qwZK5Kr8kM5rGQXtZwZE1NPI/RoAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeOTDygC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeOTDygC"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso151474366b.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315837; x=1787920637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=LeOTDygCXGkBZ1wZum1J79iHIB1rXhswcjl4Vxr1/j1k7at99FMQ8uG32FTKnitp9t
         6zjDQ69WuS/p2/HbgxHMXMizbu07txQ+RWqTruNxAuBslksMkzbATgteR3m3yBtlAE02
         N9IB/qHFXYNzT1DHwmW9und2ANyFS4pg9r9PdwKPPuYn+GScIjDhT5FY205oQ4oouCZR
         RTkMsthNvcCcJOdHDBPtXYEUIrrKod8/7FP9YiCWq5aHnkSl3wk/CLp8A03qbdwH0rTp
         R3ZBNOgjjrU1wjFqb7x96uz8zjCSEu62o1mc7puYEgIoU5ICwiDPCvvwwI77kPb4SxlP
         KUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315837; x=1787920637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=jA69M4UwREtChEh2nchdwSY7PHK2o7RO/yyodeJnZfndt/Rat+Cg/gsmnOqxTO+mxm
         zOaiNh2Imk/1wgjHNJXI+GXdc7wNVzIGINS0xuqP/uRQpJHZ/o2YkIDj9P/qoyVBGjlJ
         vN2L9GAIRguna//0RwH29O1PqKmP/pxV2k7Fbw+niEn7lMH84vmTQ/IQEB74pLPIRN6B
         x+b84hjxPw/D4QhaTYf7Sg0VgZSNlLVFWE/w+lMV4+AUWaGiG84kJ5tAFrly4+pOIoZd
         N30udV2hzvxbn5tI2FU5WpCjzOjZ+DlCoILv69AaLoDudjIK23Y8xdb61s5SZhRkabX+
         bHGA==
X-Forwarded-Encrypted: i=1; AHgh+RpUogadhfT34DqJDRaXfpHtjWD32yIb9SttmrsiCMhTcz2Vm+9hRScVrnhMCoTX23ycbQeoYVDyPHYE@vger.kernel.org
X-Gm-Message-State: AFuF++mhfyjF9M9epSLYnMnIC3kaagXO/tcqvHOAmmheHWHYm2LfFvtC
	JjAUW6X0KYlSYEHc40kN3sS8WhF2JstVctxYPt5potmVcrgzSHxNmUt/
X-Gm-Gg: AR+sD12i5WBgKz0BacY5l76fNtWiVHp32OruADReRNiuSencvPhb7vEQ6DWfyKGqh1O
	PPWw001U0nGM55W9k0o3wVLCb/XN9NAghjIeJz7F4GlQDSDu/WgutlkFlMIOrToskjWE2kaQIsR
	jY1+RtKA3ezVAtGKLSF+ivrFxCkSXpDWYnRAN766jBZ3Wltr0CjOglv8UrlrBoUEuRKvZlf4Jyj
	rz5wWQZBBV12RfwQ6TpJ5/gMFGl/v5WkQafZLbk+k8XOeHT65al81EHUX0kCILC0APubEwndPqi
	K7UA8nLKG29CcezbFSbe44UjtwRrQZuuVqGKuVDHoWRw1+ULLEGbGa9iJNeL+1E1M5C4LPzlqww
	BjffUutkVJI2yeGIyi1jRp/aM9e83MXh3560OOSdKg/gBRpcJ2jUTm9DnFzHXZBivzFlXMPBn3E
	m3d3LNqepDYhg4HRqbGEDcxpNpeHlNXPPKyEyPgKyP8jvYT6J0NFZKZR+8khA24w6u0baceoVpd
	GYhruNGNoN0REKJ4ps6FA==
X-Received: by 2002:a17:906:f359:b0:c15:f0b8:eb91 with SMTP id a640c23a62f3a-c246a359a52mr510507766b.7.1787315837384;
        Fri, 21 Aug 2026 05:37:17 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm451194666b.53.2026.08.21.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:16 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH v3 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Fri, 21 Aug 2026 14:37:11 +0200
Message-ID: <20260821123711.1579539-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821123711.1579539-1-zstaseg@gmail.com>
References: <20260821123711.1579539-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
qcom_battmgr can identify the device and apply its taoyao-specific
battery property mapping, required because its firmware shifts
battery property IDs relative to the generic sm7325-pmic-glink
firmware.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.53.0

