Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345C93B637E
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768991; cv=none; b=FRWvTPkHGlaiOe3KRvKZdcKXQaCgVcn7XY2LnOoQUd4lX81lDfFBUxE4llnqqzu5No/H2L29BE23mMNET6RkhtjiPCVLfkzSs7T0avhahQoqXvK7C80lIOzK/6tNq8W/F9K85S/j7ymkFahd11erV9LmQFp58P//mm3cI/lzSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768991; c=relaxed/simple;
	bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kR0Kr7BWbWYnBYBXnuNVxSGQllHat1048sBQ4pgtBTAO6Vqan/Cw9Oqtn7WkCTBAjVl8YAPzgbDa8ArS/vbHE1QkNBJsz7AlibcABFWijXY4Gd0lfFeDb60HZHhHvcevUcGXuQ4Cz4MfwlyMKik5nXjycZ8FsFh+Fu/T91dL/DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frT6FFwt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQZwZkuu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frT6FFwt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQZwZkuu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6ePOI3574145
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=frT6FFwtwRq2fagi
	yCMCsmR1P1rleRvNY6MMcT51/wjQxDgyS2GEV2R4dxDtvTc2tQ0eEymz50l2Pjlc
	jTtxy2v4AaW4wUgZZogfkLZl4PPL5B+ERPZG9/RLPgVsIOQxJVeaf/YDTE4ZAsPc
	kGgl6RsngDvapEWPrJglv/fVaAuxNyIjdIJ3KZVcDMqklzPRH0/VpYPJMjU+NcqR
	547SujVR57i8YnwdnGwQw+ZpbOPUgehwDLh6eQk0eE2RQtNZozKrR+0CHq7ruqj9
	F7D0N4w/EoXaHjYrci6mE3bg/KoHR+6nPnh2HnqN36PNUpA0/ZINLg0m9bWxK0in
	wKdeag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gxqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so2300974b3a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768988; x=1777373788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=MQZwZkuuOCA5n5t0w5wrmsv7Tbd/62+6VskjC+vDkXqL+o5+NXezUDe3T9YyMUUx4K
         lpQZJ3ZscxfJaqfanXxRCskp60p0zGqXzOkX9CLLqlaeECMNQG3Hn1eWh336LgsSu2r3
         H9YXNjvcv1v/QM5oFZKovw/RcAtbgPsYoOHmB4FB1JmBuVtVrlBTDRHiJDEavYu1WsXG
         ha8SAT8pLNbqA27klI5VPWmXsUTFFhJyav/Giym8Necy4iKECNpm+jfBnRQ1qw9HLGAg
         q1A31fvs1oIC9fNg/F4787B/xwMZmUIs4aMa8xS7NCtHD85K8K1g8OWLU8un1NWt2pUO
         spjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768988; x=1777373788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=sbnF/isvVpD4VbzXDV2odQaRtCM6G/pH0yZt90nQDiDnFd5iEl969bC2nCV8DwZsQB
         MWsS+MBCdJAMSjZ8w0c/ERnyN+A/ZjiONSp0dfiSUNYX9ZQhTqhiEeYKaf/1V2Oo8mYb
         9NUJvghm2qGMbRmjMLVtCTITEl40hsqz+f9BZ+zBn/Ood+mAnePYtVAqTc6sIx4vKIvf
         ZMIeNlRt4CfKrYSdVXOjxvmNbdxARRF2igVreAW75HRnWcwyTCDx47h2Ac+JiEv1a8Y2
         jlyskRMP1yO8UswgmjyIWfftpJjCUbyR/qCH+rBC3BZu5kM1UlZparBoIRitx5mQLueS
         5Igg==
X-Forwarded-Encrypted: i=1; AFNElJ8woNeoz8Hm2Vd4uK4+bqgT0X2Cq2/4fikUTvdx7zamvqf6ph/EOBDzqcT5fAdiAlDUwilWaaJK3qyq@vger.kernel.org
X-Gm-Message-State: AOJu0YxFY0qx6XPWQL6Yqptw39s/83dSKAIK0JyNJK1a8FcGFiiS6hO6
	HPSeE28x6fL53w+WNi6ajd6/AUQNiiZ8LTCHR2iGNgEGoOjsgKcZym0mqmKAJ1euagvtTXF8EnX
	6/6BgH061vcN2h41hoLrly2Htq1vjQgIAYiYvi744aZHfMzmvDJlEHXp3K9vD+uq5
X-Gm-Gg: AeBDieuOmou7pXfHjUxpH8P/a5ffha+7pwdTYM1+kdDTezwMiapyCgA/E5QGkNoT4KU
	ilE3Csfwbx0aD999vgpEiSa0MdsyWUFRjuwXRu4SGT5CJ8FQx0GIORmw6yZ2WLOTmuf1Yk0RK2v
	KkZfOZU1+AfiH1+Vh4VSO/uy3GjzVUqDPKtrrqOYZT5zksy4jmkUxbnb2UKwruFx7zvmtZ0aW8i
	40eyLitilpplxQ9luGrLM3FWgTOmNAcWx+2TW+M056936UDkyiFQayOUtPNGyvTJkm3cJf3AdcQ
	LkHWcBgSJv5cgNDlegjk8EQlhAhdiTM6PIsaZyij/xLpGv15oqt341Rs8tlEKU1qsmvsPaAd4TZ
	dBgRVp10fs9Ok84Tic08mFX7wiObMCY+yiS/MqiwkbAdY1Qlu9WXni8i1tCWnxvjs+uouDaGb4j
	g7hSMzEJMueat36IoZX6w=
X-Received: by 2002:a05:6a00:4fcc:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-82f8b3861eemr14836823b3a.7.1776768988083;
        Tue, 21 Apr 2026 03:56:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fcc:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-82f8b3861eemr14836784b3a.7.1776768987579;
        Tue, 21 Apr 2026 03:56:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:50 +0800
Subject: [PATCH v17 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-1-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768975; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=jJqeS412XiAqfCTbtdzyLQXnfDg5+q8/Ah/2X7ff6xs2SFRDsFaqNUfSyRmR3sH54wGIc4VWS
 x30XByjBve6CxO257mPlnkzyESL2AiiP6g9qvFPG8SB41KM01M0g17l
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX76bPTbtL4NjF
 uOW55rBshixqOE4+jEPcgHehovcVp1ThMkYbvWvWxjCVa4WBf+Ex6a7TpFH9KIf1SJ5luwMKEgN
 docxEWnx5BPnd0YzVdOqq3FnU3ns2/FixFRV4ZaF6/60YiSipEuK4BbucT2uJPC6OHrpfLUVQca
 3BFyMjEcPRCeQXedqEdjwASlGahdc+qkT+hCvduIhsjSCKDmItgHw2AOnbCJU6rxFH3XsQkOc1L
 kTBpD+fdmAR0jOHei6Xjh88DdMETjgfb4L/mOE37xtL6V1yKRPS6ME1Kdh+LqRIneQPlwlWjl9G
 5yfUIV4tjrv/xQvzm/zkcrNalyk/wp58Ti0h9gJ7ZftvWUDCMAtPc8Z3eu2POTBf5RjATpy+icr
 zLuEOIi65VvRDUAb9Gcd9rW/hdPr34NVIhySemJxCcUAZ0+FJEtahn34XsL5mLh5Od5yEJJNRjp
 KMU4Dk9rc4F1QSwrvcw==
X-Proofpoint-ORIG-GUID: DHph0wR6J3wS82jfNgSRBVSDIgtFCntp
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e757dd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DHph0wR6J3wS82jfNgSRBVSDIgtFCntp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..221de57ca57b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

