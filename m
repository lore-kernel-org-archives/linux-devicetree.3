Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE0B4D90BB
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658854; cv=none; b=lE5A+FqOsQEICEhYurlqTQOQHl/poSEYl46BDGKYfxxCsI+84plMZqQmse3uy/IKhlQN49fo4YqTkJJR9aKJutHXYRMwPWrzk4AdAgUXuJ+/ZPJqq5pV0H4gkMO0hjG7XI1PhKvMNxyWP2uvTj9KNAdTIR6/a/lvHGkWTJ1gWnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658854; c=relaxed/simple;
	bh=lmfeiGbBwsnfJMh3zPZRyUz9zunZPCI0u2KmSaIagaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f29hEgqh8zOqbXZRiPSki1gbN1p6NZjkoQRbviQrrvTpsRazpq6Q8fulNBrIe0ub6yF7FMpjj43pRXAamLeL8MdU9n9p8b0uEa6a+ohpiUSV2mCfAw6pFBXslclXIF0cO/q5SO9JXMuPNaYPQjlbSrIXndH8u4EGx2ojThkAlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIyjm4vR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CitTy8Vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIyjm4vR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CitTy8Vg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65598lN73603450
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 11:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=; b=fIyjm4vRpixDD/H5
	lB+CnP6tPU0SNJdDqrcDm3kpWb3iZrK5I4ZuFpVWyqTwVasp8ZjxENnDIdpsH1yU
	3o+tV+iQwKNteaqVmWIwrNmV3KL5jX2ryruEDZGZk9NqYe+EvlibksWRv2GV4a5m
	2FwzKhnnSayLoJVdlRG45h40tqH5MRypBR5h5XG+kUX51/733KURmziNQALVzJBn
	RTCgt4ej6IVZ3WG/KmoBz63V7b1+wYeUT+Y872sinz6TTuEcKP4aOj49kriTUzPN
	la6vgEpW5ek7c+D9bkCUKcy7du3s/t4GpkwZOMLmDvHukKc4m99KEtZScTP1OPyn
	DekMyA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhfa4j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 11:27:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422382178bso1220249b3a.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658852; x=1781263652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=;
        b=CitTy8Vg/PGBl7r5haUFlDLXx4LC1t+pyQoCZ2BtrW5sCsQYykMi8v3iQuYWZvE+OH
         u8ejmyf1jNrU1+qg9l0aSRzxxlqLvWPcjdESJFu4dndvsmAfZ8QigTP/gwC8U/1M+WxZ
         52Jy/8Pr+4ZxE0Xkf5QcHop9MZOs+Md9pkMTc2uded/XulKzP67My/w0MT6LULUuzcpE
         TyKFwF26x4IoYOCUwAnjGw99Q+9CrvY8gMMKjBCdSkDBY/SYWXVLL/RXE2qmwO4m3rAv
         nX06xIgaBfjUzQL/jjOVyCeKGYGT7LCl94LP2tmxDvscfJ1FmIXMXiTWr3OSmUT1GvEy
         yPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658852; x=1781263652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=;
        b=FRlLs2Shd4WpWrH6MlKQ7LauBCKniKDzHcgZ1gIzYGAXyfaosNvl4e4jVC3fNS2vvz
         DwuoRmIHaKyWfPwXgHkh38Q0TTbinrv/pK3vFdjKlsARP2jumi3NqY6mYXa+A3B9zSyM
         hFGO7w80r4L6zfaUW/BR2sgpEKXO8nKV18oLF48+QHD8/+IUBi4ivt9mcFN6UllQtFM+
         r+5pFG8EEswHdZWJqbZtbuHB7PN85yn/D8O79iqSjRHwOcpc411fYF7cJPMwUSUj1WE0
         BCrU0oRHO7wFCQ6HiiUjTSpv0s5BIw5vyaeSG6CsC2cZMprqZrhZkWdlJmVk4enLwhsg
         BNUA==
X-Forwarded-Encrypted: i=1; AFNElJ9FQPCVQ6f8k+e+GlerEac20uyk5lXm79umPM3zDa7C6/gbmk04zLv5B+OVNmgIwzo9BWkWIo83a1x1@vger.kernel.org
X-Gm-Message-State: AOJu0YyB2jfX0kLzz0l++m1ttvawoetkeIGmabUCWPpbnSe9mXBzcDr4
	nfe2MnRVIAO37CbsuqCXeUv/uUkzt0iLZAhwRXiXwXJSJkRXjBvGbmntnSxO6nGk5ELcOJraFiX
	5PJ4Y4GhHqpxCoz7kkOq64ZW7vUoBNcQqzTloSv8gYrB6Dzj3c27EwanCJlhWzx0H
X-Gm-Gg: Acq92OG2aJHJh0R++L4hIap8pFi2A5jUNO6KuFy9/4go2Qem7BOTGQaS4czSV31UTla
	lkJB1tcm2KJYlOhKMbZmf8Qu3Svs1kbaPbb4dMKQoYpVsSS3Vf5Xr6GHNFBSe4tqjBlt0gYakka
	yYDI1WOen4/sLKLgc/SaUNjhU8qtv84Iuj+3/YDj1PpEgmdOtvo12JLU1JqSRyvy9k0UaAHhNH1
	zNRJ6eIty1pRIRHc8JAy4F9rn+3mKTUjfXnu7RcUk75x2TxLZJ0mKjmcP4SmZFzpGXLLOhwAlS1
	0nI7H3AM3Eg+YafuXmDwHFjHkngslfLmo4e4VblxhqSjAfUzgH4XHFdqO60+vArlHeTVIfInyX7
	6jVBMOLXzAUBPtDy8fxe/QXYXjkjTg2y9z9DHfnU6md7hbr/J6z37yCj+Twu3VVg=
X-Received: by 2002:a05:6a00:b807:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-842b0e1cee2mr3086264b3a.9.1780658851494;
        Fri, 05 Jun 2026 04:27:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:b807:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-842b0e1cee2mr3086224b3a.9.1780658851017;
        Fri, 05 Jun 2026 04:27:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:30 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:33 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX4PYe6THTTIuy
 5uLD5mt5Y272ppbSScEouTq0HAwicFX8kFZ/mDZKnDueZXRDO1XouAFjwRupqLokrjukey6p1ph
 EU8BnI8Kz9HeZIlBu8Ot/Kjl+xQbTMLwKuVcyMdlLQyWags735PPGJ1zNHpPmT9PN51ogek/Ku8
 nKV7Mw+KmwR5aWMYUaVSVEXR3DXCXgEYDEcd4BNh8CQontavGCAcw+RmPvtlM919/XgDARnHrgU
 /fNwsFOLSFvtWq+mZvB6NcApb4uNfRagjZfjd52PEJiHJdhK35hn6KwVO0M+A0ZgGm3PecxWbvg
 DKqpwRV0cfyFTe0u3Taf+Xc99vBWBMU5QLmyuJOd6VwtaIGdCNycfd2lyxmM2XialqPnBtNhdnO
 O7RaQ08g3SMvS0siqpaeeLQGO9jlRdM/cvJfFnpk6ruKx0TsaxhghB3VeTQ3TXIfkCq2CusRB0Z
 gVX8MyKuNWBhKS/graw==
X-Proofpoint-ORIG-GUID: LLmOuMJFDjNK4pl60ZjoGBXxvZWq28NK
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a22b2a4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rDU0rDU2gfLWSAyRyQ0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LLmOuMJFDjNK4pl60ZjoGBXxvZWq28NK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111

Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
Shikra SoC. The CQM variant requires both clock and reset support, while
the CQS variant requires only reset support. Update the respective device
tree variants to enable and override the node as per variant requirements.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,11 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	compatible = "qcom,shikra-cqs-audiocorecc";
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-cqm-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>,
+			      <0x0 0x0a0b4000 0x0 0x1000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

