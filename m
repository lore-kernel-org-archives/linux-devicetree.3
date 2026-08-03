Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6442BE87
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780039; cv=none; b=tKffbHHdVqf7tm3vWj6XyBhRoD8RG0mjS3mGWqQeLGSX7ns4OnfRyAAQhkeWWLPR1ZjtA/8t7qScmB6eDeZmiRnnAy0a5ce8lShQVnwUW6UlvQCAtVM8o+a5nXsJx895XShsBl2oKRc0x78jUlLl/hGkCNN6JdPqF+baDdVH/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780039; c=relaxed/simple;
	bh=DxSW/8GnFm4yrosXHGRVaMQHICkgBFn3VW4smphVQ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8cTWos1DT2dXufGZoiAqSZr5lKHxJB/8sIb892+KOjxoYJ/01FRuSUUXzsT8XTs8dt2EkseMa2fX42r/a52qy1+gZqtLUOlehN2d7WXRhbF3C9fuXjMGnGxEHw52I0Vp34Ae9eR+5hbaWWCbnTUs3tevbErV9MBXvyigKT94RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzMntt3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/4+nikD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzMntt3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/4+nikD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gw7MT1529622
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 18:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PHR2Da+AcfS
	4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=; b=SzMntt3NljmyFHiL1Ww76Bn+Rwc
	4Akcl2/pJuUGI4pkHTHeq5XdYJHTbGakX5gi1SrDARpuGaI6AeOSp/+BuvoY65wU
	ex1FI2ACtecyoZZ5/GMHJm/8qXW1NIdtidHLqTDDeMOmRv4oUTukWpYjgy71v117
	t3lSZRM0bsXtjcXqV3e04QwjSXsvOLLT5e6EnV17IpBRGuGIutenGdqbghiC9Hy+
	VGob9nhzZuURrXZYZT/Q0Ve4onUYVxP2IeSHjSrPDgHRc9jrUot13IIxKtSE340Y
	7X2v9tlNUMGExyFf1EHtNQ6Y3JLq8m5Rxi3fo4fhQGnjz26rjURJzyW6f2w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrbaxf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 18:00:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4695718a12.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780035; x=1786384835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHR2Da+AcfS4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=;
        b=G/4+nikDgB1G9dHO1x8kcO9AJLIov6ULVk7sNlnV2cLKeTZEUkn4V8SmW9+iSxVM9W
         2kDb9qV5JQsVRJY55vtoyYFhGL/FmwwrAhfpHUxWl5PL+eyYFQV+hj+lY55d6vN3fXEH
         wUE5RhZWO5DMdx35Nh5qmwpJIbSn2o1qjcJEv9WLnQncrQGkYtBVUYoH6mUJgTz05Oe6
         xkK3gguhkP6fDez8jiyD5GHquI6oNmO9C1kdpR35sJ82aChDMnQS50mfAxaOXSyw67iw
         l2b07WAO/1KU8d086XbhvubdsVxH6fVATBPXNjHfExj4FL8O7KJYiC641TtIh4K+DMA8
         FhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780035; x=1786384835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHR2Da+AcfS4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=;
        b=run8BzympOSnz0+MwsRS41j2jW/Um276EaV0ecex5SVGfQWvk0KoLzUgxHQpeoWswf
         l0E1v1MP3UqI8ypIIzxxlWFbyH7gHm2P/yyBEVKDYzZozeBzbN6nl3WTNIDPuPiJz2mJ
         YESrYJo57NaE7MwWtiYygAbashQHaEWQ9GwE/ynAUvyAbtK/7LTjufwYQ9KS1AtBEPEi
         x1hU3GUW1Jko5tM9f2boCFqIbAh5MuxWvMgAh1GWUNIRvDIVG8g91WFLZD6lyC6Kxe4L
         yM8c9+0a2jDDIkdfZd0XluStR9jlFKLjP6mceDw2/5y1ixU0oijr98LiZB6d1AnH6JF+
         Ujlg==
X-Forwarded-Encrypted: i=1; AHgh+RpdoJmZuvp6m+xRm85y507wsUU0Z3JQ9jfV45kcHeqIRuzEJusZEgVgDj77qZ0ag+ff3opITs6yYgx8@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmTfZ9kynVS8lZD8J1BGCqdbIgh3ZwBU0Hzd+BJyAkv0KqlkG
	yBGAHq3SkQ0UBQNvtPhazJuvfsddF9p9ldw9qJRijohPBaRFXtAIT59lA4RzXdaK/ZSj9frm456
	xLYbibm/qUwEIfc+kdeWSHH0I5qBBnKGYr/G51kN/fhPxItvSM6WSgzYUdWhUfjoWZXs0GpU7
X-Gm-Gg: AR+sD12+eKjIkj/9weicXujDmKPXDwGCb1QjzDOEKo3hkIWHjvBQOgOnRAej5G2llU/
	RYFj+dtkGwISFsnAZ/IqyOnFOfm+vRXXakAZ6rbVb7JKkZ+YuTqfuYkVWjDbLhi3k8O9b8RSfMx
	fAzPb4K2v5EUE2kfColSZSRc2xnx10wBFCc3lGe8Zvk8rw6FgjHz/ZxeDsa1bHUj+eKbbeAAn/G
	QLHXYDu0xzSLaeEn1xvqxqQ0QuwS8vW0ifm1UWEGjO8UXHUdDr54diOGiJInW7TXlh5/BQabYWE
	mBeMyF7o4aFItaOMock2beRGIo+YxF6mz09HC83rSAuVNpge55TYMTOiv02Yk6fmUaZ88h07lm7
	E8ZKV6BCpOxQ2PReT/RpXsbtKNtQ=
X-Received: by 2002:a05:6a20:160e:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c92a9098a2mr11382248637.70.1785780034483;
        Mon, 03 Aug 2026 11:00:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:160e:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c92a9098a2mr11382192637.70.1785780033937;
        Mon, 03 Aug 2026 11:00:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebb9bbsm3920533a12.32.2026.08.03.11.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:00:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible
Date: Mon,  3 Aug 2026 23:30:21 +0530
Message-ID: <20260803180021.20368-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX/qkicRrVAufl
 JR+PWGh4E15O2458+EyAcTFDzJLARJbBpSVUf4gIYxsG6x5t+gyD0UgG2bJm93/HCdgPVZdzMSb
 5Is2OVimmF0JKdzbPVdKvSTH+oqxdro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX1fNXq3XBMsP1
 YL9ffvuTYVGE92Q/ZRB/s8+wkVtHZsBCwlmOMdJMJQ2vghDl1hieqW5vEViw1MWhYjbG7M5M907
 ZvVD6mv5ERY7DAYKNX/mgsfR7rD8kRllkJfqjzuAe1MWbPyuMge8nnmac7RTdhnZMkcxvC9CLff
 WFppBFCWxB/YpSeAgp42JCjNSdznvG3fkcZpf31lg/14btpoGsGo4rz9MuWuK8x+LICXsYUksiP
 SPQDWp4cX4Q4sPXnkwQ+/zWdaChx9QdRBNcG9tXTQ74ozA8SUzecnlk5jRE6JxuPI4GjzmhU2+a
 tq94YLJrIPgv3nLxdQx4S/56TdTAOF0ZsCmxrAWXvwwzmpA9VkyAt9ejG6zfy78T7ovk3htAali
 nP82NwLDr2ti6CC096Uvkcormu0htg/kGWYENLiD5pgFTZrVK0LsShpfCLZCf99Bn4eF8C833Ci
 LpJFgqhrgJZfYWyJCUg==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a70d743 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8cKaNl-6jJHcjB3htl4A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: L3BrouQ4-PtFG-q4aSaN0defOhjSek1v
X-Proofpoint-ORIG-GUID: L3BrouQ4-PtFG-q4aSaN0defOhjSek1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030160

Following the dt-bindings change that expresses the SDX75 MPSS PAS as
a SM8650 MPSS fallback, list the SM8650 compatible alongside the
SDX75 one so the node validates against the updated schema.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..dc9c4ed00d4b 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -925,7 +925,8 @@ tcsr: syscon@1fc0000 {
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {
-			compatible = "qcom,sdx75-mpss-pas";
+			compatible = "qcom,sdx75-mpss-pas",
+				     "qcom,sm8650-mpss-pas";
 			reg = <0 0x04080000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
-- 
2.53.0

