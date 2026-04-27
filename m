Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B09339708
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309521; cv=none; b=C5ZnxsVZvHkliiyfKPP7kPS+sEDy+eyEyLC6gSABZH1ZiWwR1dYhYEG+Qu67EoAMCymz32IZ/Jn3/xi1wdrB94oDknB2FdM6Lw1dJDcVmogmN95k/lDMI8ZmViRrl5ghPI1ZQMa3Bpd8/cRl5GHDmjU0lTiOJa9oApbnqxRPP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309521; c=relaxed/simple;
	bh=u5YVTWzjeELE7WBZQot3YdmwzBvnnEI8SQswOvEcJA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B3L4G7H2Ph7fPXE6mNzb2QNlz1wycXHPedYQKvsZe/35NOpubwzFnp9xK8uAX9CRT9Tmbp0pfhvMm5v+ryN8SSxPlrH8qHOmy3RdgQK2FiMzk7BLxG/lae291Lc76CJ6TMBqts+/hCPqpU265EQ+/QGunPTi8/+8L8zFsIcpCVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkJpo/VE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV/Pi15h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkJpo/VE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV/Pi15h"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCpAHu2383024
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vmUmxy5hzED
	WCWvfis3daD8kXsR5TouT7mAOz9okgm8=; b=YkJpo/VECB48Q9/XD3+B4GJglrM
	HKQVnyCRadBfm3u45cmWSvCoAvqIzKPpJ6yCXD1O8/TnorlICiy1lEttF88jHFjN
	ysZZUycHif1/BrjMoZAr2Xmb580ErJF1FyTjkCmQ3M+EIMv8GAoOM0zZBNeX8ZfE
	MMme3BKlyurJtB229PlCOemKxoF//TwQ08o8HQQmgHj7fqGLlcayGrBR1mxPdNda
	uzbdKvwBbUXMSG207O2szcpdAXP4r39iavt2aaofk364CfJ3BuQk4Ac0G78Cnzma
	XbV8YND3vvNFVIQ3ESx1t1Tf8cqdMFNNXGUe0941rXRZ4dTprzaMFVuI8RQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xrys0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fb22422efso2359326a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309519; x=1777914319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmUmxy5hzEDWCWvfis3daD8kXsR5TouT7mAOz9okgm8=;
        b=aV/Pi15hqQU8sT2N++DVmwMuEgvK53mY2o3TLzdxNUNH6/0J0F4wAaHAdb9SUiLAgp
         rrKX7WWlGkNOoefwkOg+kw9aKjcnTgwgCvrvKJMOFVwMmsyAqbiLjcCUgG5FHYIzOTI0
         1/GfipwX2xx882MWo5WIWtwAJfvtLsio8g/PLoiV7YlinnkdQwQ0cnOMezeGDkU+9qJm
         0QKa2s8W1b2SPrqwHcj2yI96C3CvbmojJSxFHIjk5xbALT/JTgs5qOynXQ2rG8yASOob
         OTv8ZHe4hDJpZHJHZJtu5mdJ1Z2HC1g/UbcymPc2h3AIq2pff1P7xyoyVE3KXcjfoW7C
         u9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309519; x=1777914319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vmUmxy5hzEDWCWvfis3daD8kXsR5TouT7mAOz9okgm8=;
        b=s8+GQhAWtjUjmBuJweuveqgomzg0s/H4khuV7Kt6EteaN4Y+ebFkueBo1etKDkqIYW
         gA/wx4siAkWRCI9S5RbLQEabW/1wQlB87v07NovAp2IvLP+Te5RzCtxgDkubGrO10YQA
         o9LEG06LLFUnvnsdgMwQ2b2LSKQa58pZkFgqMsFRTqNUMUyUSt9djiZhRC6Yc39qYcDJ
         JwTF1uzqPOeid8jeF/8+fVhqiuhGz1b0+pku5M2NOxnbSXVO4SH9VFolxshs/E5Eoo/Y
         TK/dRiP921qTS0kqoW7P0sBmd7Kn72Zq+J/HJZHFJMdm0VIuvYYyKMl7+SqqSx+BIlpX
         2/Hw==
X-Forwarded-Encrypted: i=1; AFNElJ9v3WlX4NW9QQv06nCYpacO5lBEcFj0CYMpVS8Weum8wHj2YILHz5J8povLufoAOzmyAGPzy0qlvcgT@vger.kernel.org
X-Gm-Message-State: AOJu0YxAtqTO52BKBImns8JXygcUuhKtrX+jpVzuVJ3/Igx5FXLyE5+n
	B8bV8mi3NNeJ71enpPWTYCuFB/iZKpXFZkFyRc6KHAR1VVXwH5ECQBJGJbClIe/eNwqj++XY/QW
	M+o5/4ODJlb/KmJSVqQMOWNdxmRVMHlonaSiv8VNdLsVQW2SPDYEhgvUQKawD+DX8
X-Gm-Gg: AeBDiesecaaPaKLUjYYJdW//ZEEQ9xqiciADumHm7L+WNUwHf6EIE4qTjZE/Jgc5fyk
	RZjuaqyldBpuV5uPpYMc4S5vThMQieUkJfXRuTdKf//1jKyUUqlPBqOkri8Ssj4+JVgRNFQ/lti
	If6DSZvlQNGQ9RIXrf/GRfg+RiFDmcoD7Z+PrQpm6qlYFz3VVyScJCeW+Ek5oDiRWh2xJ1dNj4B
	1Sqq8YAhz+0XkulzebgmkBE3naonxX2qFN/M73Bi+ZNm8OXcjJEnJxN/KBJiStKLx+FqzjbLtMt
	vqYcEpmifiN0d3arevzwkPfzsAjmGttGRsxqeDDrThJJ2ftG2ayMTJDAiUtZOtswPqwM435EyEP
	mgbftT7zgs/bzzCMwSatfuij4oru30BmMS64GMX06C3xPNxL+8/GnoQubWTNdm3o=
X-Received: by 2002:a17:90b:51d1:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-364908c0298mr6466a91.0.1777309519183;
        Mon, 27 Apr 2026 10:05:19 -0700 (PDT)
X-Received: by 2002:a17:90b:51d1:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-364908c0298mr6439a91.0.1777309518726;
        Mon, 27 Apr 2026 10:05:18 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:18 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Add monaco-ac-evk support
Date: Mon, 27 Apr 2026 22:35:03 +0530
Message-Id: <20260427170505.1494703-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69ef974f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7Czdxb_1pZKpEXywf30A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Vpb4i4K-GyGtyT4iytCUMWiznkv_PsRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfX52Wv03bYeajV
 WLGtPeAmdZ6sze5Q5wwWjoMIrwxm5WuG1BHpLvK68b81O0wKVlR5Cqyutx4J6yHEdpqHBjprVFA
 d2eCWHM8Va5CNtGSKl0JjZVmovx1WqTKaPU02K3lOTyNX/w3NRgHf/AG9L1za92jbpB2ciOKNyx
 +cMePwZofY07oDL93JRChX9N/vHdFyTpGa6j0ukAfm3avE7vvqGKcJ5PxinXXAQa5jbtbTBjYY4
 jah7zrOvcCc360uV9hYqfFiRIQYI9QwszFtl3kRWuam1fyrq6GyoURBin8fhDlfLvljZAFjdNR9
 0iRNh+rIGYOvHgHrUPUf9B/7FzE/UguPgQ2G7WJFri58m1fU6/QhlaTwq53x4u1xg3q6JfDjX0N
 qzyKXyY8xZUYDNWyK+5ctTNHvBjbJJQ9eQXXkNRfKNoXIdtY2e4i0/d527qRdvFfY5ktSoikc4+
 y6JicHYpinnylBIAdnA==
X-Proofpoint-GUID: Vpb4i4K-GyGtyT4iytCUMWiznkv_PsRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270181

Introduce bindings for the monaco-ac-evk IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..7531ab3143a6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
       - items:
           - enum:
               - arduino,monza
+              - qcom,monaco-ac-evk
               - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
--
2.34.1

