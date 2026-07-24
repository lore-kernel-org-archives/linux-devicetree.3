Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2984D3AD511
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877589; cv=none; b=FvlGQrYi96eeoXD2iAGRwIYb0TrGS0drD+T/wrDY2GKSFmhASj5bYjpxt9fvOig7Cd/zPc/ZGZYFi6JgjqkA30rqiY+SSNOYRci3h2h5vn3o+aZMKbAKXi1Cdru00hjstzsi4EqPi+fk/WM7O7B2fXbJWInIfjlfBxZAK5JPKUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877589; c=relaxed/simple;
	bh=Yo9zeGbwbXV4rUNiXUL8lzuk9/G4RJrD++wGm42RLkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lL8bBlB0uea6uh1VGLlrfUwpwXnvTE1tMtF4H6eLZB8rHbyeYIauv5AR6Tp7I772Yv/vcP8mXimc5Y/kV6DY7xt2qcuNOlfFeORapbQrAT91bma0MZcGYoUrDQRVMazU3efMPUxAfUlvUVU+VkBImSVJYkoSbRES1aa5HB7KaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNjt6WWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXuS/oTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNjt6WWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXuS/oTQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4ljY62099585
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=; b=KNjt6WWH5tvWXHe7
	unp+sXXcCLjGMuI07DlpqLnEuuZXxTbUeuBRjiFsDdILuuYdT6RQn67fhXiTDbnn
	1aNbWS2ZakqlYwG2BK0QFViz7UIx7V8dMELyVBz9DApu+AWSKN6YynjDr37j90I0
	FkmjaPqC7NzrAqRbzFP/F/PY1ghIyIpf8UGtcDzUdgK3MYkX1Lri0k5OXQGRi5U8
	/Vck3er5tUHatkQMKo0SfbU7fWPIJpMH5dJGg7QQ7m5c0lXDH4xhBHqEvAQGNHu2
	gyeinpp3e1p8LAlj6bhogJ5aqft+nvxtHTtK2zcdg5i5jvbMDxaUsJJ/uOGFJe8M
	PJ78Og==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahssqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso2312855ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877586; x=1785482386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=GXuS/oTQXr36QJe7J/VCppxop6mRqR5XJcRZzIQUvPzvqOCG5P7xp15aEnEickJmBX
         Oer4NpUfdYPZNJ6H+uGnz2/u6zOyiQ+EkH0BIiRnqecdB9IviiQm8HX78Q+Nj4qwxFw4
         fGabGdPj2iS+5D6or7uj3hm/zUw+Y4AliVvmFncCGBXMVbM/Id3AR8fl/U74/Siju1u+
         oSuCW2puVTdtaDBBV0vL+WjB16S9fAraUHv8GBMWBhuPWQMFBQL26FT/39O0fntOcLnK
         WeuNRltv4QwGTxX1+t5TeU1fsbZvQ00hfv0KlPPP1UPF20bQt3AXPIOCxGb/cf1OuCpo
         wPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877586; x=1785482386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=rWt2yriXQFccOnOOcV68+ZPF+p4hkw7rvm/ZPTswyDlrk6ncgCsCE3RTvQG7Qm9z75
         rvkWW5TS/1Ls+Sen/C40R5cEQgtsUaBLlb2lU/7T1RytIjf928DKParsbAtqF9WeTYO1
         q4HY56P6NdSxuXFNpK/BV0tLjJjdtMEosKI/OxuHXZKwIdeVx60R5ZxpSSm95i7mZ+A7
         6lhwwkx2ub8a/KG651BuL21qL5mffy+xoW5svcBI50ueCfBokUHRRPB4YCNK/HIjEjnt
         ZMPtxbja4jpW0b5vPbE9sA5dLEPs9di17WmsSGtYx3cD+jgZCnB0ZxDQhj2khujkaBch
         NbLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFIuYF0JvgsyZSY+NCX0qEocs9LcG1N9xeqdifQJWlwIA1p6xy+VYzHx5US7omuARwXlYclXZN59Rm@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTqnrHhu+SCRREhBR6Eg+ImjqY/KwId6ofRkVcn1GeCTVitUb
	zXgnXj9NfuXIEMhYUSEZ5dQNE/TygAQDK7jOQrQMe+7V62nraFq8KwQLba5ipDjmzy13LWzxq/Q
	4NftJzzqGLHipJ73jfcQAl8FVVlnS15lGAC7ErJSxjK0uBRsuLYmj+E9SEjRiwD9f
X-Gm-Gg: AR+sD13UnpfOA9EcZhxdCJr0vjqM1/JVzkKHrHc9OiY3/7GIaJMShtjsuYCy4sAp4UH
	3ma83q+r7sMa2MowuvLDRheTMu6bANXpT/CPikN11M8SXc5J+TM1zwHhWQKmJvrxZ+sKfppO4Rq
	d3GnZpgTJZwv96vTNwuGWxmtQs48La5ahArbbFGP3gfKMRhx+s9y7ZISLNLBfN+Oki9Dlbbok5e
	YcQl0UaROBcJ2Q1lQhWmv37V3OnBVHIbftD6TJ4jbN2Dn8J20EdG9hULrX6ju69cucOAdF7IY/v
	sE73Zr64TtTliTVYeDXoTaBz1bfsFtGV2nG1MokEr2lhRLzc0IQOYQXwIOzPz4DOLWHWmUGCeBe
	7VEzjA4H9R6rbaQg6ywu9VVTp07S8grjxmtjlracPqm2mu7Fh8fF+ng9SLa6jUiHsXUwtchQuvn
	gDAiste9NbK0UiW72VPbIJyjataZ8=
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69962805ad.18.1784877585515;
        Fri, 24 Jul 2026 00:19:45 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69959385ad.18.1784877579885;
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:13 +0530
Subject: [PATCH RFC 08/10] arm64: dts: qcom: glymur: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-8-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2333;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=aJgvkeU1hYS46AIZM4QP3B9a00RqrtIO/xjx76HW+fg=;
 b=hyNDpepWQq8DZW50Hf0XKBhuQW9YP8x4gP2ntWFWx1ni2fW0+zMs1ZDdZWb3Acb5szBESdj+M
 y7/hPXttUVHB9YFZsF5+60PtQo990FpWQysl1rMZga50QkgkPksdsW+
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXzZSvkYJ+QKX7
 THLdphtRyypCwgA9i/caQYvoBJmeMOowhn3+Y5FmDMJI1+XQl8uE4uHaBN1cRGuhoJ2Jdk5Rkbk
 ktISOH1trpNecifOd/MKs95QUPqAY94=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a631213 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Fit7SRjq1sIfDMt4GUehR10mHY17AyuE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX80+intnGBFox
 CbMLhTd+PKhpJo7UJfQ/lVP/qZGhwL35WErw4z/HlDxmhteuMf6vCP55L3PRCgHjSSEHgDF7Dg7
 nGi/6x2a7YDFtFrS/gjWOEA1ZuIWqvNhoOw/1wVWDmpiSI8cN9AxFSV6LJl73gGVs6QfBHJvN4Y
 HdhJG0dydyt/TRQFPAtpK8ZM1iNY+tTWFJn1dKCzizD3+66p8Tzkqa8auR8DtKmKq7182u/6rIg
 WeulKDD/EhQ6xbfQNcN4zso5vKp3bp+74FJVhgVgoT79PIds7BFVI1/8YeR6OWRuVvbcnEMCV3A
 o25D+CwhQmgZBm3VOKVqJsgAUFqk0gzqgq/6g7tPgK9hSB7O8fyaDszMv6I1wXQORxO217lKEaB
 YhL1oRFpwMWpDpvZer0pJwfTXz74aR6Fs5SuE3UN6CeA4trMZteg7L9HscKKgTpnkjtODgEA6HO
 9UUpXk+h7SQ5dMqWaQw==
X-Proofpoint-ORIG-GUID: Fit7SRjq1sIfDMt4GUehR10mHY17AyuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Glymur SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP). Add the CPUCP mailbox and SCMI nodes required for the
QCOM SCMI Generic Extension protocol to probe and get functional bus DVFS
on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..32ac471e6727 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -420,6 +420,20 @@ scmi_perf: protocol@13 {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		cpucp_scmi: scmi-1 {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpucp_scp_lpri0>, <&cpucp_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
@@ -7658,6 +7672,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x17620000 0 0x8000>, <0 0x18830000 0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -7842,6 +7863,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		cpucp_sram: sram@18b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x18b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x18b4e000 0x400>;
+
+			cpucp_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpucp_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		nsi_noc: interconnect@1d600000 {
 			compatible = "qcom,glymur-nsinoc";
 			reg = <0x0 0x1d600000 0x0 0x14080>;

-- 
2.34.1

