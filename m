Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D96A4519B3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521263; cv=none; b=keNoPhAUx8cKrYTNAG6tKytIHXytzdwejcTYLrpOlHWVc90+bFeXyq2lQdUOG2D0P7cl7GsnHpYN/mHtgoOExJ6lLquOt1k1x6DMgVsRgTsMXXhRsLkHZA+CkwLVmjzs94A9+7Y3sy+87iARXBfFZXgwAVsNBv3HFd1nAbA8fFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521263; c=relaxed/simple;
	bh=XDRR7aZZVES2zWWZ6WdrsJXHYCx5Eg0S2b6tcAaOtrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ne1M2xqaA+pe8J//lxH1dvBnWS2hFXteu1UJdfete2am4GsDtPs90KYyZCyYntjYn2BNy+btI6S/gueAOPCyjaDMDeaECubL8tGvKlpQAR4Kv4tuzPi7Yym7t2/DbrL7I5KFvQ7y+hgPurNMjoSvXdj5cMPsVwiGjrTNJnnB7kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5ZTh+uO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewwb2PkG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5ZTh+uO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewwb2PkG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOa34403948
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2612fRRyGYG/lD9FKb+0lhTN80Q8+gljaqZgaS6Lcw=; b=g5ZTh+uOId25XCXm
	RhfrbHNklAphsm7prz/R18U3aRm2SlXOZBEPrm7G3RuIZ35ThhLLFeSDsrY6prnD
	0MhzPEbOZttuHF+XTxt3VL5KBL/kr3QTXN09Cfsa3DvpQlWunHv0aaSFpXqedO2+
	X9QgjWYXIIUQAWpOMewvhJAuaN5wftHgtmn3Nrtd3rha6vrdN1J8z5+7Qx4svizk
	x4cILarPZijmoxtU0zukoQVtP0RQ3NQ7myiyynzBCAS7CKVAbzuO/3/THiF2Yhsv
	CAP9Fr374z3HJjdJGhmsz7PD7io2vLxuRp/VmqNwC7mDOvglm2N0d5crXQXlwxAY
	aV9pzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkhnd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:07:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso1587351a12.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785521260; x=1786126060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2612fRRyGYG/lD9FKb+0lhTN80Q8+gljaqZgaS6Lcw=;
        b=ewwb2PkG/3w3Ktk4lPpyWsABwxXNp3TwAiPeJDfh69H541LUWgJCJkFKqCqpIDfAU0
         wmGUM8APXDyh5tjD7HiObFJ+8JRs/BWP6NeP3X7dkVQ9aORzplmjvkMR8HTDi8/w4h7p
         utL9fHX9e0Ff5UfEBvTCePAKJ0QD/k2kZRecvgekkRW+6MRwRGgecSjFMJBwKfmu+eDG
         1LBzCyQI9QO/UYNFh1jahXoeQVFPH3B0ISmrhErFmrxgz2Q6pdBO6IWvd80GnIuYKy0A
         nAiotgVphBOb+JgSx/58Gii8nq7caI7UeRRzf6sgcXyXMbyIKSrnlSZmZ/PxhrrMkOxt
         EBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521260; x=1786126060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2612fRRyGYG/lD9FKb+0lhTN80Q8+gljaqZgaS6Lcw=;
        b=cKrVhkRhhQbwKy5dopVOVft/V8GG4yWe2wnQhr/MmkbMI+ze7HI3EOpzUb2ItF7bo8
         23obI8ehLgPRBGRW9x9p0TrcjuRXWoUVz8jvT08jnorseE2MLGUbuQ9LyWz9DK02C6eW
         XROJUpJ2pZAHIFiI9F8gmJ2wHPKPuzjLvCSRNSO3KiPZ+xiQzzRP7yKws5Q0BTv20o2P
         f77pHlYCJEMg+Aiz+YTBkKar2ZS5bxyUiCXNrCXhI/bZwXxFpothyKAPig1HZdIrMa7x
         sHbY8Sh6QlU2M7uipIMKm8SI23pzIlwub3a7abzPGAPjzHr0si1jxuRUINvV3uj8bOKC
         mJyQ==
X-Forwarded-Encrypted: i=1; AHgh+RphyM6/u2KG3mz2luPwX2ocgRpBxigjHU79ZoJE3gqNG/j4a42keLF09OkZ9zdNnQORkyc1teGuKSAY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KabLPg6O4Soj7U0mkQLwm7BV23TC0wCN7qGiFdKzWMpHR/pZ
	sDJTsfENJSIa6Xj+RzJult0v8drJkXe2T/hNAjxobM4YToF/GQ73zVmOEEkJ3E7uvFNAVbqNEGT
	apSEkUu0WhfJFDcC5qlYDw/V/9lXCbbItlUQjtIZS2w3eYxdzL4CWlYuU4qMorpUD
X-Gm-Gg: AR+sD12c0SHG1XvonEN5u8CuXhnjOCM7SkMesSc/iA/Ew1ocYfWLXZgM3Qqhsnk59Wf
	PGUrSDL1RqycKc9aSMNV3lTZKAgjYYiDeyNl1BtXjEJLQyQNYJnf5A0i3u3SfZ1X3sDyaYOrSca
	WKQyj0YE+D8HURKZEEVrMg3mgCbOHaONwOgaZJODrwjb8d44aPqQbSMStj727Dscs3vcphTn1o7
	laV9yzI9gsXLE4DHup3Ghn4RdTJZZ3vOMwm1CuhJq8aJ7g1J+CgKgmv39vDtHTLEOSD3OWdgi4Z
	cJ9g/qhZn4xy6d13I5shPc3LtVv5FhD+bQbZI6KYsyrgbBcPzM7YpI/6R+NYBGNQVxZ9nP6MZtM
	liC3uNdmZJwLBT0ksnpU=
X-Received: by 2002:a05:6a20:e292:b0:3c4:320f:42f4 with SMTP id adf61e73a8af0-3c92a8ec9eamr719295637.56.1785521260212;
        Fri, 31 Jul 2026 11:07:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:e292:b0:3c4:320f:42f4 with SMTP id adf61e73a8af0-3c92a8ec9eamr719257637.56.1785521259780;
        Fri, 31 Jul 2026 11:07:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fe9fsm7069923eec.25.2026.07.31.11.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:07:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:36:14 +0530
Subject: [PATCH 1/7] dt-bindings: iio: adc: Add support for QCOM PMIC5 Gen4
 ADC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-pmic5_gen4_adc-v1-1-9c49b2eea6f9@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785521244; l=2813;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=XDRR7aZZVES2zWWZ6WdrsJXHYCx5Eg0S2b6tcAaOtrU=;
 b=eyEx5PpgmqO03+r4NcBGbSrqUUz2tWRd2RabPxljUE5wf0O/ucPGiqhU0/TqisFht5IMNobpu
 BnPfRAMk4HRD/BnZj4cvcs658iKls0sYlZTl9kidnhCrlh565pdfitE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfX4ZJMgGx8kXkt
 +UFBOqcfcpVo8F5ylS5vZijCth3FklbQXfXIWnXzTl9IBjdVzjkCryp1W84x8MvcaA/5ApRgDOX
 tvOY+mXh0f8LITneGboK+dypN7LhzTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfXyBOzHAXApYf+
 Vl5r8v/YuKhG2yh5bMdVNftl3TUEG+MM/NIROAlhikgNTxlGek3IO7yqT/QkIJEGZRGjf2jkc59
 KgJ1iY6wWE9f5dTbBfcbh46SSmzeVW1atmYr35nL2LiLLyWi6cIyUmPjKI37LlbY+nA5pRHMjN6
 uVmG4XuMuT0TxpxS7M0GDr+eVDamdeZcJJN+zDZbUSsHZ5VbD9lMMN+9BatPspVY2Q4rQwA1N5f
 SqZkhngLeQmRFCGVEtgRMqvnHjM52gx3MGJmbxA8IKQurq1bEy3QlXkI0OxrWGZWKsQiZh5lxyZ
 dn+dpnMd0oGnRiDJQu0XCrjQtn7UAhxlRkIdgWMuWFYQOxVvg7YoAmetTdC18qUyyqcjtwRb8k0
 YER2Ul8f3+wXqMBQVoZElUDmYwx4Z9vfFtDGcsgFkIG/nTc14nrGJrcOyUY2e0Jpasv2TzygPzo
 pfhmi1MacgcHaS7SCHQ==
X-Proofpoint-GUID: YpBWcL3XgILElklAwzdOuDLw7bybskcO
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6ce46c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6RJ8VYccIssSBGSfHBcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: YpBWcL3XgILElklAwzdOuDLw7bybskcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310139

PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made for
improved performance, mostly at the hardware level. The main differences are
increased ratiometric conversion resolution (from 14 bits to 16 bits) and
increased bit field width for PMIC SID (to allow communication with an
increased number of PMICs, supported on latest SoCs).

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      | 47 +++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
index 149f4af8f4b8..e79ddc2acca0 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
@@ -21,9 +21,14 @@ description: |
   All boards using a particular (SOC + master PMIC) combination will have the
   same number of ADC SDAMs supported on that PMIC.
 
+  PMIC5 Gen4 ADC is similar to Gen3 ADC, with some differences such as
+  improved ratiometric conversion resolution.
+
 properties:
   compatible:
-    const: qcom,spmi-adc5-gen3
+    enum:
+      - qcom,spmi-adc5-gen3
+      - qcom,spmi-adc5-gen4
 
   reg:
     items:
@@ -83,6 +88,46 @@ patternProperties:
           This property indicates ADC_TM monitoring is done on this channel.
         type: boolean
 
+      qcom,adc5-gen4:
+        description:
+          Indicates channel is of type ADC5 Gen4. This may be needed in cases where the
+          master PMIC has an ADC peripheral of type Gen3, but some of the other PMICs it
+          communicates with have ADC peripherals of type Gen4, so channels of those PMICs
+          need to be marked as Gen4 to ensure their conversions are handled correctly.
+        type: boolean
+
+      qcom,adc5-gen3:
+        description:
+          Indicates channel is of type ADC5 Gen3. This may be needed in cases where the
+          master PMIC has an ADC peripheral of type Gen4, but some of the other PMICs
+          under it have ADC peripherals of type Gen3.
+        type: boolean
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,spmi-adc5-gen4
+
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            qcom,adc5-gen4: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,spmi-adc5-gen3
+
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            qcom,adc5-gen3: false
+
 required:
   - compatible
   - reg

-- 
2.43.0

