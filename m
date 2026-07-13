Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691AB43B482
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954467; cv=none; b=UNvcJo4F/p4MDr0i9TfxLvfS5KAZwAUba8ym8vtyNB7iYjMeGSnBg9bFqTwRI/tkmKG2d4oL0CfeExSBocvV0pZAEHF7kOPxnXXpm2jCkquFKdQRyIA5pMfYTVpLbBdyVAtpl4Q/g4j6Gdzvh690ORqH9MTnbH8PbY5lREbWUZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954467; c=relaxed/simple;
	bh=H2fkpda4QTDXLjTbUXq9Hwo6C3IDYqfckLGQqzPvBUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jvc5sh9knWutkWaPR9+qrznXhZJ6y8On2vfmd9R8q53zgqRokoI7AcgPqku4xxSMVnliAq0m2g75X1Yt2x5mAjCk2pGFtGbwSBrhDhl7OVqQG2WmsXuUwPlgv9ZEqdNHPXfCruzP5n5USLkuQ/QS6txILiqC8bYzhz0zbW2ZicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHHUK5eS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPfBPxUg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHHUK5eS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPfBPxUg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDr8Q1453603
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=VHHUK5eSgjv53HjU
	FauSiO0Uf2cBnKOfqOfwfHQgCnafmqrF4uslpK1sB7OhyIESBcobZ2TeAYfx4l/t
	VKa5r2k6o4vYHbSl5ziExVOXRHvD6Viij7dJF/3hvBSwWhMG6XkMssmi06inMcLS
	fLP7q2SJNzh9ztW0GdAS1529q+/vLa+SiNHrQsfEjCfZBRMGAjZrXF/J+Urpb2ET
	j+6Ak22NMK7B4LGwcoQ3SEWZ46UkztdrQpbVWVETHXGP8u8DKvhgBRMALQZKnY3t
	HZSoVs3veJny0VL+sdYpUNH8b2SBGaFlFgdSlAJTsYacM/aCpIEXCyBAKL/hTp36
	hmqiXw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01td2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:19 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a374304efbso4348923eaf.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954459; x=1784559259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=LPfBPxUgMyES6rQfPiIwrFatQK2CR+t7aMW3DkBE416G0CaiMoCNcImp7jAwUEUrT9
         dJJaS0RvvdMe6ShLrWfmogU199VgVVFU2RFJJZblCE7BZhYUWh0O3vNGIk4X9UQDHejj
         j5vzhTzTuw0nUBZ1cQMKB0vCQVa6igx0Xm9gm+Z9peq9PtFZFppdeXMl7coK7JVU71rp
         njcb4JZUKHTXbQClCOuyV7NK91BpzCwdmLDolQD/cfXWNGO01XrniE4K8VACpfRb0r4K
         ZvxptGXkz3e6ANGVenWohbEz/5JpDtzuSA8T7nByJGWvh/AngOQb1HYYNQnlVSkC0DCs
         0CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954459; x=1784559259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=IIO5pCSIkU82Vnwp84RhAtM6fnXkX+iPCsik98NRoGifbeQ8+ovCj7CvcTK9wPe5kf
         Au0OK9aCn1bdK75Dkngu70VqLNb3KMUczjCYuxnHqfRRl39QrEIv+1eXLteJXBbPqYpR
         WpAGf5rfKywJpL5itbmPb2pK/GV7wvS4tZLM0Lpbiz2njR7pzUsefwowfq9VeGChwspG
         xrmYExfjAWv5J3a4+/4DbmTn5KR2yzNBMd0/+3L41i/TDzEUoq9NP6lBBzx1jqSj+3A9
         EOb/1ok3V65kPa7e6/dSifxYdEfUba/WNmtdAmMXgs6RIX9dYWePhjicqmcbZnNY02y+
         BDVA==
X-Forwarded-Encrypted: i=1; AFNElJ8H5xK1sWhZShWo7lDFBhFscNgO4D2iSrvDXUeQC1UMLXbynKJ3HDRusB+lg0InnWgKTRp/dONh13dF@vger.kernel.org
X-Gm-Message-State: AOJu0YzgTLLQ/ifLDzi56xuEWx0BD2ve1crL6eWqvRwT37LpCxfgvkd3
	8OWMhcnWhaGk/jtgsEJrG3saGEUbr13QGz1YFh9QnIW0fL4u+Y0q6jXhZOObpO8mJwYylLwlmib
	smBIiKPvbCAEV6GI0JV59HXQb9PV76xSm93uFiENULmGb71f/yQ9DYBgzavp/8rBw
X-Gm-Gg: AfdE7clbTFjaw6iNvCNq3kvtOXsNww8gy6hyxwfHGyFqsZHCJZYE5IZOws/7ApnUZMn
	zG8NoSxPUebssUsNBFJQDZ6KI0LVUoLIq1gd4TXlbn0SWPw877c3S9zwgLUsk8ZlYfV9xfCUXHO
	+rtre5CJOjDMK7iocbY1YRZLlqEt2UXkMtwUtdGs7fy9M/KwGMkxK6rgTt1cOvMIpy7iq9TSMix
	dG+gvOhP8QueTkbpKZLeEbO9yaHe4nz6VGZ8HmM2CpqqFMiRJVxn6v9EoW3Tsux+f4l93UAV6jJ
	pyDWsuCzgGv7AmvZm6Ohl3FfEcA6e6+2GUnE+fovDVUh4Pum+H6iuk4orMKVOX/ZMQ2Hro/8laQ
	HktV1vyyHbeygI4ldX1Pkk5jBL+BcCO4rSGk=
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633439eaf.58.1783954459171;
        Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633426eaf.58.1783954458738;
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:41 +0530
Subject: [PATCH v7 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX76G72nJkT7eI
 wXVxO1w79M1MXd1TjBpcfWhw8NWfY2kFVjiGPMOH2F5C0r/Wr3QFzfaHwH2hd3MirVx7Ioc5NXT
 NDi6EGHSeuCw+Txsz7xwZcK1lqDcV7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX8eEx466RCPEW
 qkj0IzMHjjnHbJXkrDI6Ii6rdSlYqJzGKA4yJM/8Rx0hfUd8MM3Jg620B32vItMGRlFVTvZYhy8
 vWdKhcvLdkFcIBhg1cCLNNwVv8GvfL3WalEuLi/fKcXE8sS/yepHAQu0vKT07ONbB5//d470pCg
 s6OS8HqLWt6tc+MGDHhQF9Gywc8oqfj47fL9gzbPZyDkbeALtKyVQLHcrvxrD35YW8GTqGigwxM
 PHMOncGkBHG4CKOGH0ccQqag6A/MoR9tHT5a/GkJmNHedWJoqF8Yo8BJhk4AGZACDapfUV1APkE
 Qy7o9n7ndObA3SdKmqUqySsWvvMlThoUczMHVrk7GL6to6car44z4PmQH+7znPzS1jFECt4NFhb
 3++zY6TQsCGRNUs/NRBoZVCNzSskhDdUEdOmjOJi989I7POsCn01E4a9O7wS6bYsBnC/M3gnrno
 /Y5DNfqh/VQRhXzMkFg==
X-Proofpoint-ORIG-GUID: buK0EzJ8APM7ypuArionM_NA6k4qWDTG
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54fc1b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: buK0EzJ8APM7ypuArionM_NA6k4qWDTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130155

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade64018623e49623462c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

