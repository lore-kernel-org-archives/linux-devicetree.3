Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947868;
	b=32fFjQmRH7HuvXBDpDQCrfiX3wcd0bz2p6gY9fcBtydm/Tk78rmP+n+jxF5PDC4oeo29
	 yrkFZtEE1D8Ns/fjrMSlOpAF4yTg9B+k+s7vYBvIvRR/avVVzRNDzxF+37eBEa2D+7zMP
	 WoagDhkF4KIJm1OxRWqW3EfJDJ0h9w+/nS/LvXjaRhdZEKQJpg2FoeB+Y4vNGwE7HII4T
	 tgcZjFC/oexx0b11fXhbPqRydgCPve1gNL5JZTaIGnwScV21zeT5UENSFEOGtxR7nxhjs
	 coDHJrPpo6HH6wZfQqIAnHrd4/fpnvKIJEsigJiidTXpukK9auAlHsnU1F8i5zVmnBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=2u0jtWEHTOwJQDB5PdsWbvzGaIAEbhm6q9ZTWhED+Mz8NN+8IypQYBthFnpRuNte75rW
	 EJ6JexQm7nD2eT10jBz90AmKiiR2eSql7pI+K4dxfHAphgJaZPfX9h2yOcb4NNHMV2U68
	 f7AEIwB+w2AR3S3EMek4LCxdQqAKPGkiyEdAZ+pMf0u0AgjZS1VWJPptVgBCm8HxVoY1f
	 QtEgT3o3AgkfWb7PfEDUyGHC79mSZWq1UamrLGEuM5x6yCDUT0d0ZKWhjfHSz/T1EwsYT
	 P32UJHPLktxCX3+30VO7GPIorkT3LBZOcKXQ41oQW1DPyorv4nX0zQPzMYeuSUQ51ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA73606A334
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA73606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6403ta2265175
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 06:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=Pllk6hPCzbgjTS4L
	Lb3qhY1U4RExnpmitgxHB4Acq9kf+EW1lSTEYMFPkm31u77F7GgpkWshZJnUDL4k
	DrfKbBkj4uoVQBY+6JissiFCgAxJjdLtIVEmPaH5+HUZ5mUOp/upOiN+sPHLxmt9
	EPdf+bdPg0zUfYMc383hHEps9/5lZnYvXzXi6MpIPs0CwAVv3kjr6ckwM0nK5NtA
	SaQ9pdftVfLPd+oKZCPdCuhW7oCVdL3k3UxNvhaHy4W7ERyyaiX8uz1/ZUcXQUOn
	JgDs/sVMpkjF3dhVG2WjiyXW4eik8Mugx7LpxdceZQ6kUH7vdhbFd4Mx6uZuvjXt
	mvlm3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9hdyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:51:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so357979a91.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947867; x=1794552667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=frBOfoIqLFhb0tr5lzaLQSMpMDYTPUe+Fxakj37QjglurscRcrbnyVG/77gjVpkCIa
         DgeQMpGpQn0EtQRA9ALXPKvgVy+Bj+BGF7zdPECukaIj/yLzgJZnqOq0IBuJh8CLBHc1
         lnaHH+IROQgwCnBzPh8qsc3J1iRFFTKeHTBWrPLGdWi+8/ZMqfPKpPFNgSW3DPe/yG1R
         vC5qUeuNQda8SKbVyKptd92TvfvRuRc6OiiY3s1i+5V+J+OIGgpsyk6ibbuN6br61FmT
         p/X7mVl8b2IxRiZk0+SeiyDlR5HnaAdMwEz8jWx5f48AmuLI4ToxEq9i+8qSZav0WhJP
         heJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947867; x=1794552667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=ih7NhZVSHRaLSx1EzCm0Zvcqak2OQH4P8TyC9zJ6SV8oU8AOH6cXKh0AIrOUr+TG/0
         GGOgPT12fRRfCYACS9XcV2BkubzxdPNiVeZDvInqYRbQcCKtWGNsRD/56FwjP1JDJPbq
         K1stYZNYmQ8WSP/zOSe9BWPW5Fp3uyWfxjLCRMwLMZtEuuBWZYuMeeoG9uVQc7YcFO7j
         +PmxoinD0V8sxT8xsABiIXNl3KWoL5NXtucoUq6VJJTlDPXTxjT+Yazn/aMq57bpcKfD
         1lTyrIS/tpfA27izv3sZ2BaqSArn9oI49FQU9IFTvrd2VkAYlKindNhqSX7KivrGOWug
         z4fA==
X-Forwarded-Encrypted: i=1; AL+hErGUHYcRZyVZAnuFAyn7dbiohXhYVkBQd77Ynq6K3GTn2Jpt04cit1JuAjPqc8uxI7DXaI2Bci8FT43w@vger.kernel.org
X-Gm-Message-State: APuU4Z+OuTkupm963FNPuroQsVQE3RkyPV6w+gVVILr8Fv1IiG5YhJDb
	1xRs6WxdlN76znxs57iUkqZyx8wwUvVntDsMqgbxE4FEBKMi5ud+5ce7yQuOfaqoelfUOhxLGB/
	cKP1dVGl794oqSQxPv9ihUnZBbla7LhLFY3xlh2hhyqCdkJDGdDzWOEZAxBbyzv0e
X-Gm-Gg: AYBFou3tUiacOV084IX3Z1g5r4chguvIHpDGg9v415P1A6/fenbf4s6QmjT96g4x23G
	9Y8Ypmlr1XVNB/OA+Tr+hKTu7nwa3IOR1WdUuo7G7n2yD4IaQgxcvv62WGpi/W2vET+vEKn0W8U
	f2IBqGn0XtrXnqpX/H5AJ17S7jhmjek/02mDqh6WrXUipGt8o5Jc6jO2boAIV0/cS+AM08/Fbus
	Sx4atWysLRgk1WeYve9UuIXy77y+FuKCwKLTeNK11HAo8Qia6a1IuGLIbnsJ5ZQEOajpNynEUVN
	nFJRBDTBud9cvlLAQf2NBnLrQl7bYmZ9Y1/GNL6VOK34PibyorpInFvT2DkqHrn2DquHQ1PpltS
	u0I0MK5YH1f8qoR1kNYEeH+R4isp2qstYnzTvUm51LPVQDBwZnQknfW9a5F+VftORXM/9tAhS1G
	i3icI+
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388249a91.20.1793947866822;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388239a91.20.1793947866358;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:43 +0530
Subject: [PATCH v4 2/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261106-hawi-maili-camss-v4-2-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=0J78F37O0f9bKC6fbPmKMswzabA2px9rj+Plc3qcxMWcxeMS/pTc9HKNtYs+5MrbeLGZVuuNx
 8WyPRjLiTw9D3UZX5eeVL7ax7VaLBS58JgE1DW4/yo7qd9ebMIaIoQ6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: tZt76_uNw6sN2yb35-AkZYU2FrJiCjfj
X-Proofpoint-GUID: tZt76_uNw6sN2yb35-AkZYU2FrJiCjfj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX4hC9gTXVU9u4
 mNiLqzQkk0uLQ2D/Qo5OeDhKYREwXZqf+oyS8AETh4wsnChSkHVrI0mLDVpD/VIKDr92PqD1hBs
 tmB1kBw7/bBLLZuhO0goj+LXNjBvD7o=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed78db cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXy5qYJ1wwJvVW
 fp5/ojuFwCvtO5FzWeuUbNIqYBSJrNUUU104YE+8yLKgqhBtsBpIDVf+nwOMZDr1ttEt8hSFI21
 EWZRR/LaerUCrP/5kmPVmjzL1Ueii/nWHkmQ+GlgRC77kUn8hNgEhanA4buBE2w9KJ2/RoVFSEp
 rTMg4Mb7iXN/S3cw6XQlva0DcziGjhXtb9PYT6tyTGJSZpC4aLPb3YL8eS+lbZ7CtUJIQY+7b4Q
 xe8UB9FUVYHY4FxEHyxNiNHPITL6Pf+nysOgId3ALf+0IJ7un1vHdvaTrwpRzsYRFHEpyNOZ5Sy
 eG7qJbjEi41iyPwa/DGJdH9qWZyeNpvtXpZN5pjZQ26RVF7jOlGSpcmXm9ZnccgbIF5x7EIu+QL
 HfsfHyFzNCEwjBo/YOy6YF/jU9s0bNbkkjwS68y36oSR00dpnVHwHqPCuJA/wQ7EhgUYfRkUkds
 SxAFQMk1LAnaJ5qnbOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

