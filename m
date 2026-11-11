Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416620;
	b=p4kL64plBRANk0U6W7NoY9FDRY9dPX+hXaX80BNJ+6poUF+CEJIWq8GShBgovCKxysmU
	 pBN28YyR0ijyQVLfe2ltjDoq6Ahu0qj7mE4dkO9XRl2d9GoMtRa6PW4KS8FUavjozZACq
	 vKViraYAny4JaD9MawWhBhV+YUJRrEwX60mPzhguQ9hsk5ePP4GPuKT3mj9O65xMUGut+
	 ErrWlaV8lcsUxwnZhUF/hycDSVepXCRchugzGFvQZ9WBrgd0FJjFBHB5uQ0dFDT43gNX8
	 STSc+CvC/nKvkawY7HRx3H5ZhCYwR9HsitoLhi/Fi8gu5M23ERul3uSU9Gwmbx4+Y+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=4lMHYMdwxa41yw8gJDtwteLJXQYurLbJ2/7FOdjL4OkcG7il4q2GF6zL4u+oZKJPjWKR
	 SDi7dgfEUZUb3Fn8udvKIxaS0/ynGvnoIBA7/mu7IU/zTg6skuVC0LMQC5PoCAwYzpef2
	 Msqtc49vAlLIZQfcIouNpq+4qqK15xKrsWxST1BILpkhRlT8+bii+QWD3iCKBNeQOfSBy
	 83f9fPnpLW44A6R4ZkLzxQzuRoxLQMrYneKEeEDLZditCLDii17qnYC/rdS9XSK+LO72E
	 LuaCXdEKg4wH6jAMT0rqWJXOwO2w+zJkopUisbvgv7Q6Wm/jgIO9uGLgF0/paAsI8Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAggYHDf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBFE606A337
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBFE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAggYHDf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Js02651104
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=J6G2X9uxxQ1DN+YE
	OCV6FF2EsTQYYEwUQIFFUouS3KYf5NxFRUlyY5SVEuNbgAEXqEchIe73k+JCtjYg
	RY/lhweH8o3igtbK73GmSMPTeMG1td7+gABGjFeOMFk7vBRnRZ+jv3Sp/x+MrTuT
	VGf+OMaQ07gKRnEIv8XhxnbyLMY241lY+TUubxtFv5RkkhoXadolNsnVo6IfjC6w
	fyNK1SwO4MlkteT18dpGUn0Pxgiv7BlX2W7sx1ovRWJBOLl3nAjpfHjzUjhOLqBZ
	gJekKLEIs7qSWg/JfGEhqhZ5ZHftUjfk/7wtRChFj+n3EkE2rvLT2l1LvvBs18j+
	oDw5Tw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbt1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b09a466295so2824901a91.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416617; x=1795021417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=CAggYHDfNeDfD5VRPZRPtFPCaPl8+a1noOZ/ICT+sj1hTJR8slOywALNIYF208IGZA
         9fUEyEnuXu5d//oIdH2IEz2ZLWpUTJuZJ/CqXKCm6Xt3Ha0rJq/+Nqd26F+aqfSQJf7L
         SLVfxS/Gvov3DvNhcQC2IFwVhtRyNXacetNA3azBJEdaT4JhbpIdofHYqNBvklmpVAYy
         IW+Ha4vDromkyPU+5Oi8qHuTyC/ZWWzCMRaO7VrQ7/ChmVM+fgxbwRQ+qqx8sI4HsvSU
         yBJT/FaClFmI3qwV1hpTJacn6g3owMCGTtenfAfgZECI8/Ij8563hQkDOMKwsuLdzM0X
         NYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416617; x=1795021417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=J7fGvCDjKxqr+nFIhhJ4wv9ZeZkFQxWyi1Jt0K8Wr/2dz8Lq4Tx8dlH+lvIENA6G6N
         TNZGSHJmQBJjAE4rN/cnAmg8C/FanykzNFgs2rbsRRbIfS/VG+zkm6haaYVEWKgwdtvE
         5pzuzWsgc3tyKXz39BlU2vHQet/nncaBBgIqKEi9291yO/19RJw9noEu7XTRj70JDEK7
         3xcKRB2/WV5gClQTrIwXrVGr1r9zWkSy1gB5v6tX+ooFScsxWm1OMRh+UQm5B8dFyqw7
         UnibSNDAEZ/CBHDV7FKI/UTZiHqAnipFaE4L+AOQQx4dDbMWPdS0cibLV8F2UjmPHnB4
         mZ5Q==
X-Forwarded-Encrypted: i=1; AL+hErFrJZYTB6yxqGfxoZRaYMvv1MvXMI/f/Vjk1VZzUH8bcyPibYZ6sT0Ij9oXTVbFepVTEXInbYFmfjSC@vger.kernel.org
X-Gm-Message-State: APuU4Z92GLVDQ85s522ZtAaX7dQz2CCYhbdgYd0ZfYuNVrfB+U6z8l9u
	/YW7/xyj+eIrzLvt/PLoBAWSAYY7BL1tTU0nwwRuhRhfihfJFn6N94DBX60j4kcH3lFnNFZXXLS
	XCGGyxNIbHDLb6UbeLUlpPHmJpAxNdv4ZP+FaikRdj7TgQXJkuVAJOCxoF9NEdozx
X-Gm-Gg: AYBFou07o671lgzrV8QhazlC0pS+m1WBoWaAajqTzjpgCOa8fjgKFfTZmMgxdqNJueA
	kIdfHNhzPuHCx7GZst7sk15vS56CD6Oh3IP+vgUHzqvpKz8s3ZwNk25DgmyDr6HVKX0SDjJkEKA
	2HoRWnm8qgu5/A8/E4gJ7qa8h7jF3AUvGvaUTg1um3EOaifb0E9ll+FRX+nNI02LtP5AFaRXrKI
	pGDLdbu4fGfhQEKyA6iC4IsSAjg5ypYCuEfoKu32bLsioJHP2lAMlgAcVcPqFI1eJIuGzLvfD9v
	GO8yTYyenMmJYi3nfU99aZdZD+hW2VrNGOwAt6v9PNYH8vlnWDqFRt2VWwYdkkaETz+QUgCRyjU
	jxpA/MYsZihi8bunVSnk5arrsHNxI5pizwjOvKU0TWyEzf791SBGXLGbG6JeXqCyr7tA=
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2802011a91.14.1794416617412;
        Wed, 11 Nov 2026 09:03:37 -0800 (PST)
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2801955a91.14.1794416616847;
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:50 +0530
Subject: [PATCH v4 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
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
Message-Id: <20261111-pm8010_i2c_support-v4-1-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=GJMpxKOfgFElqWzV39z9l90CfE2fgS1uPuTsu08Ouz0/kKKFZ0SnNfwqRAepdTnxxOTzUgNhl
 Z7C8R8Gy0LnCYcd/H7yQfZFQdQldQigDjm5WQr1ZU25GqXRG/PlQ1S6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: DGwTlOnoO2M8XuD3EEkNQeYR3mKdpclp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX9JT0g/f9OoZ+
 u+G3UPfh3ZbHmQ8djwk0OXX1p+66XLEQRuVV/6CxxzyTfTOueMTSjPLRnVyTIjgv+0jINHqi+i3
 15n+nkV6ASCNwYyh3hruDgUNydXt6Qk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXxpCT9+G3msvL
 d+Eq8rmqzF2bkq+PwRKHRZPxo+4/fj3xNDDuQd1+NQ4igptUxHElpuUurNGY5xcdieQKl7/Rc9K
 zEItHx7vE/2apMBjx2HOWq1pS/VWLJQVnLE2TlEKSpTQn6uvd+MkuNnuIc4umqphqnd4S6TUsbF
 Se9IK6HuFjlUyvR6AS4tey6gj3XRtLogqDZOPh39GYfs4hlI/eY1iy53cDRxfWze9TCpFBDMH4U
 a7JanOr2qlcWhc/sSGc8VRdB1MuEAMfoXi2KqhRjvh7b8/ENLz/walJKTICdcg4GHrY9IT0/xKH
 h8JqBexBHgihnkDsE9N6MbYr4J31CYebQke/jAZxhHDr57etLztTPQZC6yGLF51mL63Mp8bJJqT
 m/wRtmZmFmFFDPQVQdT+eIvkyw1N8BRh3HvNB7sq9QoHRDSgvVMqsbGy5xQKnM7MtP8nELKgBct
 Kjoovp6ayUHP97y1Q+w==
X-Proofpoint-GUID: DGwTlOnoO2M8XuD3EEkNQeYR3mKdpclp
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af49fea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

