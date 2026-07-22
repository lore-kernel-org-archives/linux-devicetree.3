Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBDA3655D4
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682857; cv=none; b=hxmikLb33l0WbiJsrDZOY2j35PANkKyUCdgoLyeyt+9HIFxxvOppu+Fnn4Y+EHLexUqVuwp4xj0ivUSABVk4U4ABNTzjm4LjCLN0F8pv6h0RRwSIlBsT3y/0SEKxb4kURTqCnSFNuKcCP8mdV/mSvBIqZzHSHP6MIhcznU54eeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682857; c=relaxed/simple;
	bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1zday2xQJzLkUrqVQunI7tQdF39BK94E3vj1vNT0ZeCeNEQ6j/cXiMcE/At11DHa9cFfUgc2iBxj8R6e/7e42Uu9UaEN5j3YahkDaibOo3146sKy65ocMiRwHZG8M/6DDzY0d2rw1+ei3HfDQuXmj5SumB+H7Z4e1jCM0tQejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYX9671v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kc/3pVFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYX9671v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kc/3pVFi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CJ1M3250519
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=CYX9671vuZfIt+xX
	au4XcaSKIcre2A0riu8zYCAbTZcxouSraEUlbpDo+UAqzLg4ltp1427pE2tEPVrv
	F1xX22tIlCaiwX64ssxlDF113tmZ4L4iXDI5O5fEKrqwhBBD7ktXSW0IoTy9r/mW
	AkfrZyM2wBVzLLCS2z8/xcuvgEqgzNRoDvAh3jL7lOL0yrHoTtp4O5HL5ZsgmEMo
	gZqpbu+9CkBNHD3nv3oJZSOmcOf1StsBoAisW1zRKjwn2ZdwFNkJZEHJ/+3+h0y0
	Oc8fw++4fKvbYAAJJWRohZWjF6w0F2Mw9OgffGFBJ8sKWq87OYTT/2a996WpAiDF
	1SQg8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c42tq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:14:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so13881756a91.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682853; x=1785287653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=kc/3pVFiLLpHKaI3vbd4ochKM/6wKgVuVHG4lQ+o3bcUy/Pbr3gYaxV5QG2VNTIDza
         gpbtS8A4wJuAgKaUSYx/O41EkfTU1rJwgRIKkQUovQkPwCkeH3NY42T725/Aoq31CbS9
         bV5MEy5Ji8yJq40gHWaoGkbkLWrPLx2W4nmRAVoJ+0NpNaFEvmHQ6MLHi3b+imV9E42U
         CT+fUmSb9i/GoG6kHWbwJFa567x+7V1pXJuqK4hI3rNlOkuv7ASR+niDXhSD2lq0Yx/P
         6n3E+4p/wW56jXLUYcQ6CmfSNWNnHvnwuAl7Zdn/qacVwf/W2wFH7WK2yRcFpP9wAQqj
         GxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682853; x=1785287653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=O7do6+ZhBWCB39VKDQAhAplHFN8S1OM7WqZteLCGo+OMBuUD3um5NZmdZ9MP5wGXbe
         Xiewu+FhVJpPISm2WM/JZLUi5RkYwnJfcc9ZsDRPglUJy9vvzgwU8mq7F4ou298TvHyL
         2AjreGCdKNvdtDll0U5kqDoqDjgfv7uxwB8gvWteIFjp0LUJMsdr/If3Wa/vFZZLH+GF
         x5Izw1wRRPT4eDpNwWucrg5eBc4Z6hvuId/5PGE2iGeEApsIWnekVYgBtoMR/cTG5Ute
         HLOED3EgaOxRj4wK/SKXE/hQPbOyN4m1HWkpSYYLvIq40OEtJyXruivIBj90l18xT1DP
         Zicw==
X-Forwarded-Encrypted: i=1; AHgh+Rovhr3wzMNCcwE0oRsf1LZI6hw/LB0XTEAk0RSaHjF6SySH5Z83fjQj/Rw2BY5qZEOS8d3S60EiLRax@vger.kernel.org
X-Gm-Message-State: AOJu0YzzK5iG7x95b42FICllQORj203kh0pxktYpHWGLbcxTH80qAAfw
	EQBhCrCc0rEmXVr3tZVUQTSMSv7WmZOl6xK1KMbhLuQa7Szy3m/EAmvLl7tWu+mlTS5rFPFFR+z
	WiSWAMrbkJASKkJI1wrSDX1qSh8madIQ8Jxreqhx8+8XMLHh1TjH4Jph1zJ0FBV/N
X-Gm-Gg: AR+sD11HOCy4DhYaqMvABZozgoK0G52aYRTAzq/cCa0YmCPytLSDht6S0knkxxOadqL
	8PqcqRGjuM4/pkw9tbDQndKe2idCkEea6L93Tp3rb1/s/0wKVTQOTVPTpYL2Ag/aXE2uyjV8C+W
	5Ptul1Yb5Ex/DKipaTDiEUqxixhp/09VXkF4pCUrCUfSrwSRxhCc14ukIlqaRwuS3ikph/fr8kx
	dKxhRvr4WAnPuTLMhkGrT/U5Jx0IJfN8FGoBXNlKvun/8GjSm6KtyR4oLp/KRGHcVH0xZtH/rX+
	ONytS5iY4MAzN4NxI4G/JCUWrRlFvRkr4xiDWxts2Ygte/WQ9KFz34B8oEwQpfGKWTxSL4kxs8C
	uRJqBD+ufp3/jsQrDs7NoJrZ6QGYvs+29OOvsSnWxs8HAq+smO0w0f/2MNJETMJg=
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460533a91.6.1784682852853;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460479a91.6.1784682852018;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7b4da35sm160380a91.17.2026.07.21.18.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:14:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:13:47 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
In-Reply-To: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682838; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=jBakBYCNzDdjVoMi5eDvzHX1E+IdgD6H1Fcbk/cuN0Kd6M8m0FR7gpM5zzunUVXs5JyxpLzSO
 5hSv83maoH6AYpsiiaJH+r7Tuieo4//oOCgQQRdIycA0s3DMr6HbMRb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a601965 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ma74k7yXknn_vty9jsuQNlYVDWS7YBAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX9NBM2jgXa5CF
 8rgsssh57IDbavrT7nSiAutHnqvpAteLKwQxWrRHh7oBhXhh8zovIZejS/+CV+xSH+FqF5bmXLV
 Ro9heuGE9ItOmsbn1/G01wj4D5fNWMITs7A1+/8GqMDtHUAgScbyTCVvkU4lQjuIHtzcMsmEPZ5
 JB2Q/SYOAtC7myteh6pr1S55vgS8hJW4uKtXeTTqdr+8/Ay5axpGO0bFQXAddVT3tCKl44QedcU
 ffn/9GjE7+QWKw2q7MoRkJzALDEzykKvQXIgqMTsxlw+gShNmTSw0DjGicUQD4jfyagb3VtTZ4D
 JLjAF3RjukmmKOm7k/kFVZCcJaWTKWKqFnY+lWiTwFKJPJuS1lBvqVycCps0aNALTpPkgiXV/Ju
 kUydiRviY5FKANTOrbsOWGtLk7xXkKz13K27Sc6iUPAK7PbBcbaW4/eaMV4HaJlaoIR754oNfdZ
 Ss/jBXkTadGMA1/aB+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX+ePSurp9j1gd
 b39NRx0UglIjGksAWsIhIWHwxFT3qzPmocIlb3F5Kr/i+HGGEwnWQ7eGW8BHQ3G65vOmWtJZXHT
 wfDxLOVrvWSWzHDs15WpGX7VJ5RR06k=
X-Proofpoint-GUID: ma74k7yXknn_vty9jsuQNlYVDWS7YBAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220008

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

