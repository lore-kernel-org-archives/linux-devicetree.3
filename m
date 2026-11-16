Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835112;
	b=gyYOLIqGPlwyWFz3mhizFcrcK7xMN1h0N5XgAbO6C0y2e92XeO1MKV/oE1FTzuGmXd3X
	 W/hDFSqK0H6ssjYwK+btE4/zP9Ve1K+db+1ZSojy607FcDV4HK95CfSGp5ShaiJFPW/HW
	 pQfGQT7wqPo1E5Gw7EDnKoBUiA9fLco0+sC8MF/WeVDMTunM+AMV6M5ec2FTK4ZJ8vhAX
	 KMlG54xLJquv0feNsFNgEk5ZA0sOl3gtrKDAuF0GEkO0Iw9J6lL0iQhQwQB19SkMsn2Br
	 k2aRq7j5Yso9mNeS8i/5pvPChnVVB/mHopUisWh9XCG7DGoKSiXid7Y4p7WHtBLE9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
	b=4UNYJLmJrVmBm3eV6IT4WKw6DCbOtBvAbyc5HPfTlhfCTxjt8cFPIMBaxf5Pt76hk/Ln
	 TzEYUwscz/vGLVHWLrcpfi0LpUsB65OKSU5SxV7SzvieNeagprB4WItzQ/UigAepdeJ/o
	 uh2n7Yk907I5mrn0Qo/wGYPBPEibDAMyF2IrKHvA2bi7z1AU8CRJkfAM1UFrWH7lHtiFm
	 FFvxlqjYOw/GWLbMxrZYNgWHp4kt6nN/PtTQDJOaDD149hmm3Npt1476JBNxAz2Rf+g+A
	 S/8UH0AJkL922U6JvWeg2Sv+EDxgC3QvBfDmg0WyefsCo+6Q6/CNswQBy1Zf0PWFIjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPpDFUWO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMsVHxkP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA9606A333
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24EA9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPpDFUWO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMsVHxkP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1M7C1004655
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=; b=EPpDFUWOkZ5L4D/K
	1BoTCAv07el9Qc7jt/26GUGF8ENgjQm4+R8ZyEaaSr/8vYF8ZDeaOicnrIYrZijA
	mZxTD3sfs/yujgTaHQQuIdEViZg+c3h7lCJqSFOeYe24TNs75A+Ag8Vzf6PeyReI
	1TS7u2A9ovivRK+q01qw6aTF9/zU48VVUF+K6H0sLqidRhRCoSe6aEpNY1Yo26ed
	oBmaBXmmSrwNB+vDlUpJb1Me9Ch7vzcaAbxhNtMOcBWfhm8q9xJB/sfVhGae62XK
	hp7v75ikoc5Udb5UQWxNXyVp05vfEibNk+euURuqhvI2f/nvrcZn9IX28SvW7lLI
	UOYqxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0m5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so352990985a.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835109; x=1795439909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
        b=aMsVHxkPWNPUoSpLOMAwhp1R1cTmc4RXNDBiIOrKaH32H+bn5RmbX9ND0Iry48a0s9
         kf1voZaggG3oBvPH2WPX/mPBs8KqCJQwG+xS7KYF5IPNZvfOdMtCemL92254XsmhoJIm
         yAehyh19iis+qkkKobzNm/9cdhOwJdaRAl+2aGIjt43Hk2yrmnvJjWSbCSFJCUUEVV7w
         jcjrL1U7Uy/HALuYtFnv2MTnTQsvkw2qUfj/rkcBRAJ0AVsum9tY9wTa2U1TGhml8Nvt
         5rbfaJaCneqb8S+2s0CfB1g+48QjSbFk7jXNrQffoQbvAVwgldwXDn1pBRsI+J1qMvwO
         FAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835109; x=1795439909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
        b=0FAP41Lp4vi3OKTftvg3KWU/aOCUR09eUqoTH2G9qbr6YFOJOpY/DS5lj1pIZpC4Zy
         X83JF6uXMspwxQ4LMhNGQ8kkPt0SFuSXLJh6DkHFnm3Tp383PrP82l0rqH9l1zinzZ0b
         icoMz+Z6SMK/GnLnuM/0HFUVNp1nWglvVi03hLvBYP7cum0yqMi7hLTve/UGpwznBeo0
         uEMi09Nmmj9XHQ55nzwBMrnwvahSAz+15Fv/Nx3ghy1ip8YVsYgZIK1n2Jr+HgnAa58I
         EeiLqhiTFsSBuAAeYG9+MKWTm++s6oSBv6blxpYVfbEpiTf6vD9aK12L7uU6hF8qLNH1
         m5cg==
X-Forwarded-Encrypted: i=1; AL+hErH/HGYtqtFBKmCTh80yIJpH60WHZBkN9JOawOrfNc0YYOnsfIx6VnwiEFWydpzKDTs5Jye9z3JiYYyW@vger.kernel.org
X-Gm-Message-State: APuU4Z9S9ZaMcZ7nMu/1mKsJCzylOyX8dCunLV3oPK4yQQY3fGF9kdSi
	Ouv8h9kYMX5MfI8hI/nwUpwJm4F1Gk4FQNoMJsOWQMRinbs1SvSf5ML3EO/VXQoYYQbyRaHdgJT
	E4ECGchamU1VH7Rb9BCoEjJ9TmsfYBSBY3RFz5L8i/OTtEzH2KcMGec54yjJotdIL
X-Gm-Gg: AYBFou1qiTcbJQTBhv7Mbgir0kk9eQNisdLeu0nKXn0ltrIWbTVtzOwIrhpcz79QZ3k
	e+BMbOGPk1nMTZ0eycQezSE2wucJCbo20AtIUcCZM+MK4YbgK/sGeKr0QdnWU1b8HWbCy7C7eAK
	MdVPVHvyS09rhZ4jvjE1Kb8YmRNtvcucRjRodBPZ95fWiP6eV6aZ8hUhrU+bOXZdB2FMKYCwuXL
	/QyvHARdeunCTKa5ONm5i2Sdmhp1qv6gC2lmC8kpN1lPk81+8zhsQy4qritp6P7mPGjP/jGxTrZ
	aOVEewPIl4aus5ASlN7NqvkCWNLTv7Hgu1A8eqFzMijYl35i7r0ctFGsiWZRi3qEoIkWwN4Ty7M
	3v0l3LkPp7/6g/FVa+Vunrexn24kw1mQrBjPAvCDR6JxrLBS3j7fhVDVZO6PggDRqKRMwAXBc9l
	un
X-Received: by 2002:a05:620a:688b:b0:93a:2221:5460 with SMTP id af79cd13be357-9494bbe7d6bmr1466806885a.40.1794835109434;
        Mon, 16 Nov 2026 05:18:29 -0800 (PST)
X-Received: by 2002:a05:620a:688b:b0:93a:2221:5460 with SMTP id af79cd13be357-9494bbe7d6bmr1466801585a.40.1794835108814;
        Mon, 16 Nov 2026 05:18:28 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:28 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:47 +0530
Subject: [PATCH v3 08/11] drm/msm/dp: Add support for DP controllers on
 Nord
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
Message-Id: <20261116-nord-drv-dt-v3-8-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=1225;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XJxZ9JOwZTbboBKfrzjZDalKlNgV2kQ+8L218FILiig=;
 b=O6r8EyI2nMi9A+cCkAFWcnDMztGvOvMYd/RUd8W9f3dPKb4b957WRmfYDKWVO5OVbAESJTXGR
 faA/HpH0XxiBiH4DIZOdzsKAL8xx3dgfsxJjei+Z8ud1SGYMQYl8RGO
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX6SPmH5j7OWIs
 lgBmXlOUaUyvnN+E2F8OKlnUKiFqSSMBg8bjpi6FA2j6YwsSxkGsWlkhER/lQnx0/zA8PUrYPJZ
 Jw0LDxevaXus7hqyppFg+eFwblVWrH9TkTfz4HtkTQcZkJ9qGX1WiTG1o7V/cZlgBBX64pgvFaD
 pEzZtNE6ZITZKv50rJNlaQLWKS+lcQK+Iiz9jbkCLf4st9iPnT7a9DRWTIm55BFnAHNjkkkbD08
 nXk5w7HhaoUNbEfeYHpYI17tgL6sSirYkIG2XJFK7zq4EkimIWdSssti80FyXR1xp4bmc31n19e
 s5yJJHk6DdMJr7BUWZi++fjIifrXy+Ja6WOD3KMGF5VRzt/LVuiluJpcivo6m2+oEkT0AUYMY3U
 +ZqZawLP9HsSOwwE7pBbBVOjivG6MryoVtey8RrDnyhr875VO0EQfgRzoQ5IqKGQpuCdF+Nzg0B
 W+VB8i5g8B5tu+cxq6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX9xl1uFZk+K5a
 Aj5tfRe/hZMNRkrlLFqeeoKQ7Qea/HbkV/h+Uhk46LXR+QEsDMWFFtZBzfSzIuI7qxzJ5DkDbb8
 pLgbZQfUT4DRHLgj52jmNVwaq9Zi2Yw=
X-Proofpoint-GUID: dU0LR4redII_uR6B_Z24uucQvvF7CJwK
X-Proofpoint-ORIG-GUID: dU0LR4redII_uR6B_Z24uucQvvF7CJwK
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb02a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tTS4mT6h1kkz99yYBxkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord has two MDSS instances, each with two DP controllers. The IO
start addresses for the first MDSS instance's DP controllers are
already covered by the existing SA8775P descriptor table. Add the
IO start addresses for the second MDSS instance's DP controller.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..8b1b01af11cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,6 +108,8 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x08d54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x08d5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 

-- 
2.34.1

