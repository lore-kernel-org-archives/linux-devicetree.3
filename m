Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922709;
	b=U2ZdpDJqDt9aT85UIYH54Gt7phojZ+EK4RPaf1MYlmdU5+yG8m2D06ndtbHTmQ843AnZ
	 8LygjRg1O4WM3mw4bCw/1RR0hU8COf1pd55MYjWnZ/YtQunWFa042SZJmoI45R2CQ6nXk
	 oCIESIUWdfYsRk1s2YmiBVGm8GpnOXcb06ntfkoyMSKmSOFD3vg988jZtddu3VD52NG9t
	 lhiXs60K7kBL0iGLUN1gb21PhbeZ5gyszBo5Y7czpWXBCRvTc5/EFnqglrslTKrSiVNZI
	 IZHl3HF0WdWaE8kU5tbvday1Jod+JzjneyKqMxqyRjMjPclPnwSD2wfz1j58ZFykXPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
	b=qwPzpfswLigRnFXKkfMD80ueagIBiphpYS8UVow0ccv7bObGsEcb2VDnJxIEyu69JtGK
	 MuiS2FsRg3XQiAmAdzBKnVYlO/ipGmEu3+vmZuW0nt1t7eii6xRnvtPp9UVPbO+e0YJJI
	 n1yomWlYEHbV4TaR0pl/9Lr8F/EOeffQTWvykEv4egKU7/JMlJuBzJ+3hek6SKT6HT00Y
	 KzVy3A9Sr+aCgN1B29V3pEUtS/W9Q0qTFvfyg0XibHg+yWjIBwiQEARH2br/DcRd7rniB
	 yfiZdRgUPGw6T5dkIeEQbDG8l+aYDten47yFKPumUiXxcad/3gDj4nOnQpYIBaWjjcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA88606D809
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 23:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA88606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NetDY1911709
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 23:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZPLdkk8872+
	3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=; b=UkMr84MRhG2lwl6GRudk0/V1aKS
	k6KLoW94KwpoB0/8NXIq8PN2pxR0aylngS8LJuzs+1ioj8sPRmPgOiuJuZq61DMf
	Nb78RcqMZoNje9ftXFatgSbVwuvSUsZwZ4Bz1zDzk8Lvy4atOm/D70c0D7pr6SH+
	/uUE4vmoAGYVIaBcznb9huBgRNsta7bZJtxMd3YSpxWgyFTfc+lVbsLtVHreYEm/
	2hBdudXpsOqHnLFHEhy5V0Cq0rsba5oIrS2KBwzOh8LX3NClFBfk2brdXvhB1/dx
	RkTlGEJ+C3EcNoR5cNO0dqSXB7DWUxTiGbJ2LgZ7RaRrbX2kTBUzsKMEG5w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa015r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 23:51:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so478418c88.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 15:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922702; x=1794527502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=jViDaO+s+ivKsMA2QnAHSoZfkgIrZrQTPI2rYIxck7cIOlBNOyEIYeX4Dn9xxB6xpt
         0UWqtFrewptgL5IGTyroBcLjdygbiQeH7GbzmalXo2GtVVZ/NEHa00gWZJzgGqjY3LAI
         w+wMwpcEfTN9bfecGu8hwI+8Rak5qLqQ+YX6nu0F/cTCKRyjVjPlzvrbe1bUaoqTQxBF
         hG1jxQ/gC6m420RNCYWvBg3c5RzDeMTQuI3Cr9g7CgTm3DaK8EjH3yiUyPCXGFwgnrC8
         eSmLzLi2Ik2SNCGZ1e4sr+R9l+0t7o6+1IBb9IO81YuCdez+zOmrvFFbzbhkiYM/ADJN
         ggDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922702; x=1794527502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=ejHHtjdSeli0JYahMUTScjzoDELXbWXy6e1K2oicDjO/UqKRCY2sMbGTyhHADcoXto
         ev6aZXgfIE4y5Tv1mzzk7FwgC+pjsyhyx5zoagt62DvlFUMjs0SRMkm7M01hUHWsEpZ0
         X7EGu6rNlxw1QfHR8IJJDYhs7COlRP7wG6SK1ip0sarN+NdoDsUNdWSfWrmd6RWM7cYT
         sSkAcV653vIdseiTV8Rn1T1hMBAmvIdVMnmVUBLcBXN4OK5mcye0hBZ+uSh6OFc3wI2i
         rRw7ygP0MAjkKtdb9QD2MSZcmYuIrjWSYP0F+EIb4hzGFcC2/R/+/XTy33JBVJmqneUP
         3j1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKo4TwCJqToacpY3WxCg43LqPvf2zrOeivqik7U28XUngxKQ6iS61cYyHRvTonf1glG1SQD9uyRXJM@vger.kernel.org
X-Gm-Message-State: APuU4Z/JidOhDDemER8abUwCXbyQV97wJSRrJii6QV2O0nQ6qbEXMZV9
	SXiDcjrFGkT4bQFEKdrYGYNXNnY0MnYsBCBngjQ6DpqDGtC7S65DD5j8iEKo0U0Td2Xy5N/ETZa
	ZwISJwAvFWM4GpbFaNXbyYOZPrEtbhLfEl8O3Rg499PqWr1hOko7IRLJFUyZvJcWI
X-Gm-Gg: AYBFou22idlZ5dBa6UI4SkD8NWeAnf4d94b9ASicNP0UYyqAn7fXF4VPZ+NoJ74LGWl
	vIS8IzfY8lWikzlSwfBFnptKieAB6uSfAmFdLb9SZIbTMX1wyZf+/tEaJKLU7W1TyoC8Aoa6W6p
	EzdZx2OrYZZGQqYNTXDq1LeDi1QxZjCBlEfssnhBeD7ZE6b3zMaWbAo1mRJaMexinmlEQUs7jwV
	a88LKPirvFlyO8eLJuo/j8Xqoi/iNWUiQYYAM/1VoSH4PnRtORFQYv1z6s3/m4Pltvqh3CaRsu3
	tUjXFkONsZ8brm9vj9KQqrHI31rnj28DPuwfRobXAR7xBC2AGuV5lDdRLdHRPhBtOuOioyThPIy
	bTXueylYtyJdOn7GGLRytUrMo/CVEgaT3yM9L8ioJ2txra94XPYjmFgLD0vnSGx4JjeeBJ37Vj/
	/HqlMBw49/gM3+JrWrPXSMXK4esKY=
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666757c88.40.1793922701673;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666717c88.40.1793922701154;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:40 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] phy: qcom-mipi-csi2: Make OPP table optional
Date: Thu,  5 Nov 2026 15:51:35 -0800
Message-Id: <20261105235137.2635442-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-GUID: paUkTZOL6xXuH0AFai108Qc41o8zK4EY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX6Nii6lhXtrse
 MR0S60tcX0H8Msqd/c23d5DbgTtAt6A7Yixh+Nm1eC4MY8Sr9iL7/p4PSLVozSNPtkXVp62SD0Z
 +pmdNEy4Vdp0Rp/KyWjGWsn3E+W0c2lvrS65LMg01BB4I0e4I9vH+ZVJQunn1lYi9Djf0RafK0M
 q+7SGnsk1O5g/Y4QzI2RTnPOV2r1dutqh0NFBndgNXHosJEJD2oIk1x04FaQoIjoPlKk+mFr4FJ
 8FQcstqNQ2C15xxhaZdsc5J9pg39dyd3fzPZ+h1DX999XDx1+7/BCas/0QrMS4X75WACA7fyYut
 udxv6gKB42sTAiXdtS+K44TiGLPQvE5QgYWIBE2myMbkHLgb8OBGrcrso4as5sDExZgWO1upRsD
 Mtu+EwoEaf3gcIDsII0+XOvbvfCM64n3JViVCuD48TT/hUrthVLdgNbUl+SUZDY1j3Nx9PyWYYi
 WObm542GGMmlzEPdn3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfXz8m9fl2XAH9b
 d61uuCcoJ21FaES4zcJjCxjwdYQyv7xjKPYcv/Pktn+ZVJZ1/aB+/4knbOZhb5q9SMc0DrnD53M
 NxMFjVR5MHbempFrugzLyGPSdOX4IIc=
X-Proofpoint-ORIG-GUID: paUkTZOL6xXuH0AFai108Qc41o8zK4EY
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed168e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xhLwaI6HiHkcQTGlYsAA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

Not every SoC the generic MIPI CSI2 PHY driver supports needs an OPP
table: a CSIPHY with only a single, unscaled power-domain has no
performance state to vote on, so running its "core" clock through
the OPP framework buys nothing over a plain clk_set_rate(). Add a
no_opp flag to struct mipi_csi2phy_soc_cfg and skip
devm_pm_opp_set_clkname()/devm_pm_opp_of_add_table() in probe() and
the OPP/performance-state handling in
phy_qcom_mipi_csi2_set_clock_rates() when it's set, falling back to
clk_round_rate()/clk_set_rate() on the timer clock only.

x1e80100 doesn't set no_opp, so this is a no-op for it. The "core"/
"timer" clock-name strings themselves stay hardcoded literals: every
SoC this driver supports uses the same two names, so there's nothing
to make configurable there.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 72 ++++++++++---------
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  3 +
 2 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 269232499fca..8bebc943a771 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -32,40 +32,43 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	unsigned long opp_rate = link_freq / 4;
 	struct dev_pm_opp *opp;
 	long timer_rate;
-	int i, pstate;
+	int i = 0, pstate;
 	int ret;
 
-	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
-	if (IS_ERR(opp)) {
-		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
-			link_freq);
-		return PTR_ERR(opp);
-	}
+	if (!csi2phy->soc_cfg->no_opp) {
+		opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
+		if (IS_ERR(opp)) {
+			dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
+				link_freq);
+			return PTR_ERR(opp);
+		}
 
-	pstate = 0;
-	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
-		unsigned int perf;
+		pstate = 0;
+		for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
+			unsigned int perf;
 
-		if (!csi2phy->soc_cfg->genpds[i].scaled)
-			continue;
+			if (!csi2phy->soc_cfg->genpds[i].scaled)
+				continue;
 
-		perf = dev_pm_opp_get_required_pstate(opp, pstate);
-		pstate += 1;
+			perf = dev_pm_opp_get_required_pstate(opp, pstate);
+			pstate += 1;
 
-		ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], perf);
-		if (ret) {
-			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
-				perf);
-			dev_pm_opp_put(opp);
-			goto unset_pstate;
+			ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i],
+								 perf);
+			if (ret) {
+				dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
+					perf);
+				dev_pm_opp_put(opp);
+				goto unset_pstate;
+			}
 		}
-	}
-	dev_pm_opp_put(opp);
+		dev_pm_opp_put(opp);
 
-	ret = dev_pm_opp_set_rate(dev, opp_rate);
-	if (ret) {
-		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
-		goto unset_opp_rate;
+		ret = dev_pm_opp_set_rate(dev, opp_rate);
+		if (ret) {
+			dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
+			goto unset_opp_rate;
+		}
 	}
 
 	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
@@ -83,7 +86,8 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	return 0;
 
 unset_opp_rate:
-	dev_pm_opp_set_rate(dev, 0);
+	if (!csi2phy->soc_cfg->no_opp)
+		dev_pm_opp_set_rate(dev, 0);
 
 unset_pstate:
 	while (i--) {
@@ -405,13 +409,15 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+	if (!csi2phy->soc_cfg->no_opp) {
+		ret = devm_pm_opp_set_clkname(dev, "core");
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+	}
 
 	num_supplies = csi2phy->soc_cfg->num_supplies;
 	csi2phy->supplies = devm_kzalloc(dev, sizeof(*csi2phy->supplies) * num_supplies,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..6cf9e5b956f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	/* Skip OPP-based clock/pstate scaling. */
+	const bool no_opp;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
-- 
2.34.1

