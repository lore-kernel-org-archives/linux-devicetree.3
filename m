Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B1F468C35
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778289; cv=none; b=QzoiHuoX3HtU0DyvG/nxQC4b0SmIYeC/OrJ9mdBRNiPFLbGCA4O+1giJXH19A/4fbCelHCixyg7s3FvdpCj2vA7P+0vNvlZ6CqvhoaJiWiplyWaqY10T5NJiViQgNBv8VCGAPPCD+/xjO1u28qvnLUin2AYvjxiIPqnPvTDS9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778289; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2h2M6qC5fWBWrUJoyBX8skd7Cgv+Gd27bnJ1wiYPWV1pFKJA/cNtnqcsPtEqyodrQsgwZ8k3F4Ud8ukwPQs/mij2tM9DWtmjacCZmtumygvaXvh3Gx3z2G2Ho6aDgInAsoLWzrI2fosfg16Zv0B+6rWFqHQw+uQuM6c0waQbaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkS27gba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j79izR2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkS27gba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j79izR2/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnAAM4064255
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=NkS27gbaG9d3MtXD
	EallBjS5w0lf0sqjQLAsXEOywa0b2z0b052QCQ1y1M4O4+dlsA9xeG4HXFExz0h+
	jUJFk+4RqFImX02ieA2adl1CAhMSFb5om239ggLmWUazZM5TEfE7Ewxcwo3il836
	f1Ji8CsfCTH19QE+PrT0ijMcCR8hjrb9qMkA5WhC/t32O8AsaMX/OhtMtqwQQGfH
	TpnH25dfQ3pHJe0vBfyVPf2gIYwgiUsW+B0F8WMOEygtZOZqn6BDC4anI5hne7V2
	sop9JBy0pZYYFF9eDfhigjSL1J17NzdSOe6HMexkmybb/FHSlMtkX6OLj096ILr7
	W+FUxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86rtf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:51:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso457232185a.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778280; x=1789383080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=j79izR2/HteKSAIM9n+xKBYPrcPp9N0AMBKowOvgX7aFOeHnjVmphICkkxUIkPZewX
         qZkXStNoku++bUrtTJPhJvYE491bwFM8+8EWpo6pgJevCzHbSp/IrARW6IrfOa1N00m4
         X6Xre3U43xvoErvGNizTYOW9AS7BrZNCOGaTFWjVMAeEOJ4Xq4GosOuBUfrQQJPJw4QU
         nZva+4YNmUXUa5IfoomI0dMDbTwsb6UmRaZZpWmo1MU9Ax9t7YGGmf9wTBBtS3yZzReK
         MueQ1+YjKQUulh2fCCHs7OBSy89knSN6DAlIvyT+sT8TlfvDiBRW2HTf4+fKkG1nwgYh
         ScCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778280; x=1789383080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=VR8ZrzCf6+jSxineb9wEflauWy0DrLvN3DFjid0yFGhPdM1yNSGdduF5dLCMJLZgll
         EHQTLFVH7fNJKNq8FX6f79UGts4q5Xsx/ZWEACdhaA+7dUftNC4iYOaKAwXk+jGA+ckL
         njWXr/q8ok49Dj4jmcLUstMUy9ij1u3qmKkLzWxeJBQimCqUaOnFXjXF1GIUQEy9tG61
         VQNES/PMlI7R71UGq5H7CpMboT7k7Fj7H4iEXs35Bg80132Ry5k5Fu3ytoOhb+ljAeWW
         dxcTfePnm9+UPbc9wmA4mILgAjePLso2uxMsZUbxx82CFs0+WKXvpEGiky5Yx4JQezGu
         BAgQ==
X-Forwarded-Encrypted: i=1; AKwUvByf3jFY1jJmO44pqb/AH7XUkbMXcMvijuYClyToPEdDgfenpwG2Q/TfTm6FmA79oy7N+TAzCzqmbqhH@vger.kernel.org
X-Gm-Message-State: AFuF++ke999O2xIAQsZqJgGo956aicYGDu5n1PWDKk+0/S+2tLsJwLww
	fITcrZ+Tu+F8Lk9jsvEGwavIHsQqBLZ5ZhQ1zilRl01yVxWHMN5O8NeLtmrgyRjKMOyxZZYcRpI
	R9/C3BRg3jRG8R70sDKYzSHxR7o9tvH3CEqbSb6Ih/o6Wp0+oK/3ggae2V9AhXJEV
X-Gm-Gg: AYBFou188arC0RrJsmd9pO/6XXLkYS1agOj37ro715u4oewNkhBNO0lV+NL3sFsOlOx
	CL2A21ZbFaVvGLBnlpZ/MM9iiMVMPcClYRC3Ry8SfFQmezCBO+eT1pbp2hAyNHi2kGYvtci8gno
	A6YCWbNJVQTVlZ9D55JW0mv42lbAnS7l+OjLjtyEHKhKGAy/yzLBf+4FQygGXKXq9fQGMp0S4o0
	7G4qRiwG6WOwCeS8Yg3OWPxa+fb8PaizpANYfgeHsDsM8P3CGpFnh+cipuSTaDvVJV193gqwKYD
	mRzJ1Pgmoo7QcgUZVVJWWbsLa2LDAX2lUaBj3pLQScs1X1NBC1Zk7YRmH53F5RhddFZRGHyY900
	TYmgqv4yGlFNDa2h6KKwfziwK6XmqCZGlaYqDRU1rJZ0On1kWn5NbJomDJuSa1/dqqlg96Qz/PT
	uuT96hB0LGoVurqYFGmRQ/XM7E8VOHSFgexXXaSwMKX6sFbTl/UVc=
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237087685a.3.1788778280557;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237083385a.3.1788778280175;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:13 +0200
Subject: [PATCH v6 3/8] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-3-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ulxRg2231mQLcThuL7LWjMjQPNmaMmrF
X-Proofpoint-ORIG-GUID: ulxRg2231mQLcThuL7LWjMjQPNmaMmrF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXwN9yyse9rVCB
 THGL1LDMqF1dT2BJ4dmwHtP7GaTSb/PfcoKqMSKs2O6ceC/jXfhLUXuzttsCSaxW4MTWvxHmOms
 G5wCrLBlc1zmfOce3LZ68cfMymL3oZ4=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e9729 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX0GV6d3EFWegc
 mHPyagSYDwErJCEZX1T7YY+FEwtGdzj0MAk5XOqNf+DtHhiwlqBlylBEKfXhlXBR7SWwcM6BANW
 nI1QW9z8XRp4uQ9Q+Q5+zgvcN9n4WTiPCZAc6cgUGXzSqs0cTFWAxW04/tAz95raJ/ID/FBxjmy
 9Fn5I6al+BEXrLMauGX4e6RQq/xhtXQAHKNHmx43QVI/TaZmlq31eUCGvKo6dBUu+AFLag0P0h+
 4DVRHdDFG9qq0TuNFEl500cZy49Vk9btTrQj9UMi2RaABnri9MQ58B66F28lC1m52xz4yG2wLmD
 xfQ+luwpx/reO5ETX3hXZ+WEWpYnjpfPjLiZEe8/FMntfnbTVNuHNYx+Ig6OWlKbhEEwfOy/u90
 hPLSGrAEq1yFssXKxUjckh0uApiT2QL8t383rRDy23a2yuLwwg7JxWiB0lXWq+svUbCTWfjSlGf
 Ic+VKKk0a/IIXS/lsCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1

