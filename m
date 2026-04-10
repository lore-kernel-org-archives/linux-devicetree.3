Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379243E6DCB
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846602; cv=none; b=ddpw7J+hkWRJzbrfTncdG2j15548YZSEeKduApQBx8+LqkfsWApyAfZfHm+XsmNpz6wTn/y6uhelINW45KU3a0hpDHOWJsg8ght4S8YHJ26+nkovN2Fp/n02j7z6GGEJ+F1qk29FBb2c4clXXFsWa2Y2uQXABVqgDRkbooDE0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846602; c=relaxed/simple;
	bh=y3oOfrb61GA0sr+vqs6duve+43vLPtr00Qb5alWgs1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glLIb1wl2Dl76D5lqsqgtapjPVDyKJbimkMSfM36qETMDIW3Qa8ftLlQen4WZPPvd+IYRIGapSrO4VoJgMww1C1hHIUYHgquDOEBiY2APXt21OBGhxeoSc3Le+40wn/hG6+8l0aP9p8RKexbULM+tPNk87Jr9ErBnB+2AV5qh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op3g+03s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TB5Y61lZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op3g+03s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TB5Y61lZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AH4WEF709104
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0WMLkXiCwmv
	qIFNDghMkRAib4E02w+arsKGbKrFqc84=; b=op3g+03sWr70arATmjjo5IMEtvK
	b2fcku11dPq/hXzzHSmg5bcQdpKCJj5v/bFVyfvcOnf0fh7442RjOvbp7Q1JrD9k
	/UoMvEBZwOCyDnt59JJgljgig70p6bKLD0itH24xse2l3gQmz4kR/4uIb4fPxt8S
	c8PsA9Bd5rfBZ73pOCZjw2l2AlQ5V33Fu/RkL9ogd9KqpkDRKwDIezo9DMjvKbDH
	DGDn4Z3dq/sn3AmioHgtlC0xcuqoIXF1UaBRYb9seKkQrFaEEpGkqUjbtPd+JM9s
	h4VoBZ/373O3P1NUo7hNNh3I/kCDdDwZMCoZwDl76gy09V13S8GsNbdd5ZA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f07cc6590so993803b3a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846599; x=1776451399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WMLkXiCwmvqIFNDghMkRAib4E02w+arsKGbKrFqc84=;
        b=TB5Y61lZj9YM+KfkTyS7ZdKdaxOQx0nesr6xfBFPKb9pkK4C3K3RnEMhuedUpUZew/
         ZgEl8c/9MqWjfbn4+7Wrhm2Uv46D8Z7MJQC6jKb4YBI8UFJ54myXjZTrusH1UPFZK+n+
         TuhnUaCZCM2sh/eDeg52zFjrDZjPjhecCrqEDjT4FYs/gGN+50d/Nqd/kdCeeXacH8k7
         LxMSCHp3Bn60tINZzGoGKfd8twUHxvsm2yx2ZwGGTkKrEv7IJLdEHHtmSB3ZpluCmY+N
         FwQWpEEATC29gRHw0D63lLgGqSJRacdZq0hK+liB3iScpqB9z0+gKfw/wgHlgwY/V0Ty
         WT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846599; x=1776451399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0WMLkXiCwmvqIFNDghMkRAib4E02w+arsKGbKrFqc84=;
        b=Pr/9saLCDlbG7koP3NeuyRF+WSOgZxL0PkBG8fCvByBLwQp5JOEg8APXMJrxdKG3FI
         9r+m/EhOt3hIkhJU1E/vdH7NyFlXEVbWJb6djUsgp2okIanKtmTXUkXC+eZjBV0eHxvO
         0T2gE0P8VTgsHJThm5YEYBsqAmEtzun1Hoe95feUDyaNpwsGU6qMjaqSfZy6DcC8Rr5t
         2Y38lV7VaSlI6SxjGgLcb3O5YPHK7d9cetvUo+cehWl/6KbCKd+O6HQu4mfWS1Sd6gxQ
         cYveG9GhRICmvsY3tdVaZvYja4/2prrVzM5SZtEv/1pi6fQ8wXGLkCy9RPWpgQlhqkeS
         +kHw==
X-Forwarded-Encrypted: i=1; AJvYcCUMhTsehTxcK7Q5VLqdKgxKSxa4n4Cw9LaYEENwbARoHrxi4yrEO1C/rYaDABHtcY8CXvBHtmk64c1z@vger.kernel.org
X-Gm-Message-State: AOJu0YzNL5IYCDxNLGQZNz33jBaQ1sB3ScXwFdhsHl/Se0EORg5WTv04
	lMwb6tEXv5nIkbIcruo2nS+Esax60rcv84WM+K7NoRPoDWliQwP0IXM2QCYWpr2Yc0Ee7jSDhYS
	aSK0prH7aFH/QKeyASTJYb40scYN62XpPfNsCDvb+TnbPcLxERXussx6QBKh2ASsx
X-Gm-Gg: AeBDievEm2xx1rpb9Me/2MwPbZUpJhTrg3z/qkNlXV6V6fkJX9Xjxv336ylaWFU7K99
	ihf2KIJ+K/OYX/irGSEVgK6g35skf+E3WASh2lxEXGzHFvRLmYneGGY9fc/XvHquX0e52n31NOu
	bk1WXh1CHBCZm9SWBtw+P2BzqrD4rZkSffkiYgcFOtdDYaZsiiUaETd4/uUZs/uTnvGW37lRHP9
	BDmAdmoUB/Ymb4VB7p5S9qd8dw9TLVNmoUh54npfkKBcpguhOMNirBHBQR0hfz887+q3laa+U9p
	CpCW2fu0sFlZK3aq7IfCxrQTEyR7q0gVVg+qavTdODiq0A1Ij4298OoCCGN9mV8dW6PGrqcugR4
	a+08mEmcFw4EiJ7/fCb51nCxfZ2a57pxJVsVkHsYx29YV3ZKG
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4851713b3a.47.1775846598682;
        Fri, 10 Apr 2026 11:43:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4851673b3a.47.1775846598011;
        Fri, 10 Apr 2026 11:43:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 19/35] arm64: dts: qcom: sm4450: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:56 +0530
Message-ID: <20260410184124.1068210-20-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PKxdW80PjcrsU4SMPGapcHVxS6HRo3KB
X-Proofpoint-GUID: PKxdW80PjcrsU4SMPGapcHVxS6HRo3KB
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944c7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX8KlfaInWJavW
 /ONInXuiX2mP9MxM9FcmK7NNy55xaYqCWD97abx7eOO4ijIopy6t3g0x4MmO+VKqBGVoNgmgHCl
 XJKzNjLCcgmAoffQ99/Bf3EsVKFiZ1faGt3nqqSjYkmZYp/TA6OGqCPK0KeeELB0f/k17MAbNJD
 PCZZ36g9D5uR4OJmOY3pZA4A3Q4zhtToJDJS6YBNRA2FVF3KvB3zAYROECdvLNoMwiG5Qng4/e/
 3gNesNZu7APr/4SqtEVHbi/r+kbqicLI8pKHuB0uGwUwGF6h2wthmvouGJTyTr2dXvoXeWvaHdW
 H7yqP2oYa7F7xd4SNRSxrHSsHx9YscjeFV0Yo/tn1JfeeBaz4tbNhFIc2ImgVHhF2l8l68bv5wO
 IWjjdvNmDSW1TmdsvrfoZ6Fha19h0AlvoLvePFB5iJ+RA6untBDGd9EthDK8Z0AVd9l1ygl/8wU
 Zkk7Pw+s0fD3Z1vh18Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index d217d922811e..b84dd1a8311b 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -464,7 +464,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm4450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 494 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0

