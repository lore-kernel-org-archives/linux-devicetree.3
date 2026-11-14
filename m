Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663225;
	b=BfuKoUZG8DJMrG9iQsaVgrBCsrF81O/i9KWABE3pvPniecF7BozvqPiGKGnDe7mPlBfl
	 FlJ96pVuWVVn+N9I5bIna3T2zdctDRC7DK2Dm7iq5WTFqjs7x6wdKQe/eGMBx1G+P0HlJ
	 +qW5VFE590Y8z0zqTH6EyGGl+eoujVtstmugBklQ74oRsDBFxgdqfsGFCcjS/7OboNhnP
	 bNEPnAo0ri4KelSkz1V7VRrdtmSMp/o5w0c/0toecWgb7T9HEPG6SVVK6+MYP0K/PoU3g
	 vdpgE5q1bw4gT837F3anM32V7fci0SBeXAyBy657Na2B1/6C7J8Un/9A5UgpagLyi/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663225;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
	b=rJNI/Y3NXJZ1HoHp/gs3qsO3iyRBE3tRg1Clifp8ACg9/VZKGUoxHGKrVQvwTqlvSTub
	 Ifld/yX/s4HvIg+FP53C4W/ut+/bUouNcD/+aumVVzJlw7bwwy4CNN4z4t3jjZ55YGvTq
	 xix8zQlAKJJ/ObW1CPEn9xQAVyJTT70y1jj/Z1pg6dC0jPgHyUWPocteYId/m/thLSlGf
	 bRMJ0ByUg2ePI5TLUw57F8BX+9CyceGudgE5Z7sCI6kjjLCJaYKMDCibIhzTiFz4REfzf
	 BzC/Vqt0l+Z7AA0ENWuonn1yQh7RdCLnemAnI4Pl4CTGl//y5TkqciCrHweSSyutT+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exD5LrBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BQO/0gRu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F0A606A339
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F0A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exD5LrBP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQO/0gRu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wX9i174146
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nRY4XoPC/fT
	Tj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=; b=exD5LrBPfQi0qNdb6I4BRaNhOp3
	OpCMep8qiXqjl7rBA6UErjuJFw0Fle/b7QDuf9mxMSoNRBoZxdoArsR8syOqcDon
	bB4POUxsS6wZ8hZiDa/5dLPeSQRol5JzujwKu1gvXTtWfbxyBx9+GojCSg7NnkWx
	YJZ4zCjWqNExQhY2X57MSPrsXsaJ3i+BLqX44QiMk6US+Y/QKHQjbVcJGqtqfrtc
	DXZZ2rW0hXxNdaK0dWTbW76sTkDk35F2vyCdGC/fkGcv6pJiwrsOxe3f06OeDb7N
	pkMLURkkqgYBxXy1PbqNzUYjVnOvnS5nWp8s9cYXgg5BOY4hvONiz2+YVTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmagtmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso30822995ad.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663222; x=1795268022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
        b=BQO/0gRucqhW4IomlG+Oz1sq1pXGDi1v2mrbLE+b0tji35SHvhAq8BbCGYBns5/N7e
         Qdic2RS0XejEdLXGQjcrDJ2lh2ujKvniS0GqiM6o0ZpZwmuqqVxJLMRC3KBeNeqK3pAS
         aEGJqz2eX6fRIKHQKeaH1TBmLbNVh95NOmZ4MZjgvXzFh/wzL0biMn0XAIyS4pEMPtJJ
         sxUx+OcKOo1f/Lf68qKZMhfaNwzFlkFBf+rqV/Ikr3BlJLSAVnO7KPZe/xu87deDHroz
         qZRnNQ/kSPZe8mALARpFjdm5uzS/duLLmkdutMcW2tUKIntTkB+UJhIrRKz0lAAKxmXY
         l9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663222; x=1795268022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
        b=w5ylN1t0uxFH0xc1S3LdCqlsxVUsnLqwVeQrB+XZU6u6gFboiLFRcfLlfvQyRtL355
         4SLiHdJebEcaIBhXtzNzjyPAIfsQdHSkLdvor4K1pbo0kttE0NTC+HSiGWZbUww15qPu
         MKwXBnmF4Q24U6BMrIXl2iVXe0rJ+yOCuo9bxI0nm84vxfYEf45503svS4VdM5rdOxxf
         fUBnBXjfXBo3obxzCb1nY065Gr5+VQr/NbM/m8ipA+1BcfozDw0kNjjWkTziIiu34m4Q
         DZNh8dzZJnFTPykcYnmn1b1zuKsqCDlTCS1HnfF/P22dRnv1/1xzH3Nu5gRNScZbEgMk
         OqQA==
X-Forwarded-Encrypted: i=1; AL+hErGGJdKO/qzvFT3V6iZm32A9XeG5BwryDpX8NrsREAB6lMFRAPuRW6X2yrKleArqGubEV7UtTBYpgqyY@vger.kernel.org
X-Gm-Message-State: APuU4Z9jl8VsL8B5bvERX5AnSbS41FEC9YlnQijjwgREqyZggwTn/Xdl
	3UNlSGeZ6+72CUAG8+vBarfp183BTsg6wBeKm7NksubIqc7fwzEMX6S4QWmmPS54fUry0OX3D2Y
	I9ExIV73v7VuyVGCBdNneSKy/xUwP3oVEpYoSXBA3luhwMSTDdd4NmJqs+MAGPpjU
X-Gm-Gg: AYBFou2kL+AJnEK4GKIbgchPCotRamyM7VcCLcP+kbCHdun7YoT1q2hbuNx3BPUaCcn
	RhCWOvTEcHxiS2Z5ezhnR9eIlSCKunMk+DrAEeGvc9cmAXOe0DCQ4EbtxTSsGAM6cRf/Y/ZmRHk
	oXc/LpW+hSSK6BTVrLbtnXVnmz2huw/RTehYAz0Cz8izqk5k0dy4l8YatraFWSgqgvkj4T1+3An
	08Y9KHLTBPSQgCRn+edIFAQr5xHxZkKWFjDK8vRay6YkbZbChMwGCAsIEc53D/y/vKXm+46G/4J
	5aV7x5x+IrI8PCukyCX3aPanT/EQn3LUT305C9dVaM0WTL/1hboIUD7D48UQEKsKI0yhDBSc0BM
	/VYofVZBZATew/1JTkcyJXT93cr940hB0r/wjt0gIEXQEnXyTUehxxcUg3T0wGR2CmJnCbAQGp+
	0HRMbYpLFkvXxXMWSRjwLtxyJ9t4HO76ybwphD
X-Received: by 2002:a17:902:d58a:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2ee0d9f2605mr51752935ad.1.1794663222368;
        Sat, 14 Nov 2026 05:33:42 -0800 (PST)
X-Received: by 2002:a17:902:d58a:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2ee0d9f2605mr51752655ad.1.1794663221893;
        Sat, 14 Nov 2026 05:33:41 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:41 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add SoC ID for IQ10800MD
Date: Sat, 14 Nov 2026 21:33:03 +0800
Message-ID: <20261114133304.989635-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W-H_yWVE9ptg828QQDJcU3p02_TUrgOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX8Bv9BHotNf2R
 4yeOcv+b1qXnt2JWcJm7cwB4IFaBTKn4aXEyIQMogPIsbXdah8f4yRYkZbsuG+dHHBDW9zUZSYE
 /w5sVsF34bccuNVyNS/28vgPYk0Hqei1mHdru3Laa8gnZ4CGxXDtWX005HjAcZ5p7HzeBDzbxwc
 5xghxYBVh0AplXO4Xdcbe/8yCglX1FHn23Q8DPm7VSNsnbT5vsJKXiAono78kE+ehVRJdTW8IG1
 T6KsNyWj1gwN7ymGLPieW4R9KE2+IdlFc3bXxelyrfLIvTaVDCsaK3Ak9CNuubuFcsMLHehOy4v
 wO2lrZyV85E+vQt+b1hmR0r649lbgzkylGCOjSqJo+cFzODiS3UvLJXZM7iDkR4Nu3NM8xhA5Go
 A54Slp5w0ERUsN6+mIGQRRWMdVh8NOc/I+61qfm7xi1f3EvD1ynVuFU5/KAluOpZGWsfSaQHAhn
 3WNzMMfH5r/k8HIXwaQ==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af86337 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BXiulqRx7wyGqYsMR6YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: W-H_yWVE9ptg828QQDJcU3p02_TUrgOX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX7zQRIp5uuDen
 htyA0unGHpyqSnUkmEdshClizy3xjc3WloN648gRpb340iLk5FW3FB6elL//CPUrQXZ0js9mF0g
 lzQbQ5SAq7b0zC3hPlS90fBtkDyUexE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

IQ10800MD is the Dragonwing Robotics SKU of the Qualcomm Nord (NordAU)
SoC, which is used on the IQ10 RRD board.

Add SoC ID for IQ10800MD.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 5e84c5a7666a..5b8f1c817698 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -320,6 +320,7 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_IQ10800MD		798
 #define QCOM_ID_QCF3211			801
 #define QCOM_ID_IPQ5211			802
 
-- 
2.43.0

