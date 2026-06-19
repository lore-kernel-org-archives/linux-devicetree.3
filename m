Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE4330B30
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781901582; cv=none; b=knDVVFFgT/9nAjW2Hcnu5EdHwG62Gt6zpPVx1dk6H4hUdzSGYW+jf6lCexafu8MJ7UbRdChibDwApSOH3hkhlQY8k8sHjfM+elLDVk0aycRi7M4jNiOkfeg7r9i9t7Vq2LeuuQ/xQa9ExyQhZKdutoTNXjdeC4rmy7wf+1Fpv8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781901582; c=relaxed/simple;
	bh=IdPiTr+89NTOkDsqWrjX1ex8thLpD0pPowUiZVQhR5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZyI/o+8F24C3Rd5/P9NG/QIaGr+l+mh/mPCTZ/HVvvldtcoOPUPy/bqjcs9uBDAdMMx+R8NDcZVpu5ZMnMnQ7XdDMFoHgKzpn4pzIeB6qDH/B9W558DprFQZ1Bi0zIbBQ9iQMakKKYjDylCxqqevZiI/uk/g3dMXAmCmlA2Czc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFPJxlk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4GY9UUy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFPJxlk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4GY9UUy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHTDrM2418717
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 20:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6mHh6th2THC39sSiP8zXRHuvf85QL4Oc15TqVlsTEg=; b=XFPJxlk4sJA9oupG
	RcCM6FZueJyW/2xrOlYUtjQeX32x0nLXXAYcVQkn9W2PfiXKGIswaFKmWKRVSAGi
	FjqXYtF2/RpKtanqALxhGA3aUDIdDHrShs17In6bX6ahZRP193nQwG1VRDGW921+
	6lGAatdm5fphkC+PC0+P7CtfMzA7xXHoQyEMm104XoBmDtFL4+UmLnezxwlDOpXP
	VH6TtWqclMvG7U+sL5BXblagTh1cqNFZLNUaZDlNhthBHJSbLUu7aSVhWE8VD2Uy
	fue/yT+GYCNR0eWmq5Y3FA/IB5Yn/ukCBlhUp6d1jXOCTag8qIk4UbFzpEOQE9ra
	f9fMig==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5qs9q6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 20:39:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8453cbd38c6so2004199b3a.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781901579; x=1782506379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6mHh6th2THC39sSiP8zXRHuvf85QL4Oc15TqVlsTEg=;
        b=i4GY9UUyoumqdz4okU+2IMbeUpHQnq+tHiSya7cxMXOPk3M0UiyaxH9qdWgR2VsLtE
         edQikUMADNM7d3uH5LH5A9Dp1sVmgVIQs7l00HjoAJX1yUtVoJiIaLr87ZBmwcqyi4LE
         P3GDT1kHe/2VOWPqOPiHU1Bo83YEtXnIgadZTjYNf2Pfz4AXOqlTQ86Tdpz9cIw+5D68
         3sahAz1MfigZcGqt4SGxGogo+vW9XPER14FkhlmPKdUQQRB63eqd0NKT91W/UpfHxI3B
         Tk2M9pjTIb9z/e8gygNdZJT7FGnIWdTgvUETdXIa72jvnx0HbB4wjffWwBOo4GYAhn4K
         7aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781901579; x=1782506379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6mHh6th2THC39sSiP8zXRHuvf85QL4Oc15TqVlsTEg=;
        b=jxM7T/x2bFpoe22w0qYlOhbYLdqB/FC0r6JSrrk8IuNnAejt72MC/MJuZm2MhamBMd
         EeJPKQTh9xUi+ncgEhTSP4XvILddSEI61O2/NbUhuAhnSh+XpDQ+0+C1Wa+jDjFVUUMJ
         QVHaHAEg0FQKMnTOPsAZ+j6wD8pGC4D0XFSgCD1f+yoRnURzgJHaMyBcd+MqqX7uE3Ma
         38trqret66tPH3FXz13WcY50Z4Fe1QpQA0JtFlPr6QrYHq0DZrFwVrjmyncknv22jhQ7
         IcTDZK6fI1pgU55syKutP7cLJov9VV3ImcD8OFDdmpVHM6hRQ8N8R2fZkCqkRJeplrwO
         6o9w==
X-Forwarded-Encrypted: i=1; AFNElJ+IfPYGRnkI21Fj0S+D/JIQ6l83YDihky5sFn+6fVvOKaUGvqd04XLnaFyiK0rAwGDy79WdwVPnSH4w@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5nFWM+6q9jiRwEfVkiaCUtydB4oQ9iHMfr1TBv1/eIBxJ7MLu
	DbvLZY+CWZQpmNV+kDJrVfSH/ewdoJtcjk9uRHPd51pyZXbKmghkyznUqs2RusMEVf8JMO3XEI9
	32Apkl8EywEbgW2MatMihzElHmvzMujoH74uYxf+6NLZ+J22Ctumhi1o9MdUKyphJ
X-Gm-Gg: AfdE7clD5dk/2xmWNn51NGR+UAtUyeUrJZsIDPBnCM0gEE8KICLN3UBtYf9BbUB0qnH
	KTNIzStI39ZNi3Ssq4NKSwfUL7wsVOeMcPBzdWYxcL8VFqi7pL/WddYa3m+8HcTXEf9QtUEi3xm
	1XDIJNYo2XErHJ5V2GPf7rZOoSKIKBpOFGfux1S3IXEfyjuAWOtYlvJP5u42ig0f86d56LkOrEH
	HY6OQ0zKS6z7B6rEIF3wrQntndoBxzJ7nSgRssrd4w74ooDsIrtuCRNFYelCL7IbqfB25I8m4Wu
	H7vbow3Hbd/LLHMy+nd2Qb4b011XtJzO8snoos4VzQPwFSbKJfb+P1Wq70lkxqs/XHs+bIoAVh/
	9+wKfWE8hHHJe1/JGyX0+xpyK0VERfxj6jECaCb2GzNbkhQ==
X-Received: by 2002:a05:6a00:1994:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-845508bb9ebmr5453501b3a.32.1781901579407;
        Fri, 19 Jun 2026 13:39:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1994:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-845508bb9ebmr5453467b3a.32.1781901578740;
        Fri, 19 Jun 2026 13:39:38 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm94190b3a.53.2026.06.19.13.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 13:39:38 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 02:09:10 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: glymur: Enable SPEL powercap
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-qcom_spel_driver_upstream-v2-3-a3ee6837c18f@oss.qualcomm.com>
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781901560; l=1091;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdPiTr+89NTOkDsqWrjX1ex8thLpD0pPowUiZVQhR5A=;
 b=a2bYFX9QFXmQuG66UEE4ITsGt5ed+HmoW0IWJj74zrTxkNoU9kGJLeQw3wsZuLdKvP3hP65MT
 7uCQ512DOqxBlAyCwHfh7lyRTx1Oc26Tsmis/sl1EK4aeBJRqVMeny0
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfXzmpw6wQlwMcC
 O3CyuvGVAje3rYX1PjBj3NXXjaVZL8opZClyr9BhTAG26EQVw9wqmh0BGQP4epQz50FsxYsbzeX
 NIytPsjZNOFIjBcM6MuZLp9PyOQ/KTMi6OePyHtBWOh77+lj38wal5vU5tkJK3lDbOGUzbrzTol
 ed6krike9joQgDLIBJnUKBcxvZ37JFcOpB9GZERw7ZGnCWZY29J4CfI+XBPgLXTza7QeCs5Lvti
 DdABa+uVZB+LZXH91OXRtZ2a5BVCurtwlU+BOqByTT5RBvNJMHrfUV7Fq29HrGtIBImPr2VQeWQ
 RePCgjYPP74LeVdXDdRmsnqvw1BPjmAlfe8y0EEPoUvyGOP6bPftWMqK+8DOjX/50R5vUXz8XgS
 gti+fjxD7Z6/93G33iVgFTNQv3wc4g4c0wnN+Y/elD3iqgm1VFYbCSuZFZQr4HFcrSCdek7GoYr
 RyAipLlq15puW6yFRrw==
X-Authority-Analysis: v=2.4 cv=M9R97Sws c=1 sm=1 tr=0 ts=6a35a90c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=O8dm-XbEgrUGq90DOXoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jK1nnC6BVJp-MN70u_B2Rh5sT0YiEra5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX/+bIZsISc2q+
 bBCTxpoynVD79LQrFtvVF6BuHekucvXOm8dwc3zvfPgOXoeBpvc6o45iMfWTXXuJpCsg5G5hl2V
 rdYiz1nIGJeG9Ei9OFDEXmGE206CXLk=
X-Proofpoint-GUID: jK1nnC6BVJp-MN70u_B2Rh5sT0YiEra5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190198

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems for glymur.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 72c7dc6e4f09..9cf9180e4f8f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5033,6 +5033,16 @@ spmi_bus2: spmi@c48000 {
 			};
 		};
 
+		power-limits@ef3b000 {
+			compatible = "qcom,glymur-spel";
+			reg = <0x0 0x0ef3b000 0x0 0x1000>,
+			      <0x0 0x0ef3d000 0x0 0x1000>,
+			      <0x0 0x0ef3e000 0x0 0x1000>;
+			reg-names = "config",
+				    "constraints",
+				    "nodes";
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,glymur-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xf00000>;

-- 
2.43.0

