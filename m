Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5155D877
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118395; cv=none; b=UCUjjL3NNORBEjTJoYnmzy287JJXoXwvLJChoj20d4zeC2BqHcZ+rMx8WjlA4YUIDxCqygCGl7z0ObJV4XXzACXUqRtgy26lwyUwADjRF0NzUp2F9lJ5JWIYKt7XouyCKRASzKoMRwmYI/OCYdpBLzgFZRHr8g3InPCzdvACfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118395; c=relaxed/simple;
	bh=aty7Z/Y9RI7OG/uBa1GEkCBFpfThAMq7yCI3/NmJ/E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6SZH+Lry0yjoZvNxwVM/pD5Na1UNaGA3Yrr2tl5hwb5tfAtTbRbzcQS3SW/bODXT9iP1cIGLBOtxEOI0rX0ZJcxcPVOD9qXiSLjsYn/iVL1A3RtPDx5O9OdD5RV27OaEKzmDcK8rdbFUyIv152CHKqzbUzzpqkP1pk4KEYzYB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7hHw41Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PP3sBhNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7hHw41Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PP3sBhNv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI70Lh1873483
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wx6twfdZPOUQ4R6QejxIsDpWxo0kEzIP3eFbdU3743U=; b=H7hHw41ZGl1SSKB8
	ctf7h77J00sZpxQSYHmRVBABcbfxoIAM2DWjh8BZYJLXMpHL9Rm6BCGwbXU3X0f9
	5g9+F+Q/vBHvNg+AWWhOrBAV4RY5NkJ+17Wa1tdFP95+i41AyuUFmObxvxE9rpFC
	0tMLTOnh5a4y0MnSjn2X3zfGtqJdHQuAbBzY2R4Lmwwc47xpftkit1wvKJSGfUZX
	lgiDTbzQDM1dwEA6Ka40d06Ti5DbI77Xt+iZUoGOyAviCdTyKN3n788N6KRqX8EC
	uFNv7inTxT/Pe0MMQ2qFsb6mHaR21pXsv1LTH38bEMCe+j8Hx3Wk4pum0q/w3gnk
	OX4HlQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4uh66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bb08e80a8so293752eec.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118390; x=1790723190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx6twfdZPOUQ4R6QejxIsDpWxo0kEzIP3eFbdU3743U=;
        b=PP3sBhNvDs+ux7eHXLRNSwFONJIKfwdBa6y8wH/T5sCyNwkhy2X6EGc7n7hFKtbqjB
         10wuUNZkIUHyhWyF5jw1UV/eUMNni44+J0QYGnmMBopmgFsov6U0/4c3sJwAt5i+gCgR
         G3ZBB5FxvYZdnIUoyDOqWACdCRcnuEAFnaFQEJLdN2lwLQRtHuPLtJyaVheqytqy9e28
         giYl0qKVajFG5sIGX6MQDuK0URSSrCQWHqzNFDeql08phx9BTtbJ0D+PHg3V//rB/I7F
         97QXCpLZiNkhrWcY+7bLvGwZ9c/8jmc5+DlOCh1cLv5tuD3Y4Gsre9ntHRvOO41jJMgl
         5ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118390; x=1790723190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx6twfdZPOUQ4R6QejxIsDpWxo0kEzIP3eFbdU3743U=;
        b=F940DUxTm6flKVW57RpV/GrcZWF1IhqulLh3BgfVexJtq5zCMxLrciToNi4TdkZirg
         93ll0fE3jbIOGt3eKuyR64Nr5iGtyz2Y3wYiSfvkGFKssNVGeLJfns9CvrJtbOvIs+m8
         1kZmZuRwfUqA216iyegAbn0Mf0DtZTHeooNwZqia5Jvqzm9/AIna5HsCL7c+hAxdMDtC
         SzbgmjQ+P963BYm+4hUOyNpqItnQqTbaF1NtsD0fsKkwdY4hDzuwzHF/OkPeQa3FimzF
         kfI6m09+/dBPLMWy/aKyhNjDZXwn+6DG+gk23z49hsUGRg1SBKsKH6aVdGXUkYoMOFOv
         ViLg==
X-Forwarded-Encrypted: i=1; AKwUvBzsYadwadIwnKwhhjYz0br656FDkeccyueUKN0oGxeFhl265E3BeuwCrYhv/FHcc6051oCQJhu6cV0Z@vger.kernel.org
X-Gm-Message-State: AFuF++kAJ2rvFAKDb51ahmPJvdm3LkPfLTiG2AADlqVrXkmpHlyHxou4
	6Qree+MWnpApzS1OlVCm9vmD7+T0vQ+yKN+Kp8ypTiT2Y1vZdJ6EMeuIicKOSdUWFjjV1DnmH2r
	MP7SODcfdXpKviaf6LS5YTGUhbKR1JsT24E6fv/hxE45Tuuhj8kNtPLr0OOkdwcVb
X-Gm-Gg: AYBFou3ITyoAZpdEwnxgq+5ItVKXwtGarA/dVC6QLBgCzQ7Z1C4/0ikbCdOPnZ0rhFG
	VJVD48ToQVYGblm/TzDIJVjTOeGkVOJ7YP3UYqV8TIM77Qji9gRGHs+81keE6r4c00nRSyZaE7g
	JVm9++i0Yt8Ytkba6NgFdcIDUUdf9+4Mcox6Uj9tuVATuzdE7aeDJG5MqjIqP7l1uWgFzrOaoIj
	EMTJcVyaPTsKFxZMiA3ZPFpW4Jh7PVAHATpNQW1VMVs6OZLJWc2LEwgBwIkd1QroSBI04Eb7MUa
	ANBaQX4joR2yZzxlIVeRKoOWoFvqMTsgUDttPeVIq+Hkwn2bmPdalIM5NI7MwuwDsDjXrxmF+XO
	3/uOajUg80tQioccc7JL8p6e/ze9NL9bll5DKEPqVnXYA0jCuKQ==
X-Received: by 2002:a05:7022:4598:b0:144:eb3f:563a with SMTP id a92af1059eb24-144ef1b354bmr1572792c88.15.1790118389943;
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
X-Received: by 2002:a05:7022:4598:b0:144:eb3f:563a with SMTP id a92af1059eb24-144ef1b354bmr1572757c88.15.1790118389393;
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:06:19 -0700
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-socinfo-v1-1-a82bd7d4ca77@oss.qualcomm.com>
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
In-Reply-To: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=692;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=aty7Z/Y9RI7OG/uBa1GEkCBFpfThAMq7yCI3/NmJ/E8=;
 b=Kk6nO+tNvqQsfP6nqeNXR4iW7cBFQ2lAF2z7kq52UTQAXnKDcSZsID4SaHzfBEikXaoIyFH6G
 EZbI/GdXHw6BTGeHV1PRrG5GFW2lp8sakCaCkOpveqJKS8w+OnYU99k
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX6k5ZaccnrVvR
 bm2SbcbvmnCYbHiezRFMaoiSVumczQt01rq8dK5EUe/JgUNV3QT163nNWgbhjN8LTiDnhdoGs3U
 6E59d0tLvJ0tg4GiJlYlfU61EwPnd64Rm24Zl7ad7WOQQTpRJqv+jZt4DRLiIS5eYnbaKHBBdSq
 f1vpR+mCGjJVb8onZ1MdBglLiZBqK9ZE6ucfzRT3nIYbsl0/dSkupG0m20i4pRTNduhdfu1KtA9
 HqP1rXNIY+1sRGawhUAo7igt17ZUtXgF9HgdImA7xYWS3WiOLphZx3+mdQl0mCxXohVsQDkYPgm
 l7eaa626ALb5eddVkD6qFaF0rYiyxW5AQZghSu5iQ076eAEwnUuvn4/8Cphz5rHluBp8CdWJfpy
 MraXEUOx87n53h56F/D++FeHear+z4SYzeXgYcEfXEgWQ0AO6/uqD5uxBDkicP2LbOgN7EHTpBH
 kbwPEiBva7FKm4hCRfA==
X-Proofpoint-GUID: UELJ1TnIBmHsNu0yU-tL3wMV5zeuMOw-
X-Proofpoint-ORIG-GUID: UELJ1TnIBmHsNu0yU-tL3wMV5zeuMOw-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX3AattHl/s7Kw
 Ktpuf28iguMv88GGGqCREoPSroFsR2y2cwGMn2zCtKshcN8UwWzbAhGBk9zslwC0xmjg4tO3UVl
 pygN/sKJbDzokAvYUUnXlhmZy614uPA=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab309f9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w_sQKQHac_Z4O36FQ6sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add the ID for the Qualcomm SM8950 SoC which represents the Maili
platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..7509b489e974 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -303,6 +303,7 @@
 #define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
+#define QCOM_ID_SM8950			735
 #define QCOM_ID_CQ2390M			756
 #define QCOM_ID_CQ2390S			758
 #define QCOM_ID_IQ2390S			759

-- 
2.34.1

