Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E23290AF
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141092; cv=none; b=BhuqV3vMGqJwC2M5vLilE84u1PcWnU29vk00u1YXuSsfBmbKPfBY5aUA+T+Yjs7wOdMai6aHKPF1MmhHGz0Bo+tUCwsVEEPyCM9M022UFD6zIcEd9fhu3ScS10tR5KnSCwhgZGBmiy7W7gh2nkCAojSJtUf/9jIXtgSaAXUFBao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141092; c=relaxed/simple;
	bh=JU6Ew2LOohj7TnKbnN2RlB91uMlEd1cKo1oCxVKc82A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxObTPsZ7eWvs6HXggUYGdmNuIf4AMtlJVlkVBPxbwhd9YWzDL/44Z3bB6LcKmTrOvUEAP5+OLT4vkT1tDMecOjIUad7b8tuDLSfog0PP/CK6DHkdYiNa2V/uruwyoxNcW3YIkVdIRgyf3RySWeSCju0x2sta6DOkqiuhgw9CGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKUKSI2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aegl+bh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKUKSI2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aegl+bh7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2wI442902
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upzPaWlpYkfrSddQ1mDr+WdQI/uJnfLhDS5vPD3iHGc=; b=UKUKSI2FeVhBuaSg
	Z96a8HxOO5o7Oc/dI9rps0wxMrAiwn6q/lcUP30hZ14ieCMOzpOk7Rfw62afLj4h
	KdFSoP15O9lVKcLTq58hVMw8zRRKjaHbrfsAQCGKtsMdbrfEmH4johQn1akNabJn
	HSDkKyvQrTFi75zt5m46MB7qeLYXcOSVVUi73YnOTWzyyStfCqE7yoZkpwwdl6Vm
	B67WLsJsksIfOz47hgqK6+zsLhOT3o2bspipslegJsAT6W5HzXMk4fiFzNDCYBrA
	EiatcG+4NMD0ZtW1U4puNKTEcrLhdff3ZIpKePW2mUX8BH8ebqrc3kVI3/tv6vRm
	wKvKbQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2nt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:09 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4574f1cac98so1796681fac.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141089; x=1789745889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upzPaWlpYkfrSddQ1mDr+WdQI/uJnfLhDS5vPD3iHGc=;
        b=Aegl+bh7bH7kz5/QjWb5HjQHCz+FOIRY/YULNc75EvPl7HX2JYqUg++yCooerFTFQQ
         7jR6SIw9v1zBEnk2EEs9iJ7lWc8DiozpslbBZLJF0fOjlQ32P/I3IebO6S3HpzXOqSkt
         bqjhaKzdWdCo5wtJb3qXVpGeoE1rkRhcPQxYUIi5Cd0w4D8skU7rxKTfr6kNeffuTW/b
         WbeGCkns5u5c1kTe8CnOcY5ZWhNbXgwWjju+WrRw+xH5Lwo6mpd44UVh/Xgm/hzzhVNQ
         jhXuVkC0gyJcZLimwZx7IanVJeuYC2AZxLiI0EfNFlfihPsszaETwK1CFhcUYPkGiD9m
         mn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141089; x=1789745889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upzPaWlpYkfrSddQ1mDr+WdQI/uJnfLhDS5vPD3iHGc=;
        b=odI8uzLxSH520wrENxucYT8h7pZsStGFhm4DcoozAsxM1Vu7tc6Kqc0hEtgInC1uvS
         4lRYxJhqkAAPmdR5fBOT7/DrZlCuyIgoylObKTE6mmrlFr72p0Uiq75B9ZEhtXsiP7Y5
         MblI157XQLS2mufYA0Hyaq6dcaG6aIA0sGuMSHZtVqSe4BRwWznRcsbxwHcG2dc8bFbw
         5P81l+y9xwr0KKoNDx4lBuw8HsrdpEIkfIGuwy87C/g9sctw3cnvM7Db0FwAcwQvK9dK
         C9PJ7U9xDU4JxG5rqFnwm9G2GG5V9wB8898Ew+RgNMmFfZOdX8+rtdVcmgKp8+mWuoEw
         YIZA==
X-Forwarded-Encrypted: i=1; AKwUvBxpL+VsTLGyll7oftBEvHqSWjXQrxx8c4m5gemUKpVra/N1qkjR7HCvA7nnWT8w4cziZ+WCXBAaA7Jb@vger.kernel.org
X-Gm-Message-State: AFuF++lRnEA2QnPbL9a/9n0Ls3taK0DuoiyxuwxjsMbuJWSmVTwMlzG6
	I5r9bJ+VCfXPwyrA2iC4yQMrj+js3zohDcAFYtfphBpy4A8W3rUFt+LmYorZNQwVGDrXaJgFWqB
	UiXTtWchAm4h6H9NTTotkIPi/gywetp7KuT5nDRXwepuvuLCk21YQffYgVHqKoTEpatBUCfJh
X-Gm-Gg: AYBFou2f3ZNlHspmOeH87YYQ52LpwBIrICfV9cZWI962CYdG/d83GGpHlBYdqsHjlaa
	xusM9one1FC7dqaiREqrTFNPBF5RWp+saKEGwXuXFmM0tIhNWPmxmNhoSf3IjYO23rPF5+sddrq
	4ygk52cHed1+AkbJBpCiw/DIrmGjkAjGbq2HlHJhq236n12QhRKpSdfXr+YaCSJVsGCVXNzg8gl
	6JxKhf/4I0QkepUyf0YMXwbhVLeAIHF9T8m6KajDD0v7LyK/prHAVoZW5IQul4g9Apcru/ioCL0
	AEJachImjDRhivdnSqGoYQOa4xvW3Z6g0fHaeVFyJ7jepRZ+MXOpyE4F3vtB+YlRVfCyUdYUS2P
	5H7ytks0r2HMhl6Ar9x8wPrgwo5g=
X-Received: by 2002:a05:6870:e18e:b0:462:f377:8e0e with SMTP id 586e51a60fabf-47de7e627a9mr3865940fac.13.1789141088640;
        Fri, 11 Sep 2026 08:38:08 -0700 (PDT)
X-Received: by 2002:a05:6870:e18e:b0:462:f377:8e0e with SMTP id 586e51a60fabf-47de7e627a9mr3865901fac.13.1789141088231;
        Fri, 11 Sep 2026 08:38:08 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:07 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:38 +0530
Subject: [PATCH 07/17] phy: qcom: edp: Add Nord-specific register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=2289;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=c2odpdO2vfgQoFUA7tiaM/+kgmxU4W7SmF+t2ifOrto=;
 b=RLHZeOgOT8EhVUQ/NgLwZ4eZ8AhVJ5fw2UNVqvVwvwmfzYZoHde7GpNOePPGDJPTY9xHBIAOK
 qEFA66ELQiKBLzd/dnrBKOZxtVvWpCtdR3pt4Xus9W/Sqs3Ot9anwiK
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: ndbGugg1a2tRP_h6ePypKHiujvUgbHgf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX1QAn68hFe60e
 QTQI10vKsXs7oQHKcOjsOC3gWOj6XpLJhs/KBQEy76th9Fx0Bb4h+eTFgKLvMGPLMO576hpqXEF
 EYnNV+axYWuzr+kNtSFYGHQsz+N8Oo8=
X-Proofpoint-GUID: ndbGugg1a2tRP_h6ePypKHiujvUgbHgf
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa42061 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hULVr2eflTS6rL-ZrBcA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7AMQcswkw5g7
 37TI0vq/hOWb9XImVKVlTnkIHIbzVOZzBfc4CJkIjq4jimz0D078/3Dkd6LzgSdmxGKWKi70Doz
 ibuSrxQMD+Ls/U9/JuEXs/aRVqOmbNOPFe7mqoaXEmYUkZbTDCUK254w+8dHOd9QMF+Q3Q3d2wS
 cYhVnVnE+hqCOPUkj854MR/p04YKyDNH9qB8Ptfz2WEpEeXh3wwFA0Us7Y+jO9JAgfKGTWSHoPc
 ERUWmC5owUA33lU0rCKuzdFniG+rOOQYb4yJHWLfdE6wAAXx+EtnyxgKwtlflh1K7F2b+ek180m
 azdGRzxLlEzeuPgqkRhkKx8Jxn7L0GOWjtfZGx6MwAM3HNwRLgq7/OqPLEFttcKViSI3Tf7JSa9
 0322TdjR9p/4dL3soe0YRM44HQBFzq3OHp41Sfz3/bE3q20AbUhSi7Bp58uBiWmBSml845LkWe+
 q+zrpABGl5Kv4G5GBlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord relocates several DP PHY and QSERDES v8 COM registers relative
to existing SoCs.  Add Nord-specific defines for the relocated and
new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
phy-qcom-edp.c so Nord sequences can reference them by name.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c                   | 10 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index a3c893f72908..bf8a17336c7e 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -41,9 +41,19 @@
 
 #define DP_PHY_VCO_DIV                          0x0074
 #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
+/* Nord uses a different register layout; non-Nord value is 0x00a0 */
 #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
+#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
 
+/* Nord uses a different register layout; non-Nord value is 0x00e0 */
 #define DP_PHY_STATUS                           0x00e0
+#define DP_PHY_STATUS_NORD                      0x0110
+#define DP_PHY_LDO_CFG                          0x00f0
+
+/* Nord-specific TX lane registers */
+#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
+#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
+#define TXn_TX_BAND_NORD                        0x0024
 
 /* LANE_TXn registers */
 #define TXn_CLKBUF_ENABLE                       0x0000
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
index 93edabb830af..008b17222a8d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
@@ -48,5 +48,8 @@
 #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
 #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
 #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
+#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
+#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
+#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
 
 #endif

-- 
2.34.1

