Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89701331A57
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025341; cv=none; b=cwxHJ4Fa/cHHTLl5y4liZrpiah7iM44I2VXwchDDEY5BEmIrMgBxJNMydBgopSgQtGTb37BhmkruIXwnB6rdK8Ue4ATvRXUG4EnhuGTSRQOSvmZqc6nYHt3tEC1dAr8e5F8jKFPsYdF1vs0WMBhM7Xqtvc5t5JOSJRxOW+QEyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025341; c=relaxed/simple;
	bh=HykJptyeG70W7OChA49EYIHxPs0wMAgUlbTPHQWlYFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBbS+ncwJlV1nAPCxmXDXJkXSKmZKSWIcMHlT1Wslry9oL7+RDQcB11Uv0zyAeTmzvNAGovkhTjFMRG3rULNyeKPo34Od3a+gXpJL/12ePu1dlFc3ATgi6L7O5YAoZeweG/TFwWZDNYCXN1bJCgmD74rblk9XkRKK6G1OGKTGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr4vXiVW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDaSDRWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wr4vXiVW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDaSDRWp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6315uebD1831814
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=; b=Wr4vXiVWsW8f3rgk
	IC2ZVni7/VIOigl8cL8jupphGG5a3MXGVxjbFOckAdf84WhhwhsGGkHjZIxbUcjL
	aQaEEq4A22VR5oDQa9H5p2/hvhsZwWEtJpTZOfBVofDsStOY4NBCeaAHuMF/mZ1H
	V4fB5u0p7JkYPgi3Bur27CO4KoTMBjlH8sm+qM2Y4EXhuedKI/hho3bnl2t5MI1z
	ZwGYLLSY6iY5FzOSuWwmH58DhW3s7s6SnDNf7qZ7t2DaHAT8lbV4iZ8OaB5YT2qa
	/wcNqSAK+9X0Rr9tSDMq0IetC8BvcJMfL27J6IPfWvYYeWqqtpxxq+EWb97ldgA7
	WU9zHw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equcack-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 06:35:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12737f276a2so7631629c88.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025338; x=1775630138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=;
        b=bDaSDRWpx/LRFb9Lqc+mdS4F5yODvCB0vONnaKZas/IGNWuf3gEpfnn/B4nVBCF+qo
         zF+4md+obJuCmDIos1+1XgOz63pEiZ2zkYQXn40gkPxBA2qZ1b5p/h7NWKXu0wlJ9SG8
         DgfjrKDnL8LcocBfHW++XRKwlXqpd6PH4R3pRsqc2MvTvHYaO9+6yBegrX2z15SBzjgi
         glYhMx7v6KGoE2uymhQlAfNG3oM5gNQ6VkxrF35VUQJaFQkURY+bijyl4yh2s42P/5dS
         kNUTrbDzhzw3BI66x+clMX2+cvR/VU03owpCCiwWP4FQZTtRjmwn/QcBxxG4oJBOLFCl
         efAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025338; x=1775630138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=;
        b=F9g4/nCxJjn0yIiDgeUedhCLQtCacKTHfz14jjJAUSWnSEIrfN6L3sPoZK2yVNDHi1
         M56BY8Ijf3OtkMMsTy+rNuRptkxzLQykPrNZNL9tq+4MC0PXX2oajnOVcIXjTxu8fJj2
         AbdVSrRrxLI20knUpcZX/62C6xEFcOZidW8QXpi6RjswIOSqcanXDmGtfu8ShjKiD4Rk
         rcnkLpkQs7PN1rHR0ZN3bybQR7zVl46lwbfiII2Hm8KMyyGYUlR3U89VQUtcYTI5lW0R
         VbQWpGNPniebn+lrBM09dCyj+u1+ZxaihjffcwVhMdRbnOTdz1rXLMHJlZWwpjP/25cE
         GjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCURshVLKmxP6tRyU9R+eDgDRSANr4KqxPru0Gh31gBMsttMr2f5nNu3DC50EBBMbdThVl0B1lNb/UFq@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDawY2HsRFoLnqcyjzaEjWEuD+UZOELMqFysAJb2L8EhgZhG8
	Jf48NYTsk2lp4Q2oBoOF8qYQJ/+ObnZdC+7QzKcZRMz5zrikujbVMoLK3Iz5ys8nLiM5opC01z0
	y91axcR/o6obprYd3Gtt/Pzj9CTvsMztXrIeCon2m2gZZkez65RKoMRsohc9lmAtn
X-Gm-Gg: ATEYQzxpREX5EY2pQ1zrvpj4oQGWn1qfCEFIg5YOaZmTEEH9LQngiweYsr7rFdFd2qH
	1lTC4/BgN3X7uGOdCxXjSVkK6YCzJNgz5bXiaS/mlkVOr6VTbg1dXdVS+CLD9iqV2kb7gvDFrmG
	8wKnOjohhlbSPWbNzB7IVDAkV4YLgp6XGFmi1TN78HYsIakL3X8HBd+a3UeKHaaafjvmIJ4eyDL
	QfdqPPLO4IUgVrGS/hwv6GhepghqzMRzui/Ql9SN5nDO+pcZ2d58kKlL69FG0Wg80FCjICL0UTG
	J45HC0t3rt5o3fDAPjAuUvN3HxqpXUXKXmhvbiWaZlhCYXAaKP8mia7vzgzR4mDqUPjECSukZ1R
	z/PMIHH0ylNwBpXbuT+HNsvb96k8FMX7OgxXTJ2L1atRTJ5kPm5wo2iUWbOa6/amQylnp
X-Received: by 2002:a05:7022:2387:b0:128:d4be:7418 with SMTP id a92af1059eb24-12be65a27b9mr1237999c88.35.1775025338217;
        Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
X-Received: by 2002:a05:7022:2387:b0:128:d4be:7418 with SMTP id a92af1059eb24-12be65a27b9mr1237978c88.35.1775025337549;
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:29 -0700
Subject: [PATCH RFC 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-4-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=1732;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HykJptyeG70W7OChA49EYIHxPs0wMAgUlbTPHQWlYFw=;
 b=0SX9Xe7reS6OSBWr2q3Gmgf6avxaV0jkkGa1FvQa4GBhvKr6tFnkgE6sk+GAMJCTnHGKVygEt
 xJGoX00cKHtB02MK0Pa2mGPWEuj6mAckxKSii02vihdA2tQXK8cZY+K
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfXxwY5A4gkyeto
 Xa/kdZMJ6YQ8r/zdH9oFhjMAmjRej0CdHZDECwbqC0hv1W2SllMiQ16p8yCfRZ47Qym5Or72Gwj
 7rWjEvFloglH3AyVB08v85IFKRiwqSw+CfVGmq9RYBiLktQUWMOfklwmf7Knsk9gVaVnP5BKx7i
 2PgI1vD3/FeRstAjFlpM5JSnDlW6pBFJaISijtPKe02da11yZEW2dqdI1vdb3ZLDbdGY6l4h8DV
 UIxz4UgMWZF0L/xhPxi4H5SH70IL4DXLXZmb9QqSxEpdS0w4CzBmtOmFr6WKV/hyDZUy1lShWHR
 SVgDXAdlePazTbPFvZi0RVUkGypmrW+8BYkgRp4+ZhdnweF44tDwrBkfYNHYXjQ1lisE/ZslIfk
 e8amvynuonAK5f5QjCasx115q6c7RxmCsbKlfWQx6mKDO1GM8+ZGhfzy3vAY8Sywg2HGbNEfAHQ
 ClNHJXXxTCeiz5P8WJQ==
X-Proofpoint-GUID: 3z15a7VsmH8wpihx69NiXGxsbSTtrnH_
X-Proofpoint-ORIG-GUID: 3z15a7VsmH8wpihx69NiXGxsbSTtrnH_
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69ccbcba cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010056

The TCSR clkref clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board:

- vdda-refgen_0p9/1p2: LDOs for the refgen block that generates the
  reference voltage for QREF
- vdda-qrefrx/tx/rpt: LDOs for the QREF receiver, transmitter
  and repeater circuits

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e66f14d08dcff777789d16647fd17..3ca181d082ebbbc4d4778abc853c39deaa2a76e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -342,6 +342,25 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-refgen-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1

