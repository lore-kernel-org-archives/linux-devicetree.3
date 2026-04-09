Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC14F3C5DBE
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758421; cv=none; b=GZJiRg5uaGtl4NMIBo+8IdChm7jv1Ci7C+UJk5ih8BeQ4xr2OrBctnCk3jzuI9/pC0hM9jaNYRYghtoOK3vgWnq7A7nCbgOXXrQotso+gKP2ezltsJQ9avJnGCefAV60Lyjcj46e+Rkmr0HXfYGFq/YrPLHHsqfTAYsQRYcYHy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758421; c=relaxed/simple;
	bh=0QmG7Nj0rfKWZwBLXocajkJRio7sC4Gbptb9TiEZJkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbFBXL8IM3sIkPfuBwfZvkyGcnKu9Q6DrZyFzqHayKlPCg9cyyAokaufvtqt7YAVbvDGQB8E2JxR6gjeI17npEoae9vUH0b0InnZEgLwXepeTu9jubSR+VsmlpKJ0W/uKzFAiQTzmqOH9w1ttz5fTPB6FPwiPPbiULXFeownIqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjIAyVLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuhHuSLi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjIAyVLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuhHuSLi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1RbE1972532
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 18:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pBG7ZZRIXh2T9+RFidk6AGZvRVTXkuwriiF
	U0m91UG0=; b=TjIAyVLXmPTN04g1YLrxI7pTE1Ke/xDw//ZOOjYC+iNoST8Q+eT
	7FCtZ2obD4HoEtVVGBqZhazMaTBa1tHCXTPkx9D+MCGye702Xu8Q13EYRMrSzaKU
	6wWwp1/4vE01hfTF7/C7xynTkWvdUtAyzd1lkoRRtyUXcL/WpkW5Zmp0no4wyIkm
	TPENxiQ89fHVRWwb6Xq+J8mKa0LpCGjrnxCb+kCydAKnBZwqZZM5SfaozaD62O5Y
	EcJdHRmqHv4YmJJzAIdTxmkF7sV2Rrgw4SwH79nD3LptFAeHoomobs+Ozq2e5ZWy
	S6gqa2Toxu5X9M3evrFvMz9kvlaxQPy3yxw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms16ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 18:13:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c769b25315eso1565281a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758418; x=1776363218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBG7ZZRIXh2T9+RFidk6AGZvRVTXkuwriiFU0m91UG0=;
        b=IuhHuSLi5XgPh1gWYVcQZoX+fTKUGAGUz0pXXHAaGKyt1NoT19unpmSBHqZDN3xBJs
         zuWZwAS/jl11KUFpno1LfaQyQMB2PAB5CAbsG8DIMBsQ/qKl9O7PND9zjBAgre5uFClS
         gc1XmM+2YqB7Z1RhQLYfP0r4N3NoIZkBc8mC7KdzpwYhPkfj/vRFbVsNfVg9F8nHyTSP
         2n7kYA25c1IXuJApiYkNj7AP8c019cNxi2dxD2qim35YbtNViUOtBJWzGMulcofaNjaa
         j1mvsss6TM8w4m+++XY8M63EPObn8PYIXjtJdwKOmbLY/Sa5dYIiQOTrK7Cz+xLQ4wmr
         0g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758418; x=1776363218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBG7ZZRIXh2T9+RFidk6AGZvRVTXkuwriiFU0m91UG0=;
        b=k7uELjeUT4bLfOlkUb063DK0bYdWX279KI0MgRIL5Wncnzxj9s9wjPSoNRTQEbdR1x
         o4+izBIb5ATSl5k2zJrdjgzkCTIHM8000fXr6L6LmOb3v3umIRKL5cH9HgDnOjufowEi
         Sgs5g+fTvzQTUjCBWYrh3Q3gmQ7o1cYPXv/vPYk9DsWqIp153oklhsIe6KAzcWGj+0yu
         e14GLUZdmhNiuxQSTYveG/xAbHhQ7/Y2AzD7ZeDnetjCVb6F6Iem90j/wIre21VkuMsX
         Yxmfe6ePgAQ6ECvzcRyIJi1XlFTyH1CN7jG91LcOJu9HNE4nXV83lF2hELuesO+fI7jI
         fsKw==
X-Forwarded-Encrypted: i=1; AJvYcCUJcHZVr7CPZoQvrbrsJFJKX0uYwP0RM94QtNID88AVAjwhFIEONEtFFSGHjFiTrJ86wvKKKQdfhhYS@vger.kernel.org
X-Gm-Message-State: AOJu0YyYmqwdk+qpnvHAa4YtatOGjynSf0JcxQjcuUpQPOltmysgwuER
	EoJhoP1uoiTocIPAG8lzzqadaq9iYfhLXC1THTg3bGyAl89R7zpbctoPoUkjtFZJRPwdxTH7YF5
	6/2Lugz/cm6yfp6oP+GJHnPkQ3BN5PT3X8/2h9ftV99W7wv6/KfuVUAT8Emg6IMfF
X-Gm-Gg: AeBDietXWcLFOYaov2Yr/EWWFdEFdAweVNvUiNW2A1xTiG/4VHU/U+s4FvbeC2kJQSV
	tybtu51Ls3KVGvrViUQxZb7tU3astL5hvr0+CTnCU25Q5BzBaAvSxuGV/IrW9knwHYsi2OO8JlM
	VKSRQ8nX/459GSFMSzekngkoeSFyZ97lnc2/3xlEIMXZVsbmHaP70XNJfn6vrhv9EFA5zik2fFo
	xo/2/yJ38lrweDKsjcCKErPpWNQf1I8EOTFB5TZo8uQiD7NdjGKH6O1+/e0Ysy2/lkhODzWeVD6
	TflVhDpOh/9PDjsXDMovMf85TRXPk5PVyzCW1jjHq4n0hRv2oYKRilsqhA0R8tYvpHGEKJGWyUv
	8uh1y6lzlmv5FVMbs8elvIhRKKpjIvLt7JQWOUmcvzdyZvaDY
X-Received: by 2002:a05:6a00:2d23:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-82f0c2695eemr228983b3a.2.1775758417353;
        Thu, 09 Apr 2026 11:13:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d23:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-82f0c2695eemr228930b3a.2.1775758416664;
        Thu, 09 Apr 2026 11:13:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4fe98esm82518b3a.50.2026.04.09.11.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:13:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Date: Thu,  9 Apr 2026 23:43:29 +0530
Message-ID: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1VgWTKZLmPCI9ZqjBeeUXIZMZoQBnmoZ
X-Proofpoint-GUID: 1VgWTKZLmPCI9ZqjBeeUXIZMZoQBnmoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfXyJdgtxaVDd8j
 TSCZBEWz7k3qiCTySEoSZeQmfPtfqIvETI5KLAAPLQS1sPEutY97QJDzLvzFmH26gX/l+z9+yyC
 /GIIqCJ8bPaxzJfWh0u6mvfACVCDicDqC58/s9W6vdANIBCPl7o6M/EeSb2ZJabVZVCUcyQgkE/
 0qj3IVDjhNyUkEViRzIzd3cnxpR70lvEz9z42e5wEEKQOCo8DuxT83u5yoN+D6sB6h3uvGAHkTl
 hJD5diRwzOnkPrx+lo4McLynivioCj2lLYQg3+0HuKeOAHn9izkVwu7xu5adN0q1zg4/UAs7MLU
 ceMxiAv49xIW0s92+WtNvX2Wwl7x12ZB8d2YntDxTqyQ10WL3KuiVRdozlpt6HHGQC8YKOY2vqI
 wlnqLCW/JlgWqxqsPJLcWG5BWdE4icA72K+DmoZGfDpyhSP1GkNCOF/Gxcfi3E/Zkwv02KbFlWJ
 nk8DDU2QFrkOFAd6Tjw==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7ec53 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4CGqIW-RtR09rGJT4tQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167

The remoteproc_adsp_glink label on the ADSP glink-edge node has no
users in the upstream tree across all affected SoCs. The only user
of this label is qcs6490-audioreach.dtsi which references the label
defined in its own SoC dtsi and is left untouched.

Remove the label from kaanapali, kodiak, lemans, monaco,
sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Not sure, if these should be individual patches..

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..39aad33f42c5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2634,7 +2634,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_MPROC_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..c5976e19fc4a 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7483,7 +7483,7 @@ remoteproc_adsp: remoteproc@30000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..e44a42173d2d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2795,7 +2795,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..3c9529bb2f76 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1612,7 +1612,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..6d36d377e05e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3755,7 +3755,7 @@ remoteproc_adsp: remoteproc@17300000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 				label = "lpass";
 				qcom,remote-pid = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..416991bf9cba 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2956,7 +2956,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..ffc4ab021ad7 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2798,7 +2798,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..e5dc3dc19f04 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2797,7 +2797,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..a4b71fd3ca14 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4486,7 +4486,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..63fcc6c749a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2217,7 +2217,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
-- 
2.53.0

