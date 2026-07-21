Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA7471432
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658663; cv=none; b=UpRC5XjU0jU77dq9mNC+yuPtS+y2aOdtdAlhS7v4Aqosmat2nTatAQSTQOXlPAqzAfdgsnS7CKxttMS8L0uzScYOZPAzvZGXZoIhv8RYyvJRjDpvfPPxy2Tnpp5ZizMxT85C6jpZ7IaiadF5lpLTo20vzr0cPzP/puAtRIydY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658663; c=relaxed/simple;
	bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIgPqKQsZUEcNMP6D2grEo3oHcwBaKozUrlVQ5a0jC8Kkmlw6kZzY4O4m/aCuW1Lgh4rIUmtje4gW03V4cY6NWZmK3FNEFXS5uSefQXpGeErCi5y6MlhRGcYVtUM7JFR1yRTQU5anB7iwwJdXSmYtARzI2lC4v8yH46hZGs4aXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ5o0lDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UySsZ7ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ5o0lDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UySsZ7ew"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2W9u2548706
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=; b=DZ5o0lDAvSWuNUkh
	PNCUO1RO94zIyy611KI7rOr06WRghGJxZ+R3VsU6W5X5qQ3olj+lNGn+++dkkVpn
	PNJkCarywted9j7EdzYURCYH08KVsow/saidjFgit47zV2CoTW1163TbCj+8uNAW
	ekDQ5goCN3TzyD4FU3Z1ZSC7Dmtc/hFJjktTKRa4bGUDQV2JNKOarLQ3G/B0TvwB
	sPHHk9Wa7ds9pIobB8NkNR6bqwTClIbw11oNidtP/CHzKtXKG+uffv8LWVBuJ65F
	CMlxhfTgLwRF5jr1iB9fmF92oyJzP6J0YdU38aM5ogNAXNKYkRsPLVQwJjYBzdLa
	/YWFHg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3jddj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so17778965a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658660; x=1785263460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=UySsZ7ewE2EO0ahhb8bg6KCz8T6vB/JgVPFSNBo2pkctyVJx2A3ALH5eSzij94P+BH
         aVw7mb0NiPbL+/tTJSMjERED9MwOHmFBSNUWRd7QjOF6Qt/YBS7vZPP8vefEbL1YSfIg
         DCxWesA9hanZVwxU493NekGR4BW+D5q4oNAHi1TH9kNe8P544DVU5lqQs0lXaXOAkN6w
         qn/Ql7vlLsy8rgmjXXamPkae4he9JUs3NiUVf3U3s8TAjxp5g7UBxeNJEiU2etfINvRx
         oaZx4fhR15gAcJdGFr2PaieNCNChmZOvEK3y+T0sywD7oyfluS+eCMxQhK1C7glTtsLx
         rj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658660; x=1785263460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=XRbyglfSbZhKgSsnlu1H2IjnYaDWMj67OrHP4EP6+vFKYpHK7KP/Qy4o8kLW1alr6s
         CNqHyCLC3goGJ/KRv34VXTGWGb8W8dVIau8+ZcGm2sf/FJ15SBmW/XWJsPSPfUZFnb1L
         CSn7wz6+6sKlwGZsJX7wZE8e9ppQT0Iw3LjLwCthvQ/jEG5xhfkG00YqJjYGAYLDSOcy
         hZEQyJrAWzOAL6OZs5DvaR5MI3WM6hiv4yrSM7Ull+HN7av7pAmb5GrIQv5/6qirjcMv
         HoHHiR4qSufRDrz90Szox43uFsiguGakCPc0a2Z9Q+nLS5jgksvMOESmopYIlRt1VpFN
         mU2w==
X-Forwarded-Encrypted: i=1; AHgh+RpnelfSAK7lv6OpcPUMR9ppgLotj7tUdXgtT5tYCw0HotG7R/cxW+/sqMPmq3iV4W42J09SRmAoumEm@vger.kernel.org
X-Gm-Message-State: AOJu0YxXPN2QUh+aUTyv7OzfDNlKTsjw7WabKqUOG2kNCKbimqtN5bJW
	4JjiQAZwZxvhxUCBSzTcVS66jblG7GtWgkfqY7K07Ewm1SE8GyzArXki+cYX1dKbOPDqoV5TNr1
	SPK5q6LmY+Kja6AAj6gWtEku6XsrFvdnexoqqlYko6ORDRKKvxnEH/FC15Di6m7ZE
X-Gm-Gg: AR+sD10lDa891Dv1EffZU/El05ZmUd+pSjah3AbvI1BIrzNta5qydfin/aHE1nqYvIY
	YfFsqqUtcURAi4FEZjlERTYUZz/A0MKR6PqWszniWx7QQKFPr+LLS5hCndn5zWzmZw/UtVH0rq4
	+mFX04rKbu+t9vJq8EVX2bjXCDiLJnSdZAYKWhEpuMhEXw6QeIEvWOsNADUzQLVmRnBjyAujfCt
	gNQqem3rxgt6r34CnQWn9azFFukyj3luePRgiuEUTpEXTZclGa0TEh8Zf0bgGrYTgwg7/L1nbKt
	A6FAbDQlskN62arFvWpaytEHllWj/fznbP1Ivos++6nbMii5LNGWmc0JC2JeBiIS0gEF/JhalK5
	k9cLk0CA4bikholAvhX0DrUq8TnIq5ZDY+lc=
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941798637.10.1784658660267;
        Tue, 21 Jul 2026 11:31:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941746637.10.1784658659751;
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:13 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-8-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1138;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
 b=fxSUs7sskz28RP5L7ovnF1zUOcd5APy+e4zGoyJcuIWsZqb4bRibuaRo31EJ7gt0YoCzYusAw
 7VtTFeMuA1kCuDp3Or9fRBCcp2Q7duZI6wIaZz0EOIiXm4QFjmXZnr5
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX/okN9a+P1+ut
 O3X0Ms86tNTxW6OZjJLbKfRykVVqqV1vz19O4E6jmvy2q6n61mB8DrQkiebH6TepzrJn6pFsR5e
 /h1QjAIIClay+rtRPuNV2Ad6ys/Z02TDOJUrDKLYpdH7QIthohMmGcZuF6roo6B2SV7UFp9qzjA
 k4YryyCQjx4aMMkKj1cq7Wpjsf8Cz/Aox6Z8yk6mUxasjW6rM74md6a7G9+4a27SHbtLctr7OrA
 dMYyhGP451b19nZMATsBAgFmzfeqPeqXWBRgTN1soekyh44iVRA0IzEO0dCUt7pLLOkpg6NcGUy
 xMJCspHzpcgwRcw5ASE9aLiYbH+894wVxp3HRYU6ldqaCopH7IJ3ml6Jt/ZlX0X0DZ5f4XKRUUo
 qFozJSgwihl2ddVm3ws0faKyG1/Z4JkZH/HBbo33+YV/VvdLLhwVj6Y0/x6UKk4sgXbT8EOKGfF
 LQFXH6tJT3yUFchB8gg==
X-Proofpoint-ORIG-GUID: C2mHyZ_sztQyZ7cM_AqZjjkj5_C-vsqv
X-Proofpoint-GUID: C2mHyZ_sztQyZ7cM_AqZjjkj5_C-vsqv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX8CJww1iO72i5
 dibFQw2Y69bt5C6zJv9VDJE3lW//qcsJRzaTRetrP+N8CZk8BbQdWnKbxKyVGH7nAPKiGcytabv
 LGPPSN4hihTkEeJ5pbZLUehHkXAl1tg=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fbae4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..67b77272b0cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,15 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

