Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029B5293EC
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687449; cv=none; b=mMnmNbURaBTszug6zNUfM6ZBdzaOCXNVJ63Z2Gol+R9fP8xvho9NeRH7PPmIzkq40AXkQk0R9yT6/Dzzvl9koxem4HLeLp/iTdu5dqgP8JVEtQjJHncD18G4gBs+UQx04h+U2Rse8juY2ExvBBAXFOSw0wB9mBQrzcyoIjexzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687449; c=relaxed/simple;
	bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tilq+UtYLsTGBpmh90mCzjXlSdJCxofyIhqlFcpeK5AqDZV4gEEu1fhk/JlVB4inm2osPiGtEPill7iZfl14Vo/zcwzYZgVT2n4WYaa9P2Ev7K6G6rmfujRNu/QfvIiZ/FezCKBIfkXa2xzHTBneDkLLH3fEDgSpIL8urykC3qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej7eO5rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRHXPxvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej7eO5rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRHXPxvx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdZl349888
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=; b=Ej7eO5rthK1xRofA
	5Je50gHyY7bpNpcacJ2DM4MSH0rel84o8N9vFcPXYIGe+WqC8hwQ4R4VOqpP4LAl
	3Xi+yyyEVJq3Iyu4Az4RN13+O/WEA8YWqXZFCw6G5kER7UqSy77prgfYJzZ3/j4A
	qeUFGvUsRl1b5XkkmOIYoHwF+HmZ5TloBkDG/6SQ+PxjyD1hjpDOs8NUT5znw8mb
	8euDFQ+6fBe3Gz97iOJJji90joN59ClINGIydwY7Uy+cvWWMzyA+NidxTRz38B/j
	SIAVft143cWzHOBERwwQWtOBKrnUQ9PzW6seS44xd35r7PifbMb4kPaKOfv9UBea
	O+4knw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjxrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5333e3f5811so19519301cf.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687446; x=1791292246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=fRHXPxvx9QWDbjLMVH+Xl9x+Xo9KU6sHg5QNHrts2tGxfm1HUOTSZdJdVY1Ct9geu0
         GItPg583edfb9xDwXq0wBJ5lpa+UVzvseK3WPGTwlR4vcbKw+QDkcTrK0MWGozXar4lS
         sXGVXeX8/wF6F1OnERLleMGk8RXav7a+CHSh5QSPdmiq8yI3Iua9Lsife1vhOCrEHjKE
         Mzl24fw48RMYlLHuXLj0XNlJcWlMsxIUho7C48Q7URczGgh9tVZpbU6qjETyWtMsqx9I
         4ABIc5u6C14sotgvrRfLKqV7696EQXBOq5pKu3Zu07SQF6YFQzhy9TS5M+sULJVhXv3O
         KfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687446; x=1791292246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=GHtme44GyVBmWpVeQz509uP9u75t0AUxgikCCpWgbVLMCOwtjmoZvUXE437wIFcIic
         q6DlDnExwy4z+yr5WMZABpw0SWDbonpp8bPpB7sfBzrOJCBUoD2s1qW8Uup6rl9QjkY6
         VviIQcXVv+QlSo/nWAJ9QvT5gI6BfQjLUWjLgexLa3a5xQUg9NXT7mHugSV6uxWTKuyb
         0Fzce4k+90cmblTavMLVpfqssV+93Ge6XCt547obW9RuPimUYnZj36lI6JajOCf8xtdu
         h+n4S2fHrd4KNHP9arIc1mhvI1CHTWj3t31vyia2+J1YJ4q7ABlxcP/sTDitbWilRijE
         EWBA==
X-Forwarded-Encrypted: i=1; AKwUvBzZrosZCIAae+BnhC8BTHd4ARdZrHLPUj94YaULEIdbW50hPoOraI+BQ9v2Ovpb8mb0D4KG8VQvrB56@vger.kernel.org
X-Gm-Message-State: AFuF++nuVH4nA1osHwm5wTljw4jeNlcelO7vHHOFT9EoZ89I/DTZ2BHa
	q4JChtGIjJfLkaaqweqPgcFpwwfy8zdzkc7ODyievmR+X8mR9IeMD6Qg3MugRCvGOtrF1RbReoo
	3KY+AJZjmF7Y9j8iIvrbS0jnSwNDBlNs9imFWxcuzmhAtg4iKRSBjC6ryE2Tl7yCj
X-Gm-Gg: AYBFou2jUIbk1yteRJntUVbM/DBhTLk9KzedDiACJqVLl4CM5EyXbf2F4BYVtGxQnqm
	0TIXLV87+G1KtbVLohHRT+4Li+/2wG2Rjl6hR2arRUBHdpavqcA0eYsf3Yzj8VWW/9u5fFtNW4U
	jb7sWIil6Xc4MelzArvfDGjeT48X3M3pRXt38lhkgvRuY3seG3gtB6J1unyzE5QD5t86HSApc8k
	a3yEkv0/Y0gEonvmMPlkHxRXbVwgzKA2aY5NXSQiL7FfCwNdgHP+EmwL6B6TEjnwF+pWxP84lLL
	iF9PcKUGmZF7bOUKSdme/WGs95rO6I3LtO5WqMC91yni9LLEn3HebZg5+U/KKtOB0e7Wu2z9J8n
	MBvP7Y0gyp1csTcBeNAyr6IwLO/99fG7aVLU=
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44608946d6.18.1790687445690;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44608336d6.18.1790687445128;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:40 +0530
Subject: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1136;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
 b=Ij/auBEVeIbBbuG7Iw2UVKBhfAem37HjgrfVKieJ6/q+RgiiLD7FfUKtfdiI/wqiodchKqSNh
 JVj8QaKLRHZCW7XZzz1C4BCkqCyWhCwhZxiXw+uyGZZKYdY++bZduOA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX6UL3i4pVgmoV
 AiyPSYmrhBqCKYrxSLopx0Ii5FDFSbCwE5WOXjsV2iTtmqXM7fzIXi1M2xnuDQI0PH9q0eqva/u
 LAOLgWbVHd+rho/RFcbBKiYiSm8ptq6tmsTZLBW+HGH5sR2S/V33fIXjhD+Dk1Q/kqjky1NFia5
 zKA5WFM0zLbXAnQn3QLjl61smFTLRcsjfi8evySo1VhhsHpjynuGcC3Ih206HcJh0t89XIj5Oix
 KQRJBSHyB6sqsJzDSiI4ZIgOL44hAJo/35RXmkZYPpE0oWxTwnaP6W2QyoyIvGl39nVZO+NiJd1
 kb6kIYdS4dp6/SD/ZO5XLGZ4sTMKTUDu3yaMwqT0lx5amJ0/0m8l6bR+X5lbVXhKhEOIwCLclwj
 aVqcMU1WsGo8CSbJeL89sWtxt8PQcc9JBsRu5qgG9PIkc4L1UN2X4qo0xPHqVkf3NT12lL2cY+0
 hvRht0s9U8VtM8S/yJA==
X-Proofpoint-GUID: TIYXKfrAKxBFK9aGEZnXzg3E0iIyd0kq
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbb8d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: TIYXKfrAKxBFK9aGEZnXzg3E0iIyd0kq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX10XRNQCDhEhd
 0J2OoE0kuQA+aBX57EXhuIjWUkwyNuA6MH/A6tSQreect8ah4Vpv3q5gW5fp0lYGlgYPDoQtjWB
 h+DeeChaplDoRCVcsNdmeR0p2fZbBQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

