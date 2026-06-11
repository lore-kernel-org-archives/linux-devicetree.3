Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C3303CB0
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153968; cv=none; b=asJtZ1Lqc0LowFviWsqFMzvRdVYbcgAL5U/OJtD92HmYAu6NjJahC9QGgpvsDYCcyGHjcqbuTxcd5oaoClDmYJe3vOo25WM7jQJDfeaXlE3Ei7IcrGX7m8bzlLc7dyA9OIzf/ZUvwU0tq5exhsxY0X2AzqG67oD0PFuZXLAIKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153968; c=relaxed/simple;
	bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOpnNdGYkB1KxeNsNZTiILdcId8gCRcTpXYiWDK4UcbjZUgG0YMPRb/uXbrX0xNLR2bV27cRusxV+frdoNsegjWMomLMrFSM+h+MnlugUI3GYDc5O68Mz42oS7qPTQD9swfI+8GR7VlZRkLj87umZYAq6r9Eb7/ZcsMEgxoeXCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4T3Y+qg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeGzUk2p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4T3Y+qg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeGzUk2p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NYQo3183749
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=; b=A4T3Y+qgjAobxFS5
	zg+l1JoBIu10n6H0W48xer20R5r+zO5Pkw7GSMd7mRTiNGBeqJcHzyOocCD7Aaeh
	tOuZiCEPcv8WwbNf7h6ITCNjvmoESqyxg+GQm9nC6PmaPVpRI/nicm+6+9sAicUD
	E74uyw07tQNMA+OqScH+GPgVT0Rza9y/k9aB00UGsNH/9o7W9XmM8F6zPjx/2Yvd
	5T5KCVbHIxTl6brsqGx5pGLS09lu6VYptXffdVWUw4UnMIWzfazxnf4r83SKWXrr
	i93P0TffavsSGhovOAXeB8nfQfLWseVDkfUD9dsRKpuinDTYt6PnLXHP2MTediGj
	PKh0cA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1njd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0d0516ad7so75683145ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153954; x=1781758754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=LeGzUk2pU3oomLcXcVNw71mg6OIHQ5cxiSro4/twVD7eRE/vDIYla9TUtHp1OZfzmy
         ZfJXgGsLv85t2FP9C6QDXyNEWwjSPMbfEN4MjLpjTsGdRFk56QDJn/s2QsJ7e1zwFlBu
         zZyrDsmJVLm0evyiM5D1NtdQtIAsMfO0sDgYvWJa170ZC8UxsfhzvwUEVE0NRI8Zbqv4
         Rer88O4mwiydWpTJS2Jk+Q6v9tfgPEXLsueIEpwB8S6lcXSd3USS+mgyXeeF3f5PxIDO
         0SHyBsmA8/JUSHHPJkMNsySz9ghbqmXXPjWMjkSStXR9Tx7jQdLPsuMb7Dr4+REgY/8a
         oIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153954; x=1781758754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=dlpRk+aAiytjJUqZ0ezFLMbTMzXu2+rF4cXihCJcitBJXHKyReQhlvA6tccjlynsc9
         3IMbXl0FWLOzQRSbaJuEEpZsp0K+jzC2U4meFJUig7S6AHSEb7DBWXVrx7VYs0Fb0+np
         366QWBFACt/Q+fA3wJAm9GrldtrrSY9k4KG74eX8wpAOlvs2vgYaPjIwMgASvp3ctsqz
         FxYGl/CLOrVkhpGMcDlom/gYd1R1I8/PAFJ6RZS6K7jc7qEV0YM0gm7B/Ozz3N1WE0CC
         IfviiG88qkzH8ZXCeN3jcR12AQOR7O8lGAc1z3ynYWkEZ9NVQU7ZBPWqUbJOa9GIL60o
         zYjg==
X-Forwarded-Encrypted: i=1; AFNElJ8Jhlu2/4WeSkh06KZ5gUDPKK5ZFUjdi9XRP+P0Vd0G5fHT4Ymlsbv/WW9KIDKO94c4wUdMG8my+BLa@vger.kernel.org
X-Gm-Message-State: AOJu0YwL7/kBpv74TRKnS8AeFQExTlaeIEd0LTFjvE/emEzrFtfoGWCZ
	eOQjHUHDPpmrml9Cs4mqmD4fluQi6OsVOe0/YKMXSXyAxLM1JSyLsgdaw56CnbK/4tD66yuZwgu
	p00xmn9Kq4WqRXo3VNEKs/WvF46C9ogRv9vF3ZSvgqAypvviaz3s88qfk1C1XGrh3
X-Gm-Gg: Acq92OGeZmD88HaX84es1OV+aQeHZCXwpE+a+3YLSi8V8Crw9vg6nVU02cEgVxXvaUr
	bGlM8BihXLG7VN/7wpjveu2IlV/4MUDMVvg5e5wD8Fd+ssBFHQAJUJ5pnzCgzTQcsyo1pqZpJyw
	Fa7GeSLGvnVkD9JM0RXV1XnnnNbrKQFEjPXJXxoV1nE1HaWhMVu/+0nVQCyw9ayTLbjgjf7BNvD
	dlm+xZLqDaUFJsFPlRkgAnf+fieROcJyxCysQMw+5eMiFXhV2quT3JPGyQz2PP8BQkNRpT4HZKQ
	Oj7IG2ewHfIWWS3tw4NNtaulS2GnyYXysqpha7QUwmXJXf/6TlgRF5QCLqrEA6l61k55zheJBll
	mzMDd1J3wCcSht0PqRnLfQqVLKfr0GalrKFbR6T4aXyxBGombgwRTtIcd+gFbM24q7ao=
X-Received: by 2002:a17:903:950:b0:2be:3850:297e with SMTP id d9443c01a7336-2c2f3c06bd5mr13685785ad.31.1781153954030;
        Wed, 10 Jun 2026 21:59:14 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2be:3850:297e with SMTP id d9443c01a7336-2c2f3c06bd5mr13685585ad.31.1781153953582;
        Wed, 10 Jun 2026 21:59:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:41 +0530
Subject: [PATCH v2 05/37] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-5-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
 b=YKUHRAh1glYPZA2lvR10XdJYr0X/WLLCp0PvmB4cUILQZcVr1TYrIarHzK5Vd9g6BBFnSelCK
 fzj790zrJqgBGfjjfsxVa156+wN2uofzmxgD4+8O/u3KYVfKMwWhWQ3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: YxbbLUsjo-Y3CeaMqTpriT_x88VEpcmu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5HErefYMZaJt
 gf2fId3Tl+cl3omda9FD/4fjxbNdsJOV5BbZseJdXIcPVECwdTUa0DlP0Dh0ZkKE2xhD7ZqfyxB
 R2iQDUpGeZmgEBpFWm+Kd8wUlTgiccU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX/ZbHiTCZvrwe
 hjxRkQPlHzSefaMRRUSQpsM90BaWdMA67NFyW0zUT4IL+0a78LwDDr6umID33tYZjfGRAzjmD9Z
 drUM0Rcyifl5HO+o013YZI5pfC2jLw7DTLJ5QkSV4ASJCM/kWNRGInJlIKiE9EB3hP13YVNutu6
 pNxSg/YNh06d7Z8e27nlGvmjt8aCA3fUZMvZVQSxfG1v2ia2CJuTNfVJWYwV/C9yo8HRoUknmBl
 AgsFVk+tOSSmNxJOp/U8WrCtoM/B9oCAaNMshdbW6IbW+rdm4Wm0KoT7OkVphx9aPKj6uTOePUs
 d8KpMd1nnf8vX8LNKKHBftTgXHTfWrLIdoWhK9b2TZD+kI3izkQT0Lkfv/fzBlpBYFVkGVPFFnX
 l7g99la0Tx5krHUpNDf1FZH2cJMFZ1HYgbFsB7v6fswvY5DqeJyEGftetzYXOQHjEkzWSlVeHCX
 XhcRMMHir9/uUG7q0Fg==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YxbbLUsjo-Y3CeaMqTpriT_x88VEpcmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209a..8da494de4308 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

