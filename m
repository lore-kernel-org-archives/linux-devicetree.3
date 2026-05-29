Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213BC407CF2
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086450; cv=none; b=lYTGUZpFKBz33+VozbN3m8daBirBk1OzYcg3ofpSgMCEow0s/4AVWLupMVrjqgfazwWsZQ+e6PjjdEH9vy/qGvlui0IQocbFZFs+rlGQpe98JGYju7Ry3mP/s0oKD9DU+y/+nD+piP6/mwvyLksA9nh7UvbJc/AZZbTQijNzNRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086450; c=relaxed/simple;
	bh=cuVL+gwQ31mrNk9hMzsr+h/PFasOty3vgrF171jnPSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TZNexWqpvLE2yC1d0S91NNliTTfJZB/JMCfJX2q9vAd6DJ4WBDLHQPtgGi11sntv0YjGFwa77pQh6IwbLtEPQfiMjVc7hvor/dITSSHcz4rghoRjaMM8YUvww0l6iaXIaKqXtTJPQp6YR4qIlpCqcr6kOgzvoUhDV8fVJUlJ4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8gqnNrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQVwoCjJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8gqnNrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQVwoCjJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TJZpsg4123913
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sJOpYNEEndwBy2X7DEJEDx
	OWb29hGyZcHdz+7poWAS0=; b=Q8gqnNrH+d73FZ5B/7b0Kb87w+wl+aPnNCl4vJ
	4yrSFDei/liTADlpIYurXwqRPtFbxi7pTaB5sTqL2jM/n45LvAEo+SUgpAtlF9yF
	Xh8Z/yVbSdO9ZL9quprFhLMuT4OuD/B7W8TlLyOG8ZypwEHLYHBYWZH7Z2e8/p8I
	EFuthSTvBk2SOhQ3OT+CkhnZgiZ4ZQgZKSSX1sIJfxOZftHLZ/8ttanWMRb0YqmU
	1wqTgEFehNTX5EEenc1VzWHQ2wgRI+3zAPhgA2vmbIFIbAMjSeqT6e80V+oanLQt
	9GSYoKpMOD5me/VUcBUMa+P5qBF53SZhtFp2GglxpOiNJvzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efh3n86jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:27:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso18101835ad.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780086445; x=1780691245; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJOpYNEEndwBy2X7DEJEDxOWb29hGyZcHdz+7poWAS0=;
        b=HQVwoCjJrcmnnBwcbgNeG78K4BNW4jfkYyMlC2OVU+25YMkf0nwJa2cf2HqI8StAl1
         iwARL0nkQuzterRpXN7zNfrNnp0e43pVPpzSSI+QYFTIwkhUn9ypiSME2wESW7liS10K
         ocPmQ0+cOs4XisNl5gL1djbY5Zq4mP4TOO459IYi2UV8AlZtSyLaG00PsQDsIH361fCM
         ZsG9+VvdRazm1JhhfUakiPwsFnYLT6K4G0H+WYAEftM+ZilLJYWKDWi6FC0Yc4WaHvcy
         xtU+KfXw76sbS07798/EkRznMSvvR3nXlqNaVPBprg+O4Asjx3VW28t0Pb6NuURBpool
         p3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780086445; x=1780691245;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJOpYNEEndwBy2X7DEJEDxOWb29hGyZcHdz+7poWAS0=;
        b=GNAAUkL7cZgI5Wd/n/xVoCJmxmwXGgFDbR1/XtKRaYo9PgMLNE0vnb6SQ44CQ6I2tl
         xhBT0gVI1RfZscQ1kU4zsFZNYo0mDkBv3DtvhM3AC0xTDCUMHm7l+0Q1cWH79aCKF8kZ
         REtXKaCvPnM5lukpE8hkOl60O1vxnz07Cx1jQmVQfhu6LQGSvNbXKFBd66fynE3GeMt0
         4iwUTH6EJRiZQluOhDFZS03FJLlKUUiGrIZSnsY2V71UwIM7aE9R31RDPoYBaiXmI62Z
         MvV7addc+3hR9ykw/JSMO+EsPtJF2bVgUJDdnAPEb7dEp2Td+5LtkmHFGaoCt1pBmLST
         PwbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nnwrEBenVUAM66yJApEv1OQThaZ7SbMoDyB6J6yCsdHfB7pgopRoD+Mn01CtYdC/mkBDBfTVyA+za@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqz5I6Y9wK5rFpW40XUpkIc6HENz8TsXcMZFuFEG9J77FINI0p
	0G3toQK7Kq6n0w/B1/T4gBFD+1mXas8dW1O4nOWqmbZCfUaFhXz7zErM57odadZ48d9NllYFDdC
	ZYshIfkAdoonSwKFRhxQL35Yn3+WBtuJwMAHE5hkgZmSoJ0DWMmnl/I/dejx525Nx
X-Gm-Gg: Acq92OFg4OxPcPvF9yI+gPKLWLxpRzBetawBnNTkFoxkLxd2DYGL8SAL6TG2Qy97ryK
	XN+UY0o4c03ISAtM2Nf25b1KFhPp1mbqpERkYybjzF7R/dPfAS3hjT040PaJ9jQ3nWWYqfVPRhU
	29PNXtHCw6J5+GD+TU8Q7kLnlSPnODd626EAILTj0a0PABN8zPkD13Wj1f7cd35ZD1WyLyn9FB7
	Va8n1UvlIryDXAGxejAoka3NX4OHf//L6fTaQsFaM1iZ8T1X3u2J+/68KtMpDS+2VWSs8nOpFH6
	GoJENvk8iYMase02Z5hJDA2kMo5lEgSYafWlf2nhFc/FHSFXotNRYKyaCfSD4qjYObTaXG3H6Gz
	b/QZJH0GbuitrSDxfExSBDAvbRNy4z6fcI+dwe4Ew2QrrUiYXYsJejpUVn3YAdU1A4zLFiw==
X-Received: by 2002:a17:903:1905:b0:2bf:23c3:34b2 with SMTP id d9443c01a7336-2bf36867d31mr16830145ad.32.1780086445498;
        Fri, 29 May 2026 13:27:25 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2bf:23c3:34b2 with SMTP id d9443c01a7336-2bf36867d31mr16829875ad.32.1780086445058;
        Fri, 29 May 2026 13:27:25 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b00e68sm29913825ad.44.2026.05.29.13.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 13:27:24 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Sat, 30 May 2026 01:57:19 +0530
Subject: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKb2GWoC/4WNwQqDMBAFf0Vy7kqSkog99T+Kh5hsakCNZlVax
 H9vKvTcy4N5h5mdEaaAxG7FzhJugUIcM8hLwWxnxidCcJmZ5FJzJRUY5yBOEyym7RF8TNDjYEa
 CYBFWTyCUdhVHqWttWdZMCX14nYlHk7kLtMT0Poub+L4/efVfvgkQcPV15ZVFzV17j0TlvJrex
 mEo87DmOI4PrY1LjdcAAAA=
X-Change-ID: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=RcCgzVtv c=1 sm=1 tr=0 ts=6a19f6ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F-gtwfDqNy-CsTC3YnkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDIwNCBTYWx0ZWRfX35F8SSoertf3
 R1fCUdJLsqMIE7m8Jziepor87h8o1LG60nXLAUUxGBUgcYIMHZ8Q0S+yo33w88Om5+himOWw6Ku
 pJjaRTJRB0+uE6VucR4SxqhoM2+UJFqedl3N7kcIscqOgg9JldZvaJUwXLu97QlLYUG6ZNWTVOB
 8IMxqtA1nBqxBC6BfkDXhPUbDC0dcmaW5WReluwYkVzitw+OTJxL0JAkjjgs4HenCtHRWVncfYM
 ck75pk3QFyX4eHRuh4MX52dVKkLK/2a1oMmXvtRBXbRuZr5IESdElRnlah7qc40GkT5O+LDWcYb
 FpoA1ISVSJlMK1EZTkaWpUks4CSugcNszQCcAv5EvxUEVnvU4SOk4dgGlrG1f9XddKaa4TthK+m
 a4WD3SbtA+ERe46oW6q6LnefZqrrOuEFdPBJRhxtFsMsIBfrVKTFrG8ugmwOlQYIAhZNfNq5jti
 m6yqxE6ikZRKT7oueQQ==
X-Proofpoint-ORIG-GUID: radAEcuEH_ydp5OiejCqCplqXcwvPN2E
X-Proofpoint-GUID: radAEcuEH_ydp5OiejCqCplqXcwvPN2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290204

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Testing:
* dtbs_check
* Validated on LeMans-evk platform
---
Changes in v2:
- Fix svs_l1 frequency from 750MHz to 75MHz.
- Link to v1: https://lore.kernel.org/r/20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 522ba43836a2425a8612506f5f7113f291f34706..9624f641212e5a80b74da52b82ea54a303aeee13 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

