Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFCA382286
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519671; cv=none; b=Rl48szLX0X70BxghgmbRzFA8CuNxvMBjVR6vTyUv6JD+7fonA8MUOlIkqpn51k1qmnbW6JdaBTiSxb6pSqOv03Vnt4Q01Jx69g5AHifbtAXhlwhh2ncYvwLuBN4gbibpVtI6ouG/aNltC89TRGUIAsmvsrSdBhi96Et5YTMUJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519671; c=relaxed/simple;
	bh=7DS+5IriYTcEnA7NRt3cu94NudPifuTt8p8qH0Ejras=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cq/0LOBCf21nbbiHcI3vg3TRae8bN4caDVA3BfJP+DIc1Rk9m8QV9lTHL+3LPiNQ9Y43pzFPgNdD7j/HOAS/kPXtsfl8CTbo28wW1JBSFfC4Qfer3Mf2I/A+V76huplgoLd76MaWF83tGa1mxp0NbtEhFzwsttooCO57QVFwO3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOLHonm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQVwbCyV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOLHonm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQVwbCyV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62POn3288560
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9picgVEgHrZdbzi2AKsfMB+JEXzEYtUn2/JolRXlcao=; b=ZOLHonm1K18yP7P1
	X3wiHSLr4sypaJ0sqVujD4d1gBr2VZxTqs0NG6yipZyESPdOjP5fKx+3K0C+8JS7
	oW7ixDLKz2Ra4fruRWC1avh1ZM8vjzCfarWf90rSrcMUhrENlmoPBPGafaHXb/yo
	9Jni884bfz0LcUFQAjXYGVbltjlHPDxYltvDMWiz0xCximt6fjkfnuIsNH4buiE7
	OJy0FGWTolbEEwmCYYdPGHuzC9WAvDkGQ5nfyLSMeL7ihxA3QQm3l9pxhtB1Rzpo
	E/U1TASMvCOhMl9LtfvzutSdzN47sH2oUtI0eGAkWo1m9toltYVeFhaU1wyqWhRo
	ASoTKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049ev0mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1766594a91.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 00:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786519665; x=1787124465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9picgVEgHrZdbzi2AKsfMB+JEXzEYtUn2/JolRXlcao=;
        b=hQVwbCyVJIoZYEqkrLoyvkz1o6NPjT930xJyDHDR8IWP6xW19FmB53Q5H1c3cnXk6T
         Pl4pZzc6VER0PzK0npdiwIpHaawby5x50tElXGc/a83DNwrDvPJDvmjiZgA6WTLwSSoB
         pFvCR8yRYNmhh1qIbJKC56B9MYr8PF/0PZQ4kK9/Hm5oGRt7AETuoLeCoMYP1mqfob97
         YsJq8LBAyyBw5aKskXf3EpUJ/6HEmY9W4rtB2DmwMuIXtz7zAB32gYRa/lMGvnxLSI5s
         EV4U90nfLVB99WkOiC8unULk8OQ+kQvaGAhuTV0+wN0GLdAksomCBMQgV3yCvrl861Qi
         TtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519665; x=1787124465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9picgVEgHrZdbzi2AKsfMB+JEXzEYtUn2/JolRXlcao=;
        b=kSb2rwI71M6AnI49LuzO9hXwXFCyhqdUn/T3hV+AJeuzy0lRi3gCD53WqvvIc7w983
         ER7J7Nm1gmQujffD/F2gfEMiyxpJk/0+CtuhLe4Rb1Bt0wCX8ykQ7l68+bWdELIdP6LS
         ycEFVPU6RwmafLop+DPENMidb7+Qf8LETUvS6sTPFHJxhNUxPl5qDVC1HC13gEk/Ukol
         K8Tmy5bpQkdFnXgk7FYamjofNPMf2H5PTS+QPD575KIjqnfHkDtsGTcnx62iPHgx0dOm
         XsNyok00fUguUxbSeG60L3jjZi45BvjZ96Bwp3ZHpYvA+jg1hv00JebYph69+EVLJPfQ
         Hqog==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Wqiqe+oseqM6E49Q54Q2rwvJb5L3H+OC7uu1szxEFwl1KNwUhzZeGM50AkwoFdgdPPD+kyCb4/Od@vger.kernel.org
X-Gm-Message-State: AOJu0YxmnDLVFg6anbwmVkD7pzFGlufJLZLUdzFfX/scBobmPBNyw5/K
	5QWrg3Njn3SyDzivPDkbjUiAqyUoblPYnTZXw24U6+2fMiu7F6VnL5R9yH9XW/7m96JYBhwdFnm
	7ZISyjD4gEEQBiWqgGyQfpABRUE+3GwZsvBt9I/qf7VaF1BEWuMJhj1ObrVuc5dof
X-Gm-Gg: AR+sD130He7Ej/z8bSGBWGfny/OkivGKL3BWRlN/z8YkEOwGyh9DFNR/TKCBTZa+4ea
	Sj/uae3fh/Qyfekxfr4nq4ggORaoNpfG1s8ZF2CE0A7qtO2h4Vmazyw6QoYYLPxR6jRqhlUCH9q
	zofOMMcIIxeqrmjWM9kqjA2+oRYPLkV1zFg6jcTr5/adz2oPuf5w3weee/nrhuDUq4DMWvV51D9
	vNU2j5A0DS+Atw0W/fCJF84NhAk+F9d+BrKT1Hp10atxarnQD3RndRWx2Vf1N09pUHVAAD8EcE6
	qq5SOdqIymtTnubTqvcRjhxqDfD7Ppj4p82lpKH6sVMiOvyxjVYb+PRAiynmu0KOBZuOdcdKIXR
	CLksYUT+JYQsija1V0tDpuWlpUd/2zNmfvvzlBEHoEYpbJhc=
X-Received: by 2002:a17:90b:48ca:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-3930142adf5mr3590450a91.15.1786519664950;
        Wed, 12 Aug 2026 00:27:44 -0700 (PDT)
X-Received: by 2002:a17:90b:48ca:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-3930142adf5mr3590386a91.15.1786519664320;
        Wed, 12 Aug 2026 00:27:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f908a82bsm2506965a91.0.2026.08.12.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 00:27:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 00:27:33 -0700
Subject: [PATCH v3 3/3] arm64: dts: qcom: hamoa/purwa: Add QREF regulator
 supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-hamoa_tcsr_qref_0812-v3-3-dc7627169c6d@oss.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786519659; l=26246;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=7DS+5IriYTcEnA7NRt3cu94NudPifuTt8p8qH0Ejras=;
 b=A8tfVcVxOZyjyKg+FqCWpfPb7gIu7o7g6Mhdznn/rNzuB1bDPqQNTZ5ZMbo972jtbNNSNIuuS
 frcW4S9aYmnB14ZmHPp1cBqszE1FOLW31VkEm0oll5QR2uOTj8rqclb
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfX8OllfhtSN6Q4
 mNjW8qXCbCZ6xA3vtAhsYmbFHTJA0aLaZ3GcmJRNy+ZUDBc8uZB2FkliGXK9QM+OJP2Vl7OGsbV
 WMQGnjKsuAEisZFakZcqoCzHqUNMPOA=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7c2072 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4vDcivUYQOVtOqHL04gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tKu4S9fWiK8lq4Vkoz0KvCAc-9G6Jk-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfXzJAn/fp5JVGb
 GHk8fYP3VWLisOcaAfxlxrttIEIfMEh1QbMQJtn8lZMTQJ5Mzrg0lxkFtl8C0d3ToDfjQeOIHU6
 zTLxoY0u3Qh+FajawrQC3B55LJPBsKRwVy+4y5DsiN/YGD22BJ4eHsqM4mydPIbW4Am/uWuhw0Y
 4QhWl36iMFkpQ/tc+Qw1JkhDfxVBJCmahcIRGuNxr4cwS7x9lwqODGSY7N8i7Dr1MqgCmBsKuQc
 LMcAxDNL1pbZ8Ox/HbFxkqyj57wDodJZJkhCQD1vfSunRqU9OmlDuCzZrcyBsbV0LhCXfy57aiI
 Tz7V226c2APWk8Vev+0UZkteNW+6sgVS/Q1t7hZC/GkfLetO6FXUVHRU2ebV1kSRsTUyB9qZSga
 n5ZnJg8qkNGbzwnFnKcSVCzufsqEX0JLQ3j70cduJq1F8WQSinewVneLbXg1F2/mO4bOUv2lFXG
 3LHvjHvIWFZ8zdRd1lA==
X-Proofpoint-GUID: tKu4S9fWiK8lq4Vkoz0KvCAc-9G6Jk-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120058

Wire up the LDO supplies required by the QREF and refgen blocks on Purwa
and Hamoa boards. Purwa's QREF topology is same as Hamoa's, so it reuses
the same qcom,x1e80100-tcsr compatible and supply set rather than needing
a dedicated one.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi         | 21 +++++++++++++++++++++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi  | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi    | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts        | 21 +++++++++++++++++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts    | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts           | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts  | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts     | 21 +++++++++++++++++++++
 19 files changed, 399 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index bc70fe5db96f..f139f3adb933 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -478,6 +478,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index 284825008389..75ce8b0c94d2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -902,6 +902,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 488e98413c3a..4ef3a5407ce8 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -476,6 +476,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 0dc7c1b5a14a..6bf12d8f0431 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1036,6 +1036,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 59cbbfbce490..7b1486469730 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1272,6 +1272,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
 			       <90 1>;	/* Unknown, TZ Protected */
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985f..ef9c8836c33a 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1528,6 +1528,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 4cda708455d8..2ebb42906c9b 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1301,6 +1301,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index dba8cee43e29..6b4b17acc069 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1284,6 +1284,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index ce7d958ca687..db4bffe486c0 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1107,6 +1107,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index be1a8ac8c699..21303340a530 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1193,6 +1193,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
 
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 0bee2a3d6e7a..75ad74bcb042 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1382,6 +1382,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 2be5a37c00cc..ad62350ba670 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1069,6 +1069,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index b70c1e094bbf..603f6d7717f3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1066,6 +1066,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 9eb2dfd99f20..2692e48537aa 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1347,6 +1347,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index e4a0b86847cd..039f68807376 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1248,6 +1248,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 13d0f09e0c2a..9f45ad9305e8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1322,6 +1322,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 78380fec8839..9d4fa442d158 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1177,6 +1177,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index c2f21fcb1b09..8891ad6188ed 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1325,6 +1325,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <72 2>; /* Secure EC I2C connection (?) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
index 0314b2246cdb..edcb6b99a384 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
@@ -968,6 +968,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */

-- 
2.34.1

