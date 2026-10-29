Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260595;
	b=B5n7+DzEgMm4phU4I/yMrqmn2jUrTfd3hMGD2JZQsWzBMizooLJOUKg5XWlvuRM03OFf
	 Lq93qKqUad99qRsJiRItGFr3MFs/8hIbcS7PFCngGGa1TIp4FqEB44K8cuDYC5vAHEUGI
	 fXOTXgm3HSD9Uf1R/6bABN1vthUIjLMnGkacxzKnU1Trk4A0Odu2YL+yLsft3LXzbNDCz
	 c5nuQrFMyQgCQQm6QXT32zObvfDHDAsfFckVGiXpbofbit4eqVYIvgo9p93pV0JGvFiDJ
	 WhHbTDEcZY5RqhJjdyBdoZWNasfawb+IAjjLmjhBgtzyTx0I+pw0VEsCrX8wCwsv88Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
	b=5pPJXqW3+cdhOOqB7NpL7kOFtOsgX7XPxMuyOF0sfWYeYIYmqVYS+em1a0u9pKhQ5Sa/
	 lna/Rp2pkDVrpY0ezuSjTMP3T2aNX+fPMd/R3Ily1AehzCDplRnotodCoUnhmZFZ2qCqA
	 Ve+vW9reXqvoA6uC3pp5e6oA4dQaGMtFElil4sBX/R83aFIoFALfIT+cbxL4IVKQiQ3xt
	 2D5RzUw9lL+OTIR2Dc9y3SkmYwYCnS48om1kjcWnS21MC3OBjWhUQbVE3vjtpHBnp87r/
	 wSh791dSUYI23SNzthSFrcgyRv9jPGFyX8DJ7rD/dd8xU1q/X3rbK8leFgTEaC0vkbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMx2g3Rx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh0NGAU+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9991B606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9991B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMx2g3Rx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh0NGAU+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GrFb2243695
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0BbKjuyacWjFfSxCUg+nai
	C57lOWfOhV6+ogbgLCjQA=; b=KMx2g3RxQZCfQzh5E9VGboxNpHvz9pwBZuWuqs
	53xFfZEh/+F2+d68ieP4gKJve5kNTMGg+0XRQ+F7AxPpV5DMg5Vaao1QewS1E+G9
	QiHPiO4qfc0xbSrKEPyFGnOVYdtHSq0aDPlzLkT1Dh5E6YGd92GWp08HfJ38j05R
	Lgmr89RlSD/+qDS4x3hsvDouZXdeftHSke6aO2e1ODqCOzANOPIgtkZ58eThXiYE
	nUVTnuy6ErKDbM8bRMg836SZbh+ZCT1KYNvUV/IiAXyzz6S2Nx8KdPpjNw5iGaaz
	OIwR7cTT8c+VKIKh2zdtwk9cLHgv7UE+w+HPlujcPcRXn2MA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8npw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:56:33 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6f538c3453fso599092eaf.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260593; x=1793865393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
        b=Bh0NGAU+0JWTXKGr98Cgo357AYrvD1XOa6UAqa/gVjECEQXBefdVK+Ha78NlAdmg27
         RO4CxCAzbXWs9WQoIF01yC4ZyN7HBO0uglN/1FphIfMKo30kCdGMIEHTLz6P9AtQ0cp2
         Q0CM6Y62fMJjcxQ8ADNf3JvaByFQ3G2kt9E0urJZt9H4v4wQ+wKg4eUU63Js9OdVEPwu
         hhFvVA0jpyhcu7Zr07k3py7MIGaYAQ6HRyM6ZuEP7MKaAEXqON9iN06z6uFvh41A5Mc+
         oIRKjXtNddksJCgcSEBcjoAoiW7wsJ5dnEMlFtXEsU0ovohcCWFl4kS8zJBwKEyP6j5W
         naMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260593; x=1793865393;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
        b=1LSgMxPuT1NJU/jH8to+0bzMz2RF3oI/LJ5AkIXiNGT82WspTNhskrYFX6P5NOFHQ7
         gGXMi/JjYLRDfXDqu4b3CSJTNQhlnL6ECPeVXfJOti4w+gep7z2YfDYShdzhUBy2LUBm
         7t2rZyQGFbS5FGwR8HdsmJGB6Mmq+GtXg5O3apaRH6MtychSUpWcPQG31L+ogE3VgMeD
         1IQQhVtRmP/VWII8WJTv4E3JW/yUw8VkgUHap1V5o4YLukwDpivp/AeuNCaa+mXrFzCS
         HfT2kqpNW/G05CuZ4djqVd3jp+ZeSx8DfYaPcXpxx/yHp4zqAB92+a6KIPLvYhv4rz2O
         OQ+Q==
X-Forwarded-Encrypted: i=1; AKwUvByTylupEXzJIRBbiwLRt6Idut/Pzn8ATD3j2WbY+ojLbojesuLokKMxNGX3r9PKGsyPvri39Xgg8dB3@vger.kernel.org
X-Gm-Message-State: AFq9FYKSZnGZTAUVPtSNNr9RLJN99H3i6SjkYgnkwcWZ2SToF9JQ4T+X
	LTUVgvVQFM3OTV+OmZ0FbOyvNlFQjHcBvTN1lEAmC+rWmAEokJ+ERBkfkWZ4Fk/HjRzl71ftYKc
	OUodHMLG55GJsdbfYaYOIkOeotzNZd8VeP63r73byzrnwnG7Tdcre+NQP/Mc7WZ4sfWCRFpdq
X-Gm-Gg: AYBFou2WIwxTT5QXWOy1G/h7fIOCFpfTyxwxX9EF7MSiCWZhYCrG5ez79gybsNAEdWS
	LxXM0lLHYex2IVyIvb7CE91HZI/8xG9wHh4Rs3ctLsblaiXaVgciASX6ahPCbcgeZSOvpswBLp5
	Zm6GJvTtv5TxwMKPH9SJtaEJdgzSOo/6F+lGuRnFdZpCJ9o+YBPM1ACstygs4hfAlXPUUtJQoyh
	Hw8FJxtcyqt9HOlkg5iYhlCxBD88dJBM1UAChxdSZcmRNnehfOtoQtV1sSN/7NhzFZi0U1ea0K2
	M7WkBihhMmCGRR0p8sDFPKOINyQ6uBkLuORq7E9jc1tFtfU3aeys/YSE5hAy+w0QPwWURFZcRZB
	GMlmdbKTcb/wpRis+IwPjT2b6SfPTIPpNKUK117gmj/+KhFfsfTgZhBJFyZqYNMTZuNq/e6FEjR
	yeYHn2QOLlZ24s9Jn1t1vF7A==
X-Received: by 2002:a05:6820:628:b0:70b:8cd5:891d with SMTP id 006d021491bc7-714ddecb937mr879409eaf.22.1793260592724;
        Thu, 29 Oct 2026 00:56:32 -0700 (PDT)
X-Received: by 2002:a05:6820:628:b0:70b:8cd5:891d with SMTP id 006d021491bc7-714ddecb937mr879400eaf.22.1793260592290;
        Thu, 29 Oct 2026 00:56:32 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71426f16f66sm3336632eaf.0.2026.10.29.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:56:31 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-advantech-som-db5830
Date: Thu, 29 Oct 2026 15:55:43 +0800
Message-ID: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Change-ID: 20261029-come_kvm-0005cb782051
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfXxAw4kVuolR04
 Pbf6Ma6U4EnUN+Uuj7fNuQD1n6Xw6I0Frnnb4FVwkKIkzA+T0l4RORgBMyN+fdtrmthT9GMbL7T
 pK15GC/2xKd+Ro2oNgWhnJ7DkkGCNoyaboeQAdfzA3BtwkPW6xSOyqIAzaXDAaCR8pB5WrYmyAL
 BA+HqbNSkRx7KZxjY2Mz1rDj/1gPsNaDjgjyv9K6T6FzFcGyF3VxQqOSTDCCf8/fJfvVE5nroZI
 MutqfY4YeMHu1UFEnad1bXxX6yZ0Kevxi9eJBJbbL/7QJbZag7c3BfXMr+8qqGiOqe+5h8+oOAS
 xKj0QnvdUvfDrpkPKrIGPf6k9i0PUX5ZBRhrv+2Hfkv+24JoAg3TceDSmNf3+OaVfpCm0Tq9+Ez
 YCYaQXwMpY1uJWL3EaYe4xIphK9PlpVvQZvPBGFkVMNq5yMzObR7RioIlN5/Od+GaHI3o7pTQkR
 8jEcPwWsbIBJkFe6oQA==
X-Proofpoint-ORIG-GUID: RpG2kuON08XqHyEL_TFYXMeB5kHYANWp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX5feD3MOeZv9X
 27xPPy9OGS/17MxnrqO5oBkaNcxgShgqNVNElwFM7KcD/D1GMB9SqsPCAVCu8jH13JcCYHeiA+m
 1lNrHuIGpgT087xWi61yuOfiWJjNmuk=
X-Proofpoint-GUID: RpG2kuON08XqHyEL_TFYXMeB5kHYANWp
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae2fc31 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=50O9vvR40McnEmrengsA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290030

Add support for building an EL2 combined DTB for the
hamoa-advantech-som-db5830 in the Qualcomm DTS Makefile.

The new hamoa-advantech-som-db5830-el2.dtb is generated by combining
the base hamoa-advantech-som-db5830.dtb with the x1-el2.dtbo overlay,
enabling EL2-specific configurations required by the platform.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..13e0f47bb8af 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -23,6 +23,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
+
+hamoa-advantech-som-db5830-el2-dtbs	:= hamoa-advantech-som-db5830.dtb x1-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-come_kvm-0005cb782051

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
