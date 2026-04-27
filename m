Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A581F192E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253124; cv=none; b=jw0bKD2N4cVbvfxhd+7WodQ4dehb/FFbN8n1LeWGxpEjoFqK30ugcM76ICJanUocqAbOcfhjNbzVdW9UA4rFo5/wb2M2yzohc5/JkJAiBstEHpQnbKJrGIdYAquG5aMCqVJX3rxexpWzz96yeDpib31ulCWPz5BW7ObjtOV0M4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253124; c=relaxed/simple;
	bh=iPqFCkAym8p2q+8FMt6XiYG4OdymDNhtxZKPxYd4lLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BnsIcr7UwAD8tIlvERJ62oohkkG1ChU4vjhohnHtiv88nj1kSC9nesMFAHc0mEVCszGyEkKcnUkoyAs4kcehcTnsX0dTSu9DrKGG02kU8xhcVwv+IY2Zesmno9gAgY5s7you+CYYPM9YDT7LCeu3doj87iWS6mDv5AG+pEOOfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGFXMpFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsjVCKdw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGFXMpFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsjVCKdw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q2A3rI160371
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kom1YsRIYEzqfzikMJDUOQNp7yGZKM5G3G3
	kvTtUT/E=; b=LGFXMpFrCO9dT9hWLHfRBWwtM8n0pRvKmHBZy84kxxZpz4+pA/7
	/RR14pbYtByXEuRILIGA+vviLPw4gXN8eiQl6icVcaAnk1/5y75sIRTujKw4mamK
	pIuDT2F3Jgga25Bb8yNEGw+WHyQroKe6PwM1WTTFHqHRI68d60CzhTwHWwuzYeY7
	9GpK0b0ixe3dsZ741OXzqF3vPEPktc/aRE4M5bcQfHErA+UbgpwRIMg3kqHEbnvZ
	a8bzML3nBOuWknImXH9ZBGUf6KH8WnlNpKfBISEoh/52ohBGg8SakmyiR8/dvi8e
	NPNVp5e4fIlhDFA6njxraa2vGGbg9RHM2lg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtby0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:25:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2de07c12745so29340812eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253120; x=1777857920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kom1YsRIYEzqfzikMJDUOQNp7yGZKM5G3G3kvTtUT/E=;
        b=gsjVCKdwP5m1MAFesmCQnpdv+WwAVgmPe2zywLNJSjw5pRArIvNwBZhGZg5OuMXRsV
         VD6Gjn4M5nvKB9kj6IaSPwTR4tXkx4l6hJnceDoTK7tfcS8gdjCYUdadWVnwk0ndae1N
         CUQvW5wMEDQd1kmTWuCGyo2q+J2Ss9E1/g2qIVX4zMlUC0BNmXDUkX9K0Z98D01P8Et9
         pep8UYdvVEgcEAoO2vmeeX4r3rUzDi0e+ECGToe4JhYeXh+kCmCvMv9zMaEX78tMfYdG
         HSZ3zL3UHEjoKNff76tv3We3a2KPuW1SdaalI5KyI/E6vHeaeM1IkjrfnqsNV8WhL7Xi
         JT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253120; x=1777857920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kom1YsRIYEzqfzikMJDUOQNp7yGZKM5G3G3kvTtUT/E=;
        b=LgJP5lWZtbXzMzESO1tQypsIlaJlT+W8cDGW83O134sXZkPttjMXglkqxT6giE1zp7
         37xAlUJytgnH4Qw3EGGBbWN0TJvtbozQYkI5c1U+5D9Naq0vUiM5vms5RrTMJR2c6kMQ
         LNU2UflNKaj4PFqK6ttrl0RrPsjZOVuNG958CuW+FtAqt/n4642nJm/6WgzlDoG7uqzE
         pw8lcYr86XlT8B5qnQIQMbC4zzL/iX3YDiBUhF2/Hzm9C0YOzhRTO2xSPUBoaPEq0QMY
         +S1scDoouq14FTs3S1zCiu3SKndmGjlkt9eoAwMGgo1UCwFShYPcphUClSvro8x6toFr
         vgkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LyaTOdEgo1lTrzXCfM/Ny8MSzW/8jWaph3aQpEBrPSf1oe1+LXCRJFVI/CQmkzNB0MAf4+6C08Mft@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJ09GcZVO5PGVoAdIMZucJwUJAy+jhS7VYQfEU/U3bqgmpykG
	Gn3akpng5XJrGkjNOKlH24/6C3L4k0hWJUaPqLaT4IIKaLKOlNnI3T6toFrHL39U/ijAKq7Xt7D
	WAXWuD3bvjf0DT6pC2Oxvil63rqHfST8KXEklJZvpx05IzuznlfxmHYkn8unKvKxG
X-Gm-Gg: AeBDiesiSw6ZtRubw9ZuAgqMBA8Go6nlgD5tpK8E4SIV4/s+a0+IVXbEUr3XlhfTYSU
	tuRqm3i6l/P0N28+Ty5eTsaXiAAzfUjYvK0IlskDdKx05LfbaUOfpIDGqp0jhvLSuISxEFDToaY
	tK4k+WzsQ3BnbaG+iz9p0VSIm2RdxPIroYiNCsMx/prOlqMGzkFxhjnTTnxllWsvmkTXk50DK82
	fSgVWAwM/jiRSzTV2V3cOBtahieFOqWAwvByAW1zlHWfyRtZVmZCKxAxS5W9U1rGHeOQEUOUQkn
	oL8q7LsWGcXmRJZfTFSvZSqhHS9m+72bu38ALn8CJ+7NCftNzpa7MdBJ7HRAqTIP8UQd6YgGABW
	AK0ZZBrVzOj3FbCbMW+o1logHD081B+CSzn04ZGOEUokd9VRsQVBWL4ti5b+fpvwMP1vfPlB6ay
	/GJ8NfyvX1LnnOukHT
X-Received: by 2002:a05:7300:f193:b0:2df:5715:82be with SMTP id 5a478bee46e88-2e466044880mr20839603eec.2.1777253120320;
        Sun, 26 Apr 2026 18:25:20 -0700 (PDT)
X-Received: by 2002:a05:7300:f193:b0:2df:5715:82be with SMTP id 5a478bee46e88-2e466044880mr20839589eec.2.1777253119804;
        Sun, 26 Apr 2026 18:25:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm42568031eec.18.2026.04.26.18.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:25:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document Nord Temperature Sensor
Date: Mon, 27 Apr 2026 09:25:11 +0800
Message-ID: <20260427012511.231475-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eebb01 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eV51uFx1KiPj_Zj1pZAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: DW4I-yAV5AbE60TQJpccKAdbeMm-hSnG
X-Proofpoint-GUID: DW4I-yAV5AbE60TQJpccKAdbeMm-hSnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMiBTYWx0ZWRfX1SprgL6BMVcH
 TGfvM3/sQlRYX3oIdyVOxfM7OYvnL8VQ5Rheirj0SxfX9VBBiZD9x34uWqNDUVKp8KqLrdGzXoy
 mqPrQTibwfCm0nVDeBargMSP07PN0KsP+xlLDON7pyz8dh8uHLtd6/p9vOBf1V/Ja/pyIkLenKm
 DA8sDHbQymvrYPa4g+94kX7u4RiNm0IdioXYvhGg8i6sdYiAs/BCOh4Jcq9BfA8TPJPrjP0kbYH
 vFzCjuEWk3CPfKHYzr0w6h5L5uTD8F2jsSLeyNGU0KaPEKkjl3dAzGb9PtqLEDEX31KrDqjY9t4
 N42ub8JaEwJBIiapRdfXjCq7Dj5/Y2lWuGNvnba1yZL9oQoAX0G9J7K01kAjEb/0l5UhaeXo94H
 8v2QtD4Rjv1vb5JJglgrQFdqekoaJhWY1wiDzEr1SHeseKzauR/FsQcC/ab6+4OiVPUFaghKiYF
 RuKDOs+4thfKI9qUwyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270012

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Temperature Sensor (TSENS) on Qualcomm Nord SoC which is
compatible with 'qcom,tsens-v2'.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..e65ebc6f1698 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
+              - qcom,nord-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
-- 
2.43.0

