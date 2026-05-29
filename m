Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95E3D3482
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065489; cv=none; b=X6KgVJR0XqAxH879gXjh89sqO2lQtsscfCHWVuC9N2FGt3dhRTx1XDrQkxR+8qNPWgHVpiS1Tc+325jafyZV2zPqo0rnTNpUzuNT6+K5sRWCRzfeSmvJaqsqgkowIucz/2pH7Ez+beWj6JJLgPLExEdc+9g3fZuquxt/sq7Iqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065489; c=relaxed/simple;
	bh=AFnhWWqFU62BMrFxqMWtSMxf95nuM8PRRSdLIYVhz38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4ieHqCWN7h7Ex1kngvZAGvSZaPduDuohg5rA5OgSMQDXGsVfIb+agRuZrFEgW8PQ81vQQk9WvT0BPLJ+569rZn7CidK3Sf1ZWI8jFe522OM7d+RI/CP0nXX+Nrl+paryBBjhMZIETdv0pjBAdgLjEoTMMGtVMZfRZhh9DId9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XumbYvfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hj5n04Kx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XumbYvfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hj5n04Kx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKipF4119269
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=; b=XumbYvfpPla5pIQG
	/pyPqGtp03CvFFyUAfFl9kv2t+4xNpdSyTC2H3JSnhL3N//qtoWIQ1fLpvWsbr3A
	kRcRAEDqUPNaDe+gKOjTArBfGQSpUdgDn7b9KTe46UsHQghtW6+7pInrF8OvyHe5
	tWsqz+Acu5TefHHVyk2RfYNg7UQ5tgs+BW45dCTDtryGKLYPuVmsAd8sSbCBrC66
	coldsoejxnaMBvDcHt63LezsqzS8vFYOyqu2LR9awpJPaOxlE+RnqzOFK504qs2r
	eNLGo+0LQhvSsX2yulVm1mdlZx8cROBGRiYDjGoGx5qHwLuBtYSBmFy3UWoAQnMJ
	qnFLkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rch1ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf30576aa3so2078155ad.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065487; x=1780670287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=;
        b=hj5n04KxwqhEQbXefTS++nIvuEmtgkRsOtHrjPu1UAGBzHwaBMlHr1ONvgeU67URPO
         z2Vrf9zS4ms/smdoFnaxzP3d5xDta5tIrigyqCkIuEqreBhL4/WGApIY3SewnzTaJAOR
         NGMsC3v4pdNq147LFz6E9s9S3ezbD8BPmKcdp2ovWwJMhmt2E+Bo3IjgJlB2OgJsvrNH
         vMhbVRz0vKl0ykK8/ER/9+nEl6s/Y6WE7i70WBemaAh6qiohCWum/vISpUcF7edY0X4F
         +G7MJjBT8QcKCf3bQHChoLEAKc/F2ZWWQhO6lWqdu6R3SR320mOKOq/gCsFWnVlJZtkt
         U7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065487; x=1780670287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=;
        b=p/aWkPn4GeC/43QEuX+HQ6MS8kRXzPoOqr9OYaIcRiJL8v8ga75VVL9TjW43CWuLph
         9RIBHFXBCXKHmh5Wcyo5XZ0HG3Ady41CCJdmHUiAizWWBX20CXPZFEaq4eR0vwb0397S
         TTJRIwMpb7obF9YTgdJ5wE2N4RpTqvIgfnspm+uJZ/7kbkJnDezaekxG+ncCBAysZeEl
         ra/mjNpwYWgS3FmR46v4HGUbywrgztvg/spE8tw4stkLLVLjJi8YjrIxCFcsnnEw4ufA
         9Oz3MOHfHCy0BRBwkouqsMIp3UcWkNt1Sfdxy8BwylgW59KhsiAxZ+ehvSG4QgJwHwed
         30aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+Kswgqd18LIZVi3+TI1psAnxzW0oVv8JQV9IwOv3Cn3DJ8aHpz0a/L4b9ApfZW8RHHfp5TwacMDdV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcwku4IBf5RuH7iMp2ImC9a3mtCxskQ6eRo5BvTdNj6zlTtRtb
	X/0dN/ZTiLXacSBruMMXK71Ar94WFvex/YQ/HabGf0rB1YLL86pqUe0/nVNEwAgXpjIOhkmIjlG
	8Y8r2IA0CaQIJEw3DDZuF7xW7y43plro+FKNMmYLdI0+2CjkCLrJk0UwKoLO+tGFM
X-Gm-Gg: Acq92OEcEpO+Y9FTdAU001wHHbkvTFOArYKs4Q5TJ1kkF4o52q0dqh1siWQAb5fomOO
	DyB6ZUS/BuAVfnTRWgfuuoAMhX/MOQ75n75fFXOtb8SUZXlftbD8yKOEzbWOeNLgRcA5XBVIPkE
	mwilV0ZsvAHdX1Q1vNz4BOnstGHWY1zVKWIKJgbZywv3aqCxTAJcTiUafg8PtEzCWbjvnCMF000
	2mvJeV0QxIlmlKzuYfzqlxqY3bYwZZWWct+26LVBnIPDBzCP7G+L+suie82yytrUbOukCOJ5wSv
	XHULaU5gbE2y61uxDJgb3AazvwTCiwSIJIilY7Pa56EtCSHw3xiyW3BWmpBVIL0aVU5+8d7n6E9
	+Eioj7Zq/1NJ7YFaO4psLVw33Xx2B6noQ7b1h57FYmY06QpWzkf2Ok6VPuaX0FFjNYA==
X-Received: by 2002:a17:903:1207:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bf368468ddmr666475ad.29.1780065486925;
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a17:903:1207:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bf368468ddmr666105ad.29.1780065486483;
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:23 +0530
Subject: [PATCH 3/6] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-3-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1895;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=SoZWS8qy+52nFSLk3zZ3aHhqlfTn3tm4mIZq+rTGyxA=;
 b=+H2oSfyzxTsPsAB7SoX+NRPkCfOerarMe0b4VXUr7H8o4ujMJKrcO8kZcG/TcpwLxsNJbKbW9
 BFJIhuPHW0+CDMNLf5KMqbaZLGUvTwb3UcYKsayjEorHNh87hJxiqXQ
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Proofpoint-GUID: p0GjRjqcrV3J0wAIKzitU9vVsCrjMno5
X-Proofpoint-ORIG-GUID: p0GjRjqcrV3J0wAIKzitU9vVsCrjMno5
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19a4cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tcYBWJ0pf51xna4_flAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX5C8VNR6nzFJB
 iAGT6+hXzxPezMnygIAEa8gW8Wyv6HRWjbcaknjq30xD0VyRF95VlvyjbdJFfxzjF+Y2E9RTTT+
 YY/H6UoCby7JY5RrLj1QZP7R4zqON1U/v3UuryTMyqi3JMJ1l0pOAoQGdzXFxqaUjGZCgsakbg/
 hvs7+83v6MqKqI3/maxcr/bmH6OaHFbpm9aW616yy+4VlYMixeTXD7fm3nAuDqR9uZwC02MEMqU
 q/7JjtgEmcQlUutRoJiIcuXu/JFLTAzk1B7grKTv7CvtGYwaSaVM2E3dUTa6cv1TFGG0zI1y57W
 kyeK/3XtoPzWG9vGkFY6EAVHtxm221i3p7HYE7a3xuiwwra0X8OrWDZ+tnAdJjYsDruU0zppZxv
 5/jZPOBfSR+lR01+Rh5rIK0spVURRtp5G5S2agQS5N6Yt9H7bF56L1G5R/JWCdsdzwPTFq19wkj
 nh0S/CnzyYQuX4FOJmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Add CAMSS_GLYMUR enum, Glymur compatible and Glymur camss driver
private data, the private data just include some basic information
for now, later changes will enumerate with csiphy, tpg, csid and
vfe resources.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 6 ++++++
 drivers/media/platform/qcom/camss/camss.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..c6276d746352 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5507,6 +5507,11 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_GLYMUR,
+	.pd_name = "top",
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5740,6 +5745,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..31085b3526c5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_GLYMUR,
 	CAMSS_X1E80100,
 };
 

-- 
2.43.0

