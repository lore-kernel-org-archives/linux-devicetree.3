Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F1339362
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717766; cv=none; b=XZTduziEaTCg/lsnwst6NdtmNS6WaxNwu7uVZlq7AHuUfGpp1Y7GL3Vf8IaKt2/lm0wP+9uh3Nvmwdw3r25CjZNgPKEeVQeIuCZI+uiOqLysY0VSCaRqW839IxCNCxaxIwFaAay9l79UiBGfkO1Xtvp724l1/lQJHnDnXiCiUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717766; c=relaxed/simple;
	bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAwkdhdTBHDOZZ3u5NjGPi4ua39MdzqMvTWoHuJJS+Zo3y+IT9CUu3EJgC445ndwdJuqsaEjYFIR/OWkMb5haLJrpfOCHF+WBExTepGV5IURwBpnQE961wRcgFd0GD13iIObh00FkER+aLPnZvXuz/g+d380Os5WJEDhgRee2iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbSjwyyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQ5+NPUW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbSjwyyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQ5+NPUW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKqg401720
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=; b=kbSjwyyHATSAD5pl
	8lxuce43STguwUSf4Y4zF8piQwAaaXTLe62FWt2KbOtFgOhs5dOBXihuFnC01D61
	5dab2R+/UjPSSTEodwlrF2y1RfjdDSVVgYzO9ksKA67/nfEkBlAvYCcrmL/9nBE1
	sv1GxXO0yTGaqeHUGkup8COAfvTs/ASyDdpHzPe06EHOefeo/qphy7OBjn1dUFec
	r47J6luztCPWg2mmWu9fCn5/3C3zvyjAEe24KllKjj5HF+bp0+VmRNFqCQ30+rDN
	NRBAoYAhE7T1Tjbk6JQGV2PUdslJtw6rs2psLTioX22XXoYW/S3gu1B1BqJJnMgO
	iqwKRw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt798mma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso17702443a91.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717763; x=1785322563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=GQ5+NPUWgZaw3LglmQUrs+VLPJlTriojzuphdR5z4Cg789cpelYSqO4h0mOuyJIJ+V
         72RRjiviv7LWseMo41WgPTrEukLBJU12Djrc8y4/2RHOh+0/836Alm2epotmL5HzIyjV
         w7R89lGuDecN9VRTXDwg1BhvkPaozamvHkQkniCDqxJY+6M1VlN8DzmPm/y2TFXoBFmC
         Tk6SPzvdAauG5QhYiJ1XDK0TfLwMv1WubmqE3dnDJaaVyFDZPYEL2qzJ/+FWA2mpqgFS
         xRXIGfV1MoEBsH95+lhkQsmG1D9ZCtcFhiodYd5Cql035GfIsYcYYnHhngvLIObDtDbr
         teMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717763; x=1785322563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=UYVPoVwPMlwA8WeyImCIqNNdqergfCMa/88ZCyMMzDsyjHh3zNsl3IDxRwex8h9ca/
         gyr+qlAd1ARODkMpNg9NV4wdO6UD59E2EGeVfk29CDuqYZjIXwi152VrfwMgw+Vq+1EB
         3OUPUTABwDOhUeFsjE9lJTygjgg/CLe4aQng52bCygH4vpGFnV/dhJAx8eAQzJd4OTw+
         8Us2nczyVT/gnnTFON1YD3oiSl4wInTC12soVJmpE7yB3af2dlUugwnDj4kgDdeYFwfZ
         3S33pERWONf71YZrqu3Zau2XkO+QLdbAd+6RBicUKpQfX3gsu0m3dSQHVsFeSWETnxW4
         uHNw==
X-Forwarded-Encrypted: i=1; AHgh+RpcSAclH/HKIbaF7h3pS6WopZKfUv2sE8sUwxlXdm0HG9HGhdzv9kmlUNjgovq0GzGbRn5xwWUDDtnA@vger.kernel.org
X-Gm-Message-State: AOJu0YyTd8+0+1QY4ZVSLA+OsEy7g9xZVwghHd6gutdjaW17BB6LCrVZ
	HBWUzuxo89h2O1VhirK4kd+v+oaxDuPXcwxS3m/CQzqdaOTf8EFc9M46EsbFQkEIZixpEUNTR8Y
	jtVMcN9Njvmlx2Be0qkouXQLcmjl//caQ40x+r+olYvqlgWEKLevThGpNchbrAhB+
X-Gm-Gg: AR+sD11gss9CD/CwQxf+2evwJibnBAWxkETLTHTFVKtiOU/BnBD7T63sPncU5rusQbt
	qnHJH3qCSvYRTjSyEK9BaghmHB75ve+w/oPAbgaM0vZwBi7F5VEffQ9x8pysTZ9Q1Kg009gCSKX
	k00fNy46bXKw9c1PflGoLVrKLGLWnfBKL5w3OTaXN6SD22VfSfdBYferYDDYz4/X7dhPQd1YWIj
	cPFhmHNC3+aRGHBEEIEnJDgS9zbDm6+QH1C8H3l0NTzVtl2harzO/+S3DzKpE4tSvdtKcD8g/Lf
	/2J6Xr4+1DfI3UHipfL1yOXgCfcqAkv2lC9pun+Mtn9gy71iH/XVNFRYWTeMIzTUdRGi9IJbUVI
	VCCDD27k0VIc1eE65jKf6zJkZ4eyN+7ssIFyzNarmFE//G0/TGKyvYwY5nU3RwrSC
X-Received: by 2002:a17:90b:248e:b0:38e:6f72:9be4 with SMTP id 98e67ed59e1d1-38e6f729cb7mr9642120a91.3.1784717762576;
        Wed, 22 Jul 2026 03:56:02 -0700 (PDT)
X-Received: by 2002:a17:90b:248e:b0:38e:6f72:9be4 with SMTP id 98e67ed59e1d1-38e6f729cb7mr9642101a91.3.1784717762129;
        Wed, 22 Jul 2026 03:56:02 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:01 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:36 -0700
Subject: [PATCH v2 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-5-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
 b=7xjm8rvol/LWDQGie5TTWYF/nNVO1ILkyGA4icryN3d2W8WRsrOko3p/RVx/9fSTCND6nK1OE
 zTNFmbua0DGAzsccItgbF/kRkgJZz2+KPZoClJmiYPxIqXNnt7FKPQ/
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60a1c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: RrC05PUjsoi-7poi_KYMi3OgTrb_SO-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX6HJ141mthVhM
 Y1yY/aqsTyGG4UEBvE93CuevDLXwUNGybBlw699QqYXS+sORYqTkB3qi/1PzYPC+6m655Oy+IFu
 oKZzsJYsWeVf6luthTdt4+wv8jgCftdLHNCFOn4jpDkn/XGRAkV14MfqTt23SYmg7k3Y43VZIid
 ysgIuIWYyNeLWahstiqBBa9UK9VetNQZmryNglnqWMAZ+2YuMoieE9v38a/KtVBT76zzlvnc6U1
 rI4VlayBJLIrgaV9aE0bRAURILYaQ/QJMFOIGfDQrxfHyzrqZM6d883obMjjSB63e3Sl8EgJIaL
 zWOiwisn/T2s7TA9E/vkldtk617AcnhFwTfgkeU4SmyuMhG9MbPrMcgVeyU+NGNwY4s9jB3rlhR
 8iGnX3bEutipgY9Jljf+bZGCRbypSFS5xQiLIitnEnh3invaT9xrhQg5TvXZl5VT+tOVeGN9dyP
 KUF5zsBZ9eUQ2gSgtHg==
X-Proofpoint-GUID: RrC05PUjsoi-7poi_KYMi3OgTrb_SO-f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXxZ2ibaO5zvwN
 fvo9dRWZQp5d6I5hWfYyPccGMbFol5DBBUr9nO56YUGLRFXn7A6C/R8melJ4VF5H/LsIGIknjHx
 +dCGRWkRUw/iO9mXRsbaVWTLh3mI4kI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..c5f79210ad52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,6 +112,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

