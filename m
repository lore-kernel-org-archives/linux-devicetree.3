Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE03B14C3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081530; cv=none; b=eq7nl7VU5byhv8rQPwtj3WAQ1820auqLmAKGDOqVnCoTYgFL0fQ0G04pGMClUYyEvJwEFeUyGjezWgFGDpxoim90Wp4xOw2uB6joJ+fqceNcoRMju2fFK5ZAdwkCQBLt99h0aa4q5EaTfAIdxeKCP26844KuBDSYGGOowQsYUpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081530; c=relaxed/simple;
	bh=bAPfzRfBHzCxb9s+4et3S1Cn+8StBrf+NqoLHGPL22w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKMQMgC0lZofJPQsqM1/RAcQyT0hB6sGSXYw6RoR5Exyd312q3H8tGMVX7Sc7yzBQjyIe8lHjo68bkDeBlfXTG+nJ2qFwb2xl9vWaYdH43UpgO4RzSJpIvUCOYlkWUMWsHGTqVveiyiENWFe+57MctsXy04/nH7WXynLYkr3pvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzEek9sw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJwYxMzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzEek9sw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJwYxMzW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hjn5531415
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=; b=SzEek9swZ6J6/ECf
	bKW7lZmkdXIvg+fvKngL654mtW+IW6hRewwFFGe1BEfdD5UvcT1yxSJWD5SYImFO
	U1WDgy01dPEfig5PnVoC3ZwD2BE5dnjam0v5y71ssCYLciYmLgKyaKgTayxh/COF
	RjPs+C/RvueYvUBvj43UujPxevZdhtgjdnJ3aqUKbyl5iatOXlZCvNmI9ZzQRbrE
	pQ1i0j3XN8hoM0MzzFfjLnqmEXKdZRDEgjFalu+YPbAxMV3t50b3tWYM8f5pf/As
	WU5Cek7V/jBnLdcnX5s9TvRDNWCRK3X5IBCbohs+ViV72OkaWA19NDk3N/Pz66o1
	+BLruw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1rydr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:52:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a81c1738so38547455ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081528; x=1781686328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=;
        b=RJwYxMzWbHeanPEgJyXPhIUm3qGHmS2mIVY1CeLtZ7UkJR1G4siBptg6POGIRbqajm
         gehatadznmy1DpG1GusmJqpYgc9/msKLpoORutKbqA4iS48qScUx3cfjAj+JSc2dLrqd
         v9mCd1MqsZLFer5xQEw7R8qLD+v7e/rnGrnkcT/uMOoSP+ybHXXwZeznsceUWSt+tQ79
         R+F2PiNU5Z6BEJIDTR3HbN20ZWoa/+Z3x0jr4gKtCHL5ddkkZEzTM6clVXotEC0N41eO
         IGPk9XAMvzxb6KyL4fCuqizofpep2KtBK1hWMiDeeBvK1KHF7mdJH7g//rvqVuA9s68I
         wnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081528; x=1781686328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=;
        b=iJKDw9z867byDSEcc4uWj7sKe1q8loQvyxImfJqe+yuwtE66jy/h0tb/a3Wehkquum
         9tazHAROne95om8/T3fU9cWDkymVEo3fQ/TIt2ocek8BkXgPtT7fnAeEALXs4IgM3led
         cD/hjVEyUUJZryui2uT3+it75BLdQqZR4YF6Jnj1+C4ECHw8zWZYx7j48h9oK+nTkfUw
         5fdNFoNhSGFOhKj/uCUDrCtFz042aYT/fUsOufQBWESwAffV7ExEZJtQQJTDM/mqgc/X
         3Ob44euS+2fX7c5anKuyxwlgjRuIoO7GuzE+EdzIoZFmlbiRqqPVZ4YTVh7knilvBtXx
         5yRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JMFl1Jhqxv7GGOS84f68WX7o50mzC28ARPQ2gVYpI9I7qZpQQ/4BSFAuMKqieLPOkUPCXdXhgFj7M@vger.kernel.org
X-Gm-Message-State: AOJu0YwSv34h5lJySxHAXVIrL88xLWHH1EZLx+68ncr7rAtasMj0dMJq
	SFZHukO2dnT2lEf3gntdd7P0+tY6pBCeV7A57uXPb2k2edF3uM1ba3QSLNBSsgvrJBuJ05asM4l
	GMjXuc9zpLLOhtd2SrFLLhSo2iez9ogXYMYtqP5vUPeLk4PnXJ9PdZRkBIDwibn5K
X-Gm-Gg: Acq92OHpNhMr9lxrIRMWnHuxD6foW9d1iiR0WcLFSf2p0CUtoSGtVFhI2b0n7pKaBNc
	FqTst4RM7/cfhr7GjMRFp5kfIPiQGq3UTHXEYbjIAl6GENQzK2eYgvDelAJJs7acXVrN+D6oS1P
	7snctF+n1gCmd3+X5YX6530WGE6c6KqzgG4Zvjo4Gm8JmjDy7ttGvcgKsDACSs/66olu+/7GCEa
	2fTmWyHgxvLmdznH9JdNN06Y32kY9Ol8tDAZU1pmKe3lnJRCz20kDtJHxi6IYMw0H326bEa/5Lz
	JODSUaDGGqGjOboXaZFnBSBj/gLek1S+B91DJebWOeR45tvAbn2c9ckMRifvPSxwMMEI4wzehWw
	gGEdzEg0iiFJfUcV0AGJkV132Cou179e24XU9frEcV7wtoyDsN3BNVb1mD1WkTurlWJlIefUm3Y
	KXyJzSZaaRSypo9qo0J07i+jx/e6hLbkMrpMWoPaq05D40nfJp39x+ek/g8Lg=
X-Received: by 2002:a17:903:2b0f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c1e79f68c3mr292218085ad.9.1781081527652;
        Wed, 10 Jun 2026 01:52:07 -0700 (PDT)
X-Received: by 2002:a17:903:2b0f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c1e79f68c3mr292217545ad.9.1781081527194;
        Wed, 10 Jun 2026 01:52:07 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:06 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:29 +0530
Subject: [PATCH RFC v7 2/9] dt-bindings: firmware: arm,scmi: Add Qualcomm
 Generic Extension Protocol
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-2-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=2124;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=bAPfzRfBHzCxb9s+4et3S1Cn+8StBrf+NqoLHGPL22w=;
 b=3IHb8xgfodeZAAvSCSF4qHqkSYryDWxcbJLlvj9a0b0v5bs3O9BHpGV7cJ0/YiWVycOereh7W
 bssXFnSFdxCBPUYH+4pHumxvGDs/0WVyTQFrYVc92HPIzicZlQHM4pP
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX2SJdbjx39fQp
 NsCz9NhcHGu6HYjcRydE3L7G5zEeNDQEuks3u1xfYjkYT3bZ8ofPZ0lA8i43d9x7HUsnUWBJ/P5
 I8tdos+dKevRPlyloWtWk235HUHd+dQOyrqiNJ9Yh43/F0p0fyFiKz4l4RR7LVBlTExUpSNAmW5
 HoQ1fEDP0RIZAbFS1I8i/hSWwnNCPdAozxn3t51xNixjE/wJW1KsARA+F+byz/dcP3W3Bg8kPbF
 bilCOIZbjLZP8z0E9/PN7g3noky5rbOzF1Cb0PYL6APRW0D3/Qyq1fWzjltBAeuudRZRdQFfpGH
 S+NNtQbDSWbbaREPqLNuHsr9NDwJgPD4QQ94fZk5wrId6MDaN2WtoxKpIW+uMMXjxmpMDSRycNO
 TrZ/L86ryGFaPQwll3dTuEdj3S7B87OLVJeum7Iw9mDPC03+X1vsoCTFpoNdXk7jt6/LtKNWwaM
 D5bTOdmtQf/hcFGlrug==
X-Proofpoint-GUID: bEnkqnMKapQoo7ZfuWJ5B5eRKxh6MMxo
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2925b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=4P7DloUKvxegLOL1_H0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: bEnkqnMKapQoo7ZfuWJ5B5eRKxh6MMxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

Add the binding schema for the Qualcomm SCMI Generic Extension Protocol
which helps support Bus DVFS on Glymur/Mahua/Hamoa/Purwa SoCs.

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  1 +
 .../bindings/firmware/qcom,generic-scmi.yaml       | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index d06cca9273c4..aedc57dd3b38 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -24,6 +24,7 @@ description: |
 
 anyOf:
   - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
+  - $ref: /schemas/firmware/qcom,generic-scmi.yaml
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
new file mode 100644
index 000000000000..077653dc1cda
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,generic-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm System Control and Management Interface(SCMI) Vendor Protocols Extension
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+
+properties:
+  protocol@80:
+    description:
+      SCMI Qualcomm Generic Vendor Protocol which exposes a number of
+      Qualcomm SoC specific features (such as memory bus scaling) through
+      a mixture of pre-determined algorithm strings and param_id pairs
+      hosted on the SCMI controller.
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+additionalProperties: true

-- 
2.34.1

