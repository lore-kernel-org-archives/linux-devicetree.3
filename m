Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE046EC8C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658643; cv=none; b=Xrscd9IQ2Sx5FgeeheqMUUVlCASXTDG6cVX20WFR0S3WWsNVi4ctDzrpLENiyGs73eVbM16wUgTvVRwHfHT/qhyXkXGhdi3DKODIrYfGMM1BSqXqd/guAADvOEbnwOcMOxE1x2+3na6YGncINEAmPnOthMgMXMZSDQqz733nlV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658643; c=relaxed/simple;
	bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbW0IN++g/rgiHtlcGBZJvJoBG3kovEejcaW/tVH5zX6LoO1dL9rkhtyVkcWAUhc7bEXxgiBEkmeA0cHR8DXvyKz0r6tsxLu4T2CBEdyuxSiPBwKKWbiEAil+zSHhPH0FKTS+k9exLwBMMP3w19QI6AM8N53L8UiV9xO3w3p0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phe8+BOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvzxCRI/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phe8+BOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvzxCRI/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPYxC2115803
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=; b=Phe8+BOH2X3l7jOg
	TT6BmeUa9CbCSp7+oLM02ZHlpZPdA+H6OkVcafE7Rkuh3/pVjC1/bLFclMA0UX0Q
	zoJXRKqLsloVYy6SnUtqMMnOLGZ+zAa+a0sKWv2e0G/tPEo3DbeYduSvmWkG/OgJ
	n9UWOCujdm52fCp2RHxjsRtPj/EppthXr2o6KB8hWAsa0SQZdWQofR/yRQIE/4Ge
	67Qm9vd/lKGaPF3I+3ovY2JodRoLhzM+18LVap/iOAEjdvS33SLCI5alsPQxufBU
	nJ4vSWigYsiS6Mxkjd6G7/qyoiw1oVZ1+gVQUz8Egrh3YrMLiP2IDlsaH66cBxh6
	6JlWmg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e0a4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so16845940a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658640; x=1785263440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=hvzxCRI//jlvmyEULud5aIEJ1mEVj144Zyg1Lz5ilRIolAzvHyPNI3hUIf9P2P+RZX
         iRWPD2dBywSD4bBLniQJbwXgEL6Bwt/HphVWM943Viy2WHo1LggZ3jwMKBKu0bHToyyd
         nheucT8pkbidOdmq1F9S+HopaEBFluBv3Ah8lJoGwwnw5muvPwbg3+BqD5baMlYTRWrR
         QlyUBkV538ZnXVrEHp/UC85KViSN/ZVDcjyemAPSxslrK4xg+bkEwzP0HFqFDTAD0ztT
         a23yYB46wJWVEJs+sE/ZXKq5mFN5OfeIT8kOiOI09U5sWCsFWLYQBvr2/E/LJ4VIqxcB
         QHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658640; x=1785263440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=cPA28xgg1sKvDG3afSlAz1/sCgHftdllNc+FalG1Zhg/gE+9U/jOgFkRrNNfrnj9DW
         DvV4WlyXpKG5B4umF4dIJOjn867bnd16X0pLZ0oGkztuTHt8IJjsUJqLJCJOaBHKWD/h
         KbnvpQO5O0h0kSuNKjJh0/IU0/hHLgUsWtvJHn1ybfMoTCSPWu1Rj6sE30DqK1vzvxmH
         fCgcYavgnA4U7JOIs5jIvx5tEgGaK/woK+bXQsIk0VFWaLHPTpE0XDx1DllIam0M9H0N
         mVv4G75uTm0hGQ8Ycxu8NUS6w7DakwB/a7pQsak1ouTUuRz75l2txZZdEgS6/bMP1tlc
         +zKg==
X-Forwarded-Encrypted: i=1; AHgh+RpVNuESFpldnqSYM9zwzyIUaS/t0rJI8W0gFs99JmzI+GaRSLf3wz5DYD1W+4M9sU433LK87gsq2SYk@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKpL97iL+koE7xGdXrsTeXoQzCgMHHYZfbU1RoIduMGsR5au5
	aWEI0oQ59ro69jAzUrdeFYDImLnSCgC9jNA43bC3TsXiQwLRqRPONcZZ9NldPZBGwFoKdVkVabR
	uBLuknLxNQKtx1xxowW0xrv5SbZDJuKw/0Bq/W0ZAtC2ctV3c2STIlYolU8N/MI3B
X-Gm-Gg: AR+sD10uGDq3NXjHzryW4vZWy2UsNZVzNl7BuyPKCA4VmfprVXJlRPBiVx+tx3q2t/i
	+x6McNxYCW3TuM8JyLzagSzhE9MarEMC1fW35azGRnccx1YxlPfyi+LEOEtupKrj8NFIrukQ6/R
	7OzOcF1cZLJrSKpNFApWWu2nkPRh9WC7gyuqxs6tktW0oO6MlFRjIZMsdEzIW77vXlhI1cg2b51
	ziPD2ud6h4R3WkGo4VqAadra+P8UmiUFjQzFlLzFC+moWJb2BjwMY1Fl0P/OcCdlWhM7TL/yfOG
	nRFypbqF5nzoh63rOOqwWfr2tU4V66S+43A5dhOIwuWawburBx8e1/fimEgSzBpZrmLqPDq5qpZ
	B8BZIk8D0OzBClKdRkMRc0xZl20GHCMjDQV8=
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837354637.35.1784658640059;
        Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837323637.35.1784658639536;
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:09 +0530
Subject: [PATCH v2 04/10] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-4-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1064;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
 b=NrpsTYx1Q0WH+Ik9RJxlvn86/zmXcPWHNzIYKoYjFmKeIy6/0aZbPda37lvLmqpqR3w4t4cnn
 JaDqQP9nat+BWdIaMxanSP10o7Nh//w1pzk27Efl4mBNDu3dcLeApBZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: M1o7VB5OVK8SL9MUqDcsy_s8yHcGMoRh
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fbad0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: M1o7VB5OVK8SL9MUqDcsy_s8yHcGMoRh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXzr8R7o7iiYPF
 SQiWE+7BL/8sA5bVR0+TOLItFcbZKL44VKj5bvyQWvYUmCd5bW4U6USjS77dCXmg1gwhyMKiCdZ
 f821tcjYCpvDUFp/nDoYg/aElWRRYKtL4usEDh1ablnB+FRnlo1jfN+80T31VafVd0HdO4ofzMG
 Q4qo4xTFa8WkucHphCoB5EqGAFRaPfz/9vRxQL0R2B8Pnm+8Y3o+W8zi3ePvdxzxCnrvhPYlwD2
 kBcwHWVapQDdhFmE2y5khCfIqX1TswTlsDHjTSicrWlwPkT4KTtEgaTG3nMntfKHpFNyrsyc1s/
 x+yAaCaES/etUigCs9yZaPcWNzmWu3r4Gzq9w/dIRo8UC6+31rFFltdUceBZ09y+KBJ/BwyyLUU
 YOlMbaZg5FxTSc1zFqsH6WcJgFwpRnC0gjMpTh/hO0oCda+2JIEzbVUWlPuVqt36IlOLoBbFwFp
 fTwhF2CmkAqMItQFZUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX4OP1I15hDQGf
 Qs2gp9sNJboU3+JF9i7pnH8WMT2cbk+igBzXJnHtVcYfmNHMSXwSiDfHV8DYAouDyRUv31XRPdO
 620ZnnLD4wpEkw8gTZqkOe4KxnWE4ss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..dbc4257c64ce 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -515,6 +515,15 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

