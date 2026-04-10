Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A753E6DF3
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846609; cv=none; b=o93+tfZ0ydUqvBUrHv65rF31UafFy4jfV3NMIgveYzi1oYCtBwUXPpJlvTRYreEcIX1ABPn2357FIVJvC9e/H14rYGZaY+4e5yZJFT5OJ0+5AFtnUCI8lmrvSM3SN25oVGd8sNrQkfNUsgMuit/UQo3fs+R7iOkImDl85H6fQvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846609; c=relaxed/simple;
	bh=fpqAdcevsL8mZMWycu0irlvSW1JOLScUUGkXgN8MZwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9JUaZNqTOwt90trgLix8drJ9yhNVbL1Knha1dravWgqMZRM7zFLZzZ+xNfWe25p7XEoC8a1731n4xDYpzfvxfaS8lR07u9bOdRV78o5XPeyArWtxfaGqkv/365wqf26B3wSqMWF4TMHVCKDAXClgTfXCepZKR/XPS24ZCcmkaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oigV01+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+ypDEuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oigV01+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+ypDEuK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIMled4147281
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jdONFNCs1Iz
	fT68MjzY5Crzyu8ygeDCV8E1xlePuVhg=; b=oigV01+ghUDEz8gfm6ySNvmmCuX
	FGKSrcJZQU5tC/NWGMYDDyMq8bA/175DDYW8zGP4nYaGGw5zSSdvJGe3ap76lFRa
	N7N2tsf8RRWoMX5yhaUq5E/3b8/yMeVZWlaL/rzY4SeHNrX7Akz88rru9COUduu4
	mxDyVGkOw3fCVB168vUd0yyq0WJEGLAKGVf2RQhyjQFFNmZ5n519Ues7aSAKxBqf
	kh0sU1QCBkvxLvmJ2bzv1sh4Uzz836r7tKqOH9BP6HL+i0ygpE5uDU+FI6nKDYz1
	dpvVRkN4PTcfrY8F6agEMmFmuTQ4Qn/8GVTl384odjtNhtWQ2DpYE09wDYw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgjhke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79281bd14cso385259a12.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846607; x=1776451407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdONFNCs1IzfT68MjzY5Crzyu8ygeDCV8E1xlePuVhg=;
        b=T+ypDEuKHiNyiqCHBmAqG3abpaeth9Drs7aOYhx2uY6l6iUJL5LH2oT0fa1ovi3LPH
         OexezNkNcJ3YHyCdDcYZuIqVzIyXZqDMLw0NG2dcBPFfX64xO06ysK1IszNjLKoLWjD2
         0ZJEkwHs/bDKJNb+iAwDWILNGIim21FKbRo5UdusmClrrf19quLwDx0aQYyes2kXM36M
         JEzhdrlg8dXW4ffLe2Glf8datz+JATjuCAT8YhdF2xQROjQDEsm2cFKGpigjoAV8JKBN
         CW24v8ygMR8TycQ3KMorm/iQEgh72KC/Z5+w+iVsW0MUSN9CTuunc5wUSWfVso6rx002
         ssew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846607; x=1776451407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdONFNCs1IzfT68MjzY5Crzyu8ygeDCV8E1xlePuVhg=;
        b=jMLsMaZMd0AQ7PJ0w+1j4kBLTWNAdiab9JYN5R1d0JM1aURpSJU6v9vQfv0PCyzdWW
         cJbrUL+ukY/jyGZEkJerR4AWCF9K2PsafSzfigqZs2H8z2D9aJe+LDwVU24z6tuHeC6F
         hqA1LcW9gcn7m+fmnfH2pSOc2FH0ApaNxST+yhFVVcSzj0xVR6HUdxVK3Wy2fS6OTNVy
         7LRZsgDLMbPI7iKwAVjgxI2qNLjk/0gCBvc+HXe2YTDg8YB8nsvihTPGtU0uzGIdsdfy
         WDfE3yC4S+6nOWhy28/olv+CZXFv3IowQQzr+9VszxeskGoGwaIvbTgtqHreAIhsLPl5
         xBWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSd0Z2Lqv28Ai+5hCA4UBkUjJzHgQ/i1sKS5B6eZCZqQ9vW0dG6bXQnfyE6IYie8x7xQMFXmEv9pg8@vger.kernel.org
X-Gm-Message-State: AOJu0YxoodJvSp50I31WM2yqlKDqnW2oIcFDpWRHB2hpoWG/wN9AET+A
	AIardLqUq0l8a3YqQM1kD3UTgDXbvFMHZPCsTRg4T+yFYFA893CZGDmZa2pIOOJfY6/UoOIDIHN
	fNMRXkY1yElDURfkMVtQccUTtPnh6b3b4HNe4iYswxQlvSdx5FVGonc1CICZieqi9
X-Gm-Gg: AeBDieu96otRdp+lSSxCXALJM/+HVS/9nuKqZ1VkcCM95xK9JATKS9rUOLCc8KvK6OY
	gGSz2VmiVWc2/ds7zilN25nwLgxszJCzGDWYItzCgf6CE1lOhN6gQ2mCt3H7wQQBbL7e4Tx+aBr
	qTizv2fDZid2efurKjRPKOpmwQJY9lZ7G2qZLki45w7p+cZLdgl/XKcd7Ih3Qx+7X0Q2BWzB/y9
	OGUlrtOkRNwk4+0AxErha9cRzloN7YAbWZoMSGU9miDkLr7+gs46FqnKGJV9uiw/YYeNIpjJg3/
	KpYsmkyrb8/HGBkcq/ij4YlPtr5yjOsyVcUAEZGiEZELzbLELh+z2ExTRHSeBnoetZDqFfjBl3Q
	P2bwpai0j/SVPIWNNy+zxjUmEzL7PrLh/udH3OH0xOMoVcBJ/
X-Received: by 2002:a05:6a00:cc5:b0:824:a0b9:64ee with SMTP id d2e1a72fcca58-82f0c169423mr4799162b3a.17.1775846606622;
        Fri, 10 Apr 2026 11:43:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc5:b0:824:a0b9:64ee with SMTP id d2e1a72fcca58-82f0c169423mr4799131b3a.17.1775846605976;
        Fri, 10 Apr 2026 11:43:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 21/35] arm64: dts: qcom: sm6350: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:58 +0530
Message-ID: <20260410184124.1068210-22-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tD5cJvmmlrrmEzE_ldXg19V6RXwbXbYa
X-Proofpoint-GUID: tD5cJvmmlrrmEzE_ldXg19V6RXwbXbYa
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d944cf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gy2XHVjqFIZi9_LM-XYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NSBTYWx0ZWRfX4kK7LOmOIavZ
 J59SOv2LNHi0s5vCEkajbNJEH0njhcig36h9tabYMgLJQc6QSFBZEhlOrp01Fn9vvQz/3wF1G2i
 Z3kSWqOu+kqIHV+YXW8Agte+YfcU1xZHNhlPJlGBG70RKGAgj6jj/Nvl6XhxBMI5ba3jYCbcEu0
 fmnINp1zj5WlNyEiCf38CC17FTmde6eYqbmYVqlqVtyn9AOwjHhXNYgFrGHd8I2UNhJbddkImEQ
 jXyEZ5b5qgYME92JG4SenltkcVN7R7RElCJ5v7dcCVJ43W8MnawS3AepmLDKQJ00YYjn288k+M1
 9W5jrugOY37YkAfPapYpnOPP1k+9fGmvrTyiRjuhE6NwabRVna4bfRDAWqiHR+plDs5oxc+B2xr
 piCkTthWCjYDBvFjW89/nKIp/Z5QwvqWSQCsICq5ze4rDq3ugrBHdKuI1WIlLj97q5rLcWhnfqd
 yvX1a6U9BeAeyVVrQjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100175

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..3b78835ca41b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2489,7 +2489,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 655 12>, <138 139 15>;
 			#interrupt-cells = <2>;
-- 
2.53.0

