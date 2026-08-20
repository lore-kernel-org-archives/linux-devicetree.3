Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4EE3093B2
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220573; cv=none; b=D5FBAYEbcHAfx2rH17GLDEAwDlBBe3bX0uyt3+WW645VHURDPWQqXRBoPqp1Qp9hYEEqUtUwG1w1YOCLF7Xx9zXPmPhLRgCWGT22CewBIdoRjEdG0vZQENvRb2StyWSbHdRsPkeYy+7lA7Yx3aZMBIMxslRP1cwk6prkFVsJuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220573; c=relaxed/simple;
	bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCu4ChvQqdJ/iMENRlc2nH2W5311ZKAeQB/DSnE/jBbpmretIehrYfTpoFvmb0wJY48T2fikeg8+joQVeGf4z3nUVuBfWjohJOFF7rTLBvGfp7BngIiiQO+jT+7goPji9g2ZbxVXielPlia/WN6er2SNgXxBGQwpvHprBpHEt/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BK2+B54d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH7R8S8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BK2+B54d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH7R8S8Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2jGV2932678
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=; b=BK2+B54dvupZZsTT
	BYixDRurolDUTEq1z+b7IJScAlAkzpJvBmC1TNs5025MuI6fCYeft4D8srZlxYSl
	8cB+eVYGRQ121XaMBNqafdKeDVdzDUmHfvU4AFwRqwEJZa8ViLEAFEUfJMojmFAn
	KbC97grjfqD82AReLwBaSwCNgJn8DSj3oJbeLZA2jxQrxRReUuFPmT/l6MI2qDw6
	6/jDtrzXLwuUibAzCQEHAuktvEI+3wIeM0aiz2fJzN5bTcBagO3HQ1umtrAdfxme
	ngLaJcLnMZhQsy+ZRoUczrvIdoWBq2Dtqtidn0iiCi53J97K3YHBITYWFmOE6iMB
	ft8AqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0g0ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934979ee9f1so256266085a.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220557; x=1787825357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=hH7R8S8QQlyDmQnvGASgvQQJmmNWa2y3fa1LlZMXw1ewPUbNAVkkuCNCqlU26gPoiv
         ArpFxCvjUvTa1/nyvBDB+UcnrfAb8Pp25DI9NTJTgeklONNteBI8HSqdi4xn/JWmaDjm
         x9I1XoSYczFNvtsD+99pWRuPK4wfbBK+pKLZZVvmXTZewDotWMK7yRKlqfpsdXYPfUBL
         5Bz/JmipR401wP03iC5W955OryPc4O9HafBtqFtC/ueJDAdsdyPXhNcZ9ZCOlO1ZPGO+
         fKx0YhZkav6hUCimLpPKmRHUAfexVkZ6WsyFqouSBY0QfTAfUgomkIFEpHNlYzkXdHM9
         M65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220557; x=1787825357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=l6+Nu2Bhcr/96fNuz08QOLOFcaIoyhXudqL7MF7Kzyj3gm99DDUGTKRJQBuNVKndWU
         UXZVuwf2mfpg6k7mITCJqVYFB7hY2b/s9Nhp8/3NWoAhrwY5u40eV12BshUn9lA3qvy5
         uFZBLKxZ1ae24vckd6WDdwKN60fjMQ+njSVhIYXznzv0s57ZfriAE1kEM9qQ5ZayoAup
         VBE2YltfG3eAS2s1b4X2/gSPpntytpv89WGTbRpx7HYg8gP3n5y1RXK81ZLZbvYbSrHy
         c9Y2Ikce1NP6ZHqBj4J9fidlnzAsogPwSJxrU9Flh9lvhSeGdSkW9LDM8WUV5JLFBnOM
         NZAw==
X-Forwarded-Encrypted: i=1; AHgh+RotYrQkTFxOyawmK2lC7ZBqN7H9RVbl96jjB1PS70d/rf+SfMix0S3IhcSrM5T8GcTtZ6uL9vCpGXie@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQCKc8IOqq5w7V6JHsaFxfkSTnlO5pNIbMniK4OF6b9CwimBl
	A3VzZ950G6+sTfMyMnMrv39ijPaxNlEhq3wwmwNogfiOq7rBECA+4n+HeSpNE9Z3+SckDNFxroU
	BSWbiE8jblPsNbYFUpce5DI+qJx69+ggjnookjTR3wIRDPerCGRlf0qCUOANqFnji
X-Gm-Gg: AR+sD12bt237IoqcGu7A5bo79bIUGvb4x87KRbaoCRCnQRsoI98BiUaYI9NGy0DxOPy
	5psQ2qtpWT27BHN4o0qoHlKJ0AfwARJJapC7cmNHajN5OYy4wkXjlKzBtvdY3AR5pdpB7NIGZpb
	ikB/qBT6ivcBaNXVeyX6p01HPZOtpPtfrMiSaa0R+4SrPKPoRWC/vYGVwKscKT67YBfpzKRbFzD
	xXb/Nfvc4an0BukbsSBXxrXG/GvPKayLhGkJvpfElQ05hQZXDuO6R28azpTExDD9IZqUngkLJ3t
	xDdPK6CerF4WYpes9LQnSqsuB4bacPMNyeAUg1/ygAc2+uA7MH72MYw3fcFPqIozKvcQ0RpP8gr
	4VBeulHme
X-Received: by 2002:a05:620a:2a07:b0:92e:e559:fe6b with SMTP id af79cd13be357-9371e2cfecamr1031510685a.7.1787220557338;
        Thu, 20 Aug 2026 03:09:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:92e:e559:fe6b with SMTP id af79cd13be357-9371e2cfecamr1031506385a.7.1787220556774;
        Thu, 20 Aug 2026 03:09:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:17 +0300
Subject: [PATCH v2 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-14-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIVLpYIxSBIEuiQp9TZbk0CXTvDRPRG8Tp3r
 TXPxnGOyV6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSFQAKCRAbX0TJAJUV
 VkvFD/0TrOKu2iYWL7PYb0LWC5qqnL0zbc3LUhTHUOl2ycftlYj/mKiPgpRclzjs1DxdLMwfiIR
 DskXa+uqg0zl26mSPkVK79VD/mds09ihlRFKGwpsysfPWIn/GhzktOu9wprZ+IxJyaLmeOqQiLn
 GfSkhLaPlb6QaWu7fgBcxSBOu50MW0y7lJSelNYMM/FObIqiv0BvpuValrG/wwCEMticcUe9lxI
 7aQv4e8e9I3kDul50cxDiEX0smLhDbG/ubrFmkXahwbCNFk2cXX4mMyu8jTPBzDnrFa+zXPi+Lk
 R0o3aBeBSPTjx8VsWdFIRlbq57o77Di3GKqu4YGZIW9vi98+oAXPA16MIePDW5exuEwC5QyhzkV
 E6NnwhabQg2WlXtbc70qXl4QfIjUqiwD2+FAzMUteBufvfZooEbvYf3BkCUNVxFHZXLVJVP6uPm
 stp+D5p0svW8TgzEWj+ppfkiiRBcCVmotad+r4EXR+CwIq40D8dfgJdB7eB7OUoi3Fvx1ciCF+H
 4YgP30zvrAmt9WXtv11kCyh7xWoAi4lpTPXD/ZfxpO5iTn7QowQbXTCziq+CZ6riCQbM0TY1EIK
 NpKRzPfuhWNdfYS8EGGK1ets7y6FrO5aP+EIvddgwhUiTB+2LVJqy/pgLyC1eqCCatycSu/JY03
 dJjmTYFe+1bvckw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: adcJ5sIEDQ5nGTOQdD3ltmyzNVOFD0t4
X-Proofpoint-ORIG-GUID: adcJ5sIEDQ5nGTOQdD3ltmyzNVOFD0t4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXxCzXXtd1nKBX
 ctALpd/91RQL0rBYeLorYhcxA8ewtUi3yHXkZK3NZ9kSbAbT3hwQg00iugKQAVeD8a1mL7U02KV
 QWZv++cle1Yy4wCGlocHAoBIfOAGQjaFG0YHX57eW3zdUo1AnW9yW9IMuyLsCe1R0Wcr+8vPM6P
 4ofLMG9zdYjWvIT0N+oVMuzNKPx8ikaLtVtfR746q6nogC5xFw4LqCygNE6HFLZEo1GHFSCRV3J
 ky4uGmWDlQioZnlVBoSHgoxHikIdNHliyqmiM+97oxWx5EGLedkRcT9ydFoLNjcwC3hTK+0jN7I
 2suDj3X9Y474JJYsyYV2cL39OMOFJlgVcRaGPSTBK3Ii4kIGBFPv4q6upkQ02HNUCb8/FbHp9DK
 nShjCFRfKByohkL7y/u8WIyM3sIbRhxgcyAFNBJKDvCYVUaA/X+d/3q+u7Ag7ocB6njGhp+bjyL
 9lfxb/NnXBTqLZZgVMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX8vQexuAj4foM
 HOVAsYRtMkt4/gv9meqHqiXwEDDSPnEfiqs8Yx43zmPV0Kf/XKkUzKsgcSL6oHbnw/KfQndu76K
 JBYdYhQ/ZbkzoHD1n4Ju9oQHQzzZKK0=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86d24d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..cda18d4dc6a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -676,6 +676,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

