Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550509;
	b=iXSMYVPTT6V1CetPU+/VPa6LpFVHiirMpw3Sl7Wq0eRaSGRH5nvNs7cMeDvKhSgTtAQS
	 lPRXoP6nNHnb4Qv/oItGJD+654RJgYqkVCOwUjYLT6OsgTla6erOx9CdPXIWXPKpgNrgV
	 20dQAphiBPCpjrQ5YTjuUUHYm6ZiZ1sMjXzeSXuQarpyaE/IYMI+oqbdJI8z6FBmkhQ4+
	 ZS1BfbNmvZM+EsGNGxRBZhSXcjG+o1EsZ5uvDKONY56B0i/TGqmJ6OeriaHP1JKCukiuk
	 8klhs+5CmCreJwRMCRLgC3ikkIGyk/vaH0Lg3HJxYAFXhXrUOIY/pjp8zehoGgxzrbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
	b=qRNCcLXI64VM6v3h4Le6Z0W3z3c0ig1CCV4mEj/gbkbcig7chDUifprtNtpBaJIa7s+f
	 4M4m3uGr1E0ikOr6jb+LhfXme/vdPjYvs5QLY2k8GqR8RNnWC1bSToPEJ1CHMhXSOtyD7
	 v9yzexy8u1jrWtdidBOUB5d9ZcVxz8FhkeNHpiZQ68An6iZjLKHqas0LWrjYkGog7vju/
	 +RfCJVlIwrzxQW3X3ucqG0dl0tPm8vyrpqieUzLA+Obj72OHkejjdEdpf6kVm1kgrNEaB
	 wQvw4JuQUV6m73uUuKHS30IqLtMKqDkUdix/cTi5m38kWGdCRLNewOQZo2p2V0UMWMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ED2606A33C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06ED2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIY0BA2135529
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=; b=onxWI2js/qa0c91h
	l/J8lCF49XdAetJqFVrI7XmVpaEGNRwzO2ejLUesHar/CwxBp1Kh+WJTJ3pk+IwM
	QNIOCNFEy4ZV0Q4oDM1xZSAaghIxGoYZky54XgIduzeTXWeLjfg0F5jvi2MMJc0i
	ASDpMpSHAY+/j3aAWgTqMzMsFrH/ka6/FOQqDiICHDf4DAmGUaSFTdTK7TdckGGD
	0wl36+4VHsgOXuelx5nzd653eNdAEvk+RlJfOySyIuO8VUexEEaFJ+lLkjcgRSYA
	2Zuq5HH+mWIJWoGxjfkj6S2hrW51B0opt76jFqxFDj4CkfFHeErjgMGzsqoQy7hZ
	FSZwkA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b801yg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:01:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d3747ef323so159605137.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550507; x=1796155307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=eTbKs4Wrf4k16vV8tsUqx3N2+E9DTG8qsQG2oAC13SbJdcVQDu0QteXjXEBieKBAQG
         pGbFipEAVXkzdkNeSig7GkrFxvOc5HN6m+G8hXT4ogNPwi+iFSEDOn4q9wof7d5sxzea
         oSidk2pjDBfe1D6fb/bu1rqzi0yNI4BVpcsldwXMAYZIFvMqZ06nupU957ZrDm/XtdLD
         2TZW6NHgGVGoG/n8TxRXzA5Zk69fvNFnbmhWvSzBDzamgCNT+FtWO8L+k+CeRiTcpctX
         1Z2wyytXEjKK7wTIo+TOUnYIdcqBMks31cMiu/1DA1R9KNnnjzVWtNcq3uobdf2b7YVO
         P06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550507; x=1796155307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=lW6UwhuJ9VMF5wTPO4ZGyZmZKq1LZRdPV7EpI7y41hGo/oAPSMw2dlTLMlP4Hlta0y
         1BQqWDjX8/smoNZhuQ8CG1A1A6aGAEgAci7AvsvmE6/dkuiT6jGMQoezw5WE2gGl7jne
         NKHp222RDGMlxh2W092CF5LXf+zlKkTtN4zuYMgflIoTUKPpDHfkc4WxBFcqQzo5TZPo
         +Z06mPuN9Ek3DdrK+Flo7OyOL4BZKLOkUxTbGsWAeW3iX6y4ppJMDKYZMb/AzBlPRhso
         eKy6jjTYWayzUCti76th24/x+HhB/O2Ct3Ofhwp3McRWHHvBBPnbECtkBvnP7tN8tpEn
         ggGg==
X-Forwarded-Encrypted: i=1; AL+hErFwjdr5eY3UkTBcyXpTQb5U0l51vaviFjcUwnx/inSjKI0+HSXNsR7wAr5+0tNLNZFQtPuNjKU0kD+Y@vger.kernel.org
X-Gm-Message-State: APuU4Z8wyu949HV/n7WiOIu/81breUU+JPPt1xq54fOehcqAXkOsxbnk
	uiBijyDOtlnZY2EfckRwBxX445FGuq645itrGfuZr7e8lEq5Dr1fJ/aGPABEUWwnKZjVWqBTUr5
	gP/Rms6TadGticRXRB+0GoSIX+4IEoOxdXOOIOLBtLwRIZFdJCUU5B9mwNRyu6ObS
X-Gm-Gg: AZFdTZeMjvHw5Xi4dNDCRNSaxMznYk3jTsqG8L1d5vzaPBDNJiHwYBE5TNky6DaJ/Ee
	WOGSh4h/yQ6m4oqHOaeNx3xh6VeBI/tk9iWXYJQIoja+oSQe9XJwIDMtJO3NO4mEB+be+COMx06
	QKtyShTAGLUfcUqH4qBZm7YA2fIHZBxCjvCZ3DJOKGJWikrDhVQUkW2FPLLe0lpkE7yLYIEqAbf
	BP2uS989tAlANSDgbwUo2bLo6eY1lSahZHoAn7sZ1kTFkFM0Du1Ued2QeLxSlKlun43/ks+8yRe
	yFRiOchWBzcH3bMiYqZbE3AzneyKwHHBhF9rxkIIoY5Y7VfFOvDI3C20xxmcCNnAX5Nopp5zi7s
	D3+2VP8fjCyLoFYrSWOUFZ1jMkShiSQFDZpf1LizCKYXTtskGFNDjg0HVIhqKVk3iCKcMSDaY0k
	0uxMItI4s=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654722e0c.0.1795550507151;
        Tue, 24 Nov 2026 12:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654601e0c.0.1795550506454;
        Tue, 24 Nov 2026 12:01:46 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:31 +0100
Subject: [PATCH RFC DNM 02/15] phy: qualcomm: qmp-combo: Add USB4
 power_on/off to de/assert USB4 clamps
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-2-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1739;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=srDcbvCKmzTW6ZFC7dL4jM5RmKmDLk6L/F70k459R2U=;
 b=DfUOTBjSbX0G43dLFvbwRwSUp1QIURcaf26xg7MQFnmkwZFDhPAYrQBYi9bxMtPyd5DhHL2vt
 v/BQpOYKbSMBQSXZAZARt6EWTVGTYwoL/LONH9icnOTkbQiOeETL874
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX25K9qgMxvu85
 aoC66dCEl+p11l8JlO28WGrWeg/L1anAms+SPIaDdkM+lEGQyv8tfjh3jLs84FzCk7sxO7jcQ7D
 JfV5FVc9ldI7daBSyDKxhJ/FvoMBUkf202qQGtwc9W+DXCu2j0xZN1Io5e+OzrALrLCygroXsSX
 W2LPX9ivU3R0mM2YUVg9yT1UXzjSYNWQSnZC30UykR0vG1X4w0O3cG41VYnAkMf92ZhpdnP0tle
 ic2XMi78MR+dRvwq1RRFC5E9QkqDC9cmomv1j/noPfNlUoW5IXgky04I0cRWdT6qjplm0T0b3mo
 8tPJG++EesrK6BBO1l+TZlPJFguL+/eIdQ6NnP6ncDZiexWWiy9KIK3Et6b/JEoZgks0jLI5iWQ
 Ozjomho315ClEeHSiYz9XJBF3EWcbFYlTDwOujPqSWW1sN4noP9nTIPt/h0KaW5U5QATjZ9C6aN
 KnscBRgH2gBrrTQ31YQ==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05ed2b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1SUI9jfhOX1tsDrs7xYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: SvjNDRLPrVxLpJYLAhxzr0syYIJv-07c
X-Proofpoint-GUID: SvjNDRLPrVxLpJYLAhxzr0syYIJv-07c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX2SBOuSIeOP4i
 SVTFEsFm5Xu2fUPvCwa2Xtc4Fjg6scCKi/yyqEZWhvaaWrWt0HSevnnRrP2wxfHDOFB4xBWt2lL
 +OrARCfU2ZYiOsFk2qvPkwfX2FWmzPM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The USB4 part of the PHY comes with its own clamps, which need to be
asserted during suspend. Use phy_power_on/off to let the router driver
do that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 03fe66dae8b86837fddcc59956529ae374c1f6de..475b9a43baeeeaf18efb6e55d8151c170169c742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -5085,6 +5085,28 @@ static int qmp_combo_usb4_exit(struct phy *phy)
 	return 0;
 }
 
+static int qmp_combo_usb4_power_on(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_setbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_power_off(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_clrbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
 static int qmp_combo_usb4_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
@@ -5110,6 +5132,8 @@ static const struct phy_ops qmp_combo_usb_phy_ops = {
 static const struct phy_ops qmp_combo_usb4_phy_ops = {
 	.init		= qmp_combo_usb4_init,
 	.exit		= qmp_combo_usb4_exit,
+	.power_on	= qmp_combo_usb4_power_on,
+	.power_off	= qmp_combo_usb4_power_off,
 	.set_mode	= qmp_combo_usb4_set_mode,
 	.owner		= THIS_MODULE,
 };

-- 
2.55.0

