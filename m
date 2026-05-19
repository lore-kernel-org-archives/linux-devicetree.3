Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F130FC2E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210938; cv=none; b=to3P06FpR4xcCZquAjAZsxBAy0yYGicLBTL9bF0nEj2ajsakuJwxfUM67ED9clujfNHkNVcOHEqw61hBj0Lr7s5EjoV/9W0AvXcfxjhZHQoj3jzb+V+GTUO0kEzHR2xWjtAQxYOFlKQn/lFsOKUasIEmwmRlqtHYdrOXdJ0jBTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210938; c=relaxed/simple;
	bh=Q8wHeL91TSb3urvpRCuxQfEFd1CujUhU0rk1XYHwsiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXyRTOqEEPnG20ZUQtMWc+GBQpH5pTzFddRtI7mjCbyT9mP46/OxMmvRAm8iBkGMGELzQ8rRgqKSs3dnOd3AjxtNow+Cy3tbYDWAFUBVfuxl5BqSaSZWTKq9nxCy7PE/HETDD9gKuPdAol1Y1WLSUBtXF8j8czcvUsLfxAkP2DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dR+zsZAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fq1wtuiH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dR+zsZAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fq1wtuiH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExied2144214
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tOITleWCuvp
	i0+dYRoQBpEMVHrSEpgzzTWuCd/gwHCw=; b=dR+zsZAIJF3UFECu5KsfUSmTEZS
	JzIMwkClVRN6LtkUA2JYnGSR6Qd1a/b1rtXlu/RcREa3+Df1hN4fxYhDY5HmXfhS
	qhQCPCjr1RB0yk65qBUiKzEQKziMwgzRarx8oVOKvC+sZ+YcaFkBSl7h+yB+/AvW
	n6gbKLIOx6l3MGI3CS7VfLdmPiUs5wLecXyl1WfIeep55wNhs+cAVFuTFrp7tmNs
	E7vIzY+G7cC3R0suVoGAG6NlYvHNc6tvKoDlKxdbWrpsD2afxdomVd4g7jFNdDCP
	TaZKc/MszB4voeIf2Wl40LVkDS89dWAeOQUicoSPqINO+5n3eFByNM+CETw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tgnvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c799ee56bd6so1962950a12.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210936; x=1779815736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOITleWCuvpi0+dYRoQBpEMVHrSEpgzzTWuCd/gwHCw=;
        b=Fq1wtuiHJ66IuJ+/tI9ckhYLv396UfU19HukOtI51jMRTHDJ3Y5i96dvmrZX+XgF39
         dCYpJcXc9tjfV+rcCRQub+TrbKtn4TnUusMxVKcsTSE50i1vvKwkEN8ELpiGBarXP6sX
         /64pUGUfAzQkv1ba4BBjHo+wwDzUlmKZUxWmbVxDpnF9LE8B2obbJ1stYtNMtZV7JxVX
         Ed6+FdwTUd42f1ZhY1rI03Lgg9KBov+OWpmaJ7x69FxY91H2iaGX3va36IHc/kY9JVhZ
         fEiDLJ1/O2Adp/tzLS9FVBlQ+9FpBGuU1vIWn5kpaULiStSWMyFYlLJqsuVi5C4MpTTH
         WyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210936; x=1779815736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tOITleWCuvpi0+dYRoQBpEMVHrSEpgzzTWuCd/gwHCw=;
        b=AsvWByPTxoXRvbGfMUr0AyCjOHL/v8A3YaN6DpuYMB01gX9TvCGWv7B7VOzNPHSPs2
         DjDkjhLKpyK1gJr64iUVNcg8aK/fWvkqefpHt76NWyVWSV8C+hZURwIhD5QPT1dytAoy
         jBvVIZe3Z4FKQ1oFkf5fP0EM+G+kLeP4M9QcLVijZOTo2+dwPdMaTL5xQvmpGRLb6s4C
         u584Ey3ommHHaHxSd/t1R8cTFaB/awY09ZaCleQP8xTctTUeCueQTiSnl0rzUguBHF2X
         8NXs3F0y7eh1vfNuMpGaoZIeC4ioXUBZHNq71PWSRBnNBpm1NUnkmyUvNFrwxdFd+514
         z4dA==
X-Forwarded-Encrypted: i=1; AFNElJ94LpYrtwiF4wbW4Pog8EP0p816BsyrDnO5ydcjYK8aKiu04KIX69Z8qGBhh7UOYWP/p4bc8r5lUH+I@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6u5rZ3w52+41KV4ZuGiYO14UrxICdr2LSBOs6bK5rk6FTGWut
	8TDdMI1yvFDnU+chvhcOKLGfUYZSshrIbOFlEnMT7LJv3K0HjTh2xr72nzoQgpK0UDNnq9w9Qyi
	vmK4uiSLYMK+osUa+W0qb4K2ONZmBLgZ/KWSeMNMVzgnr7jjRul90Mva1EKvh6uNJ
X-Gm-Gg: Acq92OEMuXil6D+7De8tNlacr6QFQ+Fi+/mgyFnHyJKhtpzTV7G6hADdqiTk5PX2qpu
	/TLkRxLovthsdFDs6oJ7aVvQ4hpr/X0I2xeTa1a6xsiza7ToriL1iCU+v+f11eiq3+IDFSwNg3e
	m6E8gyXoTWz+Lbzrfx7+JkDOHgvcrjzFiBfR+jT86GTlVDk9kNCwTTfDHsz8EbS4IUCMR9Q75Yq
	SHIUigkT02O7QsZQLGagyzQbf0+jZ0B1kKp/D5Rz2m+tJrABvWj+3fhB9HM0ZbF7FNyTteG2rEw
	Gk03e6IzeygQ1DvhHeXT2hC9ivxh1lVKL3DOWNpSMqf7c7x2VQC4te15fWxyrFucU0F48QVtG+A
	n/b6IY4dPLEmEI88JAfS0CnenyjwDX3GFOewus9YlQ2XKjsWM
X-Received: by 2002:a05:6a00:6c9d:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-83f33cf0bd2mr20263873b3a.29.1779210935039;
        Tue, 19 May 2026 10:15:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9d:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-83f33cf0bd2mr20263832b3a.29.1779210934470;
        Tue, 19 May 2026 10:15:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Tue, 19 May 2026 22:44:39 +0530
Message-ID: <20260519171442.1582987-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0c9ab8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Uf9RHLb8GrDHKnSoJrcA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HQcNCg9qU9P2Mfhnd-tsH4OLJGRDb0-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfX2uuW4jMSZwqG
 r5D8a+aaU9dyLvXpA0fV+EnR10/gxdwlT2G3SAhPjF8Fo2MR6l+9xtA61YuXX1w0mQzw7V25Eg8
 zKSBNBm9n8oa2xgWtqt9wBPXDMirU5LvTRMW/8yYqo6VtMjlVYFRE0uyKxFHkmIaywkVk4RUFJ5
 /qlY0hyV9pLOswUxpcJ5NnQ9ddUqxrc2UiZ5O42ODqfpBIVhQS71M+15oPtHKRDfCi4EvXQquo/
 Rd/Tu/yGpGal3Y+fRjboDBb7wScVI3LKu4QL/8P2fHSbE6/w5EnXE5MfSWcpUXIq5JNoJervTmF
 2XmXbEWWTosBlbuFG3tZNKW2CtwO93ct5n9gUXIkkmjq5J8hLU8EHcrntid4aCkAaNz3FoOkKS2
 fMQ/jY0q2gxMl40Lor9fzjy78v7/a0yk+XvT3frzDSGXNUQV710nElJGy+qRUXk5XcKzwo0R0lQ
 z0RFTGO5MQgrdfiwWdA==
X-Proofpoint-GUID: HQcNCg9qU9P2Mfhnd-tsH4OLJGRDb0-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190172

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
 to deliver it (USB upload to a host, or save to local storage).

Add a 'sram' property to the SCM binding to describe a region in
always-on SRAM where the minidump download destination value could be
written. Boot firmware reads it before DDR is initialised on a warm
reset to decide where to store the minidump either to host PC or to
on device storage.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/firmware/qcom,scm.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..27422d00b8fc 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -129,6 +129,13 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
 allOf:
   # Clocks
   - if:
@@ -250,3 +257,12 @@ examples:
             clock-names = "core", "bus", "iface";
         };
     };
+
+  - |
+    firmware {
+        scm {
+            compatible = "qcom,scm-kaanapali", "qcom,scm";
+            sram = <&minidump_config>;
+            #reset-cells = <1>;
+        };
+    };
-- 
2.53.0

