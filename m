Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB474C954E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463420; cv=none; b=FU94qkOA15jaBIFewKRstsg8IXkopafD4a1QIqSdWd2PmR1vdKC/tlYKSlbyEOc28kPQbhkYHdsZzc0omI/ucKsNPsPQoNjz6IJRvqwMk1rlhn3mYFrIHZP2mgxgygBp/Q070wofYFJheMu0UK1t5KhFDZ+cDtFS+x5GxApDbyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463420; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNi1jab8YZMnbJXEojmT1Sa6V3uXJ6XWyKX8RXZSlEkKqEB/+vOKbkocgqmyISjmWTmqrEfKpl3o260FqZATdul+FzPjHsnyzC5IWAd4QahEYhPqLD7MyDmTeLngIzS0b+atVmmEIwko7hPWZjzLMkMH+59+HIH79g46LlVSNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgfMYNWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asvTJplo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgfMYNWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asvTJplo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5UU6357750
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=CgfMYNWZdBX/GBdQ
	aj3opMyWCiVmB0q89LHsHUTw3FoLoXULVVCODUQAFamRW1lKdHirb4l1yMfRgK4V
	zxpSRF7JYTPYe+sG+o9eCkiVxGHUXoOwYbpx6mNpD7tcfha1CIQrja1U3hMwM2nA
	FkubDIe8RUrwVjr+IS34XwSNqaMoV9uRJoLsg3tpCmzpwqCGNxAxF7/QqpFsZpS9
	2DpGQBIzFnPh1sRAoW+63NKUg6DEgPCDowEWIxszQVtxwNUmZe6LbTdITv4UpKDX
	dHVHRrCYzYZmeau/j4ZInIHp9lpqSU91PcMSmofHa9U5LRb0Nl9y2lPkMew8NQWv
	BW0fTw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8me6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:30:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b099b539so1257769241.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463417; x=1784068217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=asvTJploLBkWLnLxllf4dA+Q2y4WHgWCN0jHG4YJWB8xYCfpn7QQ2w1mbM5BlGaiOD
         zWZKzKzj5lD1P+9D1J9K1+6Eky2PLsOR68xHPhok/TihFg4/+EdHpd/lN3Vq5yMLi+iB
         8gynj4oRVD94/D2O1iTBn7ubW7ndJ+ub6iNdZf6EQDrbfLFPMrcSmVf2OJX6kV8tGZaT
         cK57m3kHbMTzPEiGtLFZcHRBeDk58w7MVCnRBCq+xREA65Z7CfSMX+qyFqOBUH+4YhBS
         ulaAbXdFDnlY6zTXLgLDmE78R+6gE2000xLp4r3/b/hO3XrcE+kRLqtKtHWS8iP+Itud
         5opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463417; x=1784068217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=QbdXRZsy0KEr9UlGa+xn9ra8ENqe08Fq9L+oy+dnsPbeCqn46t/fvpkWF1ArxO3czO
         FXYJT28Z11Oir4dcCUL65d4i7jTdxWWgBxaC+XlW/mVZzjKPPJx0pmgspgBBA7An+yxU
         EEacED8fcLHqUo+5TLXtR9EBuhuY+LK/WA893DsWgmz/YFZuhLtAoe8N2w2ebtrFIeId
         2SDr9M3nr4g1ganiUZpx/YNdL7miQzIkXJDFjU7yoNN7NpGCiqQ/yNAhGjfarwLI0y5h
         14uDfiZqVtmo05TvLAbBgdIEOqASqFBOc9w7zRtidoIRPObv3A8bdVVpUljCT3x1ZA0S
         fxig==
X-Forwarded-Encrypted: i=1; AHgh+RoM3QxavbIzIVmjVGymEz12gWkKeIFOBVQ8BhLVkDj/icrwajCiwAEmt1B3VTuQ395tDjyy0DYVz2so@vger.kernel.org
X-Gm-Message-State: AOJu0YwLtMp0Bc9XgXsqDho57pUtBoB+fp70wnBSRRorVkeN+NCZmGay
	SlrfrQyJvZZmXE40q1ILxJAwspbL6JsTqB53jpbgJxunGCskxjLzmKWrHMKci6W8tE8Dp61xjGi
	autue8AmrKnw5SVqwkEh40vPo46rrT27qb2jlBs2oY+29CmA0gToU/QEy5x8htjPS
X-Gm-Gg: AfdE7cniBK+8Y92MQ/v0h6zJuZ+sFtnSaR6nlvgZkawvnod3xVYg5ZfErt9eSSWGBKm
	e4X9oUS970RC+BHwKF3K4St8InjHvzXUS3qNW2gSmILSg9J2XKsTdCBoD3vUfnC0ayCIhp5BmOm
	Uan3HJ7JZuwwEbU80rZUqwZA25/RtGn9pnLBKUpI8Dwo9yYV1/roYYkapN2fFSk6c/wCIr1sxgk
	+qZ2M4EvPYWhi/z0v3XbpkLEUdnXHbYmJjhDMO0eM4c/C8J6WDvj5VepQK2rk3+b2eo+Y5XWk+Z
	UnDdfL/FJqjiTf72ev25vWJ6AoF53RTkJW3Pjao467053lRsDCtPuyF5IftD3Fv3if7xWhbxJhD
	2lL6gwlUVhXPzKALk68Y2RfyhCTN0DFADhSxhKNyFpMTi03ldEXFS/SPxATsJEZ7W1xt0oNb5c8
	66im0ZbY0+P8GoyJwv+5o6hRCm
X-Received: by 2002:a05:6102:819a:10b0:738:2cd3:2b28 with SMTP id ada2fe7eead31-744c21fe8c7mr2219841137.8.1783463417453;
        Tue, 07 Jul 2026 15:30:17 -0700 (PDT)
X-Received: by 2002:a05:6102:819a:10b0:738:2cd3:2b28 with SMTP id ada2fe7eead31-744c21fe8c7mr2219818137.8.1783463417032;
        Tue, 07 Jul 2026 15:30:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:30:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:29:00 +0300
Subject: [PATCH v6 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-17-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGpNfaqh8eD09/9ebEAKHQImNV79crVg8ysUpmvNI9cK5jX9/
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqTX2qAAoJEIs8ij4CKSjVyLQH/0GE
 4mGVIOZx/bqtvByuFLo6kSLLoJG37X90IkFC2o/Wv5FYcjxJAMQFN/SJQ+BBJEdL+BE1+jZ5Qd1
 KV0wqLbNVspBWgs0p9rPHJEb6ZudcihD52qtacYIXAvYceQZakmt6MzRkDpydBZsCQLhm0lkhnY
 /zpiTUxKHQztR5C7e6OgLkt7kIQtOThbdH7CluNXlYEs9/OJgUz2OTbzi8arS7A8oVKwsieHJLt
 vUHJ6zXu1L4VXWZ0G9AUXOQmJEUtr5JDxQVyyhDZjd9YZbdjYUiGFR68KUE6uINz7EOgNH4kCGp
 SXnIOXI/BFb9YjGpnyuRuzqT6D5THQtO+kVr6AA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX9ap+7tBZF4V/
 xLxJFWu9XTovs+PV/P5m34F5T85Nm8IPabhkwsVtUH7ocmlkDS5eLW6r42KdlEue73CalnRaCx/
 5QPdTDtEzkmnOk+avrn0bqrRNrmW/Y1wZjwplhQNk4dk50j/tw4YW2HEo/NC5uz+1bGVkDkYmCM
 jDH0WTnwCGY/rIAO93iXKQSiiDKIl0svu+9BdvoQwDwiAyj0G9p5Xfw6Eap+1g9HKky5dHm9FLQ
 PuFWMUbirTXleXHtkDFhs+ANHOt83FuhqZtiy8BYZsSPcqLlnlb/cKuEOnLioBVE8+uPzZotdcG
 7iqnt0GRDDeJgReASIQNkEZmnCwExQpyTEP9n+NwT+5M4P0SViuHYKJN5uw4vnO6C8sNi8o7jyk
 gHTmQztE0Qz+qiu/iARCUGuUrWQY/3oSLlxs8As3gxyQaK5y3n0qIgjP8PWgECamnhF/L9mcWhH
 cD6DT6eCVN/bPBmO3DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX59DtwJne3iqN
 470rWFJnYwbLX1e7weCFMtuxX9g1D+cHUPJWjkCX1nxbWaTBckGflHzufrNIlIVVx+Si7FYhRZa
 4+VAawx22t2GQUQSCubybSi/6BZEQ3Q=
X-Proofpoint-GUID: 3b86kkWFGG_IuyaUYnF1rG37_mtANS3u
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d7dfa cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 3b86kkWFGG_IuyaUYnF1rG37_mtANS3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070221

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3

