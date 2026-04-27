Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716A4502F
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777264477; cv=none; b=rCZunfFnOpvSj5Dr27urEaLzzn6+rhpSRs8VFtO2131zLhS31vmUZzuS5+4OhP26lJ5K5qITKsSIy3Y2IIh6JIDYJ4h+nxyFkUh4+aL5TYC7hzFctwpKL+IJVdBE2HJ/pmmnqR9NW7wysqh6UV8i76L4l/ltAlAlmCJOxJTbX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777264477; c=relaxed/simple;
	bh=zcTQzmuJlYdHw5hMfp2prGplNw/pvEvdI2E4sxKO34M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pn49XoYdmzCI9DmQxnvHeSBVJStPfOzWeXopo0M9joGo3HkQZZj6GnvPoSfIgbrLD9O26MnpjkKGH3S+YcHdyK0eWUuVffe3KhQXFCEB+1qQqU7Bw4UjDVfeqUf4bOpucB5PBUbyL+OJiwQYlon5z0G3O/vYbhrs79tDNHuNwzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzCnZ3RF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4Pk57Vh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzCnZ3RF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4Pk57Vh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMs5aU3625357
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jLD8q0LRIBYBbZE3QmPEzx
	vL9a3d0LQZo1rCSFwbico=; b=CzCnZ3RFGBXA3QRqlgD2mTPWStTWAcNjf0oTX9
	Iqs+01hsbtVQJtgQfUelN4QcA1tg/PSL5TDwHcWbyl/owIvXJjOvBdBnFHOPNL6p
	WaHrXe5LRZKq1YDkr6u8utSCLTO1xfjLLu0HSZ+2yrVxOp9tk1n0x6xgqnMTJ23g
	kkx0dZuSD30vOmSdmo/+BZ2TG1N16MSqdfZAWo8qt3u9RIwThTcOe490eXZ3iP18
	ENsDPvpFw3wulVTrouu/PpwJruj7GhjDxyKa2UXPJOLdMpbDdPEQBhPOyGDIDLE5
	+h/BGHniGalY6/R1KIAm8P1Ll1DReabCk5SlkU0M31rfm4mQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdmbc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:34:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso9631272a91.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 21:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777264474; x=1777869274; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLD8q0LRIBYBbZE3QmPEzxvL9a3d0LQZo1rCSFwbico=;
        b=h4Pk57VhRqEvazhlAe2IWPm6eVa3KZmP4MGDEQkMiOaA8nAO0fKFCHW264Wjyn6VVk
         lqWkdtPuSTdjdVHwjNDPjuIzAf06bsp+QO5FthNmrSyjKW4yFqL0S6jka4aJsnaQvrYi
         CLwtXXvUrnKjQ6zWv4DbnBOcuUZ26zNor7VoKzoHGmmFtE8du2tYvrwAf2Nz/Reo8vTw
         hO9NdJjAyec59SJWNTjv9ZjV2zCw2xS3DegbVRku+Fo5NpLSNZXvqzvHxlQBYc6dHCEJ
         3SYJhUcNVHVqBNrk3vwLK92kYB/EoMMsW6VoOrr+9w3Mflk+YmIjK4my5svSJMC6J6DC
         xLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777264474; x=1777869274;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLD8q0LRIBYBbZE3QmPEzxvL9a3d0LQZo1rCSFwbico=;
        b=HbGc55FYe9QcIM3I3f8i4lMx+NIy8A1Bk7BDv0P4E+3b74xFSKkyfiTpiHCnXw+h2V
         LdXTg5hF71PmsAhZ2zxqZ2+g7dhnuMi9g1uFHU+F84cqSfqQCFYxSwoxqZEaXz5Y0eNn
         y3wgUAQLtlZHczx+iFR53u5fNlP4xi3Wt9VzOz4Iw7AGOl/pmfNGVwq4sJyOar0KYNds
         UEZU8lWxAsPgtZVdOyQ3NONJQBjLtiO5Jy7NBMhnGuyDbsQR0Qfwln45JpoYPVKLUt7W
         R/bv6UFOc+gNLZYpG+7QfXzJVdqcGb/ktAtSv/JFlNnkBW8Tba03gc/JI1fUXcamiggH
         fTDw==
X-Forwarded-Encrypted: i=1; AFNElJ/qSHrhP84js2rtOOAXdztREjsVpEC3Gmgrt5APmAFdwRaL79X+AKl+6JGetiRQWMF4dJhqqnLlkpqr@vger.kernel.org
X-Gm-Message-State: AOJu0YyQDOp7BlJSeUXN4QC5a1wiKz0/OlOCkGSkCH4xRDonSSBtca8N
	BwA/NviebGxUh7z/zo1hm46JZFpNfdBUBbvXvtY+SwIThrC+jtfM6J1iIiAgaBqymXktHaRHsXs
	KohMh/ZOGKplu/nIe7tSgyf2AXQ63v70HD91/PwNB83IIPaSesZBnQWabSHXNBdii
X-Gm-Gg: AeBDies+2i+dh94LOIwXmAzQZJ6I0wUarUxhBFrx6HLSdwmBZ3NsjIQw0bzjmOZPtVU
	J5Z60Xj6y80suB9UyqtEc+okmr1lIb2eW+UZ4dMQ/5JT+CYmvB/pD8hiTIsoIoYfkqJjqsf2JhR
	ROG9ZBK3Is2Fza5J4OpG2zqSCzUhs5hiKWAJESOoLXNf0c90NWhiTcrviQI6D40qjS7jRaOhHDi
	z4wovEOMAvj0ZsqhrcIF5JWngw7CYzFAmB3++XcmOfu3x8K2+x54PcqnzB0yfJfhsGGe/0cJzTh
	DjKmojg6rkdfVPkSkSZ3Xa2a7niP6YOYtad/4pCSEIplJretXXP4++ulxlPDq9TClFC41fnp2y8
	ytZxhaspRAYH/M+Q7S3m+pv+KoDK/8amSSwi0Y9buTmjentBIiEETt774YE6P1mwp5NDGKF3CuQ
	TzSGS2W7KKGIJrRkpa0i8=
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr44267556a91.23.1777264474160;
        Sun, 26 Apr 2026 21:34:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr44267527a91.23.1777264473657;
        Sun, 26 Apr 2026 21:34:33 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1bc9sm11218560a91.10.2026.04.26.21.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 21:34:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:33:45 +0800
Subject: [PATCH] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACnn7mkC/x2MSQqAMAwAvyI5G6jBDb8iHmoaNQdbaUUE8e8Wj
 wMz80CSqJJgKB6IcmnS4DNUZQG8Wb8KqssMZKg1NXW46I178JYDcoiSdN1OdCeScb0jbuamY8j
 1ESWr/3mc3vcDujfbFGkAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777264470; l=1219;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=zcTQzmuJlYdHw5hMfp2prGplNw/pvEvdI2E4sxKO34M=;
 b=ZrRfWo4oqOirHhMKnLrhRWA+MfOQJFwrLoJMwOLvU2clM10BTWaCDFpPh6BLyIuRnZKYAulKv
 WL515l5vK3vCq9pvXEkqaVNjlTtv4leT1HsmdBX2o98YI2rzeu9fRAr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA0NSBTYWx0ZWRfXxDDY1o+aO6m+
 O1JMhGKbB11IHAdJYHRmKNnDtO5pNU4xBBOOIk7uZ2OeUMsrLS+f2CdNGWbjVmMEXHMydRKfG54
 FRb5Nu1QM9rK5P81X5U14MbkgNYZGd9z/Uw6lLdwIybGdT9gSgC7AEsprlzCDEhcx+9vBczC01E
 t8AUieMe/llV7ZRaCojwyev0yHPOzinE+jrrGSFR5/MkfPTCCLje+KpV6W1OHgRlLwTlB63Kpaz
 FU0uJ5sD3HjKA4XfcfE68yfbV2dl0TKkmyqgIr1YzYQUsedvuus8QRr1gkbgnoMerzREaDM+Q++
 X+yCSUoIb9GRH3M/cQHATIych/hYNxhKyDmcETlPpKAq8ATmRsCInPLZUwTDvJFC9rethXmYbEz
 OlXGb0+v50Rj2DcV6mnLQ6KKlbPHrOmroK4nSni3km/TcVHXTpbgNcuYNLJPKgkL7cXmCbZc7ZK
 +Aq+TX4TuaH8z1TZQqg==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eee75a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1etcwcUoXHP-D-r6DHIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: VDXZxR0-UD_LPvgugM569QsdADN9dlfi
X-Proofpoint-GUID: VDXZxR0-UD_LPvgugM569QsdADN9dlfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270045

Fix the wrong connection for the qdss replicator device.

Fixes: 0f43254763b3 ("arm64: dts: qcom: qcs8300: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..50fd8cea88b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3013,14 +3013,6 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
-
-					swao_rep_out0: endpoint {
-						remote-endpoint = <&qdss_rep_in>;
-					};
-				};
-
 				port@1 {
 					reg = <1>;
 
@@ -3730,6 +3722,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260427-fix-monaco-coresight-dt-20d8d2c5b57c

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

