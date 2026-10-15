Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF02C50B419
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058141; cv=none; b=MAII2pVO1991uyKu3vPnoRgIf5Po6Hgs4/1rtG6o5An7oGn8sgTbaC1eO+tjwWSginafVbR1kTuNmiUrV0wFvZtZTivs6hpF+JVLDNh1zPB+Rjgof2SOQp8+Omha1VZVm3wpbjWJu0Dohu03RV9I4sVgMAg0FbUIB1JtziBmigY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058141; c=relaxed/simple;
	bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eaky6Dcc+YC8mOE4qyGjaJQniCjyKh55aka3J7N3MFn1OZJ1cT+xv9g9UgrDBfEkORbQ52LoAM2nDCJfXzM/DluHoDNmAZ8C8HTrEwvtj8w+3m5s+qc+5qGOirfcygGMpDGIU9dEe+/Pp6Nlk07Pl6oKurNW/G923uVXFKhr6K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izHdMitJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3i2buWS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izHdMitJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3i2buWS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTiD2809328
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=; b=izHdMitJr+EIvVx0
	PV+EjMSGVRW75TskDMqhHW75uL40KhnWkW5SfQumy0zoXJbx3pIXEF4gxdpVNA7v
	GYc86gUwhSTVihiMOIKpDFCKRWGfSKVUH9fQlCjIeSoCltLqhVREauGaM8HKjGTp
	RYZ2Wt8lXtNmH+UDav3KWfz6XV+e+LnKjkQ+wBfJO9Rs1eWnRU5mEFPFltmv8rRG
	BIOjGF9iCi4DjvSWG+i/AFDg3Yue43rOQYMENumrW2bFZIwwITaS3/t0tp5LCaCG
	rH0k/NU6drmGi+jI+rOLGBf9UllB0Mpzdb2lFO74Prn59xrpFol7XQDcdOvDhpqy
	CV+uLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sxg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2211552a91.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058125; x=1792662925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=i3i2buWSy5bTrJXpd1n0cnm+bBlu4w5A0DXL6aqHnS2pkbXAyUoSa4rUVeYWKmMaX3
         dikE+FUVZ688tCUtYr+1lr3Fl3bLvLUp0vX6PVoW04GL6fpc1X6f6jlIzy0y+5jiDJ/D
         znoAhwhkjfbnfaUnz+cP1OR1w5pdZ6eKOB4469fZruUlBAXcxzSlJWnOYCPW9a5c2XnU
         mtzsGcv0bBrgLPTcBZ1J/lT6qZaoSwHTzrneh07bXa9ectOlQsOojDXouOMRG9hpVWdK
         wx7e03Wt+FTiZpyu+y0VDQuPdM/HYUXdnJgBn0b0iaEVrGT/WYrOY5SVuxlNIAPUBGZ6
         X7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058125; x=1792662925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=mvmwjVnbHRY3avNAnhU8enW1dIL/5+KFpZNOWdsKkZGcqAemxCx+vkdwgixFbJq+JA
         M2BbJ0PPcInfODfTFF3lZvz/8qxEI228lfmLnJn+fF36aq/qCLB1GeU6xR0YVJmdZO/W
         UZxDlFKXQC1pCJjOeaDrr/nAIsmNDyA1FcGdrPAoWHijcmHkmso3RPO9nVdR+aPyhavg
         Fif8EKf1hIA9CQ9HOh+IKgGzDHUeYIKlKx7d3wSXvBdS6MLHx90EU0TdjPkdOCaSc5xu
         ZtEdSg47k+AR2hDuCt76w45F5FthErP4UAdWZ6+WoVLUA3QGLSKeYlt8DOjMf/+0dO9d
         XoRg==
X-Forwarded-Encrypted: i=1; AKwUvBzxPzfkMRKa/d7P+q/rSJLq3CW3qSTGgNoUPqUFFJz0LGyAV+iQhdXsmhuRYhvYeW0c0U9IaM+V7KKq@vger.kernel.org
X-Gm-Message-State: AFq9FYJM005YeDvt7rjKD335d7CWTJ2QXeukalIL0xCaZMDqdWDN4q+2
	Q43L2M+Ii7tRWEW/LN5EdrhwVBb8VystW/0QZ6eidXV5G7IWwxYX4HI+b5S29i3JzWb72NLF70h
	mwaLIz1NuEm57nIaBzmH3zKGof5BaDkJeqXPvEMq7CJxEHlcWZ5oMtCxHcxTeoF3a
X-Gm-Gg: AYBFou3PF7Qmg3vWAgxJBgSQbK99UWaSYi5ka1kxECzvoLWwQHVzomV0DiKOe7OmgCr
	eyj+mf7eOAeys9fSdiP2GdPcclj554oMllLiCWMqUCetG5DonJeyQ+2hmubprcVr4djpacRS0uh
	B7pcX5ppi6Bi76y1SjVEFDye1bbc1JAL/+JK2bcG/WHV+L+O4FDd5zy1DWIyuKl67F6WaFBapwk
	vFlzS53RjiqAGo765cYBJ4tTy6K1E9nz4B6HdIHEoMVlCjvvXqJQHJ+m2n8+QCzASIOekAc7ZJi
	t+tqguOCtGpZ137uXa+V9FxfvGT05GdfYL1p71mhpeAKin4SoF0dxDR5HLtrDQuM2AfOwcqevHq
	ycj7Xs78i3u5upWqbCpTpOkiqi1HXO9JGejB+
X-Received: by 2002:a17:90b:4b82:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3ac95d73294mr2101682a91.44.1792058124627;
        Thu, 15 Oct 2026 02:55:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4b82:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3ac95d73294mr2101652a91.44.1792058124192;
        Thu, 15 Oct 2026 02:55:24 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:23 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:33 +0530
Subject: [PATCH v2 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-2-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=1543;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
 b=YGp6zXS+wBzvJdnS9MQVlBt8BFQejgUvDgEhmw7g27ZvToYAfyKWFShxOJybCzNl8VdhDYpPN
 sxmttc5wyYzC1TwmFRGZ5qbn1mrYoCunbzY4JXFTAswOUtR3cFGLGPj
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a30d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-Dt519yxSYS-YsuSjdkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXyERwtuLhNLM2
 AWXUEGLFYOaV5C0jaWMwOU6HT0WZ8rbYv9jvCbBu+RWutiajH++BgVO+GTTQYYnxGCmQIV6CCcx
 lEHKLZ62RlmCkh3nKhgav8YAGXgEMolDPHZeA8oskTgLCuGOh8sO+iMuKbGP12MBAfEuigWwlf9
 LQ2xb+/nkdBAHAiZMKSWIGcl2wDjgYEgdw6c0y8StvAGRAHhnKeUiuznk39bTi8XrMGLrJUAqq3
 kW/O7dpWZB6nJh7RqTJrFMIhzDn4RbDEYpkuUgeQWho/zLaCe/R4ae7WLdKm4ljFoL1/BzJC53H
 UuThW7xvQ/h3jkaueGN8rsRZAE5V+KbxCJEeOhisdkoIfmeH4zAFLTqgFynXGG108zGUw92U07d
 kWnSI6bRsGQIXDkMy8OWOmSmy7Omb+L0KmVqbnCsNGvgTb1Tbz4h1I4H/z5JorO76uKOnhpEqhG
 /QQghoea8Bp+yVvT0rA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX8r3q/AdweHyS
 KjNYFrqnLFe+ScPbIxX8ERziLZjYJjgviiD4Ag0h9892C3Ik/a4KWlWv2FtFEIqfkQw/t8dhh+L
 bgpAOybV8Ok3il71OItqgGk0QABTr7I=
X-Proofpoint-GUID: FRzwWhWVEClGwz1ahcJRd3mhTH0BxRst
X-Proofpoint-ORIG-GUID: FRzwWhWVEClGwz1ahcJRd3mhTH0BxRst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

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

