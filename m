Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25804372B2C
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863593; cv=none; b=VI5idr8wPBabUppPtqkxBwob0B5jEuYkSFKfzIJjIL9W71aV03iMkcRGxYDCAtizmq+stX5jlmnkA363YepeK9ayZQX8J45oinn8wVxRrNIxozCRQ2AoIFfAuAGqwbCkKBgomPpPn2w9fScsAT9VOrvllJuxEWji8uGIs8LXk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863593; c=relaxed/simple;
	bh=fhYxZW1/oACvCmUKie0T0Oy5TfW5h+9M7T9L2njIcJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HYmuuBG6wwgoMTsZyRNgkW3a26g9gJdKifgy6N2i2s73S3pAn1TSLdTqnSeGretfmVzmIOXxTVlhSk5z6+wE3BUMCDIM3LpYCvRY2zpv0murSvWKxNewbVaSZaVHr2E/eLqdk4eukopVhlQT8WM/xGgTzsw3ttC6qT7vAxDGQNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gflOG65V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNZEtKLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gflOG65V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNZEtKLd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U51Dew2229496
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h47bOWyPfKTRieC2p4rGGI
	BbvF+Fy8LzSg2e4NkBkSQ=; b=gflOG65V+TpuL0WiwZS63yunnsZstwdIZoYgT+
	bF1VZ/tMJBV9IxBW/JNKQhrmbsCGl2mIdhjRFlGMz4TJxpO4eNM7Tyg9O0mkJnBL
	WgMJ5vsRgqHQXFE8NqqJoF62Ke11oxJ8jI3wfZmD0AxElLQ9tbCsztne5o2XGZwY
	e+eKeRDX0NQCBBqHeDifKigfpr0k79+/0vtPVlpZwn+p3qxmqhqAciC7ZOYgZpF8
	8xMx5oGX77bAi/vgcMJmVqfQY7gNJbH0b5EkQBkAj2PpidnEgZ6wK4yAZstvgSAd
	z+K5H8DKrmZq0uCFse4c8bIYSHlyDBxcJojAH8VkoJrRBXhQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3fax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:39:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c5b48baf75so675620eec.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863588; x=1775468388; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h47bOWyPfKTRieC2p4rGGIBbvF+Fy8LzSg2e4NkBkSQ=;
        b=WNZEtKLdnsD3KXHM7w6v0mERglV+/oLrCXgwuFivoVjPHoMfiTAtOutto50TjhKjVv
         KG8Pcs1P9z4UBVtJPiEl15DyBxODso33E9qXwHnnSOBV2wUfgDOnVruqXxx9XNm9WMrJ
         NGwyegxyuF9q/KbQ9tCFgve5jNDL5WcHkKvF2VPXpYM1NqJJc3T4sNOCvIuwrH54on9J
         30KHcbmuxRYWTNSgocAw32tqRsQmbt86r4i3krT+Ri+V92oC5m0xSlsM3TZspAf8E4C8
         qBtFSRCB4wjaampqPk7kRePvem7uXFwTidXa4WOaKgEawfVnOTIYZjk4JyqFIYJb8Psg
         Cr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863588; x=1775468388;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h47bOWyPfKTRieC2p4rGGIBbvF+Fy8LzSg2e4NkBkSQ=;
        b=XiWskvTLcXt/SREHzhbAc8D/BBOVAiAcVO8TfZ8xtpl5w3Bwu34ZhRgDhGGeEiA9go
         ve9Z7qwmlti7H1mdWNbIxeGOrbzOZqZFSu5A7W5juW109rhLzuSzG5IXV+gV45n+qaSu
         C3iEkpDm18IKEUCcZvqqYBUl/sl6/F2TEwfkcC3XfOB80RPGzuhsy5Hofh5djg1Zy5Fw
         skOdCTd5M9rwY8gTEWmK0HUltaTsJxScGff+nBu5FZAPBJYCMZPpTCEl4VdwThj4iGJe
         g/BhGHsEtLD2wSlS8aKh2uCXHZBOG/hWY/3irHMnEm1mjyoNTWpquuBzHS/zAJCy6mpb
         OeMA==
X-Forwarded-Encrypted: i=1; AJvYcCV6DLk90cxDn08B3wAaYopy0BeQbQCiduedx58CtOrpKqOQiESbNOcrpPrH5suzS7m/siU/uMdLnj3R@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9NFr3BAwefmhYMRKOl+2EmsLQU6TciO3hkawIjAoksxeBgAT
	xOHcW10cl4x7rovtYRzhKuqlKD6xFFNHfRArk7oLOQMLKJnEh1kCPOcIM1W5CM91hBPbFIb4+E+
	JSHPwhtHCgLGhllGvL6FCD8TB5PX5jFUHt4A98MJSOmYMTDl0AJoyuiuhK55ZZnwM
X-Gm-Gg: ATEYQzwvsrES/REinWH0EV+yDuY39BuK355DpaPVdpf0VicIrfeAUmzAowKeNARMRJ0
	gka03IE17cbOcrVeDkP4+Yh+/TaSzAzMh9yUc9TG1zxXDnp2KdHPRAeiTjGvJBY7lFBn8zKcuhx
	mPUuJlyn4yWG9kpPqnnjQdg41T2nbKuAYhGyq0B94V80Ani1v/V43rnBOmm5PCeRNzH5t/YhXGU
	ixODQl4B40+/S+qWFypWIM9syWL6I2Y9ntzkfk4xc9oygY7Hr41b5GXR8TIJCeSTRSeACDqQRWP
	FZFUGC3fnp0/YUbBiJkXvRRwPr81c2zr2YwOhNyV6nQ1WeHGwGmiF92DmDuJGNYU8Dwh9oPEg3o
	1t6XX/4iB515FcCT85BhErGaAglKu6Fg/P0eUr/WIpFeCBLpDnKQuhaxwgR/DapglLrv3/nwX
X-Received: by 2002:a05:693c:3008:b0:2be:8216:57db with SMTP id 5a478bee46e88-2c185ca3913mr7247438eec.3.1774863587993;
        Mon, 30 Mar 2026 02:39:47 -0700 (PDT)
X-Received: by 2002:a05:693c:3008:b0:2be:8216:57db with SMTP id 5a478bee46e88-2c185ca3913mr7247423eec.3.1774863587476;
        Mon, 30 Mar 2026 02:39:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2721sm6266521eec.14.2026.03.30.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:39:47 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 02:39:42 -0700
Subject: [PATCH] arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN1EymkC/x3MQQrCMBBG4auUWTswJlbEq4iLSfprByWGDBWh9
 O5Gl9/ivZUczeB0HlZqeJvbq3TsdwPlWcsdbFM3BQlHiVH4USp71QzOT2hZKkODTCNOKemBelc
 bbvb5Py/X7qQOTk1Lnn8niWGkbfsC8pG/9HoAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774863586; l=1094;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=fhYxZW1/oACvCmUKie0T0Oy5TfW5h+9M7T9L2njIcJ8=;
 b=mzcRK6+5RnlflB73JmwaYEq3qILMs2TE0BvNEPjSSQW693PeHlk3sc1mUlP++r9Bc2KUWMzVa
 QEZ4ASQYOMuDdt8whrFihr2qKamBd7e1oqfU5iLetUI/ayVNwrmUGB1
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NSBTYWx0ZWRfX/T40oNRWs8pv
 vLvP9l41XUGYA6sQbrCvDPtRGbHefOgsiHMpxg6DOQpBfIekht64JdM9G2WjjFVIq0NA5h8fyPs
 zIxqxqqDHnGB5FZpzAYW5poT+NJu4r3Co2DS8xSSm+qw3S4UXwn2Fewf8C/JqxMITiFcqtvumKs
 YDqz0KG3JyHXLPlE7JgFhy/CVBS+zvueLl3ept1yPpq14JKHInDPKjb8CmtGBPiI+5L5j1gD0Jc
 iKaqCLBegTracoR/8KW79DpQ7WfFlENvlern6LokGreTmwFJvjDHLXbG5MmLOgzSAU5ljQdvI0e
 QQrH06bcVNVJwAjvSRDGYgl1iL8BFhMchAxGkcwMbWTnJ5Hn2PHs/SEnU6RiG7eoS2ynZIJ0U7r
 mO21DeQoKb+DRTgvPlA4bVITdb8Xu51J6DzLDO8fUJ9cfzX4HbGox4HUzWvh9olj6sH8RGug01M
 fnaRrTFhrjdqzPxZ64w==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca44e4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S9qrxxQzeJ0pvEaOSPwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: SHP-Y38-CKfLhc7YLIaXcLykcZH2tEVJ
X-Proofpoint-ORIG-GUID: SHP-Y38-CKfLhc7YLIaXcLykcZH2tEVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300075

Exactly one space is expected before '{' characters, clean
up duplicate whitespaces.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ef6add4e5a90..7cc326aa1a1a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5838,7 +5838,7 @@ compute-cb@13 {
 		};
 
 		/* Cluster 0 */
-		pmu@310b3400  {
+		pmu@310b3400 {
 			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0x0 0x310b3400 0x0 0x600>;
 
@@ -5899,7 +5899,7 @@ opp-10 {
 		};
 
 		/* Cluster 1 */
-		pmu@310b7400  {
+		pmu@310b7400 {
 			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0x0 0x310b7400 0x0 0x600>;
 

---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260330-knp-space-cleanup-ea20d5e8bba4

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

