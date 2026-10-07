Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6754484234
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363750; cv=none; b=rVFAENUVou853GsCxETdjDiT4IoSWSEbQuTQ1BJgjyvsVZPBa8Q2Q1OyQ2W5dapG+I6H+L5KaEM5wcpAhSL0BSopr25eTPz8GVrfuXNvvXRLkL3iNEBMwMoySHOVfl7rP+rboA+QPgsGYqE182d553cjVnw0TvH3t8wKTHrOa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363750; c=relaxed/simple;
	bh=VOMacKAim2NeRKzYRGCKCM59giQCmbzASTn2t1LQzPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SeHRLg17CHCsFuqYJ4tzJNAQumfHj/jRhPqUfndPMJVTukLCYkGoQNIxiz0YLvBHc/UTIhjstIgvdVie4l1/UQkR4yjyv13711zqnqSHuO/JexL3fvHLHWoB2QPzCpTIJ+hXrnK0ggspzPCBzMnQ1x5z1/qRnV6auFYvpESh29Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HH7Wmike reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HH7Wmike"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jhAV1873625
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zwweVgbuw4Q
	eHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=; b=HH7Wmike1lXUF8mARPRXqCIO8+t
	1rgK5rDHsaeBo/TBKj8+bXQioYfHE8Xfq41tAckbE7N7iIu4lt1TD/tS1mWVxKYA
	eu8+NOJpPzvsPa+WwG//pq81Jovs9HxdUlJy3uWHWoR5M48M+MpAdGSe1Drj/2sT
	lv32CLUL2zIMTGYZ29UrIOd6fLWEMNv0bUsSUh2Jwhvez6bk5NWGB3Ts6VSSWuI3
	Yx2tA9ZQof6kSsmQblUslBpTB5WMYBA7pfGnDWxWW3jKU6xsHAHO4EiCkb381ZxX
	9pWuzxLDS8A0RtLZ/acsE87OwHBW5irb7cOWd/556iXUrlXue14GC8XAZ7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rnjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:01:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca4a2b9c4so843206485a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363715; x=1791968515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwweVgbuw4QeHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=;
        b=Ys3rzf9LFWfF/YB5l3wzIUWrt/bCHkQdrSVck4vZmOw8RE4o2U+vL0hXEH6Zs9gUGR
         ExKvIwZ3b82V48QNno/VwUxw2fQTy3lhzNCCZbtN4dgdWP5/7a8lKurIjmoLi8HzV2Gh
         YaFVNeT6qPIe9JIcV6koM1HU3PjEXi1FgIHqjTlTbhtblsUFI9cxGn4LhYatDKqvfFms
         m33doEBha1L4FW6MzS9dyJ9ZwLziFvQlZ78p2nteSQ3rD243EtuFYmMUj/LxRKpQ7SJV
         2tjRXQm72wBoEqPincx/tAb3KTpIsrJJlPNCML8OUHll0Ri3UuHcBUaL9MeqF31b7oep
         aw9A==
X-Forwarded-Encrypted: i=1; AKwUvBwk12OGH3Qi0EAYShU5W6npgde8fwpVuTwGyA68g6lWCo9fXX1goVkyNyP4lymzwSjHmsMK1UfF4HT2@vger.kernel.org
X-Gm-Message-State: AFuF++lKo+9eAjlyiedN1vCBpNgviQyfUfuUXLCNPVWZu+rt2p5Tkuz8
	N4IyKWNABx+LFdfLCqbb3tgWiOXg016pISE4DE7rnrik7R9PaSkAKulqANBJSHil+wkwZYcoEOz
	pZ+YWCCIze+9dvN4bXaR7sN8ku99qwNz4cM6HYACfoNz33ftpwV+upWtGUeRKoOhc
X-Gm-Gg: AYBFou14BWjPPql/yCUxQ0uyhd1HgwyhV1btRQA+qNnQDTpM44cDgR62WwAHOpHuylO
	BtS/uox2oIpk1s27rUeOzgrGjBB8zcNLE4JKcDN3hCLCpRnsvJOkxQ0Alf3DAd4FFW6rJFkTFq5
	P+m+Ou/dm8Wohdu32h3UDI93SccrlrIOQFNTc2kPvIez+WQ6wwJ46NQDJGF2NnOclZS5865nRik
	0+mPdczSPG5wVKnQe7xUDnzvKJdDSSiP6zPLwklP71fJSL5BPL9Y+UvHA4dvRI4Xi6johp7aATG
	RP9fD2pKLiSEYrvq74IlF8h4P9c95mTJAQZZNPDLP3on9zXJoGqhYbpgK9U=
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290929485a.74.1791363714797;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290923785a.74.1791363714297;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:53 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 19/45] media: v4l2: add Qualcomm IFE statistics format
Date: Wed,  7 Oct 2026 12:00:15 +0300
Message-Id: <20261007090041.3732717-20-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4PcAsDyBBchk
 +VfjbBmazAyJSni5BZCyb9UmW0rQSyfyCsV6G2aRAAHaHZDILGclr/bsrVsvHGdrQ8rRpVdJxOV
 f5XcSpq43ye2kq68OzHWEaNOeMwv1No=
X-Proofpoint-ORIG-GUID: rtglb8cUyPgpVQdnmwvgjKptR6KDWJdS
X-Proofpoint-GUID: rtglb8cUyPgpVQdnmwvgjKptR6KDWJdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+V3U4AVBsdY1
 k2VZpiaP/O2/oil5FFu1nSwly6UQKaROkzlbwctzEKY2WLXck7cdNecHmcL6fpucEvZUx92Ls+q
 PFfM/Lui9RmYYFbR3Ta2ovZSbo9rwq8vkxjv35DLK/vfRq9OOhitjGPVxyFjT7S7ppndfs+gwmg
 OAo4a21PooJu27/eYxEZbmLOHWTLSX+Ndi7xCAP2yw9IZOiCIEvZgJ6ToFALmF+zhqzI9/c5QvF
 R9rZpysum6KEoo4EyfiOBQ3C8kn4AE9WY+UTz6ZDiVXMMV04+1YmdFyKVHRLtC74+Xha0TgSN2j
 2Yi38R/qtxJi6kSJFMT7dEBeHXjkm4WpICZ8aV7ZZJCpH7IlswJF1x3JZpml7k/mwp2g6hmSPMs
 E6qiKTjzBQlnYQBX0MtIIvU1JLE8sVI9WlMYA+WY6nZ8otiG0fjb9eegubFsC+4t62+pxUDYoOJ
 sllfxihU28Fuumx+Lfg==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60a83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=ayFhjqOtJfiHK51EeDoA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE 3A statistics buffers with the QCF1 metadata
format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index cef1593c1835..b7173a258225 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1467,6 +1467,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_QC_IFE_STAT_3A:
+		descr = "Qualcomm IFE 3A Statistics";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 70208a9443d8..4a0748b60a15 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -876,6 +876,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for Qualcomm IFE camera sub-system */
+#define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
 #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
-- 
2.34.1

