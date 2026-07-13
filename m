Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE738E118
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944953; cv=none; b=OLA683jYc9rYBM/3HGvNYh2WcqaVU3rS4bQpbYFlBfuntrnL3cTbtTQg76H8vTJw5s/SOJ5DRODvSn/MGQI1Sxqm7hL2vi2t4wIsgzXqTHNT6wyb3qywxPDNJOBckLQ0/B+LTH6AokEdDKf9jKdhbmrFDbWl9fqcpDb7/eqRBGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944953; c=relaxed/simple;
	bh=ATDTQm/UciDupErPXbLk2PXIysxu2045xUz/FTQHuFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VzdSx7Fj6nsHVDna6g261G4Z6QPmWFGj6Q7AF4IghncAMegHKh8UWZBvuto6io5N2uHnf6dO9E1u6N+eDFlfjf28f/KWDUaPWpBCNMKgf27HvfxE/l9bSx7vfn71HZFxDavhivkAgXOdUKLMjvqPHWkv4pM5LZxmqYDbyrqzLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Log/pXES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VactPLZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Log/pXES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VactPLZu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDerp1299381
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MzYXLnYT5ku
	894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=; b=Log/pXESPSqp/g/HBd2hP7Kd06b
	3rAjkTQvScrB6ON+OfEgsuk4u6GwVSUBvlH2Q6g/050UDDcqUD2PIcDavKB2Pxcv
	aFiyfG0CqpDsjzNOuCZ7gBseBDKZtaW9AWXAW4RUvyLL67skvpX9woo0WwONUnFM
	jV/IPuqbkhg1BH+tHGqSwt+iPW6iMO78GemNTeB/HDqzk2vfRsJuitOR1RTxsurQ
	xVdPZhFJOb6sBMe7MGCAz21Gv2lXGIOsTB58qQsLFP4yS9RCDdTaybuPVzFAzeNv
	2ibS3D5VJgua7mLJzC5kEw2q5a+zXTpFlpQ2SjmQqa1wwxi+ZfkERJNMYFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3ghr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:15:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so3534235a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944945; x=1784549745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzYXLnYT5ku894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=;
        b=VactPLZuUO8hNXlQv9nRkHSWM7bA8YB59w+lSkl2A3aXoIsLJYdd67odtTz86uIGlO
         VHPIge5LI7iIVKThuDp+3kyzrYM22mYAkk42TTsWVDtDMUWf0RKseH31Th+zhYAeQvDo
         zU0T4vJjxoH94CRetfBa5iIfzbYo8+gT5q1+k5JJ21Rghwsa/1lDiCqFeZb4sQTR2/ty
         JmTDhbSM6wd/cGBuDaGx+7fVZswnS1xX1ZtSXlpNwEN4V/t5zs7pVgv9Er1ksCpG3DoW
         0YN1MpLOCrLLRSI1j3sro4rmwyTciqRGE/yIJ2mkEPzBeuy5GyL0y23aDTpf/T4VsDe8
         zaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944945; x=1784549745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MzYXLnYT5ku894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=;
        b=sl0Mbwr+YDtHZes/NNKn8rQLMW+Rkgok7X3Mzda1F1M5gDfw1JWIory75/wa5qDaDb
         wUWoXXtGxHBgheiitdvtNeJeTH71YUL0WXjCgLINF1LOAbsjgtC1ergLAgsmkGtd3JV1
         lTPBZ6yQ9vFI2hGn1BIqr+GoEhEWP43W25UbAWmsETiR4vu+mwmn20526J3Nt4ajw3T3
         l40mH2ybUhCxKROFsBPVLHrxD6kzwkO/0h0t93/HxfJE3x7ywXDuf4jncVvGMEi4Dhwv
         dPi/RxZ64tDq5GkZeA2YpfxZ+YWTTMHELesQXMGuwz1/XmjBGIOnp0cf0Sg/EHrsU9YN
         kNvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3l1QqVxGLHz6kaEdQP4H12RWErR4WO80r/lGmn0tCT56fezBNN2atj/GfyTdppPLewehCkHPJwck+@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5E1bUt8oWr6p1JBwrthWJFoLV6Ftfv/7vQDPl3jk/w+d7mb/
	vo8qR4gmmNyKiQ2mpj3XdEyaAR+59ONsl19mIn7fXfstO5qTPhT60HY8ufR48Tf5ZFEnFadho8F
	U/lRvUlAvfQ69DiNPQ7evHSzzQhWfHRKHhSsh9uLIIB6HjzPkzai8bdPSJQ+hGHDd
X-Gm-Gg: AfdE7ck3XiSs+54mK2gn7QCqQSwHYX2fKv1dXoPjpO6Uz5gGSKxAQXdiBToV1CJueAk
	DTuDfag2jEgNBVMNL1cSvxT/QiXvB9cZCsSRrLxA+BL21MNcjRL5yJU3wtOtmiCBA+j7TQbwDHq
	+1ax+4tySbbSttggLxgXqobtSXVce97mJOC4IwiIk7SE0vNtqUh7AeOWziMItVtmxT0KwJ6HIHC
	f9zRSlqdYdCDH45mne2nTmhva3qCHiB6+Rx6EjKCtvQS6FL5pqf/pkcqnX/U/v3/OWKWhFNx5PN
	+HQsDuR+h/V7+AGI02lVKisORI6pkpuJXzCxRKWndxrPhDKiuNqiEQv1LVnxQ2UVrW8I+AZOv16
	WccV1pAf3v6uKEkqpaDelumV9O0loeVRODpucp6aB
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr8927962a91.13.1783944944936;
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr8927941a91.13.1783944944502;
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Mon, 13 Jul 2026 17:45:17 +0530
Message-Id: <20260713121518.2724474-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fTWsx2AFS9iU01Z_pzZaGIBYUdLk8A7u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX/VFAhup+lpuz
 Iccqh1GfhuiSYDddqgRFukJ7xglBZ26YLVMSfDoUfGpXbFbxXAfbg06CpFzQjnfsqv6FvNWalKT
 KpTkD516EZ5YdBKz7HTdlbb826suIcA=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54d6f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AILnUmMEF99VWB6qR_8A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX1Ge7bvWspZMA
 IdMeOz+zc+ivBoSDhEaPf7PRf/NfsA9lAikWSF3q2KqlVK6n/yOUQNiKW+UY5U4vgrkyAJLcsGf
 /I3I42nXg0/KOVAl1F2Psung66Ao1Uw2lPSsXJm/Mode9Ts0ch3g8kABKXwoClOd9NK/1fhNlZm
 C+uwKl/+KGOl/mtUhF1zc/VQ7dUWVClbN/Xuy0P9xeKq8EO9AywQBPErs4aWfGFV4czd4Yx/H3p
 3y4vTxxHsgBQdzcZJDn72jZss/N0BhDbh+Zj8YH8lNc+Kvx2qr7JackklYOgJCzkkdL5ATnMrWV
 7PnsQOFfWWMGpNRJbN7coOD9DO/3dkDqujWmibgHJHtLwsDpb/M+ZQCkqDmD1R763LXLRU5iKSB
 /4zOWKB6afI9jGmtt9Kfy5vI+zAk2mqtppcmUhP+43BOPjoapXV3JF+vxH4ubkmmiIjONVSURsh
 g+v+YitBO/CIEt8BBWg==
X-Proofpoint-GUID: fTWsx2AFS9iU01Z_pzZaGIBYUdLk8A7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202607032107.RMly13RH-lkp@intel.com/
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..c81cac1a9740 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    enum:
+      - qcom,milos-lpass-lpi-pinctrl
+      - qcom,eliza-lpass-lpi-pinctrl
 
   reg:
+    minItems: 1
     items:
       - description: LPASS LPI TLMM Control and Status registers
       - description: LPASS LPI MCC registers
@@ -74,6 +77,19 @@ $defs:
 allOf:
   - $ref: qcom,lpass-lpi-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,eliza-lpass-lpi-pinctrl
+    then:
+      properties:
+        reg:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          minItems: 2
+
 required:
   - compatible
   - reg
-- 
2.34.1

