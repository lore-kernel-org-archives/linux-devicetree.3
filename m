Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145E1364941
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154001; cv=none; b=Ep3LW7wttDIvZ/7fn100VpXZf2EedcDYO3+IoRgYbY8cdjuzjKEauVep8S8YQsr2ZKFMeldZJheEpYu9dRM7rZe03hPC0UlkfLw3uLw2q7Qxkh3r1g7ZTHSaezUUlF6ae72TKIfZMPoekuZhKrgtx9KSGrVTI9Ai1tkv9PDtWzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154001; c=relaxed/simple;
	bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBb7kdd2tAQcZdC+idgWN2Wiu3Hmew16u3vmL+uT4Uk6vhLCEK5Ax8Zwpgy+HyOI/KZJpnEjbEbtA4GJvyTok+LtkEcO6AF7qEm+VdzngEmtUg0xIkPdyQ+5oo1A1qo0TozqEnJ9HzjecIIHtct5SHMThO5Xr1/AQjafyAyjcXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOPxlclV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsEMeP7z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOPxlclV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsEMeP7z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NbKf3132316
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=; b=dOPxlclVeahnQRFM
	J5VnfaeMn5n+oz29cj45O+S3TVfILT/ri9HTUzV2j27Y82kmolg9jBMTWxfiCWpH
	sohWtqhkNZNCZQHiniwqhIJ5vSYyuBCX/8UHLTFKD4Cx/gqdXIqKO8OWlrxWhw8R
	k8p/1InO5nNDrVs1oPQ/CVYD047k0GS3u5LyrlU0BEL5cw3+FYM8Uwk3yOeNR98t
	lSkhS4mTQIRIQGF+J1H0RHTppR6XqCDKrzL/AoM4ugXa7y+f51Esgr7WykQ2Epon
	SoFflKQ5z20dokl2zQ0B9UyMPaXwZ/xjRX7In7jMGEKqCDjxLOCMQQxLLCkSIoTZ
	kPfKjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shqjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf243973c2so52673675ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153986; x=1781758786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=LsEMeP7zyK9TncuOoPqBOvKsydLmd1bHlLVsC42XejxOun8m6hPuAFSMvRWIAI5Lx+
         nx2U+uyuuWw3JYuk5A+dGtVRZt6Elqz2IC2aq6DfEKJr1py1Eg0yAOzADcAiNtX27F81
         Z3iVfZTocfYTwcSTxvH+fc2WZ2HdA7AGrnRYrxZhoOXM9DlcibKqttdF8y+93JnSDHMP
         gPH/6Ob479fsZA3j7vDdEfVNP90sprZ2M5ycopIV/MUIQ6DX8JcANbdtjBYCXinFho2s
         vYBNNTk+m2mQ8FeQSl2J+QoJgS9s6L7cjWza6nkn2NwYYe1xXoFO4ZbhY1RnFdG4OZWs
         ZP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153986; x=1781758786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=jXqrMkChiNGXCCWmjLvM/sihwq4AaN2Coc5tUt5ZhsmA4qlBxU1Tz5xLSVnoH7xEhe
         FBEDtZRPjgpOqq8ltNkmIKcOpFWTac4VgP1skUPWS2GhJr1oGMGhpadfrTrbZgYKIj2H
         b0CC1mjAu9/WcvATAPjLKivvBjKNnzIAVo4JMGKIsmNcW38DkVfy0BgOrTB+xAP6tq2n
         Bk+kSy6aN55bzB/pSeE8lqZJxmCUd2iR7TM8MwzIG8M3Zzym6v+Wq0xtd+2SDg3iW+5k
         J2lsLW8uv8CwwDjtWd85m5wC+3QhM+lpyzCWUSVlvoUU/alj7TxAMhs4IegjzVYCmivE
         8yWg==
X-Forwarded-Encrypted: i=1; AFNElJ+nPO7FQ8er3LQAhneWkMmqkbgLYqxKuXEI0SNBMBGjzYEYFKm2LBPw4WeCAe1//qNaJfLNVZ9XyPiS@vger.kernel.org
X-Gm-Message-State: AOJu0YzD2uvKkgylmwl0gnL9EXjwk4t1Rd1z5oyGe5C73WwzF0DbDQks
	sMsJDZST7GED24yN7arQZygwDlyzMYS7S9rGxNXCL35BhI2pQagFSnSo5Pa/0Du97goZ+2N901L
	Q4QPXYjHEdiz9EGEjL0GlsaCtp/4Bfx3wKQPZlVUJFLzTD/v4H5tpkaNLjRQNUjM+BQbgN/qG
X-Gm-Gg: Acq92OE+Tb9lkhyW9ggD8dX2jToNkhzNwPm0Oo/VNELmA21Ees2Zd9ZOup6kN3UXGyx
	dZwTEMqjQT+Do4arB5SS4wSUQxEQfVT7yLRlEjYnSzkCX10ZepMr3FgRR3hG7A24/BcRqg92RWx
	RcbF4iNh1VyJkjtQsZszBItFunsUEwoAk09Sx5Hp7PeNDkKb2aNPXIBxFTQ5crwkS69H+6JYAMI
	5p25q90mFYo3krcN474Ip7AnnqUJeLgYt+GeIX9j93gLm0/8+h355M7StIfkciA3xWwrgMSXqUg
	Rz7xoQ1b4Xw2MPIRPl640hUgaZwllpIro4imkv2j04jzof6IyEhRikLAjIhW8Zr97nqXV7DTjYd
	GTE2kx2cQTmaMKvSRca1DohN7fhVCl+sJfUj0DfNGlh+SLqSL+bPjBmyZUAabeLJm2qw=
X-Received: by 2002:a17:903:3886:b0:2c1:6715:a4ea with SMTP id d9443c01a7336-2c2f3254f81mr13109255ad.30.1781153986479;
        Wed, 10 Jun 2026 21:59:46 -0700 (PDT)
X-Received: by 2002:a17:903:3886:b0:2c1:6715:a4ea with SMTP id d9443c01a7336-2c2f3254f81mr13108955ad.30.1781153986035;
        Wed, 10 Jun 2026 21:59:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:49 +0530
Subject: [PATCH v2 13/37] arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-13-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
 b=WoOBM7JzfJ45jhY2guFeAacxFof0MF6KzE1BEY9dl9cbLBtrcDA/rluvpIM0bLDZtC1ZCjUUV
 HngJZnKy6iJAGMemezUuiwj4iRwlU7ucXxrw+iwRNh/rVx2wWE8uIkA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a40c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CvdHnXDvjEm8Gtj7VTGEoPg1zrQJKuw1
X-Proofpoint-GUID: CvdHnXDvjEm8Gtj7VTGEoPg1zrQJKuw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXzCXz5gUsbcdM
 e3UDIqrt9v/YQgPZuRTnXr3naJRHuG73up0SB4OR4gGp/PUwGiASTqknI3jLdmUJkQ2ZaABwu48
 bnzpjLCmkVxTyAgzfYsen+yLoPHhvgjtk/jUcUxyxu9r5CB+o59jr5CPJ3nqBMLK0s4dy97z8nS
 aRWbhqyTAofccIJoHRvRxW4rDBW9N2EkqOJgaYzZsnj/MP0fgVyJMU98DHtgIUivgEX43Ik1nOv
 uU7tO/aCTgSjZ4zQDLPly+j/l6Hh5F3vLZmoJ2ckiGku9ypi1z26Elh6luKOUYZcGVmNtq0f8mR
 RZYfly4LzQWNkGQS7uEAfaohy/aiasUU9vEv5EtsyZtxFVbB5Bqk3AGI/+1ErEg9lwVHO/jQuTT
 LIMOFGr3Nuo5KK/ZFhozNkVA/v/4zhFMtitcJvl3Do1F5QqQdnT+GJpLE0lOZYePrsIrsJI5O4Z
 yFhGhTUPpJw9Df3JBeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX/Vj/Fqxuiy3J
 1eXoOSjvQ3pJZlnhzsl3F1c8+K2WvIjs8YSS4WrDc7ocHgV3zf5wpUQ2GfFA4UUtsqGdTkcOHbq
 hi2ZWOiXbcUmemKliizdquhxX1wQC9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 74778a5b19ba..71a09e76b359 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -358,7 +358,7 @@ &i2c10 {
 
 &pcie0 {
 	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

