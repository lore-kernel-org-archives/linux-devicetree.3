Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C06385D89
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479716; cv=none; b=eXnLNsOpqH+mjpM6S5Vtl6ACTF+ElTEggl4YxrTPb4PAvOUe6g4WhNmgZoHJRNPT1R/aWY020X5MMDFpNDkMORNRbDoH3Q9451w6VLG0GXV1+xKfRj6iGGmYmOcivqYV4O1Jz1MvyJ20j7rloBYn+c6SgxazuxOn802uTWD7o5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479716; c=relaxed/simple;
	bh=SKGjni1KOiKZfXVYqG/Wt+yBdTIJXei8jtnT1CjWOEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMXPcNDeJFjfLuM1sIbdQsupQs6EqGnfaNFE+9oSMJ+rjfP+r5H7RgMqftkb+9RJcf5dv8grDocJTdHy/3IlDbjQdDHyRPVtLT93f80AFMHy21kvcCOxF1k30SaDE/Q6Fe0tnHDpkfJ6UCXXF8tQeKyI9TIFoBErAdIMZRdS/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ba1R6w1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxbfkpP3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ba1R6w1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxbfkpP3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpYkg2125208
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Emdn15EHeJD
	m/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=; b=Ba1R6w1E0j2HCAkPp4TApbBGwqu
	wN3HfLRbNhhnDi22UeU+fyWPApH0DOr/w4VM8bl/t2L5HE1vguZc91Y8LsZdI/Gx
	e2kw1tYhB8JP9w17DqVa8f5bgnDJyWLYV97ezNVoXqEeQNx4//UZlkDIscQ8+pwo
	djdRVFu5qC87xYiQPrw4h1XoTPiDW+GccNFmXH2Yp63YfG2n+dNovSBkeYOLVrIV
	7Nfdkgs6DxwNdmtnDRMVjYBL7SIqHfeJtCAjgfmHV0udg/zOibsCllMLdxUrfxGs
	jo/Rg2ihi+8AmGlLUbXIXm6Wvoaj2besK4KTAuRjRFbvDi6GCFCRZ7m5Xww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard89ffy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba268cb5e6so80851225ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479714; x=1780084514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=FxbfkpP3/OGCb1Pm/rYvqFanWmHv7k/MeduilQFXfr+lP/jscEadMI+k/0yCJwvK6R
         LrwoNh9jauMNWE7a92CRa54hqZn0GlkQbU878EFkNrk2JMTm7ud48/W3VhV47icE7jJP
         O5NI3J4YjnYM7dkBa3kJhCHsIynaIl92qm2eiZ4miZFpw66Ll3X/FWt3RPOl7edF07dj
         3/g0gVx3jWUjn9boP/ztkwZUe5VXFk5Oj75HHw9QTR0LmELWQpfcOXfFos99pTx3Uxqp
         h6TSwSsAr1R9QRlrAEw3LNMFH2bVYCW0cIw0qTSgOK4K3Agh44HWE0rLLOuX4QHpK+mx
         s1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479714; x=1780084514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=FeLe/DkfT/nHPtPvkHiptAhs+OpteHBYsqBspF742Ws7H/j/RyHlw+gLRnjSuj3or3
         koyO8RZWcAcjDOzNcxLBtLB0glj97k8HifTt4FwLpiKzD9astYsZyc20V6ROjE3kQe9C
         s/21haCKlRaeToBxyDnwug5neZciuaxkEeVAR3OHrU2JhmTujpNqdBySb0rUIIujuVma
         9ssPPvr9XNKtfDrUjf2F6C05X8NzQwyOINWcVPxfjulKeNipN7n1aaNz7j06yd6A1ctv
         m0ss2aTk4t56t2ME8yEz4BLtPrg/lbhsMeNjsID5xDYWcQahHl5tfRVUID3kdTQbufBz
         IXxg==
X-Forwarded-Encrypted: i=1; AFNElJ85fKDbzYadER6mM0vk+hWC0VkXIQ4LGv434URC5MqJ3kh8bx1gJZm351lkuojAc7yApn/riUv0td9o@vger.kernel.org
X-Gm-Message-State: AOJu0YyL1po38EnjUq3mxKdBj2IRN+oumTCSe4LQi2xWu67D//+w3czb
	qrIZwpN3n7vfMiW0ah2AGlSVxC112mW3mNGlf27kJlmUHHJ2SqPgru4J0pT/dGLzxYnE4UefBar
	wO8HSuvfJEmwQXxtDi8KTF9TM2Pp3UT6eBeJzaIujGf5V6RrO5HBeAcZsoWSqjvsR
X-Gm-Gg: Acq92OEubHQhebC06nHm7Fw6Y17hLtQAwp+ME106ZF4PU3GCPYZo/2e/rNiX6S5owC4
	ZmOyv7NzcFVJttWFoX0hp0CX6+stjaz/kPfpv4/tUTMcmgRCN5pSE5d1J2Nlk57vL+jx4wMrBlZ
	QMHp333tL9nPvcRu3B29L3qibHajeEfwlFzQWumnELB4I3v9v9K28UeCZGJklO1wgm4Lw+sJGo/
	CT6U3cZ8ptwpnkViA1law4P16XuwVmWsXiPqd/PZk9uvPIhk16cnvpjC0cJqoafNVWBDlGqglI8
	u/pMGrXhMiyJmPKqLj5OekdidJmC5M0/pSCkBlFoIvi+Z/5qvkFcfks7Yr3wzQHxV9pQ4dsFlTt
	1eU4Joccc/bFAUj/qSdaSvhKhqBhoFnMWjY2vp7JqUw6zDneD
X-Received: by 2002:a17:903:3b8c:b0:2be:1db0:f166 with SMTP id d9443c01a7336-2beb0346484mr56281755ad.10.1779479714011;
        Fri, 22 May 2026 12:55:14 -0700 (PDT)
X-Received: by 2002:a17:903:3b8c:b0:2be:1db0:f166 with SMTP id d9443c01a7336-2beb0346484mr56281305ad.10.1779479713489;
        Fri, 22 May 2026 12:55:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 18/18] arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:09 +0530
Message-ID: <20260522195009.2961022-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a10b4a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0qvS_bSzHNCwZkaZnqgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GV4_e62UElqLiDqi3BNtDgeGOBSbTnuz
X-Proofpoint-GUID: GV4_e62UElqLiDqi3BNtDgeGOBSbTnuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX4aVWhSN50fNO
 lHr4QsA8gQgi6+sOahsnXuoq8981u5mCerLA6x4IY5oJ37EYjmakIxm1A5P0JzgUjJcNciHwNVH
 r8J2QdJopGQXOrIZTnhhqAixstQYxBzvlHtMWHm0kNoCGVSCm96TQcb5HZX48Nyf/vm2SR8UJaf
 xe7WB9VvdEdJbySYog+/1SDdKbrhVCLFGeTAm8HHYkF2o/Zw0dbS8gOT/ItOmTrlOACXXwUx7Cm
 zwAiX2zyZTUb8RwUnCIEPZxIIxhkRXsATcXnLO85p1FqHee3MmV+IAo6yORkJaENGXn976k8619
 vKtwpYgrSZaiwa1Torn/e5FabuPyudW/1YI3u8EPiRywprduAouswf1l1UB9TZYkD2rpZzcWYRx
 Ye64qf55oc16O2uKGXrTVGtMJfbKPnL8rq+WwamTIkq7Qpg9Hj8czBZnx5mV8gAQyKx5hio5cXd
 46yPGb+GV/1vO6g1Xig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..2179988dbaaf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -363,6 +363,7 @@ cluster_sleep_0: cluster-sleep-0 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-sdm845", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -5192,6 +5193,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0

