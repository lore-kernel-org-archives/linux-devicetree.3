Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0C3FA5C2
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358055; cv=none; b=hJVe6QPOyQmRrWptFs4HlJiYnNS7bhuCqkCM7bl9ec+jrZK4XBAEmBfMJlzpTFOtl0S8ornvtkthdz+JngaNtl/zRmOCNSDqSd5+77nxn3g6mbOHKwM4zawgtQZ8OFmfbh/WcFNODQmNvZrgnVGwVoE0hG2AvW/A30tVoDxbvyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358055; c=relaxed/simple;
	bh=J81J+LY4cXmCfiCa4VAaJsCHh1Rz+x6O0P/2zIEpnlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ii5XnT4n6LYCAhJyOmRRAIFI1JP+KcXQ9wk6rS6Sj+l1aKdrpTb3Ct8qgIXD+emXX3VtMbzd7AfupcdEiBSp9/gSvdxb2Q4DDel50uUxCro+INBU1uW3XGM7JRqVShquOqLJjhP9t5/QUT/YWH0n540fwGeZTKS3xI2CK7SrDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRASGFuX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9ECUu5H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRASGFuX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9ECUu5H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xhc72322926
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6L8r7u3kRPBrzUycGNBvVmzelB/6ESNzHI9KDr8D5E=; b=DRASGFuXd3ppP4MS
	ewLmqstG4/Ue6l6HoHa7ByUDGOGOnbnhmHGbSQ6GqsG2lYyGVkgLGMxnYjGVtBAJ
	mB4bk3dORX/LSlKwPhdVXuVwkfXqvcx3sTbNiJD0zvF45PryJkrkY+vTs4iuv7bg
	ZRp7hueDGSTHBdydbR/V2X3NRqRDm+4ZCZUslEySteh+Wyf+Pbol4AX3/NS2bBtI
	iCn0h+ksJJu1hHF2DqSa2se1sWr+n4l7ocMUmgOPOUXBY8O7wi8cPdK6YDQJP9Wx
	uWQpmZN3QABCeGXbCiWjODg4XAFGsRvpacuLpbB50M8K27mdA2yuipCe7vtPZdUV
	pRBQhw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkes0j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:14:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c63f85c84so408082b3a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358052; x=1774962852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6L8r7u3kRPBrzUycGNBvVmzelB/6ESNzHI9KDr8D5E=;
        b=W9ECUu5HtPJ8WgeEJWJB4uphMi0tB58ZFU2oHk7tJcYzbzB/Dv0jrW/q7JWkzsY6/q
         5U/c8OhiXbQ5lvjR20ETTgaBONfwUIXv4MLlDc1HTD3aNlhYUXKNbn8uId4m9U+lQWjh
         iB2N5VWlMRTp3LG210q6XB+A5+5qDSJ1RlAgAhHBxeMKbDGnw6WuGdmxoj5S678gXLcZ
         ZhLNQ9Afat6PNqo7RyuvZkTAynZmbAIuLjQYasmMg+2wquwNKlCUuHmcITLsV5le986U
         pn5EuXGgPy14XleJrts3y0hV1KUWe/pZX5mK0d5oCIzLWnHl3A1dQZWSkVf3JNzQHVKT
         Gx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358052; x=1774962852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6L8r7u3kRPBrzUycGNBvVmzelB/6ESNzHI9KDr8D5E=;
        b=PN21ofon9hi2q28/WA52wM+KBOOWSeq06TXbiVnERNMwKWf8AWKy6TTXJjeLvmtPoH
         +CRa0rjQnLxSf9HRKb0vb/wpNknx+YLtmckyQf7eJM4RG1DVN1f4kZRTfnwxEwk3TBIo
         c3ZrYe7ZuOZhaCFRpG95yfcCBY/JDCEVjWF37d+JM8CWMZNNmuSG0rl2ufvrni7411+c
         rO/PBttQydn/xptrRRlweHnxH9ON7cDlmYNaJnJLROENaouvZhEqxfCFZiYOKi4AFOD4
         UPKrc8VeuuAaCueHsiNw698mVKieLski9NzlyoeB2rjg4SyeFI4bqTZKNSbmoRM9BQEc
         38Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXB6210ZoZ7e+IbwCS7BRtzUgTR2S2MsB3qhoyaCXOowwg6caZuLRBL5oRYE0EbflQFTe+J3lcNPJ+Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Rh2DiLquHlOnFr3fQql+vdCREi0CQy3toRV2TA7m9qxvFDk5
	jzUJZECCde/0d2TKt3QAgAbteaP+MM5rJsoQna+TL3cyAnsnSv+CtaOU3Paiy+ZrqL5jA1NRvwd
	Ntl17mhbjigwpzvOLgaEXFcM9Z7BXjePpQdKJXgFcrXqO7w4OSkJRKMMrJMFm+fer
X-Gm-Gg: ATEYQzxjzJYZ9CkEZCBrNED+kPzWO0IaKMxKM21TljKpGRW0Ko1V1jcsNiAHQtvgR0h
	rSEaXEdLkV8c593k4kk5nsoJvT7WTQu3b/XC804EeYd9acuDcxbk8uncctVOvQ0UAqAJOeSyIQ0
	q/llzul2cZby6MyZJX0mlBxgFCdJvd0aUDQLhNG1rUnCem5XaMdVRwgS08AHiPk22RXcheKQ8wp
	OpBVnC2CfIrATT9Tv1s1t1ilD0orrUeB64XfpXzmkjnc19pIN8Ly+HTuL/LHeS6CyUZ98wZkZo7
	0vnHyZ5Dbc5zqjDqN9pbCgkis2OPMNoXSwrFgeuqFmgeFk6ox1FHJvkGvu0iYllurIP3stGJDch
	h5SnDuc8ZIaXdcKMPO0uJmLWZOnIWBtYZIoB/FMxJCtDSVshMMTYZgsnqWQ==
X-Received: by 2002:a05:6a00:ac8f:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82a8c35cfb1mr12912730b3a.30.1774358051074;
        Tue, 24 Mar 2026 06:14:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8f:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82a8c35cfb1mr12912697b3a.30.1774358050541;
        Tue, 24 Mar 2026 06:14:10 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:14:10 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:23 +0530
Subject: [PATCH v1 6/6] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
In-Reply-To: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358021; l=1241;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=J81J+LY4cXmCfiCa4VAaJsCHh1Rz+x6O0P/2zIEpnlo=;
 b=s2as4jZb/if2POrhGPP6bsTXfyAPk2SizEeol2/Y4TkuVyXAj4YDqafcBA2ytSSCtp3JipvP5
 zK0i/PhqDyfCwW7sYlONDOqJt4FvUgAWnHr7EmM4BSlYGzWxQINSqi8
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: 8OOUwW3_Km--eHUK5DtHzt08nYC1RZR7
X-Proofpoint-ORIG-GUID: 8OOUwW3_Km--eHUK5DtHzt08nYC1RZR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX2yMGokAU3Y7J
 pGa2Ut7zyYJvfjt/mUb7x1itUxreoZoV3d0YlTQvX0SfQVlqMmdxrqmyXCO10UrBQm+K1sAicsm
 uIAiVbyXmOAsVhauUQJyF2xc2H7YjzzOHx8/VkGbmf6RuW7ZYWJteeIzzOp17BDGmJvOeU62P3U
 GrP1+Dch6aRFd05wXAVOQ4ua+06E8ZJUOQUNwijpCdWUQKdre70W7GF5pY9nm5DqKk0JQ+bTlnK
 Kruqrk7OOdPj6yp2K5K4LT2dLZD/uyOwNTzXrqHLJdBFmC0Azc4jcsSMu1zCE4eIhk1DhjWwLP7
 aWl93l64gVTeq4kmsMWXIUIOM5jPeRApKedGCmkZW3qHmLFqA2MmHp+QTLrIfgcChK3l1qAIwdb
 zsjoub8v5fdSSUF+cqyjBGY1xK+yzA+91mY+AfzotmeqCBMhNhUP8ayDpPiR6ZApKiPG0nuhbs9
 UAqALAdb/UGmVQ50qZw==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c28e24 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=L5xbH5DL_T0GcX1SYtwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without this path, the interconnect framework cannot
correctly vote for the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..7093b39e1509 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2864,9 +2864,10 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&config_noc SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QSPI_0 0>,
+					<&aggre1_noc MASTER_QSPI 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1

