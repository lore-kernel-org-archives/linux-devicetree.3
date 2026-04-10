Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF263E559B
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846621; cv=none; b=o9UDM/WRqUBsz+V1TwtXiroFVPiZZ69S7CKEyur2A9XEkYoTlHffiTjeX9bN0nnvOB0M99N9+Iplf/qRfAKZzG8IKtijQlSMDXyJdsmAx3Ua7tTQOOzGdSfb3Y+fZ6EXn1bwztFOIexK2eIyjmHTAhgNokxi4RLIWe9jZdCIxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846621; c=relaxed/simple;
	bh=iZquXc0sPu2P/ndQa0+zylEP7jeBEt/Uu1vfrrgvqg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADN4FBR8E4Q4xhlp+8wayVDU9CWEQcgVLbyYMNihYjXWhqctZyk39pIbgi4/skvMMk1y3O/ooLQ4xAUZyDCj1ck1m5O9cd5qh7VypxA785wG7KQccUCRZncTLJeAaAm7XWONWvxqnPv9Jh6taEkD7EPup2cMii+N75a4A+rGs9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDBjzsct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoi6KmUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDBjzsct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoi6KmUz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AISYij3743160
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oB5blGiSxqu
	hyDyUkDrBLGqOgXwS5ZKCh0w4aV+EQdg=; b=PDBjzsctJGu7feSuPlE8mSv9e2Q
	Wkz/L1veTpW7I0iE2nZAGbcFxe3bdfxeT7IQ+suSLqjTUP0A8ZB5T/ZteGb/8vcC
	86m12BBOsownZrrmiYtuPRNZWdDxzxy3A/rVslVtaEhxZKJ1Qp2oPsCVHoGnW0rF
	6VdN1VYdgNNxxxyMG9iNmDlZhMWSLH9bgc3Zub4yck5uAGbUYjUjSBrGWhdfWyFI
	635RMG5g9m7LlxshpEmYPxnA5hmQd9DGTDxxc9wy29kThMmIZCR0LS2ntd/iynbE
	oP4WJvCrrVxtsC1SXszTJuVIfuiMwGwIoqrAD3h3wK3qGj6g77JtXK35mdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso22380075ad.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846618; x=1776451418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB5blGiSxquhyDyUkDrBLGqOgXwS5ZKCh0w4aV+EQdg=;
        b=hoi6KmUzb4FnQSRVOy0tOh2wcNlcQncpOY/G41Ycq9aGDTqTFWv4PNVJpAmd5bK58N
         DiBVnFDgAWeVH7iE5wkswdAPkI9jE+dkhBLjZGBlC2VLqJQMwDHDZ/59KZHxwo1Hlx9R
         jzzA/IbMfBzrF68UJoqY1BkJBzKJWVmX7z/MmZ4WeEF5gOY7bt6Q4tHiGMRQCpgkRsIA
         YZ30Rncbib5TkIYsRx2WhRmScXE8x1ZPiBVDrgjj6vpkDxoqk3sFeqBi9kEUg/kRwTdK
         CSQe3jrAX7wqaQ6tmZFLyGpJqICgekb0kT1AlvR3Kd4ysUrUUv9cJjhL5xkNndSMXsS5
         gU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846618; x=1776451418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oB5blGiSxquhyDyUkDrBLGqOgXwS5ZKCh0w4aV+EQdg=;
        b=NnX/nQRc5fJRwuxbaByTEWzbRUdshFbGVq/Hg/2oGZHrQG5laj005SVT7ZIQ15bUZe
         TYtndyVG5kF1hGZUngfZkphzRIyG765t+sbEX6l41G1hcnk5mQxAaBadrTtiPGgedlgq
         XBLo3w2C209vanlFugPdj3njrTsS36jfxatZGsMbwh7DN3iuaLMJMYbZNo6pyQINSRX5
         ZqP9Uq4ghco21k2mjI8oue+C/yQfN4M+VwzWa0icZ0sj8AcRgXTS6FV/cYNyOpF67UAX
         EfXSYccYM/Dm+0WYRbCt23WghHU90Rk6WEIc0LWg0zWUooWxkCtQxMiqzYaVNnw9jm/Y
         Le0w==
X-Forwarded-Encrypted: i=1; AJvYcCVV/EC5Fp/91CCywoiJFEf3rVr/dv3kh2D5kmIvjPUmZnDhLKKVneff9iYFrsMHDXQFclpsPFuOcwn1@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9DceeDis0ig6MseCO1nnrN7SiomHk5XVcKPa3kdjUUcdYvXS
	gLzvU6OZWelIA512sdezPcWn5sN6/slmfDZFRvHHGsCovQN5M4AJEc2XEKFL8z4lT0cOMcofifl
	3hw2EE+xOpsxExdS/fVqQHA4N9UdBOwbOn4VTwGE7PpU9Ui4+Uu8tt1AI+WF8tNj5
X-Gm-Gg: AeBDiesZJ0O9Cl+0l7WPtMcicjKJj3GsHm2FQIugV0BwZNzGzyDMt2xawPndaGQrdxq
	IiSGAK/gF7t2aXLfOenNYbeadZmu5e5zT7UCJznuK9IwVyirijpe3OCpboAbyoDe2fQqUCtxUv3
	027z7T1xR/GfXE7girKR41l4AmmesF7jEms55zg80sY3tlVu5enjxjo5XCSU7jmo01Daht9Omq4
	EM/4vLyVwZeKkhAKF74C3IV8lOEFOV9sQGWyek132loKdb0kcbpaQ+UbGvM/OCLDVjIpUC8PZEw
	1tp2dmLwcGpiKSLT3aqnl1+qfOla19cABJx2ZQame9jUmr2Fw4xWUcnxatKQreZvtdFDWM+ll83
	0Thc/tKf86z/uLMdvFSl3Krgm37tbshX4Ljt5FmxwKhg4PAg0
X-Received: by 2002:a05:6a20:7351:b0:39c:2a9c:bbe2 with SMTP id adf61e73a8af0-39fe3d62ac0mr5254049637.24.1775846618315;
        Fri, 10 Apr 2026 11:43:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7351:b0:39c:2a9c:bbe2 with SMTP id adf61e73a8af0-39fe3d62ac0mr5254011637.24.1775846617762;
        Fri, 10 Apr 2026 11:43:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 24/35] arm64: dts: qcom: qcs8300: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:01 +0530
Message-ID: <20260410184124.1068210-25-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QD-RZ3ha_DGXFkI6jTw1p7YPXUK2nde3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX+aUNUjgyVyOt
 d414NIj+g1EC0McG83b4dSvshSVaIQAu1MAw2v9m1jYK5IDk19gzUBlPLy0Sk1Cx+qslvTnlHle
 wwqEaLanvYVbfBORg2Z32ldmUZzz9uB9L4zIC5qTjEBWqxbTZwgtDYrQ8+beQ77ulzAWLcwvaAn
 m9TXTuE2+UIHY0IxD4ywIuhT7EVDZvPE27sKpOWWVQaMO8L9OEtj5YVYHCoCflsP6223GEbeykF
 8MevQF9riLoCHNSWQCy9MmLfCGD8ULi6bxuGCy3r9tJNseLKr2m5xtxyj1qKoGdOE5qWg9QbZPf
 q3nSIZ9pgj36E7Q++spwbaTtiw9BLJx8BSz8qzu/KPeYYiLUKEAP0ex1fq96K+nUbCfM/Y3ecL5
 yNFdpdIYL1orlRaDaFHNpSD9WRA1paPPW0EL4sX52L2TzdjWqlDlfznbcBYbiZy7WYp4KdpzKhi
 urv0X3I8Tc1Y5srFsxg==
X-Proofpoint-GUID: QD-RZ3ha_DGXFkI6jTw1p7YPXUK2nde3
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d944db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RSTtAalInLn15RkLuCgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 0cb9fd154b68..84b22866d2f3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5744,7 +5744,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
-- 
2.53.0

