Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D0313E36
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294002; cv=none; b=Nmxv4+MvUf5YmECZGzIgoLy1f5UU9jHXs36uQkSabHcI/e2FIqcbOD79scmbHZTjmBKzHOg/WRO4vo54696CYvZnGk54sK72PFnN/inN0GwiuPAr+2/RPcSSuXpDoFCYkdkvx2A2EE61bhEK6x/m0GUMk278HRcb04L4ilgon5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294002; c=relaxed/simple;
	bh=U/xIWfIVyxF2mQ02rx0FKseSqm13qZ1XiNmxrWwriB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDPntSV3LjH955HwZ0WK6B/qNE7rDaNXLidbGvkbHhE9Pr5GxZcoyIcLLh/bEnZ13+IJsWOtzHQE6/fmmZ/7c9TYBcpuTqtk/C1FYoeuk35/K4H+ZV7HQWabkaifosBI6w8zhRErH9RlNPMQq5cWZUDLY/mMy0qzTtxhaRjginM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1uPdLIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzkQREdo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1uPdLIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzkQREdo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBii3639698
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=; b=X1uPdLIGlNZRxzwR
	/7qKi6EbNQ10JMyLzWgqarhhPJB6jpuCwCq6dUInbebyfQxxVR45i9Zh+6WnaWe8
	buVESTnNACxCrhJ360/QEVLLoCAQiNObjtvn95RAVJNB/JHQD01D6Svg4QJGkjSn
	zmdg0WVGe9BtQDbRIWE8W4QZ2uGof6Gmmkj9jRoxeH5JV8EKYyrlLneRvBB6Yenv
	na8hoh2eAzO5nPjBOQrOU43sgWVC8/KZO3sKviNMv/EsSV0Ajz3nlsptD91M5Yad
	3NOsazrLiaEWOPeXnVwGaKQAC5PayTXPpfpDnqOzfJwENY+afWbm0MfDIthQ5FJS
	+J1SUA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya023as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-612ef4e6c54so16751179137.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777293999; x=1777898799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=;
        b=bzkQREdohcoh3eE6JVy9aJV+4+0Ls6pyw+ExBe/rypz2J3G8wg4cnQZNJkHWwhhS7+
         s70zZVIBI7sWy+/AzXcQOimWFwBQmTjNFy9UxUrlOvwy0dMfBKPmolOBfUkdNIBTDZ26
         4CIOu8ieNRyAyqTaqAxFjrzCRxZsGPd8nQGACy5TZ8F4G+AMc6L97G/4IqxTH8IqWxmc
         7FjKjetZh/8BdG4P3PHg95rHHSJPNCN6DUVmhX+kBcMrL5leQ7R+Nluu2XiBhE9gN21k
         iLSKEx3uttx1glvRdlbrMbmzMvWGcCvIRNzdY/+8oYv7GF71xK193CNV7yBRJ83FKRg6
         tSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293999; x=1777898799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=;
        b=rN9ItJNIS0udhMCdbcjfc8AQ9FR+dglAawAAjajGkqLgQG5bUazCVMarM2XtTxaIQ9
         d8C4iVdhOE1uytI3p2w0j+3z+yShkSjHv9HDAoeT2tAE5UIWSNAbk9rU3mLhH+c7HPex
         SoarYx1gF8lOAdZEBO7BrxlCIf0/gwxFAf4qB0tprD394dU+9wgIJyLUZ8gwUqT0Pkcm
         Dp4h3OJA1RMPwwHlYYPncrc72XwwttJfYgwghaBz7ZFiw8pX8t2dvQMy/Mzq+sWEeue8
         DFsmFzXrKnAw+p8EwxN6iXnDLx+MOyGF6qLtMhgZnu0/p6YmsNp0dzm+YMzhR1oSkb/j
         Comw==
X-Forwarded-Encrypted: i=1; AFNElJ8XuGWbA5l3LqBwwR3KIOQaahyZvkkCjYxwXoQAWbH+WlK+3uXpynHNtunNWrbq/qraG1SZMkAD4k2j@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0//YZz5xZBiTXpuyQnIDjlT6o9LLc07Qz/D2TQ+KRMW7QkYo
	kMWFa5GcGPAkcMz0OoJKlWemiMTYMSJRMHmb8rErYc3ehThtwhW6eNkJSgaOX5RuGG2H/n4KdRi
	R7uOa2ECtCiz9C03bx5h4TMbaPUaPGB0107U0cZXNs3g/3Rlxubu23G78Ry43g3+AKQxRHotJ4R
	g=
X-Gm-Gg: AeBDieukT/tFGq6uf9r/73nPx8QXmjgvezjKNCcZ8vKAGqeu/5qJgxprVRa0ZQ51EjC
	ZJVMJ5UTLa6vO+oLBeRzdBZQ0VWWKKMfTohbk7Sddh8xpbxFwFO3/KfInEBKi8ippN7111qpAby
	F9T/U9gNj5PHrYaPSGEbZkyoRG2eRIF5wPmH15w8MMXLlUZtCAeeC7yX8/PVj2q9b+fXCbw5KOA
	htoM4CjRQ94rOgoxFVsRB0ouKz29vIP7lMxfQz2SqDlqDLV+iz4Ie11vNZ4YsHy9u7pO3YKkEqo
	9xTndUXkm17fG2n/y9vE7GrvJrnPLDyMiskufiZhw4Qzvz9AqlTKCb7IpKgtklxHbnjwnYVdEYY
	1x6sVwaGRp6OLQ4WFsR2riFVww17wbzfFbPGBZsnzbCCxo8PdTF/yJVIq87I5cdwbp51r6GZyl4
	0HrFaAj4YM8xHjkgK9OuAWVvBIAoU=
X-Received: by 2002:a05:6102:4e:b0:617:9372:dd24 with SMTP id ada2fe7eead31-6179372e22amr15468853137.20.1777293999109;
        Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4e:b0:617:9372:dd24 with SMTP id ada2fe7eead31-6179372e22amr15468817137.20.1777293998705;
        Mon, 27 Apr 2026 05:46:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:29 +0200
Subject: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4uBhE3WMSTbQGhxdUZBo5XXM24uwXVUE
X-Proofpoint-ORIG-GUID: 4uBhE3WMSTbQGhxdUZBo5XXM24uwXVUE
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef5aaf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yohlUIewGNSudplHeboA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzMyBTYWx0ZWRfX1IY1K4iE2/SB
 d8Y2hhmxZ1xkAXPbL3zj89kqNmQPoyarzirG2uMAk4Ia3g5w+0WaYT3/l9kYZeDvFEFlAAjaxgW
 WeyDlylFA423ZjOlg7Y2TRCXNgskB9ObuwyFeCi9P2B8f7I0dCcTR0ZplQ4Qh3+cixMT8UMvA5N
 n1gNY9myf2ZjM8QFS/yJy3Ky70WR6TW3bazTLsfqtjurqrJKdaWAG/3LIrVP90ltyMEMsNX/rpm
 VQI2hGAU76scxUWJbxpQgpI6vEGc+yCFjV4NN2nH0asDaSbu4uJHnG92YjXBx9Rq9innCbNUiR/
 3Y0IitqU98c88VT4JsZrncjfD0RUncYKaHFEAp41fvQXND+f5guFWCnR8+aeZDDGn/kY72v/qC5
 U37c+kZ4ZoBI2wtF4G6ltw9dXBuEt4v+EcQ4Cmc38Sa4faPoPiugRISeW2g6+mZtuS6M60zKj8R
 Mgxy62DC8JoCIdl6UQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270133

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
these clocks are automatically enabled whenever a child node becomes
active.

This avoids the need for each subdevice to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, OPE, and other
CAMSS blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 54 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  6 ++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8f2b1d3cd9f289895aa439443d2a18bb036fccde..ca68ad7fc9ff30eae23d3baf34cf1ca642acf9d7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -4593,6 +4594,49 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0].name)
+		return 0;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i++) {
+		const struct camss_pm_clk *entry = &camss->res->pm_clks[i];
+		struct clk *clk;
+
+		clk = clk_get(dev, entry->name);
+		if (IS_ERR(clk)) {
+			dev_warn(dev, "failed to get pm_clk %s: %pe\n",
+				 entry->name, clk);
+			continue;
+		}
+
+		if (entry->rate) {
+			ret = clk_set_rate(clk, entry->rate);
+			if (ret)
+				dev_warn(dev, "failed to set rate for pm_clk %s: %d\n",
+					 entry->name, ret);
+		}
+
+		/* PM takes ownership of the clock, no explicit clk_put() is required. */
+		ret = pm_clk_add_clk(dev, clk);
+		if (ret) {
+			dev_warn(dev, "failed to add pm_clk %s: %d\n",
+				 entry->name, ret);
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -4677,6 +4721,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_of_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -4984,7 +5032,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -4994,6 +5042,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..bd5e572f0a0a7daa1668831b7d2fc60e0498200d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -100,9 +100,15 @@ enum icc_count {
 	ICC_SM8250_COUNT = 4,
 };
 
+struct camss_pm_clk {
+	const char *name;
+	unsigned long rate;	/* 0 = do not set rate */
+};
+
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	struct camss_pm_clk pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.34.1

