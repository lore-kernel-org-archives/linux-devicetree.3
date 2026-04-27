Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B524DCF9
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252341; cv=none; b=L0PQRY95QT0dWpLsvauIqxW4tONKgkw9Fx0XMIeNwhnrJJjauG6qB+mOn/RTscZa1LA1JKprdii5aQaHPys/zHqbzzuEnRnb9cp0Ouby7U4D5Yj53xZA41Jlz9VmWmi01wX1LWqVV/43E844srWKHDGjdLrRh0bPmglffgaLz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252341; c=relaxed/simple;
	bh=wYK5FouWlO3mk5cCQsRr7TV2jrk08SCEhtmOvT6O1OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfJMwWF13YlgzxshaHlKUlaIvI+QCzoak9DbRco34L1ASMrqn80WZXQUDKshwRWOOvdpxhhfkUKWqOx2P059aJ988Ubog1d4Cc2iCvTvZ+dJaCStzOrxZy2uXeiLxMI8HF9csGKfOUg8CEU7VihC1/G78SjSPRzLeNfucob9gxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gII328xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCHiNmSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gII328xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCHiNmSo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R09rmF2602585
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3abEdQkAq/o
	rrnyPwmUqAnKNXSf8C1r9m+gP5m1lLcQ=; b=gII328xdwfVBFD7LxqbiMG5eHeM
	DPpgRtE7yI6m4Inww4JJ0n2ZmNkF0fQzz/AYAzFXeM45C4BSRGtVCeZq+uSETkkD
	GzLJogIR0DdmMJcpvzvuzPPMeNPBQ+HA6avqECLCBt4rds5DHS2UPg0ca35oczGY
	bpZUahCsXDef/ccGXSa63W5ry+tsOCKk52eWttz2ZQuBiIBR3MiA0jPqmF1wM73Z
	vwKoENKFk46EcxPPQtEUUG4/ahAl14WyOepsDqsjuAw5ggGriFRX9Qsa6Ycd2BXK
	/u0Mm3UawJC1/F4L3pXuaKxbPMk7GQx/O/fWt/TWXW+jUxcRIETujAP4aAg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgur63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1273dfdaf5dso8192495c88.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252339; x=1777857139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3abEdQkAq/orrnyPwmUqAnKNXSf8C1r9m+gP5m1lLcQ=;
        b=UCHiNmSo7P82LzNYvhzcWgHk+ZfOUQu30qw4f5aXSavSeqrj6HSy3GmNTNS+TQWgio
         IYYzlcS5bEdZIZl60vk/loHLAEDk1zZOE6FCKYGFmdU/+5XeixDmDanN8DxUcWmAG9sw
         OhCHZd04u7M7V063tZkdrdELxcbxm/tnUYY9d4Xgbu806foJATPrdkDBOKRWUHAHR3B7
         qr6ylSKjXGyp7vpl5jXSw6WnL13jeOdW0Aclx7PS/Q3hvhRErZ/Jsio69S3Y5UmKYLZL
         hysZIU8peQ08fyKxDiv7Jx/pVP5VIDA5tqgvI3RrwtC9YmZOX0cGkB8ezC2HHGp6baO6
         d+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252339; x=1777857139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3abEdQkAq/orrnyPwmUqAnKNXSf8C1r9m+gP5m1lLcQ=;
        b=eYnO7BZ14SJlQYMsa8JKvIXkzyikNozu/ZFG7JoZC7/ei4C0XAn15et4aClrwijEmd
         FBJYjF0dbUYrAvjgcrVZRLVLjsuF+G4kIxLkgRTaJwMQxomAXpYZgV1lYz6EpiyHju7w
         mLkgz6b64yAg4M7ObPMm7MMYvabt+ez1T2s9IkD5BIkmrgu2f2ZtvrLTupxWwVeQIFc5
         fZ+aWinaEAMZXT+vt67D9r7hX/ogWf7GPvtfq1UaOB61oJuA8uGp7MgsOy2jr82azzbY
         DS51cbhZZkeJ0Zsnl0CnoTYhlq9jO4Y8MXxUBSGpoKjsO8hGPrj/RNx8u6M/XG7788zF
         fYrw==
X-Forwarded-Encrypted: i=1; AFNElJ+0kcQ+qDA1pVxh0fzCwLDZM73z6LWbEfdNqTTd8EXUl+1I3Xu+cq1FaPpSUqFbbUr9f2tqU6N6qPwk@vger.kernel.org
X-Gm-Message-State: AOJu0YzVXMSohLVmPchYI2pSolYm7WDqnTg8TG8JladVZkxs+qn6qY7O
	CzwHHc1DxZrN9s4jLIVoJscXs3OCYYr2FqXPQ1vQCvyG7UJp6j4jBQzYxwjvrc2L/24KlDWcQvM
	m1mtnYHyCtEqxmjXMNynnBa54Z775yebU5JARmVdodYLS+cnbzT0vChqNXP12Kv9j
X-Gm-Gg: AeBDies36JTk/Xvlb3ERGGGVtddXIFQISmFIrtuC/bc553CkSjJi/kjR3TXaHsoXsfU
	cqGZWnr7z2ktthevJzJVjdf/mNhRIYSRByKbZS2RIwdTEM5qGoiM6AWpQkrL1PrDHSGK1JWNQMv
	DFS36vhNwxPNvdxaeE/70hZ1J28sqtW1PUcRtCrNSJ05s/Ugi0cWF1WyRIeZkUgMCVY4Kbt2YQL
	96/2IldgPCGtm1ghPbm42hlGy5qVCsJP5ugdvehXgbMPnvEooNhnvPtHzbQHjM/8tbfZpJeDCZi
	PfXRnmWTp6rILL/AdsleAXdG2mwBKnej9j8W2/r893GY57dXdfClli0JPGnwKBMpkyW1EEM3Y/G
	uBg8EF5l1v0urVvHL+0cybCZTVkMJ9d7PKjXOLSfr5zVBUYc7sWyBUHRTx/S+0dPwP02E8xoHcF
	vU5+K5SnlUl1h4Jrkd
X-Received: by 2002:a05:7022:618d:b0:12d:c3d8:1f95 with SMTP id a92af1059eb24-12dc3d8249bmr5470053c88.4.1777252338934;
        Sun, 26 Apr 2026 18:12:18 -0700 (PDT)
X-Received: by 2002:a05:7022:618d:b0:12d:c3d8:1f95 with SMTP id a92af1059eb24-12dc3d8249bmr5470043c88.4.1777252338422;
        Sun, 26 Apr 2026 18:12:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm21720098c88.15.2026.04.26.18.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:12:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support
Date: Mon, 27 Apr 2026 09:11:58 +0800
Message-ID: <20260427011159.230698-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
References: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pa5hTnsuYs4WGx4DxweKmtRY-s6NIXBZ
X-Proofpoint-ORIG-GUID: pa5hTnsuYs4WGx4DxweKmtRY-s6NIXBZ
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69eeb7f3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=j_AYJ78cZ_8DOvKTJOYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMCBTYWx0ZWRfX1VdUYAkOhgUJ
 wek8zyMi7pBFFnZUqq514e7W4i8p+7rPKGoqxOLkTiJUyJh1fT0RN/ZRRub5q9tQgEJAQagLVD0
 TRJF0TUWbqUnmjT5uUdMIPbJiJpFmEaotr9Odydb/5luRLgrVfDpitQX023HxMpWApkiLZsvrGS
 L3DuzJoEirUA3WBNNqCHKk9B3zPzaTbf6DjI9lwAHxRdmsZIrwzWWZ72JMjqFWPqCvF1u7jWVva
 kTs5vazxmsel+gASUcQA7yrP5zso+DIWM/paHwsXMBsVEpyl2zOfIJhoTLDwhEnRlipLThenpwc
 +7DI8BAXquMacnysCKBiwXyj3y4/UM3kBgOy5/MEZI69rreVLSa050LCHQxKVU3ZgYhpP3LPmv6
 JTbgTxumJ03Oy0FYdO+bcKUhQCOTgws5s3uFTIzq5Rx49je0RPMFeQyzVotYboa8XVdyKWppkLg
 JxGbi3GWAC2wwWHEosQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270010

Add support for PMAU0102 PMIC used on Nord boards.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 58bb0ad5dda4..d93594304651 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -51,6 +51,7 @@ description: |
       For PM8450, smps1 - smps6, ldo1 - ldo4
       For PM8550, smps1 - smps6, ldo1 - ldo17, bob1 - bob2
       For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+      For PMAU0102, smps1 - smps8, ldo1 - ldo3
       For PMH0101, ldo1 - ldo18, bob1 - bob2
       For PMH0104, smps1 - smps4
       For PMH0110, smps1 - smps10, ldo1 - ldo4
@@ -87,6 +88,7 @@ properties:
       - qcom,pm8550ve-rpmh-regulators
       - qcom,pm8550vs-rpmh-regulators
       - qcom,pm8998-rpmh-regulators
+      - qcom,pmau0102-rpmh-regulators
       - qcom,pmc8180-rpmh-regulators
       - qcom,pmc8180c-rpmh-regulators
       - qcom,pmc8380-rpmh-regulators
@@ -417,6 +419,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,pmau0102-rpmh-regulators
             - qcom,pmc8380-rpmh-regulators
             - qcom,pm8550ve-rpmh-regulators
     then:
-- 
2.43.0

