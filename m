Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD45370ACE
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078207; cv=none; b=QpoyjQuHDlU9GzHyHX9wOjk+4LIC4Toy49FBlndD6tJePzsfqrziwskdvbEqSTvJ5HX4EuMw3Bwxse9yhBFsMJCy1LAbL9UNDScdJjTbItucGXHPonHbZDu8pmaBUAVpKv9WVre2ejKEAXa6SczcBCxjiBrRrtPQaPlz9ut6Zt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078207; c=relaxed/simple;
	bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tzYqYAWQQ8NUF45G8N4AekZYGTmwPH2Pl6B0V7ZnyvyPtcjA26a3/B8frG1QvegsLtGV7nHZGhxps9taSW1WfLwUh+RzIxngSbjDjrNjakv6syO6NvOAAQ8fcOC9fxVEdaKb29+WbHD45VXvwc6IbGoGaib9lXVKfLQfG5LdNcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZnLn+WJx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imcKH9HH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZnLn+WJx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imcKH9HH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IW9N2172241
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=ZnLn+WJxNHdNzF4i
	3W+cZF6RmtLpCQU1MTWdWGxgW+Q6CBk/MU07fBZgetR6321KC6yrX1rD+AOHGSaX
	EdXPiHEmTXhTfCDDmBRQHt87jtRl5yDKBbwl5bOM4L/UBDQ1neX5SoEHhr2XutDh
	zQMGegjFmLXwcbb5Koo6EfcF23turYDZF4N5RuiyCQEI8vtlE+3k19WHEorefctb
	jG7zaUtupi1AkGPSEzKPGEs0G2RkqrK91/l1y7IL+Lu3WE4W3/UoHq5kDlatiz2B
	os8mJ7Wj25cnFlcVf7c48HnVoQuLUtlkQYN/EyRVMdXgCETKe+/6Dy/A/+K09yt0
	pKQn4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtfbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:16:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so54931095ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078204; x=1784683004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=imcKH9HHxyrC2Oxdq5HPT6yEgDl1L1bnYk28YU2hXnsWOfi/o8y+koyYPkVh5e4E64
         rHwJ684xDAiJCGF+5O/r04wqCUyPbvt6j7tfJaPa3kuY9mC7skvlxrufNax00yRi3ihk
         SeCOZ3v7j9UAT49rfGN96tzqAZ4tUVXSarIKRxHBNOPwOCc68OY8Tn8aIQ96pagg7EIi
         BAMl4DAHz7GNziW6cqgCd0u7YcYsDEvY8nRN3WmbbcrM3Ws3MXBJKo0KjWEk/eOaEUcV
         wxmTY9ohPapJDZ06bIkPJO+6qymFdUD49Kw3KDYNFkRZwmdkLFQJS7GHrel0ZYA2wTAn
         S19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078204; x=1784683004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=tV1ALYto6agzz5O1FhLkW6+yKJEJqkte9rHV6FI5NaRH6oXuoxc+3cnraADWoUH4tF
         y4NhRMtmx644aWlEugwPgTstx31dEWTE+2A+f4fL+GiMbgyDH61yliCQcNg5aSFpN2Lo
         Cwa+hxN+qaKE+ng3GTzUCG3krTT4CibHSW4Onxv4UPADfbnZAJYo9a+IFP+KPBM9r1iJ
         2/oBtXul7C8agTR9btfipHarXECcGH/m21loo6oucupl6EuWoG6skE7LXk1rHd+ji8TW
         uLiNEm0tqL1wsu3ys90WG0JWR//LkoDhSs4r+S0YZk1iWMYFmh6J133apOZxFAmJTC5G
         SIOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoU/HmGps3ePMkeSwUFSQPe/HmvkIaWYSBdVRzV2n9w8Q9Bmvg3T06tCWTL8EWRAugtzuW0i4H95zjs@vger.kernel.org
X-Gm-Message-State: AOJu0YwxH12LkGCVNe45nDFQzGMGanGXYuQj5/YwSuArSsGtGQ7Dmtug
	aVv9EbLXxi59XDXGqEzOtRFTH8UPBdouLamV2hQrh7X2tFsjbLXqximI45LXpTnX0DVlDSTYqSL
	FOIdq/TNtUzmsNUxqyjSs7EgCmp+1agaqTB4Ehtdxnj8Dq7zHfFbp84kGzBhfI3YD
X-Gm-Gg: AfdE7ckJLfDbzgfGJXKqHcFHJAtTqHky6ZIIv+pCxVWf5dpiMZnBD6bN+5GsG1d59qV
	w+fDBwx7fuiWpspGmL/dqiK3lCZQMDB6n7fyVqskQ0Q6Ne7m0PznSTcm2Uje6UoChNxysRJ8EhO
	/arfmNhSleGsbP+BbMVrENxMxNtk2yJSxPNo78PIDq6R/ush363mbDvp1hesgjLswWBOk1PSyAe
	Nc4zPe0jW8ZFB8ICWEJTxZ1HIVbNWLvxb3dBCMjjiJilL2DuK24mpinIBGxQLq4qEJFsIWDCmU2
	1XwE7grm0g5K0bQ91VNTEVEIdf6Ze7311Ob7oEfQBKwENFmRCorbKTxI6EmV83+YIv0zo6wB0kU
	3ChL9QIgkcgd6wSdE44GYTEw8uXVhfScctASM0EENGKTPLX5Q5JdBo8CBdGM1qWx7HaVzZ0ItNQ
	==
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250311a91.35.1784078204360;
        Tue, 14 Jul 2026 18:16:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250282a91.35.1784078203859;
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:16:14 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=WtyqlZzA0DXss5OsWmivd5DeH34exJbbEApd5XxCJO2QDiBWm7Js2v6uEFquGfE6CkTb+Abn9
 iyXf/b5+j4XB7vlIZQ9mF1ykxlBRUym8OWoSjDj47vk3A6GEOOUaG5/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX8680P6I7wHe0
 EZSToYVDRWhHxnqN3DNP0VLAbP6wfX2Y0F+VV4BZnev3yG+M4Gp2Ayt+j6clLg1egRXlbRDkPGc
 fl+wqZHtNdfoBplN01YN5g2c4JSL8NS+vFo4Cs6cNC848+LKCsUjUSUU5O9wuEZ8I4RLbkwOqjK
 figbeJLGLYV+NWrsjZulTJk6Gt+IgrGsxmP7g8c6m+sowTrStWma28t3D/5LniNa0javGDW0JRf
 zPGVXslug9k+OP//VD4veml+i24M+K3EREBPTBg5EViGjH3OQO+A+mJd2KXm2+ZqJdB7yG8CnOa
 p69Skqvfqd7IgGW/xsy6GawDgoL2CbWYWFyHOAPuLpzah67S+XDcJGSEC39gODaYnlHmfCy2uMH
 lCvs1Labcu1Dap2hDIY/kARApyNlr8gmnSv8cazn/tsAUgPsAwzaGrO4I6BXnXG9nMq3EhNuISZ
 /On5usRTMHRaROF7UsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfXyFpHyk280zAh
 xtVLodMFp3JP7X0igrNaolIHltfNoTQt2FXiFq6GLGZKiESTHyOBbWlqmgJ+Hc0X0IP4I3lrcEm
 scQ80nYbZ/M+EkJphp7CMTWBFQxbVJI=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56df7d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: HBBgWiFbPdUjJcJ7YvGSjarKOfV6EkPh
X-Proofpoint-ORIG-GUID: HBBgWiFbPdUjJcJ7YvGSjarKOfV6EkPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1

