Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88B5511213
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687422; cv=none; b=qcNyEiQ64bXcNM1tYiRaD4CQMV0V0GO99cBZd+B5NnEjgOsM2yBI1Nwv4pMvRANOLCBdoWIjOUbcMsp52nZReiyUlS6xi7maMV5Oi6aOxaJXlVLniOP2wvJqQuqFmg1UNGCMQmyv8ZXIYLkCnMx95eNJbmOuHp4vqFOo3+Z3S1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687422; c=relaxed/simple;
	bh=0roK4/UN1hPU0Gu9Nf1oUEb9cysvcUMyswTmN4ms4pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLewVy28NK+nj1jMAul2QQtCDOeZJ4sYyojlczetfhUaqSBI3+hMhz+6eNqCbNTGggkX98wcx1iA0oOVaFZafPNzBZWYooEx8kpzJX/nY6EhOO4EYiAU7j75q5pjOOi6kbikgfTeEDuqi/uxGix8jVYvXdEO2J9G2mJdxe7ETf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifMJ6F77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNGwRkiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifMJ6F77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNGwRkiT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw8Kl3301599
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YymFEpj4pY2BPa3HsmXSxzEBxgkhnRQzuFGF+LWjNcs=; b=ifMJ6F77Q8/rbkf3
	+jZ/ebFyw2xm8xSRq4H+25yfs/ZDECGrTn5ueyup5DfEOUzZUNqX5m1BkLOh4Rb/
	xa2smgrGFXvlYfuR8lbzDokfOT2kymAP69gwVmQ0AwCk84juYbKD2WP0bSMu0SN2
	n+5JfwG3XAkwWKimSEo+n3yVjVEY1GKbxiKI9Qx6ZSGr/VmFJPevo7YBh7l0TBek
	CFGX5cXoaylRLB/soS0CqDir4bUoxq1JK2s1joV5y4FOIZ934K/rZizd//vswTPN
	SUmloW+kQg9yZLKxBV87WC8dZ60Yvz0Rv+1cOlzSQEo4yVYgLGl/OBjyrf916mFC
	54ZPEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx029g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53124d6a362so123306891cf.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687419; x=1791292219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YymFEpj4pY2BPa3HsmXSxzEBxgkhnRQzuFGF+LWjNcs=;
        b=TNGwRkiTe43jYD0GONqK5rqKesLYKDXGInf+PZPxireCHYlSHzUQ97T3BPI5LH8qWj
         cp6A2IeDWuRlp6LfKEpBSXzdvpe2B5KoC8+/glO0JmEkQ72jwMvAoGGUjY+HrouZsTnE
         4bQSx20/SyBwFE2HxJvWBM4bclAj26264Dk+MuhnAPzHf6Qg+S81z9uCDjaGuGFhqhC6
         JLuqX15RKHj6tQJ6Ycrha4bWngZwe8cTwfBI4YQ2pmmGQEerlQ+OvLjWX+C9URRkPS8e
         wj/5PmcuNkORBm1P/CQx0G9AzW3ebq7czG7WZb4gcnMn0s2I13JfIx717trG1ZT6p2D+
         7ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687419; x=1791292219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YymFEpj4pY2BPa3HsmXSxzEBxgkhnRQzuFGF+LWjNcs=;
        b=WxD+SQ2dRp4DIxftLMkmtvEEyRzyKr9s0r/XilOZoIdi6DI+KGnONZrmeqSbFvxuPY
         IGdOa0H158TqECNyR5tlSwyC0p4we+hVWKHnFoTunRElB3uj0XZQv6PI6ukNGOUFDF1s
         ni8B73v1jLF55q7UkSwtPWmuXJXdm7VpF+YWLWnjDWbRJq8if8VYWC1OsPjhCQoMSfey
         PcDfmxSkH3wDtS6DWAM9ZuvKkComNUvY0vx3WQ4XdveFyxuacoEqNBO7kkTlzxA3EYQt
         G4KRRIMW55U8alWywayzjKQu2ENDQlJwEkmGxM5DbCnyHgESsOleeCjO1dvGc6oLF3T/
         yojA==
X-Forwarded-Encrypted: i=1; AKwUvBzv6+ehyG5a0YrvoVqRCw6qIfl+t9C+bRcPjyJZCACHxKguHlGusvS52xPAe42PUeHY1uWFJyoNm13s@vger.kernel.org
X-Gm-Message-State: AFuF++kYn0DNtu15An7kkbElg4iyNtoj3nr4nZznNg1XO+jL42l9KtRu
	FMDfjm3USTAAXXZ0llgGAfZPEy3a+ot+5zkz3A44DlsI+HMtFVUcgNiA0o99ohwFnIQMz9i4P5+
	NViEw1/gKXjOGnKFjuB21Ide491LwMHPABQWTdQk3/su0ObZUt7IRheb8JdzUOgbK
X-Gm-Gg: AYBFou2ZoIz3QiitdE4KuIjn94g++umnB5sFWAac+SpCMsb/UT5FZCYFg/Hd9Bp5ZGl
	hKgVEVkr7j3f3DZA6jA14oPgYha6ZkAQgHvgRjr0VUBQTtiERLKTXd68t4Q5c5t2VUZx/UisD72
	/XU+3pKgriZypZ82QkEsFKEjFmaaHgnR8pngfXscHZlctxNZ67X09m5VubvHKa6lO7Gs8EnM88H
	l0uNk5xIPBSY5j6aPBWMZosuLcVhDXCfHYsu8uvan/noGBAuO/1Yyh6gMmM8ChPpIqZMYq6E7md
	Z5n7UFBz9secVgpYvucqKS7Qrk9qJEoF52pMvUUTjtB0OmuOId1n2oa7RT6Jb9wRgpoHQY5O22Z
	1BYqMvlnKazuxesHgh8GLuJluJZA39na9v1g=
X-Received: by 2002:a05:622a:2a09:b0:533:24a5:f3a2 with SMTP id d75a77b69052e-53324a5fd8emr185002521cf.45.1790687418976;
        Tue, 29 Sep 2026 06:10:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2a09:b0:533:24a5:f3a2 with SMTP id d75a77b69052e-53324a5fd8emr185001471cf.45.1790687418223;
        Tue, 29 Sep 2026 06:10:18 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:17 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:37 +0530
Subject: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1167;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=0roK4/UN1hPU0Gu9Nf1oUEb9cysvcUMyswTmN4ms4pw=;
 b=UMf97heEuJtAno5kcDZwE2crP+mC87anY4pxpQPeE3ZnpLyFvckh452UBsl0DprDIT+WIlZSm
 C/an+eRvUXMBkx2/mX3UpcdP4SKu80mhKq7MRD1tGbQ4KRRHpoUXt8e
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX761cG2lGzpzd
 +1j6zyLvwIuII+WIRQ5mV8bHDXx18s/U1WVgU8VL5dXZqbhuBID399LFUohEVzeIwK7z3ayecJl
 FNSKQ43YPG9OetNAC10r6TuGIOopy7R5JQb7SCMX5q14HzSWqrOCp15eBRqeeSSqMJ/hr1sIIz7
 HpL1NHQEG5QMGg3H9eiGFdyqWm3BEloksyQ6aIoUiPFyAYHtPQDZE6U5Lg46Dp2m4dyM99ebu6N
 fSSaWcooJpUMAube4p7c7vgApu0hsaxQ4DytA/7oCxswRJNoMI9qZAtlu88bFcvXooSMcIWaTLf
 IcuEoq+01kPv8hM9Xbb2yjdvKZyCHmuuMQXrgbM04XiUe1HeiOh4SfUAxNEvGnjlVQsFOAmTl8O
 bCRhZohzXeOx+XNLfJKQGE2ewkZHyuzQztrUY9ttteXtfxMvj2fWQ1E82fcSC+nBz/dGn8XDfk1
 i5GuBmr/nskRcOXcajQ==
X-Proofpoint-ORIG-GUID: WlrFZbPJ9xSk4cwz7oB0lwSHf28yo1fc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2IkMETm45hOZ
 sIPiDRliHaXJ4t7GKTltseRt7qcnb3J2R7TfFQxXuM1OTok/ss5kDzUIKeAL8BGLrtlDuyUmOnb
 Iim+5mGuFIaq29gj6r1h9RKTBYI5rHE=
X-Proofpoint-GUID: WlrFZbPJ9xSk4cwz7oB0lwSHf28yo1fc
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbb8bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..9cc734001a68 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

