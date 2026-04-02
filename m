Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B12459C6
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 02:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097095; cv=none; b=HsD7deLDje0VoL47pxLomEcfyU8A8X40DgFV4JoAcVY0ZhXE+64GgNJlq8MRxj/2iGq8CsunWLlYjbZlTKGjY0woe3PUzfE5Ec4GjXyIIQnuPkUm1egLP7htyRONAvq82h9w0ed88vb6x7e9pOuvBCQP/tEaSUOfzc5upmpFekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097095; c=relaxed/simple;
	bh=vgPRnuPH7ko/CMXVyFPIBOZ5z7rx9s2UDvSpm6qn8as=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ohj2tGFJGcfRUcH1iwnIUZ2xWfzQnWz3Qp8M1sYGYLdG3900t+mmWrifmifLU1OdAEEF+tq+1PihBARP4fefjrGBe+ZNGZOfBiQs7ZIHYShgQadPZkRVtdSqZxqM3Z+EXV7ElYPB8q2vXboSTDjRF4/4YDVkQBxRg2v0GQgvvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAdAnhQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LF4UcOgK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAdAnhQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LF4UcOgK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M40xZ547094
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 02:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7ci1IOeOnUC117Y7WLTsUP
	3giOCURHkZyf5emfHJurE=; b=AAdAnhQ8gVH4/j0NdHTFCh1QuacjoPAm58U7A7
	eYvoxyNE0X2Zrjmlvmd3oCG86UlpObMaW96JsaPOJUj8J1p1miouDtsNm/ODNVno
	sf05ZYY2SXecqkVrZYlazJ0wGUO89rmN3ntV597SCNIT+OBgzjpRR/Ai+YGpvKZg
	x6NePe7ffVQwSibETY5vQk98zGFX+2vEsC97hb4P4fR1UdwpycgYRH+tq+gb7dAJ
	5pY5cU3O16WcrCJN8Zj0haV2TuYszHOR2qUma0zD+25HU7xaNvtqQqQGweffuB3Q
	WjhsSGVbW2ktSidYDnceUIi9STwE6aV5joGYCs4QU3mCiC4A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvjhh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:31:32 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-467e13a1236so707410b6e.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775097092; x=1775701892; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ci1IOeOnUC117Y7WLTsUP3giOCURHkZyf5emfHJurE=;
        b=LF4UcOgKCiMNTnGhvZsHfnvGKb4SCQAu9r/E8o87i2q7n5iCDKtwy+vc73sWm5mG3h
         y3NXONi+kchzogNnvjre/JaAcCDZuLN7nImmYLmowUCPpMavhhzV9XC9em/8CZBW0Zu2
         5Fd+hE1ZVT0mYPC0CrqYAwyM04PIAuHKOfV9H1fUdnoTV6G5d33W0PW3p2JF4iQOA6kB
         XARQilp/p6lhntFYHcNnFemIJastqzyQacIUbRnZeFq+uOWJhGcpYsFqqntQgBR1Vo/P
         KjpuDL+KJQqsDCua5usOaaWxtYPY3uACR7gswjTPij888rrLw2hmEokdmAGhc5+rjeMS
         Felw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097092; x=1775701892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ci1IOeOnUC117Y7WLTsUP3giOCURHkZyf5emfHJurE=;
        b=GI5U0Mzp6pS7AKfoultz7qyzvJE2DJ9QWlVBwYSYaNqqg2ZHUgglnLJejYVLOwj6kf
         Hz10jo2+hZe6lFktuQOs+bwvv1DfbjwsCgfHO5aX99hDUVwYTS7ZQaXVHd1bZsnh/7Gb
         1lLLlQQz3QoIkhJzy+mfiyKF93L3nB5j/MWWoDCiSQXT96AZlvE581R97S97BR7mCmGW
         mQxZ5QKQPUs+4bNVdEDgDpR25dttgr6YBpiIb4zNSZ4t8kNPSkdgOLdT9b/KiqlFBinj
         hV57TL4ZDPPqHsKi4Om2RF5GPa5UwfYhuEk9NgY1YV4t04s5VQMjVkgMCM6BCBWIW/ek
         nCZg==
X-Forwarded-Encrypted: i=1; AJvYcCUsmG0PqSvsGhpoxjLwPK+S9Et3Gs61ZU1s/5/T8IPHFS+6lz0N1j3HDQsVQytM3FAzltPL2bgAWAFc@vger.kernel.org
X-Gm-Message-State: AOJu0YwZIlQEwESDyZGtNmfjYT2HrpbHlq242lJCCvLfNG1A8fjVxe16
	2hrBq4IogATxEKndNrio2lnKWgmIXLmosYAgJHdZciWOPsjxrPdWkpNicmxtAS5DUELT+AIyEpX
	c2+QYBnKv+twhaaMLGuYBafoZG60wXu9SSkfbBOK+g5FpQcVOQquXHAGbCQG7LxgJ
X-Gm-Gg: ATEYQzxE3Ei4SriFHiofcjWb2FPs9ENSbVSEO+DGvQSEFlhf1uPMGk+/DAG4MZrpzRf
	Of+IMhM8HNqM0C6g3Kd0DVQI5jb7lOVTuhAv76sghgtvr8gU13n6HoLiz68PxmYTT4kVAiGnRv8
	0zNMaHSr2bV6sLRkmtBQBBCosQo0orOXltq+j3BN7BtPN8Fdvd+eNjeTyUjTykTw7u82AdaGiFQ
	a8/VMhfqhij9V2UIoR4yFVD3Yx3HNNZI55dOUFu2HBU4487jeONVkUnkJRFZptxEsr58LuyF2Au
	hSs5aXhXQVBNlxQMwtoOsI3pAIbu6qfJzdd36m5Kiwu31PlAPvhTCm5qQBXpuYvtANlWqST29sT
	c8rlhiYDD3badDizM73I+fNF2RILZkAgU5CD4mhWAFww=
X-Received: by 2002:a05:6820:2212:b0:67d:ec7b:cc9b with SMTP id 006d021491bc7-67fabc069f9mr3414348eaf.16.1775097092299;
        Wed, 01 Apr 2026 19:31:32 -0700 (PDT)
X-Received: by 2002:a05:6820:2212:b0:67d:ec7b:cc9b with SMTP id 006d021491bc7-67fabc069f9mr3414332eaf.16.1775097091879;
        Wed, 01 Apr 2026 19:31:31 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm990215eaf.8.2026.04.01.19.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:31:31 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
Date: Wed, 01 Apr 2026 21:31:24 -0500
Message-Id: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzUzWkC/03MQQ7CIBCF4as0s5YGqFLqynuYLgAHS2JBoRJNw
 93FxoWbSb5J3r9CwugwwbFZIWJ2yQVfwXcNmEn5KxJ3qQZOuaAdY5WoDPolIhnoXmppdK8HC3V
 wj2jda4udx+rJpSXE99bO7Pv9ZfjhP5MZoaQXUguhFNqOnkJK7eOpbibMc1sPjKWUD29i3iKrA
 AAA
X-Change-ID: 20260311-ideacentre-9048b8cb7b9f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=vgPRnuPH7ko/CMXVyFPIBOZ5z7rx9s2UDvSpm6qn8as=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzdUC8druUzyejIxgOKKOKyEKy88X3NK3JyQy/
 +cVx4AMrBSJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCac3VAhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVS7RAAyozYveZQoL1+om5180Oc0ne1XXbOlS3+WtjRxk+
 m2meBwNm4dSFifYiBRh4D9petOgXopNGz6EFZvxEFF/Pn8D8kp5leNNQ79Qd4w6FPV99pDZhK21
 +GRO/wnXzmzffZRIEgOJxdGf6UhjymTdVyHRVSZt6PJWw9GThKVB+HoCnhFWBIxlbzTmNQ6gAXs
 fLDw5O2E/Rvw5ZbIFxYgKnvM5j/PYuF8Z12qbX4xyst5Tfe8vO1vxTuq5YMJjub+2TAE2QtC/vl
 +WclSvW39Nf1lkgkWw0t6IVvVAUE1sHp9UFx1p8/UiG5hRwLtAX7NoVoOYVsxKzJBQ2FANEWZWL
 xp0wRB3zqC1ZTbQOSaQ4fxMsP8sttD6O/dYPuassiOontqZO4yE/98X37ViWJQ/8C7Bpx+mJRyS
 61SoDhpP2fjYzz1HUXk1McPeDSL/koNAbEvNXqKC2BKY5nDZOdz7f2rc0UYZpFDReCNY7LKMWFf
 +s6Ei59yjgluudIFnrZfpBeWN4LxWPYTFHWj17kTRyFOjH+LUlwtrVRgw23QdyxcLGoorwXx3oA
 A66hUxXG6RUWIPQ1quy33pwUPMYhwEbEZ5LWOR9Q18EIOocOuLViqwBQVhDsaY4VUAyuPuKZxtc
 p/nxoChC6rrBC70BMENEQPcDwRMV07nwfa0vUUU2soQ4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyMiBTYWx0ZWRfX9mR0MSSUcffm
 kGHZirWZIMac7EJTBqy6Om5NtdmD1RWWJGkAOse8uKhEPy+uWixN0Bh0RBuDYtkgmRRjagyb8tC
 iE5kCHf1DTLhuDcm2ZpLQ5CVJPzv0XISa/lzh9R4B6TZCexGKolkstacIU/8KphIHQeoMyZ/yMB
 qyFhKaDJfqQaVfeCJ1zX5f9TnSz3JbJ29eEW7AOCJaihabPY65pbhiLAZdgZLN6aCelhe9BHH9v
 4cb5j1sgFjN8JMbsDklVMjFM+N72/FzPe9IytCUn8U0xTIOiPl1/ax39kh871IlF0+ecUTwwaou
 /ifskIGVdZZWeEXK8/NZJr71h5ZNTl6e2QPVuxicTQydS1ZyrWN6dRVewHifUBICCyiyWEOOPO7
 k+V7/x5ZOCX8HfIWg2WBMgYaP8EkFZdjFq9SgzVVlGl61isTQeIYqHKYHcrEQMk8I+qGUPeLRsf
 H0v0NMtEAXiY5tjixRw==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69cdd505 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9nN60HbFSD4cxyUCmJYA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: O1LPo9zzwTKbrl0bk5grx8A9qdEpCPXF
X-Proofpoint-GUID: O1LPo9zzwTKbrl0bk5grx8A9qdEpCPXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020022

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Shufflex the reset and wake gpios for each PCIe controller.
- Fixed a couple of pinctrl-N vs pinctrl-names ordering issues
- Dropped duplicate smb2360_0 node
- Added a newline before status
- Link to v1: https://lore.kernel.org/r/20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com

---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Document the Lenovo IdeaCentre Mini X
      arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1200 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1203 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260311-ideacentre-9048b8cb7b9f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

