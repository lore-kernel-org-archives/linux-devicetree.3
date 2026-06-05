Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7126E3FE664
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 05:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638355; cv=none; b=AYOr2S3h74Qbmo1jL8IYtzvOA4GJJAykWblaR87csOhm98NdjgPjeusfW4gr+IcLT10pkFC41GCdQuDz9XGW36AFvwiMGKmXCgiyEJaYESJrZTFBo4/FuMAahYpqSyQYgVhpXohNbWrns83wznqPTf1VugzGFv+v08bpphXFEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638355; c=relaxed/simple;
	bh=xYfGJGzqi+Ph030q1iDRh6gIu/gZ6goid+/tClxsst8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXAikIZKwycEl1k8ZPu7nZ033A7/bLbl0QmYzoOeDrIWD1g/Vnu4DFwCzjp8Iddqq54kywZWz4wbwNznRMnDAFmzZ2C/dm0KVa0hryUN2GL+Cg5AbBz8KlWtxcfKWLdMFwNAZ63k2DigCoNbxYX0LdLImwF1IsrT52JSYiGLbmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSAtWOZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7oLRN1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSAtWOZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7oLRN1c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6550UBCL528946
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 05:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=; b=nSAtWOZzGBhncIdI
	QGepczeZa/zUuIpTQXCt6kQ79VTq2vquvd7bjsAg6N4fyo6rx3pnnza15G8w5fvQ
	F3QSTDazpO3uhXNWiqVSzCofERjTcq4riC1ub50rySFuzQxTjwCS/dJTL1zY2S6A
	1HhqFHA9lUPSX7WLyL4EzcdyFSlhhUOasp1G1V/nWbPmTfVEoFmdEuwSQJF0Q7PC
	jZmFBykIs6/GJl9u5xE/mlQA8EnwQXFoT0EiFqfTuTEccKOJSpQjg0WjxfZtU8iy
	4Hjcyj1tnJ1ZIU1QnZXSSUE2ueMs8DLlY9bH18QXZxr10I/aPtP7+7zd1R43axpA
	nEBD0A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekbgdudk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:45:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso1431287eec.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 22:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638352; x=1781243152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=;
        b=O7oLRN1ccRhAMQZO9XfIrac4Ly4yEM4dRXKfb9frMjPswDRHYiktxPItjTGq9FHD8i
         fhKBg776+zmgcDrIGtBRxaqnfhPxp7H6zE+mp7f7V5Cb+z5y7NeT5BXY716y0bnw1SVK
         lCk7B60DquXMEnZ/+auMKgkusuJpxWX8JJgNYoTuHUjY8o3unxLpa6ewjdis5/4WD0Cb
         GQPQVMi56b3nkJQ2AJX64xia6ZrcGDOSjHb+frR/XfvwMrLaKV9dlmfIg5AJ6UXjuLsY
         chcg0UnKFvzT9m7JuroHGBEFtqtAsXZzDSolshvdE88aSKyYvLN3qiYISGtHSQf92Ev+
         rFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638352; x=1781243152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=;
        b=X8O2PUXm+W06mWlI8Xe7/qFxvVg/mcgZ4SAecHLY3Ya5l753X2JECQxDWZ3VVpEjna
         HWKagrhsSjynCyAY9Qv0IAtGW5pdrzfQ3UrWj1M1mUMjdoYnYPGhaQXQzXgSbvb8H70u
         w6pnThkaHDNVzYFWRbjsaDmoJUvdseR5im6fyGRF2BcQ+mlMco2m9cSZUBrmJwjeiBfe
         4k5mEDOlXb9dWRsqdQRMSR0YJIoga0iJ4ClMEPmoNEwXTfQvffp9q1somdjG9WU/YgLt
         ZQQGdV8yWr6lEMaHr8aVT3E3UXocg38Rf4Uk2oiMp/T0NohdeAlp92k1Dn1GwD3Us6BW
         Hswg==
X-Forwarded-Encrypted: i=1; AFNElJ+LB495mdMcp4+VmCbzm5Yx9TpXC437+otSQtuXt3e3P2IEcHa9n/RJBLpxX3ysssMO+HBNssPBTinM@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdROgH2DooZbkknTQXN/DW5qRP0LHz3Z09auoyX2rdx7+/H7v
	tw9N4eiS3SplbhIlKrdE54hdlPLcaf1p+gQgfR+8fVkLmaMwoPGBeNL4+QUqFo6e17Ovwk4mQ0r
	Nt6hX297XeRhTjr6pJEmyt4JMLcbYvYhp5GIJnrxt2xBYTLSbIm7Ck7w34MKZ7dtX
X-Gm-Gg: Acq92OFZgA/rOjncxPGkSnpZq+cvv6E3k14cMyjfCK9CmBE1CUCzpgo8vVRcek6Jl4s
	XZ7lULJyt22SxM1omscw8VbgdvRgyn8RDDcJv3xFTUKFns8S+l/3uhZKtnBnKso2KTK6qs8iYHF
	C+scSHIpnl/+6EX9nQtjrI8nijifikngWgNLXnbObUmOBuytlwaEBFt3iVXnhZEZXaQGIYwD22Q
	er40ihBglpDnWNvrTRm8C63c1lfDU/Y4SyDNtf5eX5Xrdm6Y3dr6WY0fCT2ZjIUEJX2FBOAwV4i
	toh6tlB3xlv0ZlZ8RI5aulT2nO2O4y5SF2VBDkAiYG6eMu5wqd3xujUcSPdoYfIv0p87Ueqxot/
	Y8HW4E9mJLwsBrqVgYO/xzbN/X6vXFdYEtq16ojAZQsMH1ze2erXt6efFRJ+4sy5x3NhYQZNBZO
	W/Sg5qQ4E=
X-Received: by 2002:a05:7300:8c88:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-3077ae9d56bmr987099eec.0.1780638352435;
        Thu, 04 Jun 2026 22:45:52 -0700 (PDT)
X-Received: by 2002:a05:7300:8c88:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-3077ae9d56bmr987075eec.0.1780638351930;
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 22:45:45 -0700
Subject: [PATCH v2 2/3] dt-bindings: sram: Document qcom,maili-imem
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-soc-binding-v2-2-21b5e9bd1aa5@oss.qualcomm.com>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
In-Reply-To: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=829;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xYfGJGzqi+Ph030q1iDRh6gIu/gZ6goid+/tClxsst8=;
 b=FeafrsqYHCEo46xdnH9cEd77S3l7arVCzxflAoMOzQZhD3LckYHw1rWcU4U5xxoMjmICvfV3N
 AOcrSWFABACC6LKVE4nUf1amNc3jZz9J5CBodevDJ8uP0EJ/8pYccmp
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: V0hUlVXjrCNGcenczrnDlv3BO394x3gw
X-Proofpoint-ORIG-GUID: V0hUlVXjrCNGcenczrnDlv3BO394x3gw
X-Authority-Analysis: v=2.4 cv=a8cAM0SF c=1 sm=1 tr=0 ts=6a226291 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jc7a-Txr_6JP3MmN458A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfXyGvzTmYFpWGK
 m8PLXp82q1FfsK4CMZQ6bYm+Z57+dIBoPcwV813jEQdMk1DnC1oDm6qlvu5kX7LPg2vQAnXUbdq
 IxKFLDwqptWi+JcXbucwaSZRj0X24GeFo3kEUmormToklei1RWIGxjQ0zSkZLTlUE7srV/xljsI
 v7BwbRdL5ZYmnsYuz2x/BuHpgXxQzmxXg8GUwV0Zf/mUlZzfMuvdus14TuHhnrEvo2yABSLjXvE
 8w5TWvar/7RDdpBnrACBByRAZm+YrwVS6Bd9eTP4vZgnRqeROVdA0UmBMhTIsjsiGGW6EMrJ+m5
 2JaZKInFvNedzgi33XgiKIeyGR8ZWo4U6CJtr8F04obkYNgiZIvi7CyJ4tMDtidZereTJa3JwSz
 aqW4UxkyB0UCGfHIOUPGb2NA90FEbrJL404Ps8cQLOYmzzGcm7nQ0mfZ6CR4My9c2dth6k9kd62
 BAXmQ3voizXTbdkbyTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052

On Qualcomm Maili platform, IMEM is a block of SRAM shared across
multiple IP blocks which can fall back to "mmio-sram". Document
its compatible.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index eb695698a03e..14a537e82a84 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,7 @@ properties:
         - qcom,eliza-imem
         - qcom,hawi-imem
         - qcom,kaanapali-imem
+        - qcom,maili-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1

