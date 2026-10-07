Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A6A42983C
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373123; cv=none; b=KYuN61K9WveLYMH1TiRoBpTP873QyX1yrPEhH+pQuc1XiDDL8ugL8SZWQoKF0CIef9QrX552/BpAV9icHoKOJHDj6GOIn6jKDPSpj3cVjXFcTB6c0ZJiqFSs9RsB0P5KxwV7rNwyLYC4E2hUAX4MUIEeIHXpo9QcT2U/DlnZc1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373123; c=relaxed/simple;
	bh=DQ9EWfGPZKBvqgp9iN4lMDE2hFQ8EQVewPUivJN4wLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HN9nz8WU93sNse8YYbutUmzkXCiy6642anhJIu9bdlTtyHhdJ6WGVpR3vEB2kBxrwr5ROfRkG8joxhZdMNKs0YmD2g8Z8/lkfrjJ/Nn4NiU+LcAED6YRLVV8QZ79gyRc6YSG/lFuR7ZLCZSwhvDB0QGncXKqKSbHpEMdiSpHjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8y/tst5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fks0kGuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8y/tst5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fks0kGuG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV4393687328
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 11:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=; b=R8y/tst5xDAb7+uN
	5evKUt2hHCiP/Ez2SOi4tvh9TOw8DmBEsJVy7sdJ8PSHkPY+Dd3DQMOhJ8h3FHE+
	gxhwM/FesRSOv8crZsJuyvPoe9QSj8O1j8YOVsFrc5dV9HQv+QzaFGKG8oxgHTmn
	/6TUDOG0cZiLB76XVslpNDeUy7uMv1KDkuUgXPmuIXTTOAS3WlPgRqwbeXe4/Zay
	YuqayptvA/zBdXhkLmp/8oRa8o0bES259p4f6l9rK1/hl0vqhui5anu5Xg6gwpDN
	dM+PktZ/tkztt00XkMeKQMyrNA0f4zcf94wINDoTvrFrloN9rIjPHp9OgsmKvuPQ
	xKDmCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr8667-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 11:38:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso4048659a91.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373093; x=1791977893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=;
        b=fks0kGuGEau3SAMCY1yid49psvTB4MNM5ZFBYgM4e3g+rF+8GrFFoC4NRmrqb+M8k3
         701HrayWMepGGA5F5EoFYAF8RIe/xiwnMIvKNrzkFD/iAKYbqC1I6qctfEahVDeasLob
         WDjf0QgceupLrNfHWx4G3Id9tOT7Suoiz8p1pVJUDiaETQekASP7C3FhkX9IzU/vM7pq
         c6RINz4n4tK6olpulaEWCP56N1cyfN1TwTV4rpHMpF2d4lntMO2hmk8jePFy66BOhfQt
         ++ThhQnkcdUEXDg7OmJpzFqarFiYkiTyQ2h6+Dqewk0o9oOz63C398csYbUX+2EA0v0l
         t+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373093; x=1791977893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbMzmwWaBO70zBSqQ/eHNfR6dBbEZw3DRlvo6abDoF0=;
        b=Q1y8iVrQZU9VbJrGlPRsJnW/HzvWiN97HIY2Vzo82sFTCWmIPq+BBjxap7KaVNUQj/
         Ks25oJD/Qff3QCTcJN46v6jmpOevReyDJyYo5XB1J8fcqFpZArvFjTmU/nCFgH5f2r3D
         h35cjClb8BHcq6kATOj2EzF48uM9GkRFvtN4ZBq+Kq5NEzMp2GGgDFaYombILhe0Yq2Y
         gxigRayvPmVTtX0Uy7roSOBeir7ebGNkGrB25ffPsNv6yUUbaq82TsgEBhzsN9iTBb0d
         VPBSLUSUeVxa58ob4Vte983Hsfe/6tjmCgDcobGcnNvb/zvox2rND3a9dnO5oFxHE7XE
         MjDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5o/qXVqZ/gVvQivasp3AUgsHdSdFbUnAer2In4V6N1fFI5LxxRZhYPhh8426QN43p7/ejVm1Vol7M@vger.kernel.org
X-Gm-Message-State: AFq9FYJht9Be5bBS+BD8JxHdoIKNseVXZgtaY8L9FHzzTYw5LEzTUve0
	jjFQfbCrRgzaPIIO6MJwAoQ3mQURbrHWjp9fLfdxW5/LIFeXQCCUzzIHcoEkjh9ENpjSrNYaOnh
	t+x24thCXysgWW94w/sOPLnHD3n78lDUkFgKzl9g5KpG5qpGWZ5EQUIml0u5Wjbtc
X-Gm-Gg: AYBFou3NRctGx+wY34qgwQICfStFlg+68j/58tjcv4qrkM3Hdp2TvY1stBDEECFzylJ
	v6n45+lJh/850nrHJ6KX9Ws7fiDu7kBK19+HBw1GAwxznh63jz+miatWgQZR4AZB0PUViszeeKw
	CKEqmvGiGLJH1gOU/GN5rUDW92IH8ABSKweaVhwn8uUIeLj/sWUVuE1eINDbvBuTQZWL8+pJ95Z
	2pcqOh0SFbnTe5madLq1UHKOGs1w6rkHxs5RbVph5PoAzkHaPwBBGlAPxeT3ldqc+FFFNzmaVLs
	KS6FFVKGSMtMBwxpmiwcYQ5CMfIUQWoUiHY7M4ebVp9/q8vp7LvorRjTX0SSG2uUYINbIVNyC/I
	3DXQYftzVoV6rD1iMXvnd5W1W0NWGMGVS
X-Received: by 2002:a17:90b:3810:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3a8a1ac0576mr1503978a91.27.1791373092302;
        Wed, 07 Oct 2026 04:38:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3810:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3a8a1ac0576mr1503945a91.27.1791373091681;
        Wed, 07 Oct 2026 04:38:11 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e0eeb6sm1454001a91.2.2026.10.07.04.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:11 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:07:48 +0530
Subject: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791373080; l=1504;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=DQ9EWfGPZKBvqgp9iN4lMDE2hFQ8EQVewPUivJN4wLE=;
 b=GV1ceQclqogtYmo10/6T4mCwskpqqXIPQeE7GCWzFuSg+BY3H8rik8OVHxlOofeI7rsa4U/aG
 ZaNYfBp253+CdVa99pZaoaV18JjUpdyY9D4enQFCBlmwss+njwFv6UG
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX/biRveVtDZn3
 u1kj01NEV5N6+eNu4yuuT+U+8U7YCU/vKiwjugYZhWCZeu8yjdS/VD2Hz1Z+OCjkkNXu13wX8Kg
 XRX/7ENMoDYbFLwBcvf01Q/903lUYzJPmelMokNA/7PchIlx5K/vhJj9LC1NHaMrvjOzssOMn9G
 khOnL2pOAk2LQRhhYRFvU311rBdzxvb/NNjEsmFYEXNyfxkNTvtdN6TO+MVgi4medw5UX6/FXuO
 l/OHNKTdwPhtzLOfLjNuP9YgGI3Ba0/90sETolT7KMEKyv80sk2/w7YVCyDsj51jPC1456hy2HH
 c2bNjM5hsLs7mUWt+YDIHZBBWLTVMJVwyBDcrica32JRN3QNzO0e3NzWhhx59lyd08A66ncxpkE
 8JviCPF3dfFhhs6qA/XieEMXjQciuslWDShg2OKK7Tj/yJFdRjzqrH+ubHPLd91NoPuZ48YaO3M
 jkPU3SvAebwOTMudxQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX9D4vtyXtgpeM
 pcuOsBlaTYYutVVu5M1dK8q4hPyJgD4OI7Gn7XfJat7JRwlBQ/fxc058Gz4W7+zdsEk1I3WOf1i
 rPQKAKjrOSdPaPEeEIOyAGnyhTw2wVo=
X-Proofpoint-ORIG-GUID: m_26xeCZiuy2pWokd-Aa9WQd1BwLENL6
X-Proofpoint-GUID: m_26xeCZiuy2pWokd-Aa9WQd1BwLENL6
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac62f25 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OJl0ziJC5c_Yx6648RIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

The driver uses the presence of iommu-ranges on a context bank node to
identify it as dedicated for extended IOVA mapping. iommu-ranges lists
the IOVA ranges the IOMMU allocator may use for that device; any range
not listed is left unused.

Add iommu-ranges to the compute-cb subnode properties so the DT
validator accepts it on context bank nodes.

Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
allow platforms that require 64-bit values in iommu-ranges to pass
binding validation.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index e945c8ba75e3..f4ca9a767255 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -73,10 +73,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 0
+    enum: [0, 2]
 
 patternProperties:
   "(compute-)?cb@[0-9]*$":
@@ -98,6 +98,8 @@ patternProperties:
         minItems: 1
         maxItems: 10
 
+      iommu-ranges: true
+
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1

-- 
2.34.1

