Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC61C2AA
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935367; cv=none; b=KY8C2qe4F1aLD5o4LxwwSfNdBEt/n+x0coz/EjFuIo/wPAeOdNmAECnTp4TFuVwS5QEmtbfOhDhsgXcGscOZ61zGaUrLSanqkHbdpcBQ2QQmAFJNWZJdId24zy30AhyC7A0JGqmWCReMjESfCE6ThBUnxiwzKNLP2FEEzrHduk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935367; c=relaxed/simple;
	bh=WtpPDP907J8Nn9pP4O+K4wkFHYLpz21QFKFWYhc+jsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elLituEPa+upgMJzyrGajZedM97zks5JTlruWiceQ9xUy8ziDC7kChWFDQ9tZRKrMz/F6fY7KkFr3HECdLq53cjf5JvSGUQBAR4aVBEfotoorsmEkZjFeBAOWkwYSoLYqsT49kl1nmkaHV1jpW3y0zcv/qZ5vqFfvd2nBCyDQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpCnfp8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF2wZsOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpCnfp8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF2wZsOd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKnJL33010203
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=; b=VpCnfp8YvbFXBLZ8
	HYpnbnbECWdBq/UJpGo9O1rtWN7Bh0Ur52sSG7TNu9be0cNO4reGIDsXG2abNWIc
	uhikadoBpQhIMlU9traZ9yN1VfGRnI35Hcje2UsAA105P23tVnbDmh8981vwY7uM
	1vKnuDP75QBO1O9tKCEIOR6O0yBLtIVVdlvJk77dVIxeWnE70yBfOSDMLeT0k9lD
	QC//zR3vn/x2FVB+0Dxccyf22rkdegWZ5QIZWpFqtSSbQDzxg7ZD9yN2SIBRGmSM
	Y0ImpiZa0tA6BXSvjGsbCDPsIQ7KqrqT4gSzq/k6AInrr1Uqq06HlkfiFeqXmsr6
	42if6w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrgypt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30457ff05b8so5370033eec.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935365; x=1780540165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=;
        b=EF2wZsOdg/fNMHSaAwbqePS+sLDNEgj5kzgSZ/rtIKXaF0co3QpjkAzZdyVTNA7qKb
         oqzvYfrWlF/J6xuNE0C68AOKTO2zIeXvNxfKa6l4Useb87IjxKhHUfm7vv2fowP9wmq6
         OhY0To2pE0zZ/m5rZvNZzDzlLBopd+hPHkQW7VR8c3gBTjejm8Pjen1bVpRQW2x13SdC
         upXQ9bNgqCXQXQ4e2as3QUy9xRcfbQb8dqGoCHUkUK+KJO9h5KD8fvLiomtw/f7ka5E2
         0aAptVSvpJI+jE1gxaFaSMG0P/Z3Fwk5t041N6uj1cbFGb10P3fYxg6wAR5+iyluUdLF
         IWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935365; x=1780540165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=;
        b=UQcsqNgDW7sUS9bPvfJiVvxmdRa5MWUhRjoahPb5hyZnb0WqhFadQicipzjnqpVmyI
         lq+Rnau8/l7R2b7ZYVNmWS36sJISICUXRXXCpbiNlMgt63MRQnc3S6yB1JNHqVzwO8rv
         f1Y659ie36Y6ahgKUd7GV6p7eg+Mlt/W4qYpTkCkJtI2jLNGzT/OtMBit46YK7hmUgMN
         QQzYe/LPj+8nVRCaX/KGidRz9WHX50/rw1DMso72SW/cIB7ufxF7T7pJlxhAzLBIlOQ2
         QLSAeAm5lmTtN10cQuhVGe7Hwpbrz5LyXzWu1OQEiir/hCfw0RkCc/mWQBKvHN6VrkHp
         bB3g==
X-Forwarded-Encrypted: i=1; AFNElJ8F84Wi5TCe2oB7fbWfD6B57xQ9rhwt/PBTIIEifSHWIbvZn50rEnNB57e1vV25cJbwafud7Twsnp07@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0DqzqVQ4gz85jjJABHDrbOvdXF0PehGstXfMoEhfwl84Nh9ZA
	FGNRha99uxg62HHIe90HmN5S5EJgGJ6Hfp/ALo7dAzgfnJbDmh3dh3Up8bqaeKox1pRu9IWw+Fy
	D4cP+38n6/H60tvWPQ8UqcXFv+B6qr8YUUtlty+V7nNDEXSx9dMgjf3/vfzdkZoZC
X-Gm-Gg: Acq92OFtR3Kk/ROIwg+FNfluRa/zQEvld1R4qTPGhuzDPo4U3H5yUBCRd7rnyhuo4Qf
	vdwBQ6lom1V+bJW+5qDCwnlH3l59CL7mGjGpnmCCw14JUZ9B+qsJF67PaQRQOz2jWNLCrfc2EEQ
	15V6kEXijml22wEDwEAwHPBPq4zDq0P2gC2C4fXf+TYVPJBsRsaQr6mSs4Wk+cguV/ZAnitY2CE
	+WVlu3CTrWsNjPozSFPwKxk7QikzrCADZzBHfFIltrwh0pmuBnSkVTU/KaMhJhC0jMBKZ7koE+s
	GtRMzSGYLr16AVS3O2KdErHRVpzB9UdkKWveP+Sy9xpp82mgkkega1tH+ofw43RPMkrHHv8J0kz
	hLHoL/zu8i2vTcSiODTG380+Op8C9aQxH3t/ROLYNytdljL66tIpXcw/SsoZ8RRAHsCJjl7Wnqz
	IJOnQ=
X-Received: by 2002:a05:7300:f191:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30449094103mr11127828eec.25.1779935365073;
        Wed, 27 May 2026 19:29:25 -0700 (PDT)
X-Received: by 2002:a05:7300:f191:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30449094103mr11127800eec.25.1779935364502;
        Wed, 27 May 2026 19:29:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:12 -0700
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=3605;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WtpPDP907J8Nn9pP4O+K4wkFHYLpz21QFKFWYhc+jsc=;
 b=XhrGeWmgpKIsHUWiq4AppbACbHOcVj6K6rxQn7Yws8I79Z7jXYASbFMT0wJ1M8kTF4QI1BKnH
 g1s1Jktz06JAfPT5/MThSpK7nKf5WI4cypHghocHKhSyDi+jvhLq4/w
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX4Ltsib7UysNX
 nV3XV3HdPHivqPJCCplEKZJSxigwT2ybSjyxm2hXnS2N3o6rItYoQAGQNnJvDpQ/kncDiQ54xn4
 oOPKP+x97wQbvmiu33vEuqdMuqwxMCh7psatW8qtd1iDpDFmXlo4ncnxdvRniP074Suq/tXzl72
 PAth8EyS9Yw3wFpAMSECzp3Md05Zg2rk1SNT9O02VuGcE6P1aCiUK88tzVosbAg56Nr3pWSZ2hV
 xLsd43I400AqdIrYBS+ZU4RClgBbl/ZRAzPfa2IIWtvNAvk9M6RZNoNQVSSvG/Ok470UbLwfum+
 HOq6hGX1/+1V+QhqHiBo8sedXsZNNtawr5HMefFQFr3a4eOQf9e1WrRnZbPxpvUfGa3cKJGWO1f
 6wTU2y84p9NYo7NVH21BsIMExEsxKJ74+PDveW1NmjdGnDEW1F3O0H1vGpSwagJlmAWlD81Xmr7
 10uzCmr/c92eZftuQCw==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a17a885 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ED1JfwARjmvM9eENDMIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: k9bqgfOYqAuCIR7tjkVsHnaW-xMeF_5-
X-Proofpoint-ORIG-GUID: k9bqgfOYqAuCIR7tjkVsHnaW-xMeF_5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280021

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for
QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
QREF has no dedicated DT node of its own, these supply properties are
placed in the TCSR node which acts as the control interface for QREF.

Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
topology:

Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
has a single QREF block fed by REFGEN3 only.

Mark the relevant supplies as required per compatible using allOf/if/then
conditionals.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..fd3736ad8c8f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
+          - qcom,mahua-tcsr
           - qcom,milos-tcsr
           - qcom,nord-tcsrcc
           - qcom,sar2130p-tcsr
@@ -53,6 +54,71 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+
 required:
   - compatible
   - clocks

-- 
2.34.1

