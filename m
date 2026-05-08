Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA75A3806A6
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227531; cv=none; b=eNNVsxCz5LQrVJ7enY326y/BeMydziv7KrzsL5dOQGyE63hsB5sqdR2/LQngxLY/nUVh8/ezgjbYHdCymmfRMX9ZZS8hNzKdks0X1kNE94AXiWnHNFi6rdxKoO1CArD84wny3/xYNMawR4v5n6jzdYFhm4K8UEyeA7RHmBGBcPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227531; c=relaxed/simple;
	bh=Kd9BtaUbqeSupBG25bPiBwuR1AvdGpRl5OJ9qDGM+Pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbdwpWaw4jDnjADSqBwBB+fqqFKporu90bSea3RwocCZTdIHyo5i0NyN2cxAF1oEreRER2gEtnjpWbRERJ4SNuqF5LygYD6RsO42WgLcYwn0c4lY9RTtrIPHfBizSlwlqvcGldbmjN+Z/ixk32+N+W2KjYSLfyDo8RuiElUHxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS5lrvaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GO1ufBjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS5lrvaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GO1ufBjn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484Wx8F2771001
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvN0kePGR1TH0clH/Tb9jn2xAN3aOhuryZmwHL31dOg=; b=jS5lrvaIbG+kO2jm
	5lBO3xLJjt/Bp1w6CqNJL60jjRGY3w2xyJc7LDSmdPCOxQZQY+OtiorEKglWwbwu
	2Z4Pact/JiLpmDv/ozy3HQAOaBItBqwhWoTukMbvwaOrOwgKX681+661v8pNPEwQ
	3hSW2JPkN3ukoM5Y5kdx7FxjI9l+nx9IwsBsN95vGk28Ej6jTFeHBT5dLLck8s6U
	hwzcWB/TuGhYU4mKYrxly6ly3MXUVzjIpo6224Rof44roUiziR/vg89Ne+hxaf4u
	c268o+Yl74RdIYJckVUfJXPfyNzLisFsBBhjBg1hXfT+LL4iPajFkK5W5rpxmkXK
	EVkEmg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5jnw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:05:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ef62078ee7so2199588eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778227528; x=1778832328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvN0kePGR1TH0clH/Tb9jn2xAN3aOhuryZmwHL31dOg=;
        b=GO1ufBjntG2zxsIT3Ux54Dmt+A5n8hO5Fq4cnG8kdVTo9ioQvxDLcBlD7VITnW3Nfd
         YbAq5fvsrJMufso32HURXZ8027yuOxP3veDrTrrO4u/sxLown/3XIxJ53OBRMIj9ssfF
         rhXURLLU4P934zXVLuMg9fC0AezypXtwI8+sfTdENpioh1OSickqMEiG3MKzZKZ5CqAX
         sTnmoCRqKHYRyIGZXKoyawbY2V3iUu3NmFscSN15uTBueLRJrbdyi0rgodXHCDoPlq3+
         yu4Iq0myxNY+GzpeB7JBWnug3br2aSb5JEreQnv4fNNfu2AOhx5ihvlaltScwP0PadMO
         neSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778227528; x=1778832328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KvN0kePGR1TH0clH/Tb9jn2xAN3aOhuryZmwHL31dOg=;
        b=mTIm3cf1tkWIkCXglqWGJ02Gnn0TI2hvg+rnbfkTIPBkTMaRygTL1j8WbBSt4JYElX
         qGCBxh7Fiuv/jeN9IQNFtm3Su95epFC9nCIUPxRJzDVNjJ9dJVFysz8Q4ze7abkHO0wc
         5f1V0+DF1DaXP01XQzSNMVdc3Tr5ylK2kPVwI3MEmsEENI1JXpJFZcH6UeIZpFeV3UuY
         W+2wNWOs0oV1SX1YiPyxEeFvU+u100piazH6ob1JRIsqSjsp6A0d4Bb8zwv0GOWGS+vm
         2FRsbDQSybaslo465qIMEX2MhRlgcT5Vs1eqAnWkYPIVTN3+LA6j9qVDyqW6grl0aJke
         lzgw==
X-Forwarded-Encrypted: i=1; AFNElJ/bM9f904okK2zXYLH/FwHZzSWNm/tdr78RH6ObEY8ttNeEl4sVHD0/f0okOd2Svnrk7R5w4eU+Oe/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyo1y/P+QEhMEKn/2h4ms8hS8uFmjzOhHuU0wCIZcFtkO0WYt
	/0q7NEJASg0jrYFF0CX66Ya+taYtreqHlXc3vQUsmYaUPDs8MfN/hRTJLlf84bSWfEeYaTM5PGY
	vAWKdQ/PNnnj0JdXKwpaaiNdEWK5VSFh8sRuPMtKz6FC2PP8IF4vYZvsn6u66V1Kb
X-Gm-Gg: Acq92OGR7Ou/mO4q7IP8Sddru3z6bXlxLYIxMpUkNBnH5lHIdjDVVM36iQSQIQbTpOn
	cYJvloKsRCj9wM6QaI9awW8lKnfbbpknJcr6+l6zK5bPy83hdGbM+3zdPPfTPn7RYfQJviR3fNW
	BXs4XZcxspSNBnuo93TrKpAVa4mpT4M4C3gPEa3zacUAQFapHZNxgOq/7oMqN/ZJ5vJr0EytShg
	H8fB1AijtZlSfxb9JSwVnxmnY70qFSOPCQ2X5gK11BdOxcDdfYjoh0BkH1rYFYphlhsE67Z835/
	04enmcgd2iKJJqlU7TF1wKM5IKmR1OKBFagaRcSKz4iXy6TWN7b5hunor4IR9qaRN6ZHvgmhp0w
	60Bf3StBV71wIUuj3++keACZxFA9cH8AoIFYv92riQaHG3dEycSlBkNpf5C2lxZQRTDwx421V25
	E3
X-Received: by 2002:a05:7300:a507:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2f544bea5c1mr5782344eec.0.1778227527595;
        Fri, 08 May 2026 01:05:27 -0700 (PDT)
X-Received: by 2002:a05:7300:a507:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2f544bea5c1mr5782307eec.0.1778227526944;
        Fri, 08 May 2026 01:05:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm1189244eec.24.2026.05.08.01.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:05:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:05:14 -0700
Subject: [PATCH v13 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-kaanapali-camss-v13-2-2541d8e55651@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
In-Reply-To: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fd9948 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NzJ3-DV3ObEiBuLwUqJB9M7Ounz0q_pm
X-Proofpoint-ORIG-GUID: NzJ3-DV3ObEiBuLwUqJB9M7Ounz0q_pm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4MSBTYWx0ZWRfX1B0bw35bsBLa
 QURF9PvTGVHXGBY8HVOtL4VvWBWEr0u+8RnbAas6XURQy6bd1nuBxj6qUUyzySjpYr9y9nWbTWv
 cjP/Qx/ZozmpVgweeT11yCNfwZIbDnQrzMgXEyC1ZO0FqmA0773UryDFmSLs8AI9jZXLgC0ll9M
 igrBmHyC3BGdxzXMxxRaz9dmqqfFutf+oHb/0GhKRWU3gKpHcqtc8TpCZPRyuStH9vBI2V9CKjd
 2iY491zrX1mLvm6oZsplFciO0c+pUgzh9uYTGmCLbrG9w5CgzeuV10WLS4mLe3mDr/y4lgwacdU
 drODpg/3FOWCvPmXUL+jxNZvaeVi74M4c2LfCwCb5+K9Nl6oqyirJ+8Jj6QuWWyc1n2FjmAIHRY
 6B6LmRmYBpojQbHdZ2DbnHOP6MaNJ7aNttLsedsQRaVLHWmwYltyuE1nmY1xE1UsIec002JaELN
 q2YLD0zacgItvnwnD2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080081

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9335636d7c4d..ffaeeb9d1797 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5102,6 +5116,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5316,6 +5337,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919..2820c687e066 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -93,6 +93,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

