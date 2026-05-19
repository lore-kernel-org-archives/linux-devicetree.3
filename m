Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1483D3306
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175086; cv=none; b=dWUpU0x8f9Wlhvi3r9NJU5w77BG9FlamQcjL+KGnEFfMJ3oWOW5NjHjDx/ZuW04UKSaV9cc+KYZtetiFU0HNOLkNJTyjPwBXjWJYEPfB4Hkg+Hk2WwjvdfUMw7x8TRUF/mV1wx85NCceJSBUb+AI7q/vNpNGxdT0/nG5XTfNJHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175086; c=relaxed/simple;
	bh=2+ohiWM6QpxsbHKc/0pOQCjMFZPee5qvnd02m3CV1u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVUOuabTIY9IUwtttebBqEFYQR8jswuNQ0+c8Fkk5n1+5lg+slZP79mU5E8Eq1YY31ozLmlzVbcR5gXPi3MD15mCNYe5CYGC52mGrProAFqwsAey3CDUlN9gn/B4S2FJ32oibTwjn32HAt4cUcdH0ID84aI9Ej1H2b0qoTaoK20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/mxW7BA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vs5vbmHt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/mxW7BA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vs5vbmHt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1RSwh1146368
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aEEcPBvwTFw6YiB7MM+gIRmIZsHr5lGxet9W+OxrqU=; b=N/mxW7BA2/MI8hFt
	C2BrtE0s0qCSy/+i6o3ax6s6WUEufTxpFD/AeDi4OMCfslYNiQ9UMH0/hoMJE7YG
	pwruHJAb1otRgtUytvRgeta413piv5zhmrFCfbWFBvdFNB4HSA+Ic0dg3OVAOpZI
	AdyzC/zxAldWRNXDkg+OIrl3HFeANt/K74qcxZHTUAuA9XwIHBTpQmfqHJWohsRg
	3valXFeVWXoSkcCS92Yx/TZ8BHLlTy7v7Dk4JQaT428iG3QjYZgM7a0N5m2I65Vx
	XK/R2eqULBbzhzlOGTwE2hFhhx6bOLe8Ie9Li6ntdspriN3pCbuP5LJ3HAejyWly
	J2jb/g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7eh639-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-135405e4035so15775769c88.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175084; x=1779779884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aEEcPBvwTFw6YiB7MM+gIRmIZsHr5lGxet9W+OxrqU=;
        b=Vs5vbmHt1l08jUBUWW22NwG/0hNNwvz+phnFID2ZhOC5RTiZpeWifPR+numW/8RnqI
         tl/fsSxj6ARqCNZUk+jIwS/mAJ/B4V1ZdZe6fk5q07mKE7XMaHKWD/CJ+BiSdNpGKqch
         X/04qs0V+3IlVgKlit7YrUihMzi1ALZ4E+hDv2BtQuJoOL+VLVw8NxtGPNdt3at7n6Nu
         7GrlXJeoY0R/6dVUhngdbijrrPoOy1AaeqUziExW1DXPtuodh7Vll2AdUgoFShKilxBh
         iCRYXt7jN+YH4SHgxRWaSjofzeQuT0qLiDdmMPrzCpM8GA+wwnn+hzQUNslDXEtZSWqZ
         cZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175084; x=1779779884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6aEEcPBvwTFw6YiB7MM+gIRmIZsHr5lGxet9W+OxrqU=;
        b=L9jstrCTjeZ3BIQH4MoLfsPXQHDOoQLFPALi8U/q4ZTEP8MJcX5dsdLjK7gDef1c5u
         oKdnhz71L7St2BpZUGMQDLkaAIwNGHHG1lMoyNpLitMO2TkRKNg/Qunlahh2l1W/qGxR
         4ptszVOD9T5ooM/9s7w/SsVknDh/fbhpnJ+eOjN9LBVY6yR1NKUuhQ9ePJll8xMxna1v
         DUznNWxMSDHXijAJxFFiiNH7B8mEPbBvapF5A6v/rRI5aA1BSUL7fuNFUXXpKdbZw3/t
         xWQLQrxwBomrZSN8ZFOVR7Bo4lArvB0oQEd7dCsbhq8mwFKjSQgoMXRyyLtnHQ3JHogp
         WLjw==
X-Forwarded-Encrypted: i=1; AFNElJ+xelGB2IQefU1SsFi4V8DOL8slr68iEJUrBuZdop5JtUZZMkKShX07sGggSVq/gUUCZzx5u4xlQUfp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhj3Rg/EpFhnLpcbBlGWktFvAt6pY1g6T86vQDvh4VbTP4cgXn
	3krPk6lkCzrR0mPEdGXxbJO46UUclJXg3u2Xz8mzuGSsnFsQ5PU3ZSGtJXhOiLT0gdiURZHNXTV
	zNCYmlkgh5YM7NXBC5yqbDjfa6ZOBaUghpFrRjSdQxyywKDJz8osHnFt0JttHj4yY
X-Gm-Gg: Acq92OEb1rQ9tIMz5VIH+inDUEjqUK6vE/emWIsRMqcH2/vvdtwhXeldvhuD0waeX9/
	x92smxmks+1kIaDTGEWTwj4XwPHabZKkLuA1d4CPBhkyl6TE3+bTtcV77PqQ/5l85YKhnQE1/nP
	j5yRMEkMvNwyOWshaZw+HQ5Zj85iTVCrkB6lTlLLxSxxvm/rOSgVcuIi4DlyfBw8zMOcUS8FFOJ
	lPvUsgzQdFx8FWxJzWIIhM9plx/IXU3KF5rjnWZRdalGhYh5WinB29PgKeRcj7aEoTkR0abke0S
	s0Giemhtbd5TarAJW5SWXJvjkJq/26ns5/a0HMn7DZymDwp0AEE9NcP8wSMFeYdwrhNLbzto7As
	XHgZg7FrWZQ/VWP69vad7DEp8z3tLLvo/IHd1D9/iS0brOzwXK46ZuZM9gSyO9zS2keRVofe/eE
	yM
X-Received: by 2002:a05:7022:6b9b:b0:130:9b78:b17b with SMTP id a92af1059eb24-13504a4fd4amr7714829c88.38.1779175084353;
        Tue, 19 May 2026 00:18:04 -0700 (PDT)
X-Received: by 2002:a05:7022:6b9b:b0:130:9b78:b17b with SMTP id a92af1059eb24-13504a4fd4amr7714741c88.38.1779175081597;
        Tue, 19 May 2026 00:18:01 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23323747c88.7.2026.05.19.00.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:18:01 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:17:58 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
In-Reply-To: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c0ead cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ze2PbGEXSmdAYQ4Rbr8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: KVXTf0N6aqW-NNtVf9OgE1KdBYg4F_bM
X-Proofpoint-GUID: KVXTf0N6aqW-NNtVf9OgE1KdBYg4F_bM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfX5z8XBI3hGrp4
 p1/wqx3tXWgy+ZbWcGeEhhZBBv/howZDH/eN77GlF8d2tff9jB+CfQO2qOZjJyVYpHGWkEdfPdL
 vdCfIxzO4KEUNm2Vr5WQim3GkJqdblEfaoMtcHI9nbdyF2Wg38VMcEKnl+JcNqIJuDhYM+B04Z7
 ow+K7Qj9UQCm38i1LUBo5xWBVVpIGmZDPtyEDEfwlrxgaInrutsmlBk9WiZfmXKkHXZbGCWe7Tj
 FKYy+ZfJ3Gd9V7ARO1gvGtakiWMBGVGGMosoknu8APDOHJ7zGcSxqmsdFUEhrPPxjoLP2yhNrpl
 PHNVWVrMuhOlUnzvIE0AHSjogweKlwSe6FQUIQrDJC13umRTHAAjQ5R/ZkPUS2LKpJdoTMQ+BKy
 hEOzM6zQ6eyDqioc0hhriU7T5s+dq9iExsMXgIHCqzGacEhIKGMGM8RuZm/pcHqRpCQHiKPl65X
 QaZYiZqYtPevgGrD5fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070

Define pinctrl definitions to enable camera master clocks on SM8750.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 7570189fdb5d..84ab550db2f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3894,6 +3894,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";

-- 
2.34.1

