Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA733AB5DE
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697642; cv=none; b=Yxs/4KtsA8JwKrWCBq4xffFfmmcB5sry347nstVp79nv6BZkElA29u+vFrr7BOnZ3GoMXEPiC9crjyDRzFRpqNOp5VaZsxhhItNdZxWrX7AQDOAXfy7KMYNyGxhqSUPnIfcf6kITuYlL08E/9rK9gDc3diV01SxI6dHLlZFQPvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697642; c=relaxed/simple;
	bh=LTHMLdWF8HFpPeJgdf3vWYwEXH7E4tFvMQpFvdkayZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9bvKdsdv4voLdUmnMhVS9jYyeyCwzl4AzaIU9nCJXE4uN3ESINV0Aux41OoGiJoSdeC4xRy6sTGUnrJ4TCwCLjNO8SjeRdT30fWT+z8XVzOEUs+AxbAcnMnOZrUIvDWyXODBDRT/PnjpDvA7+utAco4wRC08l+ojzjOEhc889k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePkpyPNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcKoWITz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePkpyPNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcKoWITz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAxA22524404
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=; b=ePkpyPNphE2SdN8m
	tbHhUAZXkYMKYyU0KXIZzBEOk8juKZmSGQUvKjhGR156q//SsxUI4lvNi/sEnS3h
	vmEOXKwuFgvmUakjXFc5AR5oqurwNkb8RtCNFY7CPlwsNGsxgKOg0/9LySX2jAkC
	Ftw2j8N3kFZbJQvYCee6ffzSB6/FYqhCJgfF0yTXst5oQwYdSABIjp8fzikjtQat
	aNzim+P8Tk9qtMKEEXYWHDJcrshUThahc+lB1i9HN90XVhFHPWWEsUpg+FOFK1ZX
	PBzvcR2Qkh6ZRei4DvqEUTtFXwrQPAmLK0DdgOEwTnV4VvNHVJ7DxUVhCxmeCkES
	ItLGdA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgngr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso8727842a91.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778697636; x=1779302436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=NcKoWITz4AVWkTWm9K2iKoAl/QH+ODcle5SCCQwMZV5ztu52o7jfuKBfF5vXwc0LeG
         azK76xHD8KlHAJbwU4S/oEHss8ur7ZJXkWO7c2kag/sZrXXSXa9lbHPAjlYi0HYYxgoz
         cfzPGkZDPOBjxVA4HgcVwbz8T/YfXwu1N4dOMAHlALnWMSbOuDdXchallJYOAwK7QCGw
         afInQay9SJrab8rImf0qriM0wjr2E2qhh6PasoDSH7ni/uVOGD/i8/Hp6lC2Dbzei8pb
         CkZfk9GOq82GzewhFeik4LEv2RqghYgq+7CjpQOLWmxB9vXU6YhDlDrvR9DmhGrNRAjI
         4GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697636; x=1779302436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=QxUBaCZf+zw0n33TvzW9ROY4VHo64Y7vDZhg1q6xMNuywn9yRf4u8Geu0agWf+Q8am
         DdB1iNNOCqq+pEhEkgbwLz8jiDv99HBhrinn/k0LzefUrR/ij3affyd0cMwF8xCcFMxd
         S44SPd3mSjVkWWh0jEXndVnuGLF+d2AJ81fb+xzhPCIStm4GcM2k8jMj3RR83FBBBuOa
         XnTUkbTpzuoB2V2Gnd32DXX/Ae3tD9iql1rMCbfHAUWI8a4qRa+FAs9ETa8LSEHvWGq2
         0Gsz4tGWdrplUbFViPR2VmrrfE1esXXLF2B8M7ADuUSHV003ShKHk9l1bR7pSdqeNEyO
         lzmw==
X-Forwarded-Encrypted: i=1; AFNElJ9d4xgF3H8Hiry4eBPlMoS5NmCBkFZQpYlDQ3CA7TZrURrLnbboeCnZXQNi27dS8NaOtw5UDlzzpbkr@vger.kernel.org
X-Gm-Message-State: AOJu0YypsAV997BSZ9bynwKQL1rzxyBY3f2EpO2eWCJZtGMZqcgP3xrd
	qufJ1nymD5LMtIeWeaNmmBwYcEdcc0mP9qBZllwOKA38o3t0fLdGZZrSupQPS4x9HP4t0F8Xnti
	wODo0GoeTsdWePGPeC0cwKoXNvuMiR7TYUh+VCJ3k9XMAM+lmBZKULyevFP5RQw0B
X-Gm-Gg: Acq92OELsloE8xn9KvOx3LHGZ99Ebn5nwsm34YP3ehX3BKghX5dRdvgeRZC2xPzAIvR
	8yPU4Mw2Vv0jWszizLQFK09PwiEO5I3UgS4JbxXh7tR2eoweu1pmfhh3A8p8MEAJ2lEAvGZs/eA
	9A0LqAVC7GUGfGOqk0+Bh9MWu0fvnwzJZ2u6aP4pK364/MymB6+jOGAQZQMUo/CTXZ+FZ0OC8L1
	5vCs5SD5bDfPC55QjflVKavygXVOi51IwpQ7ztKDLG5mTU/pLdusxtk4L1I1KnxUZW4YRipAsYO
	5OdmXhgYA0uTS/3nTGCZlmELE94wbTcrPpDxjVf3mDhHcLrifMSRKvVHrUc223HEkjlyHeq55L0
	SQhsVpEOGFzGpAbr5xf6wrNRw4Ix6OLuMd3jottQNprj1mycSmMe2cH3iDwzpR+Yvig==
X-Received: by 2002:a17:90b:3f83:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-368f7993ccbmr4389631a91.14.1778697635693;
        Wed, 13 May 2026 11:40:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3f83:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-368f7993ccbmr4389607a91.14.1778697635238;
        Wed, 13 May 2026 11:40:35 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm15271009a12.24.2026.05.13.11.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:40:34 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:10:05 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add qcrypto node support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-knp_qce-v1-3-0ebdac98e50c@oss.qualcomm.com>
References: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: J7VAGvIp6v5QVxBIWyWt3M8LpuwMawQt
X-Proofpoint-ORIG-GUID: J7VAGvIp6v5QVxBIWyWt3M8LpuwMawQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NSBTYWx0ZWRfX8peBU2kmSKOz
 B6bbDglJdhp0R455Q/XY4HRkqHwLKn7RhDfnFAG572d3aWWzDCPIgjvKkzRYIts9wmFoKfVmKs1
 XU3lP9jfZFtjb8t0bi/G3BXYMqTd97YnryJYWK8FJyneuqUFixAJLgEpUJdyf6pmymg8nL29O5X
 xP4TqD7cHZvYdBJb8dj91tm6eaAQBYzTl/1JxaSeL1xlVAMHhmCCCmPh8CN7nVf9v/7T8Rezkj9
 HQAOJHKjJEHIG4ucRhbl+3Ra2iYOyYEyH+ym34soqt8wHZC2djD2rVrYJzpHHpr/fFEMcKb10jc
 rHouSRMVbbECIGYiSReAj0hJBaPlcAicoz6+4/cKvr2ba+nvBrk9z+5t0+8IruMd7sDp+Lrui52
 pmDBVat7bIMB3nTpsKzaIsgfY6WXIByDtXFAlxOIeXwFIHAAintUcn6M1U3UhjZ74uDAdgHWKUb
 iq5RB3FEUczj2HOnUoA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04c5a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lX4hch5PzS7iFd4KNucA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130185

Add qcrypto and cryptobam support for kaanapali target.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..941c9b131a4e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2541,6 +2541,31 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v2.0.0";
+			reg = <0x0 0x01dc4000 0x0 0x22000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,kaanapali-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1

