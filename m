Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284926;
	b=NXX48vXLcP3Evx3o4eP94zzaIyMK5LQYYBSQGqYTNg7YwVbarn0Tcn0Y96qmWBMQmgE/
	 SfhtPhcu119fu1soJj8LEV3mttpNz7hMHXGLIVeOE8VU5En7iThtXqSqsFI/VBoNv7TVE
	 R79+sEEfWLw2SQvNthRmZTsdvGrWzOIlvzShe3wHfQa6UMKN5aihU7wFzKOSMRIhlyDbp
	 tLpqeVE3mYFWA5LpX+QCK7lOCpsYNDBoArQlYomfmLErNF1T2kNtBBllXaSewtCZJjJSh
	 M8jBbsdImOyYMMq8zpEyB2uuzsO8iwoq73TsF1wUwFC5RCJrox04gt38akye4qkFR2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e8t5Xq9tCKUo9Qzu4LPifkPJjmKDzJOtBLM/fPK1Urg=;
	b=Cf2Bn0L5tbk1X35fgzyriZbPMkGU35669oh6GSR45lfiRM1g0j+HAF2C3FQfvRPngCI8
	 ssCmI35YCOM3lh6wOQTdtOcAXTL8DznaPIwz+8HLO1naE1iyRoMGnqus7rPgL/Ad+TKPO
	 p3u2ufi26aLtkU/x84iR5qVwDFtIj5jIJcF+aYfdqlIUTdxoO4Cx9IrZzSz2JstesxTrq
	 R8j3urkWncYps/jteGp5+ROkXTWs/lUHJJbgZEJMf6A5g0fdROlD4N8sB9P7JIl9MkQuc
	 Uyspqfk5dy5thV0OD96vsuhcGFrhvJCozQfxJVZonQvfcQyMUD+umo+13/hnOna15yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ne6kKYZk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CO+mK/Yh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CC606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ne6kKYZk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO+mK/Yh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeQvM3215093
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e8t5Xq9tCKUo9Qzu4LPifk
	PJjmKDzJOtBLM/fPK1Urg=; b=ne6kKYZkf6lbtSRyfU2iZImCOOIK3M/HA7Nf6d
	fx/zGjGG5Dc04Ph+A52K9kIIrFi99nJH6MASEGwgoMsIu9PKL5L47NlakJS4wwM5
	Z2Je8KFDZ8elH9kDuZIHdO26BfIXuD6592EgffarG0/DXclnlgPYquy2FiiDW4Et
	+RsmWyi7FQu1PkZdtJlmU7SphT8ErjOzKrLeGS/0wWXgjIn6kgLuCAzYHcwSuE+e
	tBf6a/FmLHWKl3aSYaarEPOd8Pm/Ib1scvut8686yaQ6YnQWPTySgz8anmbM+RPu
	ZnO9tq0AVuABuqhTjyuwGf20u5dIs+WneAjJt3K5+3jx1Nxw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5sa6t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:42:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd633da24f8so2713761a12.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793284923; x=1793889723; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e8t5Xq9tCKUo9Qzu4LPifkPJjmKDzJOtBLM/fPK1Urg=;
        b=CO+mK/Yh8z/jRm3PeFsqk3VvQ/xwUlFt7oVYjySgohwiytFmOaXSL59pwY3nr4z+LM
         zn9vLoAGmlGB+Br4o+72/R33OHHUxFoyj/ay7OAs/1HMr+2usPq4UqvZQ89no2F3hDy0
         bJmc4w2HYd7WIMPdsCbBaTROjZq4yNptS+gbddbJVYzOSNc4hEY2tzGNmScHbocpprLl
         k7bGiFvyq2TSvfa0TE38JWvZdXvAFw/9W6aNTgQZCPgDoHHGKnTiWKeCbK0JggDetWbY
         +B0ysxV5u/lZw8WsSRusFt5/Ptk0gyumjUuLGMGqg9l06Q/bnf0ArSo/AEQtqB5BDXIH
         Msnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284923; x=1793889723;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e8t5Xq9tCKUo9Qzu4LPifkPJjmKDzJOtBLM/fPK1Urg=;
        b=bwr39wUFGysewvW1uheReOgvY7IuOV14t5KLQzG3Gublnad5+lZDsn6URYA9qz8eD6
         QvslKGlfKo+G71FKaXT+DzKU0ob2UYqVHhccZd7lwbB95vZ5G/tOKEG1wux3u+0NlSzi
         p6WTpUsPWDbn3xvailZf/yftKuoLyQcuoWGVn/2dAfKkCccfO1oRfjUE1LJiZvtBDPVp
         gMVC9EbKQc4ZfnfcuUET6ZiJtGRxBXqdEPbuTrjNQY2hUA55cbLnatXhFXtzjA0M4oHH
         W4pNP1/YEPGZ26q4Dq+Tx7OoLByNUbSmwOxfdreXF0gAH98bQ/KAscG2UrLLzIUucYZ4
         K4FQ==
X-Forwarded-Encrypted: i=1; AKwUvByb9VWWgvhbQ+Gh3NTdl5mHYjqJtsUG/XBZCU0hWN0HGna5EpiU/EgBgY+iotxCq17XEiUJyWJwwiVS@vger.kernel.org
X-Gm-Message-State: AFq9FYIPAso8d+vzFHf+WO5jlo/aoQCKrvxXtSy7HMmbvt72uZEwvg0S
	MNuxBrktmXmIr97ZkJts2v4u3hLSrkmyTMkpLWpZENBWUHUJJrr6Npa/IzTm2CUOzfJYOxTtOS1
	UIoYCCWOUaVmxMaEBQkiHBj8aDJ2Oc9x9nOUn9eYJf52PevkwEfQhGIppIuAJ5+R7
X-Gm-Gg: AYBFou1Wbdsp30KTJD7q3mI2e02Tc61DdlIh4xsJRundBEAC72FifatvJsuLKNA4mOr
	WjIVld0dLpCb8dBEHtjzCbggp2nJFLodhi53xcz9ezNyrztRnOWy3W0FKnhElAttChQciWSZeng
	XmUR2Z0amaMMz2uQLWcC6yjCxVLE8oNk1jMqiMAlTFP/+8eik5wCn7TjMUirSm1pE0BtFx/kjET
	AebEDSzvZ3n1/G9B6d/po1SM2U0wlALm/YMP4aE+ClM1yB3q6Tp4oGksqL1kzoHa2jGDZT08wUK
	PoH3wGf7s+aO4ZFsIwCqDtgOHyDw3MrfZWLtRCNAPI5PWHYvWbC34aPmUbz8Z49fyrWs9OyMTSG
	r+oliYLqdsn3pvIus0b4Cq4vvjFDk2BnKkvT7kvYuU2B4DenQC4vtUJkx8jqTg/ZE7+Kyxp/2uX
	M6uK8edF0=
X-Received: by 2002:a17:90b:5404:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae57f629eemr4725573a91.16.1793284923070;
        Thu, 29 Oct 2026 07:42:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5404:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae57f629eemr4725539a91.16.1793284922659;
        Thu, 29 Oct 2026 07:42:02 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccde306sm5444510a12.30.2026.10.29.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:42:01 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 20:11:45 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
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
Message-Id: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAChb42oC/x2MSQqAMAwAvyI5G6h1ifoV8VA1ahAXGhBB+neLx
 4GZeUHZCyu0yQueb1E5jwhZmsC4umNhlCkyWGOrzNgGda+pNDjLgyoT7k43xdkSFTRUuRsIYnp
 5jsK/7foQPiAYNIlmAAAA
X-Change-ID: 20261029-sm8750-fix-sid-masks-f27747b63ab7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793284916; l=1494;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=h07EQK/xjhAXyzeFzx54Qn5dbimvAn0bx8lbX7X9MlU=;
 b=9m1at5bw4yfQfYCvWAgQQvecRPHuKtU/OdE1RDwj4J1gR+uHAd5f7du/+bEmobNS36WKi1bfK
 AdvIlK5154fD4aGI16+zrs57MbjXIy+Ysa8PhGTuDIhKUAlGl5MKPQj
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1NyBTYWx0ZWRfXya/yJ5iaUwBJ
 1qCDGv+QjHT381U5cuQsGvSxjN5FGflazy2FxIy7Kp4Ymly4btY10dUo3SLYjR4oRMG6YQVYWuN
 16vGxLOY3+h3PPs1f9IdyKoA06OIHIpKwoDvQqvMccx5Jo4WkIUMyLq7nMoYSkJ4jjUtQZF/rXz
 G96ReE2Po67RKeO5nmy21t1rPQM6AlRej0qKiqrsHJtLaz1s8IiPTWOKgFeqB4xHFMNL5ZENUL5
 x/0QCu+RxTCeWDfgfdxgJZONB84xptNJzHulF7lbrhYcdnOqz8p0SEfb2pAwl0itegAsI0+BNXH
 Pvp2uRg8jLG46kVdHwqOafKYR0r9MMz097M904+U995MmFkpc24SKDIkxcHg1A2PFdocZlHEbZ7
 9Yh2bkvoWATaLLKG4sz+icyZZgRUCGhtshG1DYh4ROQrCpNYQPM49Wa12ZJ5YNh0JrxutC3p2c0
 NLe6rfoyTBGl0Ml7POQ==
X-Proofpoint-ORIG-GUID: iz_W_-q_QfcpxX9NhTqPLzfl9Npb2Rdr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1NyBTYWx0ZWRfX/NRGNnKhf8OA
 pns0mwBCAkAY7/esl8lhjIe/AaR+btAh5IO9MQSO0WxPBSFsLNun7QXZcep8vxWhBrrxnFtIpwh
 sAbS73g42zCZkUS/6XHIqXYGO5HCh74=
X-Proofpoint-GUID: iz_W_-q_QfcpxX9NhTqPLzfl9Npb2Rdr
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae35b3c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t4KJ5oeoZsrh8uawLdoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290057

The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
these two context banks fail to probe.

Fix the masks:
 - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
 - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40

Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
Cc: stable@vger.kernel.org
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..de9d9bf3ca4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6497,7 +6497,7 @@ compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <12>;
 						iommus = <&apps_smmu 0x196c 0x0>,
-							 <&apps_smmu 0x0c2c 0x20>,
+							 <&apps_smmu 0x0c2c 0x0>,
 							 <&apps_smmu 0x0c0c 0x40>,
 							 <&apps_smmu 0x19cc 0x0>;
 						dma-coherent;
@@ -6518,7 +6518,7 @@ compute-cb@14 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <14>;
 						iommus = <&apps_smmu 0x196e 0x0>,
-							 <&apps_smmu 0x0c0e 0x20>,
+							 <&apps_smmu 0x0c0e 0x40>,
 							 <&apps_smmu 0x19ce 0x0>;
 						dma-coherent;
 					};

---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261029-sm8750-fix-sid-masks-f27747b63ab7

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

