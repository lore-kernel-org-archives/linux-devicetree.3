Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4614E56C4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646152; cv=none; b=A/Ux2t1GkC0algs/1luP3fnjWAaW7rsQAfXOm/HP6Vn7KLLgGJrnwE8kTTP3VjjRphkMRbCk+p1V4J+cqWT0RdSQE+fwJeBxCKc+ObZeSbPairc0m6yLLClM0dlHyo06z+af0LGtn3q82pY/MyHgAfNNuiwxXjpw+EuYwsQ1BLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646152; c=relaxed/simple;
	bh=uoqGI1WptHrepXVSIIuRLOq7OS6th1g8ClbShWQlQfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UJ47gb6gEQsS0lskPfPlwE/gmSPGLXEhm/oTFC7TOfeg/8znti/3ZOP/478gGfC2g9T1xe9AeUuHALEuMpK4fgLiWnn4BQgdKrVL77UOOX3L/BiVWvjWMmC55eH0vR1LJ+C82trHVhv6XuO2wVTUTb5qeZHr5PUBnO0JiMQg86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/rTJuDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYaBgLrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/rTJuDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYaBgLrz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zjem1520189
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=; b=b/rTJuDMM+UiJqwI
	CFyY+8A553OuwdKFfX3FoXkw8Uc8sQj2UhNzdakHMlMVeF8QR4A0JMYG3IDQ6F72
	gn38nMm/U6CtSLrObYVt/YnakdZ2b6gpIutF5957vUJQR798IC6iFiyrr9nxLsHc
	zQdc4dm5HwyzULubWVELEwPmbv75argAqZoQ2yvsMPnn6JDgLaafhWJou0aSHq9h
	gJqXx0rdSKlcocenFMbCd1rmVa3E5974P7RBORlkxc/YRSsgjgjnNzUQrwKB47u2
	HFscYIJGVZczb5X6kEUIRAJVa8tPh61qGQH7bwAZFk1YRzrYlRc3mw+SAXQTCWOM
	DYmb2Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc3pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so15469025ad.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646128; x=1790250928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=;
        b=hYaBgLrzAh9trrKyu4zux+Ugwl2bfgpcGjpFKra2ph3VsryYX+qcO327LvQVz7irNU
         vDGwMEKCicQVl7LGPgpFl/4yNXCLziusMFnkerwZZHAufGB47SMpJ7358FdI0gFBQpLJ
         1sRLOgUcKL7o8flbB6njXFAvkZaUJNTbVqcbGjoB81Jt2zuLSZVivi1Nytlzdy7soTRr
         d3EX2z/BQrYuGw49GdNiBdxqb99oujRxriGC6td+Cme5PhcY9vvkfM+MTYnnB7RxVgZo
         j+eqvSCGpkZzMSFk1bz4R8ajUQPoL7aC2jYZwhTYBjhPdvcCEGEvh6pUVA4zLvlYJKRK
         py5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646128; x=1790250928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=;
        b=fUxwp1hQ786TgVMZpg/1mHQlKBaFt+SGKmNa/+HzJ2qE2DmlmxW36jXAyGG88XHTQA
         Z49Fn8q9HZVdwItbdLgsYALqtQDRrZo55alvizjHIWbArzrzeMQYGA+EeSPg6xwCyFxv
         eUr/OfXVv8IW37H9fEwfyNjXwjgxUMAYb5uVkFevTuAH/kz85GUsdKuqpfbpuWZXClm4
         gkIjN8CTI7hVRpTHIhVNSA83SgcYPjXBw3MhZKPGsXgr6DGGqgADTFVhelZpvuwrhQWS
         RXcX9nHX3/79cygADI2ww3FikxYUma/m9aHQWjE/Fza/I/SE8NZjo5DUrDkwwGb6uizr
         WsMQ==
X-Forwarded-Encrypted: i=1; AKwUvByFMy5BRGQBcgjEHT4gly5EMt8AR+ENgdASKGYiSVGSUn/4lm2oZLqUnhInl37dK2VKLfzQ9bAkpccO@vger.kernel.org
X-Gm-Message-State: AFuF++mKkqWWHsAmkj4Fk5yO6iKhIf/X3W3ubYb5kZbssAcentiINlql
	RgNVGjc71N7NY75bNIzLOU11gzxSrh2MI5jdOF5iStG6tnuuAIh5Uagyluo/hi0sPVKOwuw84on
	FWiZO3sBX9hbBj0UyFuFK8Ol8iioZNb8Uquurpt7SodExYhpIquLKJIAeisdQuVwM
X-Gm-Gg: AYBFou3NUmVOk5gX3hy+t/VQe6omf9mSQ0DEvk4R96UPsRaCi2ybcgGp/yv3KIgnMoe
	OVftPhjF/Co1sUJ63LF4bx7fUbTOZtXAxDKr+sXLU629vAuTD2PUqr18FNtljrFHBWEnLODdKHT
	CgmUJ1AMstg4ha9ipOvHLFIucI2/W9YdKoqkXhLJzUFqxbxdxOuz9H0VYQtzHOgDcNBhb7LidTf
	vQLdm8IxoZ4eyjNnuQ+3rrL7jNSbvj0ZtlqtCOhtacL9q0HAzeoSguLIZIkE0ymluCejkVW8yWB
	LMH8uuRxLMadhkGBYCt9ZMOqLFVPmuiFSGYOSSWjgr0nYgL/usLV6ujn2tUTFpzkdOR1oVh7QiG
	gsQOtXEkz8NM2XQzwcue71LRugNQ07RGuPA==
X-Received: by 2002:a17:90b:4fcf:b0:39d:ecc8:73b1 with SMTP id 98e67ed59e1d1-39e1e2bd30emr23221740a91.7.1789646128072;
        Thu, 17 Sep 2026 04:55:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcf:b0:39d:ecc8:73b1 with SMTP id 98e67ed59e1d1-39e1e2bd30emr23221645a91.7.1789646127637;
        Thu, 17 Sep 2026 04:55:27 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:27 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:21 +0530
Subject: [PATCH v2 13/18] arm64: dts: qcom: sar2130p: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-13-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uoqGI1WptHrepXVSIIuRLOq7OS6th1g8ClbShWQlQfE=;
 b=WKw7Q2R92p4UHGpmpsOQc6jvIMB8BgRUEukUCyHZk+H6xTR/MI/tBu3Epgye7aDjO91Bbo7F6
 799B3LWspbqAgvtIvV3r1KqWtTgPxmuYBZy5dzp7uNsADhu6ov8F5OB
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/zJ0JNos5lOb
 Dh0UEQBaszi16e0LR+1miRZbtuIsElvsA021xYOtN/Ucg9oiELrbHj1zURELgfshxXwsK6iaO0d
 R+EgOZECy4RHQxZeBwstwef+nkmwqkOurOHFh7W+Rd6meCx60NX7bBXyUnCYfamYjmQAiWWm8Rx
 PqrJkiYIHT8dpmOmmJSOwI7BGw1G8RwVfoSHwD65fGBp4g2lQRgqSyfE7vjQjd1Y0XMFijWuHxW
 18cJ72CNqaHldUKvozvbYurhLd7HP1QiRU/Ei9hejoX/hDwutpJZVJZzp57L5zKplLZnhYDjU0u
 QYq/AlXmE0Qxs0JMkobasbpjaE23cU3+NP5hdEGL36M5HJmMNDm0/5zNg8FmlT+YO8Sh/KvYG7H
 w+xEbwZG6rQd7yPECeS+zRe4q2dFTMmg1mBH89pJ/0YVfsDdNWfQAZ0fCpcrdjqHJhrBUUvYtmz
 0YxT5bpFeifUehJdy0Q==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabd530 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wFPZNiOzR7HGLuGkJmNMDxXNEr75m1F-
X-Proofpoint-ORIG-GUID: wFPZNiOzR7HGLuGkJmNMDxXNEr75m1F-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX8S+YSzoYh/eB
 YblhQNl7vyKjfeL3MDUjfafCsmU60pgP0skHzATntZKautcpjT03Dkq11gB2CakUV++h3d5Sx7D
 PKGOasLqCCeEzmkflqea4YwT59Y/HBY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 80428c0b3b4e..7469134f42b7 100644
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

