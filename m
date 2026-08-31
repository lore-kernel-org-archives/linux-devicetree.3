Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782834DCE3
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157515; cv=none; b=L6TKS/3tKcxOTE8XLBuKshOHfwVYarW73m0iJw5mLnp117s6h8xm17jFcivpuCI31SXiH688PkJGqKAhZx1F5U362ihW1vdgqkj3+39ME2t2p8YACRTOkLV7VDIyEVj9Aqmo5xO63PnRiaGRubg01abkmsAkBPqVUF736epEHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157515; c=relaxed/simple;
	bh=eHaooIe9fijaq4d5eAGZknZQ4gx0GVbvuDkAdxFPZJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IHhRG4j7IxontYOwII2U5rK+zVGbcRxISEFyWktrjj7GHUsVoseD0eEKkJWse5VK1I3XZS57L4AemoZtKeMsCHCzpcaXKU4MsfzO/Cj2KpdBWqg+Oye8XhMHCBj4K+yP7Z9hjIXkDQa0HOIFzhOwf2251bzRU/XCFH5IE7dg2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjSUdQM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/kmaEkk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjSUdQM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/kmaEkk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52T6p1445277
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6juFQN7B89zvS8ijt0JeAa
	HNdtu+E0yqcKN77EHc6FA=; b=YjSUdQM4vCA96F6RyNPJZmnb5OgUX1VwtHf4Ie
	DLptRa9hhKKl77OVdL2AYWo2jrf1hrng3lG9pfBIuyT+dQOFZ3VS1SuM98V41Fee
	IZ5gkZcuQZvxPQAQEoB6Q14z54XSeyC43ciJSxh5zeA4wrhjRdo3hUArLJUpef66
	fn/o13UiN1DDnzUdsCC75I12YFkzIAmO1WAKrl22niUSOU+1RfS3RELbAQRsnKK1
	ivMey+Ws/FQFTEY/EFezEZvsozTNiFM5j4oop7WO/E/5eQ9OiQaNlVZhAbIUdNiD
	sEqsZbnw3UWgGvT65WyAjqKzq5V8OPxGRjMcJa/gT2JnPkzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgvpv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:25:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfca8558d2so39984405ad.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788157512; x=1788762312; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6juFQN7B89zvS8ijt0JeAaHNdtu+E0yqcKN77EHc6FA=;
        b=O/kmaEkksiYdv3zAUGr5ldGb/a/hlFmmGyHsvDq3cb1xg4+/aC86atyTJoW6ef86Rx
         JKHHFaIwAilpLSAuFOs+LBSFy+NQMO988NtSVZfYeOn0t80N+VWDjerp22ybUpWSOMwD
         U5Bifqy/E3qGjFB3yA18KhpQyBL9cWxHSXW3COl5YSODjNqS+dS4HaN6Xahdo5TSQd7E
         kLZnUouo1rKwCo0tB0jUbiFbgBBU2UBG219ySvN/f4hwROr9iXWttT/V0m/ljf2DPTf4
         QkS3K5u/bLb3ZSRzXQjVsjywIJcu2OCxowfH1aJ+kUio31Ks//On13mlee6kpW9ow2Iz
         S5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788157512; x=1788762312;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6juFQN7B89zvS8ijt0JeAaHNdtu+E0yqcKN77EHc6FA=;
        b=gkSHcHw31mC3if2p/1F6y/owoHdVORSJXsvM010Vd8QDZby7/GX+1qvY/CoDBvP8td
         S+aUJE9U92WhN1fIhE8kkrLvrFpuyPcmt62/ZaiK/mzgZq8T2V9NTGSvvGDO6qKwA2S0
         nh6d0Bv85gWYHOmKtSTot8oJpldB5CHzR6OsWcgvUZ0xvRGJDiazcqyHDbZJy/oS6IY2
         7x18DQHRvqMcvDPRjgKWyJm8VVTX0qDUI24mNo/fptYUr9umCn/z+G+u8zPgTM3BauTY
         U+D3XeCKYb+XVB7l1yTq8jx8WiBNvVbOXZkgePzUmQJA/br4tlcbVQ9kE7f1Sl4XRz/p
         doAw==
X-Forwarded-Encrypted: i=1; AHgh+RoSOjLxeLf+99QOjtXqnP7x/JlvsuVaeViGlIh4XSKxYDcawlnREq7eekFy9YiiETXQDXkq4EJiakDg@vger.kernel.org
X-Gm-Message-State: AFuF++nLU8RjWU4iN5fT7cembms5bGxxRZRBosA6fVZ84lCe07AQYHwB
	S13fghsno97sWsSnvwLXCz7V4oksvBVbgqsV9HPGctsH3s0QyflK84UheDIIByQVq9ppPsdLmEp
	n7iLChbzbjO1Sm9yMh4TiJdDLXKuicGgMsAmgkv1Ju/7hPHHkIeF3wm2kf08UaxYg
X-Gm-Gg: AR+sD10iww95grQ7hIxa88bPPtD6BiDyvU1D23apwzXTVl2m4PIOZJPbBGQqkC5GIqe
	AAQDO5eBL/6iFvsVfG/CQvNrHx3GFmSdyv8cXto1EsG79YrWvZDMZjisr6KMY2p5RV+DS3eomxL
	km+rhS+UQKIrdJWGGXDD++IpMtYqp5CpL7R2T3GKPeCuv8Rp+MYRRAXbN6EDBm/55djBpUlsVS2
	EuzY+FBdVBl4V3K+VXRv3Q3yut3YCg2dpLLdGbGki+zTM5x06XJOhKC6lh99bKgujmBJrezwm8i
	odPGqq4Bj+2PgvnrkpNZDTPnNk7d7aU5IxvKu8PuUAHhPTTO9dNdy8gywzycXtZnBm8chy/VIOR
	s3RrIhY3sEyhpFBC9N3J7ES9X7jm/K05X9bI8zw==
X-Received: by 2002:a17:903:19e5:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2d93636d111mr30661065ad.15.1788157512228;
        Sun, 30 Aug 2026 23:25:12 -0700 (PDT)
X-Received: by 2002:a17:903:19e5:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2d93636d111mr30660215ad.15.1788157511696;
        Sun, 30 Aug 2026 23:25:11 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm26745643eec.18.2026.08.30.23.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:25:11 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:55:01 +0530
Subject: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili
 PCIe PHY compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADwelWoC/yWMTQqAIBQGrxJvnVD2Q3SViDD7rLex0BAjuntSy
 xmYucnDMTz12U0OgT3vNoHMM9KbsisEL4lJFrItuqoUYUGYju2aLOIpfi07oQy0MnMDPdeU4sP
 BcPzGw/g8L3EblA9oAAAA
X-Change-ID: 20260831-vdev_phy_next-20260828-afecafb5ecb4
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788157507; l=2568;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=eHaooIe9fijaq4d5eAGZknZQ4gx0GVbvuDkAdxFPZJ8=;
 b=BlNjYw6tI2YPK+8dyV1JS/ecPHek3XVMzy34tt3S0kuQdZO3C/RKtVepS51A6mNhriCcthGsk
 AYPBkMuNPe9D9ud8HYeUg1ELdm+VrpPyGcWvf/yiWemC1aDVdCEM7nG
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfXzPngBmLRYz1S
 HOZmqeIF2GF6ZQaMNDTozX0mdpgTkwHsGlZjfFywrvfSkH2veQoBXlUZcUANWH8YtodNNErNNtH
 8+iT48qdBs6WpnVUQuanZIlxUNC2E0pFa6ps7GU+4C7VcEK48Ul+6n3rioyvcyh65O+aHz/4uR8
 Kw3GbzH9QhLbanu5/BmgqK8270WhAW4FM3aWFLZZERlz0gQpOHbJvrTJqSKUMz3a472PEaQPxF9
 Jd9XoznjmA2d1b4Zb+xblUzt94Jl5/ADedoeigLAEYWK6TgdqVIY8/Mimo2gLrobDo73gNUdTVb
 sXaSW24Cmivy/eL3UmYslrQpP/jWH94lPB3v5onRIp/VUIH15IPChrLnGHudCkIkQcNgx0xyYZi
 VUeCMhaoM8tXa7z7AIW//RidzE0QJiYHocRpMAmoJ0QaaXCPT24W14ZbFkmZJc67ZDYlbME7hwQ
 RkOdJcfbeHrgIu+R5vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfXzHmSNQjawvsc
 eGAlRVLzD2Zqkb+7vz9OWxere/h5RJsm+aJvU0iaIIzRjsqUauZDFH42mFwlJ2+2mxgO9mZCdPt
 p0LR8iMw2xd5kbxNswVfOmDHVIPnsOs=
X-Proofpoint-ORIG-GUID: ZK38M5Kd1q_sAD6cRUP_Jedh_M_ivvPt
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a951e49 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IvnoF98jkOSEO0IU3sIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ZK38M5Kd1q_sAD6cRUP_Jedh_M_ivvPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310053

Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
compatible strings for the Maili SoC PCIe QMP PHY.

The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Changes in V2:
- Rebases to the latest code.
- PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
  change is already merged, so dropping change
V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
---

---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b353b7bfb839ce9cc43ecd9ef96d174a7750b35b..701f0fc178220da5e3d2748330179c2193ff7418 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,hawi-qmp-gen3x2-pcie-phy
       - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen4x1-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -202,6 +204,8 @@ allOf:
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -232,6 +236,8 @@ allOf:
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen3x2-pcie-phy

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-vdev_phy_next-20260828-afecafb5ecb4

Best regards,
-- 
Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

