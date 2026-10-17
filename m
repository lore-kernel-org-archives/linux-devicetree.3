Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB237BE64
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209148; cv=none; b=L4UWGu5A7eVjTQt1rE3Sxgyj8lNvlEa7qKpYQvUw4q2Vi5BT8piEdKZzZkhV0B6D4U2nEgMZkMDd0LFY+2PQ5gdGx7mD4EemCRV2Hb6hPzLI0/oymGryw2oLXAd3AXWcNwNHjh8uIoyVDlNPFk5ltfnwf3f2gJILuueoy87U2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209148; c=relaxed/simple;
	bh=zRm2u4LEYc0gtNFHizlm4NMKGlWn+oPcvAHoerFBkWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MCKLtxxTsotze7fEDuRgQ5/r7TAuF8YK5P2dFsnhCn3z6UxdMN22SVlIT63ubdy68JpUtHJEfIvEIo6xDJ3kSwnF16qf8ub6vgt4qiMR7o2CCuvkcpoWa+DaWoo1GDZJN54WI2wAII0oSaIKAXfKCVi62iWkTKIZq+wSWqiiSv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRse4Mls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iS4qyRKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRse4Mls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iS4qyRKA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30b5p1010852
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VLDH4uYDOB5
	s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=; b=TRse4MlsgtHfh3tdYuNlJttb2PO
	eAO8rgj+9+84/UPRIQ5jOo+U7IAVkeo/d7/ZPs/Uic1ZGG4fJXxSJTyzzoAyiSPT
	O3PBx1AKQ1oLz0Cc20PnNNii7prwDQhi75pVRrlSK3qn9rKk6BW60L1ETtPi7LdU
	cRo7f8CMVKRFnKXsLlV5/zUcKz/QTZpCqa/p+UcfsH7LEur8ue1hw0v16NAzVAzA
	S0r3T1BohEoQ7j9QFt0YdFxYLy2RwD3oFEupsUDwbUgNOlCRbMNFL1fzVSbSIoMD
	h6NLnW3rR6dZG0EaLVLbvB3SIx6v5o7UJ0dQ2Hn0wZyT0jbiAzkMjvSp04w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfrbaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso848575eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209146; x=1792813946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=iS4qyRKAiFg0KbsE7rePVui5qbfWrR++GpmsPUI6ipNuhxkr3gl1glJ4FpwDrZ+9eY
         gH0ie49J/yCHLhWtiIJoMuf1YwYiTpOKj4GqnUzkuj8w69GiRkpYbcPEzTLqEBNypCcD
         PUUrLhKCiKhd3hvqw/kOtgMJ8MOcMEa0iUMEBVTN17S0fswP1odSC2Jmxzy3m+hzFtjZ
         w/vSQiKTj0yB75XyO3i3AgpMRkvDtwRHBoUu5TbJzasE8FJbRH6hY6JmPP2NFzgqggxo
         jaP8sugqmnGVB9aHKVNpr9+tSu2tf90BbcmLkOPAE8l4wF8rl1r7/b2NC3AWHxv9iACb
         tYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209146; x=1792813946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=ZSmFp+sx/17DvXIltqSRStj6F2UQ3I406uYPKBiD0LvW8qQaDR+tby9Wb2IKFcTf6o
         gD5uaakDD5zzN7jeWJulnFYEz61yVww/sxl9sAQvaaTrhi6MH6l3K4f5glF0XOmtIqz0
         By9wLJBUCOyeQczHUbUvOlspdNkiGl8wtA6QTe9gk8Tca01Y93dSaIPsmbMs2qmG0x2v
         nQWjDu+z6XOYKgJktRDLG1gomJra3tlPPtRbOmLBH/NbYyyC8U8PdyIyn3CO9fTn643V
         TVAr7oaXTxRCTnqihRVY0stGs52sIWVEt4VCVC9ntZpy2jjPqm6r/jpIK2rilqiUiK6a
         O+/w==
X-Forwarded-Encrypted: i=1; AKwUvBxLd+itacRbWsNHlR08Cq02lopg/P3Cic3cJVLgaWzYD6FJ0UOawBSTXoT8+8LcHUcQEitkeDuJ7cRq@vger.kernel.org
X-Gm-Message-State: AFq9FYIDfLYJLFzXG94JzvI0kdD79isSoSDICiMQ8Gy0VvmjWDVpl9NL
	oKox4x3Q+bJjU4IrO3kEw/yYiWGVMTrOHHfwBPT6wkQrqMZdt3NKxsrLl7UCsRQJCgNMJRzNrUr
	tGOYxYLruZfra2euAPJaEZWwZ8gMVRtQdyHXQ94sebejWKmWYMHe+D9+eGgwwbiiv
X-Gm-Gg: AYBFou1KemmHni+ILZTvXA0sEP3/K3PDDpVI/XQ6otEfFaF8ImSLbu80N5IifPzwCA8
	TJYznLleOjqUqUJyoxIfs1/ZezPArtPUH9FeCHombS/6+dfNG8lFkEWpwb7SNH8mHP4mrqVNUhU
	Fpspa5iBudEmMY4pJMpo9mPwYvJsPcfTH/wm0WA+u96A0q1v9Lf4vwJSzooeBT05XavpPdatkEH
	7t1/u38jyymdl96B3idizxs+QIiJIhDod96OYtYoPo4dOUKU5W2+q10tL1o9NGARwROXx7DLU0s
	NocKkBnnN8U6z0WwM7KOhcEHqV5nTG5YWHv8EOwWM0TbXrtmJcxw1+50tuO0Pw9rLB4WVkxH1wS
	yUKSti8zymdTeCwXjkdpia33ipU50DhTmqEKDz4VURR8nyax22QhAaA==
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584962c88.45.1792209145753;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584907c88.45.1792209145028;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 1/2] media: qcom: camss: csiphy: record PHY type from device-tree bus-type
Date: Fri, 16 Oct 2026 20:52:20 -0700
Message-Id: <20261017035221.3816464-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX23wzkoLQ2863
 UJrjYaCdEpS5W2WbbdsQranmiq7Lb9ZearB5LSkvx7x6U5KLMJR5KwBsfKHaY3URU/DTsI/PlVQ
 YwxwNIJRGC11dwqEzJwzL7a16wfq+EA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfXyFer/6mhOMBI
 YfuOR8DPrEWdpFgEO7uO2Drps5hg6zoRAmDF7J5MKDaUZx9Ril1QuvVqxdtUAZA8KkN0k2vDwzy
 mnZqQAHuPlv1XzxlLjNYqIaRf5Qos1DN69jTEfjEAVWnZKZb1S8/EVhqsRIxPl7GWXMjF0U9yMO
 mWgu8JfhnvJVqrP7tn2PGEb+X3MSbxEQbqijM8EDOf51tn7PzBP5RT8MWbRLNNsF0XWnL2Xbzj/
 XJda3FASI6LMDxLlAwALZRBlWn5aDujbCBsld764do6xX9/rFXcvh1pOftCDmGeYy2uZqSyylwa
 rK2zcJggxlUNDjHLlDGVwNMu+KuL2jX4hopVQtzMwZAx5c5IaButVozjcIhkQegWJAiOMSMWd0m
 r6LpVoU/oW/hdmrHqF1jOpsu4aZhuW4pa/USCL2idyp1F8oTVDiJ2g8o3GSHzyMuoLCAOkxG0AR
 9ePFYIdqWXHmUVHdYjw==
X-Proofpoint-ORIG-GUID: PPenjUaA6Et4fFk7zb2PJAnf9TlSICNi
X-Proofpoint-GUID: PPenjUaA6Et4fFk7zb2PJAnf9TlSICNi
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad2f0fa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=CkjXbxflZYdHZoY9ubYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170015

The CSIPHY lane configuration only tracked D-PHY, and
camss_parse_endpoint_node() rejected any endpoint whose bus-type was
not V4L2_MBUS_CSI2_DPHY. To support C-PHY sensors, record the PHY type
(D-PHY or C-PHY) parsed from the device-tree endpoint bus-type into
struct csiphy_lanes_cfg, and accept C-PHY endpoints.

This is consumed by subsequent patches that adjust the link-frequency
calculation and PHY configuration for C-PHY operation. No functional
change for D-PHY: phy_cfg is set to V4L2_MBUS_CSI2_DPHY and existing
behaviour is retained.

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 8c3319f2ca1c..fff504d2d489 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -35,11 +35,13 @@ struct csiphy_lane {
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
+ * @phy_cfg:  PHY type in use (D-PHY or C-PHY)
  */
 struct csiphy_lanes_cfg {
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
+	enum v4l2_mbus_type phy_cfg;
 };
 
 struct csiphy_csi2_cfg {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 07f7bed9591d..c888e78256b3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4756,10 +4756,12 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return ret;
 
 	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
+	 * Most SoCs support both D-PHY and C-PHY standards. Record the PHY type
+	 * in use so that later stages (link-frequency calculation and PHY
+	 * configuration) can account for the encoding differences between them.
 	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
@@ -4767,6 +4769,7 @@ static int camss_parse_endpoint_node(struct device *dev,
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
+	lncfg->phy_cfg = vep.bus_type;
 	lncfg->clk.pos = mipi_csi2->clock_lane;
 	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
-- 
2.34.1

