Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695117;
	b=SR/I5lHeB/1m/kLQ9AIlKAWU5ULDQSGgHrvMBKuhsAKwMFypWfOYcCIE+AzZq9xLRqsq
	 IiLhtNbM835tvTtXn4Cb6qqhuwAPxqDp282EA3QRYwgD64035OqIMwVfHCg0e5x4egAlh
	 W/OmbFhnPaFeeDDleiC/35jhnGTEuOmA7uo18uXlcvXAjTm6sZ4hsCpjkxeN5UISCnRfk
	 +O5SHt1zFcvYDbZqufUlOQYjN0RZDP0DG5BncGX/BIbVusrqgjgCmdq4xnLdTmCzRqxGU
	 oCdfiR2by1JGCsdDaL4kDYW5wtU4YmWDZR0XpUCYk7e0EbW8uz1G8m4nJAYJNanLVKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
	b=K0t1axztgY2oSi8vzfHkkMAHeZG/CTknm5rrVe1DAoPtSIiXItBMqOGsiZMz23lc9HE9
	 NH3fLO3e3nxLXksz52a8L4+WpvSuQ8xNg1K/tBM6HX51J7mO+Sa7hTSiFOJfMnCHP/c7t
	 ehyyeo2GPeG9BYQxAa8DfR1pyE59O8bKghvRE7iAuR45dMEYOGOt+2JA9yqfYhK1pwho9
	 28U1WOyaS2nniQwH1lMcjrNVLJvpf0ZmNpBPy5mloI3+TuqOIcTCRyNxyLwtbIEbi9n17
	 lwBFUmMCsJUhKLRxGAv2Ttu/LysGEJOCf20oh+T+Pslc12hkwkKB0GtisQ+sGhrXWbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmMNd4wI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dk1GPZEf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18A606A329
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC18A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmMNd4wI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dk1GPZEf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQWE2758191
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=; b=mmMNd4wIHPdOkwE9
	5OBijT+0u+AFoV4Y40Grtgrw8ql36kSzPNSArWeEy2lBL8D7PJImrAEJ6t8VN4vM
	aeBtmjanXnLjVY16QM43gCd36vTsSA3qxUOygCDGQplbz/43BsPDzXC/0LeG/VKR
	emA5g0+JhC0dEC9geNDZStWDOvZ+jR10Qdd8xmnUkedbaaSPNpC1KzgvsuWG3GRD
	YlR8FIs2EiKNUiei7fwNtiVSSXZS6pEfP2pGNcLpR4sJKEWkoApAEPRaSY2h8ODR
	58abhJ46pSDbG0uyzMqwzU2DXkmMHEbg/kspi/sFFGnHzUDr9SFq7lsVinU4LgYW
	ie8kdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvbqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so1121167285a.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695115; x=1796299915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
        b=dk1GPZEfwosP0tv+mLh+acQ0fYpd6qdYdsWDcx5/Fmyy7pKgToFYyO+XiV8zSuI18U
         Mh1OfBZZrjL8QWw/Mxf3qzIjcULFbk+lBeIW5+3tpcqX17puxGyQwa7Xh/VN7rcnud3H
         vJsdPdrpHhJm9hdTwp3HGRj+Reca8+FmraHmBsG99uKvD+hGS41gttDfKFF+TwPJO9uu
         1QMUuVU3mR6K0YR6NkHxGF35PyFEZxxn8LdgKdSKDg2QfjmXC3W1nf8yFznccrPqSAAZ
         cTA7gKcLh8ePntfwn3XQ8D3gbQeanEBjwMqO3GjnbEUikTed3fHM7tGkDx4WU0vuI1oJ
         0ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695115; x=1796299915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
        b=foDWk4CfCbiUd5ME0R6JUBrtT4FD4Cm6A9vwmWsapEyzVBQZEhIdmD7eAajfZ+Ij/S
         y9a6Gs4Id2n290MiPX2RYuSMz5OyUvNY51mwO5/6gH8UStSnheYnrxreluzi7n0CZtV6
         zLjBxurqHMkt5Bwdo9QiVlxPXT+BuEFsurb3+Cb4LKsGFiYO6cGi15qaUuU5fmLJHHS2
         O8OK+Qo6b8qABfNCJ65JJYgD12ofP/3SThGJkNJx14v3m1EohPFf9rIqfC4xNFsbYOqI
         xkXDl36Wedlo5lNnwWSZYL56veYGQtZqRyXj3MiFTqGxM5OanPXhprorehUlDB0u/WmT
         CAhg==
X-Forwarded-Encrypted: i=1; AL+hErFM+D+rPEZ3SthRt+9jGyigKcRbcYaljcAiOy9AgGYyajrh08TIkm6ImJ0qQNGuRQqeh5/xaklQoicT@vger.kernel.org
X-Gm-Message-State: APuU4Z/bY104TYxNQO5cAuEaLncXJYU79eiULpl3xWdqMCG7WTeOzfcw
	fAF2X/mMNDTveFATJolkEIMCFB2RYqnpaP54PT/zyFVlQbiWmBvINBSRYMH3bEZf1ZWxviaDKec
	+hUWalKwXkayuKb1kqlKrzUyGd8SGbGALlD1H2gVZj7RrjyXos8ArzYm9WeL5vC7SyogCs8qR
X-Gm-Gg: AZFdTZd+91Ao6er1UEUlS4XJnn+ZchbwDqF5HdA2SC9p1is5Gh2il0BZhLIjqbEy3TX
	GUAfU6m9NV1Qef/XMpc8nW00ACgV84TIiq0B1bVoL1MeCQrAmF3gLNvQmWX4Xt36tbCx2xk9Wq3
	4T8OjNkr3K5FXQqSGQYT880rxOb79F5CFnah0vT018b0eFj9Dg1bPLve0v/OTohYEBuV0dnhSfN
	qvSWPBfdreF83B4cdzCRKRiw2WI3QRoDNynzIZRZuojIyzsOLnRL6eJ0yV1yK8N+IvdO6ajmesH
	KN6bMrLYXK13AlOETTRqY5V3LEr2xa/2RJ/43b2Ak/GqGwhtTD5YgK6gIzhrX5HruH3HWrw/v+W
	a4DuiCsQksLY+Nf2Pm5hXmVA4hpMmOY/SQI3tJrhs1dVt8cZ17V9eI9SK7QoiafJoe8OSyikkrI
	w+ZIVPryKX9z4X
X-Received: by 2002:a05:620a:2a02:b0:949:70ec:7e8e with SMTP id af79cd13be357-949ba9e4216mr3538198985a.54.1795695114951;
        Thu, 26 Nov 2026 04:11:54 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:949:70ec:7e8e with SMTP id af79cd13be357-949ba9e4216mr3538192385a.54.1795695114410;
        Thu, 26 Nov 2026 04:11:54 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:53 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:11:40 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: agatti: add an EL2 overlay
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
Message-Id: <20261126-agatti-el2-v2-2-1ed468b4c52b@oss.qualcomm.com>
References: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: GQ_Vksyugj_NrkJVdhBkg1sC23eE__jo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfXyOqS+5vjeIkh
 a1vQ+nFG/0ejFwnoOxkdmdTDFMq7wtwHKeKHoOH8mexFZJ4q6WmB5CoOaDG9DKyHuPZLljHPnpo
 6jmY0X7kmUcSgrVGpB1mJfQnTuYlm8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX9bsThwgqSmT4
 AKjWh0RLY8ac4usK/bP/5zT9UGxvhFzEGyYd+3s9oxqe93p0qRUYeRJqAIQkh/t+HqwJKQ99Vyv
 4aDIegKSEY3/VS51S1A7KCXgOflaOgjb+sAj2klYzY6JcYXAqUuZ7lrQH3MQzVIBU6xf0AXQXAd
 uB1c+MxAgxjP73+7IN+kJ7U/uasfwzquzO1Evq38p5jzKZ6IgEjmJdoSb90kKcL6950S5nIt7BF
 018FNRYcgKSEkyHeMm/KsuRxzYLxHWdEu/q8UjI/1trrSWvEEprfHvHb0vRPrECRIlQ3Gb+01dG
 tXNLexrNtOC7uLxpuJYYtW8JkPidoxAFtWKf3SGs+0SFZ5KdKxLtMAhI79DpC4AHDxJeXMfXviH
 Wd7RhsAEP1bB4ybZFivpQryn6wVv02+5n70595w5ZvUc5TNoHoUBbZTM9cS1IPXgECQs3k6ITRJ
 DdK55WJEo3853cnwHCQ==
X-Proofpoint-ORIG-GUID: GQ_Vksyugj_NrkJVdhBkg1sC23eE__jo
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08220b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0g1k818zwqbdU_kKEKkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

With a boot chain that has no hypervisor (TF-A and OP-TEE in place of
QTEE and Gunyah) Linux runs at EL2 and owns the APPS SMMU.

Add agatti-el2.dtso for that case, as the other SoCs have:

- disable the zap shader: at EL2 the GPU driver programs the CP secure
  registers itself;
- give the ADSP remoteproc its SMMU stream (0x1c0), so the PAS driver
  maps the firmware carveout and the resource-table windows for it;
- give the WLAN firmware its SMMU stream (0x1a2) through a
  "wifi-firmware" node, so ath10k_snoc maps the wlan-msa carveout the
  firmware on the modem reaches through it.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..70e41313b4d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -278,6 +278,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
+
+qrb2210-arduino-imola-el2-dtbs	:= qrb2210-arduino-imola.dtb agatti-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 
 qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
new file mode 100644
index 000000000000..aa8e85278bdc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Agatti specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1c0 0x0>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1a2 0x1>;
+	};
+};

-- 
2.53.0

