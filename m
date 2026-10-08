Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBB138333A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424270; cv=none; b=K7YdHubiTV89K6mYQvjD/HaZNEsNc8USALm1eHTae4gZ4VODDC/9CFwJb27tjBgPLSYFJW9H+GQJpI/St9EvZAqTmqm9eDFBzGONBeegJylayyiInbFvUfZyKkHBP17+4xbgR4xNVV6NrvMxVZSvafYSEx7rexy/ul12K77aTh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424270; c=relaxed/simple;
	bh=HwlQ2Ae/9Q3MrPiMkpLKAOXBnuOZJb2psTbO3xR13eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjVqNkyUo5/IXYB7MzCGZcuPpKjdMVZIQXavd/truVvJS7ay975gz9L7fLTxjAQ4k0xLr4amIrViUfnBL6ZXIPkslnWaSYmFdK4WZ9/GdZYbV14vn8UGNOtEROMw0dxxZNzXNi58AbkNJSi4doiimbsPWNlXoPlxB9VWJSJaNp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OB8xtZ7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iikQP8hY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OB8xtZ7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iikQP8hY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hUVv1950152
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 01:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1DBGEvXjym/
	vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=; b=OB8xtZ7YejfTzMOJh+sDy1+BK/y
	W3KwDIkbGLcvHhrW9kg3FYcTqLip59ZG8ZMBVyIk3+P+VfVuWa86fkh99H4vAUx/
	DVL4tqalcVbthzve5yVeDX4lK4URGrSY+KCRNuVRujosLJghs5RxPzoUrUSICb8g
	SaHDjOEKWhy7TCCS2LnW2Mvgnzse1L9vSGf3NMrsrcHMjIH17fYF1aF5VSdZY0Jr
	MruqiQgq4A7rqbwksmJIxzK4/1c0kaRf7/tjr7DIhXvh3GK2iEnrSWjgx5h8dv8Y
	F1pbLOhJyJswgw9EGLCExAg99NIADZxh9bjf3TS3pj6/fQkuaElwpNNtrgg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe40na3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:51:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so8804240eec.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 18:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424267; x=1792029067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DBGEvXjym/vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=;
        b=iikQP8hYT5OG+gwrO8/wLL3YyLZ8OtXW3YnLd9jGDN2MRUrhR4tZO/97rFDP767dc3
         6Sf20ERVZeCS6kDCb0QxlnnWKZ5e8T5buFofYlYn7Cg09FQ9pY7xT7Psell1caWHO5jo
         5P5NAgl41X3GHvph9sIowKIOeKnSZUeZy47bGivzjnAwSSW+xDjNMNOUyRM+9vx8bzIx
         fHR8kOurvEXc08Jgdjp5eVP5oHLfdgqWhN60Twmh+QkfYmnOvEnmlk0+ZM+I/b0MRWmA
         44gi+0wIPrds2NCi0QB7l1/+JTCuANsLrWPMFs7W9arFcmE2BOpCSCiQVITJqBfg/iwI
         vK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424267; x=1792029067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DBGEvXjym/vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=;
        b=Lkm0MXBzNb9mItcdxUcw4FNgSoScZa/mPOcXMJi+7/9O8m35xkkoMJvF4oB6b7352i
         HK4sgY+f1MyrmYgnym+OOfBbuNuYQfb9Kd7uyKsM8FLzPwvL0roPRkprxxiPskm20UE0
         DYIELJs9A1VQ4IwkoCAVEsg2HCQr/1sL0+a8N+5wKHldkD88ZF/RUlkdNOEUiEIXNo5C
         wBCiD/oB9oB5ZHiTqimEwsZb61hU0Lp3d10tvXWOmZxN935TQMDa28yEBGzR6tPby2TF
         nPlcKAuSZilO43rnwH2CvxVPBUGCm9mZSNf/MMm0eMTm0/0l4tVX6vg0J4nwGrPDGKHV
         qveA==
X-Forwarded-Encrypted: i=1; AKwUvBxrgAAgkXd7H+TZIJjsCMJP8SQU1YaExPj0P8yDWwu+urH77X3ZGPEUH15XHcNiwJemJW0P7nQJhuBh@vger.kernel.org
X-Gm-Message-State: AFq9FYKyoNigBKY49O0HUt2OSrHiFV1vVlhrm6T+4Ln8V4+XKVHx8yUU
	J37v0uE9DQGFzuSXZdkdJCSUGQra//9gHErcPLs+A8EbJ5Km3Z5i4epILI+UNh/IUObtBFh9P8u
	ahzEaZ8GgN+FpvEaVM69+JpcgvoGXXiuDm4JTZ+XFTISZWiG5tzr1Y0hKAn7L5jJ5
X-Gm-Gg: AYBFou097X399DJJi4TfFGBaw1vDexcgDlOf1xL60SDCyvZUrFO9RZhxYsmUCP1oMBv
	pppOV9cokPnQLcbxZhpGcA+tY3zegZp51MqNY58IWlBZFr7AEgmSsxDYwwODbt+f/udWX5SYY7S
	TcYKz/DrqM25zJoykPqgbbpasXSwjUK3YazbRrWbLhsfvFbPcRXbCW1QQVR2Ldtz4Itva2Ql1pw
	e2zRAPckOd53j7uInGywKHJmC7o2AlpMQ2q8+20nw5Ua8ArwXNG6o8LANL5WJy1BYg1QbJDuhHt
	OqGIKUIG+9VZSubpn5Bg60Yunw7iWgi3ZaIwEybmhPOw5t0PNYBzN0gdnWqLi+v/tHkxEfoNJbz
	5+6SYpxqmAHahTioAkl02qAnNYkJBBVPV7wSOJgES8HefMLcY2Zg2pKKlKzo=
X-Received: by 2002:a05:693c:894b:10b0:351:3115:c733 with SMTP id 5a478bee46e88-3515ddaa3abmr4700853eec.22.1791424266643;
        Wed, 07 Oct 2026 18:51:06 -0700 (PDT)
X-Received: by 2002:a05:693c:894b:10b0:351:3115:c733 with SMTP id 5a478bee46e88-3515ddaa3abmr4700816eec.22.1791424265898;
        Wed, 07 Oct 2026 18:51:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:51:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord
Date: Thu,  8 Oct 2026 09:50:17 +0800
Message-ID: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: thfRQW5J_lSlgmAXH30ODGS1-JAB5liU
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac6f70b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-9G34wqzeZZRMG-dpk0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX4BzpFrP10S5D
 MCcLU/AVtp8Tqq96g51qG0Mq7XPUiZrg0USOG9RTNvj65nNKzTPSVh20VitDw/Z4agHcwz1iVdc
 NZO4GBHMwmnDjSkUo4TwITUDTq0O1ss=
X-Proofpoint-ORIG-GUID: thfRQW5J_lSlgmAXH30ODGS1-JAB5liU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX+dsE3xtk892f
 zKeXZCFnVEe0r+dSHPdPRPFjXB9rw4IxhyJiV39CQAgjOkieBchLjlNL+Ot2Z8hXwYHj0pdSBZC
 IgdPg220FspuzsHUcYj8TA3HW/VkIrhvy8AprQNY/8SvW94StlYaNFHhr9W00VuaVL3ymvT9xFB
 IzNGL8qLVJL1bZOj7AAdNd0Xo0it4WQU5A8A8/PFXFZvO8QIsUgKFq9T1UxKMlZATwC/fvBg1fc
 4VZXgpg1dThTs0zPNKtMnHt1DWz6X66uMvde4ReYX5iFIIwc/v4JokVQJiLpIot/OIAJdZk3zT3
 wzus/xKZ5BsqT/D8+2JuK09Z6DODxV0hmdTykXtAK8NHSoTwW71Afkti93TtKg0apbmq5BPGIBB
 tnmqwV6UugtXyoMQ0acmYnotVArOT4EGujsSVwb72+Pa2EwwDbVwETjSBisromjz84KBuAsUcEj
 LQ7RSaoGcDL0D2vYH8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
fallback, which only requests the "ref" clock, so the bridge clock is
never enabled by the PHY. When nothing else holds it, e.g. on boards
where only the USB20-only controller is in use, clk_disable_unused()
gates the bridge and PHY init accesses go nowhere:

  xhci-hcd xhci-hcd.2.auto: can't setup: -110

Add Nord-specific match data that requests both "ref" and "bus" clocks,
reusing the existing Qualcomm init sequence. The bus clock is enabled
and disabled together with the ref clock in phy init/exit.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index af4fa17ac6cb..8429599f428b 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -452,6 +452,16 @@ static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
+static const char * const nord_eusb2_hsphy_clock_names[] = {
+	"ref", "bus",
+};
+
+static const struct snps_eusb2_phy_drvdata nord_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names	= nord_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(nord_eusb2_hsphy_clock_names),
+};
+
 static int snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -608,6 +618,9 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
+		.compatible = "qcom,nord-snps-eusb2-phy",
+		.data = &nord_snps_eusb2_phy,
+	}, {
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
 	}, {
-- 
2.43.0

