Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20A46AA8E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448057; cv=none; b=DcwGa1FPDgsLM5lb2PCClhnBV0bp5bzhNW/VBOhb1Pjs2kItEimchHvuJW0I624PauqUI/0M8o5poGDdOimpW4Cea0z8w91Sm5TyudWUMiEJC/NSdX2OOcuKSlyuy2PSsAeEh7i+EAeSycOa75XItI0LbAJFHB9NR/2vYLyRfCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448057; c=relaxed/simple;
	bh=Pz7ze0zTSzxTCIdBvDzfspmm7ASGI4Ym0bzkQZXU90U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krMksqksor/qLLDYEjBQSLGsw6wFN4oCqZ5kSCgIiPhU3fpUtjsDBJDqWDcqVB7120Q2At/cvwKtlPyXmGSMuQ9dWkxdr/c97D+cARoE2h6wb41684DU+JwGBPc/8JDT7DwY5UiCOsCOqMOyxsFVisTiTGlYld2+7fS9lQW1n/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7KuX8du; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbuTEyBS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7KuX8du";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbuTEyBS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KT1p2167419
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui8rOuDYxfWnkSSje2I9A/g+73JVctxI7MRa46JXNTw=; b=F7KuX8du4sTm7KMO
	qPL9HZTGAoOE6MxcmH89rfnuHA2E0OwtubAgdRbO5wC0h52eRiarqHbgIfK4K7EY
	Jp905ZQvg6gWDbqZme7ybV7cECet/ebruTa0UhxX6xjAORJF8WQNRlva7xfkeZ8j
	XoWaMudJXZhe+rNJExZe04rFF5dkSPQEbC1dqzKIxBn+UsRBmqQmWxGIlg1lRPVf
	yKaddXeutiUFK1SaRvHeiT4wPB0VJPr45GCzO7Pd3d2W1X1Z7pOJfDxhKJYamiyp
	1RkXlRVWWcyLScK76c+09san2ThdLRBmR4dCYtDrlU+QCt58StXRn/7A4T5w2KLZ
	ZxUu/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t1sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:27:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535294e0f64so88579991cf.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448054; x=1792052854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui8rOuDYxfWnkSSje2I9A/g+73JVctxI7MRa46JXNTw=;
        b=GbuTEyBS49MRJFySADzgyjPuTWUjZNPRIeMrWd6TbxpRJXASMFdmSNo/HMr5Z7ccDT
         7FklCzfVp9Z7zl1w08BPUtc7DKpZHYcffayWyysidY7mObhtKyihZuSFkFSeSoCtLGnT
         ZSKjXyRWIoNyy0JHg2fhLnBmivawtV39nXa/HVp/VJHIxVoZ/tbQpou5lZUn2GH7MM4p
         o7Bx/1w67PCj/aN29TQR4f0A5Dvp41/QUc/WxX3hD7h80uYbuH3jyMf+nSuaI/4zidT4
         QQ7oKdjvFNI3YtXcE8nTTFPNFR25/sjGVGK5lfXqR2OSZqmEiVWMfA0rxCRhrGNZOOuc
         pf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448054; x=1792052854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ui8rOuDYxfWnkSSje2I9A/g+73JVctxI7MRa46JXNTw=;
        b=A9f+PoK0592q5WYDId3DQWJ8651+OuO2eEGOvEM4vQnIkjU2Xbo88/JWMxPECvG693
         2QDcy4lyb9i1TBuHzhFNO2zka86GgwWBPRRByYV2a7HVd+8gv9PnnZ5dJgYLMJGr/BTR
         cdyzzdPiz9Q4zyg3g/pPejyAfZu0NnDB2YT9r+LGrf6cShI1wdWM67FsWP+sK8fPfEfP
         mUOQ6uv0HFlXUYWK6KkL/TkNK4dzA9GxWuS2U7oHh7wn2zuUmLbwEyX4bDhfKKqZrToi
         nnDPYnTEx/TsMQgzW+DwI4qxuRziiapy+63lEqQVa9yBH5Yb17Sm3lbkmjnlLaBrMF5/
         VIDg==
X-Forwarded-Encrypted: i=1; AKwUvBxewch5Ux11Fy0TycKlQpiRyQQGBDHwFEhhVrIydI9JuCce3DxUhNBHlzgyPbqkpi49joTm/P3Lvvkj@vger.kernel.org
X-Gm-Message-State: AFuF++kDSMmRG1SsfXzEveEif5A1/tOAKkm0nsQujH/+QpJBGOBwnoBv
	6gXzW8ZkZ9qJVeCffMkIC8bPM1bxvS99qsWu3sMhQOUfZcZTeZntP0h/yutC4nBziKAi0qgXLLo
	OeZKeWsSf7ckIbtH4BfMeeRhliYzM1EkgdFuyZJc0nt1cT+sQdidWfu+I7tvvPERw
X-Gm-Gg: AYBFou3dsHdwmFHKmHWk/Sk3eRDyakDrT34HE+R864Plqk713baU3k5+PbvH3+EuNp8
	vO4ysI7n4fHlYc+E3K+cAW8RiZVtwfXP3gQqohGttFE5e/kgztuodS1/VxW8kUHXU9ih9Jmwnqe
	3NbNkC1W/oC3I2gKLPEDlfB/4xHGfuPFxlECpXh2s9XxmVEQ6j/rWQUyB5GQ9UkOOpktYOZ7Lyo
	zfConnUSuCk/VodCIJE20m0FvmJnq+1zIfRjBnQhpxGNBabP+B8iIhZkc0HfB7ElL2bK8DG43mM
	IDSNc9WzREsF7quxJtkFwBON33leYzm6vs+Z8cJtW5In7kX79ReYmLvxqBTu9TmOJVgXZkvIGQJ
	hQjfsujLXd098C+TiJ+60121DjfARY5VIGoCSXuDEkXoeeJrHsBa0YPfR4wKoj8coUUCl
X-Received: by 2002:a05:622a:559b:b0:535:70b3:aa35 with SMTP id d75a77b69052e-535757320a4mr87658741cf.71.1791448054386;
        Thu, 08 Oct 2026 01:27:34 -0700 (PDT)
X-Received: by 2002:a05:622a:559b:b0:535:70b3:aa35 with SMTP id d75a77b69052e-535757320a4mr87658391cf.71.1791448053746;
        Thu, 08 Oct 2026 01:27:33 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357219c5f5sm38928981cf.25.2026.10.08.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:27:32 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:27:00 +0800
Subject: [PATCH v4 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
In-Reply-To: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791448024; l=8939;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Pz7ze0zTSzxTCIdBvDzfspmm7ASGI4Ym0bzkQZXU90U=;
 b=e6p31i3d2/rAdOmcL0Rl1lYd7vecLqA2D64L3QoCciNcbz0YL/dulJy05Ohy5APGuXqvNEcIh
 tzG/cNJn1AUDrRbJdlbjnecQWmFmkceWmSVGVnfl8DIunN/qUS3gtyy
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac753f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0PC1L9vb1dsTtBW2NE0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Zk5novlpf4IjRSoSO5ZxiBfO6rqy3O0x
X-Proofpoint-ORIG-GUID: Zk5novlpf4IjRSoSO5ZxiBfO6rqy3O0x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX6anBw4pkeI4n
 dUEFAHe+YQPDjZ96DOJosguXoqe4VTOUo71ozrQZHy2po51+A5idVROgxHPNbbFuoN5mN/8bkcD
 KQJSTmPvm6g3opSb/SNGIMBzNkgWaaw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfXz2maNLwdWjOR
 3X3teH1aXmT940Tt2pyIRoPV/1JNitqQDvYvS/E8voVom6csLWwQ3YGXpsQ1SYoSRVo44FHHwxI
 bMSNu9xRwqN2Fh8iDthMUuaXpVZMxq7YdITM8xt94+NQu79llOcQ2hSUVnFwqFVaPgiGbJIQPKw
 gtQor+qRL+92rSmo+hicOIxep4uqKtAavGaEZol5tD8Zzk8r6rGcu/kDT9tYGXzxAgsQ3DJwIU+
 SMXJmh+U2d0QnWFBj8Z7eqPaAzNxFq8y1J2z5wvxiDFbzS+Gr4WbpMm01AXCUoXu2xC2VQhcpC1
 GiqQXkHLGUvBPv5QBG/wuzKiQqLWgC9RA2JfP05pXyPGgKtgTHlsZI798K93x+ENRaGXUqACPYu
 FcQCOl8G3oLL7u8e5d1mqraC9kGAJISVKWxwq8Fd3N9E8ZK53spOuSmDwvtslDhCBYxcmoM3cIA
 34ttmOGv6LfS9ka9+pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.

The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
CAMSS. Compared to X1E80100 it has:
- 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
- 1 x IFE instead of 2
- only the ahb and hf_mnoc interconnect paths

The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
TPG and CSID wrapper resources.

The CSIPHYs are handled through the PHY API, so no CSIPHY
resources other than the lane format are needed.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 216 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 218 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b1d9fe0010e119059c539c20c238c3e050ff7036..81cb4377586994727006d0ec83e53ac57233f765 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1997,6 +1997,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a98fc6a20fdb8e0f9f8e61bc41058..7bc6b2e61438da9ce0c100fcaf8f669410a6839e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4452,6 +4452,205 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1p42100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
+			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_x1p42100[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -5809,6 +6008,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1p42100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1p42100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1p42100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1p42100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
@@ -5828,6 +6043,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0dc2ded8e4a603d6cfec4d8e6a62b..523050295209d84e7f72f54bce9a96ed9df442aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -97,6 +97,7 @@ enum camss_version {
 	CAMSS_8650,
 	CAMSS_8775P,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

-- 
2.34.1

