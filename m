Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E136167F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153952; cv=none; b=lVEcEhEa6PIno7c7dJpi2kCdsc2FsnFYgW5NIeUPRaoQCGtQkJ9MAT5FiMk6F46yvMcAdWgd2cNc6/IsDhbpL3F4krpPQD/U41lrHWrOJ7QI5CnjL/aEPlhPsoYNvDtzut+6NoqdSckFD5Ej9xz0IAThLNHjZJ8bwK3n7aO9OKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153952; c=relaxed/simple;
	bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ul81yggkxxhZDCg9K5O4QpgFzMM6DyxJ8V/dVc5erKekLJB6hL8rfFjpgJYvsSyt/eXp9C1QD7CpW94RGwFiqCmEnRZnLV3CCH5SpkN5QIuDdUwRoqjX/a8fp6bmULafxk0uymYXNK/vrWjFL9c6YC6IcY/zr66Bb2HMss5kggg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlNzfk1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqxQ26+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlNzfk1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqxQ26+5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nm4u3092284
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=; b=WlNzfk1cJbf7R+D7
	nAtr6pKRud1vAiZIp+Nb3hiQimaxddxpt8L5oDbqSO5dFYJIKeFlfAiXQnLlDUYk
	oBRIDtTGkyTTqt1v3M8x2pqZKIKsVIdfJ1RALTGtYd8nExsfPx00KDMG+rGlaeTB
	7SxS/pNhD7ymngdbOpXxKCyZ3hJtauaa6s7r/OzbkfQI+43YWYmQmQlD9XKJnNQN
	vZXwEelhc4KD1DNoT6pI0SM0fA/EtPNvto1XNpbN8YGnFVBVlF7U/bi+JUDc2xGI
	dwxft2JXRaRCkRyltVK2+1urtPTTN8bUqZRf2N/v2nSEQsbpxVxmn02VDdiltWA6
	9opZ3A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:58:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf08c2a24bso72207735ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153938; x=1781758738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=gqxQ26+5RGdYlbyrtZKt9SGV9uLOFOlifSqM25o9xrb/U9qPR6Bri2s7OofNOKXeTj
         O6vMcH+F7Rt0M8QCIpieXog/5iHysW3RrfJkTdlQUMU9IWMtBRm7OgAL2VfmvImRvRtt
         2XrdE4nTdUtyMSmS1YHPkOFMiKmXLdD5Op9+WXfLk0v8Zcm0JRkNkaRbrfGZiO7FcZ9R
         7aWONmpj0LwAEQZPCsYfouJooJJNixrQB1riHcZ+yPEmXC3Xm8Dnku1twcncKiL2k0qP
         nTpOHtqE5jGxpeUDdOionGGsxe68ozMiNxCcQj9xTOKISYnvz6Diq+BdlNcA4EGAMh1h
         Sl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153938; x=1781758738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=PTJnfM3tqlfitHaCvXemYxjgKYLxPIjYo9iI+mwCaE3QSzjj/TsiENzBC8cRDCQpMO
         uVsL/Xny1RTmd7mKk+RcYQVb9/JrcQCVmVfNd8HSRtiD1C5fRRQcCQ1McPsZGb3ISWQ8
         d5xHiGf56R/6QoUbPNhNdrciTMZHW5gKp15n6n4MFfaou3oSuWYyDdnwm7XGeFJxwr9F
         s8mdMWGPp1idhrHKytyAmIBycZAbeHNrH2jmeOFf6n5hW07MzM1oGvATF2D9UTfk6+Ru
         uK7mmFzxtfNFftN98qnplYURxG9wky3dhop859PQk8EmtPvvS1OSt/3fbHp5eqfBdZOJ
         wMHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X6GouV0Bb2xp6Ykm6dWqV3ARsvn4/zYVKJvp0cdoNIqDJ+9yoHUkgxiHsKY4E0tlFfQ+aAAFemm4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjo/zUYr+M+46R7mqdEaKagOtPdfiK2CM12yDc4K+Jxu8HStV5
	AAdgedyK3udxbAY8AyL439dWta1LSQNicz8v9mTbWl8Snmz9yITT5oATq1jFy4rO4Ccnb9FQi3F
	kh770vq+X3N3UVqfGZkJy2rbfTjP4JSx2iQDuvESZVXvIEPepKEi6e3IMh/eb6K2c
X-Gm-Gg: Acq92OG4t3nJjLvwS3DfdmkzrJ7vSDtiRQNO8rSGM1WwVROLZ+nyXj5zhbNsE2GM0YK
	d2CkBJ/wt2efsZ+FM/wZjMItVmy7kpAFXafcpHh6+Hxh/A9rDL2zQ61tdNY1f0h4RCJpu/Diq+0
	JFiKVPD8moekx2TTglOE4hOoZBVDgx7oUIlg0XaNPtdbH9M/tYkfeyDo1bSLa7vNkPAStHYTWjT
	UG5y7toBBP746vdKZ7Lyp5p9O8HWMw8A40FvoJ/iH1YdMdUh+O0bmR/wvkm/VPuWSunluWy3qEk
	ddLxvf0skMP1r/V18LQNrLKWFoNu2PznygUDSWLgtHBWpL8k8IYX+brcRqyKbFUgqOtxPkY2T0s
	kotj3efWLxklte1SyYw7PcdV2qps6+nPp0t4kVpLtmDvAbqohX6kjNgoY894+pnz2OB4=
X-Received: by 2002:a17:903:1448:b0:2bf:379b:53f5 with SMTP id d9443c01a7336-2c2f1eb779dmr13982715ad.23.1781153937725;
        Wed, 10 Jun 2026 21:58:57 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2bf:379b:53f5 with SMTP id d9443c01a7336-2c2f1eb779dmr13982395ad.23.1781153937300;
        Wed, 10 Jun 2026 21:58:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:58:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:37 +0530
Subject: [PATCH v2 01/37] ARM: dts: qcom: sdx55: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-1-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
 b=ZOvNsWR7Kp2QUGDxxPpnU1j5YbR9Sjz3rTdE2gBdpFUutiJMJV2hG6tuG4MqWhcg3mwy1GuNG
 45BWg6cLwxPC154jtJjGnaSjRLv21O8jYip8fa6KMpaeRTVol4imtyO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: zAfoob-wxCvx8ckucQ8jLOS-4zuY3IVh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7kfUGqT0GmsF
 niLjZ4wZgr29A8lhNv5pTEPcL5RL+US18KacyBXELKZOrhuIZz6ibGXWvYWA69Tdz9zKXXJqf/M
 P5OOnTpwuKAX/qhD1cGWHUM03lgXuU0=
X-Proofpoint-GUID: zAfoob-wxCvx8ckucQ8jLOS-4zuY3IVh
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a4092 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5zsQglHFdp+N
 SeD9kp0KBvTQjtV81U2XWQ03x9QajiJUqR2JL0YmOPlW2bCbsnYB7AhIXRY3Pb3Rn+2Fd4Df2ki
 QK4RZDTqzAGXyuirDnRsKyDVAFUBKoN8mAZ1MjWcSJoXK95YZRrXqM0kuCQ18LnWpny8+I/5tBo
 xTwNetpR+bq39A2Mid0lhuFimVg6e6eRUb2J8fDtEa2E1i8A+YORQxgdVg9Hbrdu6XMqTI4deMh
 TfCz1zDXAKS/AddzkfsvhvsX3gO78OfK0tO/pllm11FmaA6+H3/L6mmhf9AIhLFU7ocpy82N5eA
 GlkKeK+N+ec3J+fV/+Rxz+DBhQgf9iApghVfiTSjZSrx2fW6cxoco2NVDa3kq9jLg0JbFcoJN78
 S3NtDdz12YpOo6Fyd40nTYlUiXxAC5VLAdgsK29d1hnEqTqhJA9SH14MAeHllDVWTxrc9Ija0pz
 dGvZqzuN1ydTLCOcfWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 082f7ed1a01f..302c88c47960 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -251,7 +251,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1

