Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596077;
	b=mo4y1RDfCAGJTkmfDkP4Ma2B+MsAY9TEGJXnz1QvjQvTH/gascGHjJe81IULEPnEJF19
	 iw7cHTEVZHZEpMdgfW1Jqpn9yU3Fvan5ieSiVa06SS7Oq7zxpW1VL9aRhVWgnm02uiGg3
	 WWIKjkVT5qkW/peXt9s2U6FlQDc2o07fVdJKPJ0Z/8xzMBBHZ7iQAVXdPEuj3fxtG7lZE
	 nDIIBnLJ/aI3CosPiQ9M5byQnQqc2SoqRvQkEQWK4z1Mnbc7io1P3mHqxdLQbe/sPOJcG
	 Ex43O8ckCO29idDD0jyqPe32oMRXba3NSrQtrEweSh3hq6jwmITA7hQUzBae7arnJtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9ahYTS38mY=;
	b=co0ftdZda6Nvd+ZqiPpPsRovFpQswYSnD7rI/YDftzvR/cksXFL4ctdCqN3SxBrgY0Ed
	 AjOQUYI9OCbQOaLIJe5blPYCUJwieJnDKaFAHV2Ng+AV/+gqe1iRQulDlrtZQeYbEbIo+
	 IzRmAuwrMcf3iBvjU40eibY9/vn0+odvYifIlZnM6J4e/GIYd7ry6vxICMKmksyGqgKS6
	 Dq6QE8NhIIF1ImvblxUbGR0MUCOzXVZD2tMywnwamTTwm52iL2F/tq6tLtbwVFdkek8SZ
	 KO9dkkB5Zqw6PG/dDWFsDLys2rOaSSKETZGdeoHSf4lIkgIrif7WWRChniyZM2OEBXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW3oVz+u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDGvxK7D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54212606A8B6
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54212606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW3oVz+u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDGvxK7D
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR3xC2022977
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9a
	hYTS38mY=; b=dW3oVz+u+m63wVIhoZCLkc6AhsnucjH6O7TOQeDWH+ww/ok//or
	jeCCCZKH14aqecIBhUAArFyfyvyO6OFL2sCc9NSG/yfPkbOnWBXKprxEfwxf7DPW
	g2AhfSMBPQfwjgj+jzex/nJj6s3ZqIRhqwxK8aDPV4vmhfPI8W/D4Wk5CGDx5WdY
	rPjw0i1tkXjte+49mb02mmJqDuQclrK4QVSHvjQ/EGzGC9z8B2FWlLEi561/4+ZU
	9dSIg4EiUxfI2bi8xH5Y6kd1JDFBIUZxDCLIg4Vd7s7iNhhwG+ZhdZbi8gs/7GRa
	zyZMoJVkFIrZEv76gQ0o3lut5JOINWvGjPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:54:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so413107485a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596075; x=1795200875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9ahYTS38mY=;
        b=TDGvxK7D3UDHGhZt52FZvoSx2cvfJGKdkG9Z5h8SlIIYJHCXrwVLLJwtlW18E0bObr
         aU/jWSHotLBfcRAknYz2BZUs/ccQlwdXix0UjSiqsV1wE7bslB7zuxCUvuVSv7D4TQyf
         O/E/byt0nkdjkLODIkQUWWb2u8QKIX0p+xCsJd3XbJ0aY2weCHHboTNmflS6FjipZ9Mu
         uXnbuy3aheinRB707rsHrUK8s2ztqdGfr6NtCfxgLHnviwCXmerrq3x5yzkIj6DQHS1o
         QSTHqBemlEmVIjddj8iAcA5SFgDXkaAwoy7NhcopF+TWzply9bIPHD+7cYzxks1aAazC
         lpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596075; x=1795200875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1JhuU8Nkw9dssyxcEwG+PVmzJ51R1f0S9ahYTS38mY=;
        b=08PUL3FKxGRhvlwXzT4OPWKmMax8aF5k6CinXZi6384qVNE9w3zNXdIE8u/IB98KW8
         eJTCQc2t9aDPNgCjAJpeNzG7LjANfKKc20ZuLPsU2PCCI60w0f87JumTcZcGPtRzrt0i
         WALK+Dc4bnBRzjmqSSQ30pAL/yn/GMltbkn508kHWNDM87aLaNbXAVO1voudJVnptQ2B
         OCt7yIdz+55j6vzF+7QrsD2HPvgv2F0TnI89OFDj9xejHUT2DE22kcE9Eipk3L5wFI6A
         B96xO66lFyhm6ttlf6jyzrZjuprM72rh0pbeZO7v57qOytfZj30oJZykfI9LhSre4+3m
         Zcuw==
X-Forwarded-Encrypted: i=1; AL+hErHAuDmUTsbsaFxqcJGCJiUACzqCdmAC5A8LH8r0fbsvfu7/YaFT4PH5YaHC78zjOND5CUjsB7WLJhhw@vger.kernel.org
X-Gm-Message-State: APuU4Z++29ZtAAwAexBm3bIPRVqR9cr/L+Z5CB8oI22exnWuh4v3NoAI
	9Xh867VVpU1wCYeJY6ps3LTdn8Ja2EJAUiPTJ8tkhpPHUQb7kwoTIxPaedeW1YQjJE8jK7ib206
	HTtjcdgu8PlkvHVKkyz8ALvGgCxp186gNYmjS6rJogt1PB5lQcxtCaSNHP5FgaBXd
X-Gm-Gg: AYBFou0DhqLEWteDa1GbhZ1kVlnYocIIhyW286UpWSmiBvWPoMnn0ofXgL7lPUOQ+SL
	hSBa0qAqD4qtmoaNc5ebTYmW6lnXQmcYL5RrLvQpYzuYh3B+TGlzSfP76uOAApYAkG3uSjvbVY1
	4EaZk/T2xB7mDbAPHxTQFVXMrdlYJI8ThMAG6H9oJfajQ/pjtstebRNFOET7P40HgWntFdPvGL/
	IozbdzBUfhDstM3MGlqkzDgPOAWLjfvvYxPG3ufhEOH4YBJrcAbpEjoYsR0eeruOAD6u8uXsYCH
	A4T7B8GSQNFPfrs/yXQt4YOmXJ4jl5lDDsYx8CdoQykhi0U0+dfLe1Kr7kKcRauzxMyR8qMhD8a
	UnSjdh2IQFYtgkVjhTrYOD1kLhrOOzdJbg8QYh9/Pc1cOgMXlpbsROx4XjP5BNQ==
X-Received: by 2002:a05:620a:280f:b0:93f:11ee:ba5f with SMTP id af79cd13be357-9494bca42ccmr526939585a.79.1794596074508;
        Fri, 13 Nov 2026 10:54:34 -0800 (PST)
X-Received: by 2002:a05:620a:280f:b0:93f:11ee:ba5f with SMTP id af79cd13be357-9494bca42ccmr526936985a.79.1794596074040;
        Fri, 13 Nov 2026 10:54:34 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm5762454f8f.9.2026.11.13.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: Correct white-space style
Date: Fri, 13 Nov 2026 19:54:27 +0100
Message-ID: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6956; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+cwBvi/OxmEVHoBLxmBLN15WNowNdLnafX4q3m+XQhs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zil3CEC3XipyOyjj2DPWuJJKZsq9BuCrkCA
 c9835+9c2KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdc4gAKCRDBN2bmhouD
 1xfeD/9CjLbsyhgAzrFyF/wB202oa3X4BZgtiOBG9iEufmDV9aE1KdlOWI/H5f6KlOvLOW1Udfg
 JrYHJ5HvPJhvPaQOVJSNsyoBslf0syOHQ7zCb62N7YIzr+vsb7yuwYUO5sV0JPCEDcBsV+lmgZl
 mUgwHKhgMvT8lF+F00miyVJ7flfSKW8lPnHXW8tvhjhlqRp6xsAUu5Zg55laHDGuTrSNlvT0eCV
 WfXiKQjYnlTVGKAXijWQaetE8GWUtdpX0WUqj4syxTDT2KSUMIAzsVW9CkVvjXjMM3op7ndeDgh
 kNQTk0sC2+I1HB62sTwX3eNX+i7PUMo4venMzahKwiwe8H5vPGv53oaCJ40frWC8g8EHtvZR7cF
 1AtSzmZkjevDb3/cyObac+7Ozly1Y77PQ2yic6gPrtqjJ943JnJduuaHTu99bbqKe1zKcQ8hBlJ
 K32KIwQtsetgKSX3XPx+II4qhSfCs1MmaYX22ESLcFesRtdqD6KBO8x8OH6LYmEJXEK9/1QSFkW
 FHdHt8FH2OFqIUkvkT+PUp/0+CstYkg5aRfuwFx0P//kQjuWPx8R/mmVlmouquTLb6MRL779kqj
 FS/gPjBqGKkkM1CMH689tzRbmhHjpbfxAgAlrBEc7xon/NClDbvxaPxIPfZnN4TI8J7VbkEQSsK 4CGHMN2eeOHeXvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX024cd2oUNTQ+
 u7HSy+tr/ZSvai0CmEtSp2NHR/5yUaCaYgV/sJP4bOfZprLB/vVxzZVUPgPrbj+uzuQJ2B/pZvf
 tDYxAdW9vkr5h+P2GZycACopPsUL1rIGe3ea7EW4LwUyowic7KrU6jWzRQrtc5IAQQ4T4ehBRK7
 6dsuQPpkY6kD77Xl4LPOJ7XuwBi3sCzYCC79uhpWClWyPfYnt9GA2tuynijFImAsWVLb81tHJyP
 GD6s6F1pRD3hnjgCZp0nYlBYcE3pXK8YVlNOpo8al5ysW5ZeuZ/Avhh4dVNlLMFYu4OSenmThoa
 vCNs5xj3qRHs4J6YvDcv0euF3uMcGcVJyy5wOqpJub9MhXRI/2GjBEc5jviI5RWJVVIgwh696Gp
 MdirdEZn3bH4JXUWErnEOCgACgoQ74ZTWRSfO3bpW2usx0g+R+zuoYbzQz7Y337rB/6CPHTMMdW
 eut2URawF3kf90aVkHw==
X-Proofpoint-ORIG-GUID: HioZPzB4VwhbnKCymnmNU30fN14G6T_c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX5X/qqrtO9ms3
 AyoDusrVU3owuqtBdY4thKHtq5rwVtQkLVPACAbUrrNROjp2JMC4Ct8ZNuUA5Y+jSYELWiT98Xb
 +jsb6hi/cxLTLI7HqXR2XmqE9xVFGeE=
X-Proofpoint-GUID: HioZPzB4VwhbnKCymnmNU30fN14G6T_c
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75ceb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qeHlmA2xqscd7yt2h3EA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket, spaces used for indentation) to fix
dt-style-check warnings like:

  monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi         | 60 +++++++++----------
 .../boot/dts/qcom/milos-fairphone-fp6.dts     |  8 +--
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    |  2 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts |  2 +-
 .../boot/dts/qcom/sm8650-valve-deckard.dts    | 10 ++--
 5 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3f18438be6fc..9ace638e43e2 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -530,12 +530,12 @@ frame@f42d000 {
 
 		pcie3: pcie@30000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x30000000 0x0 0xf1d>,
-			       <0x0 0x30000f20 0x0 0xa8>,
-			       <0x0 0x30001000 0x0 0x1000>,
-			       <0x0 0x000b0000 0x0 0x3000>,
-			       <0x0 0x30100000 0x0 0x1000>,
-			       <0x0 0x000b6000 0x0 0x1000>;
+			reg = <0x0 0x30000000 0x0 0xf1d>,
+			      <0x0 0x30000f20 0x0 0xa8>,
+			      <0x0 0x30001000 0x0 0x1000>,
+			      <0x0 0x000b0000 0x0 0x3000>,
+			      <0x0 0x30100000 0x0 0x1000>,
+			      <0x0 0x000b6000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -630,12 +630,12 @@ pcie3_port0: pcie@0 {
 
 		pcie2: pcie@40000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x40000000 0x0 0xf1d>,
-			       <0x0 0x40000f20 0x0 0xa8>,
-			       <0x0 0x40001000 0x0 0x1000>,
-			       <0x0 0x000f8000 0x0 0x3000>,
-			       <0x0 0x40100000 0x0 0x1000>,
-			       <0x0 0x000fe000 0x0 0x1000>;
+			reg = <0x0 0x40000000 0x0 0xf1d>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x1000>,
+			      <0x0 0x000f8000 0x0 0x3000>,
+			      <0x0 0x40100000 0x0 0x1000>,
+			      <0x0 0x000fe000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -730,12 +730,12 @@ pcie2_port0: pcie@0 {
 
 		pcie1: pcie@50000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x50000000 0x0 0xf1d>,
-			       <0x0 0x50000f20 0x0 0xa8>,
-			       <0x0 0x50001000 0x0 0x1000>,
-			       <0x0 0x000f0000 0x0 0x3000>,
-			       <0x0 0x50100000 0x0 0x1000>,
-			       <0x0 0x000f6000 0x0 0x1000>;
+			reg = <0x0 0x50000000 0x0 0xf1d>,
+			      <0x0 0x50000f20 0x0 0xa8>,
+			      <0x0 0x50001000 0x0 0x1000>,
+			      <0x0 0x000f0000 0x0 0x3000>,
+			      <0x0 0x50100000 0x0 0x1000>,
+			      <0x0 0x000f6000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -830,12 +830,12 @@ pcie1_port0: pcie@0 {
 
 		pcie4: pcie@60000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x60000000 0x0 0xf1d>,
-			       <0x0 0x60000f20 0x0 0xa8>,
-			       <0x0 0x60001000 0x0 0x1000>,
-			       <0x0 0x00088000 0x0 0x3000>,
-			       <0x0 0x60100000 0x0 0x1000>,
-			       <0x0 0x0008e000 0x0 0x1000>;
+			reg = <0x0 0x60000000 0x0 0xf1d>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x1000>,
+			      <0x0 0x00088000 0x0 0x3000>,
+			      <0x0 0x60100000 0x0 0x1000>,
+			      <0x0 0x0008e000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
@@ -930,12 +930,12 @@ pcie4_port0: pcie@0 {
 
 		pcie0: pcie@70000000 {
 			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
-			reg =  <0x0 0x70000000 0x0 0xf1d>,
-			       <0x0 0x70000f20 0x0 0xa8>,
-			       <0x0 0x70001000 0x0 0x1000>,
-			       <0x0 0x00080000 0x0 0x3000>,
-			       <0x0 0x70100000 0x0 0x1000>,
-			       <0x0 0x00086000 0x0 0x1000>;
+			reg = <0x0 0x70000000 0x0 0xf1d>,
+			      <0x0 0x70000f20 0x0 0xa8>,
+			      <0x0 0x70001000 0x0 0x1000>,
+			      <0x0 0x00080000 0x0 0x3000>,
+			      <0x0 0x70100000 0x0 0x1000>,
+			      <0x0 0x00086000 0x0 0x1000>;
 			reg-names = "dbi",
 				    "elbi",
 				    "atu",
diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 5c4581410a40..c9638684e3b5 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -1035,10 +1035,10 @@ &uart11 {
 	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
 			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
 
-	pinctrl-1 =  <&qup_uart11_sleep_cts>,
-		     <&qup_uart11_sleep_rts>,
-		     <&qup_uart11_sleep_tx>,
-		     <&qup_uart11_sleep_rx>;
+	pinctrl-1 = <&qup_uart11_sleep_cts>,
+		    <&qup_uart11_sleep_rts>,
+		    <&qup_uart11_sleep_tx>,
+		    <&qup_uart11_sleep_rx>;
 	pinctrl-names = "default",
 			"sleep";
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 3780642fe483..395489c65242 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -872,7 +872,7 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
-	expander6_int:  expander6-int-state {
+	expander6_int: expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
 		bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 48fbf0650f0e..69f05bd0169f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1204,7 +1204,7 @@ panel0_in_0: endpoint {
 				};
 			};
 
-			port@1{
+			port@1 {
 				reg = <1>;
 				panel0_in_1: endpoint {
 					remote-endpoint = <&mdss_dsi1_out>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a83cad8efb2c..6e7a8606d179 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -958,15 +958,15 @@ &i2c2 {
 	status = "okay";
 
 	eeprom@50 {
-		compatible  = "atmel,24c32";
+		compatible = "atmel,24c32";
 		reg = <0x50>;
 
 		label = "strap_eeprom";
-		vcc-supply  = <&vreg_l15b_1p8>;
+		vcc-supply = <&vreg_l15b_1p8>;
 	};
 
 	eeprom@51 {
-		compatible  = "atmel,24c04";
+		compatible = "atmel,24c04";
 		reg = <0x51>;
 
 		label = "strap_v2_eeprom";
@@ -993,10 +993,10 @@ &i2c5 {
 	status = "okay";
 
 	eeprom@50 {
-		compatible  = "atmel,24c64";
+		compatible = "atmel,24c64";
 		reg = <0x50>;
 		label = "core_v2_eeprom";
-		vcc-supply  = <&vreg_l15b_1p8>;
+		vcc-supply = <&vreg_l15b_1p8>;
 		pagesize = <32>;
 		size = <8192>;
 		address-width = <16>;
-- 
2.53.0

