Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298839;
	b=c4WtL1YfwV768ofGphN5rCkhV7zDUmO2GiIV+QWkkOLLRW6GojXtJDNgFcESC0FPlKdY
	 xlP1D8zIRgjuPd7nbBZgzwsKNsn+msCGifqQA3rAQSGm9fbri7ZmDWrmMZymaKjLcraYw
	 bQfiq18ZfOW9iX+0e4OBSOTAHbaFyykf+k6PzYDHo8XkjJ0VH7sAoQxdQhYirLHSgyu+a
	 kRdP1OHc34VHW0kKllUEdB+jYt7o167Q03wIj+ckKp6l/S3OhWrGmnHbD18KxyhrvorZX
	 qxgzJwg7q5rNWcPvoTkL1bLH1CTLp0q5VIYMcgjXItJIJlZyuz0sL9jrm7njru49sHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
	b=KX8/6oioSceoKGN+qTXFNlj1Y9GU599aODz50FigtIyqkg+q23o9PeFV0TzxiPZX0j7B
	 EMjjqblSpUZ8YFr3HQEGNuXOpiKjNzPPOw3S2v6Wu/hhqJ8qCCSayaIWoABPVidfW3wYl
	 VIcURbchLRDdStuGZ/9qauEMaiyRgo2CPQ8DuFe5N2vAee+HskNIW5pNIsvtZJmKeeGby
	 FKRysajuWKU1hdfJHSiPvqXfPKplRbd4GGLCUlbxJ34n/IiB5TB8D5T9UWHuOu9xSOqfc
	 XogsoT9rt91a26ZOoEqPc8WPOWLisut09/w2hpdjxLhGv4Cx6+smVc1cS0rcoAabsVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVhUESn8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DfiT581k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3697606A329
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3697606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVhUESn8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DfiT581k
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69THDgks182072
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=; b=TVhUESn8L5Jztaxo
	vwV0LtXBD+zuV2n1orKBY+J19QD5tCa0jLw9doM4m+nRa/ibYcegEFjunDOXqNw9
	oGz7vkzWS27DmRwzjbNDufVrmCQosUkddjY0khxvCBgyzbDSPPc9bVlK8LXWd1mg
	eTfFUKW4Oxk6huZQbG0p3zTnY0aYfHKOvERqqvmEJUZmE0s/XzfQKqXuLy5d2Dfg
	ZwmXLm3xTV77RXGYu0Qicyx/wYtlaG4ZrvLxGepHnX57e33r5sA8lDbKnQw88wPj
	ny4yB32Pm6LN+HBscvI4CtKuLMGQa/otAlN2kxqQcIqq8QFcWC7Rh6ipskD2G4us
	WCdZQw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0rf3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:33:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3138507eec.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298837; x=1793903637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
        b=DfiT581k8Q36ciNqEU6BCRdU8je3jm74FGalztV3Wx6d/AzzkOFWyCvRRYtQJXYd3N
         NMvLZn21k9py1DE0WAvWuBVA5v/8Fp8q71L5bCUrMzDRan/7KLCLaIUMKqrhsFxGYUum
         J6Jmye2dplBBD0gZB3Fqy6h4FRaat+wNOwbvBPlSJ3zOLPON8BvlLo21RwF2+Br9txNI
         YTbcpEHVEN80eA0+qZr5R0HkTHdMeJtSW7mqramwzCvjc0UGplXaz9ruXDMsMSLZp+Vk
         vene53ao5mqu5UtifSwhcYpOf8t34P3MAK9zYo+Jo6I/vDaeHUoIyw4EKrIq0sIXMMZg
         3njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298837; x=1793903637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
        b=XR+LNlg5JfJPF/WEm3j6qG/7BQQkWPmK3Aq6gMmjGD1RrKC8P0GYrDbuSPaf6o9j+7
         qRWmlHn+yP3TLpC+mVEsSPfLB5bB3A/wdNne6lV/R+C58aS1/WGA+LU2h26DLi9dmD0A
         FhcckLbR4x/fnTb74rHz2np4JVpVhlOEU8gELOPDjR89DyEHE0bJ+Wk4jziywGYn6MRB
         LiBqfVO5GS8Sr9tOLuLBMiSDy5cyVwZcPTOHCsdiLym54dgcNJR2IVb5FuIlzF7rMJy0
         ghs8Umzrgye+Bsavhtijzb9aTaOaZaC7hsTpDjeSne99xe+6xXBTlFsMhyT/29S6jbQJ
         FQFA==
X-Forwarded-Encrypted: i=1; AKwUvByIwlhUne/Y8WpzKZYBTYkzLPmfLdpCvQ6GjjLGuzfiZ0Tchq4eksNzmtMygw7d0vTtgR9uNyPrXYr+@vger.kernel.org
X-Gm-Message-State: AFq9FYLGu0Uyf2iZ690mPvCptAxuEF1NZWY9uS4LPsnxWvLyQXLIq+pg
	/cCNOKNaK7A8eOPCNAchtnbt1Vi5vi2ach8ssAmH6MoZ2zhv7KUp/i5j0U2byD3Fq65eQ1syAAE
	a6L7GZpPWRq0Eywse/+k9otz973wlQJgkGXV4OV0ym37XW94h7qNTzCFGRdkiPNNv
X-Gm-Gg: AYBFou0vDPIZC/vvP8ZjjOEFKTFHVFlMLSTFrRp1YaONU07bBAnS0sqkRYsSiBkHmPV
	QzYYlufADm3LqUoEluLCmhrW0jXXV2OyMtA4L3uLa9fXZgKpg8TJQFFYNhLJpaDY+kUgJPEGwU8
	mOjBJ+ochrviB5HV0nXE4wyIoQ8bvzoK31+MTU+T5htHa1hzTgz2y9uoz/7Crox4KnnBQMzXbRA
	egHMOtJORnSjafXHwHKu6IJCPhnM9V+TYGGPUSiingHOUYM61tqgoNElFjCRg8ts+s+X/OhP3DA
	M7CHUAbqpLvWLkrt8GpZfx+XJubY7OnwFFpK7rdJfLaPeDaixIgJK9l5zhqUT92tmQfhY0J3ECa
	x40tz5bCIrt5T4EVNWu9F62Q/yqotb9YlolSPzagMQZMd5aMi8o+j3AUg/Un49EEPLthBS7qAgV
	WGPAmwbYHvtgBLbEce94J+NrJxVp31XLWqghhUUmJ8uQ==
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr306336eec.18.1793298837256;
        Thu, 29 Oct 2026 11:33:57 -0700 (PDT)
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr306294eec.18.1793298836638;
        Thu, 29 Oct 2026 11:33:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:33:56 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:38 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: sdx75: Mark USB controller as DMA
 coherent
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=631;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=+OqbijMYtB+KJcNcCbpkz9lazAOGznYVUp++9xMNG2c=;
 b=9s0X3JikLumPl54K9hWE1koPi6+pdA8ibImxbvvhC53MzYP/a4TgARzycgn5PFqWVEndKy4ov
 RTIJYtgoBLoDCIQmONddfH35efLW1NjjvgGG993SPVYluLj30jSNKOD
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: yTkzNlm0iGmEglB5nL3qSiCMXNizcRLK
X-Proofpoint-GUID: yTkzNlm0iGmEglB5nL3qSiCMXNizcRLK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX+VP7Ccj55yEq
 ZjtgE7Ik/dVWO/pWsg9Tz/0aodGoO1swSD8wqPvSxWUBk8xhy/Lo1lcBHCV0Wa9oFGQTBbtHXua
 UYU1SKKj+6mS0YxVxRoO5NsvCk+FMoc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXz7/amQ3DZDW5
 +Wlh1jviZa0DhKUjICsYGtOKd1966CmKu8h8mo+42LqxQ2gY977uVstu9h898NYIqHI3gWUEa0R
 jkF/lCR6F+my86gTOA+b7hhRRikV7Nxyb6PxJjNdGNgeuRWL/L4y/NrauiGlO0HL8/VPRajjGCG
 aBCcYEeB0SuCMPNWmWr/UIUY26K5WRQBI99V4CYOC4DLKePIoZ7Giouod86qqal3wtqrOW8qNJZ
 G0t3MD8TQxlp3ivtU+VJd/OgL8JzuAHIjnxTYoYH858B5JcGVlxylIU4Jj9Y88IijLkLpJbtgL4
 E1aiIJka6s+mxwX6D8zyRovSXSGbfwItdY0rTHBPh78NdRrdkpb4hGHV28oqSUAv5FKziretbrE
 GySQOQZyfYDOKoJOCfOF/egv2mjpgfgAVgQbchyJa5uF+K90ZKnzP2KecDjKZZOWnegt+tiJBsf
 pBhL52WxpvxtnpnVHWQ==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae39196 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XGKAOdI6-ny3jh5XtK8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on SDX75 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index c66f7bd9bf9a..0ba8d45a3930 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1075,6 +1075,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					     "apps-usb";
 
 			usb-role-switch;
+			dma-coherent;
 
 			status = "disabled";
 

-- 
2.34.1

