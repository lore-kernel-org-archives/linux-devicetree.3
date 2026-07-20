Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AE23CCA02
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537066; cv=none; b=HVq5QT7sktA59zxvqEf+pO3+mkCoHqUQqReOEfn2tTZjzGsSMzNE8Wq2FtnsI8npVjTqZEaCbeSmivJivhDdTkLTQstDi2nQeZsIY4iibWMkJiNV7TiR4GAL5MUpQHQI4XnGJ9IRYgBgv73CIqpsKMUaxzrQekdQqIfLZOYapvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537066; c=relaxed/simple;
	bh=av9Af9qA3AYN0apNWa1HvbDsYAoNsAS/A1GCOMQG84o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQCjYWdgMBxXxMNhm+LwEDgSj6aGNrcbdpYLH6CfDMn5bxNz1jmH0MzV87+O9xVs4rMM46ADHudnXojMOR8rAdyUjPoWyKOimIBFewJ0cbiULfJmx2ekBZYMtbOzrUWAhJ9hzSA6qGKVoaz5tILkvTVYr20EBe7WvOW0tARdZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGMJqpy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXSyL2+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGMJqpy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXSyL2+u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RhoZ1774854
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmZRJE3QliI8ngRIiweIPhnI7WNysb4MqIkWbp6/7E0=; b=EGMJqpy5bickj1U2
	wqpYD6Mz/+LG3HGmNiikXcYyegf8lJ1s+gOgwpUdvB1hBNAZ63AILLteSh1aFWIS
	Wgyy79mDvEaKoI84LSC6nHkYmuqPh5uRCADez7isy2IEeLxDlGqP5zVB634nnPCt
	Skrc89jLWDcKDZTHq4JykbqtN94xX1ZgNXlD+W49KCxmqcGzkI6AKS7YmlEa6V/F
	PuMov1OfUUSfNjYWpqAgR4EGHa5qhq5mxkdoj7/A9/6WMpxXA1vNBzRihrhy2Fho
	LNCJN6hXP70WiTF6IE0rKE9fqzxtgEgfSP4+oclUBB5wTsdP7DMm4e9JKyTP0Jyz
	rS/ukQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af587f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efad04d884so135326576d6.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537063; x=1785141863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmZRJE3QliI8ngRIiweIPhnI7WNysb4MqIkWbp6/7E0=;
        b=HXSyL2+usVG4RlX1hCeE6V8uyI/6GQ9Dsisyt4w3k5fT8EHMBLhHzBTYPCSkJShef6
         c2s9tYx5LkBBJWiX4qVP02EGUdRBZGiipCk1N+nH74mid47uQVX5Z0r/MZE++ADO7sdB
         4l6nDbrhm+1m0+z3Hi0FieHYOeyDZXoRd7uLQNtUrkQcl0DntdMDPBlRmXkLSXEHhh91
         RUMmtbCNeYkvL+1feyTGvbg5AmSpbA74F0GaEi2vkYfVPx39FmM6cNzsVcH/oDQpW/Ln
         rGEyouQHKRJtF8skyOS/UpN7HzTdWx7BQ+HtN69kDYqWvYxo9+z4N6wyQ48CpVMjEJLn
         GSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537063; x=1785141863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmZRJE3QliI8ngRIiweIPhnI7WNysb4MqIkWbp6/7E0=;
        b=oXZ+687CTBJCJVaSbf6h4DaGj6HDdybRuCZcKk9M2Ijq8XXKt5LLUHhKqsFaTjNV74
         gxvPO0sAigF/pDsnKuxzvk8plsyH1X3qHGJLd/Xl6rHKfQ1V7m3QL6urkVuQi14BS4Yz
         6GV7AmwWGVNddLBe0tOzYreREayFIgv2sYfNDWQ8xVCS9t9q2zbH2xd8E1uL4OEXfiC1
         jGEfvSOTenUT9cB4uk2n2BqbNQoab/RuJwvUPy+ImhtSdC7J+5cIlca2Yc6sWOTZoqaM
         S6Jdifk4m7+qZiyysJYPYtBpjSczNCkm+cowZkDotrqZHnE9ZeOFoqlrvFI/I4La4wpt
         7LfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Hrsfj4HZobJubxI4piRNV85MwfjuToVrr7dMlHGxOy/bdtwSJutkpC/OFtDLB2FHTw98aoV0cFc7@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHRUt2EH0QcMfihaBp7t3LHCyFKXb4QgT26ziwGTtrjBc7GEH
	m8J0dmaz2B+Koa72RB3KiLzP6/jQ94BBEfhOT1dvrThKmIKilgPv1PQhYhLjba1+VcvlO4sBMJz
	G8/HlB78IGO/MschEI4zEw4YU2UryVdRXc2OZvVIFx9VDpc/pwNY3G00Odijpfyvy
X-Gm-Gg: AfdE7cmd7kgtCsxdm8p8fQsGUJZzYLE7tdFN8d2dtmoJZxHw3QURIK2RQhTKP3JYjAw
	vd31J6HXAK8tCaUY6oeUpej9XHsHsDOJZ+skmX+PikxoRWs4WqYOkUl0snhbI41Jy6rSdDm/wi9
	UMOjRnpfmvdOM47KlOHqnYA+6jCDNzoPT58ZOh5B+reCUPW3sc4Ya8SjraUY7x9Ctff5AJZ+Zts
	zrM4QnTTYHu/LVpOJfN/ju/rg3V5OBBAa+Qa54IMAayVInhMEYlcRWrDIqNUvy8noVs5DESmCjl
	uClYSyuYBD8fdgBw4gcgdkkCQXHlWDrFB6MVxJuRYWrz5mJOMflndg8q8z3QmHzwgi7Rn3eKRJS
	f21etCt5Ohk6prtOvY1hjChVAKhwKVEM4XsK+e1n5gOg+M0qVow4P0+m2d2iRsLI=
X-Received: by 2002:a05:6214:400d:b0:8dd:d13a:8c84 with SMTP id 6a1803df08f44-90778310a4dmr138933886d6.8.1784537063455;
        Mon, 20 Jul 2026 01:44:23 -0700 (PDT)
X-Received: by 2002:a05:6214:400d:b0:8dd:d13a:8c84 with SMTP id 6a1803df08f44-90778310a4dmr138933686d6.8.1784537063073;
        Mon, 20 Jul 2026 01:44:23 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm87061716d6.45.2026.07.20.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:44:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:43:54 +0800
Subject: [PATCH 2/3] drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
In-Reply-To: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784537040; l=4105;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=av9Af9qA3AYN0apNWa1HvbDsYAoNsAS/A1GCOMQG84o=;
 b=M7+jWI9nwqNMj7No0I4fwFmPw508sY6MGQZXxwx4HRg5+Gxw2C7V6UwlFoWHTyj1PllZFQLuJ
 EIGc4pTbn/CDzTDxo5E+tcOczC4FerzgzxkDoDNjolTBGyBX2UUE+Rf
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfXyzG2FD7ESaHT
 +INpqc5bEcBd9xoL4FZ5u096ZTW3TGOBz3GoSrleRNHNm8wmJWdIDDcav5Ou7YlYOcVaJbSfj+K
 61KYWAaVaeLBXfuCwPAUHTa4Tu2R2iM=
X-Proofpoint-GUID: A05Ejx5_BzUI8TdJupyO3ojwh3IzjoRo
X-Proofpoint-ORIG-GUID: A05Ejx5_BzUI8TdJupyO3ojwh3IzjoRo
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5ddfe8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=f82__hHJf2zzz38AdHIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX+DeZE5Bs5FRy
 s00aPftw+9QhOEkHa/24vbKp+JDUXXFxHehCNgfvjEHt31MMmxjELTYQVlN+vpt19avAjX5h3T/
 McJkRmynV5ZrWGvUfQzIh6swHABaoKfWTWdRwbw25tssUxeg2lZE1BunnGqnVtDzSVLgAH8nMF6
 g+6WTBRAXjl+Ka9V9JjkVQDPLh7HQGfdi0ESPWWhM1giGBN6FBHqzEmDqhYgwbli/efhpDZzaa7
 EpIQ74Aanp64vPVf4UhOOt8zimTixsMQ3qmA0+Se2EGDm3WPBenzhrJpSjTKIHtG/T/NSrjbGQK
 jTlwIW3FSA/j4eTrQ2252pXNalNA2KYYMrNErfwwTnm3cxM3AOn4i7PJRIn9OJ+gWsRhZMONlbH
 DToDmk0ZlJSOothw5IlkQjbOgIuLputT+nxKu16XP3R/nBRN5TdDcievCPDfBjc+or6zihZoE69
 +e1NV0kHPjFT7owB9mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200096

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC powers
a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).

The MDSS driver currently relies on the default runtime PM handling
and does not enable the secondary INT2_GDSC. As a result, display
pipes backed by INT2_GDSC remain inaccessible.

Attach and manage both power domains explicitly and enable them
during MDSS runtime PM activation.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 53 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..63ece55c4f2e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -13,6 +13,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
@@ -44,6 +45,7 @@ struct msm_mdss {
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
 	struct icc_path *reg_bus_path;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -233,6 +235,21 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	int ret, i;
 	u32 hw_rev;
 
+	/*
+	 * Platforms with two power domains (e.g. Kaanapali, Glymur) need both
+	 * GDSCs enabled explicitly; the core framework only auto-attaches a
+	 * single power domain.
+	 */
+	if (msm_mdss->pd_list) {
+		ret = pm_runtime_resume_and_get(msm_mdss->pd_list->pd_devs[0]);
+		if (ret < 0)
+			return ret;
+
+		ret = pm_runtime_resume_and_get(msm_mdss->pd_list->pd_devs[1]);
+		if (ret < 0)
+			goto err_put_core;
+	}
+
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
@@ -255,7 +272,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
 		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
-		return ret;
+		goto err_put_int2;
 	}
 
 	/*
@@ -276,6 +293,14 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	/* else UBWC 1.0 or none, no params to program */
 
 	return ret;
+
+err_put_int2:
+	if (msm_mdss->pd_list)
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[1]);
+err_put_core:
+	if (msm_mdss->pd_list)
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[0]);
+	return ret;
 }
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
@@ -290,6 +315,11 @@ static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->reg_bus_path)
 		icc_set_bw(msm_mdss->reg_bus_path, 0, 0);
 
+	if (msm_mdss->pd_list) {
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[1]);
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[0]);
+	}
+
 	return 0;
 }
 
@@ -421,6 +451,27 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
 					 msm_mdss);
 
+	/*
+	 * When two power domains are listed in DT, the core framework does not
+	 * auto-attach either of them.  Attach and manage both explicitly so
+	 * that INT2_GDSC (needed for VIG2/VIG3) is enabled alongside the main
+	 * CORE_GDSC.  Single-domain platforms are unaffected.
+	 */
+	if (of_count_phandle_with_args(pdev->dev.of_node, "power-domains",
+				       "#power-domain-cells") > 1) {
+		static const char * const mdss_pd_names[] = { "core", "int2" };
+		static const struct dev_pm_domain_attach_data pd_data = {
+			.pd_names = mdss_pd_names,
+			.num_pd_names = ARRAY_SIZE(mdss_pd_names),
+			.pd_flags = PD_FLAG_NO_DEV_LINK,
+		};
+
+		ret = devm_pm_domain_attach_list(&pdev->dev, &pd_data,
+						 &msm_mdss->pd_list);
+		if (ret < 0)
+			return ERR_PTR(ret);
+	}
+
 	pm_runtime_enable(&pdev->dev);
 
 	return msm_mdss;

-- 
2.43.0

