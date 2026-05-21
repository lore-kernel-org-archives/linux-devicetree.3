Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B8C3F65EA
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368848; cv=none; b=FeLWs/nR4kOophhJTUkT0yDH3LmbdGnloIwLUCAGKx+qoUV8doqc+DC6x+Pkl1J/vWX55aVs2HgkxTc4SShGJrwkOkfuPhAOQoFoJwO8R0JbjyY9FMEdW1+BQZMoDCT+qwRAvkWYCTYN6yl1Q3uQiZWzY42UBdmI9ir8jGRybuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368848; c=relaxed/simple;
	bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/iYFAPGlwdpGJYR/AQq+Jg6OamvDxJkq4aW40ceKeYSZGxM12pHWDikwXjTXrujGMDcQF3rFQboy5mb11tJtqa3PyfEG/WxYzJCrNuehy6CyiXnyfF1NEMvCokG4jnr2F6uPkMv11P7yLPOx/i+zjIbBgfDdXmGXKAa95pU1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnJyhQ+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddUbYqhz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnJyhQ+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddUbYqhz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99qfm517858
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=; b=bnJyhQ+yDYvqfgxT
	DpdLDdvgsT37jschvPfjyvZbuuzMre75QijVVeQaRmZqf+xr8oSUAKbCJvlcHuwp
	gJTo0QdFp4ADIHUjtUXGlPp0WfOlhGDZMxA0DneeixtoAWscfGT7+tn+vVW9LcSl
	5U3xOEvYFLFUvtC8QNc/RgLVU/auLrfQgTQu+ztR2iV47P4ZnhT/axyBbz1FVmAo
	vv9ZOFpGsA+B06QKywtT9LyBMI44ynHvgKvLwEqpX7Al3V72/imgXwakoFeRySKu
	OMhksAVZrxo1WmgDvOc7bVNTi4vz7vSU3Ay8bRvMa07AwqiGZLD/CDbfvk3g7CqG
	mCb1Jw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa2bf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366344513a3so12989562a91.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368845; x=1779973645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=ddUbYqhzRW5+FQ1axB/I2vm8Az7Y1tSIpulehogXl9FJO9W8+Ep4M+rDl5PU3JqioC
         DPahqaoMLQfm/ca9M/jhPdBscjcFWk/bEgA7I2wG1o7bi/jGm3zjMMHg95ewnvzbN/YY
         D516hMwx2lpOrQyvnDK/n4oQFnbf9QzG9rlHWmxsylDaOtdfhjKi7Kzu7iKCERJlxwy5
         lbgfbZ4kdAjjy7KR53ixgCMUlm8G47C1LOI27K04HkCfgpScPEE3eLsc5fYU55GjMqzK
         tkT1fkUdjitEK9UWslFzdCwt8Mqpmm3h86LVr0aqAKkumh981sNfeeoivo3XHHTaFtZp
         034w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368845; x=1779973645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=bGwftO9FvRe7/Z6u2anCLb3wYpw6/leCWjJoOxwrimyca0WzkAGuuF9868yczTiW11
         o/pcHF21Ik/FHR71XFhaMoXWwVmw2PH61biofP8KTi85OlzULF5tbscNFGiqlDq7uoLX
         i22hkXl8olUiyOJwNp8dhbwiW4iJbO/Womlpt0knq11tTA7tF/SgdZtGANK4IZT65HoA
         UV3BV7bUFAK8P8VpJFjMUkp/czDNhW4kVQMq+qr96XHCEfMvN1fER7EU2LP5Goc1YW5s
         bhxjLJh3o+HdDnWExITGw5OVGngn7MDrlLayI452gZ3lgHWRO9vLnVij3t+bCLryDHT0
         Ra5g==
X-Forwarded-Encrypted: i=1; AFNElJ+l832wCGaKLoSR50OjOCkZUqgU2I8iSuNLDZ6wP7exbxgLAWI2rN4wBx5MLmBOPHLH7JkG34FpAnFM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy07W+OKicrGMramzK2dTJvuZJvjT9PpnAO22ZTCBVE2hRB86N
	Am0I9te9eY/hGZC2fdjXzXBX+XUeQ+GYErMMWJcL+ry5j7x3fADGwR48JNaflTVFtw+LtMpuyPg
	Yq0W0HgqSnbjmJP5SyEVC9ksdYVOKheZmmgR2QgUkwV4u+zXKWMQylGUNhHAdH2cq
X-Gm-Gg: Acq92OHd5obYEi2mD9xmWCpcSUk5QHbxvYSrZxEj8BoqJ1jaNx3/yL0trX5F2+JFRfu
	Hve4ekM8jk3F7COsDAdVcltY3iYoCz7vnic7AAJgeXkyfN3lDveiWm2pXio1POJRNCtqxFyyFfU
	jL+lL2Q/Mt4yTZnfdffnFvX1+fDaukxh4uv2HAIYI/TfOz7kXk5fzyhj49l4b90EqtsCjOMbael
	3bpSFMb2x4qXIUsWI9aT3tsphgHw3cCr72hxxrngBWAjMj2G+Fi0NuYekIANHNVCKWG7rw3MPMv
	K7ZEcytYOrbk5QksIJrDIUheF2tVPdKM0IJNSFt315nzxUIpKcLUBweiNljnTjlSnyszPHda5Hh
	lm/2Hj/F2imAsty3XQgVoyz3FJUqaxBOsHbWMzvOwAHrfvr1ojAczK3Ek
X-Received: by 2002:a17:90b:3c85:b0:367:c442:3f20 with SMTP id 98e67ed59e1d1-36a4562d34amr2912593a91.19.1779368845455;
        Thu, 21 May 2026 06:07:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:367:c442:3f20 with SMTP id 98e67ed59e1d1-36a4562d34amr2912549a91.19.1779368844978;
        Thu, 21 May 2026 06:07:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:40 +0530
Subject: [PATCH 07/18] arm64: dts: qcom: sm8350: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-7-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
 b=t2hdMCRWSJNRvNxjqNUg8xoML33lFe5t7/J+hEF68s24P/YqlB8ykk52DXHQHLjbkIpEh+kZK
 wv4CTazhosUBpUbyPhB6n/yqDv+rLpFyTh7ae/hKo7oYt2bLS4dx0Wi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX3VAbxDtzG9Pn
 vAKH/qAEeyrOGdzDnwXBxpTohiYfCiibm4UPnXXId3AeymlxCYcibMPHn/Lk6WDnc/kvaiWiKLR
 BO2M9uHBmRn3gDLackDw/pyVEue1TOqTtCVd7JS00v3BE9wNXFmwCkY+u2yPgkB6zMqVf0Hev5Y
 qLhM8GlYZSCfkrlwFiGn9RDJfwZs1QYNvzCxz3clJAUykSB2WPH0O6wQYc4UWkVVHYAeWYHLHbB
 f7MGsuz8ejUrwGaHX6uNpo9CwkSCM2kwzRJRk4XA49Yb+WJJTaOIxt2kgQMf08oS0vPMGFVMkYY
 D8waqEgOD/BV7XM5E2tE/cnjr0TD2eMwjplNjhpX1+7UqoQzTARAwFk+ERQC7FF9jjhSy+GT0Oe
 Buse9hxZfL8CV2ajlz6g+lfveZvYS6ehTeSV/PipV8HkZqC55MtMPj42QUtWQTFBpK6emmdbS3r
 zKYbyXYVKHYVrgZTUgA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0f038e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: wnuxiKAaUE4TGSkJ5Drx510f-gXETMht
X-Proofpoint-GUID: wnuxiKAaUE4TGSkJ5Drx510f-gXETMht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..0897ed1bbc6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -494,7 +494,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -508,7 +508,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

