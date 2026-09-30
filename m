Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9413C279B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751478; cv=none; b=vACDdab82kxq6pUaDnllcKmtn+HqirQh/+OGr6NQDwtt53/NJidlZNwKWif5/3NMhR7Vdk8wp9ycP7U0DOcP60zFNsTdN9SAY8ydtzN4NImOGj7gReCFCoPhCZkV3f5eUvWOeLuU8kooiscQWtB5qfUQTUBYnT4XSPOHZ6lu/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751478; c=relaxed/simple;
	bh=QFeke/g03TqqRll4CRAIAIVSgMT5KIoGJAbnIxlaflU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RjnH1kR4O32GJLYDOxeEMrrabrtjyVUjxL8J5Pjl4TYp+jZctcXPp1cJu3JDNhlNWffPdLKF1yDk1rDDNhsgA6zZqu8SEqm7BGz/n1uqvjuhQUqkMUCbBJE9XvG7QQMSJvWrgdrqidSwMmp7scHNKh4dvu6CfosHYapmi5x+2Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NF/+shTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YY5zg8PX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF/+shTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YY5zg8PX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6ovuN3220527
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wor13afrlmIQ/MI9KPZlfMZ0I9Zdo73Azc43g1I7rnQ=; b=NF/+shTgtksmiLAZ
	dZQ2tW1Qmm3UIq+IQZSmXyGlMVG/q5HiCb3xXRIHwPkPkCr94aBRtKlxsoS2mcRV
	jCk+zBSzKnhUy5dfW8bZ33BpKFkFWOawvkz/Zsc8A2kd/2nc3oCMtk9NhsoMIfoq
	XwwlaiEwQhd7525fYgIQB2sb2oD3IVrsAO4OD3CCgAvrsv8JKKuxtt8PjlUcBhtc
	cftvHfPxTHRxCjmgmpIMMtidRZk9x3NdgFxjk7PZdnEu4H1x3LkGU6Ef9ogJI68/
	0uXRHblBq2UbhN1laMRnKo+1b6pk+boGQvCVgs5/QBoJBosfVeGsITOmI0YBu02w
	hJa6ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3hxmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:57:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso39832385a.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790751459; x=1791356259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wor13afrlmIQ/MI9KPZlfMZ0I9Zdo73Azc43g1I7rnQ=;
        b=YY5zg8PXr8yp6XuXqvp2dtWFe/maW4KGPj831fvEUMqH0jJamPZiKZ3QX7T91wV7ET
         60VQsU2oEuBFVOVcKHUbF9nvOiVvZAyDTpOZvFaHfeTEo4DgNPRqXEE6fSerxP0ogMTy
         JNOISUMMOQgvWhv6ZqO3dmt2xvVYWCYiKdDox3c68Z09gWiv7REUw3+yYAaEI8LA+21W
         WJUIhaQedK4HOgOEE3Bh9J5Im/UZ1YghF5MhFThkIDJJ04aSFpymiCWz6uuoeDQN2WIy
         AnD/4m6EyO9LP/DlQIHNiR+xqcVXJVta85X1PyyMMRFLk226sUvGrbp1csP1jp4Wywu+
         z/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751459; x=1791356259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wor13afrlmIQ/MI9KPZlfMZ0I9Zdo73Azc43g1I7rnQ=;
        b=oeMg5DsiBbHzb8/7CKl3kjQ1x3m2DwItAQaWjVZfGui8y+s5YVbvVXrxAylK/VszAj
         Q0z6IDpHVUbWgBk66kTF8DxindhS+oDhRou31MWDLsmosXAecM3/PCFM08v6ZNhwvtq1
         P9knKajrmadOOjJOWRtJPxVauYRTtuqbQww4jgX3eRzGfIehmdZbVX45hRkwUdrJJR00
         xmU5136jhoTGyA7uzR3qDdBC4CGksI0GtrPG6zembyo5BnRC9Y8gIXFkjrEaMX8pIRNY
         BRepXkWLfp3ZWfUqrGMNwjG9Vt6iQaX5j5d9sqNYqfz1ml3Yz//FlvR8rRI8LKHeEqvC
         IQLg==
X-Forwarded-Encrypted: i=1; AKwUvBwLxptTeEtceUHQ3v4ibmcenYA93g6AY2EW1uY76b20adhg00wJRSASX/nflM5/DchhBar2oPk9hn1T@vger.kernel.org
X-Gm-Message-State: AFuF++nyo+d+loSwG24vlD81N2jkB/SqAmD5xyGgO1qMEjCHnEA6ZuB4
	4sdWlY0rSf7fhL/iSxbM3+h9VeFyN6KFoaBfPShd8mui12cmR3pyEQoCBCXAyCExSuZswv4yf/N
	T3TF6PDsaSa4bk+UvrN5iVYODK7zPXT6Db9ZNYpsv5BB+P05sKqWIiYtpw4ViniIY
X-Gm-Gg: AYBFou0W3MdUqmP1iI8fWvpBrDZzR224GEkTdc69LB7wxHjijmHRI3mv1qoCUgjn1yW
	80ZETB+6MpFSaLO+5ee7z8mTqFrmO4J2oxTwna041568ffC7njrQs7XceffRJtIJV4qL551EXUR
	xoFtigY+tDYMi4XiwQknCnUv9KXpPk3LgIvnOFWYeQsmpQl44JepMdYSJbGRc5zYFFs2fsTNXPi
	4POTkrQrBZ7rwIntxVn4L5YuMKU2L/Ir3VXcPER+Ub/3YedPi2qmX5tfsiLdBrLlZJrwtn6/+1V
	OTw/Rvhek2qX53Wpqf7ALzUmN3UmU45Zvm52zepzw4RtjsuXEwqsLcx5C/67IkN7g2ukYankgsS
	nD/YacgW+IRWBoz1ZhVlGWFVZY2G/LvumIuc8cefumcZgx2XDsHgH26FWEPP+Dpa8UA/C
X-Received: by 2002:a05:620a:bd4:b0:93c:5dee:f04a with SMTP id af79cd13be357-93ca951305emr71931885a.7.1790751458765;
        Tue, 29 Sep 2026 23:57:38 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:93c:5dee:f04a with SMTP id af79cd13be357-93ca951305emr71928585a.7.1790751458241;
        Tue, 29 Sep 2026 23:57:38 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82cabcesm51534785a.27.2026.09.29.23.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:57:37 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 14:57:17 +0800
Subject: [PATCH v3 2/2] media: qcom: camss: Add support for X1P42100 CAMSS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-purwa_camss-v3-2-0fe2a5b11208@oss.qualcomm.com>
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
In-Reply-To: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751443; l=9181;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=QFeke/g03TqqRll4CRAIAIVSgMT5KIoGJAbnIxlaflU=;
 b=P/3bhrRXTyi+uiJvx7z9LqlqgzzvaYfpbFSCM7qP4/fh/Yh6NDFjz/SwxlSq38O9AaopAfhaD
 4Nps15V2TZbDgvRIDPKu84U5OJL4kWZepatrm+2pdPIAqPZlII1sWGR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 2ORKxs-Ypf52XTI-9XzJoDQLI18E11tb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfX/A2nkxnDi4QO
 jafV6LNrvRN4Df37FAUfk6dhOALQ2yLq3HZrFQcvdpoGYjPOfyXG5ERl70n8MH37tauGa2vpCum
 i1O+JJNFFdEoY0eF5VTgFFN6pGiUCYz71fTjdablR5Z1BnIveOKwY4seec5vkxOj3mXbB5nx/gf
 0T9JqPL2jedA9doKA64+qup4LCfXW3Wu3JQ1MAHTqyXdMHMdE7IBatjMgveHPDLIzB0B688AlsY
 a87H6ahHiiQLXkuwafyb46WzCTAniH31v7k67asbLeEFp/nVcTbLzh3U3tilaKcKYCnWUc4CHYg
 kN2iQoIuNvzcq6moTYo3zjzhVNYuOFAqJwosJzzNXDZnIvCTl7sv7yAuHuqDcACpQeXhTVa3nig
 kbkfZKFGAWZz3w18v6JWWWIp1GWlRyj9bHUyu3soTRkOEiF42Dd0DZ4Hc0amGmGL51UelS748E+
 wEAUzh1bptb3pLv3xTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfX/lYwk8W6wJZP
 iAG9sRt0bs1NNqwP42kSl/iCLW81KOS6PyUIWv1ffRVCSu8urGlu2VcJxjpkvW1KTrWEx+waYP8
 O6ODRAvyiyd2h9eZXFl5o+HnwwnJsk0=
X-Proofpoint-GUID: 2ORKxs-Ypf52XTI-9XzJoDQLI18E11tb
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abcb2e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0PC1L9vb1dsTtBW2NE0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300027

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
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 216 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 219 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..c401d4d2367022022ab4159d5a08806c27990f00 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -2014,6 +2015,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
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

