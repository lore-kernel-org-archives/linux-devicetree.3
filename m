Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EFF4756BA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103414; cv=none; b=XvaptaRftYZ6lxWLmuOqmpT5hjl9YuRdZi/BVlU66BLilenAYidq4BmTe7vQ7XYHiZM5UzTfY5PesMwJy49gHBi0ijfsEc3BMegKxhT+e2t3wU8vJtCoY37+858tzN+209TtZggHwg1d/jwk2HXRaE7uazzWpmpiD63kYo3b/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103414; c=relaxed/simple;
	bh=mPDF1SlEMQdjw+ueJ/HclnaM4zDdbSA8xnmKyLwl+PQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N9hXIidbfpucNR6yeO9dS9bIKmIh56s/xMpL4MRC5OLBv7JuBedsY6RJ9u79byi5yuIvhqJRlvo+YC27dg5skDuQQkcNSzSODfIdeah4cVuB9cjvhD7T54NwBfP4nk7E3wkRpJE0Ns3SdpiYysNfH1ZLT89YQzHZ4t8I/zKgwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5tg3InM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTDQ/oin; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5tg3InM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTDQ/oin"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677896Ct3477102
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 11:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KkZyAejonYu
	VZwLADkzVeCeYi2RQWrl55Puf6gMelew=; b=g5tg3InMob75DjO38W4J0skvdbU
	PM+DjCnY92Cc5ixzlE4/aFlRxTWmibfBLtvSO2Z3ZB9QuCezN6pOZ8nUL06TbbAl
	SWxxqpQdsbQtNf1+g+88oTsOWCiQ+XyTKDgsA6EXn/HakXxO622TDQliC8bKJHeq
	5w8lY/13ewmVED7VXt14qRLdXF+j00dwL+0v7VlzlDrssXwi6bzayQ8XfW9xIojZ
	o/tXvBdwAbDyqVKfZV/y4WbcHH/T2FFTNMFwjpiCS4kGj+wCttNTO8ig8ZS6+aqY
	XFc4QW81RV/pZhtU/vxwhrRKGknH+G9is2ugO+1Z7smE9FINsZ3irhWedww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hbrav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:50:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so32912081cf.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786103403; x=1786708203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkZyAejonYuVZwLADkzVeCeYi2RQWrl55Puf6gMelew=;
        b=aTDQ/oinjxxvdwlmMIhW8Hwsf6Em+6HJthcRb4yZhHP/2eO1+BseTbSbMjXYihRVMf
         SdOq2IcQLSNQHbxBWJzi1UQi0C115Kb+GM6z4J1ZeM4tIvHrGw8GuKwl991tbHhiIhKl
         AOGxFbV4Nk06o1cRibWEssrcyHSQNwDk29BgHkdnV1LqGYkfckHo4F6ZM2F+KBOSvnRu
         3outdZUCYJsz1XQmxP4ikHvPyH8MFJsEk3ncDRTAtjy6HBsYme5/c/Za+z5Dd3NO18fr
         mslDKz61vNJ0PG/cqiokuwUIBIidRtokXg2p1gS2aFAdA+yKC89SmyMapgv1ueGQko5q
         f2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786103403; x=1786708203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkZyAejonYuVZwLADkzVeCeYi2RQWrl55Puf6gMelew=;
        b=HDOWnPO2ZtkWzMjqQkjsOo2W3AR9B6EsrgHMBzHCGI82exXC9pOnyX9M6FRy2oDTUm
         zOPVZrC4aQQr4ObmY2RvSvX+83uCbOkE1MhwgJBtdWZqqRE4tMAwhGuHohlAPl5o62SH
         sp4r2Wku3XX8xCmUO/HBcbEzryRLahA/0YCs246msHDI32AGkRwQZk5kgc/FO2K3KcE3
         ptZIk8XiZncbrwS1sxQP3KwWdJj4uvjZ2EwhhnL7gyXTbO7AQ5LuV0+iS8tpj2P6uAV3
         YHE8aDg806UGrExS3pjfIMP7rX9+xo5oV9birsbtPoIf52TmxkNp8aDS9UvDfokSrTiD
         WTVw==
X-Forwarded-Encrypted: i=1; AHgh+RrkPbQKUl0aSln9G+KQmFj4jGNUW2oDK8aCXPT6uTDk00tlAghleKZPmdQGiBqmKeRIzYXcb5Nmiu18@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNjzgukcPGnpiC0x51nYO1o0yy6Bxh7ow+MK+WkJIcfl78YsI
	bWzd3FBrHnS4HdJ/Eq6P4s7nipow+d0ANKpkLemPrSA+M6mszpbPo6addAHF4ANf5H6u97NYdkh
	OF8YAzP0BmiW21r3HOpzHkbY4C77vNSdbCGSZtED4j3IhXopCQho8p4wZdUzpTNQR
X-Gm-Gg: AR+sD12k8eryiP9RixXPQ6zyfiu67mPsL/D5osViXLlJHosEsBjkaBW+1TZM0bIfdva
	Djwiv/E6yjWczQwm+ZIGYzDtK6rOnXj4o7APJI2AMc7gdSTCNL2zwDIbeSsDpcndbLWjq4anRdM
	2W2oJnPp9H+cqanTQ0wRzRN74j3OyE8BtJq9Xf04O3GXZJtK04muYiAyEsb1pojrmNZ4861LJtL
	HNaIQmZsc+piBDUegZe/CYLuB6+yyr6CoowlEeyJkYTU+iArQq9IxTxXr3bFgdNnwoJSEANVp8o
	7LfD3xg0FK4xkTXhUWx0NGBcTDjtFkKxrtRta1QFa8kzPNMKcZzmJ3NfmVKy07YSgMtipZSxyVl
	Q100afIngVWVURHgO3IA4fjei
X-Received: by 2002:a05:622a:5918:b0:517:87bc:9b47 with SMTP id d75a77b69052e-52ce61f095cmr244386641cf.39.1786103403181;
        Fri, 07 Aug 2026 04:50:03 -0700 (PDT)
X-Received: by 2002:a05:622a:5918:b0:517:87bc:9b47 with SMTP id d75a77b69052e-52ce61f095cmr244386081cf.39.1786103402790;
        Fri, 07 Aug 2026 04:50:02 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c9047esm43046266b.33.2026.08.07.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:50:02 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: djakov@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        odelu.kukatla@oss.qualcomm.com, raviteja.laggyshetty@oss.qualcomm.com,
        vivek.aknurwar@oss.qualcomm.com, quic_afilipov@quicinc.com,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 3/3] arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node
Date: Fri,  7 Aug 2026 14:49:51 +0300
Message-Id: <20260807114951.4164439-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
References: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: os8NNqRGWeu5Ip2rUj4lXja3yd9KO40Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfX/I8kQIF2r+h+
 iGh+fmJP+RMmXTUnR8O4GHyLlnX5yCGyKnl5cjH7KQ7Hf7cUe6lNkr2e00mvQO+FF3y3OP+qbh5
 z/XaN08NdbII/oOYQt9DtuPczIg9jRFI/9xyng2uh+qbvQPv6qB1AddhL6WN+BkYH2I2DgTWQrs
 n9IOKWhiywGwMtGTnweD5N3c4P/xzdQQ07POY28tGpLxg5ChDFcF4ttIPDz7V+cB4pEUMvsIbLm
 oBz6bMCdcfoEax+RlgvE88u9oo2nMZlZpfivOu3X6tgvtLgSvqYjmeB0nspVex1TKr+KFYySaH3
 YurwUH9excob1X9ViF4o8dc95UbOG9LaZEO9wFoJdUN+zVqU9y+j5476h38GIgaBj8sKsLiu0sn
 /Dj1TKx4I8LcGU4gq91GUVNabngLoFgc45ucLxpULoBleIMyxd1fQPIhPtMmSA4uFafWWmICNdh
 Ok10fnnu7cafjXWS5Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfXyyV8urMKEpm9
 CZHTwEBs7RxHsidLFGp8uQayjj1Ezv0an4P5dltwxfqLUZVKTKw6PCBf1ZWJifFA8YRZCziPvWr
 aK8HBo/jBqsweijVV4DoCq9s/MtXdks=
X-Proofpoint-ORIG-GUID: os8NNqRGWeu5Ip2rUj4lXja3yd9KO40Y
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a75c66b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Mkk9YIhY_DRy1CQSCJMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070091

Add the cam_virt CAMNOC interconnect provider node to the sm8250 SoC
DTSI. The node uses the CAMNOC AXI clock to aggregate bandwidth votes
from camera sub-devices via the ICC framework.

The node is placed alongside the other virtual interconnect nodes,
after mmss_noc.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..33535c83a4d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,camnoc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -377,6 +378,13 @@ qup_virt: interconnect-qup-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	cam_virt: interconnect-cam-virt {
+		compatible = "qcom,sm8250-cam-virt";
+		clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+		clock-names = "camnoc_axi";
+		#interconnect-cells = <1>;
+	};
+
 	cpu0_opp_table: opp-table-cpu0 {
 		compatible = "operating-points-v2";
 		opp-shared;
-- 
2.34.1

