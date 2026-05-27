Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E85B2DECBA
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860252; cv=none; b=hegZrKyOLjU2ZPo4cou35lWDvVPjSkxh0PJvxncxdn1p5UL+yvFL7xyWUXK3Ya+a6ccKrxf2q3LaNBVmDvSsXDNLyHAYZ51DV+3xJXrIHgdrDbB/To9Ob1kp7RwWgbzrXhSIgbxoIqdF2qQAfNnh/vIcaX98ax7+/YUMAE3ASQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860252; c=relaxed/simple;
	bh=BTH6nTAXC/KuAIchvlkMkIC0ei+c8gu3isXqJezhZKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPlztAN+IDnF3CShtCcPq57SYG7PljqMLuw7PkQyypNlPEdtIp6bO+XMBJXtRdODujgOP+USWn3kkttl1A5lR4vEROCTjkWNYMr6Wpv2EiaUAxYaZpg6wtrKS5D5Y4/XSsivqS/jOv1gGaL0HL1nWe6S4z1c0H26ygP113RbSMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhXaZtC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur5wDkbe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhXaZtC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur5wDkbe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2WlnW190179
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAXXV36i2LQZgLrwaGCgB2un0YBjbCrnXi9C4ta3F1w=; b=AhXaZtC+2RBlkkLW
	I/bxAzXN7QyqbTcS5ivhk9KmqHjmEiH1TiM3zDrS2eAazUERdjaTirDPtjsEqCl4
	wTpHbkTQLkUvdXWnZToYuwMXOKjWPSN8mo3HKu3vqa4b4gFBWcjvnUib0T11WRCz
	EB3XhhSA93TGfarY8JJFrw7bbcLOUZ+4jUIJ8TvVs+a3RJ85zYa8mMFS7qdqz3zO
	4gSQyfRB6khYDRlb6nWd0AuHagO/EIrKNxltg0UXzbcZ22R0Gipnv/CtzvEuJrkf
	77kNeTovq+TBzdv7tHVNrsRlAx7guXOtnLgX4OsP/467MTym6sM2leGiRhVo0km9
	/ADGtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh179swb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:37:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc977e6aedso121489625ad.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 22:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779860249; x=1780465049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAXXV36i2LQZgLrwaGCgB2un0YBjbCrnXi9C4ta3F1w=;
        b=Ur5wDkbe7bnYJYw0ov+je44s7lAO1NvDZuUOuwyaCI54t0YklA57rZs2wdy67sWFMA
         tBowaiyKi9/2/D+nYphz2Rq/ZnsieglSmPcascb5FzBVOu+L4C6eNSbqWelV7EhvuN/m
         7KfHaVuHqArMvM0fDn5amCiouPTRtrnnNVuijKDRprI/GfoQCSc3cSm3fsNGjsfHRiSK
         7fpObJtWaKgNXtYm0w4gN12EvTP5j8LU5/zgwXOYkg8DIwcCiEczXQByHcLdsYL4Vk2y
         B+h9p9klvpkQS9pvIknJZM+SRMdIPwArhtJMtsBdoeoYnv/peV5k+RqkwpIkvpDyYaAQ
         vNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779860249; x=1780465049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pAXXV36i2LQZgLrwaGCgB2un0YBjbCrnXi9C4ta3F1w=;
        b=NRX6vvJ1BSOZxj+R+fp+s62jwqid4hn5NtPD2pvQzMrJ3SmGPx2B7yo9B/5lrV+9rw
         KeWsNRbcmDAa6G3ZNkDJZ2pVHMPFkX7A+JBMyusXuwK0fkQa5MkVUJ+R/BJvLE4CG+5f
         mHbMLiyxLXmHt4sEtQ4v0VD0D6M7O1FLq7OeLspQ0L2gTY+Diq8V07zRJzDOb2qB7IDn
         6+OjzUEAnrj42LfvHnOuha1DFFjOij0tu0dr0qCXkGt2MHD5Qg7K4z+NIaQ+xG3U4gLF
         c/e8IlPgMx9aWFCHwOODCruu65UDF3zNCrfFOZQMjz3u4AP9105uuUCWW7zcVJFrW3bX
         hS9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9WPa9RLZhvijfmJmwfrFC/3cRLUMlpix3UbCjIZoK7+wLUUC7wnaE7fTQFt9xhmEnG7FU6ewIBo4O1@vger.kernel.org
X-Gm-Message-State: AOJu0YyvSNhMAv2cqQlnBPqwsVeVvNfDNmIpx6v5BnjOo86ptNwCREJ+
	0mysybNLhFlLncIBA0cNQkpZSx2ikbPR1Y3q5buMXYGyGeTAl0ZmV9XJ8wgvAxQShmOsoegaY12
	uBtzj8VnLXDOR3cOsdmC7wI/QOA6rlCep03DimmqcOXl+6A5e/XDBdNp1pohrut1X
X-Gm-Gg: Acq92OHtGe56/R7P36B6/NLakzQ5FQOlcFD+AaC4QA5ibdSy+PVWxErRfDf+ZqppkG0
	uZt34JHa8fPhFqD1auCdEEfERwP74vMQTgSwVXew3lXBQDjdeEanuVc6u+U+bgI/8yU9oi4s196
	AmaD899LlvutRcXZiNGZcjunxLrHvvrCDr05TpwOwRAJeBNJVhkIT2FH+ZUo9zdNic0gydCtlxx
	J1beFFGtv1bqAWDJ8vEbhUfQql7Wtxl6Y3pSswzl1NYjKu/+tzTVgBc1tyJGNnez56jyr4QvhJ7
	l+kpFL1ormejkuPPwQPRB/LmNGtBbP4S/qyLc9TVyCAnT31uoqVWEhE6NnUEpDDfBl+lQWnwxOc
	Q4ktKjoocJaGZLPfmqtk/IicAkJJeto/J855DDi9oW1N+
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr229487965ad.34.1779860249458;
        Tue, 26 May 2026 22:37:29 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr229487625ad.34.1779860248999;
        Tue, 26 May 2026 22:37:28 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm136338585ad.16.2026.05.26.22.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:37:28 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 27 May 2026 05:37:11 +0000
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-x1e80100_qos-v2-3-305c6539e6d2@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
In-Reply-To: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: nI08d83eUA0WbgrSreX56oxg8JY3NTR7
X-Proofpoint-GUID: nI08d83eUA0WbgrSreX56oxg8JY3NTR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1MSBTYWx0ZWRfX9s1jH/om3oVz
 7e3oc8wv7wkucR2lLUq48iz1YFYQ3S654/zZoSU4+8DEn+Fa6okcmLFXiFtMYwdUJzfAWQp34Ir
 bEvsLbImluLPmbOUP9LFfle1vwHobbXqmuJLVh79mwKsupEOd2SQrD4n9nvoRLUJGtj4MyBCJZR
 89FTgr6AFSK+p45YRwPpaSF051rkvscAz8L9iDRHhy7J/68DTJmTmN/G0Mj2l89d73vWzWtmG00
 7Shqq6vsoKulfFamH1hBNTFsibN5dkJyUZS0qZAQEDnihctl7X5oXdd4AhbLzHlpHWYQ18NTqcr
 aJM1twXafmAn/TMRz7fDu0s2WUhgCyjwymdws+W5Gymsye24dB1FQGyYcmSYzRaRSONfyBysU6/
 4J6clUbW99BWerxK7Ow9RMHcdiA9acvry/NwnOTWaGEIiAAluK7xbaYxEdSsxTPgVLaLJ75p2Qp
 qjZA0eh40wL87hMia5g==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a16831a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=k0pzShdNuwS7EJf8KIMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270051

Add clocks which need to be enabled for configuring QoS on
x1e80100 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..1a2d9b3f7a70 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3132,6 +3132,7 @@ aggre1_noc: interconnect@16e0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
@@ -3168,6 +3169,8 @@ usb_north_anoc: interconnect@1760000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>;
 		};
 
 		usb_south_anoc: interconnect@1770000 {
@@ -3177,6 +3180,12 @@ usb_south_anoc: interconnect@1770000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>;
 		};
 
 		mmss_noc: interconnect@1780000 {

-- 
2.43.0

