Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A5400E1E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207012; cv=none; b=BSM+Bwu6z1/VOZw7z6tIGk4Pp/TzEq7OcUN5nm0P5D8JMos3WlnqfN4NkCq/xUhHNxEHNoHKViy88KFSSKkhYGJXqIishCgth66UqDb0iVckL1n/J7EKQcoMK+U0K7wWx5JBbWpLY70o2TiAbDF0IdMEZyKupgBZXJRgeO+scHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207012; c=relaxed/simple;
	bh=w5jOT+jpBAAFKtHQB9L8If22TyDL2qU7uVBbZYqxO5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnGCv03m83mj0fXQEADN2SwERyFTfGkTp4s0KjPH2HdnNPXte1TuDjEuD03ZRNUyeaCfU+uu+VucPYZhG3Is12sSkraZpmyQj8ooeJTAbhL10I5KWvHijaahE/yXrRLVk8W2FV13nC/K9IdMYw73mwqAPAi3m+9MNPRp3vQ2D5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IK0RrLcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPbAlx9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK0RrLcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPbAlx9F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExLLx341538
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYarrWiCXKr5YH97rLNG1lNlA0bj4nyCW+R0pj6UCOs=; b=IK0RrLczn8Cp6Jr9
	j4VRaDWMLFtwZAb2rqxlMzj4SEuAR8HgM93FpWYGbrmkSZJxussv01Qd6FUCJagL
	B+sfjEhkZ69r5g8LnkvpCgDfpPkMQFRSHK3JJwWT8kEL1fRsKV0Aez9P+k3a9D8Y
	EFyqop9FiGliBFGMUPbVFIz8W8cWJOoY30NtfPOmJXfVzELTnWhxHQGF4i6Sr2l5
	t4745nbPkz3os2FikXfHVsJLIfu2Xvjh5iDvh/MbQXnitWDxBuN5lctQKlK/pb1+
	9IrCOAdIHhbcWSaZtVuEMl0zCl3Lp9flhRbZXBye+FZKxfo6psrLE0oF+VkFIxhv
	MpTJtA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3v8b14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5752c4a82ebso3137311e0c.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779207009; x=1779811809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYarrWiCXKr5YH97rLNG1lNlA0bj4nyCW+R0pj6UCOs=;
        b=cPbAlx9FqN8oLyYX4e1T0p3hEb3zhc3yA0vfkmTnjM0Tc2KKzZCv4AMTmRmjXGEkSC
         q4ORdyrQmBhGu0Nw7EcjuMgfGc+rMHN6UH2lqfOxYGo9Fo2eV+cxAybPYy9U90vWb3ch
         2htJjDtzk8kddqrYtUstJXMs/0SXx1OE8Nn8w84qANlFvs9K6XIWr6JW5Ji9LKQzuOB6
         ul28n3buN8gd0IkI6zRycpr54aJBZJelSCmtZ2D/1gsQuQG4lnFehDnvfuTK/8oHqfVI
         vx8QD38h0BoohSQ0XuOWeGzT/FCMXU2CA7F+nI71yIuD8j3H2Wh5U496l+e9XTNAf3HF
         HLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207009; x=1779811809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYarrWiCXKr5YH97rLNG1lNlA0bj4nyCW+R0pj6UCOs=;
        b=XgoFdOIAv/ZwnZ3ENhgmC/CTIp4jyct1HLGbY84Uydz7J6KBqV6cJJEYR+Mp9xAjXa
         5RXoGTSurusVq65vNSykQI4lHJ+zbsmS8bk7UUFZOwMe5tlPb9CNRGO6jpnv7lcoPG4w
         2HzTzmu1acsZ6vHM4VUhXvkmY5bo1i0EkE26sse0d4nS5hpcWuya0FYO0eeqMsfHzOHJ
         qAY+FruB+4jsf9reINaCjU4O/U9u+7HN0NoHgDHo2XFTlrKNqsiePZxoacKqgzMWRbLf
         hmoFJJDFh8DyraXk6cn4TD0ugsYSE+KLAi4luf6yR8YXJXc/d6TReprb+ufLDHAkHSqs
         vLOA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZUTzvFCrcC/IG7LVphKbWZ954snvPrPP1bR8NhP8MgFKViEYfTce6OnXCSSbotyAEoXwSEymQrIQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIooBWM4trb71T3q9jKNLmcugHxJrvIGQA9PgqmaEo00rrzz5
	TAadElO7ZZ/rN8YSAADufOtVflJ6KiceYkwd0sQiEeszm7+kgUtR5h72RN/azGAR7of/PQaWF42
	fUhyGieFyjRCmWLU7qOMSSdFlicmq9kN/z5TAZPw/qsk0H0ilbdHhaveKMQf9muDC
X-Gm-Gg: Acq92OHLs3JoxoLslL9BWMkXDuDMIMjsNKum2FaLupsqpvZg9AnWqyt4ALQtGFEt3aJ
	pyt7C4yaqldN/3Hra75kZc/oevZ0G+UQw/JlwWH1nC8I/0hMr9Xh4FYNr62OVATiis5WEhgQHI0
	NSuR6qPIslw8cFGzXILGpQliy9hLhmMQtt0EGKRWSSZye9CV5RyE6fcWaKOjHR7Svd6AtMbHofb
	Jog1XwFzGSpWY70sknwBFrzK5qcHWQ+I+jQHzUepSebBBY51oLwSM0EnBNiC2QHAuxxM5c09Zzr
	BJRZJlPw7wpf99czhmF4tCx1619iShllyC2gFSwhJGsdpe6PJmKsfOL0jmsCjbyNhoSP3tVjdME
	aGhpgB+iEA9xu8uDgqoQIvwwaOVNe
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr8525125e0c.9.1779207008165;
        Tue, 19 May 2026 09:10:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr8525030e0c.9.1779207007343;
        Tue, 19 May 2026 09:10:07 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm357874915e9.12.2026.05.19.09.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:10:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:09:52 +0300
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and
 its EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-eliza-dts-qcs-evk-v2-1-ad7303659d24@oss.qualcomm.com>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w5jOT+jpBAAFKtHQB9L8If22TyDL2qU7uVBbZYqxO5o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqDItYTQja3OFG7alXc2UDpi6CK0mcdJBnL9Dwk
 vcrLg3nRqmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagyLWAAKCRAbX0TJAJUV
 VjLlD/9C5zMQ4e953ol+GmabL4xDOA6kzbR4XMdfAWiB6ZyDjPzDa1q5gMac2upyYbrKKElIhZe
 hCb3FzqyzfcxWkunezwTSPtMN+woU/wYFzd67Q37MpAIampAIYYgxoE2V8qjF3I5RIHMoPgjhHs
 HEIjnyTBcr0TaKmNvLkYCj4onmKyWmjyIqap6Vpz8xh5YaxI4De3DnkYo6tlDgBvDhIUwaaHBNW
 pIAb4rlme7WlKfEbJ6qiqfpPACAG69R3TqQ6HAgLMrG6MJGvJe5PF72qcvMd2BSahF2W0EVvUrX
 +VS+6cgGUuxTIwlbXDuF4qoTOaHw2F7Zvb+eKp6YLrcP/ghgoZF1NWye08GzmXYZbopGiLBPK8o
 c9s8GHbmoOnHJTwHT71wEkaBqzkaCxnu9moDMjSn9rc7qSmXSx1IMW44iTLWqpr/dKntAV/V60g
 IbksKIXQhcZSHk15VJgg8KPjtydaboYJYjCG/TDAQq9YsAuhk697RaAk+TS22T7VvUJ/Q8FGGSr
 3TwQ6sSug+Y8qkGuowDYWTTgtwDVqa0nYgdjieTQCvoqHaOMyDqvnUkz4BDu8c0AUuj8ao9l1hm
 0VKbKHQINRHR9XFlJdpK6DVt0fKRinQQ5h/rcHwsgViFZGmn1N0enf5NRqIQ8UMftfawUvaLePN
 fJdWyhy8ef0NPUA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: AyMhol53j83RfB2fnrGbbhHTifRgSVhw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE2MCBTYWx0ZWRfX09mUGUu5Ad68
 YWPP/qfdJqDlCuP4JRMLRTk4wauD6o/LRIsDFOEH2Ep9juntH1jQC/lyCnYRg01P+vvm3qkP9Ad
 hfcQtDcDAEHA2x+6UsLJPRa9EpX9/uVAq54bV3j58z8NLwsrqfRbcTjsTAG/+YLpr6JmvNapo18
 aSIoufi3gCwAMsImmy+EIp6BEWa6mPdIKTgcT4whJohY76e1cEYQfF96iw6SriFrVU23zL4CaFC
 jQWqTVcCbmGtU2rKu+ESgHjPeJF188qkqpkiVfDSp4F4cXm8pLzW0ww9GoCSdNckT9LAE0gLWnv
 hzy6f4GynsCBTpG5aOljV50cyPPU62h5bAzXeUUL8iytzg0NaLQIbbrzz2nlpXkiM3Azq65eGxi
 e6429bBy+OKCIOnQ7+/AB1Yv0bRrujP09q5bMJ1QcG9OiDlHkbWlEzUMo3j1XSB8k3Dt2s5tMvA
 7Ewl6sTwpy1rxOh0Law==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0c8b61 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uFljGN4_2wiWoYfE8PwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: AyMhol53j83RfB2fnrGbbhHTifRgSVhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190160

Document the compatible strings for the Qualcomm Eliza CQS
System-on-Module (SoM) and its EVK board.

The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
eMMC. The SoM is then connected to the EVK base board, which provides
a multitude of connectors for peripherals.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf7df33c1da8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp

-- 
2.54.0

