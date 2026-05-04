Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086421D63F3
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882041; cv=none; b=XsZAkcJ7UjVa8H3TtbGhXKslBk17GfT30Nw9HSI2sQIuc+pnXDSs1IIPrKd04WoP54uUor9v9VI8hOa1awMGy0olHU6EIIo0gqPJ7M9sPZEwmeB+SlfARbUfqaMN2Z4JZkRS26ArB3dO8fx4nitli6QuhZvcsh40CQTOrcr7EEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882041; c=relaxed/simple;
	bh=hi/ju4IZ5QA4z9vfxDz7l2/qO/AUwkoK+iPLaOKk7Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UNvsvIfVkvNsxWXMY34qJIkBgdqB4QRRDwFpqqVdiILe9vQdFheFy+wLXrNHOeAiebVz+XHBqSchrgX1rqHUNCiGk9quhW7/9tyZDp2SdLIRkNk+qaq1W8psMQBCnLmvCseimmzSv92TCLQ0KGujr13/Rv92ACbAItomNvec1CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSTemDgI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b44ng6Nf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSTemDgI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b44ng6Nf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D7ve147014
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1STb019Nq9vz/TmdQ1QuyiB523ENL8cT3Y7
	CUrbeR1I=; b=aSTemDgINX2Pnz5HEbxgv3FlKUy1gJbKawit+OutuRurvDtMQ6j
	p6knYyG+IJVhxHhvjLdpTeqC6qVdXtgsM5TfpDIXsgZ6KPozzcxrC9Zznx5ZC0DB
	diryGkEC0po1nIEBAW2b+n/+VG0Z0jZxAFkyF6/Ne2N9G8xMkbBFEpll8YgUtu2V
	RgRE/4rTRyI1qwabu4ufWAPvB8u9UNujvXKgMNMXKbRA5ffkT4TqTA1wsgvxSxZg
	0ybU549RSPTFWX2JdE38iAtrdOMxpbiYqCUG01oujHhUXeJnKutSjjpxQ7qqphrB
	TRqMsasknIh1RbmrY1H2aFeM3ITnXNmzA8w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxmvc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:07:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12e683ca86bso7077567c88.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882038; x=1778486838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1STb019Nq9vz/TmdQ1QuyiB523ENL8cT3Y7CUrbeR1I=;
        b=b44ng6NfwEALaA7cVeLD+d3pnIq34wJtuzfQ2CzGFtM6b8ZijrCwc+zgKLGNwfCqmm
         qhMUHm1skdU8G7Y0U7bLDuf7/dDaka1m/jv84v88Q+VHFSzRt5ZP9UkFKsWJ+pcCAgZn
         oVrH4s+xU6RzO4cB5/RTm3b9SN0xqruVxCOHQ96FyG/ECNejdPNMzNIxJPv3O3TQ+Zqu
         ZEM2RD5nVamJqEih0OBX3e7xgxDHbhf6yQV+GYoG205suux9+DZoSpyakrb5D1YibnLH
         3X2bA3UFTs6J8j5yaSql8NaLtgRLnEA+YF2oFHeZyj99kyYczvPakck0ZgRKl4UbclvG
         I1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882038; x=1778486838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1STb019Nq9vz/TmdQ1QuyiB523ENL8cT3Y7CUrbeR1I=;
        b=W8KNaDM8aXLCdJ7vtHAWjyH2L3DrtskR0xcv67dgZrUeMv6mNF3pmu13E2mSJy21Nf
         cIX6yvczZkyR6Ob8wfOMOopQs6g9l8OMLN59cCugzYfnCQsSRIU2keFUAkUq8MkpOx78
         kzHgt72R0l+sUQP/FknoAMIW7tnHZva9UAME8PeYmHpLgffA481wDA0Jljcur6jiHIin
         IHzvdKKMgLv/wi8QD67yiCHovR9o0/J84uYtZ8sE36AVWLsmiHu+DKm/cXHSAdHJHW2D
         8FFlnTd46INuV7kmBkWl1TSfkptbgkO7+EnHjalsQMefa0s/2Gm8NuFdnq4vccgV3SEa
         ShLw==
X-Forwarded-Encrypted: i=1; AFNElJ97MHfcKQakzBLNtNzWuWvUAhVZXpysKZ6IF4Ovj253ciAmmGu7EQ6lIFc5riE2pQAzdTMiJDLriipB@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVb0pCumfcKCt14FTHT6QaAglw4r3f1lCLh9NyihaHNVwNjGp
	PLT1teI7AD3nvZI1xeydTcojMgO45gWMiyXPaLV6NQ5fHAc+o+O8abnYjcttB/8B82FIAbL/YXT
	t8dx9sJbh07gLA0yHJ8Sfbx5Qzjjpt8ApMdGqU/8VAKHcH4BTob768yLnrlwnd9cQ
X-Gm-Gg: AeBDiet5QvVkNhJBQjt00sWeo+rhtj7bbwfbd6W0Itf8EVvDk5NIZA//jMcP72EBIFT
	iFhSkNPpagC82f8BW6H/rH3XkTMOIhH1bCE+URezAhVIkTWrQAAlVGmbR0J+E+3Bdxi3kxilLRm
	sh7CzBAfjxbUQe9dCvLK6vvWh0REWUdWnE0d7hS0fG/6mKb640A2heoH1dtCZ0nAuUqRxARqpwp
	SB2xFGVGfld8rkgoQ91cWYavyWEUoORqwY75Zmlg4xWNO/zK41RZcDmNdgSqsKBrFtEFaX8xgqy
	JwYEymQTc0s6tJ5tNerpNrsqIZtFkOCoD/5Y4bRfvxoteMZHEcKfj8YX6BfNiXg2XMqxRds/Ms7
	k5R3jLIPGuSsVWgg/CaJjElpBVEU/kP8hTfWYMGEdBoONE+KMtnLy61XuuDI7OF0MIO3qCVG19e
	2kjZE5qtnq54n58uzZ
X-Received: by 2002:a05:7022:6b91:b0:128:d4be:7438 with SMTP id a92af1059eb24-12dfd839a02mr3479963c88.30.1777882038000;
        Mon, 04 May 2026 01:07:18 -0700 (PDT)
X-Received: by 2002:a05:7022:6b91:b0:128:d4be:7438 with SMTP id a92af1059eb24-12dfd839a02mr3479937c88.30.1777882037437;
        Mon, 04 May 2026 01:07:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm12729573c88.5.2026.05.04.01.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:07:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: interrupt-controller: Document PDC for Qualcomm Nord SoC
Date: Mon,  4 May 2026 16:07:03 +0800
Message-ID: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zZcn60hVfOF_reaavZ6kMXFvz7SB0Lxa
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f853b7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Yo9YwD7WwG_EyHPTu4wA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: zZcn60hVfOF_reaavZ6kMXFvz7SB0Lxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfX2sAogP0sYYjI
 PBWndCVjygYpuhZ4Ttor5nwmPgg3+k2Y6i1a5BKc9tnysK4Awi8UGmG0DSatcFPPc849h2m3CtM
 jVzrO7wRVJhPY9S+1u9R409rbmQpAQaZo9QHmAdnUtZDwkKSLxPajqOw7MlGqNHtueiXQoYJXwY
 rGiCCDXY/BFQxxTJGtZ/Qa7RNtOkMUcg04JMsYoZQSyjLiHEvX4whZoKKS3nutqXyQnaBgiOCVn
 QeT3YJvDIGGn1i+1mJmkf+UjA4Nmn24dD51Bxo1s/bTF3Kvxmut8jNZtzp0KIbPxep2552zk1Ap
 B1Qxgk3ulkbahkrqk2x6i7xZe0X/EGeq0y6ZgiMpNnjcbV/rH/LobK9OpSbaEYOFqOTxg6jG9SL
 sBFdErx11/UnyLzUGiW8eTKwN8+WB5FAp1ZTNJQcAN3+TmDdpWVKZowpR23rYFdMll4nCssLokP
 j68YWl7IiJikM29wT1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040087

Document Power Domain Controller on Qualcomm Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427010922.230586-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420024733.1240249-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b4942881b9c9..07a46c5457a4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc
+          - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc
-- 
2.43.0

