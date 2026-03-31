Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D971244685
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927297; cv=none; b=G9ocHd9iTHlidUmvBPScu9UBSarKdK84Z/zlUb3fuIRguyPCTYATAPTZzINuTXWTL4uqiHM5HCCDJ0dEK7M27i2AdYH6Z6h5o2R1N4bXIhM/PnhzZJ318dFOr5RscdeDXT4MOn++ReZhGZ4BieTjDRxRhcfx4Ow7im2ACDgrpa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927297; c=relaxed/simple;
	bh=Dn6CrJRh8wI6uUFuqS82kXiEKeE5albf9DsZVe6OqHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oj/5xwM10HcL3vlzmdeRn5LImgQ3JyKOfHEA+U7fx0i36TsJzdx5oeQJjifScsX1UrYQcfDhrv1WzQHDRoWa4Gi2TXgBCOVbQ4Xpjp5O53sv6bJNExYgUk788rU9vinjK9K0O7yAOIyfr9J6p9UKAZsTmmOR0PNpt3qagMrX3Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOA5CxKH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idi7EXBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOA5CxKH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idi7EXBI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UJ03s72458308
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/6hTUIUuvrbheX/Urbiq81lb23LEfZHvDxd
	xPJ4VLuo=; b=jOA5CxKHtH8mpMgK9FkWN1sUUXCHt6E5FferrwxoCPtzo5OYpWy
	hgBH8QVmqMhAkq0h/bth34fC4ImWxTvCVrt2JoTn9ULANkI1AOcHVA0iL9dohYHw
	8KQa1WN3k238LPa/ujnB39NdJxX8YGNr/JEXIqFAJmp2cb6Xn2SVZ1TaPotGAhK8
	TzmnN3EyCcwx/pDrFwtpaj5DP9Slo7uHK0Ygshsc8av2olxT0W5A873i8Mllo8up
	Ubk0bL/8oONk1bUyuebDeQppeLXHRnIP5dVenlEfKa+Wis1/A7Nz0t5gBlBak+4n
	oumUwSE4hzfXKtepFPaLkPF/vqayQ8Dig7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmv2hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:21:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2523e0299so56449005ad.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774927295; x=1775532095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6hTUIUuvrbheX/Urbiq81lb23LEfZHvDxdxPJ4VLuo=;
        b=idi7EXBILjAST+MG8WnglagEhQeJHcTxjxqAP7LcloWOksK4yy/t8DifRiLBfwFve9
         CzL6UiwdhaB3M1EP5LcxOo+dxOcuYmzqFkuYPDkamVuDqfKzkAtfW5CINUQLPtEftjY6
         EL+JGvGh3j4PNKbku6QwuEzST3Hk8HJS2VqOHBJg3xSMQm1imqr/WyTmzrFT7LvvZa3i
         8f8UusjZ/YrXeNRyKkP4CsiKllgrmlcxPZuvwkmJRaZ4Fu+V6Pxuo1TLqkQBVUCi/iBG
         qHHCw1UV37K7JFncsd1cP4SaT/Wpa7fyS8Kx1hDHweAkgY2wVIqxKImbA3la3yIp3Rc7
         hpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774927295; x=1775532095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6hTUIUuvrbheX/Urbiq81lb23LEfZHvDxdxPJ4VLuo=;
        b=JleWjfTfSyxYdLQolzwZ50bke8rZbM0cxTMTyFMizqrcGyIDSt9ELPTLxi4ieITeF2
         ygElz9ZxelDFUB8IRYf5joBm21VsgnrmTKbFjXE2+VEAG6f8aOeBou14X+j0cb4MSXov
         zwAblOARtyphIQ3/oNkV3wt33Gz9NbRlg64VpmiYWhtZBkU6MuMIkWOCnErYI6/0Rtq+
         HsEed7nw/Sx+J0hHLffJ7xb+g8040bYWuW6EgPo9verrptOubDAxyXbWB1TGDZjoOL5I
         lrf2mkdNO3k3d47IHRu18g9pLEVi7m0ZTDZTmDKUG78xivVJe9RnSYMAQ2HxyNxiYTUY
         ilWw==
X-Forwarded-Encrypted: i=1; AJvYcCWPi6ni1yiIaXjwGR6V3k9FmYHmO7tnwrkNy+iGEfThud0UYm3vgfdlKCQ1OgDmoRzExoSmQaf70kx9@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuOu29VXXXQbwELONc6kRPw3M+s7iVcgavlO7zuwcnxFitVa1
	wZwv3F1Aln7eoyRCChASIAJWpb+d/nD3Q1EAzyBgok1GHIAmkBudx4XSr5ROXSYVmUhSpcSAazB
	/WwWnSiR2cMSHxpPCwyJjNAHqf2BJp7rpmZow9zXaI98TyubfsHR0apJyMXcszgYd
X-Gm-Gg: ATEYQzwyY9R5qnrBiZM6VHMXBnPFfgWIuSBJpqYsNuPjzvue8odKfi4iHhsMXQCeaO7
	2BXGo0p2F0epVdjFCyBiXHXrR5rYkDCsGmTlU8sadQjz4ieEc+/jZBEdpN87L1uoHofNB29YXZR
	1B5JcqdoqFxOlmF71eG2UbqScnRPQrsKpyRseWW50s7iVQhcdERQfPpda3bcWCxb8sodDUGWqep
	fu1LMW1X8KE8doiOCJsJN0Y8eRo4ioWPVxHYVslCTOvyfbrQuEVrqznheJkBut1U+om5G/MJfHQ
	/Wbqc4F72/pHBecL9r0bJ3FMy5Wk8JyP7rV/eVdKEE0qgjiTkXZ7nc08ZsqjeUTbqddZtwEC67T
	wxaMd7U/sFF0Bev3lqVLuS1kxkNIeHmYz5Xuxb5ONEF6MilcwZv989o9jmaQX+KUKGKD7Ne79Nu
	jOPaAquqfGvPt67M0KFnjyxxFwihboCBWGvOqS
X-Received: by 2002:a17:903:41ce:b0:2b2:470d:6d0d with SMTP id d9443c01a7336-2b2470d6f7cmr104282415ad.9.1774927294747;
        Mon, 30 Mar 2026 20:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2b2:470d:6d0d with SMTP id d9443c01a7336-2b2470d6f7cmr104282165ad.9.1774927294267;
        Mon, 30 Mar 2026 20:21:34 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b25ca51aefsm21104875ad.16.2026.03.30.20.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 20:21:33 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, srini@kernel.org,
        amahesh@qti.qualcomm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V7] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Tue, 31 Mar 2026 08:51:21 +0530
Message-Id: <20260331032121.1279203-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAyOSBTYWx0ZWRfX09Rl1Hs4QRfb
 BWqhfWaXxEukCVpLozcuFvc88EWA1K3fZwpSXLreEAGoihb2p3nqNl5w6YVI3SEmYRi/bQdCori
 5zAWvJ1kOJQda8wDpo9NlOovgk/Ba+pG2w/obtYTjTMbXqmLII1GZ8M1oJQKRsRIw+ZkJXBXtKJ
 rWs9UaYkx0OtF1voJNV+Z+r0ngcmSGaCeemWepauHjTuMGyXm2cuuswVIpHUfWqIMhkr7Da6CRF
 LoH/NC9Y7avRQS+ABhftQ0lxFwJgBV7VOWo/9dIWoXFSv5XqOZAIXOG/wByQ+qcsPVlcR6bXTS1
 g1dHdZ6jRX53yFWHBv7/oHhe2XFSWfwRwxwM+N5D0+D+MZ7+7jc3nN77y3gJJ9jeb0pgvZK7VRs
 yaa11ZYkAuCkf0cpW3gWbYG4Gcqn5UFVQK0J8e1zyb4m2otdTEYBn2Q7xOyfXWkqkWv7ONFIRXh
 x+G56QdecnyBM7UA7GA==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69cb3dbf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nXg5SIL9QfFqj7ZtGcoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: QWF4yFoFWp6D4n79qyhHGDj8QFgJSYjF
X-Proofpoint-ORIG-GUID: QWF4yFoFWp6D4n79qyhHGDj8QFgJSYjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310029

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Greg if you are still picking up patches can you please this
as well.

Changes in v7:
- Rebased on the latest Linux-next
- Split patch series so that Greg can pick this one up so that
  the dt changes can be picked up by Bjorn.
- Link to v6: https://lore.kernel.org/lkml/20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com/

Changes in v6:
- Pick the audio series up. [Srini]
- Pickup Rbs from the list.
- Rebase on top of the lastest linux-next.
- Fix up address size and other misc fixes. [Konrad]
- Fix the ordering the various audio nodes. [Sibi]
- Link to v5: https://lore.kernel.org/lkml/20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com/
- Link to v0 audio series: https://lore.kernel.org/lkml/20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v5:
- Fix commit messages (patch 1/2) to accurately describe compatibility [Krzysztof]
- Link to v4: https://lore.kernel.org/lkml/20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
- Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:

base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
-- 
2.34.1

