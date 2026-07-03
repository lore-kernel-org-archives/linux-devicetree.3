Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A690B35675B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064091; cv=none; b=dp1AwiBt5MkEnE2wsXSDOvnPVy++wPxNU7YZEryrB0u3csYKYePeMkJHG5l98uG5N+CFCoGidHObJD70/MfvOwt8vlvXYFv7q9UzXUF2Uadt4sNdQxCSmCRCZDzTMfgd6Yf0JOaSzpT0z59jvKY9G9QO73G3JWADfz8Itc0TCNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064091; c=relaxed/simple;
	bh=eauUBeRESJvunQL23izSm7fxSNDrylBGuqp7cFk566U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iDxt6+R5uhIau06DT76Di9hdm59K7pks7ibGngY8erERYpKz6aRum1dQV7Cnjk+cCUmG/QkQT11CT/N+NoibeC3bfpuZ0CfvJwsiLQ3vMxntWu9YmdE8UYtzcC8k7t3745A087Dky5XWy90wQ9pX6sUOpjDAq7QJxJFUC92YoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0laT08N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXHqXhH/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0laT08N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXHqXhH/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rm7B3129346
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0Tz
	eDf8erJg=; b=Q0laT08NyimY/Qfr8Mhm5jGuxmePCQLZSjG7hoeWuOAijhPz5XT
	OMncWBvE/i6shCCdbyi9eiy0kLhPYH+kqVmx5V4KgqjHneJI7ydRB85rTxNj1XSm
	mZ03AJQs+IzO4s7oramstsZVOfpsryc4lRKFJnAIkx3NdmN4wi8gPZwLZdUpG6Hr
	6fF0T1TUVIChSo46Er341RL7bFl3wd0+mLi4Oq9MG+tor3qitq+isI1YXMSKWu85
	ZyJz4LFQaVnh1D5HZt7/2eVUr708YpVjEo1d16LYAbpl0RbWL1DmUPIVRBaYc7zx
	QccpDr8O+YsmeMqhDp+QVmPzdyu2P96SjQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc4fhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:34:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0481106cso4386835ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064088; x=1783668888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0TzeDf8erJg=;
        b=FXHqXhH/HxG7He5i56S1nvr6iLMf8MPhCtR8sUgL+rgY+28v8tSmn5y2RbPLfJkjic
         /zqkqwDWH0EIyLK7DBXN452Eie3Mh/gXRskVx5Wf7HXEoOsmJTy+mA2gyzOkWMi9wFL2
         zTmR4D/genWs8dm4FpOm6o4lq8ZhQI9qRfTTQCLmnt4KdonKBiizIRIj2aeHXVQlxePF
         7MEasOS+Gtsj63gIlIqsMLuk75oxjuGFx0lDz0urWGlQTEjBEhG0tqeBJv31901SaJVQ
         wsBOFh+Ue6fq7icRp4lYDSPUZ9xabdQqgylXX5zopSbNPTo/jO77xNg4yD73TCKpYIGj
         ippA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064088; x=1783668888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0TzeDf8erJg=;
        b=q4J60OZn+rMaurt679+u8nMYt1jLOPntf24kaYnjH/dAB+qKs81UL+sH5eLyuaj0QL
         5x0LXB/PuethbAn8SlrwHI6s7AipFVnWJXVUoDeK4ZCkkWIs/YvfyzO3R+Qw6gvAjBh/
         Rvjo9V/Gcicwufhdxng4Lg4MrzsOMLykTbn/4VF2bc3W+RctYxQ7tCaqwBT26pg70b3/
         EFjCu3N8WUWVLLHiE6ODgeuAG8kiVchQISAnONVcR2Nwf/OPlmC+xQ6SUQCOoGPJ1MSz
         zfXe2xE5uEVb0wSGr9UUaC5ngcleKP04YdKlSmp1jvzNt2QJmYd68lfV2R0wikAHoRfJ
         SY3A==
X-Forwarded-Encrypted: i=1; AHgh+RqUe7nPb6dAXskPNbq6b9Q/nYtzw5w3wb1QVYf+xVvR8x9km534RwYU1+bxMutAflvRN73y0m9I2D9P@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGZQhRc+Blpk6c5MniQw3Yi5o17XEPy8EJL3LxFnrkjWKa9m3
	H+Yk29KJIM1itzMZXsVHmfGCvk1mnCS1eaQgEWVm8E8wmK+di3rtgebNWLQgOo/bKCbtMl8XvAL
	OpffhVfVxBEGzjnEd2eRZQ68SIMmBifYRT2ufg06yZwehl0xOSdsL7b3YIMns4/lHpo4G4hPt
X-Gm-Gg: AfdE7cm/NVisaUqUVdZDYrwOwd77FWC0TC+hhhWbAqRM5Bd/jQ075COm7iNkZnb+IbU
	GZoPxknZzCmA5GeI37Aqvy5XM8K/bDkz2fpwQU95X4F/EM9qLVEiM0JE2NsC4uNPqZkcuZdhSAO
	C8pPssdTsof/Cer45Ch1Fw9Cx6mIQERein4LtWb54/jH8U7cz4v008FdT+mCec3VU5X3hkoms3l
	O6ANRMcMHV1Nas8H0sqk4N1cxE78+MxBdBvQCO7AVV6DOMwfa2KXz7guIBcOBEIlrXORon1bwg3
	EWjnyrf/jrAr/+Bep6d+SnSnq8uhcXMewh34LNgrTlFNvn2kaw3mkN3brX8FYp8r9kQAeV8LNLN
	F4HfjK+nEaPjjl3JgXQCtTlurwjm+ipRz2BqxRiua
X-Received: by 2002:a17:903:32c3:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2ca911fe692mr84498725ad.38.1783064088276;
        Fri, 03 Jul 2026 00:34:48 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2ca911fe692mr84498455ad.38.1783064087753;
        Fri, 03 Jul 2026 00:34:47 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:47 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: Add Eliza audio support
Date: Fri,  3 Jul 2026 13:04:31 +0530
Message-Id: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bGwL1jFCxxodV0a9cjxyAs7DsCPEJH0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfXxZNHc3gkJXL7
 BChGXfECaHUiF7H6GtamnjQER9gx1Z5H7yisJF6b3tr/93NV2JV1q2ht93dW/5ldmXmGLzqlMbh
 wuh5384GLEEqZbBIQqcpFTaHjUIFDHdPkyUGuO2N03IN+HoK8ryDcYBSWllfvI6P9ZpFOP+nreF
 TPZQngP9RyqQlPsmSttRWTkgEl+1nkEpiUw5Gy99xJhberAt59PH2eizOhEIjUKqDVF4/LJQmHI
 +g2vJybLQoBXHLl4AZpI5enimJ9UmcTeJHmD5WrIuT9CKaR/BVj5rJjnwAMUIorElHlDrnfWdQ+
 aBb0/Qxyg4NQVWSTBHLz5v28HHH9DOwdjlxrMzy93YoHJFNBILEnotzQAIEeowV4Y6jN/abC8M7
 1tvGt7JkxP6g7e3oM7glr443M4BKbTgVr/sEYIx1x1aEUl2FXP2XS08CK0QaiTxS6HyVo0Bjr1y
 730v+VAA6SolAf+q0Jg==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a476619 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=TcntpH_QWam1UtUSv7EA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bGwL1jFCxxodV0a9cjxyAs7DsCPEJH0x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX+lpFsXJvSkcC
 V1VaGLfw0XUaXrEs489hbtmOMBPaKOE97vsgNXtimtb0T3xxAyV3SWBGigsms0m32vl0hI0Y3cr
 yplKFBSzITO0cNZ0dkGILRQ0M3WgldE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030070

This series adds audio support for the Qualcomm Eliza SoC. Eliza uses
the same LPASS macro codec hardware as SM8550, so the existing SM8550
fallback compatible is reused for all four macro codecs (RX, TX, VA,
WSA). The sound card is compatible with the SM8450 generation machine
driver.

Patch 1 documents the Eliza LPASS macro codec compatibles in the
dt-bindings for RX, TX, VA and WSA macros.
Patch 2 documents the Eliza sound card compatible.
Patch 3 adds the Eliza sound card entry to the machine driver.

Ravi Hothi (3):
  ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
  ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
  ASoC: qcom: sc8280xp: Add support for Eliza

 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml         | 1 +
 sound/soc/qcom/sc8280xp.c                                        | 1 +
 6 files changed, 6 insertions(+)


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.34.1

