Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007700;
	b=KQQcBCUWMt+yRFgRALPjnmK/1V5X6pWjsPwooeFaZ2j7O+pifcZ8BXWy5grWVNd00bSX
	 sOyL4ue6tLSr529zSLYxcWKrAgLbitdT///ERWm4XpTAu6XF0MdY8Y6QEkm7knnfKwq7z
	 qzGMByqMFZ4FyHgXL1+j4oHMMwCP69bRN3kdfzT3Xgg1OSEvoLzJepaCLsR+ngXBoMlCF
	 RBDsmP4vSmcOYG2afFsRicUmv8amtPSv0N28SlbcQq4V2iSUL/M0SIiR4KZ3MynDL3uKw
	 k/l3jxGfPGo46oCq4ORe0Wy0ayOHZWDKHBQ/sD0yFqphQy6xofwo3EIejxz4m0Uw+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e2IQWvxSbHdxQeKMF7CoJ3yfRIfqtVUDIDK0AXYWAAM=;
	b=yewihz35ksjKKw25gQdW2RGBuAL3hmJXTaBvlbdW+YTtnSDSVcHS0tcHDAv8YncpU4rn
	 lDia7flQuyGSpoCgARvb8jVaGk923gfzaaB0hf34hKmw4V1z1W+Msd4MRUgV9sqvDpwEA
	 hp3ScTPDWSpMv389tKEykGMyHFjZfUVVSHlwcML0u8Xs44XPHPa1Jm6+IqF5Uzq4u//aI
	 5f8ktkhTfYdGgWs6/ybrxpUDoTMSxwOJ0eyyzBjXit7VZYg/I0tTP8wMyoxdLGmZKh6Ab
	 NZeJw1U/iddn8X09gvAe2qr+hhFubjezH15aMZwcP/jqAukPlOj6LJHpRzZaZ0akA6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyTauFd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxjsw6Xl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384A060A2609
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 384A060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyTauFd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxjsw6Xl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bKTm2255639
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e2IQWvxSbHd
	xQeKMF7CoJ3yfRIfqtVUDIDK0AXYWAAM=; b=YFyTauFd4ci9DIvG3363HI0HwA5
	/DpqNlEEYi8+/dx3biWAyre8NFPOyW5XMhGlvvseTMQi6VMCXNS/EXNXkYXFdAJ1
	wxMRFuzOY/D088d5vYvlNr7NNn1XT3CvXky2/erZGNtIyWotS/7HcyRR/COGbxiT
	FrGWNVkrUOIr1J/vk/y1Yc0+aNr91Xjs8GZUHEqO++UVoJAf6Nvg1kb/BLIVk+Ek
	iCKXX+R22zp3B4HmSXwBNoC1nI0nJIRUimcGdcru9VSe7ChMWhQ5uzEV83AhjdBH
	T0W2ZuA4P11UlR1tMo2DGwEJ9aGrynZSWoNUNsAgYezm1lnVnEsZol4TLtQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nq88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adad90c894so3116205a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007698; x=1793612498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2IQWvxSbHdxQeKMF7CoJ3yfRIfqtVUDIDK0AXYWAAM=;
        b=jxjsw6XlKDbjKpt7O8TReoKf5x74ybr00fxxguDOHcOJxPAPRgUiXNd+d95MLfulDs
         B9FnpIkqvMagH59W/jaM+kcBaeMSzL6D11a2TuD8NGEPwWkFIpet1E5byDfQUlq3jOVd
         dDfw9HJdTAv4mb2mL/vW/bTZGOSWwQ79PGrbxqTCiuoFtB1grbeYP7oDfIsYI46kceSq
         A/1b8c+DdWGfQAn5LogksY+qg9qRiEah0uFv7hHE9+qUF4WDpiAXcJggfH/yv0uXjxQ1
         2HIXk/gNehz9ojYqNZOKCZhcfPmmVZCdA/L2joH33OS6TMD9agBDGsYrl6gJmQSU6u2S
         15cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007698; x=1793612498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2IQWvxSbHdxQeKMF7CoJ3yfRIfqtVUDIDK0AXYWAAM=;
        b=HD2+fU6/spR5oLbuiLM+jZ6OHzWN/lZGpW7fuMMxx9OYcyIcWxK4AlobbS7h2Xi58a
         622T6iF9LF/6qEAAAgnVxgVCsf0cJUVySzZlpkMPBQB1CWNaKwjPjRnwprqYgd+3rM1b
         2wHqQDc6/EJf3Ipol03Wd9E583OP2ZRTC9qIwzcsGUoz4EnlaoplUWezvsaIjyQ5WL7A
         Ur0dF52OGzK5yIsceigjVUEQxRJrNAl5Px6FHm915NMgGaFT3Ck6GkRcUKi/ipvdcneH
         dSxQ+hWuBx3OlLCti3WtjKb2/Fn9f27/zu22l8F+aDYYsLllp5lcK0DpAsxemF02MSJP
         Ffkg==
X-Forwarded-Encrypted: i=1; AKwUvBwHy3SFSJs4lttUVyHW9+b4oHmkEQgodX6MoYmcNGfjCZvjPWSv9T9fJY9aBHozHuzHS3CbW1QfdQ4D@vger.kernel.org
X-Gm-Message-State: AFq9FYKmvxFY3Q8wxnGhCsJk6DelMQ3j3pLRUFwLOmn/Bkv9MnwCD7SY
	tiP+4mYXYWlEf6XEA/GvB9zWiclMWCSzwU1fm9Oxtib8MWq+IKB4FjrKwZzhKfn2pVT1Di7o/mk
	zSYQvS//A2RtVQyqXhAMBSuJLQiwm46FVYuo/PelkX88oPoaaY/0yS92j4ORAxWTo
X-Gm-Gg: AYBFou11Suma+QIfNiJpLKqE5AMAwSwsHc2Ly8CC5E0wsgerB+a51UDZtkan3Xp7B8H
	4PvIMiTDwOzJ+u2rzK32QjY2+RE6WuRe7ORbzVEpKaLzS2AfRR1UVvthmZMJ/hq4l/340PwCSWs
	41X7a2g7/yM12qt7hlB1ZTNRwFtYaOYJiuXokCaoXt7SHut2M0u9MjDzT+590IhnJ3sBzmsnEuq
	q4fVPu7IXGIEnKmAU6juLA8mnP3NOFTHMaBxwQ8mRRc9AE3nfuY+MbvH2HqmB7pQFXfz/Ch2B1h
	CzkiCZLI+9Co9T0Qd9eljFbPo988kfMliHdFeHXB2KdsuVDVAKcxT2HgPQbxN2wlOGRamH40PDb
	X8BI4cIJ/Uxlih7EckNsLqr8jK+s=
X-Received: by 2002:a17:90b:1c0b:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3adeaea1917mr4717675a91.48.1793007698321;
        Mon, 26 Oct 2026 02:41:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0b:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3adeaea1917mr4717657a91.48.1793007697799;
        Mon, 26 Oct 2026 02:41:37 -0700 (PDT)
Received: from hu-vhiren-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7847966a91.12.2026.10.26.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:41:37 -0700 (PDT)
From: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hiren Gohel <hiren.gohel@oss.qualcomm.com>
Subject: [PATCH 2/2] phy: snps-eusb2: Add support for SA8797P
Date: Mon, 26 Oct 2026 15:11:18 +0530
Message-Id: <20261026094118.3264112-3-hiren.gohel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PxNCOT1wjxmOzJVwEQLD-vKcWwsrffGL
X-Proofpoint-ORIG-GUID: PxNCOT1wjxmOzJVwEQLD-vKcWwsrffGL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX5HNOpBRs2eIG
 ehdQUTpl/CasH186RsOkQO8StbgYeUVlRnoVmKdLtYMTa4N90kEpzKzucu73fM1bRrnJzoSwXoK
 /vRJo0pxqZokDLT2MkGKTNgaQ+SKcFM=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf2053 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=uL0kp289Aari1hmGrBsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX3GJE4aWW7v9m
 fzqjiRruZaAZVXwsGdvJG/xDlOFdq3G8N3TBQMjeiAjg+tEe8jLgIpCWBb+4a1trlhqWHFs3tEh
 7vT8WlRm1PjNBv0Vt2+/QHMIW+kuOG0eNGr+a7DJ9YD1EXKlXhMY72h60/EV3lHHQZMWv0fm6Cm
 sR1IkIfP9WB4XbOPDK9GXbu+sB+rQff5P4BwH4SN7yOakgikuxT7l0xi1V6Slc3WV0GOjCZPQZ2
 u8fYB7CrF/qX7jZ1MctqqD/oWy3z1KgScvGoSEfBawm1i4IDJd84ZfAkPmN0AOKgAN5QqsjgrDD
 ADF36F3nTVojqO2sQT3Ru8PgLAyeIdZsH+dYaD5+oriRcgYDjIfx+kVKVcxMg8B5x/pRjdwurMT
 1LuaMwpWCNVx+kBdJJjAkmGH8hyO+2xOeUjCt1ZNsl7hoTSZuLDoBGx/8j2xckUE7g9ItbcFjNM
 rTIc/9ilOHPTTR5XvdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

The Qualcomm automotive SA8797p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

In this variant, two disjoint sets of resources are modeled against
the power domain suppliers which can be turned on/off to achieve modeled
device states. Two modeled low power states d1 and d3 are supported.

transition: d0 <--> d3  :: both core and transfer suppliers
transition: d0 <--> d1  :: only transfer supplier

Signed-off-by: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 183 +++++++++++++++++++++++++++--------
 1 file changed, 140 insertions(+), 43 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index af4fa17ac6cb..b246ab52b409 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -9,6 +9,7 @@
 #include <linux/iopoll.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
@@ -157,9 +158,11 @@ struct snps_eusb2_phy_drvdata {
 	int (*phy_init)(struct phy *p);
 	const char * const *clk_names;
 	int num_clks;
+	bool fw_managed;
 };
 
 struct snps_eusb2_hsphy {
+	struct device *dev;
 	struct phy *phy;
 	void __iomem *base;
 
@@ -174,8 +177,62 @@ struct snps_eusb2_hsphy {
 	struct phy *repeater;
 
 	const struct snps_eusb2_phy_drvdata *data;
+	struct dev_pm_domain_list *pd_list;
 };
 
+static void snps_eusb2_hsphy_domain_detach(void *data)
+{
+	struct snps_eusb2_hsphy *phy = data;
+
+	dev_pm_domain_detach_list(phy->pd_list);
+}
+
+static int snps_eusb2_hsphy_domain_attach(struct snps_eusb2_hsphy *phy)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+		.pd_names = (const char * const []) { "core", "transfer" },
+		.num_pd_names = 2,
+	};
+	struct device *dev = phy->dev;
+	int ret;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &phy->pd_list);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "domain attach failed\n");
+
+	return 0;
+}
+
+/* d3_to_d0 transition by turning on all the suppliers */
+static int snps_eusb2_hsphy_d3_to_d0(struct snps_eusb2_hsphy *phy)
+{
+	int ret;
+
+	if (!phy->pd_list)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(phy->pd_list->pd_devs[0]);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(phy->pd_list->pd_devs[1]);
+	if (ret)
+		pm_runtime_put_sync(phy->pd_list->pd_devs[0]);
+
+	return ret;
+}
+
+/* d0_to_d3 transition by turning off all the suppliers */
+static void snps_eusb2_hsphy_d0_to_d3(struct snps_eusb2_hsphy *phy)
+{
+	if (!phy->pd_list)
+		return;
+
+	pm_runtime_put_sync(phy->pd_list->pd_devs[1]);
+	pm_runtime_put_sync(phy->pd_list->pd_devs[0]);
+}
+
 static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -282,7 +339,12 @@ static const struct snps_eusb2_ref_clk qcom_eusb2_ref_clk[] = {
 static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
 	const struct snps_eusb2_ref_clk *config = NULL;
-	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+	unsigned long ref_clk_freq;
+
+	if (phy->data->fw_managed)
+		return 0;
+
+	ref_clk_freq = clk_get_rate(phy->ref_clk);
 
 	for (int i = 0; i < ARRAY_SIZE(qcom_eusb2_ref_clk); i++) {
 		if (qcom_eusb2_ref_clk[i].freq == ref_clk_freq) {
@@ -452,19 +514,32 @@ static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
+static const struct snps_eusb2_phy_drvdata sa8797p_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.fw_managed	= true,
+};
+
 static int snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
-	if (ret)
-		return ret;
+	if (phy->data->fw_managed) {
+		ret = snps_eusb2_hsphy_d3_to_d0(phy);
+		if (ret < 0) {
+			dev_err(phy->dev, "Failed to transition to d0 state\n");
+			return ret;
+		}
+	} else {
+		ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
+		if (ret)
+			return ret;
+	}
 
 	ret = phy_init(phy->repeater);
 	if (ret) {
 		dev_err(&p->dev, "repeater init failed: %d\n", ret);
-		goto disable_vreg;
+		goto power_off;
 	}
 
 	ret = clk_bulk_prepare_enable(phy->data->num_clks, phy->clks);
@@ -497,8 +572,11 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
 exit_repeater:
 	phy_exit(phy->repeater);
-disable_vreg:
-	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
+power_off:
+	if (phy->data->fw_managed)
+		snps_eusb2_hsphy_d0_to_d3(phy);
+	else
+		regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
 
 	return ret;
 }
@@ -509,10 +587,14 @@ static int snps_eusb2_hsphy_exit(struct phy *p)
 
 	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
 
-	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
+	if (!phy->data->fw_managed)
+		regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
 
 	phy_exit(phy->repeater);
 
+	if (phy->data->fw_managed)
+		snps_eusb2_hsphy_d0_to_d3(phy);
+
 	return 0;
 }
 
@@ -537,6 +619,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
+	phy->dev = dev;
 	phy->data = device_get_match_data(dev);
 	if (!phy->data)
 		return -EINVAL;
@@ -545,45 +628,56 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(phy->phy_reset))
-		return PTR_ERR(phy->phy_reset);
-
-	phy->clks = devm_kcalloc(dev, phy->data->num_clks, sizeof(*phy->clks),
-				 GFP_KERNEL);
-	if (!phy->clks)
-		return -ENOMEM;
-
-	for (i = 0; i < phy->data->num_clks; ++i)
-		phy->clks[i].id = phy->data->clk_names[i];
-
-	ret = devm_clk_bulk_get(dev, phy->data->num_clks, phy->clks);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to get phy clock(s)\n");
-
-	phy->ref_clk = NULL;
-	for (i = 0; i < phy->data->num_clks; ++i) {
-		if (!strcmp(phy->clks[i].id, "ref")) {
-			phy->ref_clk = phy->clks[i].clk;
-			break;
+	if (phy->data->fw_managed) {
+		ret = snps_eusb2_hsphy_domain_attach(phy);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev,
+					       snps_eusb2_hsphy_domain_detach,
+					       phy);
+		if (ret)
+			return ret;
+	} else {
+		phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+		if (IS_ERR(phy->phy_reset))
+			return PTR_ERR(phy->phy_reset);
+
+		phy->clks = devm_kcalloc(dev, phy->data->num_clks,
+					 sizeof(*phy->clks), GFP_KERNEL);
+		if (!phy->clks)
+			return -ENOMEM;
+
+		for (i = 0; i < phy->data->num_clks; ++i)
+			phy->clks[i].id = phy->data->clk_names[i];
+
+		ret = devm_clk_bulk_get(dev, phy->data->num_clks, phy->clks);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to get phy clock(s)\n");
+
+		for (i = 0; i < phy->data->num_clks; ++i) {
+			if (!strcmp(phy->clks[i].id, "ref")) {
+				phy->ref_clk = phy->clks[i].clk;
+				break;
+			}
 		}
-	}
 
-	if (IS_ERR_OR_NULL(phy->ref_clk)) {
-		ret = phy->ref_clk ? PTR_ERR(phy->ref_clk) : -ENOENT;
-		return dev_err_probe(dev, ret,
-				     "failed to get ref clk\n");
-	}
+		if (IS_ERR_OR_NULL(phy->ref_clk)) {
+			ret = phy->ref_clk ? PTR_ERR(phy->ref_clk) : -ENOENT;
+			return dev_err_probe(dev, ret,
+					     "failed to get ref clk\n");
+		}
 
-	num = ARRAY_SIZE(phy->vregs);
-	for (i = 0; i < num; i++)
-		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
+		num = ARRAY_SIZE(phy->vregs);
+		for (i = 0; i < num; i++)
+			phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
 
-	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to get regulator supplies\n");
+		ret = devm_regulator_bulk_get(dev, num, phy->vregs);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to get regulator supplies\n");
+	}
 
 	phy->repeater = devm_of_phy_optional_get(dev, np, NULL);
 	if (IS_ERR(phy->repeater))
@@ -608,6 +702,9 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
+		.compatible = "qcom,sa8797p-snps-eusb2-phy",
+		.data = &sa8797p_snps_eusb2_phy,
+	}, {
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
 	}, {
-- 
2.34.1

