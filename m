Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAB533064D
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141262; cv=none; b=HdR9XfTG+Ynw7kqjr6o5QL7zksWp+R3X9PJvKItp3nbDpXgE71QfiWni9jTgGb6B8Dx5rYctOnYWdY7GrCsp9ok4eCapTBHI43sBb1FPfxLGBVdQ+9TUhkFySWqX2X7CNIPmy2MV0+Zcl6MO8agfUaE3br1pFGEhYDx1dJAbvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141262; c=relaxed/simple;
	bh=9Qh4fmkenOmKXsyIaxgv8V7EpyQ/2U8vJ9aklo1RGnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e92ePzAN6SCg8skY1yEtwYmv6xh38jwoFAd8fKj8DyB/BBerAvBoQY86NvRoufVVnkEc8H7cvxY58AvvjGI5gMBZo52wcM43Sj3z1H5g6SYxNx6UG4ygchKV5+1rTvxzoW8xjyaaTaRYpHrga6Q3+SNhxgCao/8UbVKNcl2BrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLTIG/vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxmDRslm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLTIG/vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxmDRslm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eEkW1669703
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V65FA4kfYsJ9drVF7u1hWLUsFI2aVhl4lTM4wTfUbW4=; b=KLTIG/vvRLYNDWx3
	Yqm2ujYBjObiBozcKRL5YnQgBw83MxvSZAnp2tXXccgxyFGyjud9z/kt1dXdfMmY
	N59Rwd69rbwyhTFIUH5TpSvygePJTu8d6CNwIx0dHf98uJvkZElaGaSR52fGyJwX
	M5k2o6LSov65RKwhxY2VxEN2V7eSj8OlemrONjyrO9i9WyUa+Mu/E8ut/zJX4LD/
	rR8gpij6H7hbvLbPmKjmPoPWGKdgMVpYayknVOPv4RbhvfeihX14rLcKoHQQS13X
	3lS/WOI0YD/5CYlEwVjR9w15wMPsF/kSqXDxFduMo/z659CX6eDS5RNva9zzqoHN
	vO5Cpw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0w53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:07:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36603ad6709so622196a91.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141259; x=1778746059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V65FA4kfYsJ9drVF7u1hWLUsFI2aVhl4lTM4wTfUbW4=;
        b=SxmDRslmOw78NAFOrbS+CKfMuqhFpvyKe7FkwRV7LUBLMDSOxSEVFulEb+ve1FX+WU
         9XzTpojQO1KrdeDXMKX3XcHbAVBYwA8FokJ/musyQR8CJSnsfoDmWqAGmUsSiOcSThCs
         nzT7NefWHq91Lx8DKtg9m5ZXYgYTM2SZSDgCKm/ppRHeKXvcYuW/SwcVA2JmP6FkvW4B
         D70LzR9kRBzh/I1UP81K4abQfdmppTRHWlOqy5sjV1zmjb6epgbQkrU8aBN27x/Vq610
         rE5oI2qGyKEeS1YiilHnuPDDIDePU9WwGa8tq46lEyp0V0FDkS8dTc4UPfecaYg+Ncm0
         MDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141259; x=1778746059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V65FA4kfYsJ9drVF7u1hWLUsFI2aVhl4lTM4wTfUbW4=;
        b=P+ju8IzQjlRGRO0P7rfGdXJYvW+ybjb2RoUVuencMrbokIC0TmDxgrtqRf0qX+g8oE
         9+Fqd3VmIW8jVMXjPmmVktUqYre4nRANK2765SZd4o1pup5/S+BTkYBQHSRPrBSRfVOc
         d3aMiPIUMvVGigntEf55AdoxWQSLvnCORJU7ZI+FhAmCwF1gytw9qsclpotvMPo8evj4
         WHghAlz7TvS/XeIC1h8aJW40/JfrWCbnRIm0G1IvHD+lfji1OogyZ2sEOEpCrYaLxkeQ
         a9Z2ij0RhYQpV5mtuPjNu6rB+npU2uDU9VTERrvFeZOtSoTf8GM7yadrZdGuQwkRNOZl
         hGzw==
X-Forwarded-Encrypted: i=1; AFNElJ9olVr5tZ8N4gZhpPjh6bHPQExb9kMCYQNnQdNDwltAs8R+DqomXyOajGtbd5DbeDls66KBDMbyGebd@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzeC/8/Sku81r/xs/6p0fwPW1HiMEzPaDjkWK/1VkeWg7k+CD
	vwIbg/AXgDIUC/S4CZzLDdHqJ9O/W7M47A8Vw8OXZeJWwVFMHxoRVZdLcuG3kMbsZ8C9YGDYTHI
	ouhIxTzSSnfkDe3hmiZQKChB9X0v7nA6RMfPk+8X3H+/rXf062sCE/XbKDbpNvfLX
X-Gm-Gg: AeBDietz6z+g2AITuw3cXZUx+gfZH9O29NjxTUQ9RMoFnTec2WJ0AJrdTH/0sQ5HqMT
	zKp3dVc+/NTyezoTFfefq3pm+VN9Ns3BRADJzmzaRrEc+qD0FMGyo/80YvmC9i0xrS8Q+bwwNh+
	wRsV7eH8iGbMxPu0EaIKZrBS0DOgFbbXfJEhI6gBCZyyiyolQQ7f6xXRtibkXiNJL+gKl7dRDtH
	yc6yu6uQvVQMLkEfwv8EXqPHQ01LlNVrMfjREg/pK38Ha4BOpfpJqf7UZuPug0nrE9HpbyJ3+70
	ZXn6T23aVHbfVh/sf7Ntt9MWVRAsh4vorKJQlCwjHb9KcfyK8nQa22ha89P+J+w2ynr41l7+14n
	0zRsXnncF1xqOX93e91jiiKpgE1x/Nbw1j7BcSWRDSRcDpfJ0wLgC0Xjv5fw=
X-Received: by 2002:a17:90b:2248:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-365ab9b8c31mr6669205a91.6.1778141259407;
        Thu, 07 May 2026 01:07:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-365ab9b8c31mr6669167a91.6.1778141258861;
        Thu, 07 May 2026 01:07:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Thu,  7 May 2026 13:37:17 +0530
Message-ID: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfXz5UjsSShUlz6
 h3jYXW2VL3ydGC7ENcMu90Ed9t+EBwzXUJMFuxqJTcsyAxNSJZC29rxMX3yHdQEWTPxDlK/cL3u
 9nxbeQvIjVSgFZD+TyHgMBU3QuT6alvgs2INosa83Ye8Iv56+jjZkFJUi6ZXS/ryF3TSwAHJhG8
 jOtZsqk6eVsJ9L+n0saCpwjQASwakJlEko8KWz5bite5wHzdGF4B8PyTlRUTTIL+VAQIBIS4ta0
 vgmAcqxw/Gyjgbsol4CMAKY5NF100hxMVbQuxK6+2KlvbV9OJBoLoES+wjEA/oYOnVSqK31Q+XA
 qSaUwHCuBkS4kZbM6HiI4i3sbJfcEAjxPE2JFa3lcT4lWDj2mpbcKisv94zR34nn1jNHD5d27Yi
 cer4ElgsErzKkaIT7sr7ZsXz0nQK2YrfJkfV/frQjmRmfpmxPD/zdOUrNlDSBrMofiGxY6YmaYD
 tIl70eNGuOenL+tOceg==
X-Proofpoint-GUID: VBR2y2-RJcY4Nmo8ZEk1sZB5EZkAOekt
X-Proofpoint-ORIG-GUID: VBR2y2-RJcY4Nmo8ZEk1sZB5EZkAOekt
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc484c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fNLuE_qgFUpq_f4Vv_MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
 to deliver it (USB upload to a host, or save to local storage).

Add 'sram' and 'sram-names' properties to the SCM binding to describe
a region in always-on SRAM where the minidump download destination
value could be written. Boot firmware reads it before DDR is initialised
on a warm reset to decide where to store the minidump either to host
PC or to on device storage.

Most of the Qualcomm SoC supporting minidump supports this, added the
kaanapali SoC for now.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..6813081fd74a 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -127,6 +127,22 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
+  sram-names:
+    items:
+      - const: minidump
+
+dependencies:
+  sram: [ sram-names ]
+  sram-names: [ sram ]
+
 allOf:
   # Clocks
   - if:
@@ -229,6 +245,18 @@ allOf:
       properties:
         memory-region: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,scm-kaanapali
+    then:
+      properties:
+        sram: false
+        sram-names: false
+
 required:
   - compatible
 
@@ -247,3 +275,32 @@ examples:
             clock-names = "core", "bus", "iface";
         };
     };
+
+  - |
+    /* kaanapali — minidump SRAM */
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        sram@14680000 {
+            compatible = "qcom,kaanapali-imem", "mmio-sram";
+            reg = <0x0 0x14680000 0x0 0x1000>;
+            ranges = <0x0 0x0 0x14680000 0x1000>;
+            no-memory-wc;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            minidump_config: minidump-config@1c {
+                reg = <0x1c 0x4>;
+            };
+        };
+
+        firmware {
+            scm {
+                compatible = "qcom,scm-kaanapali", "qcom,scm";
+                sram = <&minidump_config>;
+                sram-names = "minidump";
+                #reset-cells = <1>;
+            };
+        };
+    };
-- 
2.53.0

