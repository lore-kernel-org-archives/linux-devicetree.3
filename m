Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0ED47F782
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464897; cv=none; b=LYw2EDG7gHGpcd0kytrkK5rQndWwV2uAgo2ekyd2kcwJHG8l6HFMwlxCXDefMIzUSp1y/BaI/fsbfngpOI5Dz0s7TDPQmgZCvL5mVsicHN0hbcF1j2P3K8yi5wd2DNzu2LU0H5x8o2DwSDykSYdYXNmGYid+T7K+LfZxnd3AG74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464897; c=relaxed/simple;
	bh=+5+GPUnn5LU9//MFVc3bOF+EnEW0tZ9aBxtawXQ/5LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5PzXwXX74N8l05tQNzMp4BHRcnVCij63QEwi+xZCj68/MPML0Y67o3062ZNC3U+Siv+dt2YGMeoN59EEo6di9omMHeyNtGJ8Lu3Q/Kx3ysp3lsbJ+CoYLNTsRjaAICStAEcxxEVZoHIY1BllPHSmOeD+WyDk2jZOwtJuzilti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYF/Mqlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQHRGUf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYF/Mqlp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQHRGUf6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZNm82983817
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gfeh+w8TMgfcF1MJR/jM8lM4OAFc6Lpf2PZYXC9fYpE=; b=lYF/MqlpHlzEndij
	c//1aex4/q9f0UfGCqSXtLnb0cJacGr+IGQnzbJtt5gjoCIAVUlrPA6EimTzH1M8
	jikyaPDPk3KO2vo3LJ6WoiDnrz0gYKgQNGa1ZpaocwOXFHQ9vetpcCxkrtIaBi+A
	9Fm3d+APW1kIMjFmMm0sA+701KgsepZkKsaruYNT7q8a0d6vMdTOYDG9u/wXtRFq
	LZcFQ+7XC39K3OdMvcHs1I6sPtn1e4rgBQNBRnh2AlC96M5z3LFU9SQ40n+1XmtZ
	VDv2Ovir5a9biHYvzwVlY4jZDhNZO2CqLxbJZDKRXTKCKHKJdMvSsar9TP7veMh+
	iUaqKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet3mhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1e564fd5so320489085a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464886; x=1790069686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gfeh+w8TMgfcF1MJR/jM8lM4OAFc6Lpf2PZYXC9fYpE=;
        b=FQHRGUf6JJHBwAW5pt37NsD6twr5HaF+eTaFTrXdEW/3NgxRAMLzSmDv2YvFLcSdQC
         lNJ/A3fVYrL2z0xYWbPF6+ECmNYhlAN/2dVSRCXJ7s47EIzA9R5uEM1c1ANv9w/Gjvrj
         HrSpXbwc9apdxHj9eSPiUNiO3dvgVsTplykKpyMxUD+W/zn865bF2zbejNrIF5iPLbqz
         QeDvCka4kaooSAqHFdGgx2v2v0lXTCImyfPWlEdDBmNBs0hapaaQ+ZFS90fvwUUz4Ylf
         pwjbhOTgd1sKun/MlhTdOcVkVAaVqzjDAUkzZkci8JyplWx6J/jt8DxYmCBQf55YYZnr
         aetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464886; x=1790069686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gfeh+w8TMgfcF1MJR/jM8lM4OAFc6Lpf2PZYXC9fYpE=;
        b=mJuCpt3h1QFybivbBa+HdREC8S2Zjn/sTOW1I64Wl4lDAWTzPCrwp6xHRLIJFwiUZi
         GTuelGJJuiSRlGlu/jtqFwIaEaH+BiXgaVuBp+KuWJCLvREGFBfYRNflhTXlXV4wtE8e
         jdjrVlRXMCaEGVlH3t3a6vcuhULtxGY9zBrkI4DmDsUaIjmLNfEjBHLwNHkZaoknZzFB
         1d8oYDsaWTWkYepGiUEdxCmwY6c/TuWyGDS19x1WcJHJ68b0GgAs58GL3dq65FysZYRi
         iUaHdB+Bq59ZkBbvOzyK52W7pVAHigHqnEyFKqf5CGfKkpYkfHaoJS8mlumMlSEu5zXy
         Rcmw==
X-Forwarded-Encrypted: i=1; AKwUvBwtHzMhd37/CXQWi6JZAcD6Wh+0bEZByiHDz0CJMJRteuGLnv6SAtwQ0AWrRTO/i5ZMfY5ck6VKizrx@vger.kernel.org
X-Gm-Message-State: AFuF++nX1Nohl4LbeMLbxG39zOkgVhYeOA1flPRan5m+qbY89eMaa5cm
	s/g9pPFduQjEobKbKwRUI90izD3KB8CWQGSM/EE3v5ZfMeAqxgz7es5dDZrFeHj0mlGvqZkTDMa
	hxYW656tT9tIz3QeqCj1u5DBJnY5YeFB1pCibwWofsngTXoo8/7KwgiZs8k2QDeE3
X-Gm-Gg: AYBFou0JhAStODX6gBuB/7I6k3R4srrGSKbawQCYpfiilTZJszZV5ETfyDo136T7ao/
	6SlrvAua1poGQ4BDAK7lYr/4yr+U4PFLVLZLVJaMPjcETN55G51iE6iDfbGhfd5pPlmI1Cxrxn3
	XU8s8pMawpRLrtrffZiRazFpniXCzPZEAdgXlAqdaO68gft+oDELHmMVj8oq5Z6aE8FM788hUMY
	nGdR6Wgkbi02ZAc6A4mPFptnozW5uAzZYQVtRGknoQeNyl0QXq8nrhiLuKgN0joJJACesNyD+rr
	5m5uVS5aDfkv4GGGxfOCPHOVaPmctH9YttglPEC2vw+04SU1dETbION9XBy3KsuutunyqX0VMhd
	Y950gffZdVlMXcTFSLm8reMpj30gtC2vDQzcVbF5nZvnuZ9tkRiyJ1ygIt80v8jsgxzw+
X-Received: by 2002:a05:620a:1726:b0:93a:10f5:6a5b with SMTP id af79cd13be357-93a29a18414mr948506285a.45.1789464885995;
        Tue, 15 Sep 2026 02:34:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:93a:10f5:6a5b with SMTP id af79cd13be357-93a29a18414mr948503885a.45.1789464885572;
        Tue, 15 Sep 2026 02:34:45 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:45 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:34:14 +0800
Subject: [PATCH 4/6] media: qcom: camss: vfe: Add support for VFE 900
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
In-Reply-To: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=5828;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=+5+GPUnn5LU9//MFVc3bOF+EnEW0tZ9aBxtawXQ/5LI=;
 b=+iz1rVOaH7QaiXL/nV9zJkgPx14xigxcbHgPOgPuebH9QUxfedpj0xBCh92I4dbnQoyQ2mDpV
 dym6dz5aH3EDQb/lG5cQ0vBxfExGx5JX9Xxbnq9PmEia+ceykdt+uN+
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXx7n0d7OY1EXA
 edQPCzYln2/2sQqxiIEKbIPS+smW4naidhXjwJX17YlzSJUrSeamAQc10IhGSBxogtur/zNmMX0
 mLegHBxlQML9ZR3zThC9JcKSBWzRLO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXynL6Q/67ldHH
 wADmTV4mm2t4iILDqr7bL0kswOjRKVB/UKQOwTNe2r+b2MiVVkMS1EF2u6kckt91AoToq2PWRVG
 qOKy71J56dR2+2rN0uDKmVX4YTWt3P8rj5F83HNRPXW/9fmSpqTzCv1GDCJXgj21K71fzwA+ajp
 7CzMnzUszy12ezU6G8JVvGjXAqI4VgoWfFF5kza4schwjqu84RMMIOAQcjHCHCKSuloRWiGh0e1
 E6od/O4m1M489/px+2+bwKCQU6CmSOMFC4WsKgpYfeh8QPqXDSoNOX9Nd6N7KVzH66C1RwYR6oa
 lPHg0a/+o7u5oDoU7RSM53vE3mz9I9tz0ZVwhWkpAPwGefUgnraj3F4WRAFubuD41gIrhWLsx8l
 uwyc+4b6JpXUhUhZGBxfyFbwmCm526ORy1rsQDkjBpunLxDjow45vVGHuH/W3j/ld6rnN30MSsr
 oc2Dj6eNXHGSZ1SRecQ==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa91137 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qXagEdxrQNsuUdFw53gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cUMCwxAXhhsxcDK8KRKYvhAJz2CT3nqv
X-Proofpoint-ORIG-GUID: cUMCwxAXhhsxcDK8KRKYvhAJz2CT3nqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

The VFE on the Nord platform reuses the gen4 VFE driver but places its
bus registers at a different base and does not implement the write
master CGC override register. Add a VFE 900 variant to the gen4 driver
to handle the different bus register base, the separate location of the
test bus control register, and to skip the missing CGC override
register.

In addition, the v900 ADDR_IMAGE register takes a full byte address
rather than the 256-byte-unit encoding used by the gen4 baseline, and
the full IFE write master client map places the RDI clients at index 28
(the lite instances keep RDI0 at client 0).

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 102 +++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 2 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710a2127c606ac8459a1d8c747a2f7c..f1429a6d2be54c415175a0129778f4b3a232564f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,13 +13,77 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
+struct vfe_gen4_hw_info {
+	u32 bus_reg_base;
+	u32 bus_reg_base_lite;
+	s32 test_bus_ctrl_offset; /* relative to the bus register base */
+	u8 rdi_wm_offset;
+	u8 rdi_wm_offset_lite;
+	u8 addr_shift; /* ADDR_IMAGE address unit */
+	bool has_wm_cgc_override;
+};
+
+static const struct vfe_gen4_hw_info vfe_900_hw_info = {
+	.bus_reg_base = 0xA00,
+	.bus_reg_base_lite = 0x700,
+	.test_bus_ctrl_offset = -0x1BC,
+	.rdi_wm_offset = 0x1C,
+	.rdi_wm_offset_lite = 0x0,
+	.addr_shift = 0,
+	.has_wm_cgc_override = false,
+};
+
+static const struct vfe_gen4_hw_info vfe_1080_hw_info = {
+	.bus_reg_base = 0x1000,
+	.bus_reg_base_lite = 0x800,
+	.test_bus_ctrl_offset = 0x128,
+	.rdi_wm_offset = 0x17,
+	.rdi_wm_offset_lite = 0x0,
+	.addr_shift = 8,
+	.has_wm_cgc_override = true,
+};
+
+static inline const struct vfe_gen4_hw_info *
+vfe_gen4_get_hw_info(struct vfe_device *vfe)
+{
+	switch (vfe->camss->res->version) {
+	case CAMSS_NORD:
+		return &vfe_900_hw_info;
+	default:
+		return &vfe_1080_hw_info;
+	}
+}
+
+static inline u32 vfe_gen4_bus_reg_base(struct vfe_device *vfe)
+{
+	const struct vfe_gen4_hw_info *hw_info = vfe_gen4_get_hw_info(vfe);
+
+	return vfe_is_lite(vfe) ? hw_info->bus_reg_base_lite :
+		hw_info->bus_reg_base;
+}
+
+static inline u32 vfe_gen4_test_bus_ctrl(struct vfe_device *vfe)
+{
+	const struct vfe_gen4_hw_info *hw_info = vfe_gen4_get_hw_info(vfe);
+
+	return vfe_gen4_bus_reg_base(vfe) + hw_info->test_bus_ctrl_offset;
+}
+
+static inline u8 vfe_gen4_rdi_wm(struct vfe_device *vfe, u8 rdi)
+{
+	const struct vfe_gen4_hw_info *hw_info = vfe_gen4_get_hw_info(vfe);
+
+	return rdi + (vfe_is_lite(vfe) ? hw_info->rdi_wm_offset_lite :
+		hw_info->rdi_wm_offset);
+}
+
 /* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define BUS_REG_BASE				(vfe_gen4_bus_reg_base(vfe))
 
 #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
 
-#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
+#define VFE_BUS_WM_TEST_BUS_CTRL		(vfe_gen4_test_bus_ctrl(vfe))
 
 #define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
 #define		WM_CFG_EN				BIT(0)
@@ -83,18 +147,36 @@
  * RDI3			3
  * GAMMA		4
  * STATES_BE		5
+ *
+ * v900 full IFE write master client map: the RDI clients start at 28,
+ * after the 28 image/stats clients (0-27):
+ *
+ * MAIN C0/C1/C2/UV		0-3
+ * PIXEL_RAW			4
+ * W_IR				5
+ * AI_1 C0/C1/C2/UV		6-9
+ * AI_2 C0/C1/C2/UV		10-13
+ * HV_DS16 / HV_DS4		14-15
+ * STATS BG_IR..BLTM		16-27
+ * RDI0				28
+ * RDI1				29
+ * RDI2				30
+ * ... RDI11			39
+ *
+ * v900 IFE Lite matches the generic map above (RDI0 at client 0).
  */
-#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
 
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
 		&line->video_out.active_fmt.fmt.pix_mp;
 
-	wm = RDI_WM(wm);
+	wm = vfe_gen4_rdi_wm(vfe, wm);
 
 	/* no clock gating at bus input */
-	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+	if (vfe_gen4_get_hw_info(vfe)->has_wm_cgc_override)
+		writel(WM_CGC_OVERRIDE_ALL,
+		       vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
 
 	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
 
@@ -123,15 +205,19 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
-	wm = RDI_WM(wm);
+	wm = vfe_gen4_rdi_wm(vfe, wm);
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
 static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	wm = RDI_WM(wm);
-	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+	const struct vfe_gen4_hw_info *hw_info = vfe_gen4_get_hw_info(vfe);
+
+	wm = vfe_gen4_rdi_wm(vfe, wm);
+
+	writel(addr >> hw_info->addr_shift,
+	       vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 
 	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
 }
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b2a47dbb234856b627d8911a1851..487b8ec0f7cdbfe2e2da0e46cb4431b1e6b4c475 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_NORD,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

