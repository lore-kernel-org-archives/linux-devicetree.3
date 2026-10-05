Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261632C11EE
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185096; cv=none; b=l4PVlFMAY1B293IuC1KYrHyftIhZDhdXhfJWF9N/HaJj+D9llVpLGog1w0QKVNMQIiUC251MTDcOpWle/Rb/SS2H9bPx1iOprqz7282fQSIBRiQWtYzXSxUcqyW+yL/2m7Fhm0u76iypUZeQkqv50Wh78tJ/e/smkqXBvlCi0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185096; c=relaxed/simple;
	bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThWczZ8b4bmxrvgl6l5XYMEQDtlxLzcmPb8dkOx+AAyhQAkYUnpg3gyw7FXEdZc5M/Doec77PlLGzjkdLLYdYb0mfTPzo51OgB9NuSNlbUx+LThEoupJCJVMCx8pHr+cv0Q0ExsAPyMdvbg1+PAVO6XB+fee4TsR4/G+0Yb/meo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkSw7MVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4xaOhlH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkSw7MVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4xaOhlH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695102pC495956
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=; b=XkSw7MVnCRbphMuK
	bjyoLMG4IFBKNvkz5dp1xf8EmtvTgIegmXBih6xGCZao19vXMC0G0lVWvWqlTJpD
	VxdteYmfPABtRvGquSTmTgOp7eQlDeFmpkelPqo4TsYkxR1ot0OcFtpUlJtUCR9c
	Kdh45OvTLFr5saHHmTPS8YuLSjitewlTVtaEhyfGfsD8odAE18+fmsJ9uPNZmTs/
	ZgJ2+Vi/aKPJfMQHXmzDKV1keVGOuUz2L9DB9JhkNCh7T5/bcu8ecBq1PZtTzGb0
	vVOIwF/Ra1iG8aLnxeW3ZLqJqHX75YP+WQUdsUfgsmuFqcX4IuH3TyBJa1/nFaYA
	KpmNCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgys4rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:24:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso1438266a91.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185094; x=1791789894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=Y4xaOhlHyGNU355WKF/Ds6WuZOua8lG7EOMw/vu7ITWzm0XizWjFcao21HzlyC0C5s
         AKyCV7osN/1DJF91Ey2MbRLBVbhZ94ka+klZBjX/4qJe+TPc8mdOh4YSm+qPdmve9cCR
         z0gUovjLcgCgu/6b+FYAnHAcF3wQnEE0pdsmH34BVWYc8L/PCJnk3jk1nAHf16SElbX1
         5qCktTuQq+jX6psvybYijHEhQDW4ByWmVs0RopSMnMIQa9V2Eups2rqQOXKUirIa/rPs
         KKNM6ZwYQUZbk/hoomQSy5o3KXoQ1eLT8uPSJA/dxWnexBEtfYKrhCKTQsqO8S1LPaHL
         k9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185094; x=1791789894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=yP8mt3MxbS2DhZFzwPmwIWZ66xu1M1AudyNjy2+/+DmeZIQSV5w7v7gErsNu00KfFQ
         sYe2bC87JWTOmY4h9Ty0GxMpPXWceh7GeVYk5QOjIlQaBHaa36yJ29F+IN5iFo/x2Eh8
         Cm+XMJhDNAGl0Rr5L2kHj/1QYbKv7kyZWiEemJ9H5MaICyduNacyYOpO7+2dEVjpexKA
         TypY9XHIQNBkhVD/widOd2TqBN7PIpFd6dMkHnd4ozWv6XNS3Ldgd/D4AVmouDNeM6hd
         q5Z2+xBD/e0MlLxmvA5W8OwvwRQ7LbuO/Ql3fWE9q4c/8QCNzbd8S3CY3WJfvVRBXIxw
         5p6g==
X-Forwarded-Encrypted: i=1; AKwUvBzfP03Cwle0RRrv6O72cdsbfW3wkc+4cvgbPG1Jh/YOWcPtEn/c88eVg95yAwJ1DY5BpSoQXD1WUr3C@vger.kernel.org
X-Gm-Message-State: AFq9FYLmG/QdKLhz0nDF+XEF5rEkccx5fDL7Q63rvxEfefQ1i+5etSP/
	eMLs4OH367o3LXfRBSRpOOKeezxQrKHtkLavS4bxWMRRRCK5zfN2/TVAmlWdsY41OOtRUAb8gf8
	p3ti2oFLfh/M3MlA4BkuZEp4kvJZROIzbRXpRHtSbyUI1NfRgzl4uPl9qvQ7PK1Kd
X-Gm-Gg: AYBFou33Db8GjzEHO7a07liNLs2rYte4E0+4idJ+eOvR6J9aaIsM/EeJITu/0fICzuQ
	OY+zDQ/BiIk6oMFnkznI+u2+VCHVG72GnEGa1eRFlJS3y+XS9aeaF1Fo7f5QiuMQQlfBzYfgnIq
	ttfYMEx0TQQt9PbnexejEsisN39zfkSTXJOY4cUrgAefg49OpulPynsbqij8QXDq6jH9mvy6KYI
	Qnht3SVnQ3APvNj0rlW9lHqxBDkZ3UTzNw6Aw0EdflTeo12kFtC0XsOrbWu9pF8R0dTL4s6YFhY
	ro/0mG1WfmBQAKeaHJV9rYz3/dmYP3JnsuDR2VzLmcNaEY8s1d73SKIu0ThIhWIjje9xGxQhfMr
	7vo5HY0J81ghuJZX8wzZDky6+TuX8Q6P0q30=
X-Received: by 2002:a17:90b:4d85:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-3a6ce606acfmr9757578a91.5.1791185093684;
        Mon, 05 Oct 2026 00:24:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4d85:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-3a6ce606acfmr9757556a91.5.1791185093189;
        Mon, 05 Oct 2026 00:24:53 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:24:52 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:27 +0530
Subject: [PATCH 2/5] drm/msm/dp: Add DisplayPort controller for Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
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
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=1543;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
 b=Kcb1zhiybcDNR4q998sqyDvMcDS09D0UYeshRH/axXfPBe0mY6anWRqVIVQM43Ns2l0nEO2W3
 MB89awjeoXaCpCa0gpmyZEQrdYSkoqJ4PLWYkI24+SIVymXdOlpSKtQ
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-GUID: gI7woeIYgcpIfwm5h6jPf6MUM4MdfucN
X-Proofpoint-ORIG-GUID: gI7woeIYgcpIfwm5h6jPf6MUM4MdfucN
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac350c6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-Dt519yxSYS-YsuSjdkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX7cSeYuV7sEuz
 TFtW0aa8/cBwlsI6+Q1Z+RYSDCEuKwryHeRhkVelxxmbKA8ZldHIfOgx++j2EHTd1TyCK2WlTF7
 s9s/MsDwvffqbxY9Zlz3Kne9Z6QBrI1EaRKZC4x67u1P9FqFBeOqXiwmDLu/vVYQ6opeDxd3jCp
 TqqKx/gM0FdLgs1kduJKFdQnB5Zqf3yY/XeDVYPjBbc0L4V/2Km85d4wqcwYAY3Sp9+X8ByfnE0
 gfLB3Lr1dj05V8CBXrRl+2Iy0ZQMhmPgVdpXep9AKcQr+so9glmuYszRjuWFJNNLUvvslaSCn6f
 bBUIAI5d9oEntue/UJzaemnsebo+ZuvIQh+bxXj8uxnCt4zfzkMOIU5sTsTAU3MVUBI+R52haC4
 nVKWntndtiLTg+eOA6EgnpaVvT5P8ua59VGbPRKlQMdCfhOf61orwXRvG8Qh2WObqIsymErG+ph
 Fbee7UuvMrWW7ymAMIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX1vphjwzWpd6v
 RcFu71V8HbcMyppC9SW7SawYRAGyF4R8GpoRZ/MWRX7mi0Tt2KAfgglmquSiLZXNoyzmKTlqK1d
 wG/2oRcaRPj7v9rUsoIgc/gVY95tEl4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

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

