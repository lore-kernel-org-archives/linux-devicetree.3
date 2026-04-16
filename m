Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11233BFE42
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344865; cv=none; b=dci0G1uZe0NcBfilTD0aEX34s+JUSQb0OlVJ3KxRqHSiz1ajnnVvux9D2hiEQViI07ERQVak0H4vMl2tigbDdPC+g3y4vLzNs0/I8LfgQrIzIcVLe7P+s8u6J4liNXs6SmdhZy+tjodEZErvk2JL0+jHNyGVeQMNrFUjTtquoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344865; c=relaxed/simple;
	bh=mShqz2LMKwbtHeVqOaBAu5htLUyQtdiwxxmQtKd8+i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgXfLa7t/NcaCDtEQGs/lUdQLsRQop3uH7qSd5TvF42PjeHvFOJgzunLsE7PRKXSJNiYm8mYMNpv/TwCn35zQnFdcCbkYCCrjaS/sTCInxFc/vVhEXXE5KLlSvNTFqQVjO1zWJ4+rZ3iRLNcW4d1YEu3AThVfTh6n8da6QJh23s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pn2CM67Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTWl51f5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pn2CM67Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTWl51f5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GC2DkW1668243
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKaAroiUFfoD71Cuw6J0zx2snzlwzrwrTDDWD+/pN0E=; b=pn2CM67YksImvZ3q
	kKANo5vUejPQWCDcNARZgJe91tum3kz5quB52XdSKaSXU70/SJndA8uaOM3yI1aO
	TfPQdsAUM/Y08S9LLnwPMSYhN7q+odVjzT+I/RnEq46CZYSYSHcTFDmrdAgHNf0O
	/28nG4tfswMy+IAj9eHE9qweReSFsO0bQJZBBGTQG4GIHy3lLGP6LXEMs7BCKYwY
	SZdNt5KpXsVspdTcn0WEMltyWQbQxQiWinHz0iJZ9b7J9DxbvAB2RaYKaW0xINUb
	/EU5GBn3iAFvSZhfcjwe1WqDa+duYLewctrBAohH3hyz4GdFagBX+yyHihzO8FIA
	pr32BA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd91e25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:07:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so4417698b3a.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776344862; x=1776949662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKaAroiUFfoD71Cuw6J0zx2snzlwzrwrTDDWD+/pN0E=;
        b=cTWl51f5T3i3Nkx+6BqoGhQrI1cfN2HsJBwqfIn9Ji+y0H3xm6LOGB4OP4Iop9mx0m
         D1zF7iSFdcFjXeZgIIvYx8RZ2nUinVHejOnk5OES1wUzXxlUjOftOfTNSaKapG00Z7JI
         SYJfW+tBgyPfRMz3IvIBAHbt+rHGsnTOdkQANwWl+QO6lhZWBAT/fE8S+RzupnQiqVFM
         C85seBTM+x+qjxuEPbU2tnnp3bvMhUFvIs/Mrve3TZaPG/K3rsSFivuoQMjn9XtwYgpx
         jkX2V5J2tQFPHUYg5u4TGHycCFFjDkXs7va0IQPRpV8+DaKljYgkXr6XHzqsWodJJzNh
         B/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344862; x=1776949662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UKaAroiUFfoD71Cuw6J0zx2snzlwzrwrTDDWD+/pN0E=;
        b=bEVelM7pHbTJT2GERKaQYYMTTe4XAnd15tboMIRT4fJiTywMokIAnMQB9OzxDZo9d7
         plfw2nzwqYthLyb654Ga09SjR4Dp42sH5ZWKOKiIyYB+YU68hyKj83oJMKXUfAEVPFMa
         89tM9sCTg+udS5rU5QqCjQcvvu/kDvIOz3zOrnVvsDAjaAYvD/oRreiYotMcQIZOdI/m
         aG6LT/fe3zrug/sdbdHw5xq2sfSHQRHHM5H943m9hPpH/C/6qDxomeWHAy/FSQyZpJUJ
         0JaaT2ak0ZAkp/4BpcZwMsfZ4iPoz4mGeXc3sfbA+zNx7BUJlJU22enGd63gBt8b6uXR
         EBLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DbWMYSlceXr8f0qsHrig9xmW4qx8+mXHmGUiMLdqGFzNaBVddLKzeEsyI6IwyCRTVkdk/tY2AvYNu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+a8l9So0xno8yT1hZ2w/zbqJ4Su/X5L9Fl5L7u4xmulo1WuoH
	I13hP8Y1spi1e7pvq/2Zr5B8tVTg/xub8wm83KjeMkcUh53MXVmnZROvLldP241DjLPVkdCz08v
	uMkfIQYA3SL8raXIQETGj99gZkTwavWDA47R0iB1MGNq5ekVJaIiJNP8zNYDd5Fp9
X-Gm-Gg: AeBDieuLgYDOMRIi5JnItEUQeHP7V+37SyKeWTbkWgViyB07JWMuI89PnUglM7jVzQl
	b0no5sLhZqv+XVINcKgt12CgVWkmnz6RugMq4aznn3juoCWdeni32qEgJ66B2+hfaydYiGdQgSp
	9xoCabuZ2DcJxnra1ysdrvx8dx4HM3nKFlgQ/xPqrYVo1RPrThA8LEn7xnV427TB0SnjDWcDvBF
	IV6iXCpxJAQy141xW0gdjM0YeRktQL4MlEDxMHkM89DMwcpe4oc2CaSqg/LdyCLLsubJC8pntms
	A8jgFw0IcZzpWsbQRUOo8LqJqY3tMl16zeH5ouEfeRwN792H/yLf8k/KVNk7g6bxQJZpqOxbI2h
	7c0/74gMa/J6UQJkDof9jTZW68f/2zRwFSLKW0LTcObt3qPW+CoZGk6o0wA==
X-Received: by 2002:a05:6a00:17a7:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-82f0c2b03a3mr25624181b3a.43.1776344861619;
        Thu, 16 Apr 2026 06:07:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a7:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-82f0c2b03a3mr25624130b3a.43.1776344861095;
        Thu, 16 Apr 2026 06:07:41 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67449c3asm5383605b3a.53.2026.04.16.06.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:07:40 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 18:37:21 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776344844; l=1588;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=mShqz2LMKwbtHeVqOaBAu5htLUyQtdiwxxmQtKd8+i8=;
 b=r0wbMGJ8eYygyPdwRWkPSMTKA9Z7ogUpwaNN6yK9Hxu8LMMe9GHsmpscWwmg2DdaTRv5e3BtP
 F8h/YebFK+VALaT8aZJXo+wKQytjRu2MAZe/AvTgS6TlPsOrCnds/Wj
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNSBTYWx0ZWRfX/ZF0erUMzNi+
 SD70CQd9kyd5z8MJ5wPXsw+GLXmUeIb/mp2Gr5tl7Kmb+Ac51pZvr56K0Mo4DZqkIGs7QS0lPFF
 MXYz1GFsMalopu7KkDgNkpw6nG4FSmIoEDdtdVAd0LO2JeCgizaRkSNndadu6O3O98hXLhOYPQt
 aKFmEFtBXXk8W+DU7MDhz3xacmkG3yuV6zCp13UB6PASd8yQiSqCuPtb5LDinRwxasMOMNima18
 /n7RTb0u7f3d4RoA6v/6Ir3pHEHxQzv0yxvWULwjxVjFpz+LJOih81w63FbubRcipd1H10B4bzw
 6Q0dmzd2uD2rR2ObS+ILZ21+Y/VME+YG3pmnOyjvQLujomY/IcI046dnK+1pNbzBp8QmLLCy3rg
 KD/oEzDOZD2Jt393N6L00RsiQB/oZZqYVub2hwiHR518UV97volXYlBMbbxuL+HTnqUwxTHd+Nm
 vRl80I9c3SUY8EDhgmA==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0df1e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=lRx-OlksSAv_QJqe_iwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: lthM-9MG1-fC1Acw4AiE6mwMJc_3BELa
X-Proofpoint-ORIG-GUID: lthM-9MG1-fC1Acw4AiE6mwMJc_3BELa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160125

On Glymur, there is a crypto engine IP block similar to the ones found on
SM8x50 platforms.

Describe the crypto engine and its BAM.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..e8c796f2c572 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <20>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,glymur-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx",
+				    "tx";
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1

