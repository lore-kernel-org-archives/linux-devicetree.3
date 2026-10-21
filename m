Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568239;
	b=A+P1MT3IrVJVlVnR1GTSCaaUcH0xbN7nqImZNNvwNd+mhnvMRqPOInfeYvCQ+meA9d9F
	 UYoAJbDP1dLdpLi0OzPJg4jdHTqNUHsE08m0AovHIesFd0Dt4EdHcIpJIJSl2k3CJljRR
	 q5Fmnf29Ofw6xHYbqHlD6dgY2Fl3PnScE1ZzByQlfTfZv9RQstB2yEVNeiKh+WHbY/O2U
	 uzsN4yhmvY0qdWvGz2kYAi1GTznQfKMwutvPykLamJFIrWgP1lnklIW7CDxJr9hxF2AZl
	 jl2Mayv1qaQPL/vZIqPqGXPdRiEpUA4V8g2qpqTVCiFFFWbQHuv76kUf+XUYY1pKlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uwH2pVPBDysEODZXow5z4uFxGrDDzR8wurpmj2XayHo=;
	b=zOoDr44NysRJomI2mctJsY/JoCSbBV3gdUdgPEcBRu8zXOqD78spwEpWcYQo4BbxtxgV
	 rS0JLzv9ge9GXkN7q3hdVga9xFHtD+V1ZIO/G6uj9G1WsFumMG+djoIuFpTuQtq7kYj9i
	 lgUG7UPJP1SQ13PNzg4zqZOQxkgqljv6qzWfPN4YmOG7/1UuUgX/OEAd4TckL9aeMJQUy
	 +rYw/evEH8jsoZ0sxE86Ff/UhHlabc8vNrxI/3A4ELaBAAu580XcMc94vHubbl77YMDtn
	 nV6zCXJ3vZRIXUhds4eqIa34sBLCMmwuMt8P7e7DpKOJnxMW08DYhzlZE29sdMTMKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxD1DPhM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANW6tXRo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E22060A2602
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E22060A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxD1DPhM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANW6tXRo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMc92848656
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwH2pVPBDys
	EODZXow5z4uFxGrDDzR8wurpmj2XayHo=; b=PxD1DPhMSeiJAPGYbEbT3oOM6fF
	wtUZNwJ/19Qtu8x3dczF8f+rWvX0WYywyQPhILSR1vfG7Ei8svcK+HYSylq2fJ83
	g1ZUk1H36qgEM9qRv8w+e293rM+6HbZVNEQTLbcR5cOivC6JC8Vq2ZIGVODlICEp
	Qax+69nYliEqEwR7D2k7UAFEuVm93WbShzZfBK4gJcvyIck87VjzAtXskrauKHrE
	6zd5hwDjH3GUxDKl4TJV/FmdBApH7KYV9RpUqfON3d+n/PprL1ts7KryqScAXlid
	CswFdN16/cpH0Q145jj1APJHiTPWdtO50P9egBMSUyzR3V/jgCiuSpsxfqw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9acjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so513956c88.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568237; x=1793173037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwH2pVPBDysEODZXow5z4uFxGrDDzR8wurpmj2XayHo=;
        b=ANW6tXRozraCJt0XY8SZtRoBrKUvoFtcwlk4qWHXyTf3u47eyIwDVoldg3Ueegzglp
         ZOHmLVpIx3F6sB9YvMfiSfg4BhTAezSwdHakKHaDcrjQQPu7UTLkiqGGZ0frCV6gJPq6
         TRih2BmXeXSme+5t/t8LcN5w+GxRUThJb2DnlHVG4ZFC+tT+BKsOpFJGZknTuVhq7kE0
         C76CgltP25LhNvp8/S+nkMQFNGw4pp8i3bw33tzeq7EXkA6h/oRAkGqe4QF1Joo9l9pj
         ftGn6wpASMDp1RF5aup80wwC5AfXSw3bJEZvose13qOS2YXnCqNRzEdaMjsOBXHIfjS1
         cNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568237; x=1793173037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwH2pVPBDysEODZXow5z4uFxGrDDzR8wurpmj2XayHo=;
        b=STmsAju5shczwnmB/J4xDrmfmKhjnV5L/WMaeWI7fGZgy2BcANeBCkXsx11gx/RyUv
         D/ozrbDDgbLSULZaUToorl/STuXAAaFytvUXAnjm7SF9Pl9ulWaY5kDVywWK75M+Achb
         4xr8Z4tSFfoFsIDaM/U74nfdZYNN2qnsT4H1kV28r0R082nl2S4n8ljL5R05dGo4o0wJ
         CImg0iYtWF3EIYSCSMZTQLZ8F+i8uwHN5JueA48g/IWov3FsR9zkHuUr0kUEBXp6k1GB
         3ROBYQKdgm0Uq0CwlAkqlSvy6ilYiKaJrghnTtSktBWmFLeoY4Qk5MdeOu5jMRP2tAaW
         ROTw==
X-Forwarded-Encrypted: i=1; AKwUvBx4VD3jaFo5739kaGZ30G57hrB3IneikgF5j8zse4mYMyhLlyWN0sZQeEROzd7xp85rnMwF8OwZAJr7@vger.kernel.org
X-Gm-Message-State: AFq9FYJBH4KJnouN5fzVnxVEb36CmZVse7rLzhOIA2TZOL87V74EAfgj
	2/FwpaXVHTSpGnrrPP/I632nFj/c7929zUL0VURO6s+89aHc9y+mo8Q795lGTdxNTr1imm0OGQ3
	nPZxDpLmT726RUjPwviMGP7KVyfvqe7xMufMXmEv9issP4e769vEP1tL4uIaDafq3
X-Gm-Gg: AYBFou0GcRaCYhHVduPF3FlzU4fAcyIjo+XZ3zl2B3dmZr/jAuR71PSKhRkwT8HrmPS
	PaHqAM2qX6NCcJWpc6mFO6Xih6kFT1oaMrJelc7kf+DkbVEKNIvxXv+/1ecCYeP86rVKpx9CFhV
	u97OZ8CjzyuP0xm/TWc1+tLTq+4nfOnTkUNuG4EDo4NmLYZLuhv2628DZVqZ3TdzcbSN2Au0N5A
	XXz/KJ1nDtAUyuE2Lc4PH/GNlo/xk9baM7cmIK0SRqO7CwC7wFMUi3e/2oMgDUJ031PADzNlBfl
	r+CpT1GXoMM2NKSM1iCDmokVIyuxLMjvaTw9BZGR76LlR+sFCZIKCsv9OvTq1ubnf+VgaoB94rd
	hQCDzGpgCEX2RcQ0gfsrLYc3grm/fgNktMdCXb+4dMdklT5xr19mEDIAyVzw=
X-Received: by 2002:a05:7022:6294:b0:144:f096:4dda with SMTP id a92af1059eb24-190a83cdc35mr2475304c88.43.1792568236504;
        Wed, 21 Oct 2026 00:37:16 -0700 (PDT)
X-Received: by 2002:a05:7022:6294:b0:144:f096:4dda with SMTP id a92af1059eb24-190a83cdc35mr2475263c88.43.1792568235923;
        Wed, 21 Oct 2026 00:37:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 2/5] arm64: dts: qcom: nord: Add gpr node
Date: Wed, 21 Oct 2026 15:36:30 +0800
Message-ID: <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXwKsatSnNRwfk
 LeYImh5h6P570pBTfg4ps8yiHBSNF1IVSbdF93kcD7NKGtdcDKnh+9+mxzmr4ZUywVcwWhUEUNQ
 2FtCblFcXDSiU2TSCiA7gxcVfTPtRHM=
X-Proofpoint-GUID: t49rQBPeLLewapnwR3JXURYDlH93gQTv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX1iefWohsikrW
 c7fnjcZHE8YZbP+9jmzvf2CGAAb3wSR6Svthf2rcV7S3F1u/5WyHVWjykZH3FGUxTJTaVwFZToY
 PZJ45VfMzqfSo3vSkXjBqN/Kgv9mq1Ql2nxjFHTCSjC/f7OnyIGlPyPj3gMdov1fhDyOvNUfFCE
 RddsRKQRK+KNn6L0l5Ucnie6FmEWsYRLZyQfDXIbl4OBCEIkeRNEJKSBIckPDfd1t3eumcXy30o
 S5bCzitnuxhKoCiy4o8pFMjYnNBGjif99VfaVpcda2+IlUBxbqW1SJGpTaniHWCAms9U89tcq56
 E2+Adg2rb4BUSxE/X0a3UoMcZU3voz5s2FUvByKVThA4NUGq2eREmnhdA4wVdujgK3LOgBiXHYy
 rjBn1lhjJ2ZU83gLOMGIEPs+JjbIhJQRw31SuML8nCmVaxc5Av/Z+rjNfLiPiXQzJisCXLoLHvW
 CPgKd4QBitWmidyh7SA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad86bad cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LQeRsTducJ9VbTWhBPQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: t49rQBPeLLewapnwR3JXURYDlH93gQTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
audio services. These nodes are required by the Q6APM audio stack to
route audio packets between the application processor and the DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..b54789f91265 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 #include "nord-ipcc.h"
 
@@ -1732,6 +1733,45 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu_0 0x09e1 0x0400>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.43.0

