Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F4442CB05
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122610; cv=none; b=Ibd6xoPbdwLyua65MWT8J3wFcUnu96XiZH/zTJoQHYMOppKHojw21gjftbnEQK9VSOI0w3DbHF8kNd5JCahHVeq7MrCdSD64NWz8QpXogga2Fi1JyhuZINRxet02nD2wCNnDXEau2BkDS33zdb0J6cYyI+lQkA+0fiu4XhIvqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122610; c=relaxed/simple;
	bh=pt+Rkw+jgQanPwhA/NuvAa5qnlnZ01yZY+rh1utI0Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFKgSW0Q40e4ulxZEkjIc4YXBJdgFtn3WEzwNO7w4pyaj04bsfAW6TLcDBA3JfRS54a84eEI15nJ9lvmxnE1N+7VFqXWxX8xTeSBqWV6BJeKAOrcbJyRd/DrdiP8syAUeITnrOLHRP2ibkCPrGsjYqD6DT+XHJ+7ikam/kOC66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqEc/AEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEF8pdPP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqEc/AEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEF8pdPP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9mX0L3292275
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=; b=VqEc/AEuTF7PpT3X
	olhkf2h9Bdq61NedwcggjM/bzc29Dqz8ssNS2ZdN1ZiCfLeSmWhxSzcXQdH4I3+o
	yzKEeScTa4eqLab3dXzV3JdHeElrraduNIQWSjE4Odv4OIFTL6Rcf9sVq7MQZwjQ
	GKAf5oooGSPR5hmf5/S7Jc/n5wLAICX+iB6rEnd1B3UonuOR6/UCMyMC/QhxPrtO
	x1I+5DxSKopjcWAvKpBbdir7T4WmIXWYl7f23ld7zJ8tBdeftMI1bMdL3VkNpe0B
	GiUZOF+//fEg2XroqxH30WeGrhan++NEkZTcIp9lGTyLO4orabT+NdHadu5cR2E8
	AGI/Hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbg51s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:30:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso30445685a.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122605; x=1789727405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=;
        b=aEF8pdPPWC9Blthz5X+YC/3u9O0oLjUaPj/GmoTwiEnxcvbjjBF1p9K8lRA18B6yvO
         mX3V3zTtCT4Qc+nUUez2Qw7axdVmCA/IZYqouOEn68PY5brhBZy6vyKkyhEDbLB+ovWw
         QKQ3kE1j7lsWISLrbakcoD4qd6EMkpOw8NfVxCFRK5dUhZwHsaV9S4XQmarP7rs7jsXJ
         8s/EW4S42O1vSdLqMbQKogbFY0OK33Edqq3YwU4yrg99n3bPPTLF6qyugcKeBD4QPRp9
         cWHbNgGxVdzDci8/TjIJu4Al1RaanfqVoewHGRkMAPRUd3AhwmIYChOKvVlhbygCArtq
         SWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122605; x=1789727405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=;
        b=R7eF4xVAgCiJjiczmh6syoalSEg+HtCPVktdQ6Jy+Nt8olAFMQzVZaDlxTAHTcwQRW
         zHleBC6iQOmwgPIL7gm4endocQdwOtwRfFkfv4ftyIo4j8bqLeqDRcVd/47AEErHn/7Z
         GalFNFXJYbrFS3xPbY8OtTpFJq2ZA6DLd+RkxQgh/3XAICLyW89nKHbPkodRd/KDWGJa
         uO271V29pUO5tlG/LThkjtfcUmCqp6R+AA5WFxrk56ACPvOaxKOutHEoHP3UjXKIU0Fm
         G2myrKxSL85413TkLRgZVsUzGpyQ5S9I4MD84kubWJkKRxP3iBV2h3ZEEPrg5FnZaUDF
         da+Q==
X-Forwarded-Encrypted: i=1; AKwUvByrhTmqO7jg6gL5f32wTNYgBhHmdFzbv/2Z1vx+8bJnn8biMiF2fcs5PrDljAWlIs8+RPSr1Ffnqju8@vger.kernel.org
X-Gm-Message-State: AFuF++lI66OhKrR+5ue/080J7GvlYi71sJ3xajKXyCJDpxB3kJAL/N/t
	l7bm7y1L/Q5MsoxqlVRt/54CwddabEJXdxBd0JEfo/Bs/clEkxzT6ACgJEgKvVOK98pNcfFwfaH
	55r24Yn8KnK1AsgLmrNVivm+jRjO9hfrGDMcrBnx6492tCMIv60bg7ZmXJxkpzR1s
X-Gm-Gg: AYBFou14+DnZg6EML0irQAcjNBvX+JDysHIR5pGUoVPRajeFnqwmqlORdY+xDHY4lk0
	nzyi+DAVQPkBG6a8zvCrB4OKWKd0nmHS24AC4EroNXT03YwDy8fc8N5aOYL6NLjIgp3kG6EVDDT
	tqYdHi5Ui8cUTOjYgfE1gXqMhpdkNuWWzWB3KEkESRPoyhlCUjR55BdbV/uRsS9AjiY2s/Lf1+1
	cdVV+20ZfDowp8GktKXu5vrgNw7mkbDkq68wcwj0rxZEL7DCOIxdE9p3YsiXEz42oreyszYbben
	QcB1FdYIxPm20IiTQbIJ40Kh6vHEzyC9te5FyzzUDhJ58Pk/ImsqY5oPvfOPTRS7KgOHv4jV4DX
	Wb8VUcDYIDbzFY2ca/hErZoY=
X-Received: by 2002:a05:620a:710d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939ea0e6e28mr448599585a.6.1789122600579;
        Fri, 11 Sep 2026 03:30:00 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939ea0e6e28mr448595185a.6.1789122600092;
        Fri, 11 Sep 2026 03:30:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:38 +0200
Subject: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pt+Rkw+jgQanPwhA/NuvAa5qnlnZ01yZY+rh1utI0Qg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gU0RExYusnudZ0OMSrcweBZUWjDZMb+M8pu
 xhoxU79/VWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFAAKCRDBN2bmhouD
 13VaEACFaCKDETdpPto0n8tND9AnmPJrBouZ3DiV5VMplFHEEzVYq79foQF2rjqKv263AU9zq+3
 JIWOx+5BF73BcsRrq5QIvQ7blWqANQTHgHriYqXprcy5baVa0he5oIynANoIZGXzLWLj54C08yK
 DpFvI7aOZpAchp0JCUbOtgLMdFHZI2j6EdqSJYa5xOKIvokL26l0WkT/lA8fQ4ZQPCcMUUhzxYT
 iMYAc8UDbse3YaQUCjHZS3SLsQcKQoYSgHE20MN7beFK5f55ru558QjCN/lWb9wluhSw6V7jgyk
 b5h+6TifujFZL3ipkLiEEBDx8Sncin3+oDzNqgKc+5t+WBWSAOIO7+/Y2pwulk3+PDd9y0MSjAW
 QR2gmN27rQ/a62pMIJEDJEH42LjUjGUESrCUWrhKWxhgvmrdZDpttf1Hdf+6PdXyA45f5jiMwJ2
 IC5/13KIi+FWip/HxEMPIurxCj7mKgKAdyqpVmgcuBk1nnvxa3I16OcBy8nMqA2r+LBFet0gfUq
 XPB77l7QlFmKPKqFiAB7H6Ik3As0cPkYgkf0tiRrNG4L6z7zbELYeppwyVslAZTimh1eOGeYF/8
 TbTVKCmSzSeT7WEHoe6FY3Qu+ITbN5AJCECIuR7C50IHN3ul+Sp2Bfg/rfOKUwUg9Kc3RMCiRk1
 Jw/7z7tye3JvP2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: a74KNnnQ2vIpSaNDVjW0eNLjZ5HwAf0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX5HRTIRmPBQi8
 h4tDVmhaMyq4eFh047re2Hl7lsFKaAYAIuoaBQIfgSW0hKQsanCZwcBoIugWqOG0/EbLOgPycRv
 qi7yJkllpi46hRXJCDzNP7cj/EbH4R2zR/QF7OAe60PSXS/edTB9hsrbBKDGiprFlHLoKZ+B5DK
 mUC5e2Xd+K/+uwPx8Add1x3vGUp6qd8ofQWfg3c1MD+HT65whTznBETjwAr+R9loZ9Ho37D1pZa
 BULHW2FIZc7FvYOfPnReDEzDHxT7fUk5+QUrQdNRH5OyxJqwreCH/TXgWIMdiO9y4obux03Cg9e
 wNNbbBVVqh0GAZDtoSIA3iZQtR1I5NDoMj37IjSw5jM5YKRJakaSpoZq9DLbWEQ6q/aAnE1O9Np
 8Cl7oo3pGrOVVgjWM/8+e0vkAiDtBh1oiKMRp3wQLnZJem1BR6IV8JK8zVEb4q7C5yG+Ok/ByBl
 W2uJTzLWX/J3DqASgJw==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3d82e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX59/FupmH3crY
 TQc/0NNQqh/cJ6K8XaTLe3yBYum2QUlTf22h2K5iK/DQx8ACZMZHbMCHZnFR1uT5Qq8GXcW7rqt
 8FzTOpni06Bi8jCL+u/Mu7+mLWTbLqg=
X-Proofpoint-ORIG-GUID: a74KNnnQ2vIpSaNDVjW0eNLjZ5HwAf0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..99221b0d7e3f 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

