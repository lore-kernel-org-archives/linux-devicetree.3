Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF03EB809
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289564; cv=none; b=TFC+VQBsLZo9TW/5eBbKrCOGeN/QIo+qHZKBvyfkaR0dszGe8e/pgrQ8WYJOeDFlpKFKDPyeY+j6mBzg58jY4nP58THf5ag5H5N1iawwtHJ4XfXoAHaH+bN5Ow7ExaY71ZtMyWthBgxf1Vg9ix3NryvWCC+Wti+t042kLZ1wWrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289564; c=relaxed/simple;
	bh=wLgTkMikiSbd9EETCL4OC2V4sC6VMcKKXxFpY7T/3u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrtpIDjVslIoaa6ONK+WYRlwZbKuiVfmpvpCYja0860RTH41C9AtlxwOsr24bR8ECr9C4xfThchzLMEjkCwYDNRkTh0FVMKk/qwy5Qcr3fgEoVcnzqBe+ggaNbz3btuH3RQPYsOzkZiJI1k9yl+RJCitnbRaSVHSdfG2eDvWQ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGfzZI38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERB1UhMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGfzZI38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERB1UhMD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HATMGl1388505
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2WW88pkuY5/0eUYbgKQy/IhR7+DvJy1Dhr2ugfIMRc=; b=aGfzZI38RPJvc55y
	5yHy1U1ERavWLoCu6/g07n9nokwXN6GWE66C7awPfVr9uWCcnzDidkpaHXgJdQzv
	4FqJnPjVORbnUO0thsZBMZ8H9QpIDs0usJ86PHb0Mcf+ACzhbFWe8C9XYQ9Fh5sh
	k/q8gGiJ2SDnT8cqBf+Nev3Sa2E0jdwC6njGHWZT8wVnmbU+bB/vvX14mzUOYFlD
	gW9LEZQS3s0gXoT2m4GUaKhvNM7AA9BzV6N8cBA6d+syuHIgxpRhh3kCv/jS3gsH
	8/X6GZyGD2JIUAkh5x49XnghRi1cITA0myCjogjrJ2GRC9bFSRjuAsC8uWmCdS8N
	MD2MQA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p95q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:59:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so105729465ad.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289560; x=1784894360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2WW88pkuY5/0eUYbgKQy/IhR7+DvJy1Dhr2ugfIMRc=;
        b=ERB1UhMDAAq4wBswh/AWwDZFJFjY0ZAZhOOMO7a2xkKimcYntmDlNhveh8f3JqvCPZ
         /xhHFy8WanRgh93vH++fWiFoUPhnLgV1KE/ndaoQQd4+x1rwDa/H9Ux11VxlJOvDMVca
         BVT0bOxA3wlHnOcDhymnHyCAQ8WwAXIesKRn3vc99UoVwe3tnByNNJzDi/ADP9WN64+V
         LqmjC4v5rblFX3yXVjq3wyHeWU65orSQtppDu66CwoEwbwebPGNENKF4ZcGrWDG29JX/
         gaHUQF6V1DvB3eudOrykFO0U1sG36K8415klr4Zw//Ew2z7fZvfLWZAt0SI09YKdIYJy
         d/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289560; x=1784894360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2WW88pkuY5/0eUYbgKQy/IhR7+DvJy1Dhr2ugfIMRc=;
        b=knOl/gpitezEbOvWGjCJfRf6NszmaPyry7aa/tD/TDifNPNJp8+BnogEvmt34XUQGt
         81rQppJrWvTcU0pP86cZj/vPUiFB1t7wrLIXInjRPTKN234eE2hGWLtpWkiPzItvrImj
         H524RcKeOrJRH5cG/Sz58wygxhaoYvDLTFN9JF7YPiFPW7241pgmIHDH6n5nn3wQm1+D
         t5ZHTJD2vsgLYLXM2ZvVOOSKxnLDWcUtYpNx+qquAd2lactMu4vMTAtTJBc0D/xYDwP5
         8zbVwBXzL4i4ut8J6ypWJ/H6usaigleEL072XcMxppr+1STERjuekq+VtzKAZHA2spid
         IVYg==
X-Forwarded-Encrypted: i=1; AHgh+RpfioVjhVYXuar3pePQJEjAKUIpXiBZakXdnSo46a67EyuXH/RBiS9gRpRoaN/f1zj2qoxN2/9E5woN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGv/OMVG3OLKSz+CPHXab2/Gi9roN450JnI9goZhqxZMa6TUXl
	x/UmwwwC1Cge1cpYgZrfvzpltmZyQ6E0w81x8w8oN3jwqZycAFBFJuD4o1s7mvu1aPNBKjuDCLL
	BE7G+NfhmFlMz38lWdAzfThaG+DObg+PHoxmIypVzIERGJ6He5A6wc+KvMcgAMuk/
X-Gm-Gg: AfdE7cn75uX0UqjV5zZmzpIoPl5QwrOQoo0Qr3nzzJj8a6d+uiG6obJVEnfmmulwjOa
	Tv1etpHV0xhhLmA1yPZcVpigCu7B5WfCx2Dv7GTkMvShqmapZ7GdlGCQVmf/fhtbP1gfC0BWXuG
	bqWitFZefBT01/0A0BFc8H9u387PrcGludkxga0+gH89Ue6haEfPU13h1vwY/Tywdx0wHC3S+aH
	Din27qZhBkryGwlL1pfgiuYHnH/wbg2BwM3DehfmbAZ1WNrCJNKtrFNvVqkOySBw7+dxY5HOFHg
	/dRUjDmikNUqlKvy6Sk/OCCrpRF8wVIpryIqBXzqJMxTlILd7oY3eecRsKGmKMA2nK3aA8fENRT
	rJUi3KKpp22Si8bHQ
X-Received: by 2002:a17:903:3843:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2cf348c3522mr24759565ad.14.1784289559581;
        Fri, 17 Jul 2026 04:59:19 -0700 (PDT)
X-Received: by 2002:a17:903:3843:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2cf348c3522mr24759225ad.14.1784289559169;
        Fri, 17 Jul 2026 04:59:19 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm9444305ad.52.2026.07.17.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:59:18 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:28:35 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81
 touchscreen support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-2-5dd091e25801@oss.qualcomm.com>
References: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
In-Reply-To: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289544; l=1886;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=wLgTkMikiSbd9EETCL4OC2V4sC6VMcKKXxFpY7T/3u0=;
 b=LkXPR0JAsONPKjP6TPIhRKFadH1YnUJfwbqURe46NcFv2KfPXnV6kgFTzI1CEGuuaftT3iXL7
 XJb9E8QYGnpDoYVQOaHYpu0xjKrzO31rVP6CQEvBwak/VqP2cuRhOJr
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Proofpoint-GUID: p7KCFncpnfwoVormpgDJgMe2nPxctM15
X-Proofpoint-ORIG-GUID: p7KCFncpnfwoVormpgDJgMe2nPxctM15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyMSBTYWx0ZWRfX7rnZU1EbqQi8
 bLxggKZRLN9Mj+bMW0KEd4ULEc+xORWyyN1fLUoByRPQM+IV6QoF4IgyjE6catezhO8QromOE11
 C9r1gS4yZ5CFEg78N7eUUVLDlfMpspEnlqgNaWs+Z0uZYz+85WZ4SVV/f8duFrxm17wHIOna+PA
 qU9VHidF7ldOxSXV7KuWozKtoU4wKrUF3dYssBqwFBddUIqi3RuPHIawQsBzD0hTCAIg+fJWp+Z
 N3DESOilvoBcNHJW6afrQWY6XD1Hsg9VDe+EEpSP7osNMUhOhZQjpnR1Bmr5J0UmptOwGKYwA8S
 5zi/xgwSUoG/guOrnX+Lht9XNRhYPkN8VIMJSTEhEdsPMm6EKWiaD6MnwWT3iyiGWqvuYOJ0PkY
 YGR6iiXjiKMO7ylz8k2ZYfMUqY0BwGMlow5KP3SXhn+4mtmlW2cxigHeKkt6CHyuVo3KYju1dgM
 LPIxyP6Ck6OrFhLIl9A==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a1918 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0495JNKQyQk9beBy_SoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyMSBTYWx0ZWRfX3rDbb+6OONJN
 YkEsAhhcHS0ioSowk1YUANyAyUmpg1fJMdaQuTQG6jkAo9FXasDD6EXB/fH5CqpyVG8/m7weFm7
 ZLPPrbofp6tJsmADTVeTRkM42F05+rk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170121

The touchscreen module on Glymur/Mahua CRDs is different from
the one used on Hamoa CRDs and requires the reset-gpios to be wired to
the device. Without this in place the reset line will remain
permanently asserted during resume leaving the device offline and causing
all I2C transactions to fail with -ENXIO.

i2c_hid_of 3-0038: failed to change power setting.
i2c_hid_of 3-0038: PM: dpm_run_callback():
i2c_hid_core_pm_resume [i2c_hid] returns -6
i2c_hid_of 3-0038: PM: failed to resume async: error -6

The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
which is hardware-compatible with the ft8112.
we have added the required change in DT.

Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
Fixes: f64ef325f1d9 ("arm64: dts: glymur-crd: Add reset GPIO to touchscreen node")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index b314c6dd423c..4ae8834b4110 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -679,14 +679,13 @@ &i2c8 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "hid-over-i2c";
+		compatible = "focaltech,ft3d81", "focaltech,ft8112";
 		reg = <0x38>;
 
-		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
+		vcc33-supply = <&vreg_misc_3p3>;
+		vccio-supply = <&vreg_l15b_e0_1p8>;
 
 		reset-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
 

-- 
2.43.0

