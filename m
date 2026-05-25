Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECD433291F
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779689866; cv=none; b=UW6KQ9tYu219MwOCb/TMkMVvP10UDvXvO7jMQUkGD+SIHy83/757fxwgDT5f3ih8pY+8a7ZvV99XHqmfyD/apzIuE0ujCgvYdNd/ZdCO8VNtdIZ1KK5h9b3JmpimzEI0hDp12DKHdYdO/DmMJmEK7CpuYDF9QcdDQOMtERQGC2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779689866; c=relaxed/simple;
	bh=+m9rqksL9CcrcdAyKNuiMdVbpebT0DR9bi9FjEL4MaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=smtjVGcn1m/fOqsOR3PpnD1H8oARUli6nXqeckgDgwEjF8F1A8CFUsqBbyQ6E3NsHnTQauADEaaYnfJf3sTV1p3KDmHxotLVmrkKbFOJkiF+MR2hzMeC2e+MV7G/WCD33h2L4caC3m8LpIEs+oDxQQzXVkazUkmoBDEOn8TX1ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifskVIAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGQIT+/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifskVIAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGQIT+/u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ONuwcr961954
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LJX57Ht5s74mV+xzZtIacn
	VMiPk98gL3JtBjflkMkrQ=; b=ifskVIAYtzSY5iQodV85d/BVjSRUCbYtKjXITA
	gn00aJalBMgzbZyZmkCDiue4ol4Xi4dZXJaOfpobcTVS0RLvAM9d7WRNIYEhw7Ae
	pWkiJCfZW/leaW99R4r6fDSMu5fS2uhuQK1xiWVP0SWtAu2PLkQOlH1vbCMi/AL+
	NHAOX6n3NAqUetz/Us/vDgAkWqSmITqSIjutljM6Lxzrq4kuB2b715VRWrTWwa0X
	zW/dI+zebApoWKmd2QEeJjGzO8bGfdsxzg6X2m3VD8mJ7nkTD1x6UbeRTjBYmpJV
	wsOH5tgZvSJA9Mz+9Ic8jB6W9sZDPn4YVgMoGBcxDNv36Glg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3d6b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:17:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304448ab58cso1718088eec.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779689864; x=1780294664; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJX57Ht5s74mV+xzZtIacnVMiPk98gL3JtBjflkMkrQ=;
        b=RGQIT+/uGCzvPBfIV9QsPwtLzm3bpab1Z2IkbIYEc17wTo7GSMYBbGy7zHz2j3ByiC
         VdUH/jG1cO9Tt9/rpyc7xLqCF1+C8pvkmkl/wpYCZmC4hKdMydfffmzPN+uKxVJgprjs
         Rp2JUz+TWvHKmBOWi1O+ypATq3jnVTfy+3R2248n5L5on0uMRLsHJwS1hgW8SoSuwH0Z
         zRYLHD3KoJ0fRkt6EFR3ejKpzNIU28l0I/Sh12WjanuqRT6JXua7RTVx3eGE1j7n5S1q
         TGU24BPtbqxpz/ZPqU0W9962aI5tdopTZSIzzsHwiibmxT+DeX7elCPjPgV2Nr7CY1Ln
         TeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779689864; x=1780294664;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJX57Ht5s74mV+xzZtIacnVMiPk98gL3JtBjflkMkrQ=;
        b=sLjVE7/JKBREgal/rKOP3zdbxrNGUwCrG9WluEknDsVpH1oWePHFCHuDrZXlvwuuEr
         0E7hh2KwICq/QzJUjoT0NUeYLqMvumWZx4NOSy7M7u7iLxFqSUoe9ejSuA5TpPHNlVO9
         aKJMmcHkfCOQ2n23t4ThSZYk8yonULlE5M/2pzaHgXqmkhNi45Rd1CwVgNZ/S44YilkE
         RGwjDYeqBi+wwwgPfz344DThjAko8D76x7CvicVljrmDVScuXB5X3x0TAPkUZ0XmnfTA
         edUTOE5HS2e2n0mimEyBVLJf3BuyqJpb+xVoHKXk7lSVfSONrAMDDtttMbzKem4jYquQ
         AOFw==
X-Forwarded-Encrypted: i=1; AFNElJ91HTs8JzPqGgL2Ff6vNiKXj+7VbcJc5fugxjdHa6m2VsyGBAxqdcOW0/+JNsuEYUbqGtxE3Lx5El3F@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/2X+LnBGcMrLCewnS2D3cJHP9ihqN1q4sQwLBCJmbwJMBHGG
	+iR+5vPwZo711lwbWMXXvxHmL1isuyvu6rDWZReqmd7R2+hlrXAYvPoueCPWMVdJBgPX8VHDIjt
	uRooV1pbKpVdREbstq/KYIKF6IRYmWS7OOEgl5djgqTN1FCWOpt18OxwJEnuxqxVK
X-Gm-Gg: Acq92OEU4eO45ZIktjO+6DssY5a+P53mugrfkqp331nkWjEeg0Ddqft8eePsberoiaE
	iZbVoiaQ7jgicN4EN86SypfueZvl30QjgwNoQTkvKnXen6sFzqaGuv+7LJYOrsBdpoPNnF9Ntxh
	Yy5zJKwPZTLEwsei76xZpHEdjpy1drXUXiC3JXpo15d+4R4TCdrym8DtERTlk5AgbYZcI0kxgnX
	yW3MUa2PH+T/HJ6/R5Hf7mqE1BYcNvsh2sG66sa2WgDzOzCqjsLhWxduJi9ndOQhl6UDz9M+/ZZ
	3EEBGnnKEbpPdEIAZvWM0PqIBrRHDT3aZSG0yLYElaWa9rIDKDqPjpNCvZePpHjKcvhiJTS0PZw
	2+GAdF7t2jERti68PVPF0LOlL9kQO253UhY5JY7tcJ8w2UnsIsu2ve6/t8d+ftvQO+MS6X99NVb
	O2Wzd4T0k=
X-Received: by 2002:a05:7301:578a:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-3044915ff8fmr5978841eec.22.1779689863601;
        Sun, 24 May 2026 23:17:43 -0700 (PDT)
X-Received: by 2002:a05:7301:578a:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-3044915ff8fmr5978831eec.22.1779689863079;
        Sun, 24 May 2026 23:17:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230f1bsm6942271eec.14.2026.05.24.23.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:17:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:17:34 -0700
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH3pE2oC/x3MTQqDQAxA4atI1g1kfmyhVyldzGisgc60TFAK4
 t0bXX6L9zZQbsIK926DxquofKrBXToY5lRfjDKawZO/Uu8jliRvQS1lQUcUp+hyoFsAC76NJ/m
 ds8fTnJMy5pbqMB8Lyz3s+x/fMR/mcwAAAA==
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779689862; l=1104;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=+m9rqksL9CcrcdAyKNuiMdVbpebT0DR9bi9FjEL4MaM=;
 b=FdaYxV0ad4yvCaLBOHVjfmVKs1TzMIdM2JDbZ/NmYG2SZFVmfunAdmtiOXIT/hElu2NtLGciP
 TEpgiOa7sdHBSYd3m1iunT8kG0Pp/vBgvtUts92OpXv1+0EvTN9L3Lr
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: qryoyRdPOJA1l_DVMLGOAYaFa8-nQPm5
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a13e988 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0vWZlYpcnXXQiWOWdZUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MCBTYWx0ZWRfX49o3v9KRcZsm
 HxxA6la/KzXDXTCm4MendbIQibqIrws57Bs3KQ4HNAePKsbvKtwb6ZBmoMZ3NXJAbkNks183xBr
 NKjZp07Q6Xzb6fiRD2EQoZH7CnIrlnrf4Ssrhi4BneDfiI+pdGM19gZWkg6O18zxokVDiAfSQRi
 o503sJqT9viQfA3dSDXEQ03mbEASU89mbqFjfKxCTjOLmR3AncMIsO/EVB1xdW7ozGmCR1vRmgj
 2Z8YiFXNkbmUrDGvYqJWrHr1yWrG+UMt1xLkAA97DSAYrTCvCl6LgEcck9sotBc/RNrl7BXBLoe
 kDnPCeYyK53e4eQafsTfShaynM843JnYLbzCX5wnrQxhL96B7vlndh6fQy/DqKSoRI259lMbDLZ
 6Zqq6RSMGp13SQ5aj3JKdoI7xz6oroKaIg4da/6nvgtbEDAj+914eGtHANbiofGou5m/tXyKavt
 XzjBKXcj+1HfunCS9jA==
X-Proofpoint-GUID: qryoyRdPOJA1l_DVMLGOAYaFa8-nQPm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250060

Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to
physical addresses. Add compatible for it.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..4bd31aadc405 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
+              - qcom,maili-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-maili-smmu-1004f41b3073

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

