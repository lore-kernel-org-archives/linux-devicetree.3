Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE1269D18
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176581; cv=none; b=TdASAqzx4RdKPTX10/Q/DbuSOtBLclnH9vrVgIJIYgM3DJUuq4iB93zoRFUkS9Nubgyd+rGZjR/C8ZBidxiC36y69zTY/HZ0ayDbbEooamuGkcZTqbTtxSqdLbxdyL0+TjQBeRDdK2Zbts+hREmX9GY7lMskaLSTK5XY1CDRxvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176581; c=relaxed/simple;
	bh=DRT2gIEqEs+RAsIvgPMQRwWOyVMEY7rMCZ4VlFwdz1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6c6XHgAjMayV88VtG7LAoCvkzWJzH5ukEK6pHR8A6fwEfZsih50XSThzSW1C7rkE178UOYNw4KL46Poq02XF+pW+g15OtYKqUdYFz+nKt3cIr19Cg+l57MyHE9Bj9UA+K7NQkqbTJISrHocbQxmI9gWdKo4kSC7WdTEtt2rKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yc42GMmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fe99twii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yc42GMmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fe99twii"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632KOqBp2707033
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 00:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zivnovxSu9T37vh7fCot6swCASthFxgNrxcW8uiHS4I=; b=Yc42GMmmTzaKkNeI
	6U9kvCP20m5K6sXNuPCO4cH51sjTNnXzbteWLb3rBZMZvaeFDnTHXjVeaNhNbiSn
	zkaf5MT7yYT6/S4chbq5XtjhsFmcr+RuSlXlM2++VlYOaSDZXvRQUF5rnBb4F/Nx
	9kPxHFuVE4k5Gj4VECyadn3JU2gaEAIDmQ6MPS4Qd0W7Zez4zNaGlQF2/KYqdJa9
	Qti+ctqSrZILpRmhYwwfSsOUX5+Uqf1OKGBpM+qV6c8wra2tzu/kKy7qEjd0FZfQ
	6pXolpth2YfD6G1eWdfWTOGl1E/6Dv4MudO3iRAJrviNpdJZ6QAYHiKM5TrrrywH
	BvhWrw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjghna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 00:36:18 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127337c8e52so1074320c88.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 17:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775176577; x=1775781377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zivnovxSu9T37vh7fCot6swCASthFxgNrxcW8uiHS4I=;
        b=Fe99twii92Kn6QaSPWstvE3oAY8/nbez0Pkchb2vOTj9WeiL+1bEskBnpCjQYnLJwV
         iaacFDpIJ6eTvEz0PhiTD6zkFAxpRx2PN9Fg/pD+YU1fLaKi4s3CzBZZOV6z5YRqaB6s
         7ta4yYVo0lMszb5cwn7zMT3t/OxiRQnykph78p3nU1JGWTpiODKZRP9pBFCNyTuis+89
         Cv+6N5pFaLpnR8zYyHSm+oDEWdr3Tj+S1Ss9nlEO6chELVSKzmzfsIzKNrgxewrCvRla
         343fRaeJtQxLKmzoei+Hbgk2i9dgyd+ukN6UtWky4qILfI6otB0UYdzLcP6L/M5AGH66
         S5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176577; x=1775781377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zivnovxSu9T37vh7fCot6swCASthFxgNrxcW8uiHS4I=;
        b=QDBrmhDbsJ8ZTcS/4KrDOBvr+ThJTkYZNF2ddMhxte6e7v/HZS6v54z4H1Ci3BH+71
         Go0UFVEm4HI9tujcvfO51Ivbhv/jiDoXb8sAaScqJ4szt6cf0+RytYjfJ+DRH55+ruWb
         peblQYgSS5Jrl+//RrcKiqtmwjmGFNp9zfltEW4No4FC0co17R+fmfLN606KJhI5Rovk
         EK60GJzuafaGtuujxSji04a0mKmCtA/s3sKiaMeweEuuPKHk2dPkHx+k62S94+g+3HKf
         geMHoAV33uIUg0LWuE4CrcA/4tblH/PkRSxoO1D+v3NiDKp7tGYLFqLths+jjtiOTaMx
         BgRg==
X-Forwarded-Encrypted: i=1; AJvYcCU/c3o8n5C+5PfVOqT2rfqKsMqocdqG9Ng5GNQbDgS0acNSpimnYUsHUTMVjoguFi6hjkGIpSpICV1d@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHVNfnA7/Djik5zgd5yxQeiEFYO7Dr+WzP9jNgeEhNsw2M+y1
	DzqogIoobysO9Ej20yVhrn/tosEocBEMoB99uZGWkFUFnLIcx9lLtfI4gU21QytI0f/qZmAw4sx
	SIhTOeaL06D4AS2nj/7gk8/p0j9du+B5nP+DxxT6vXfW9sUOPaHapUMQDhWSOqkNOaO3lsKoK
X-Gm-Gg: ATEYQzyyOMguBgq9GRNRacksU57s1KAMuybA3tUIIRo6bKqfo4EmcPPLsrAnjYp/vUl
	aiHPbOmrZB47yubQ6Xzkc9kKXFwOyJKlImpmUPHV+DJo79A+0vf7kEQPCFD2uuedvWb1yvDINx6
	e41b8VhxZOf3mVNohhrShE7BCIBz9seFSpL4RJnkLW1kY+oYFDGWmx+NT9YCTsD3pma3bh2Nn+T
	jbz23gn33aeE/xw3B9+LhnN5QHZogVHqHNsO1RMJ17frzOCSsknvkljyXEhjnb3m2nOyj8tEKf/
	Zm8tVHa5HmRMad5ABX0Y8jvujtpHoaS/eCD+oEcz+iXbOP2Y16oEi9K/6HLRe+TW9jeMVto8QRj
	RkPfQKFuK8uGXcU8WlvZSuT5i06Vl059Cea0UQBHLClvn5Cl3zw0yOrmNpjT4rrGZjuoPaOdIFg
	==
X-Received: by 2002:a05:7022:221c:b0:128:d438:cad with SMTP id a92af1059eb24-12bfb74c7ecmr646175c88.18.1775176577440;
        Thu, 02 Apr 2026 17:36:17 -0700 (PDT)
X-Received: by 2002:a05:7022:221c:b0:128:d438:cad with SMTP id a92af1059eb24-12bfb74c7ecmr646148c88.18.1775176576915;
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm6290550c88.0.2026.04.02.17.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 17:35:22 -0700
Subject: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-haw-rpmhpd-v2-2-2bce0767f2ca@oss.qualcomm.com>
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
In-Reply-To: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775176574; l=2519;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=DRT2gIEqEs+RAsIvgPMQRwWOyVMEY7rMCZ4VlFwdz1I=;
 b=/Me+lrh5aFjWOFlNIOkr9UVd2ZwEogonrnK/9OFGRG56CyynREsMhJlMa7cHVPnVXPUO6mEMO
 JCbVaDvISNVBcCnQ/tgpEv/VlZVyO9QsdkxUNoc6WC842w3Euxb+7nP
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: aoaoCWYj-3dtfptibUxTiamWtjIoz0Vq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwMyBTYWx0ZWRfX/d7isrnFbd6l
 uig22Sf5OCX7dJIjMxdHFk13RtFBcayAo2M5ZRvy/xkBl/enfVG/U5arnASO1v7h9ikk7sEv1pE
 raEc7ItSx9ZHDr2Gf0rysBaWa1dn4xKOIvZudsdRe/uOyE7iRHZ8fR/kUkevBwnXmSafrDgyjs/
 vw9sCZHMEJbgcHPTVJNUmlm7GqwTB0TWDlNPsuuEPuu3n3GzorP8v4YnWeAj4AYjKXFqMnQFpr8
 kBEIHK/nDkNexoF+/fepiEWAk6E4lgeqvnMjeNpyGKnymnvq+yPsR3Pnmet5NyhSxJBpTlQVnXo
 WS2fHwyWfwTXJI2YWZPoc8AXDcIGbYn1Jc9fhZcYcYVbZtxQtuzG8IVSyT9NQ4+UdHpW5ah+1/Q
 Vnn0apHJAZzmHV9J6x2NVEFjISnvjzbqIKqfCleBxjYQmtsUOmNB10sw/MpcXc205JMhdP+huX3
 vU2xft/JqpcRKgryZEg==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cf0b82 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dVseYE-P37VojbQfzSsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: aoaoCWYj-3dtfptibUxTiamWtjIoz0Vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030003

Add the RPMh power domains required for the Hawi SoC. This includes
new definitions for domains supplying specific hardware components:
- DCX: supplies VDD_DISP
- GBX: supplies VDD_GFX_BX

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 19849703be4a..f5ae2a63765d 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -102,11 +102,21 @@ static struct rpmhpd cx_ao_w_mx_parent = {
 	.res_name = "cx.lvl",
 };
 
+static struct rpmhpd dcx = {
+	.pd = { .name = "dcx", },
+	.res_name = "dcx.lvl",
+};
+
 static struct rpmhpd ebi = {
 	.pd = { .name = "ebi", },
 	.res_name = "ebi.lvl",
 };
 
+static struct rpmhpd gbx = {
+	.pd = { .name = "gbx", },
+	.res_name = "gbx.lvl",
+};
+
 static struct rpmhpd gfx = {
 	.pd = { .name = "gfx", },
 	.res_name = "gfx.lvl",
@@ -622,6 +632,33 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Hawi RPMH powerdomains */
+static struct rpmhpd *hawi_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_DCX] = &dcx,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GBX] = &gbx,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+};
+
+static const struct rpmhpd_desc hawi_desc = {
+	.rpmhpds = hawi_rpmhpds,
+	.num_pds = ARRAY_SIZE(hawi_rpmhpds),
+};
+
 /* QDU1000/QRU1000 RPMH powerdomains */
 static struct rpmhpd *qdu1000_rpmhpds[] = {
 	[QDU1000_CX] = &cx,
@@ -796,6 +833,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
+	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

