Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662620;
	b=Yqj3Ucpv57PdfHO9ETia/s6HiE6YnpOniTyEctNcB2US7L7HsS/4CVjpjiLFYr18AoFC
	 twi8hwnPObTQ/CkxHcTai3mGMGuaxRl0TO0NxEgvDDD3PHS+CcEZd1Df674wjnjgUVL93
	 SkcOYf8H667tMK315XKS5Rn6JIYatuQ6lbzH/Jnag9eM3q0wyMM5aiaVigyQhx+8WE3RF
	 l3lspzRqULyvuC7rTCVZRjn0zCSKPHeqC/ta+RRq06G8dJk0+zfESuY6Qyl6R+4O6v+xC
	 GN9Jbl2AZXqJUGB2RTZpX0b+owpLNm05S0aYUunA86ULlOVN9E6KJkeF1CpbyYMBcUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
	b=q9WBYhR98U3BkccX17ILIn6rq9t1pgSrF21j5bQxq6zF9B35iakzDAeVXCgHeU8yLxYp
	 xPb3pDLI4ksoc7qQI2OGpHVlRfIxzLHHWcm5Iv4xAOYHDYjbd92PLFb74jgCrZNyfsK8Z
	 udaUkGxOVUNdbEQlLMh9mU/IkLfK254f2wXlfeobdErDm6Ra/jQi5Cji7OJ5zLQDLftY/
	 K7h3IY5go/l6mn3uFmg5emEuoRlv7hzqTAeR2fR6ktUKOib6e2Qcb5uv4NhL2HmGKeo0q
	 tgsgf5ZsoBse+ZF/HfCeMPZlYevQD3HIM5uXwUXiorP4szO/emPEOOx05aX13VSnV5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0p3ZHfR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arazl7kh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D3606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0p3ZHfR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arazl7kh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706IC2172512
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=; b=R0p3ZHfR2m7NmqN9
	Hm27yZpt95uO8ImcPXzWKdjr79OxiD5ci/ctxpfMM2ZDwVciTAOOsMjAcwThbpgk
	TUnaZZM2s8fYTj+RJearPO9BaFDY382vkgQR9pb54d6cLU4aAirMMhToKUvskbao
	yFcCX1kQ01jWCRg3t8nm0P3R0EwNQlrSP6Ko0ZNVDgmbz1d9veAcyIPfHYRLumZB
	aK1/Y+Q1F3N7SHuoPnJO+poi7VbpsvJGHYOK+jGxiOAkTcTg3heIT0oB1yuvXPvc
	FX9i+yHgFUaR3UDHeVUugycDb5hNpy53+RbCvRTVphQUwQ9FNakP+iG/vtTbeOxl
	ghtZWw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahsqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so6031959eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662619; x=1793267419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=arazl7khgeOjEc9Z3VWOCp8W6IEie4qDyV5eQi84gv8NvzCua7aDQMVyH0Il4/+s7i
         QtBWZCtCTfgPiLyKJ+zNMscjqSJnVRdBSSAvmxYIls8wvE8lzfE+gloG+J48Xuqd/PP8
         nV6Fa36LGwJBny6s7WuNauOpZ6CQcBGlpQi2J6HezVz0O+Buwz0di9R6T0GHxppvdr1a
         OicvKkyZkmIjlEzgB3ZnMJIJwZ1CCr/jSDQUjPvEaQZDXZwfZbEeAEvuX8ZKpNjkJifQ
         P2C2TywrY4gUmq586FNA7DnB/8oaBiHfjj0V5mSGfEYtP0sTURuVHnxsSpqv0NMBMHk6
         kIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662619; x=1793267419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=UFlO0Llm2OVb42vjBmIHx0+MCTrw/0iuy3CkUhqfG0a//0d1idGLrExhxUEFkKQRiV
         UtklqEj5h+rfuwulbS4/Fe1d8vWSjV655r+koo/nuZzNdjx/3YTW5ri4pBC6ZAMfNJyb
         KyEWeDaMHfcQirryEkoX8r+zMcBgn1Eg0j18Uufn/uvw+Ym5SoqmxhuzBfeUjif5sxbb
         +iBw6hdHyqtFFMjPO6FgKxjNcojiDFbxFH+WFhL4AmqkXMzQuG9I9b7hpaSobVOM+l5A
         5dxS70VVu0maVwZzRl7ebZORSMKNAs7Y0pA6WpzQFsZnH6sD/HT5jpwUF5EH3Xd7chfW
         lYFw==
X-Forwarded-Encrypted: i=1; AKwUvBxc9gt4LjTUGfP9E56IUrFX/TbE59W/8yjjbh0LvJV/I5yEZ2RIyks/fUN4mH2/+/MeK0ihdDuomPEi@vger.kernel.org
X-Gm-Message-State: AFq9FYLX+rBq+3xTlB7IFMFZqBu+YS34jAeqAapCAHydIPMWquEwRsfT
	/Z2rFzo1DuVN6YoV0tMnDoSWfxKHlNK1ItlmT9tUzDKYs5dKZLIsnd1ropmEiQQ7qWFtMPfNLuj
	IRV/1QfxSy+lysmqr5aSg7K/ptdA+jwQH0k840Zt05VZdZXoo0skF18I2NyZQCzO8
X-Gm-Gg: AYBFou3ZDRJspIwayzA6fx0/64lqyqM8gD8wD+Ke0HVoghGPMxY7aTOVd37wKJMyXjU
	5GQLBjTsC3+IjgIfrPZE2Xfm8+Zms+zZKes4QjisR+N0OCf2m7SN3JLGeamoPuQI8RaGCx5VGbI
	x3y+SbPePpfij+rcvsq6Wbq2iXsVFdncsiQpd2ueaILCRV4W7Iwas1c1Dx5ustfM4+LeamjjkOh
	qE39vehTzUu59tCVOgkLYDuyXd1CS4pVARBwvEDMo3BDzOLOfOT9PCi6rBWm/e2j2ZUwpDYSrCj
	Ib2SwkvgCASNA+MakFaz7WOg5pjcasEpix0Q5qK1UkGsXDW6K7VkqsatPIExTX3gm5LKhmRaJKU
	Ba2U6YwP6i+K9Bp8moln7ARGGU049s7pIPeA=
X-Received: by 2002:a05:693c:88d6:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-3674e93db10mr6656097eec.29.1792662618596;
        Thu, 22 Oct 2026 02:50:18 -0700 (PDT)
X-Received: by 2002:a05:693c:88d6:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-3674e93db10mr6656063eec.29.1792662618102;
        Thu, 22 Oct 2026 02:50:18 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:16 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:43 +0530
Subject: [PATCH v3 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=1543;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
 b=AMPRGKKPL0AAlxTb/0kO2ZhkzoiigdpHLJ7uyGg7Oexm7OibvBQOxl9aAiSXGNgikkJ3mwclS
 FY73FHzjfpZAxSo5s5/4S14TNoUhecfT0LIfb6LJXTLk2Lskl5sT5Ef
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-GUID: ksnpb5lBwFZ2FCkzW4V8niyp2pzDFIBS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX+uPQL5GRsyfD
 we981iS3EuODRHISIedkF9D2nw1qJfhiUnVL4D6mBeacdKKe1ndLLuRN0at2SWEzPe7XE1GD7zO
 oWUVRq/8bMu7iaUShAssw56uI3M3upY=
X-Proofpoint-ORIG-GUID: ksnpb5lBwFZ2FCkzW4V8niyp2pzDFIBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX1r8yz/FnMhQe
 vYtGC9iX8qVzSQZZK8Z6z/wAzlEW+gV2dO6lPqbpRPW4qyiclWjvDVKKw3a7/Z3W7y/ryjKcCfY
 XNgnHrGfNUvnWTNx9dTP6wlvvx1UtVhMdC8p1QzMP/2HR6y4mYJWrU3FgKiwmv008PjnMCNnfcM
 /iudqVW57YNIvLwMnoLSvfVliJAC3SJIl3KGy1tDQ6w0h1rhhHpgo8Z7b1VBmIejySbZe7ZlGnn
 qOYmSRNy00a1jVShJok4cfckA1DmpMMCsxeISekfSg+U+UFuKeNeHLB8Q499Vs5nHl/WKjOcs+b
 z1c6gN6BC73PHA6B8Q0CamJQqbNRG7HkRU1QZHNn0I2nmkhT7lhVrQzlowpDiORaA7fNFpbRfsI
 CLIQeiMiJ2gJWT1mdVdZPsdgPFJdqh9J9JaKKYTr7f11mwjNnwT6DVjMZkgzU0vOWiPutWN/L8R
 y8uJSrcU6RS05fLGEhA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9dc5b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-Dt519yxSYS-YsuSjdkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220039

The Qualcomm Kaanapali platform comes with a DisplayPort controller
with a different base offset than the previous SM8650 SoC, add support
for this in the DisplayPort driver.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9299ce616fdb..348eb6967abf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -158,6 +158,11 @@ static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_kaanapali[] = {
+	{ .io_start = 0x09ad2000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -168,6 +173,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,kaanapali-dp", .data = &msm_dp_desc_kaanapali },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

