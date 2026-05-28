Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6CF3E7BBC
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969831; cv=none; b=tuqEKhF59cmoFd4Qt/oZeNrx9oS7bAg8CLOc1zWbib7ILkNPM+KcI7zHnqNHdAyTdAc+8XFUMN5q0JCTUN5eEn43hqjUxsrBx81C7+40BpM64lDnrZFOnELK0lmOchJ3/booRw+qD3TuVOKSvi8XLPmENkzD9BOnhlmxbBo8APY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969831; c=relaxed/simple;
	bh=nAgVt2xAEFZtuaOqq6jd0Vh4fnWJrxaemGuTxFmU6ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZY/GNu7aMG23g3EqtF6pQD9US9ODbdOWGK5mXdAr1AVsGePN2NJgCivx8tSydj6CY97n8xUarAOBWXYlgwFTjA8vJSMUuDuLlh1BjTlx6lVEJ8J072Bn8mOjdEYifsxL0D5oMi4y7s4uzUz1+GzTvHwPIIpiKh66os1Z+x0odfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha1nwsho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGL3Voj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha1nwsho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGL3Voj1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vaqp1697210
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XaK795TVjQqRmTeodIBGH0/Bly0QvKKdGJs
	tndQh7ng=; b=ha1nwshoiMOUFo410w4CcJnsV2rgS7p5srfwV7A6E4XRlxMPoGM
	9/2ZzVjIf37scsQvm6JWwaKEmCZ9hDbvYrhSc2vjry9QExG1Pi5BDVzhUzX79wFv
	W+7UppF3Y2+e7sujj+MmwhO48mxrHwy3r7+hh1IlzIXEaMYngAtGQw0G+XvN1nfS
	VVtCoZBMhMSOQBP5tPJJ6oM9jLnF2WiEmYqTvpxcdi86ZK5P8Terr+RtvujiAIcb
	QNwjx3ThqtJqW8QPutW4IMjjkN2jwODGU2HRqy4MCB+0FdVoSuDmW3Z+mexH8Lci
	gWOMDkPq0RVxsAAMNV7D1LPMWIev9E7lfhg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajncv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:03:49 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dccbd50e3fso29888102a34.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779969829; x=1780574629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XaK795TVjQqRmTeodIBGH0/Bly0QvKKdGJstndQh7ng=;
        b=kGL3Voj1fy09aWNuvnnIJFjSOt9VVA03xa+48Z+e3h86x/cMhDJVpDslqwDvfR2UsY
         AoGDT94T8bxi9Goxv4Adf9g1v8RXRBQQaJxl+Df7AfzuYJk0ulchNjcVHPs9ueDV/sy8
         snsmb3U7xIBOMPIE40seZ48ASNOgp8Ywq5ggIs2KVsgpNDeLluBhjRRXe7vavt7NNs1e
         knYjGGni7JApwoTjMVlqqwDuwwewcobFf+mcYoN8ApqNpKoDF+//IUghlbu621Fk70u2
         6jkkjLQY11Y//Va6HwKnrEO4ZDvjzihbsc4G8ohe5EIXxJcVovhtEpSSuBGwJPe5splD
         qiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969829; x=1780574629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaK795TVjQqRmTeodIBGH0/Bly0QvKKdGJstndQh7ng=;
        b=dD487+kzYGlfQLjD2UnvnE4IU2aRjHbqbxqvCe8pCWpkiQKzQmKeUEOxuCSr62YxQE
         n9y7y5bCeNzziHG9ufl6BzqqkGr4EWaZDkE7FyEjY8oorHA6k8f3OPj+V9v+SsNfUH+G
         KYoXcYyBOE/fxB4XI6SAZtdpwM4LOJmcDMjS20PaKzsI0uYM2Z5OMX6gzme1w3zKs5Bf
         3iaN5QBG0iMJVaGUqctKrqmdTLuOFLqkLZOvl2kEYH+IZIAVSCEHcVt6rq9ir65+ARWB
         SwFjLklfGxz6PSP1s8GqzddIl8EOHjoT5AmDJ3a98+ag+YbA7sNIdtlgVhj/jG+ch80B
         GVvA==
X-Forwarded-Encrypted: i=1; AFNElJ9q9rJZ6qJmDLcJqZouSQYZFo55sKHWThFgogmq978qcBINy9yL3TyzzpWP2maRFnFJQvvCHY27JFSt@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCqtxjlN90OiyN858w7gRW4qEGaP2cHwfwxKO4+jOgPeoj4hH
	xyc0DFP+Af8W52Z+GDfFxRZnFAFcbwGn6pQ4FJQ/kvVSb8P+YnsEW0lTOrZGNSl0fV28TaiQ8wD
	vKDk8mb0Ri6v3bKOMjL1sQrObxyQ2YsmdQPiy9j5Tz1Zdy986oLBuOj2MZ9unNvHg
X-Gm-Gg: Acq92OHAbpGhtUfEqdvDHHsRr2d8prJwTrwOayGgBixZVRlJv+kYQCldsyi/Cq4+JnZ
	Rz5VYOq355MgZ/cfmkXlg6jmTQKd3lrbjPAfhanvEaXPFkwllH6wVWAvCaDEA6BgpbsS0Oy2UgD
	SLl7cRtxNH3ezWXwyY6XZThAiAcfpQ33XraQTqwODZKvGVg+262u3I+5MI4WXAjHxI8HiLAw5KW
	uicWDH58qRzLTSLIehL4U55tN8oym1XLKjJSFqhpMyS0psvnFD9nM8YlPG5DzZsydJER/aaY5CY
	UXn4dQG4RZdcbNScac7/tm5J8z0a1IGZLRMCoshZ9MHcPEh9+BqVLpfui42/31VJbfJjNrjAVvL
	0xE3VmEHDUJXDEp2XwbErAFXHhoY4ZYRGebYR0BuwArEf3w==
X-Received: by 2002:a05:6830:4985:b0:7d7:fb8c:3c29 with SMTP id 46e09a7af769-7e5feeb63a7mr17670331a34.14.1779969828872;
        Thu, 28 May 2026 05:03:48 -0700 (PDT)
X-Received: by 2002:a05:6830:4985:b0:7d7:fb8c:3c29 with SMTP id 46e09a7af769-7e5feeb63a7mr17670303a34.14.1779969828441;
        Thu, 28 May 2026 05:03:48 -0700 (PDT)
Received: from quoll ([83.144.38.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm6467826f8f.16.2026.05.28.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:03:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: talos: Fix GMU unit address
Date: Thu, 28 May 2026 14:03:43 +0200
Message-ID: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QHq9e7oEOQHOEFbO3Sl0eCc7lCWDe44P
X-Proofpoint-GUID: QHq9e7oEOQHOEFbO3Sl0eCc7lCWDe44P
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a182f25 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=gYaODGAG9naNOzoQWaDNdQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rz0GGPVgkkwhC3TLr2YA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyMiBTYWx0ZWRfX7lQ7Nxrz9TPN
 cUGHH86r2+V+4WrgX01Rg2JfoiXJYNzaCbLTfnIPQrV0Z3KX86ciqZJ9M14dZenLXaEMZNBt9DP
 061vejA/JYSLDg2Mm42nqIBBQgb86PoE1XWdyj+Ii9cMNwI5K2q+b91P7p35SxrRWWYAZ1tMdUA
 y2EbXzntF0RyLiHh2VFMh2AhzcndVKQ4fgFtEuk0N4TCYLAyxy56muwEEbFPdDdXoV+/481Ci+7
 dDv3WBx+47TPFYnKdQPO8UWZiXN7vIgfKO76yGUe3NytUTI87CpVUf0Ucaa3R6YSXmmi93ZIj4O
 YA2n2ocATphNsyCg53/IHnJSnhfp+2Zwj5qy9gt9mRnxYo8u/7ekJwk2KA3N9wZiyqc4/M5ImAr
 eiBy1I0jjuOzcvEWz5ubqcClLnk3XYCcx6t6ciq5Jkzru9ozi9QdKoK3kpPejVeGu497bPj/5pA
 4hHV+9qu5X7dEcmqh3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280122

Correct unit address of GMU node to match 'reg' property and fix dtc W=1
warnings like:

  talos.dtsi:2020.20-2055.5: Warning (simple_bus_reg): /soc@0/gmu@506a000: simple-bus unit address format error, expected "506d000"

Fixes: 8de397a5618a ("arm64: dts: qcom: talos: Add gpu and rgmu nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..70df5db19e9a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2017,7 +2017,7 @@ opp-435000000 {
 			};
 		};
 
-		gmu: gmu@506a000 {
+		gmu: gmu@506d000 {
 			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
 			reg = <0x0 0x0506d000 0x0 0x2c000>;
 
-- 
2.53.0

