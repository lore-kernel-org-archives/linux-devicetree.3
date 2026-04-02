Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891CD3DFC85
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130355; cv=none; b=Rc1AVeQUiHkLsqptWyrNKKoMBelQrtKmyYn9gpfyA4r10XIUc4ViWKUrd7M1tweCZLmECPgFcI3k8jRWjcnLqAjwGzSDjxS8sbVhfAEgQzeLFV40Drm40NYmUQzcntGx4ccoBPLbopGeA3E/lap+uN5431C/tkEPw4GUu9gKtm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130355; c=relaxed/simple;
	bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STeR4hYTUzy7BzED48X8YLoyDCxomhY841ssAbR6tP+oD/HQ7a6bu/5T3WGQGZE528iejVapvWGI5zH5bKrxNHkzthVP4aDNTeS7dqo5piS0mVVDgmYT8X9o4NA2AmqjPHXTmh6EH629TDjwEKrjcXSxsAvNzfFmQB0rXXVtKEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mImhmY1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mwb/nQY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mImhmY1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mwb/nQY1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63273kJq1964818
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=; b=mImhmY1oGBZrt2qH
	75fX8kZbnzFijwj28wOG6UCTJtUm6EjdA5qZlFJVnL5mjJIdQQsLOySZrpPjuSD8
	d4IsngSjeNL0JXg6Rk7lcm4jBZtM1BQ+PjKAYJZJ8mrsXjE8+BlERaxwiHUeBMFe
	Uo4J/lW4+//e9j35G81rTfQr2pjAqADmiM9Ea867OZpI/nGDv5f+3Qj5YZt74RSr
	4VZgyFYFGTx6Qt2FxlRJjwg+FdOqbiAk6fUPNdi9P8HHrwftwjUQN37r6mKwUL3e
	YzCHG89Fc2S7mMXsGDek1dL6GPttBL+rDVOjUoid2o3I8gZxXG3/Bq/K6QckO59s
	Q6cyyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h2xna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:45:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso26156941cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130341; x=1775735141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=Mwb/nQY116tBruLvJsWVbrp1z4MP150gdAv0WAVQxAa2qww8pmWOYnurVD4vAiEznB
         GzKF/24hPwMM0FEdJs3a/t4YQ3azib4ZCWWeRMXKYc3EFPnG/glGD7yDpnHpALYbZVnu
         bx49mTd5yhBwZJyqDWjqpoZBqDfOWWOURDxDQlUsLBFGnf+IyH1CAAhEt27Ym9ZXHKC7
         6vjzLRztICv1V1+zAS2bw/vsJRyWSGJy+K1uHS1vH3UHdf0+c6EZbH3NNtd8N32l9kJX
         kGGxpL3eHs1NxnEHDPRmU+gDB580AkOtYhEq/xh81Jdx/Lo3nKJm2ArB7L7wJEPdbuqy
         Fprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130341; x=1775735141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=bUwQHhYOrT5nsLDBlJO6ecI1xPNIo44XkUM6qMzxDVEGDMFvs3S7lkDFv6n9lbAmYi
         /UWFrKtRe0qPAGS9/vp2Um14H6YjczBapE0ajBddvKa4mNbE28qJScMpAjlRsrpDQWc9
         4WuPwyKJQ/mYQXUYIizqFxZlMTrL73m/vGB0ARNofg8kc4bUOlAZGDe4xfjCpcJbJuCL
         917Z3HPCP6CnSO5E8JWwBoOn43kWITkd/VQ1heqTnQHzJyqhb0jicRoHwSyDEPeh1t2E
         svlPV/iD/ELKsJto1mhVjn3JKrT4H90skkYxeLwp/ob67Q1TtHxUwO2nTBQLuUOdcQDd
         YQxg==
X-Forwarded-Encrypted: i=1; AJvYcCU+t/1FValZHCIii/dob7SaZ2ANqjRpUTQXhZ4WvrBRzaZy2Kn4el2KweEpk4n+2EorxR12n20lgRIV@vger.kernel.org
X-Gm-Message-State: AOJu0YzE3BqWRpFAeW0KJDT1Y/avMe7OkIL7TMPRF3VMBtiaN6gbOttm
	doK5WgzovgSc38Pwe7/7xpivySjN3ICWDQ9SSNezWWcHbNJNx54iW0b5vCxOjNu9ePV7gz/KW59
	9YI/1Vng5yc09zvHCoxxjSKL0BtgJU1tzNKKi9sTvMn15WXAe/VYV3e3WlhgilZ3o
X-Gm-Gg: ATEYQzzgg2TnqNrUmNs3NqNZEzOzXrPUfkxylLbSTeOt6qvRXXvvLHNmCXvqP2D69vC
	at43uICuxakb+5VUkRHrMne1IibXkiv+5yknMAnOaX6HtJjjaz4r3NVySZc4qJ89z5lpSfO0Cq5
	IyxFMgEciWle0BwxHIo1Qv/WXj5UNJOUYP7D9EfyFDp37RFGzI0w/T+GyWisa2WPdETZ/jajtf8
	01qSyq/nVjE7ZwlkUCTPQ4l8IBlFecOkVerbriaxBjNiEYPDSnZ9d9gSYnc8Fw9mOcVmvsoLcsd
	aUbQJo0i4bHxvbzgRD9mZ4OSPU5LWCPw+u+R3DZp2/OwWJGc0Ebb/rtRM+5OUvlTeytgTYEEa6g
	QygPUXGUDMagC89KB38oFEd6fwe6LXMgTRy5XqFqucH5e
X-Received: by 2002:a05:622a:342:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50d3bca319dmr93914011cf.31.1775130340841;
        Thu, 02 Apr 2026 04:45:40 -0700 (PDT)
X-Received: by 2002:a05:622a:342:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50d3bca319dmr93913691cf.31.1775130340436;
        Thu, 02 Apr 2026 04:45:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:18 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: sm8750: Correct DPU VBIF address
 space size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-7-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbRKzvDDtL47/CaCW54CxrNWexS9GahJTKi2
 iaw89qsyy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5W0QAKCRDBN2bmhouD
 1/12D/9lyqCjDlTWt2wGfOBuaN4F+vLvaKdGUDuVV78ws1k9JCci/g5hVhpK8FZ3FlRRBgypg7b
 thYKSd7SoG1B3GXAQyC3uCBG1yj9t9cY7tl3o8lLFOUdtXbuhZkl9KTqdzL0U5BepmmPD6l0cBG
 ge9Wz/kZ1Fbzwlv0OIaXLmBeq3ZzpYooFYzfxBxOkHjpRDvR46bPDcPbla/GW0og9UNurohTNRz
 1DyvFCD3OzQkkq/46es5Cnks2DOBA+GcRqlhjchrA/mT+jyQVtb+dVDqdJqtIES8W4m0HSWYPug
 ac/wKFUCONieXfzrSkgilXvqToKaYWjU6q2pFPxYCYnni2I/1rmGpxTuu8vIWM7L3ehFv+B7Bfc
 zT3dfwFb0MH8Mvv26KYnibHXcocPLwDIm5hQ9jYH7SCAOhWlJBs/3S8XC7R0yI8bYAEEVBGKZJK
 bVuEZacc3owj4gJ9NP3PMMt+YLD1pjV4DSBr7cw8Yedn9LVWPoojdodqWqdHBVNYsava7bBrYYu
 a2vpGtV32UY12xOwdXFfTNDiEhEVyplRz09O2PABk6DQ2BdjgsOwqXlpo5zWd+XyDlBslpJbRUE
 102hsPJZa/zxOv1scEAZnxiYFxjZyYo9Ioi1vugoKMEv7UgviVZSKTHMIlrHSM0x57ruCmFrfLo
 W9Mka7rzRqw+qRQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce56e5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WYllmNudUJmrw8VR-PoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5Sag1nOGiy0_fmOJ1CpaeYrE_PM6vR-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX9/UYHG1rIZDM
 LDXr3C3Q1i0KKuP7NjqjsZdc3lGliK1Oh1t6wgF96NYqqoQ34RWLfoHMWKhOBOALOOlQXduCuFD
 mjOdKVO7lOEyYQ30mcZYcyE+fUEzYJQ6gIjRCYkr+qstA/q2y9Kka7FwjhjySLO1zl8CkBY8QuR
 uVk90lvwArfk4wSC141QgtQLprkyehrD0mOCF7t6UlPSykvKsUvBYklcZujpsoo5uYDtXB96kp4
 EfPQIKrRxQCHp8SrJgCwWGcPgQJAIK0jKJ41t/ClsQYJN63RniTmUFZGIadvPLeHFrRzMQpKUPa
 eIKgEiL7C/353cEoQqBwQ63onG+Y2NAQ2731OL8sz4RHyDtkbFK32NtJYkRM6ft88s98qJnrPLq
 EGDzP6VbfLHydnLMCX85s0ncymwsuhBGJ52eEsKQHoerTHD9MdMJ+SMW1zftTmZ7T4f1ok6RC7+
 1FnpRGOtC8Iqd9hobIA==
X-Proofpoint-GUID: 5Sag1nOGiy0_fmOJ1CpaeYrE_PM6vR-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105

VBIF register range is 0x3000 long, so correct the code even though
missing part seems without practical impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index aefe517e0669..f4b8703ef856 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3041,7 +3041,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8750-dpu";
 				reg = <0x0 0x0ae01000 0x0 0x93000>,
-				      <0x0 0x0aeb0000 0x0 0x2008>;
+				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.51.0

