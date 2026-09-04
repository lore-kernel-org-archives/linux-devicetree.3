Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E823E511226
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542186; cv=none; b=RrxtvsmYlhwvgL+rNfQjx6IBq+c18LiqGbeJ27XfqdTrKIC1tO2J7dalCsTwlQUGxBOoNtdKB0mSua8pXrQkWrT/pKpjuOO48dkKbp9vASZ9Q9Zt/Yy+ULLp78/VfFujDCTAskXXhE8GEnl8bLAktlV/p0GtuauI1buhfT97Y5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542186; c=relaxed/simple;
	bh=aGLPmu41Pw0BcItdaIQ/oejtoZmWVddlOgwbZWfcXyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YApM4Mogb+SjopFnNeG7yKimHDijuH3ruMh7fHcHQkSbZijZTsVktut813Qx0yhSh4mIsaeU7CX6B7YX/w6HO/+4h7/VgTv4d8WovaPALS2dSBTZZKiIcXOBZ84r5JxFxkcTwB6WTR7rioRH9YE5CGXrKJC6nhDgBxJYjoT5opc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7o0qsyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lb2UGfgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7o0qsyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb2UGfgD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiTew3765764
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 17:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2x25UL4OOyYet5KdXJe2GBwmwBmRw0D2ojXVS58T1s=; b=c7o0qsybM+Itqzp/
	YdI4hU1dLy9APJfr6D8K/YLigN5YAIyxq5g9zAjHiTVAx+GvjtQQlVMh0J5FhDcx
	910xRmub2zbRO7U5vN8OL21UL0qrmen98+t+hVt9kkibrnlJK71QMBQ/AW0XtQ2d
	wEDr88puUeDdMZ0Ft2nHYxkNZk8F0UGMt9FEruAbd148BxYMPIbI+1WqV4Vl/EEv
	KhIrUSbTVZUqyqa0CziwVQhOWPU4EuYDU5//DG1LJ01/IQhHT38ml7CQx5cBWI1Y
	Vqq27k5vUd4jzseeKbw4gXs0TKRgsH4rnxVWLKyVvtig6LtcZnC02MybdoLMPbwv
	vOj2Jg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg012186j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:16:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e98e74535so20419256d6.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542179; x=1789146979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2x25UL4OOyYet5KdXJe2GBwmwBmRw0D2ojXVS58T1s=;
        b=Lb2UGfgD463EwuZ+mBjw+eEk1uYgGE3LeKrhE6O5b03hghwioAjsCs+oFXa6iruj6T
         NBxgOx+GgiccISDgMryx0iHQYVtMXaOOOP8YSLmWsW/r7sua1ahfCp6quT5sDIz04NPO
         rczhv8lLYTfYy2vIpQ2sBWf7lDc9xBboLJql+zsFAOxXCrr0lbNDIAshJ0RlVLkEZ4h4
         gK9bMXilPIEoZm7K/HhHKvcWGF2DHGZgGOjnvSsDCblI1nvRICy0TYHSLth1PDwbER5k
         HetVagJZLvyDB8/fS7mil5p8vqTvw+KYAPy6FvcLEW9dnlLjG/s1TwIwBHtB+XJq9MBk
         EnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542179; x=1789146979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2x25UL4OOyYet5KdXJe2GBwmwBmRw0D2ojXVS58T1s=;
        b=sRPAHIr2yZ5vt8XpTnOzbcoBJhbtARCk/264YXQLFCNWpWJ3wHJxVjwd/g/nUsbIw7
         gzmmN1l2vQUS50uIMYgPGNOhcDRX3YLsao+x7z58Ls1SixfwGoCYvtrPrr3A0AbfdAfe
         6r5tmU1+S34F1mPXwyK/4g7ZgckAK4SAWOt6VppAZq/TiDkYxQN/NRFSYqMs588L14Rw
         s4mvjBpuVlETnylSQeiavj/v3TeYPDHlVH9luwkEA6G2pgI+wO48zeYqByEV5FdfleWE
         VOiEsDm+c6gb8Vd+xwUZgskKOAeddMJfKyfeeY8pdN52jiJjrBnWQGvj4ELDII3iv1cK
         qu8Q==
X-Forwarded-Encrypted: i=1; AKwUvByLNAhY8FDSLmitZzw4cyLEdAkbWkXVAr/fVfuMKGmBp8OHKoJTecW4AChLGHNv9yKdCQaR+yxFE223@vger.kernel.org
X-Gm-Message-State: AFuF++mUkb6/zYCj/Pqz+tFnAgGkHNAs/PC/2kBrS3Y2zm+loKTDp22C
	fxvYAbFa/JmTQsal7j8nP1T8GwUaG7pxDzR0C9LCAy3yqaiqytxQSJpw8EWHUrDX19MffonfV4I
	5K9AZN0v8W5CqCXxmnemR3pZhyEm2aoSycH/lT+sBbP10c5KYy/k8t8WFHOy7CHbG
X-Gm-Gg: AYBFou03HjpNShp0WOXLlS2iMz2qpArfXS4kK63zeuwQx2EeYrgfVsCLAfmG3IFDf3Y
	MzxhFdOHxc+RLZ8gyFN6CT1mpOGj+BJWnIdFOhCKCFDh7IBbf284XoNzYjaeaegEkS8Rb5M8W3C
	K6UI9M0JzgYV715oQeFuL1fqVnP9bKgWRroEWHk7mstDiE2iwKlh0BXZuRcg2lMBJK97iSaiwo1
	v6kYjNy6rqLYu9bhIAvZWbQCjk+VNGQ9MD/xxjRdQjUHNchsR6ikiA5apCrnCsgh3Ugq2bS7ANt
	4TEWtdb3kLmiojMJO/KTptJ4qaiVAhpwawToI+PQGYUUMf+/PJIHszzkwfar9jQle9STqx4S0tl
	1NkabpJDuIXSgVw==
X-Received: by 2002:a05:620a:4d89:b0:930:9091:f0ce with SMTP id af79cd13be357-9398037b9admr545438885a.22.1788542178947;
        Fri, 04 Sep 2026 10:16:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4d89:b0:930:9091:f0ce with SMTP id af79cd13be357-9398037b9admr545430185a.22.1788542178341;
        Fri, 04 Sep 2026 10:16:18 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm146631735e9.0.2026.09.04.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:16 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:15:21 +0200
Subject: [PATCH v3 4/5] PCI/pwrctrl: tc9563: Switch per-port reset to GPIO
 descriptor API
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-pci-tc9563-aux-v3-4-5b1449d62ba2@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9afce3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=viGhCAv9QodxNsH3n2EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX97f5L3Z1S3IS
 fwVJ0lXCiUVLtoj5CzmF41x8cBz8exUiIawNChrfvhSlTpGZmTirekWuKz93rnYCjMeth/1PQf/
 /Lwq2UI5OXkJgt9o4I/2VGQXggCstsEL8M6oOjcXwHkTKoy1KxW4E1E08QUb3fuJtYnkhufX3IQ
 OSWdCcuHNXndoeD9h0o79k9fIRZdLVYDo0jNKXWlZ9QFPRU8Pq+3RJHxcOiVDiXQY4gHhFhcCko
 FaO70z9F1GDwqibdzoYx0vns1HatG6HBFKjxl3hNddu6OTTqqKn/A9ncStUeFt+4jnHjJ6nuqL4
 W9JIju7gx8edDW9Wikrgx+IbgujVI3Uus6dVvNsHCyg0+5spCsfPup9sxHusD3fBTvz8Cfikt31
 u1Z96ovgjJ+GKBJam740AUr8oL4oK5aCz206v6KamoB/lb7yJgsLzyv6WdIv/wp9qpyLLwvBlKq
 2cAUrD4a2OmMdvTmf7Q==
X-Proofpoint-GUID: otlX-pj_1FDtGasS_RWoW5QvarF59AD2
X-Proofpoint-ORIG-GUID: otlX-pj_1FDtGasS_RWoW5QvarF59AD2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXxqp2hK25NHPO
 0r49UV3FEn/Y5q5LKYRcfae/LhIAPF4pE+TydSFtzQ1Mmzh3l5zCfzPengQ9s7spechi4BOsqIE
 1gaRjqHoRy95fl7IS5ffM9ZfgYl+ufI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040156

Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
definitions, which are no longer used after switching to the GPIO
descriptor API. Move TC9563_GPIO_CONFIG and TC9563_RESET_GPIO
definitions in tc9563.h header file.

Replace the direct regmap-based per-port reset logic in
assert_deassert_reset() with gpiod_direction_output() calls, falling
back to the legacy regmap approach only when no reset-gpios DT
property is present for a given port.

Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
PCI downstream port child node. The lookup is done lazily at the
beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
is registered.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 ++++++++++++++++++++++++++------
 include/linux/soc/qcom/tc9563.h          |  3 ++
 2 files changed, 73 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 2230765950b8..d9b69c3aeb7e 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -25,9 +25,6 @@
 
 #include "../pci.h"
 
-#define TC9563_GPIO_CONFIG		0x801208
-#define TC9563_RESET_GPIO		0x801210
-
 #define TC9563_PORT_L0S_DELAY		0x82496c
 #define TC9563_PORT_L1_DELAY		0x824970
 
@@ -59,9 +56,6 @@
 #define TC9563_POWER_CONTROL		0x82b09c
 #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
 
-#define TC9563_GPIO_MASK		0xfffffff3
-#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
-
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
 /*
@@ -87,6 +81,7 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+	struct gpio_desc *reset;
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -351,16 +346,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
 static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
 						bool deassert)
 {
-	int ret, val;
-
-	ret = regmap_write(tc9563->regmap, TC9563_GPIO_CONFIG,
-			   TC9563_GPIO_MASK);
-	if (ret)
-		return ret;
-
-	val = deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tc9563->cfg); i++) {
+		int err;
+
+		if (tc9563->cfg[i].reset) {
+			err = gpiod_direction_output(tc9563->cfg[i].reset,
+						     !deassert);
+			if (err)
+				return err;
+		} else {
+			/* Fallback: legacy DTS without reset-gpios */
+			switch (i) {
+			case TC9563_DSP1:
+			case TC9563_DSP2:
+				err = regmap_clear_bits(tc9563->regmap,
+							TC9563_GPIO_CONFIG,
+							BIT(i + 1));
+				if (err)
+					return err;
+
+				err = regmap_assign_bits(tc9563->regmap,
+							 TC9563_RESET_GPIO,
+							 BIT(i + 1), deassert);
+				if (err)
+					return err;
+				break;
+			default:
+				break;
+			}
+		}
+	}
 
-	return regmap_write(tc9563->regmap, TC9563_RESET_GPIO, val);
+	return 0;
 }
 
 static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
@@ -395,6 +414,38 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
 	return 0;
 }
 
+static int tc9563_pwrctrl_parse_reset_line(struct tc9563_pwrctrl *tc9563)
+{
+	enum tc9563_pwrctrl_ports port = TC9563_USP;
+	struct device *dev = tc9563->pwrctrl.dev;
+	struct device_node *node = dev->of_node;
+
+	for_each_child_of_node_scoped(node, child) {
+		struct tc9563_pwrctrl_cfg *cfg;
+
+		if (++port >= TC9563_MAX)
+			break;
+
+		cfg = &tc9563->cfg[port];
+		if (cfg->reset) /* Already discovered */
+			continue;
+
+		cfg->reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(child),
+						   "reset", GPIOD_ASIS,
+						   NULL);
+		if (IS_ERR(cfg->reset)) {
+			int err = PTR_ERR(cfg->reset);
+
+			cfg->reset = NULL;
+			if (err != -ENOENT)
+				return dev_err_probe(dev, err,
+						     "failed to get reset\n");
+		}
+	}
+
+	return 0;
+}
+
 static void tc9563_pwrctrl_adev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
@@ -478,6 +529,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 	struct tc9563_pwrctrl_cfg *cfg;
 	int ret, i;
 
+	ret = tc9563_pwrctrl_parse_reset_line(tc9563);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(tc9563->supplies),
 				    tc9563->supplies);
 	if (ret < 0)
diff --git a/include/linux/soc/qcom/tc9563.h b/include/linux/soc/qcom/tc9563.h
index 0dfd25747b9a..086f37a40d80 100644
--- a/include/linux/soc/qcom/tc9563.h
+++ b/include/linux/soc/qcom/tc9563.h
@@ -13,4 +13,7 @@
 #define TC9563_GPIO_EN0_OFFSET		0x801208
 #define TC9563_GPIO_OUT0_OFFSET		0x801210
 
+#define TC9563_GPIO_CONFIG		TC9563_GPIO_EN0_OFFSET
+#define TC9563_RESET_GPIO		TC9563_GPIO_OUT0_OFFSET
+
 #endif /* __QCOM_TC9563_H */

-- 
2.55.0

