Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75B30ACE6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637985; cv=none; b=QWqwDup3Gb7GcxJl3IDXHtoFwsdVAgoE1l3kzQ99eVjjHnU28x5PdM5OsFV0FH4xM5KzB/ksOOQwWzx7GtDnI5ecXkWx9K175jnFzLxDz/PmXS9+eEmaQ2ZbL815eaDQWyNWvIarlbZ7gOKXE/j+oDiBfjw0Ecu5UDxHJ53UTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637985; c=relaxed/simple;
	bh=o7FBTKIJJyfscOK4BGpJqsmGkVsLI6G5gCzTwUk/ink=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvwRqk6xiFX/GVTLGhJahKbhkgj9VORvdp9op/9i/CUc9Gl7/UiW8hpsjM9WUzV0HaQIMiMtJNofikiM3366T2kZwk1z1Kq+h6kk0XVQQSw+j+hn2q4llfZ35BVI86PqwkIdiUWhlJC7v6yLDV2LSFXhDtr7OtYkxlorSv1bnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8gOuF0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jjv4VgQM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8gOuF0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jjv4VgQM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARNpH1499963
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ue2ael/NgWihxiKza333EZtUQUQbwo1TWMqZTaN4+3c=; b=b8gOuF0fFojc7HUA
	forz+g6v7shG3dklfgSwOV3U8Tb/YpnHokjqXhON2HzbLetwungByF1CRYwnLMN/
	IZX/tcxHunAFUuObxSO8xzq9erFpMUGxufWIgcH1Nj0wVqxkAeJ61yVFzT2uo4Hf
	9pqbvqf6OPo5ixZ2g5kmtRfH0uSy3bzPVxP2XZpsK5TlE7BXyrsLgRezNPNL2YzI
	eR0rdOFXRX3+VLhfZ1ucrE0mFcQZ1ZpDopgn1NXba3leD8hpEQ5Oz+/wkDgC9Laf
	u1BzRqBupCAk3vDvVZE+Y+C57/OOXK1yWeca0qh+Y+A4noRN1nLclJKnkq+hiImt
	ni1gDg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtcec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so6020031a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637982; x=1785242782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ue2ael/NgWihxiKza333EZtUQUQbwo1TWMqZTaN4+3c=;
        b=jjv4VgQMZaUBHeW7+MqfR8a8OA8AmLU/+UT8JSjdGoNao+US6/CppXz3jqv9w6rPQv
         Q61wQ20OL5Vznb2ucYan3XxOx4G0Z05xuTsQpMuSsHOU8mLLQNDvJLLzaN6jExUp2pYS
         U9QiX5+ZZVkmJu/50adIkz8aoNAvK3QobvmnJTWKm7Q+tgnyfygpkYATfwBPvemq8iUM
         clvrERuKzL71HsKcbDh0goePTZE57DeWFLOQsu736zZvwZynGbfHQkoQ8xYqg2UhLQkl
         y5+ho/zfGomL7n03cIvtP6e7ZSrAfKbLXl8DOE7dbsJweuqiUCPvGMx7xdjZHttMx3Vu
         rFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637982; x=1785242782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ue2ael/NgWihxiKza333EZtUQUQbwo1TWMqZTaN4+3c=;
        b=nXVcSkkDTjKtEcIKk5SGlgGB++jfDtEBNfLSvFJuDwRqwG8mkwh80rtAr8MzpyWP0j
         ZqUsZIS8bR7uces0NUOOqQXasf92i8/ThQoR4jLBu3Ack8pWBfvA9C0gHj07VFZT+wuP
         rt41C0HYN6Nm+192btupnacs23DcyUXqSowRg5Sb8MRiZjn99A+IgsWm46+rs5DhQGm9
         jZsng5ARHRRlNeYN1AwrScuMR3MTTxAVRpMjxQ+POkO/pOHI28k0unyU3Qs68I57YbBD
         BukXnk0gi+AJcO5v6PU8ydkhfPYSE2C5Ur0wM3/GdeWuU+BIOvEshefNkVaEPJQ9H/ri
         vNdg==
X-Forwarded-Encrypted: i=1; AHgh+RpVDOekECesHwefyv6MPAIyBSoqTjRMb0uMue0qE+H4/72m5bXyPuxJkrXsB+WnAJTp8G0cwTeaBw69@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Abm1gYvdJA+h/ZoKwdcU7k5szFRUyYsJsFyJk4AiGcIuaCzi
	AcY9PIttgncDnbqqSmUwxykEF4tz8WHcczwTllXT/wQcNDCenhV+lwhgVNF+arBc4JvIZIN/Dsw
	DAgW/82hIj++IfVjHeWKj21F827fpEqpecZPph6icCrps6SLS4pgSAy7lrLu4K8Zl
X-Gm-Gg: AfdE7clYtvMt17Vl1ltXOYyF4HmU7XSGlLiqyolJFdnevSDFgtChzJ8JE/3g8WI3Rzw
	GfQXAnukojQx6Lex6MgAdDhDlkTwNBmkG8Seyssw/Ji0FAMuDn5heY+8OrRcdq2xzO4KqU2oIN9
	Ig2PgSPLVAnOOaLzmEKWongInEMYImjt7Z1OwTcwpJQZdRt5usTojxhGYbbv8yuWkW3jAY7DIne
	benKkFu5Rw1Y2B4KTqCD2Fyp6Wk4QqR3Nk/sUsYfH8/QKvibKb7wZZ9bslJA9G9Uq/38mwCf+V/
	vfMZMEbU/94ImNktGnRwOmSQ5Dldint6/LX21cuDk8T/jMcFUaX0ChPD3Px6hFXuaAhHqNA1TId
	8r/zq4HxRPrYOoFj6nkQmYF67G2WG3wK+VZJsy71kjhyEZN9HpdNdjyA=
X-Received: by 2002:a05:6a21:1404:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c3ad963e99mr17621882637.41.1784637982472;
        Tue, 21 Jul 2026 05:46:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:1404:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c3ad963e99mr17621824637.41.1784637981892;
        Tue, 21 Jul 2026 05:46:21 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:18 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:03 -0700
Subject: [PATCH v6 4/7] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-4-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: qTcdpIcqe1_5GvLAetXcL4LEJRf_IESM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfXzc+Pj881SgsW
 5p0HZmMiGf6mVoIY31ZCOTCIdc/MnePRRFUY9w7tP6l8qoLuc7vEKsFzwhIavw0bFgmM5MSA5em
 COCsWi8KO03X/MZQxPL0/G811UkZsAk=
X-Proofpoint-GUID: qTcdpIcqe1_5GvLAetXcL4LEJRf_IESM
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f6a1f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFxwwg5cOWCKIq9qzTkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX0eYFiW+xhtyx
 uym1fUuXWgyWGNuwsMmgKOzKluDEF30NNx+1vvUe8wGlcxJuDN8t4yDbngG6RoLTWJW0FuxGt26
 Uijm2GWve+WYHFjEpsYM3w4b6fMZ9Voj/SU2wNCA+QWacgSbRcwfqu0W1H4wVoHE0QIaNso713X
 LxUzWIwidE7PmqMLj+vPB/4vDKEvDcNVfVgaw0ts0BOPxovBSxR6XdO2pTe6S4ppQUrmRVOWdgp
 oIAs1sX4YgIWCnWUkSFrudCRVrb1qpuGuFEA6s5H4bqxg/U1EOKdqOfnoHMe3vDobx/ptgeiC3U
 1LDWubaoRYqwZT2yJJTWt1/oskToMFLG9LsvtibrLP/M3f1l/+gxncG+u0NIbq186CpsJMsfzDs
 hQqW1l8oX0I9G+RiIT1uC8EHi2WUNxO1/gA8u6AUQcfDNXMNPWBnv+eaX1d1/eq6nqNJmwc4Lv/
 ajRSHHcJ+/Su22ElPOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9982174ed1ad..1ab1a0cd82d2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6085,7 +6085,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1

