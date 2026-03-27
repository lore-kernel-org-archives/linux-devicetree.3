Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED8394499
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640902; cv=none; b=ZZQ7eoNFTSkxMiq+m0AeVGDK0HORzSkFtTdvZwT2oraDboeVo3BG6sjOnAEzj2cQTo9S9msiR8la4nUl7gg7yihkVBZJVvjTb7ri5MUFUHvmA4BjmfAIMYSlGJh+Ezbed4S5GFcER73SMPQkZEafAvhS+J6OsO+yfQnG50Bokeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640902; c=relaxed/simple;
	bh=yeXQyQYZCREN8SA8XGdNMOyScO3aLvPvOpT3Wl3bylU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfghmkQdHIyUDtknM8HrmwWzqc8SDIRPA9ZY1aq3AeWFF6uClbV3BUedZ5dHL6VQgxbMJNrv64eoO1vAh+jg1JfBSqmDlWghdMSxM5DWiFHGQRIkPJyG9O1E+K3nKlAbC39eZkE4HnsI4BikpyZuCNAcGTtTJpQ2MRQJKg2OIB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKFI5eXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0UdFOwM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKFI5eXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0UdFOwM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2aqu3659015
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtqaBpxT2LXyPXWxTBBWQj0QjDmEW2sCiiE6APe9YSs=; b=DKFI5eXkuMYtOMU1
	k78bJARrEBwcXoGjDTSq/3eOVU1IoM48gU1wj1PFYdb6GMV9oI6ERI6SDi9G+RPj
	5aQwxqauUZuYbg3xp1FYhfDHiEaYKXN5xPlJuYyUsInamIGYBhykTrCw8vhNreag
	fkuFmUSgGte/HUEQNPms03kXwZBj0uVxbrt+lQ39mBZiz4oWVb1WSE+cC2JN7jgc
	IIuMCj5VbRmOHEudN7OwYH7/a+H+7fq0P3zpcVX7jr7cPXyUfyHaoVwiLD5abVwr
	T+aW57qDCdh8R6jYAFvHHBEkKtlth+oLBQsbuE/wxl2sEOMlyYAXIDceR47GxwCw
	XkwqUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn12ref-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:48:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso26028011cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640900; x=1775245700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtqaBpxT2LXyPXWxTBBWQj0QjDmEW2sCiiE6APe9YSs=;
        b=c0UdFOwMEBQGrQOkOl//g0Xnj4Ho9EkAyGq8ZaeYH+AAgnHhm3aaG/EaMkd/9HLarH
         lPSzzICplM6iHgHB/4bYjBtKpdq3RUXGkXCa2F9CsRRH/NNzl+Ln+/TcD4nz9VCW8bhS
         xKuysvqVr3R6ZJqN/Zq8sBnmMVor8mWa3YB1vlG9OOETcVpKdvoSH7+jd6CbAHYO/khx
         v8cx8DvYbkU7ouryAvjXcTnROrW0UVKrFQUXB8ADwvmwBwAK3WjfTazooWzDH0owaR4T
         cD+oO89OTvzNd8ofM2umkNye7OT3wsSGhsVeZQdb/6Fv9dGL6851YQAP7acXVe2NbTbp
         SNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640900; x=1775245700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtqaBpxT2LXyPXWxTBBWQj0QjDmEW2sCiiE6APe9YSs=;
        b=LGxEEkp8KVis7IcndHbW9hnF87Zr0uzrcZ1ebNmxluZVqKhm3y4oCUBUUnh7MOgKHg
         br/Psy6Ns7/fzRwAxq5iGZLy6Cad5xuXx7YJBF7MxUBT9pPAdGV6Rw9N7ZbxzqxhNt/s
         JvZ7gEAUZ3ygRN1vqL6WjB+VEs9/jYfeGCtGSyKc1GBn+dbu4267vHt1yiVRo0RpgNlH
         myKBhpa7cMDfZ2mBxKdDowvy8j6MmHe8J2lsbbhdjjtJGn8hhrUklIFOBqPS9e5Ew86I
         sx55H+I4A5ob1RhooF9i+KUjfSuuxrs6eODV3ktahg+DTiFxQmDLvUgjQvA9Fjguz6TC
         +C7A==
X-Forwarded-Encrypted: i=1; AJvYcCWkM3I39ioL2Tw2GwLVelck/mZ2ZEMz+yAIhEqiWNZis0iXB38Ro65+fNZLXst4aQNmZBwbw5tja2ZF@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNixUJQkmNvUhlcbWM5vNHZsd7E5a9TMj2vbhj9sb9l2TzRFA
	7S+2uJA0L+QwXHlrLaGeyjkQa8JBFVyoOHJ3rag2ogJjS7fp1agTOPmNu/IKcWxvQkJ1x9eJ0fa
	mIS4c1kCohHKKLNv0piyrOi836kCm//8aJoZhGexnK9A/+xaQUNNiLpagzO1XUYYGsBkXFrDC
X-Gm-Gg: ATEYQzwHC9VUT202+N3gWPfToAPdgC6uNVhtUuLWtpxOCXl+txSMcjvcGg9ypHlF1qU
	I3jK9D1FGk8E0ZjmajeU/zwv1WN2pTmG/xb+O7uVFTHpyCacfmtpKEkCtdSRoR+2P9q4r4pO9Ag
	q1j85pqncNms40BQ5VpQ0AU8IwbGwlFOkjyJNxx/f+dt+TZCa9UFD9ajEO6Az/g0i09zlgs/g0j
	UdHSvZ6eI3KBc7xUXSeevTHZYEHPSd7NVbYOfVxmE6E5N3MaV8fgBlVOvFeQfafSt7Wzk005s9T
	HpOJNKiKt6Pb9QWlUqYdWI9zp587qAf9Hk/Ux3Wsc05WUKd/6YFYj5H38++FFuV1rszxMxQqa1t
	1DrESAE0vCoZOJ9mkgGXeUePvLCsO5STijR5Kod4Qx433yQxTExrGyFOCIqWhYwvNtkCcG+Ys3+
	MC1hQimdIcdX4dsC3v3hzn/c47xiKP4L3X
X-Received: by 2002:ac8:7dc4:0:b0:501:51fb:622c with SMTP id d75a77b69052e-50ba3918de3mr49563681cf.37.1774640899844;
        Fri, 27 Mar 2026 12:48:19 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:501:51fb:622c with SMTP id d75a77b69052e-50ba3918de3mr49563181cf.37.1774640899314;
        Fri, 27 Mar 2026 12:48:19 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Fri, 27 Mar 2026 21:47:50 +0200
Message-ID: <177463970838.3488980.16958516986078779184.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfXyITdRjr8EJce
 M0i1slRxUtdDOb8UXTYNO/sK6WAi97vjY1EVW1zLTXpaS1XUpYNV/hop8C9hIIDAk/nq9MHj5yy
 7irrRT1vikWFMGhAWkdC64VR8hujinBR6ncqStFjmbJGkh2BXnS0rk3D6M8svNajnZqPYydzSfg
 TgmBHMCgUXkSqYMe4VWAv5YWagv2CRMbNqMW0pyQqjXDdBr+A13MV7KfE3Hfgq9hUyuqSmsuTvl
 JCrVa9SvUhhYcoMJsD1tMR0QOacyBhLW+qLFGbsqgGUFkoJTP301mS5aKG8UApl4StqkbqTVwfA
 Jzf8aKISQrQzhn6BVMjq24Zf7m6Ko5s39Ew34rkfUmZ8Upfwzus+VhjQU5E0Uc4Z/bfFt1CXjIT
 63h3+doZbz/DaycWeQKBqoGuJOe24/BHoR4E1i5V+QEReXg86yOvaRjlf9uxiqdQ4LenMvnOiWa
 woBPcHav9xyxoylNxWQ==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6df04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=7QP2yv1SlOzM556KXqkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ucHNsC_EV4PuwSJLJ58qYe6DsoGRzNr1
X-Proofpoint-GUID: ucHNsC_EV4PuwSJLJ58qYe6DsoGRzNr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138

On Wed, 04 Mar 2026 13:58:42 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Add Rb tags.
> - Changes after review - changelog per individual patches
> - Link to v1: https://patch.msgid.link/20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com
> 
> The MDSS on Eliza SoC is evolution of one in SM8750, with several blocks
> removed and added HDMI.
> 
> [...]

Applied to msm-next, thanks!

[1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/069a1db1904f
[2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4a0172e8a4d9
[3/8] dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c01cca40073e
[4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df761873418a
[5/8] dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0a40e2e91b21
[7/8] drm/msm/dpu: Add support for Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0eb707bbc7fc
[8/8] drm/msm/mdss: Add support for Eliza SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3e64e6959d8b

Best regards,
-- 
With best wishes
Dmitry


