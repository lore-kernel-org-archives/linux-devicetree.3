Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B6847D46D
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363719; cv=none; b=attfdOSaG9L65lBJxEA30kBz/hIQIqUCtTd9Wt8VDCEIu7AN7wgWLc3DWl9xlKBnU1TNlk9AKSdKMwuqaFh0KonuNH1dw6cfs1l5vIxRLEy47Mij1CRUIo0tE+L6OX7DtPDMNCv2qBYJVQQxEOJ/ptgpceS3hN1waKuAOsNkUw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363719; c=relaxed/simple;
	bh=T8GaM/DWCcTwfgaKLNVN9FohEqx9SJOxt4Sb3BkyXS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VreJ3AwXSKWqgbLXc8eEM2ZR2TyAswhLAKBul8T//Lt4dofph15e0ip4Rtc04VOy+Di2DUBrNKz0zTp+POtO7y16HdrB5rjxnocB5dskxYXWF6WDHrnNKmRHBSgUh3QNfffSdLPjEmvWlvKfKaiTkHVfsCxZXcVCf30gEPpiq3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blrlk3rz reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blrlk3rz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jbhq1873507
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3s9eIt8PRE
	KTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=; b=blrlk3rzgF1XvmajNUV439Xx1RL
	FSZNlvvah4TZqNZvgGD9CfhGLqPwi0sfOABWYiCViXGJKU04+H8vhaYc7z8I5Ohc
	3UGcOP6X1XscXXldLQMO9ctCe3Ecnzp16hoYgmMSoenJHoFpXqBv0YiZX+4Z9tiK
	Bwa3m8foxS/JwpibQq8vPGz5Wi/0DkH37HUS0+H023FpX4IcgAxkL7zJW9OwHEIr
	AzXwJcSjUQNdfLJ0X0L7qXq8ZwnnTmljSxEOgoVvnS1JijvwWKZ+T44arqFGxQeJ
	dNI5DtIIh+ilNUCWz8NhMMw/3XLDRNFTXjWWVndWit1wjUxpDWw89QKhBMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rng4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:01:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso655191485a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363692; x=1791968492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3s9eIt8PREKTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=;
        b=IX8/ckw5cTtvTfe3hpwmHOKFcmZqAEuNfG6oXsXxEl13ykiFfarQGgEVN4ki0qowv6
         NOhk1JfWMCcBcfUB7c9KrdPu4zu3cqeyFWxTV9IPaePVsZIyU7SDR+ZaIXljUtuneHAx
         jVzYdN3VEtV2QKPaPVwxj3hAZUAyHz24VaXZUbYfvm4y0bO67SeGB+XHMHFndDzUgg5t
         GuEingmPuOvR+olJo6NWuMsPsMY5wJz+LNjHWIjydfA/aSoPH+kis57j5g+ZwAlAPWxP
         8pyG1Qikt9PB+D5S1dFBUoPq+yYfeOFdWOArFkOafFNr/n4QbQYUkrPUKK5t67/E58O3
         LF8g==
X-Forwarded-Encrypted: i=1; AKwUvBxFMMcUftPv2BlKiDRvv47QgupMap++hov+7i7ZJAnZUb01d606AbNMYcl+f38WHlSqL8KS4qsf398T@vger.kernel.org
X-Gm-Message-State: AFuF++kLju/ieV2SCcjqbqYnO8b69p0o454geLriZSKtwAFvSE4RjjAb
	If+sIhCa9iGiI4fKIBhCvzxaYIp+NxjaFhQE5FN6OWw/mc+yBUrM/QTAF7ieBdG9INX7828v1dW
	tD42Nd8TlkyUYBTh1JZq3QCPwsOsxlaA5VLjBvujYaPSEuqSLgxtCufpNL/MvK28E
X-Gm-Gg: AYBFou3N+Iz5Q1LDyKcbs3DTxB9IADXtzCUIVJY++td6YrGwWfxY9Pw/2zjcSgAmfBC
	u2ol+ZmQT3fBODffpxcBlmpw9QsopI2A//Hj4eUk777E9/HH9WlWBBlcdDMdSVznlTvUJjnl17g
	nRrje+XAs77X0MbkB0aw4U+Jc1XwStJ+AVe5LywnZoxmkyX2p6dFi8SpIe4Vb02c9n9UiloE2cN
	vNNyV8NEmRv3V3VYzlPlvffAEZdMG6K++lD8joUdFb3V88RHT1uvy1yNk1xSaKTVej44EkdaqH8
	Xh3BdqGOWV0j+w+Uwr/Lb3MUbmrHmjYFHzrtuFJPr7XnTiK5JelMlZHbjI8=
X-Received: by 2002:a05:620a:d93:b0:93e:787e:bd72 with SMTP id af79cd13be357-93e8610e5damr1003528185a.35.1791363691687;
        Wed, 07 Oct 2026 02:01:31 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:93e:787e:bd72 with SMTP id af79cd13be357-93e8610e5damr1003522685a.35.1791363691199;
        Wed, 07 Oct 2026 02:01:31 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:30 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 12/45] media: qcom: camss: formats: add pixel format lookup helpers
Date: Wed,  7 Oct 2026 12:00:08 +0300
Message-Id: <20261007090041.3732717-13-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7YfhbafvSIYk
 cU4KiZIV5Tdgy9h4Sjs5tAI+AhizLn1dtTYT5TVo00ycUnfnVKP8ZhO8+29A46E9bXndryg41up
 mzJ1+dNyc1CmyLpNUAE4hx7HvnW9DGk=
X-Proofpoint-ORIG-GUID: myqgxusTlVCetWpZa0w1w_IfpvewN9Lb
X-Proofpoint-GUID: myqgxusTlVCetWpZa0w1w_IfpvewN9Lb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5tEUT2hV6v1V
 pauGWwbzerkV5vobHthZpt1ZD+2OoV2h2FFD41Q+S5wucnR3q2/9+1LxVmP+tNjg+POBT7q3BeX
 mAOB/ZfIaX0cFj944QVpYURuQGyr/WZnYhbuB3wf6b6qobtvsNRsAlsAUSa3PJ4k/GtoZlIhue4
 lK4fy5gn0in+jkmQNuUsulqBNJkgdMqvmFoPemb05Uz+k3emn/2f2VKA2JkFLXWZ/kjRjURoMu4
 HhJUmOplPvXgT4xI0sd0494J7HHsMKgrbJKk+ftclVY8gGRJKIxad7mU+PqTUN19hC6165NWivj
 czHch8MtyV733sbzyzPM9H/FCEC3kH456zEEwWfdIS5Bp44jJ7SFtuiDI2MYMBJ2HxRxPSL/Alb
 EsKLjHmMvued1xNFsOiUFibXDlCffBoTKE3qjzkd9YDxF1d2hHA0n/yrHcRoI5Y0zZ2f69H9x7p
 /3LVEdbZx/obP3ieY5A==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60a6c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=q9B_VXwnRp6pzYBZdsAA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add helpers to find a memory pixel format for a media bus code and to
calculate the stored depth of a V4L2 pixel format plane. IFE format and
performance setup require both lookups.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-format.c  | 31 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  3 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
index 52cb01306ee0..147287e7f033 100644
--- a/drivers/media/platform/qcom/camss/camss-format.c
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -12,6 +12,8 @@
 #include <linux/errno.h>
 #include <linux/lcm.h>
 
+#include <media/v4l2-common.h>
+
 #include "camss-format.h"
 
 /*
@@ -103,3 +105,32 @@ int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_forma
 
 	return -EINVAL;
 }
+
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats)
+{
+	unsigned int i;
+
+	for (i = 0; i < nformats; i++) {
+		if (formats[i].code == code && formats[i].pixelformat)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel)
+{
+	const struct v4l2_format_info *info;
+
+	info = v4l2_format_info(pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (plane >= info->comp_planes || !info->bpp_div[plane])
+		return -EINVAL;
+
+	*bits_per_pixel = BITS_PER_BYTE * info->bpp[plane] / info->bpp_div[plane];
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index 4f87ac8c4975..f1af2d3a2c54 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -59,5 +59,8 @@ unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);
 u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
 int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
 			     unsigned int nformats);
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats);
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel);
 
 #endif /* __CAMSS_FORMAT_H__ */
-- 
2.34.1

