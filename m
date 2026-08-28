Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6134B471402
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925957; cv=none; b=UUws00qCbNTJuh5vAWwh5c/fn91m6qZrSUzcXkpfGjxXiifDIszlhixux4JMMDiuKUySu+J4Wq/TAYla+3oHe2RHRG2qxjPVU05mcB5phWjytv45E7G4CKDEW8Vy43CoMFgWTxXdLLM7JVFfPQW79Zitazh7zZPZB70Xi5Kudl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925957; c=relaxed/simple;
	bh=s+Nis8MuGrrRzdnf1zzhw5BzoyVlhTkXBQ6LijklpUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3mahic1RdElv7tNXlvGKtxXmIq/q5hZqINa51iQT7BmWXTEdoOixPATl9ywKjO13kGe9DkgUoSW7Xhxm7fWtYDh2Kn4xwGOzxO8lkGWfWV3UQ1/MBpM8yN3qfgYorN6Ob1owWbwiHZ3uxxzn4+S+9CaqXJ8g9QLkJYNivEFIJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6zd4Q2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzYYF1Ig; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6zd4Q2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzYYF1Ig"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkenM3545318
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdhrzVC+BSUYhhqWL5aZLvycJ6pbOt/WUM7DdLQllPo=; b=C6zd4Q2VGmRd2gHZ
	enKHhB574O0Vx22uspUq2ny/Ba1GhjzRrqvYWqOmyIokUhuMWmHlrn6b2qIfZ6nL
	cqu50hSBeBwVAOGUiTkH64A0sMIMuS6lpY1tVBY3HrUS2a0rxnkTZe9PidxaF34o
	DIzjtdma4N0Uvd0U3zPB39LPO6UEtiCWxDGmt/TohINZC6vKbVS+MQnKiopKfDBM
	2/zV8GnWWtLGSSeSjXkqqntxR3YVpf+NK0IBDw9IBftNpBckOO610/SdOg5Ig2It
	LU6pHUEKtkKEwH5qMCtkeBiUVfMuSOnaVDityolZYCXTHgMtB07cO8QaSoUw+m2C
	JpqcqA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1xq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c49f740acso81655241.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925950; x=1788530750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdhrzVC+BSUYhhqWL5aZLvycJ6pbOt/WUM7DdLQllPo=;
        b=dzYYF1Igpji4WTVj1hi6g4jD0jmUf7O7QKU8/WLcF7pj9GK+lQJFLZlvQ6Pgb2gXie
         0K72rFd1odHiL210hOe8OSMoEHMffHDhEeTog+eqs9yT4zbqDsTDvvNUVj81MGx4mPEC
         zDTi4/cLri1FeeBvsAZ6s7cMPJd7w9iON4UFMKrtYEunz1eUb1dXi440kzjLLhYyIyRm
         6GncOWyJgoGAkMvIokxOEywplzKOm0pBG7bxf2Y5h9R3OOKtlPAS11nCVM3zRy+gyrMY
         MZGR/JPnNwP9Ots1UQIEFd6rJu9eZbr7xwJIzyZVkMjg6E3xQTLWCl9aR8KhzkhkH7UA
         QUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925950; x=1788530750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdhrzVC+BSUYhhqWL5aZLvycJ6pbOt/WUM7DdLQllPo=;
        b=F0Kc7240c6+HzZ2ONhj/QbdgokjUQ/Q2obAoKgfRlinaJrbN6N+E4DMkT8lGCsOeGb
         q91hKPvOLLoSE70cOiQQNKncpEXczKhWUiYBy6LtN+Lu5/UMevjCciFM86T3uz3yk/ze
         0tAxIAX/TKE/FY/SA2eqnd1w7bJXAmAQ6YqLYgLd6c9Ck5Dz+5IC+Q19lzKcHYa2N75/
         n2QBJNWU+NEr93YtCqPUi54POTJRdY6uKdxXOJbba3v/iI4iLW3WpE4P2efPHIlaYCJ8
         WW9yZN64y6PHwYmS9OUG10L1PeXp+3mZFXttucVChFoNHsU2A/v7eK2YXeRvQyXO9+/p
         jaJw==
X-Forwarded-Encrypted: i=1; AHgh+Rrz+APYgvbR8MKA3647P3i/acVGXQiyjpnNqtvfQlRAV1o8mjdbLQ3aJERA5Ps/iJXDwXad6NXp4oQV@vger.kernel.org
X-Gm-Message-State: AFuF++kiHteYCX1AzjPkaNM1WVjwaDpuSZImdM9tFXzhZrfKO9nrcIvN
	emRZgeI7zq9XXNqwY0NOu7brfJXmS8KA59D58dTXfocX/zJowWVXI2be/JXzN5/Dp5V49/FsWl9
	WlmqPkC9uPYSHwcuwdXLwhfDxxkCUmcd3DMLFK7AZRJ54KOcUZW3F27KqA+EcWPtr
X-Gm-Gg: AR+sD138zb2vgjcR5gRMYAwPzOIyvqlA7l75eetH8kZi0GZQjmKXsJgHVX+6qHcYcZd
	Cvqr7svXdUi74ecRD22e7kfGSy6kWzrQos2+RVs13c0iA4HGe41rteE2IgVNr1Gbdi5S4rQu0eb
	JpCoP/HPHKDgOrPawr4GOH3btzuKkr7ZTu3oG6CPAkEX6qjMrVd+vWY9rkioXIUfo+UZzsXvcey
	BA7ZSSfOa5Q+kmZwFbXyVtt/JdGQaCilydMzLOUFbQeyZSxtJ0yvdLoEdaoObGfNlPPGv2XMK2K
	n2u/he73CElizRfeiP3mosUxWDULJfKNf5nBHJkL+dPso4mz+iTkbe46plapBn2VAmbnkiviOjv
	jyWtq7gCEKlRJpHG4L7wcxK0=
X-Received: by 2002:a05:6102:2c82:b0:785:76cd:ce88 with SMTP id ada2fe7eead31-785962b3bbbmr2102328137.3.1787925949715;
        Fri, 28 Aug 2026 07:05:49 -0700 (PDT)
X-Received: by 2002:a05:6102:2c82:b0:785:76cd:ce88 with SMTP id ada2fe7eead31-785962b3bbbmr2102270137.3.1787925949159;
        Fri, 28 Aug 2026 07:05:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:06 +0200
Subject: [PATCH RFC/DO NOT MERGE 08/12] drm/msm/hdmi: Add support for PM
 OPP table
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-8-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=s+Nis8MuGrrRzdnf1zzhw5BzoyVlhTkXBQ6LijklpUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWftyhgGPop86RTp5yjaMiBi6zJ84Nk6QwQP
 L25IU3YncqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVnwAKCRDBN2bmhouD
 13HSD/9qtzLXgsXADGdJyZNDKxtY3kCVyItZ5LdngLcsz3tRqh3VkBw/ZQbR2In99azFCMsr74n
 xIApgxejd7thH2CINMUr4PST/uzWZmXHU1YdngZy0A/UUnR4j761zGMUZUlwIGNUyKsF/onb0Y+
 Zf3/t1kmXoJhaIerSpgt0eAJVXr/hTckHwKuVKB4FrqEzrZQeHyUzzhxU7/Mm0ppNIoFiaBK7A/
 40nwyWl/GUkQSdJAMSgudUoXEkOB2FKMIKTexFQAsBaLFhUtpS9BiD1lyLsUgj/WNQmdzgMWm2b
 M0EFEvvl/CtKQ5k1z6+SVojT3vrQVYPbLzHvwHIloQ/u+zsJFIElMAadz6/+FkWhmjNNopn2W6M
 LpGuyXp4qWq0Ma72dlrw0wNU1bdvuyTxcspqD5TJzkw+C4uB2qWszQcCsz7217xRX5Fq+1zU0un
 UHv/lg3ZbaPkJhgWy3/37x+KJgW6UvzL62vejiFkRq2h3PfWvsmORvG7trzL8OcByQNi9holWjc
 BqSdYkMj4XnJ3FEKpJE5kX/kIy8xrdC7j3mtK0n85JrdE6T44gksOAgE9t3nGve6836VVQTS3N4
 kDXA3IMfBTkZQ+U+YmtGaEIasfEoDkIeXPpJytAzFyWuqSDD5g7qZKGOEc4a+k8gRJ3l8JcHw7c
 t9/3G/x/K4As8TQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a9195be cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a2cU2-lBnuBmNLb9j5sA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: hvM4403R415FpuvogQqvzefgz_EO6X_n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX+fPNXo64rFHE
 M/7t2kAjbc4u2qpYv9gQ4h9mMoV4zysktEt7KF9OgLY9XtnBw5QMPfdYiKH3YAHV8lVHyKq5lCj
 hdsKDF0i1Osq4QNkH+8JHdybTd1Hl4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX44GxY3FzZFK0
 CbnGaoiR57EHKd/DIkxCB2dKquuYlaLpqlyuzH6hiNcY2Qhl9aBYqZ25XWYBiRl9XX9FEbHwQ4a
 yg0WWh453AO6g83x/h/AGOOlWSkq14koL7TLolGViyV1ireQvsLxjCe3F3HzlLJmPUKfHw/wtRv
 AWaZ18/FvoWetC1zC7hd80CtFtR9sZoYuQ9RdeQ9FmwuFsh0Z0mAgZ0JSNTUFGtOOBumE/S5kpM
 c+sbivV8k7qJFiogwuX3qClndF+lMlrhXWu3bsIxsupkREjMc55zjPnKlyGgZUO6oJnfCiNPr2+
 AG+GpRx/0Fa9wG+K6TTAJgXSoqiV8bQOFENtRe4WLRMwFEqSK1SG6x57Qjr4R8JFMBTlkVnXtqf
 mzd/Bjg0WX36xbUI2YMLdNLELmWRr/zaTxieS80J8MQ2TJAMXR4xBijRY9OpFgYuHuE5OWhmCH7
 paQy2O8mqyHXrokkeFQ==
X-Proofpoint-GUID: hvM4403R415FpuvogQqvzefgz_EO6X_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Allow scaling the domain rails with PM OPP, which uses the pixclock
("extp").  This allows proper votes depending on requested HDMI pixel
rate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  8 ++++++++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 10 +++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 474006084633..c46f30063f14 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -368,6 +368,14 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		goto err_put_bridge;
 	}
 
+	ret = devm_pm_opp_set_clkname(dev, "extp");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
 	if (!hdmi->hpd_gpiod)
 		DBG("failed to get HPD gpio");
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d0e3b27644fe..621083a97b37 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/pm_opp.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -30,9 +31,10 @@ static void msm_hdmi_clk_prepare(struct drm_bridge *bridge)
 
 	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
-		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
+
+		ret = dev_pm_opp_set_rate(&hdmi->pdev->dev, hdmi->pixclock);
 		if (ret)
-			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
+			DRM_DEV_ERROR(dev->dev, "failed to set OPP rate: %d\n", ret);
 
 		ret = clk_prepare_enable(hdmi->extp_clk);
 		if (ret)
@@ -58,8 +60,10 @@ static void msm_hdmi_clk_unprepare(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 
-	if (hdmi->extp_clk)
+	if (hdmi->extp_clk) {
 		clk_disable_unprepare(hdmi->extp_clk);
+		dev_pm_opp_set_rate(&hdmi->pdev->dev, 0);
+	}
 }
 
 #define AVI_IFRAME_LINE_NUMBER 1

-- 
2.53.0

