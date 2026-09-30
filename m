Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0E4E50A6
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773343; cv=none; b=S9DeWmRg2VIxOfzBpY6dAjefcHuqM5Y++OMXAzLdu22u0HF59roAFa2WvWrf6Dvv2ivEL6Vl92LmBd6QmaOmbG37w6Z3Nm3Zg8qfaW9t6REjAck57eNB9umecDu1+YJUw0Q+WlBs4+cn1+cIAKk1/SY+YcDZkGO6qX/R7OYbuV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773343; c=relaxed/simple;
	bh=JKZHxtGKohBE4ZoT11CFP5jaeOV/lyrn+N6XAtOFAuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RSb5WbAzwtOcxcff3626BTzlqUNbhIRvzGpllJzoiu/x3Qlj47y/kYMHtFyzRWqw2N74LEawkGsfgEoRYa0ORVx3NVFbQty+s1181xon7DCpeNFe1i+5BO5zOFHHKj9QmfENAP9iDv2YnJ+HgSGkZqjekGXcoUIkLefog8Ia++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLKQFRT0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO09piaC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLKQFRT0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LO09piaC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7a2n3547268
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ELYydnqIT1AKLfnkD/Hb9W
	Mgj4O4pzTeFDAFrMHZCMs=; b=PLKQFRT0z7XGcJ2JN4476QXU/eBELofJ4kKdlD
	sxR67n3xoGX2w2vp4M07Xrzt/5bq3uU2lS1jW2i0wS79aa0AsH471Cn1j8zrqfWo
	rs1unI9NnbwGOYpRdrBbIjogPsGu5I4S1ZkcM6Ko+xSlytqRcm0RmfAiCKGTkpMD
	M7c9itq3L3bgovCsI59SUVBKd1j550mroQG5uznE1NxlJjBzBuv5WekicG2H3dBN
	iTMtb3GULV02KBQZ33qQcUuKsD7P+/hJq2C6ggjejS3RtmqAk60GMXqpWh1S2Y9r
	miCgEipD9k/gE3ZvDW6o/2/pbCBXF5QBh2Gk/QVDhZOeemLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141p9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:02:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso5109133a91.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790773335; x=1791378135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ELYydnqIT1AKLfnkD/Hb9WMgj4O4pzTeFDAFrMHZCMs=;
        b=LO09piaCNAKonNu/3TzNVdXgV180BXYUJ9TGW10UhAFL70RecEf/nF8zj6JKwIp0F1
         /hx6fffbptzfZ70y4gNWepZoQbDvY7Vfianb/V11tg2aPGhwRUgJWz+dYkvaVkJ92yyk
         AikdpVmBWrHC/9ErJpfdgKtcy8hxvMKsHXwplhGMZND4/7d8u4bo4h6dXF6CMy5JvQOb
         nj4ipid1LstqT4R3VFGf9DxbZ3T3Bzj4zOsRRZI2VwpqzdsBGaPrsPTs4XQqOfQFu4LB
         0OsuKp1SRwcnZXthYz3TXdOITCZG3FiImcUo+PNx/3gJahoKXaMrhl6lNdIokFcAqJYN
         VBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773335; x=1791378135;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ELYydnqIT1AKLfnkD/Hb9WMgj4O4pzTeFDAFrMHZCMs=;
        b=vNzikbuhnD8zKioT9GVsUEicUphN18qSK2+b3RMDPF2CwLoEigtm9AWrBHoavuDHLW
         AX6oKNWdNgarAI5y4wVk4oqCHJaAf+v09d9DPR0R1U2Fa+ywGm+Uej+Hl2vK0DH8ey33
         yhPMaXpOZ7lsdLaIbY92E8SO3RxmidHuP883wg7ygKnsIhPsfSEKQSL/OFuuTzsqt3FO
         4mmJXpxTMqDALgrVCgvksesUjlkCaz6zAkIDewhqH+o8Gt5hUJ0Jsh5U7e0eOvOP8a6F
         7I+2R3EmzGxDEwzidGOjKS655jnfWjQjVtFt9AbFMMliDXVLnG2QNE6rOfS58Fa8SZPF
         M5Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwr/3FRhbcL6jwrv7C9wipeAS3XZBAjzamHQlpn1HrIsP0LY77HO+qB/duWziBBleET3gwDc2DpBll7@vger.kernel.org
X-Gm-Message-State: AFuF++kfTUwu4bXsvtPQV6+eo8DahiF40w5qxmC2BRCwiP/oM010SktC
	kKaibH7X2azNPudQg24XP0YClRfj7xijvQkjntbkZbABLYtbvcRrigNEawppVeM05Z7ODf0L5E+
	zpNQ2l7y5xzF/OUkY56FX4uq/c8fsxINXZHh93qiTW0iFGQHCYT2AwLGpoid+V66C
X-Gm-Gg: AYBFou3yAb10MolqJ+FhUNQhRD/Trcnc4pu1SEGSFbk6lOVza8kCx9DGd5X1l+GhzNP
	NiEOuvuMuV4BnEXEclfKp3YBZ0rveVP8hkEIq9eZxxE/QSpXjW5nAx1llN+loLC32cGvMk1kdl8
	kp1aaEqMom/YihapiAhhTH4AHnMUgbplxyhAavD4asoiLD8f7GOMyqemvIG/g1IVqTAp5knO8QV
	frJ3mWo5aJZ1hX57bCVuArYL1yHNDLj2qYI7o8d9CZGYJQ0XJidfCVHFcDVcmaZghC9ggjgZbYV
	uT6Q4u82c5ZXJbSad9aB1EgaYn4jG7d3bx2Ft3cGGIC7DqLLdfOPzHpWRHNWl6tmck/hCEa9VcU
	ustvpSywRisy9k7I=
X-Received: by 2002:a17:90b:1b03:b0:3a4:9f17:4cc with SMTP id 98e67ed59e1d1-3a4d18e7857mr1302052a91.55.1790773334708;
        Wed, 30 Sep 2026 06:02:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1b03:b0:3a4:9f17:4cc with SMTP id 98e67ed59e1d1-3a4d18e7857mr1301991a91.55.1790773334015;
        Wed, 30 Sep 2026 06:02:14 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cdf25c6csm3426058a91.5.2026.09.30.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:13 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8750: Add watchdog support
Date: Wed, 30 Sep 2026 18:32:04 +0530
Message-Id: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEwIvWoC/3WNQQ6CMBREr0L+2pJSaRFX3sOwqO0HmgjFfqwa0
 rtb2buZ5E0ybzYgDA4JzsUGAaMj5+cM4lCAGfU8IHM2MwguFG9Fy2g6NZKzl17NaP3AeqXUjWN
 9zDXk1RKwd+/deO0yj45WHz77Qax+7X9XrBhnqLmy0poGZX3xROXjqe/GT1OZA7qU0hfPPXIRt
 QAAAA==
X-Change-ID: 20260929-sm8750-watchdog-f666b0e43875
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790773328; l=899;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JKZHxtGKohBE4ZoT11CFP5jaeOV/lyrn+N6XAtOFAuQ=;
 b=0O6BQKmx+08UWRMTWsDrJ9g6iGMQyfRrnSpJbSMGmR7PWkMOl5Cifq1SvaLTcisszTZBQnmS+
 /8b02wezuD8Bl80zwNSlmOmQ8f2gx4/R4zJdVfwf9Z+HM5T+tL5ebLL
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX/HCFcWngH/kj
 p+yK1qv8t3KwrI0YUh3lJL2A4dQn9GGg8O097TktpdJHQs0ommI3KkkvoHnIiu7BNvehD9OPSTn
 ufZ1BMirGbebMcdbVZFeECDdjNDLf0Q=
X-Proofpoint-GUID: vF_P74rKYo1TYoTB-mNB0D9TIELx-cQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX52aLOWrF2I/t
 Ov5hzV5EcVGgyB/udMulKtQfzbfisWPD55SUi82CdRjRMLWhXH07XXpyxuJR9536wivccX0eZ60
 gBF1jPit6BIDYgF9kNrIBoxWc/4nLj2sjG5U/GkSr9xKi+FhoM3jNbc9PUSXVykFdOPvOAyaWmN
 rzP0mie9NmY5p5Y5OTbZKGq5atLizSVyaN2ZLKmG8skNqKr/XOP7PVG93HBUjycDow7oJPMHRUI
 DSqaMdA/4b9lytQXchlz5+8p68QDs/yUarUnNOSkza2NwplCYdTbXkAo2UOF2wrDs/g0snWpLGA
 Qw7VWsB1e5i+I1tCwFjA4qmqPm2pBsB4SezSSKOaWwbFVZRHHEJgdsW0gGoJDjRbyOiYgJWdELJ
 ahQo5Dc2kPXL7jQU0uX3GDaDiPZSPskmKM73wc+8MJghY7LbZW4byOpDa03TwpPOqIJ8H03skty
 vqhHI43mlzC9EIAnBdg==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd0857 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z-B4HAslQSYTmMnCEm8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vF_P74rKYo1TYoTB-mNB0D9TIELx-cQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051

This series adds Qualcomm SM8750 watchdog support by updating both the
binding and the SM8750 devicetree.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Collected tags from Konrad and Krzysztof
- Placed watchdog node in correct ascending unit-address order (sashiko)
- Link to v1: https://lore.kernel.org/r/20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: watchdog: qcom-wdt: Document SM8750 watchdog
      arm64: dts: qcom: sm8750: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi                     | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260929-sm8750-watchdog-f666b0e43875

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

