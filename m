Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445197;
	b=E+kyBBSO/h0bu3tMicL4bckwQysyHNJDIjoxsMzfgDRVl+DlHQ6NCg8uvKzmVVu4rPhF
	 zBahgVxYXe+csGWFbgRwTvF9QhlCvxEqUD2y54iZm9JEf4bWvRhZVKzt8Cr/kh5+IlwFN
	 h/vx3Fd0FY7qGVreTb5F6tyYtP6GTDKHv8Wo9PCzkH87i+pLs4/8U2OaG5AtP2Z0JTnEK
	 aCWxiEOPfzNhsHgB8Ede3NH8YlzDd6CBzSAhuYQQbEUg8s4akR9H1QBVWyDBjDMKDE1+L
	 XlO59wu9VxGLNC3Drm35Vl0ktPckZJv579OEXq1T4elvYrTEX8yg6P6LOGEi0KnNefw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JIXavW+q4rKI5c+QcuTJovpdf6c8pfXOH1QwT1FMHYU=;
	b=27K2Rkzua8LzJSbLADi4Pox45AhNEgfh3EVt5s1vQUB9DW82d3SWZ3p5cAHh6RvKfA3K
	 f01TPX3xcPsGVDgu/SWd2ELm6x0GgmEjYgaZJ5vk3yWgnNE619cB7OddZXayj3KurpTOZ
	 1Fr+NzO5fLOJLZKpRvKDLBKSybRGYQrzVoacqQYF45envtfNoxyaVuq1b6KA4xWLghf1O
	 lhmMW9fZMgWfFfnsHvAC5c9pmLikF1FEMRi/vzUAJrsaITdGJO0/ttwqk/9fVSFtufRmJ
	 y32T/ZX/Bn6yv3TUaw1uMxNkw51JIvHRMgYH5ZR8xGM6erA3fkSwu3huQ2MVp2jsogA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=JYv66QP+;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF6606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BF6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=JYv66QP+
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso482277866b.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795445195; x=1796049995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIXavW+q4rKI5c+QcuTJovpdf6c8pfXOH1QwT1FMHYU=;
        b=JYv66QP+V0uAj5IpLt+P3FOIffffjKyTJZMalhpAE9NsbjlwOvwb+Xl0yIW8XEjjz5
         +a0q5tS9Gxl8HAbNNCR7xQq0lTCilGyWPPe1/ilHriezJ2xfrL/zXPB4C9X8DMTsIIMp
         QLeNG6TJ/gF/e2nEPFmRCbbwCKTG/aw8qaF7hlRGSl9+jnhaZgGd8Wvv/ikVT1sLbPyw
         8lFCevE3tdrMaXBdWGIFwHsIlqngYWY29g54iB5Wt5LZWx72kR80PsLVv2DAGm+6zPbM
         7roOZuAsBff5h4vEfqoZQpATvnkqgXvjr8WHanDcz72lrivv6gI4XMKtzH3DjCn5uGDI
         BhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445195; x=1796049995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIXavW+q4rKI5c+QcuTJovpdf6c8pfXOH1QwT1FMHYU=;
        b=DAcknOe5reQuj4NdkMg4RW0JuK/QSoP+fl9OpJXG6Vp45R1juzgPOqgegxkm06nj1t
         qPk9jA4wZ8qOHJv93wzuEslqru720tlpvjykdcHmcq48jVGyBchxn8IhOE9vmlg6bvMv
         ydTd8sXa6t/CoH0D518tQwR0QVRY+Zt8nqwJiAd5qKSF6DxjsCERAG1Y1M2bj78mttSc
         06WvmpCJeMPVomcyC2NNtALablfNfKT8cLSdkvCUOyptspdv5U6MHTXtRqSgnIQMDkJH
         pZXoMd0pKFm3mdCQnXHejAHwFrDagNXI8jQ+tsW0AaIG2es18OF/j/ZcYM6giAsgBkTa
         VWGw==
X-Forwarded-Encrypted: i=1; AL+hErGdOW+40fVMoUODSBYjP9CAGpV8Q3j2/Bn8qz0FT26W/MsGyBkLfP0C3KqeaCndSwNErFy0pTYcCeCO@vger.kernel.org
X-Gm-Message-State: APuU4Z+NJFLCVdq9fHfvbbnbFZ4L4+AGYX+DTiF0qV9Yn+y1KDz32DM2
	rboG9L2Op71RmpC4IguDX2UkEvd+V9izwfBp6J5uXk0rYnvGCxLtiAx1vKhlHAraaSTNSB0Psbi
	Ltq4JbSo=
X-Gm-Gg: AZFdTZcMw4BTDZnVibDLLxE8ZIz6I7iOtLTYT23ZrborOWXo8icRKl+evY2P6amj0rR
	9YDFqbszwPuKtuiWvDSd7Q4bmmr2QDtx23eDYHuKPF8/O2PnLvkks7CSLN56MDC2laNPOrY8f0F
	1ZplkRCRt8b75lvk2MHEkN9J9OIRmkjPqfUqJED/wxDQEGMwLGma1suJiC+xDMXetE3StJAA0/M
	UXp3a9uWGL4m1Dx75RX80Hd98XSjJmKcfe+aPenMMw0jJJ/8OMPM2v6q3qtYzbzBx26Qh1kCTQo
	YFTlb0qiUfGBdPsxt2uq0Qup9TnCt7mOPcuMLEIAqWPzi8rv2dpT3TbHLt3IDzyDVODEfae1cgZ
	0HBIDrkMcHddXNU79vV2DntE9sqZa3/YdZjSKIOJ7xBXp/GTxzMskzzZQbcHqbjlXufUdW4hB0J
	FrY2Gw/YDgn4SOx1ymGUUzKDaf/7ToAIELC6Jwtrnd55/qh9DiwlvGgfjMNsIFgkk0/oUFnmJWo
	zl593C9t2VvTlLBLFlIZ+L2Ia7lZuxRXEJ9albsRHKFyzpBD7sjG5nyYcM9Fy9bRq+5gxjcauqq
	4D5VQsh88lFxV2Ra7xYMtr/rUOWTWyLTqf2lO8cGjicdkm9nUSYdAZb51SDgpRV+bfvEmAz6cjH
	W1rTGZmI=
X-Received: by 2002:a17:906:3b94:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c513ab209f4mr755332866b.35.1795445195058;
        Mon, 23 Nov 2026 06:46:35 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3701sm433004766b.48.2026.11.23.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:34 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Nov 2026 15:46:33 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350 from
 qcom,ids,h
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
In-Reply-To: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445193; l=1314;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MioatHSL4y0vJqbIZo9adAiprmtkveXc0RY5gOeh64A=;
 b=SV+ZTJHMf9QlBLfDxTsw9zKgSDUnoBlSmgiDdiCbTMyQiO93Oq0oqkW5zNt3bohtXoxhv2sd3
 NWwUb47JMGwARaApwwyU27UXRbHCcqVkEVzBXaLYi/Z49tuxRtwikn3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

434 is just the value behind QCOM_ID_SM6350, so use the define to make
the meaning of the qcom,msm-id property clearer.

Also while we're at it, drop 459 (QCOM_ID_SM7225) since the Sony Xperia
10 III only shipped with a Snapdragon 690 5G, not a Snapdragon 750G 5G,
therefore the second value of qcom,msm-id is not needed.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 6e2bbf4f060a..a5072496332b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm6350.dtsi"
@@ -13,7 +14,7 @@ / {
 	model = "Sony Xperia 10 III";
 	compatible = "sony,pdx213", "qcom,sm6350";
 	chassis-type = "handset";
-	qcom,msm-id = <434 0x10000>, <459 0x10000>;
+	qcom,msm-id = <QCOM_ID_SM6350 0x10000>;
 	qcom,board-id = <0x1000b 0>;
 
 	chosen {

-- 
2.56.1

