Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C9946AEFC
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648090; cv=none; b=apzWfEeFD1tNVu+wCw8qbB8NChzkbo9uOHnFA+ISZj91azrFasrKVbSaeF+FS/qiCqD1q90DojFd0CBLdX84Woxn4ZKb01auaxa6hGKfBl+ZIhjhUoYCobsEh0GxDN8sY/5zXZYnTGnUQ3K+HlpD2wiKU9zYwAa0k6YmYiTB2IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648090; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9WRyAAf7RG70DphiO0cWYKgatyjND75Ma6/qa3H3+JhIq0OzqGVKH3On6MNj0qT5wdqbal9BKTU3wynPfUrYkxOHUbbbJO73X5KO+S5MIWzwfzryScnc3rHJyuOFUJymyUo5WoN04TfC7ZiYbCeY0SmuK9V/DgouXSkiPHPU9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0Uzha9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wq3X5+o6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0Uzha9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wq3X5+o6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPiOM381905
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=R0Uzha9/vgKV7ivq
	v0xrQYGxks2tZH7LDHYAavq390OObotO9tImU5TYniSkj4VXhM3yjUcMlwsqEoRE
	jmiEkZyPoivDU0veoFClMDOenHWJBIotTGRfQAxp6yxyDKEps9Q6ojj1uf5Ne5tc
	SyaKbElMBZbdM53Yuj+K5v1+BI2ibvfLmbSRQdiT6KWBYR/b6is3O4ulrglC9rel
	iB/UQP2P7lQgIrOdKY2u/zCLVqZUIaC5MPgHUuTMolz0HUSIFDDqfDpOLke5+HBz
	W+sA9hnvTUumV4lXtnRaLLK+IwY3OshYqXsQ6bOllfAAM3l0WL6oCtmD3Xb12/lK
	g3JFmQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4e9856-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso1259851c88.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648088; x=1792252888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=Wq3X5+o6bY7ZNwg3p7naqUPtbcSOKa6pNhFltO8MfOOfH0tmj9tA+j8jpaQMpenO6q
         auDoDQ7NWxdyN0mJk3xLj+sjRrx74JLvqXcjo8lvRJyJXYnYPxCzQUgl6O2YurKHjHyR
         OKvNbOpPVPiGFBtZW8jXEY/zdXhgAKXvgv14c+QpBov4ygtGCzVSsOqTCUIqNMCiHR8j
         uSqF/X5hy3PaQCrs6ntyXhrrtMmsrYiNG+ldGlEr7x94+8p9QHp/4TWGMsD3ZA5zMhQM
         G4x5Ti9j8fx0cXMBH++Ecscfo6550BdySEnpRckvmi1g7C1pd/NaIejyq89TpmWTARW6
         pEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648088; x=1792252888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=ZtxJkHZlVusU9ZSeUDmDfof6oPnIMeuTjLeQof1Y8Gs6xppmRhEyjn0IjSyC1GDp7J
         hWpQ5qpYqkOgM+gspoUU7dZMvZYFxC9FwCzDe3HgvVu/mnE3e7zLuqGtxdyw6W7cpe1l
         BYFYMIcRYds7w1MdA5nXS7OeGvjDx/FgzUpXaEJsBtjtoj25/9uA3Cvr72uO4kIfjzDy
         BjnKLrKAHJpQt0U7+yKop0dSVhAhHTv/S7CfEGBky2HH6bo3I11Yt48j/is7hWj1osHo
         jCjTI1aWxznUlrgA1F2HwGQIgNhlTvbxrsXByeRe5JcGsKb1QBG4qyvcqOfStRiLWufY
         rm8w==
X-Forwarded-Encrypted: i=1; AKwUvBwWLRnjkvJlxJQ2eYE1NH4MU6GjKXq7ecI6JXzADj0EQ2XFg9W4DPItUkSecEjTGaRL9Uy2l+AsUL/6@vger.kernel.org
X-Gm-Message-State: AFq9FYLYdqGogoW67Hye9ufnMR+myxJkIgmrVm7pSIhw6FN7/6dwQhSL
	vpAn5ygvKInr0hxAKF+INMnoJ6RjEtaHztjN/vuW3R77YZFD1nf9MnyU8fy0GcG6Mqe6f8UOYL5
	HABYNaw99sWg0dbER9hRzLBRo1GWZK7I8sBFWCMeYhdqWzHsCe2X+Bj/kVKOxa3xmxPMe1D/UIE
	w=
X-Gm-Gg: AYBFou1w0iNMjHd7QzQlaOTIu5tykzlqWMP9Di9eMj8EBvK2LRbMm5oSViyVZNJjFI3
	wtcOhIwhIL2vR+WF4BLdHXd3PW/CTvnw05ts6gr/CpWPwEBL2Lt/VKjo6MbES8mgRW5v7tyTMF1
	09WSeapC00dNGLNN50H1AXGdWJUtNopif+8huJivNauPLb7hvxBupYuwEKEj5WHQjHXh92SBLJq
	OjWPiM3cPW9dRgMB79SjFQ2pMlyVgU4ICwg17kafP0fexpFkYQX2tyYxZbumFbRa/CIkGWKv+jY
	tk/Y5LZU4DzpsjijPEU/2mEO13/MyzUAse23tgn48QrtvWmJPdPU6bboFD0Lidg9AcN+WUgQesj
	WpAH3fY0W1upS0L5SeaddOfO5o/CTP5ni4W3BRBCp111vLWbCwrnFgloFpYqqvQCtVGGSrIDX09
	GsPZLskAE5BA==
X-Received: by 2002:a05:7022:150e:b0:163:bee9:b250 with SMTP id a92af1059eb24-16a5ef287c9mr7218628c88.22.1791648087507;
        Sat, 10 Oct 2026 09:01:27 -0700 (PDT)
X-Received: by 2002:a05:7022:150e:b0:163:bee9:b250 with SMTP id a92af1059eb24-16a5ef287c9mr7218506c88.22.1791648086344;
        Sat, 10 Oct 2026 09:01:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:10 -0700
Subject: [PATCH v20 05/13] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-5-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX185hQX/26JJ5
 i5cgyKiFLCEU7rsEtAZuc/MbDPz8Hqv6CuQaqbJRtZ+7ctWluUnpZ/+gxEZtCrm5wTMJUbvtDDf
 nCd65TdJ5YqyvbalzI/yp+nmrWAASeWidCEIsOeStNqgvv6nOji34inY2hJT0hA546uaIviEw4y
 LfuY0RlWpRPu7s724BBY1A2SiELn3vS/TXtbhrmlmMVXb1JXpmCK9yTwWN8RizsT4PPJPz+K9jl
 W3NEiEBcJF6+WbMDL4YvgxUPVgudzbqqtAV2Ap7hAUw925N8vTTASFtk0tGzatcSz2FsgprNs4Z
 2RjYAd/bGoDabxvcRpZN/wf/0eWnvFVC6Q3n/fTXRuMzCEzZ+bQHKRJ/eUuddiRgwEOO1COE9iI
 iI9ij3G9LR50RlVKI0MgOUa9DXAdZbpynpy+q5HfxS2FGO+eCbLB3g27JXWevr6bLhpQYk2OHX5
 uuRCWroX+1KBFc7S80Q==
X-Proofpoint-ORIG-GUID: MiMFOPaKX0WRLjBpaq-nniArwAMCDcHw
X-Proofpoint-GUID: MiMFOPaKX0WRLjBpaq-nniArwAMCDcHw
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6aca6158 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXxomKV2gdJPbI
 9Xaw4pSQzVIQl7jbfksPLTvkehdcQFtDkUvN21Px9WZqkVy8YFHhpLAfOBRAfx322BSDm8+MEHs
 /Pb2RtMFBIc6QjF8ewHMwg9W4eUVlGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..fca3de214a92 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5810,6 +5831,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..0551211f7948 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

