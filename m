Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546A37AA9A
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240498; cv=none; b=kPisatqyBYSHjbeZXLz8CyWYhpBn8MF4P8b3gImQ6Qf21Ct0IkarEhLhnGZaTA4mOqX6wbZ7cVSNfP8bKxlWSUnkTBHNhUjzZQ+aL1n+mh6Z0oYdIKEGs9wN5QBC/XH0+lvpWRrChozS67OwQbh6HNqIR4Ol2+0DWp95iHnfufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240498; c=relaxed/simple;
	bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I59sV2ivvtPGnwQusv9gFZSArm01XouHNIesZwuHv4g8IU4OWxFxt9mBduDLjd4DrNzBlCK9Rob/IrkajGDjmL/c78rDuW7mMsXNw6WPEAJ12dIBpr8RWGY1iIkNE3SjWXw7y7grvT8KKZbl/NCBcX4OTCq7U/Pdks2pMhjJoA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GROTOrvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM1Ojurx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GROTOrvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JM1Ojurx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jG0W257853
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=; b=GROTOrvtWA91ya+I
	NIjaF3PW3PCAsgzZsy2oyd2C7Vd/4dk5qmzcPtNztQxDdFWO8IOSkldBjfZCmJ+m
	fl8XmvU9DK4jQbhlM1ABMg2GVID6sagid2m3qIDiZ9ofop60FiK2Sui6dKR/03Y+
	sFEe72L3B3yUxM7X8uLM5hmlEDgjHhiR7RomqqG7Dskj2JV4jMMe34EPlTJeIvOR
	NUa8OEln/6whOjFKX/KJTLNp6l/1sh7xM4UlSB73ujmissSmoklFuSmg/g+wWJTI
	ivc2OmWdlaAdm1Q0BQ5VyVRYK88ScfE9jlLpCt8SAn3nB2Kki/pLEz32tgA0tcSs
	azLRVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh3jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:41:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d5d03ae893so320146785a.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240496; x=1778845296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=JM1Ojurx2MxPQDQqpUjgEhTikLUQOK/r7/zZvdUiU4hNkiUmOZqsNe8FC7W2SX08gO
         PSPe/v6S90Tuq5KJunO2oVXOZ8+RA3czhEdkvmcq+FCUrG5EZ6fltsQSo62SI/jsDIow
         fjllfB06BL/fpHN+Dytk0uvqCsc/edhF1UjMU3Tu3NiL3d3DhameZe8GGK+W10Y+8bq7
         0LCLemDdLibRyiUbgyODddk9HMp8NA8V4+Y9xAWEhmm+OM5eVcoGxgKgEMOgNT94Sqq0
         R7L4jxyg4neVXO/7BqOg+2ypaFV+Pdy+QcqjV7pnFPlU4tiGNoVRpeyjj922B2OoYqrL
         WoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240496; x=1778845296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=IHE2nIT1Sv54N7SS4E3W67LSYb2cc1cqjHkFmRBLiMuNS5UNpcA8uwa8H9OTR0LEgt
         eACjm3uolMEboKONdCQtQVK4dqXHS/9fSMbYIs5O5anpFm5SjUx2amSNRAqLxyYjvE9J
         Exn4BPCPpAKNcjsu+qpuL9bnJe68T1aKqPbMF63RzoA2VqJP7wx7iUJJVqs598Ld4Ixe
         HSz6YomOxisu3EqUuPWFxT6Ntg3Mn5a4ZVx1Q/qfugJ6fnw19BSXCtXdTaSUjZB3DS4U
         rYYEY4u2FN+K1FqJDBI3xRDD3sjl+nph6jfkUd86fiLZdg+9Dc33coUZkgsFgy9GNtn9
         SUlg==
X-Forwarded-Encrypted: i=1; AFNElJ+5rzD//39Zh9ln3trDAWZBHLzY0ITcGiw6B2Qlw4GGjsVdKyobJI0F+bUYm3VufGc3DFEAYjr2Mh1y@vger.kernel.org
X-Gm-Message-State: AOJu0YyHVBgg6Tzw52NB7s3PXOslkX52pOxJxTPjo0Zmd9PG2TakpKhk
	uQzONMgqbcTU/DJW7jIMRGuuZfgD8bNkl2h9SsZXhJ1Wki600E8YNHiQBm5g0lYclyC0AGMX/80
	6OkSOXWnUVZdeDa1h/cQnohIKm/5vJegeVLzAk/n5fCrPNXh+71v8osRDINRGJPGd
X-Gm-Gg: AeBDievRknpKosRCokQAgmZ1A5s5FfoLKJn1naR2c1Vb8CgxnCJVtr+5lKhyNvy0PA6
	9saDeKdvNaOd0J9YdxifcAMRMvstL5NHW7m3spvDhV2LodpQBGSkOMIZ2bVIu7lmP5BuLYAGCkz
	mHnT7atKjcPareigqbzdPqrWLZMIQbVSzvdFGV2fSGW/41C8v4BpBHUuXOqiCTtyKoGELWkFYBN
	PhJhC20bGt/x2Tl0ArPUoGvFeKL/o1UaMXx3cLcNlyXAihjjbbluGzexTxBSE8Y/2g14TTn30ul
	gQt7vFS62mlTgpZJHgywOA2AaY8EWkUzY/JS9RN0eykMEfGc5q2Yvct3Un7wrdtpGKCdQiqP+CX
	YJ24sLAKaAdPpgqEJTVuGXKMNlYJUPMvYd1fbUbgXD+x+sOxkM2+R5vEubR0i9Pl/HTarP2OMFp
	pwMgM+EJEUUP7Y
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794331585a.41.1778240495908;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794325485a.41.1778240495351;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:01 +0800
Subject: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1588;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
 b=CA1/7Y7o0nrqBZMiJFg5zW+YvMWC9lI4uYv6wvbhS3Hi2zKo+2rpb1GtKXFI+XgOs67OVIK5S
 MZTOB/rA+OvAoRCv5/tiwiIWbm6/BowPi8q/rYzmtiQ8jdGcn9W9EZm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX8547SzidSAx0
 pjxRy/jLgsAVPQuZvpT/57Zf1oAOLK38JTIxmkp5cEiDy2dwWAS2R9CNEa8EVJsCoe/bR2UPYOq
 ZUwDO4PSEesmn5LMsC101n+vjrgjschc8rdMy5jKK3KM4H49xfu+Dogsc0SMOduKkg1pkGrR6RZ
 xs6pDiOFg7aoHzNxyIv6DPLmKyxh2+cCQJKDoJpKgFs2JaDOkPYIjvfiKCZG7mS+XiBafS7XFg+
 5PesE3TZchFZ3FBR/XCVOLgDcSsfJ3xDWd/ZjKodqoDCrRHXoMvZOAfJq+6mbQwwOFh7KVBS20V
 3FURmNJ45gQA2ql/hX5nNVEzv+mQQGZczJpM2ykrmJCa+a354NZnFgc6sP+rMhtuuc682K8GmiY
 KiuG0c44sVk4TPmiRBaG0av2h/8E/SWkCltDuVRhrEImVRnzUl3ZfQNEUb70WauEJcZq5IWfT8b
 m9Bm5nO8/mNuY82SM6g==
X-Proofpoint-GUID: N56C0fExbW8f2Ma2ld8JrzWQkeIrYA9Y
X-Proofpoint-ORIG-GUID: N56C0fExbW8f2Ma2ld8JrzWQkeIrYA9Y
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdcbf0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MjFiaTNPcx9fmn49iVYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121

Define pinctrl definitions to enable camera master clocks on hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 086c94217eee64756b734f436f1f0b49d49dc582..235076c808e6f6b5f7861dfc5d2703ee46c6ae9a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6462,6 +6462,41 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_aon";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* cci_i2c_sda0, cci_i2c_scl0 */

-- 
2.34.1

