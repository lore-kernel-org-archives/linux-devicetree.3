Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793767910;
	b=U5m5XkCZDmnRE5XgCIT5dTWY/RFOgFqzSKmJU67YAN4hYeIa6uFw1+qoatH9wvCnIPJg
	 wDuD19jy+utrTiTm78ykLTQShaZYzAnqyW0DZBQCbToP4qOROdQmRSxxNUAc+l3AS7jqb
	 h++7DztVa0uoMhLPObyvKDRPrNRdCX4KYzMeahVvoNbhthkXUjj1yOwKZbsFhVYmYEHsD
	 Z85yXq1KCFi3u78nntSHm2yZstJrSxrOB8TjOd7Aj+SMcEmbZ9ifGTJm+WPrxbsw4rHnK
	 Ux5QOf42YhSCVMpzmVvglOKpM9EQoJxQjRvM1Xx41KYr/PUwoLVvQWjOpK37FFTv3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793767910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
	b=VOgHg/zp61gEos/eg5JOu02TMpYeINSqZ8lZFrMieMOWFnSFWOu9CDJL28APPFhC3hDw
	 KGqXlwttg+3L/1F13ILhwXiHABg6RzTXzTTSLav9/vTkT95yl3TURRLm8uy9Yx+wvNBeW
	 eXay5nJiq+e+cbq8NrqValkinrExBGAmZVJcrLHpBSxd7As7bW35v7R4i7kb4QNbM+kVl
	 ERbSwrYmqeAItg1OdnCbsTrXXq6o7UD3MOm534yhy42I1xh5YXgG329gK1j5HV+6DXN34
	 jboey2R5HVYt/dTceqTXDGUZV9Nxn5Yaj9oD3it5SewxuZhD0Qq/K7VJjjGqWBt5UKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWEwH1op;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksY+XdiJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58271606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 04:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58271606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWEwH1op;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksY+XdiJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RYQF3867629
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 04:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=; b=HWEwH1optVPYUqVe
	aceBWshnkGrwruGAjEBFgtxvmbTNElTenKAn/vI7u4NWXTO8Uk2k1X6Kgic3a940
	vOk4OS2grUdTrEonPEVi1hQVsoLpD6YBH19/aF51fDoZMPZZ3/zMxB0IA3RrNqtY
	Hnv+A7XUCttti+upkzdaZCXBXqQRlD9XtuBqAukaUYcbhNUBFAsIvJWmdPkCNW5+
	IJDJl1zfPBDzCBPuEEp7ji5BvLCddvlBbizHWDzc3ygo5b1zmftx1KaoDzlKghUP
	Umwc+TbmUCHemb/P9DWXJTfp9H/Y5Mgmnwd3F/pp58dWOzOMa9rhsURo2HVjmEzn
	SOfWiw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y1xq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:51:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so342730eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793767908; x=1794372708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=ksY+XdiJhFHI4OU257oVI6Hf3ByyDhZKv6nJ9vsRRszTMUwOUumLyuNGANl+Mp2Lwu
         zbLQE/gJFVHbcLWJOuj5jvvbSbm1sJKCWftNhBU5T+517y/C41Ng1Q0pp4ivVDSZ6siQ
         SbaYO4+FM1d1896TFmgQ3y6oWWEVTlw/L1VgAVQ0ZprbR5+UGyukQYlcIx954ulaK3CQ
         zzA4dbYsJ0Fn8zIeePzCiT9YI9hf0U0ac6EfH3xL59fFB5NPfbinU4NWFeS0wbi6mBb8
         to+xtGjd6GHDrNhH+yNZMfr3rI4SRjpeMKFyuF1dPGGVjdke0oIYQba1Wps/wn2O0x9T
         gCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793767908; x=1794372708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=aL3JvV7Wb9TqNk6DHzjkd6f9G2AbHUV6AcjHDkd1szGVNoRN97iuQy+q1NyPV6ldtl
         ZjKOK19xUhkIe+laAHI85yJR3TywVwFL+cQrrHwvzso8PL9yqhiAPnUeBoIu87sO0O58
         cp4Na2UJdwxEOOXNUm2NPoJ4CXhCJTk4dmjrwAPEkCuVBuQ9kCBhRwxl68hX9XLM8Umz
         BFdroHPKpPdITepjcb/krt+vUyW7czROJOdPzfqHRAXdM5JdjcoZZFwlVBdkf9wVnnAD
         YUrNNwNzcSgLJRFPfO0w24/rOoMNwlRDvlr71KBcbtiP4wcxt7vzbvW4/anqvC9iKa6T
         sy7A==
X-Forwarded-Encrypted: i=1; AKwUvBxtks/VTH4aNhdJLZza6Sh/UaMtKXjBQbc4eyL9cUJkLpWow8Zhw6/+gIUryjjACKZGT27Y1UwaiTDA@vger.kernel.org
X-Gm-Message-State: APuU4Z8iDx4Dbj9ZFcabCxjf21vS/AVpENBKlateumY5D+xz03abnHOK
	EEQCdeSrEfLAyyzwDIaQJLKyoA1pofnG9XRv1etrALV0YrlWNzMfnS0Z0a+bJzd9OpvMhxjiYEM
	aqCV+YFKDK+vCzTekTMtTIdwCDTGsDkFyPmlBXCsDzzw3cqX3QCwRvGHccA9eQwCk
X-Gm-Gg: AYBFou01YZmLw18r/9RyzJ9d6KRkaBKoBYQox/CEPoWpet0rDdhlpQ8b9WZV2yDfL5w
	5JmnBt4PLqCPpqaLC9/K2JKI4Lj3d8SUipnQzKwQ1wWR9kzCj9QXTCgS0RLpES/ZO9+xG8aCPpa
	yV43dXYMPtsD/gcIqSSMk3WFgX34s298HjTe+mK+lpBiK0wJxSI5lAr5xVua5reAKgRByMxYOAY
	iiLTVWkgQ7vmuo0X3lb1c5sy0tHvlQB8ua11b3Yq+330SAkTRuAEiJAaa4OHnYHrK2eOHy2b+Pw
	vVwnKXCNrKv1cTgRYMXLLM/n9KntwZLG60aj3OiPEy1xX0z6LfUqAaCK+CcSNt587EFseets6hl
	zDOiMnvDKRysnMx3N1R2L+zNKcLlzaakzB1bfjxAf7IdojIAeWyRoqyhXAQmqQFI5muv6HY8Evi
	B/vE1oBi6n2W3LNtWAjLIJ5Ubp
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr34368101eec.31.1793767907759;
        Tue, 03 Nov 2026 20:51:47 -0800 (PST)
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr34368044eec.31.1793767907147;
        Tue, 03 Nov 2026 20:51:47 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394c2a3sm3427958eec.20.2026.11.03.20.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:51:46 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 20:51:17 -0800
Subject: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
In-Reply-To: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793767905; l=6461;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=YcJzWuwZ1RPM60Xmk1Fr6v59EnVXQyCH0dMpsNpXZwI=;
 b=CA5I13+mOeWUbTYUy65Pz3XTLSbPcLT/A3rPAwLHcvM32qGlUjec+jzYZ8jzlgown5Ku6PegR
 DF9cZ2/qKLLB6MyUevlgPXPeRrHyDUCuP0w3g3K0pbFywMbY6APKuFg
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: _eYpuLhRSi1Q-Uikvpa4cpv9VIfN5nDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX2rgzYoCu1zV6
 om2tnx8WhxgUe6rlWO42Pd9NuCpd5KLb7xA7Rb4A99CFMbVa7Guw8XseBORkdApImzpJOExu9ZI
 xUz0S6XR4q8NDaDPx3EriTPq1w95JfSikZVvhTij+mUv3Oo5fA71nO8xUc8cAyR4FPnah7cGter
 ILeBxTtVqhtmeFnt2QFEUrm0IjnM2FJ7p+THHYbgpBY1QOuEi54+8mahCiNlfaDab1LUJVQInBE
 Tlz8BiehXJCW1ZnhVYkHp3EnN31vPSSOrgyx74uzVXIiNt2AVtf1uiKXItkApGKBXvo0T/2Zr8M
 w27jkFz0jCByHN7Rclmt1OrpUyBUiFHNOYLJyxz/k4ZujMlsf1FARakmxdbYg3cp997kaHUWkmd
 HvcfolJxMBWICVg+iDkj8nRACgsZHsWn6coROsT6c3g9FyKaYK632YEWox+2ookk2hkRnXk7Cmd
 N44K2fRhF37FXopdDnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX1FNSAVC3tJxf
 HFCT6GjVcMY9Z1SlTugwZKgXPTeFbEvrbqDxEjaMy/fb6u9JuDr+6j6lpbFOsVBsDRPXTveI9lW
 Ngd0DsgW4iF1+iGI23whHHB/y8Xhw5M=
X-Proofpoint-ORIG-GUID: _eYpuLhRSi1Q-Uikvpa4cpv9VIfN5nDz
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeab9e4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bI6yuv9Qsz7HNVLwNVgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040019

Add binding document for the haptics module inside Qualcomm PMIC
PMIH0108.

Assisted-by: Claude:claude-4-8-opus
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..ce2c9e893a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Haptics device inside Qualcomm Technologies, Inc. PMIC
+
+maintainers:
+  - Fenglin Wu <fenglin.wu@oss.qualcomm.com>
+
+description: |
+  Certain Qualcomm PMICs integrate a haptics module, such as the HAP530_HV haptics
+  module in the PMIH0108 PMIC, which drives an LRA (Linear Resonant Actuator) with
+  an output voltage up to 10 V. Several play modes are supported in HAP530_HV:
+
+    DIRECT_PLAY: The hardware outputs sinusoidal waveforms whose period is
+      defined by qcom,lra-period-us and whose peak voltage is defined by
+      qcom,vmax-microvolt. The driving amplitude can be scaled in the range
+      [0, 255] via a single register byte.  Hardware-based LRA auto-resonance
+      tracking is enabled by default in this mode, allowing the haptics engine
+      to follow the actual resonant frequency of the LRA and update the driving
+      period accordingly to achieve stronger vibration magnitude.
+
+    FIFO: The hardware can play an arbitrary waveform composed of a sequence
+      of 8-bit samples at a configurable play rate.  Samples are pre-filled
+      into the internal FIFO memory of the haptics module and continuously
+      replenished via the FIFO-empty IRQ until all samples have been played.
+      An 8K-byte FIFO memory bank is available in the HAP530_HV haptics module,
+      shared between the FIFO and PAT_MEM play modes. The memory partition
+      between the two modes is configurable via registers, and FIFO mode always
+      uses the 1st partition starting from offset 0.
+
+    PAT_MEM: This mode is very similar to FIFO streaming mode but without the
+      data refilling capability. It is designed mainly for short, latency-critical
+      vibrations. The memory space for PAT_MEM mode must be reserved for dedicated
+      usage, and the waveform data should be preloaded and remain unchanged
+      thereafter. The haptics module can play the waveform data from the memory
+      region specified by the PAT_MEM play start address and length registers.
+
+    In either FIFO mode or PAT_MEM mode, the following play rates are supported:
+      -- 0(T_LRA): each FIFO byte drives one full sinusoidal cycle with the
+        period defined in qcom,lra-period-us.
+      -- 1/2/3(T_LRA_DIV_2/4/8): each FIFO byte drives a half/quarter/eighth
+        sinusoidal cycle with the period defined in qcom,lra-period-us.
+      -- 4/5/6(T_LRA_X_2/4/8): each FIFO byte drives 2/4/8 sinusoidal cycles
+        with the period defined in qcom,lra-period-us.
+      -- 8/9/10/11/12/13(8KHz/16KHz/24KHz/32KHz/44.1KHz/48KHz): the FIFO
+        data is treated as PCM samples and drives the output with an
+        arbitrarily shaped waveform.  This mode is typically used to define
+        custom driving waveforms for specific vibration effects such as fast
+        attack, crisp brake, etc.
+
+    The drive voltage in FIFO or PAT_MEM mode can exceed the value defined in
+    qcom,vmax-microvolt to achieve a special vibration effect, but the waveform
+    must be short enough to prevent the LRA from being damaged by operating at
+    an overvoltage.
+
+    Also, hardware-based LRA auto-resonance tracking is normally disabled in
+    FIFO or PAT_MEM mode, as these modes are intended to drive arbitrary
+    waveforms that may not follow the resonant frequency; autonomous hardware
+    resonance correction would interfere with the intended output.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,pmih0108-haptics
+      - const: qcom,spmi-haptics
+
+  reg:
+    items:
+      - description: HAP_CFG module base address
+      - description: HAP_PTN module base address
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ptn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: fifo-empty
+
+  qcom,vmax-microvolt:
+    description:
+      Maximum allowed output driving voltage in microvolts, must be a multiple
+      of 50,000 uV. This is the peak driving voltage in DIRECT_PLAY mode,
+      which outputs sinusoidal waveforms. The value should be equal to the
+      square root of 2 times the Vrms voltage of the LRA.
+    minimum: 50000
+    maximum: 10000000
+    multipleOf: 50000
+
+  qcom,lra-period-us:
+    description:
+      LRA actuator initial resonance period in microseconds
+      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
+      rates and the auto-resonance zero-crossing window. It could be also used
+      as the initial period if the LRA wants to be driven off resonance.
+    minimum: 5
+    maximum: 20475
+    multipleOf: 5
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - qcom,vmax-microvolt
+  - qcom,lra-period-us
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+
+    pmic@7 {
+        compatible = "qcom,pmih0108", "qcom,spmi-pmic";
+        reg = <0x7 SPMI_USID>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@f000 {
+            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
+            reg = <0xf000>, <0xf100>;
+            reg-names = "cfg", "ptn";
+            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "fifo-empty";
+
+            qcom,vmax-microvolt = <1300000>;
+            qcom,lra-period-us = <5880>;
+        };
+    };

-- 
2.43.0

