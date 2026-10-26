Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995937;
	b=GpqtG+J7DlSd4ofc2JNlwfvEZtk7lqZEC3MlPtA+agvBY9YScOzLR2+LhP1IK8QDt51o
	 Ty/lnm3MCXoofOP11399WWkk3C6vK3oXFvX6nlfmBnbDKCiryHfXstPpJMw5Kt3D9e7xM
	 DvzyAuskNj3gkPFjmXfuked39gRmwYcAX7JY6qzalnfB/uBnUIX2lUurAJCTENn1+M5Xb
	 UC5OprXzmBSe6MWQQPJWM/lmRPziihF8QrEZQkI7t+sZQ/u+DXvQL4ecpb8eOPbg4n0PQ
	 G/pRBHMiccG2knXz6JhGdt+ja9yduTEfh2oW8GNMz+2SsIURy8Btd2eB9BooeugzkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
	b=e0TkBFwLSl+yS5Q1++Wka9bqTTosZY0YFjlEPsd7iUVBc+O+7+D0X6TyFcfEB76AeQ5v
	 0+eBtOoJqXuWzUtc1BIKgtw+cIOeg0oKi6y/epeQ5dO/BHztKHx4MNMB4Ky7RRu3E9vKR
	 yt9GJPvnuqYKVu1AA9xxHp/ypT2oKpWmVyjeDfK5n9wMxQhYB35Gfw8QYDbTvoCQzxF5z
	 k9B2tPZOWm51kTxGmukvXqOcW1DicEvNJo4ZPhyz+Nzxog+WK5+OFsCKPF9dWH/AXdWWs
	 eybVdyO7lAQOj8hJOIonk0Ta6545KbCKGqIuakoV590txcmyJieyLJUfmSKBGNqEpfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94211606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94211606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b5vK1340528
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=; b=d6jUNACEdMZOAneb
	efc/lmRa0ouqmtZPn6+Lmoacckw5QKLPorWHW4OB6TWz/6dvAfcL4m1WDtfznd0/
	ICcLtZNS6b6JuiLKehMPapqK0XJsrbbmgRHvTAIwtvwZtP2wE1s4xTZ9ajwUCjkN
	YFWqESrQ7CIZ3WoQURT/1XMXMTOx8cm2OdPGdBFYnrROzceKLxgy4PjYxvaR+PAq
	ap0JCgeSelkq9r9Kx/mX8M1U4XV0z8HOiA0SSt+mnjbiexaAT0DpabYJ+4KEPVda
	cBrcqlp4m1v3mtoL7YbfppntANJNpzQFWBN4xBUjoIJslJriDxA+zLbfod2FcQZ2
	gBpCBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vwmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:25:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so4449321a91.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995935; x=1793600735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=bUiUGdPeNhK09b3IxUS25Ls1bP6Nmz9uWUicaBtrlIIOHHO+KiMOxh8XK4LLbYkXmg
         qBimgTn5Y0KTyb5d3tL0/VZVWwkpjKh5nfq54GELf2QvTfZaoJMd3bEhCeEb7AF2NPcW
         6Hy6VXCZPBovTtNKTV8HK/OxuhVD+1AGwtrfTW9Qjrk2gw4t09lU2VIG7vSSPmzzDT61
         BqN9NU25q2R9RsIbuh/8//CYU+3RQahJ3HOrklzXzC78UBnG8SSkwKjJ1BU8BMvS6c4D
         6MvxoT+2f9sOFmUoFXmX4Ba5QWXif6O/QTe89daWhU6NPdxqtZLLjueUacYLX3JDGsNT
         4sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995935; x=1793600735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=dMwYaAAsxNt5aWwh6gOjGaXAKJIA8zqT3pNGNT0hYVr0K4lj1ntwpuxegcbT5tTxxg
         AnMgFMnkkN6YoCB76wGeOZ2ka8ysdwPRBqOn7h9/LVO18fqOPknPsiPI3AKmT2LKG4bC
         iuY4tzLTmcXg6bHgc6LQGGXEZNKVmTt3Ho9DHMvuneMBIFdYsYxnEjU/4W0BGWTUs9Ue
         zBStepkZqVsi8PaKNIeSLOSombcS1ZnSO2DdTfTesodd3y461VbJ4pKa7FUZ06A+Oa7T
         yniaR57ar0BK1KWeGNXE6UcrdP+CDF9J4Wk+VSCjC37GPZ4vLuzX3Ui18VyqRUtp++gF
         vsfg==
X-Forwarded-Encrypted: i=1; AKwUvBxhy/BdCi1lyC9F1LVdAfO7V3zUblIS7qdRjapA+xYP+oTXFTKQA1k070E4d7w0eZG1VCUQXQY7lRew@vger.kernel.org
X-Gm-Message-State: AFq9FYK4F/a9wz9p0u3GNPghLjk7YBSchJYUTtSHNTbgXsGw/wwDY9VB
	zzvRpYq3Wk39EQNoPp4cYG2nWik4vdzH+nxgNpDR8nPbxx22gunWKRGd6cQxyVYLafkBClJ7Mf9
	yKQYeZTCyQF2OstIVqFovjzPxfRE64tjuiwPt7qFFkLrNuhiiVv0icz8UgbX1FeiW
X-Gm-Gg: AYBFou2MevVeSiOlI43w6XzUNVfxGhPKNqCw9XQusk/GDIEg0VTiVNEqYd1Ilue1glD
	AdWkIF+bxJrotAjs1jDu2wGX96b3d0YfSsHo5oQZVI+20zivNr23oIiBxwEoEg3J1Xvcx0bc6CQ
	n/uvsWnaIh002eOB1PnHjLlInERyyiWAXxR1SihXiF3DyDG3b+DlfGexxyl/BeP/jxbh6niakWk
	sRYiPGJormPsQfHAx53rrXp+rKfL9gHl+fcOeTJ6TclipbNG/1iAG3uiMlubpCyL4jQIGmfbh2N
	bTwy38982VKp7vIFulfXpU8od64QDqLEuckqNjF73MhSLLg7Mb8ordval+3b7usvK6o+1wG2J1I
	lmXfEsBFyZaYlqkaaXHulzg+w8sZ9dTjdqg==
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707725ad.1.1792995935076;
        Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707485ad.1.1792995934668;
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:32 +0530
Subject: [PATCH v2 22/23] drm/msm: Register the DCP backend
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
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
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=1867;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=DnOVMMMul1WJd1CWK5XVZuD8++FkNWwJHoR8dINot9c=;
 b=QG83X9aBE4jBa1DAS4wPcmTipRI+XMBqCLy0NmwgeS2ERiIBadYlckpX6pOlVddmoKAl5KzcE
 g7G+3CHykn2CWWGLoyNuBrJN0+MFb1zULSaZ+b7RPKVSseb+q1g9A9G
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: ZjIDYxTp58fKPaAgZY5-3VBlImolWrsk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX4TOR7yoA/G3n
 BDvQlUH4I5AZZ0sho2STMxJWy/IaJg8Q4i54XbEXlJGJlobblio56SxM/Cvhwtif/EFKrmdJDwt
 Yw6KKo4OwULCAORFD78pVjWUEV3tlMaOaDFTZoRsbR2bH34SEZyBtwVI9anMAPXcPVS4SmX7cpo
 UCZGXI2hk5ymPuRuoTI5WTstf8pk3pLBDRTakPYkN20QJQdBgr6SMgxTW4rYYKE4Yh7S/X2Kcf9
 iQpav13p8+X4ZxVoHnazVoIriyfl1yGX5ZSwW7HsE7E7gbVEbs2+LV46WOlsqvufGhtad0ghY17
 O4AFMAOdNLKfJf2dJdg9b93aC2viMgfU4bvTwHIcK2uhWd++ZYFe+3cJ9RAAQxI5hQahhVEY33k
 826+h1s9viF9gSaQP00yi0kFUtM4q1nSmsgVMPpaj3dwYpxO6BUaayjbY+V6Ym9BsI4GjxGJrET
 0my5q0b6zPHGjz0MKew==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef25f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lVH-uUz8Z5eEn0x1YxIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZjIDYxTp58fKPaAgZY5-3VBlImolWrsk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX897tDsTI2BNu
 jZuT42LUwDoPtTYBfusMPV1Es6VNgMn1+Ua0iTwXjojwDAEuYQeCevTWxLXJwIChXbfwrU1NJc2
 qmekxJhduKVEO3d5sny48Rq8i7xBTPk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

The DCP platform driver provides an MSM KMS backend. Register it from the
MSM DRM driver init and exit paths so the VirtIO driver can use the backend
when the DCP function is discovered.

Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
disabled. This keeps backend registration consistent with the other MSM
display backends while allowing DCP support to remain optional.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5816c64d7ce7..d413c361c442 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index aa5dfd82ac6f..befaa9f2cb5c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
 static inline void msm_dpu_unregister(void) {}
 #endif
 
+#ifdef CONFIG_DRM_MSM_DCP
+void msm_dcp_register(void);
+void msm_dcp_unregister(void);
+#else
+static inline void msm_dcp_register(void) {}
+static inline void msm_dcp_unregister(void) {}
+#endif
+
 #ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);

-- 
2.43.0

