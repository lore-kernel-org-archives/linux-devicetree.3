Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98353D4138
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674303; cv=none; b=KN+ewaA+o7pnqoqSPEjnxZM82wgXHGo+7Ph1fxoEaonLsLAgSdfx2TRdiPUJcLXiON/+axd45/H02hUmnyxsEUklkazhfQ0eM73GQErdsURFiORMBmN5Y+6r90BBMwWamWnzl0Nl3RRcsxTUJYVAr7gN1Z47QropY3YKyS+9/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674303; c=relaxed/simple;
	bh=njrkKm3aiN5Zc7CJQtaFlW6IU/Xu6yimySfqW99zRic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYwBO5JYzYPG53RTiJxImYxn5pS5DBdZLt9ej1cUwHahhx+6/zJoGZA0bqPFEC7Zp8emX5hFo3MuvhjN0TW6+TMAs+hhts72d3gQ91ZhZM4o2H2V1BrbLqCzQN90/l55q/ii1ZBOCyq2Y5cttYueLrAZgIBsj5iCruUWCvZqZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cawtc6ER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqAwI/JM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cawtc6ER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqAwI/JM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eeMB092339
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGScOXxHIxlcFY4BY/Y1OfU858ahh8r8M2ytmxZhzuY=; b=Cawtc6ERus/ZEH6Z
	crkdPCDD7Sf9Inkuuwb+pM/J+Ahd7qgTlt9mv6SPtS+PiIYRjfkJK4DKb85G8Yqj
	DQ5NUQBdBMaZFzBMRZtKy3BUKYbj2y/OcSD3XlqtshVQJgnC3GqeSHMRChw9lIzN
	M3rRaQPM0j7K4tO70Jv3HG1JMCJ4BLVw4KeIrlwOb1QsJD46ithUCnEiCduP9ydM
	kC9pjlJgDQg5J8doFCzJI+HL7SnUsjreGlAjEKj1fhyUI0oL3lcnT3RmjSd+c9JH
	5QOViw6yhoxIwjZpeEDsF5e2FzpDO7DZOL9DuaYdCEhYMWrA6Ykd9VWm+kluXYqd
	/dsbXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjbw62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:05:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso7278131cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674299; x=1784279099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGScOXxHIxlcFY4BY/Y1OfU858ahh8r8M2ytmxZhzuY=;
        b=FqAwI/JMG3KESbJy0GCIsn2w1te+mqOnNwmQw9N8Wh+crG/SXfqEuaLXOyIKrIxIcy
         AcAQi6TqXs15y6rCs2sEORmTmd2kdOZUytixkjY5297aMoM5pPzszdp4+8JRezUFyKIg
         +P+EtLmGg+2yKICfzQnppeN2ADjTq8Az0Pjfuxlb/vfgAR4kQQ5f6ko3oMSTszrewre5
         MqKuWO78GT67cDLKloOnQY6uGZSAr5ZA8X27k3WLUFwaxF2Ld+GSzwyQfigRCBbrZ4in
         U0G2pnPwfv0CtnumUCM/oioj3KNLrBw/dLVswYvgEy/y0vDV3NBFqwWxI1xnobF4cYeK
         wKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674299; x=1784279099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGScOXxHIxlcFY4BY/Y1OfU858ahh8r8M2ytmxZhzuY=;
        b=An00tqXaQ16ucnaoQhBu3FrcqYhfNOLyE4cf0mSLpypfWBRuhdClpVdAv3JzwwDPjm
         PASFK4zNwrla+cZSysI2ksQEHyRJuboNOtG0Vq4DrbZuaIcECaJuIt7RZJRR6vyqmJ28
         W2fTnOlYjs1WyAUH//4giLwwbbPNWAPOmop4yw0vMyH4zV1yalui8HnPI9YrLiWO7sO3
         twA9FIg5zEv8OfGl1ejjGHT0Sh3tbaf/fJBU92mQngbfMKo7GOg5e4xBBGoI2ROtbsnl
         initB/TakHpfvkKVhc/BbyVRzwOou3mwfgwkW62itzppUf75opnE1wck7ERmFv0dNpSy
         Aycw==
X-Forwarded-Encrypted: i=1; AHgh+RpFzwTkiNcPX7nQiHnZZIqsKrSWgPzMon87aQcC9g79fLYZCFavgPlv/K+Ju8Vd0zhrdn0toNET6z8B@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOVKxkTDSGvh+YKwxTeLl0yqR1URBxVibVsTv3XJZu9syc8EM
	e76DEI0cmwXEs60L3Ax/Z/9V4sSfFuNhjS9oMzKaVnPGpBQ2D4muWCpC1jJ6SCE8ynqWvuf9mkR
	9ARuSamcvUzFBx1PpVqpDyoftQ6y5++8Y364obBSNpqYgm204TyVM1VMEG25NtDpERv8nHMDPAB
	c=
X-Gm-Gg: AfdE7claQi/oWZHhhnZGz/4OfXxGDF1Yea8s8X6eHO1JdlmfV1c7la6hnpg6ob7ksBr
	PfRlR+Y6CrM/ETzUNelhbpbKbLn6XoevCerjWfxjQqwtfC5qejOp0uzhfWyrIFBmn7BxnQFeL79
	1YoNt7PAQDRRaO9lvEyF7T2pEgQrd6BQXNN7nhjQ/36GakMlfg3x69Snn6fa4d+AL5W1oEdt50x
	zkqCq3J0erRoCw8AiMm8dN9M21dAnE73PsQwazraYTGu/gVfISh+NJz8d8xA2lW/3rzSZqyJWnW
	1bXpclx2VOXj9YsPLjWwLh/n5rsvRancM25hYsL+OfYVQPRet1kVOQAO+8E1jSAob88BmBXtUrN
	cFytqqAVIV1b2EjXNuQcvzok2I1DRbkW7ko99M7z6MVnIPoezydAiUq3KdkyOWqF7BWG1p63/D2
	5eT9hwvLzFZl2iVSgbolw8B3pK/Agk2Zsn69QjJmS8vaI366yxJag2p/Z0PNM/dg==
X-Received: by 2002:ac8:5ccb:0:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c8b403b76mr120422821cf.16.1783674299613;
        Fri, 10 Jul 2026 02:04:59 -0700 (PDT)
X-Received: by 2002:ac8:5ccb:0:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c8b403b76mr120422501cf.16.1783674299240;
        Fri, 10 Jul 2026 02:04:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:49 +0200
Subject: [PATCH v4 3/7] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-3-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX3kJ3aldTVMjB
 P76WHBvgD1Fggfpy1Tp7SM/hkJZ9byZUcUwlsdpea4C0uM+xjDxN+mcC4mSXndXhUpEDgwuXQ/j
 3EJ1OctydsFnSMdum1tdrppdVW+fCv8ITTl36RVAxaWkyAFYhmeRreNdYh6NQbaHXq3kTAq70yu
 2nPznxJiwOEtMLomJqDhJiCILDHTZinnnxG6uyrfdzZ+XOrW+gauDsjwi+TRmuZ2LoaXeBqvK/1
 qKg75VRAIryWQ5bdk1evtWDSRDCTY1wTfXiaU6ffVzSsLJlkQeOJWRsSxO59HgLXsv6n8vlnEQJ
 gju7iaJ+8Affh/J2nRqgakzU9VBGU4HL5j+yCkDyYUyfsdkdnVjtjj1ORz/nGWi6pAbuJR7R3Jh
 6Emo9tqwX09l62tmb0rrpV0g4Hc/+LzDVKHlxLBjEcYvWeqMzihCZKSIo8Jpa7zsdE9qYLVCyoN
 9IlVEPc+uFxWfEMq7HA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50b5bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NHZ7RztTnFrf7oJu4FoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FKptwXf8-h3ORRC4TIDkSDddV2A9zBKy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX4AhD6EkIk+un
 rPIY5a5b6Wvv6jhyDMdHrUMYKlfw75UwHrWYz/z6Xsk413nvHCil1lAhGi8dTlCWKOpAy1pWlFs
 50bJXEVejZOxbvdwUlqtyrCEoOwWSb0=
X-Proofpoint-ORIG-GUID: FKptwXf8-h3ORRC4TIDkSDddV2A9zBKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100088

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
per-frame ISP tuning data such as white balance, color correction and
chroma enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..01593493dff63491a36cfebe404d26df34c95838 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:
+		descr = "Qualcomm CAMSS ISP Parameters";
+		break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

