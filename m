Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF7435A80
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122592; cv=none; b=NeALBmHL2xFFyfc8C+f2M+DurkxM8JaulrDjh91ElaXR9yPYr77dE5Kp9B2u1pCI95k1vXyQLfhSBH3rLoa3b4Mb1lq7VVwuL3Kej7VHgXDcY0IfGpwYFAC7icq8eFalAsi67VF97WCelqS13oP4Ay0GDLkWDHd8QJ8xgZRYOE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122592; c=relaxed/simple;
	bh=ZG093MO2ef10q/LWPvFaNq71LX74/rGkq31nYz5GUvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNYrgFf4uJFL5STZrXuQXCbYMvqdN8axdNlyOA6lTBeMEwIKmCl2K8nDAVfxQvVBX23X7jMcdInJJXmwLFT9k1rLaCi6rE4vajiqybOh1WeeERN0Ear7q8jpjdHdIYwH8S8IT5U+UoVi2DQ6zG5cLccaQwpuijTd/sYf8RwDG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/DZKTDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RurVLEC8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/DZKTDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RurVLEC8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kdXv3686790
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=; b=I/DZKTDjmhSTvIGb
	QsmmmXilwWEUyUu6wBHwE/SOfshnkJ36+XtfmYcYVHn7UgJvhotzwLZD5ECiKj2l
	58m+EmCH06BJoRrdoKkfxH3p5CkpPu+t1sunbS5YbsWbskh9tr/q53JXe60+jHDo
	YsObcHE8lhTniLTbYWm5493BlwYvXVvtwHgq2WLq+7s8rdIbvFPhI6Q+HAzDPADh
	UL1FvarMYGQLUdU8hAtZHZ7Y0AspUrRsr1ygS/zBArOaIJDFZ7mynW2x7fGwLd4P
	JlZXfMyPfJohbxq++WQ70Z9j6fzELh5TOCCbIen/N/0ZyFgeljEbrFM12o2PopGk
	X244Nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1bp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:29:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939694871aaso118363785a.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122589; x=1789727389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=;
        b=RurVLEC8mDTiYLe41X7fC0AXWojGwrFjt7/GYSwKB4P7jcj8w3mNeROOHbes3u8NUJ
         yxVmlY6s+tCiZiJLLEqgIU+8iVhlwaI2UuLEpgyETE0hkKZJj6cqgZbWabAP5Ub4QJ2I
         wpymdWj0aP7rHS71yJhA6nVB16YFaL+Mpj8zWkpAg+qagkNDNKQ/wXwz7mSxuwamdcjX
         DyndvviL1hakeVsIZdrXXdMlx49ti38b5ZC2gVh3o1ZfAAWof2z/ZRcsYAQ1/SdCWN1G
         xaycXFvd4pgUF0nfXG5WPnX548t1k/q+lM2QfX9Rdbhjql+42Pw7vg+HUCTDL4xBYe0c
         yR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122589; x=1789727389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=;
        b=gQ2hbSbkvthYjrPUN8ra1RP3/6GNKbvGr6r6msPMW3xrpqLiOlqfC7Jq6jdeMrh+eK
         KJd2HZSbXx99gZFMdV8PYMEX399FoATrEO1WnTB0MfRSabPAzVIb1ITurSX+JW5v3tMr
         dNDBtJMjNqZeGC6NZAtIF00JgHtoxoxdptiy4IEbHfThwDkqetPYMqTxzBj1zWh1T5RT
         eFAarFhsrUYK6EZQdgH4RjvZMhn8AexdowmKTHUmehiI6nGD9CF8Q8TOdtBTxo6raRs+
         KWfBzKQLIZOtQt0uwHlGIelAEOsZeso3M8qKlieca+A239rXMv4GQGbx+6icSdRACBOg
         WO2w==
X-Forwarded-Encrypted: i=1; AKwUvBzSHfrRrHppol4SppOMnYIuLGw6NdSUwZVNOQVwVndxFOMQCQ15FyW1elq3s/qorskgN2jJh3M68O0h@vger.kernel.org
X-Gm-Message-State: AFuF++l/OIBD46gKxzYRvGY6cgHu7+6hMv4UmtKOadc2mpDPFgJFMQ1U
	0+h1lbYqEJs4Fzg6UUkfYBSam4JrXZTQEDovv7lKq5QO/HnHwBaQJhwzBHbYX5PRgM0bP/tUFgg
	LYwcYnhmQu9ehC83/Fv7z8gxd+0yiodM3GFYz6mDX1ErGpsQ1AazDbEpA0oLKTzJW
X-Gm-Gg: AYBFou1Gf8tGBMJLsvpQgQX2gDxDv6pzQgbyKO7xG6yohbWRm4WGTK/kn265RigiXkB
	/o6SAUvuqrouQWMHH2ylzi9AUP8q5ezZZ+97bTBFh+Q5uVVJKYMumwDTd0BIINYole6s4aOveH2
	qRTvTMl2/EMNbKzC/fmp46n5DlbtgZdZ2KkhDb/K1PfozBEgJLyEihAl5m9IYFFGDVZ7aDTSBc1
	+j5NOiWq3gL/PRLOS8fm5IC41nV1VGm8ZKOscAukF4b9uX1RwN8/65oiLxaqeuHZPr+mU4qEe0m
	bu3q/bCqY4rxTECvhQX37lwJUYaZ117/mIX34eHkYzXfXp+VZSeHOMMLyI5T0pFm0HsLLFmIoHc
	0eKueRYtqdyg5DICNkwtN3FA=
X-Received: by 2002:a05:620a:2a05:b0:939:72ae:e536 with SMTP id af79cd13be357-939ea08d7f4mr427003885a.13.1789122588918;
        Fri, 11 Sep 2026 03:29:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:939:72ae:e536 with SMTP id af79cd13be357-939ea08d7f4mr427000585a.13.1789122588563;
        Fri, 11 Sep 2026 03:29:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:34 +0200
Subject: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZG093MO2ef10q/LWPvFaNq71LX74/rGkq31nYz5GUvY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gQpFoZjDhMzPsUy+LdmdzrFOl71cZhEMXi1
 mgUxSmEFceJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYEAAKCRDBN2bmhouD
 15LsD/4/L0NDXHF/U4+guLhfAlcFLxQHsCCkbhDa9SOS7C/sitVrIcbNTbKbx2SaBDKTzOIw2Vt
 7fBhdDez23YI8P6u/LyNQl5OOzReoKr4QHgoiJznFhA7kDD5g7uivqKOQk5gLtoUzdC2v4LhDvN
 bc0kf+BHkLPNrtZjXxnHrbai3byrm3eG0S2uSximL2J2iBxbw20Yq/Al/jaFyzp/RoTBBfqcpRp
 G2lRAzNdW6oTkplvqMfsArEIpSBhxhUefh9HTMwcQ6GXzuMpJTZt2xhF9lzWMIevTQ89wn/p/px
 lOGDeaCXHXkVVdyoGglrP1wZFoiPDRfXqtP84gsD97V1+InM8iel/9wAyhFzq+DoSxs4YoagUbE
 UVKdtRU8cyWu94bEJVIUq+PqsIm/j2xtl68qOyLls03WVMFf7fhz3yx9kxzytJJGymPrb6p3w+z
 qkgL4q007YVdg9DnaEjPnogP59GM6b8ftIaUTEDU2lb9rhv447d2EyqHriIqarFmqWJOPqbjikr
 Sc2Ich4Mekhl6pe0ih/foIR/m5gAB/D5s4W+gFOe2wRxaEso3MyWe+Nglgdgg4zcNX1g1v3JRsN
 PHpj53uzFB3laL/R+BBF8EtRVZANl365wFnxP31ti6FZhX8VMSzrLPLxhD6R7eMzuIbQJJYKx+T
 yaZAFMi7MQwvBZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2SlDO4X3EAZ82Kpanofq8-X--gRqQ_EV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfXynL6zsJCVd9z
 sm0RvpBS8o88vUFWnAABqzJbZfOgIhBhTp0UmM+kl77sX2KfHa6QhQhrxgQSTX8ADZggIJlStCI
 HsS/shtxfkwf7r4hvHrkBmHbfP1jerQ=
X-Proofpoint-GUID: 2SlDO4X3EAZ82Kpanofq8-X--gRqQ_EV
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d81d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bp1g5Iz1D7c7guLF1_8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX0fRvNhmiENSj
 +UtS2zL866RY6CtfEOY1WHD2yHqI5P8HpGUFrHiFZ/gD/au05mVt3bAQwm+RW4NyUFkeaAZE52u
 gmCpSpL04EmhTmI1NI9QT/+5NXKlwVSxFhP1JJHOQ3e/KYw6pAkcEsqIGEg9msYug3QkOGeXtID
 6Kx4QqMt/PyNWw5kko5GEpSEKs84cMJ/PYi6ym949DovqkevQfkmneBMYYjmkuzkeLy5r7+uRgI
 cpk+evCABAeZ3JjNuUczkH4cxPXZNCzWIMU30AtxdSqstFdqhhBo0Cccx8UMM6//8959TO94foI
 urUGVfrMF7TUt5eESHUPPtubxMt0CYUeJ5mZp1UNnxxOLPZkPMnpe74DMDK9RLZDYYaOUsS/xzd
 2kOuvxeRvAxnIFrZI/JIAAg4uwAbtqtK7kty8PJCBgx8rYD3nfkGecwPpdkbyqadiOQ76Ls/QWi
 Oxhcwv1+Xu1+Ms6VPFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
it should reverse the state of things already changed.
msm_hdmi_phy_resource_enable() is used also in probe path, thus such
failure, which could be simple deferred probe, would leave these
resources permanently enabled for the rest of the runtime.

Cc: <stable@vger.kernel.org>
Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index eb1088755cb3..15e37596bdb1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -67,16 +67,28 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
-		return ret;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < cfg->num_clks; i++) {
 		ret = clk_prepare_enable(phy->clks[i]);
-		if (ret)
+		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to enable clock: %s (%d)\n",
 				cfg->clk_names[i], ret);
+			goto err_clk_unprepare;
+		}
 	}
 
+	return 0;
+
+err_clk_unprepare:
+	for (; i > 0; i--)
+		clk_disable_unprepare(phy->clks[i - 1]);
+	regulator_bulk_disable(cfg->num_regs, phy->regs);
+
+err_pm_put:
+	pm_runtime_put_sync(dev);
+
 	return ret;
 }
 

-- 
2.53.0

