Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82046AF31
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846240; cv=none; b=Lw8sbVW4dWYT2MKkfu0BO+lKRYIhA4Awnhm883X1zj/d/W4RZJpt1zzz2KX60464JuLkmNEoNqCy+r2rkQ1ogZTezUKBPBBoSPuxws4DJvJuGXWGLL7KgFfrjBPW3W+cKU1WArHflZdVQ9/fSdxQuuMJXLavOWgLm8SkZr7OU9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846240; c=relaxed/simple;
	bh=t3qExvvehHne3DGPiTuwj1nj3sEKbHg7NRpHscaXsag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVwSI2ralz4rV0kKKFFgVwjYSuEVQM6pkKcCo6EeVOtnWXVfeScbkbiuw+rcfNkOs9sYt171aYvBGcVZwlgtNYkn9QAvRrR5FwPVVYnprtIEHS7rXiTseXIwGeBHOTjZOl+YO+XlSItIgjefT7MlgtsFRkO9oJWX92wTwMSlD88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCyjYy40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CICeiZTy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCyjYy40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CICeiZTy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHkfOp2631618
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoAFJhDFaoYNFe6KuyZHoEL7dGndbuJXxfS0b/1jpj0=; b=hCyjYy40zc/VSfH4
	KaddSYfOljjRIVy41oBDdSDdrQKYC38VeGR4ByBa5tAq+Ju5Ay1IzmMHNlpTTeoP
	6W7uJXIqb7OHwnveefHTOqgHUb913NR7bvFR/0EgXIuviy1f5ufFkSTJ9nqeVr5O
	sdETUcihsnC35xyvmWngYmXQCX8Kjcnid19suCLZYP4DHCB2TjOcCnk2zPrZ2XKe
	rpPKIYYbwuvyWB3OFhdhYIk/jZ+KAQRsYZmucKsg0PKYbSvjlaCI9utuU7DTBUA5
	/25wxMNcNCq3bjoRh1gOSzBSP6vyb9UHKrNVtCMgW7LE5EeoZLFRGf/6s+BbWN0j
	iPvxTg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd0tgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ba395b047so2545630eec.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846237; x=1783451037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoAFJhDFaoYNFe6KuyZHoEL7dGndbuJXxfS0b/1jpj0=;
        b=CICeiZTyxoc5/qiVeCHi5Dsc1vff1YAFtjxxJFDGgk29woBGylRgVR6ABOtQ+mNEGO
         zgrngVgQXHGABZ5yRPTXBhm/UrHJyjU3Jg40MoTXwCMocVH8LOp7qyWxPxeGg2zRBKbP
         liYDa8vySADCvfNtzG+wx2Kq3ZspgBCGHq7gZNo5hpyHxtpyza1IN/dLA4LG3y91zNwu
         LXfXKrS1EBmkGHwtRoJOlqMzMFPwZft4Y97T0yfLD5zLDIBIpk/s4/YGFTSB00iHHYJV
         jy9Z0KTNzOBK8jpWFxW3vk0yIaFM1ijnZqsJmXqbzBbu48hzd50NE86wRIqTU9aILzGv
         1WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846237; x=1783451037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hoAFJhDFaoYNFe6KuyZHoEL7dGndbuJXxfS0b/1jpj0=;
        b=qQCSbBBBU0PtCeHd1bmwSAcc86nZPJTTWWH6BmN3lnil4csmPBvULbT3jtwHcqhLGn
         IRSkyMyiwPjZKdh3FCSkxwjiPnZy/a/xZxbP8STOmxso4sWtiwPrr7NGymz8TFXeFlfE
         yettYYxnCrWkIqUfyf5KAS3Png0iZD8uHUc3DoeZe+RfH/KBVXTZ0qWzvVK9dy2DoOzC
         9P7+XLuusIdN9KptYLT8aPNlf1ZHpgRnTwk1lcfbzkXWHDGhdR3pywL4J20qc3CnYuCo
         pCea0kBcjuTDml9EWjaspJ9qTVGImTkTrpNV66FMmBb07PvsBe5MWbKg7llImRy1jomU
         BnrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpdb0sPk280QSLn3oH//pwlOyVmM+f9xfBjn48SymsJZ08XrUt3k1lypYf3mdZjBP6D9Hcqo0CXIbEF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7cOmOZLIpp6zcJndlPisJNPmfhkx/jz0qZsJp8Hlxa+vRLPhD
	UqNskvN0AM5lB1IBsT34knZ0AJFydo1boMpbVDMM9x3yxDmnexM3S6yAhdpYndoesyzpQxT1JuD
	z3ksuhj00TH9JOfwclLnIgctMnSci2YZra/EE4z2FR8dmnOSPrX8vk7v5TwuCuMLt
X-Gm-Gg: AfdE7ckqhuMEsTJYYVx39YtXRxBdmmdkKo4EssA3tKRGxoXM1dEDOpk5QcbVmK/R3qS
	bMJGsAG7YorwmvO/fx10sVIzF5YuJxxU48WxWFzibvYqtol8mXSjyoPYHB11NHfiQ3+BRV7C0rK
	XeSGAVP6C4MCEHBY7TfnJ0zKdc5nGMiAo2pMO2mg0rD8h3/VGmxtqEBGhvw0TYRBzJW8oYvFvcK
	RzuymBGNFWxBZ0v7TXPX1nOGkx+MpLUhGIXCOvhJFhTqNtW/ypY2f2c0z8bYEwTBPN2my+ctYJ1
	Fq5KiLUlwrFCp9DJQt76I/FJIV1ED0IokuMADVAh4ftqnbX9+hA7IpIRe2KOQNWrZ2YSpI1uIQY
	HC9PRmGTgdtQ4I+4x67XBtI2uhv2CjFPmm9IVwj1VvqOTIow=
X-Received: by 2002:a05:7300:dc10:b0:30b:eb75:8a5a with SMTP id 5a478bee46e88-30ef0929c37mr1293400eec.25.1782846236473;
        Tue, 30 Jun 2026 12:03:56 -0700 (PDT)
X-Received: by 2002:a05:7300:dc10:b0:30b:eb75:8a5a with SMTP id 5a478bee46e88-30ef0929c37mr1293352eec.25.1782846235694;
        Tue, 30 Jun 2026 12:03:55 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:55 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:48 +0530
Subject: [PATCH 6/9] PCI/pwrctrl: tc9563: Add API to control endpoint power
 and reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-6-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=7032;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=t3qExvvehHne3DGPiTuwj1nj3sEKbHg7NRpHscaXsag=;
 b=P3CTnGwYJ+buMH2sHYEhz9nGYIDn5Yv1am9Vm73vD9wBO3z2k0en4IeOHe1HtqpW7+0hfc6Ou
 fe5OHRk9timDAw7nZq4NGYufhQQC+SnoycknfDSOly6itHJiSfQaN7d
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX3fr+bczj0xIr
 s3nkWExTjGA5U8iEE40vCjZjpFwWx6/LLQFZ9X4SQFRavEc+KBXKfHjuALsIkpa+3JYsJswKAmd
 f9spUaLT6BtCG/KmeY4YgrqIBUEzPG4=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44131d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0i6Wl48qgBbC6S7HcagA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: CGRzSVOt_B_SOgqPGiOinh4hqpp67eUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX0vhODTfhVlHE
 JZ/ZPf1eMu+IuMaKqJLGTvZ4/Pu35M8T+2x1hN545wFQm7CtwOiSrAPcka+PMqhokP67734OwXs
 oZfqjd5amIo5r8YxK19DtQ476GLWjb3948jEnL0vYUcgT9PW3yK/46DM0fvFMO84QYfbzPHqG6+
 P+4kxzoOobVDfxM/JPAFpVTR/jv14UuI0VzhkcM4AkUUJqljnmlrCZ7CrR1vq3aWjWlnpGiG/L/
 gkhIOM/A1BmIp6VMtGlYh6VuN6s2k2g06UXjKAJqcz+6tx8UhMKgxOt7NuLafKT2WVJnaQ5fzpK
 YKPU9cwCHuu/OpmoHK4zlgSDFr2N+nMETeJVwQ0zU/38G4UL+f/i+rMe3MsOwgN0ZrdoCZimS1C
 JwVFADe4bjxHvJ/RiB9xn4xVbfO8hzRG9txlRW8QIA6075Ml29lL5uG9/nk7WeciwQM9mPL0iDb
 djkEYNj7WDeEBXUDkQw==
X-Proofpoint-GUID: CGRzSVOt_B_SOgqPGiOinh4hqpp67eUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300182

Some platform utilise TC9563 GPIOs to enable power and
control reset of endpoints.

This patch adds support to parse endpoint reset and power enable
gpios from each TC9563 port node in the devicetree. To configure
these GPIO's during the POWER ON sequence, two new API's are
introduced: tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset().

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 152 ++++++++++++++++++++++++++-----
 1 file changed, 129 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 1555e8a9b3ca..de68b9836645 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -62,6 +62,8 @@
 
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
+#define TC9563_GPIO_NONE		(-1)
+
 /*
  * From TC9563 PORSYS rev 0.2, figure 1.1 POR boot sequence
  * wait for 10ms for the internal osc frequency to stabilize.
@@ -91,6 +93,10 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+
+	int ep_reset_gpio;
+	int ep_pwr_en_gpio;
+
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -256,6 +262,89 @@ static int tc9563_pwrctrl_disable_port(struct tc9563_pwrctrl *tc9563,
 					     ARRAY_SIZE(common_pwroff_seq));
 }
 
+static int tc9563_pwrctrl_ep_pwr_en(struct tc9563_pwrctrl *tc9563,
+				    enum tc9563_pwrctrl_ports port,
+				    bool enable, int ep_pwr_en_gpio)
+{
+	u32 ep_pwr_en_gpio_mask, val;
+	int ret;
+
+	if (ep_pwr_en_gpio == TC9563_GPIO_NONE)
+		return 0;
+
+	ep_pwr_en_gpio_mask = BIT(ep_pwr_en_gpio);
+
+	/* Set TC9563 GPIO as output */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_GPIO_CONFIG,
+				      &val);
+	if (ret)
+		return ret;
+
+	val &= ~ep_pwr_en_gpio_mask;
+
+	ret = tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_GPIO_CONFIG,
+				       val);
+	if (ret)
+		return ret;
+
+	/* Toggle 0->1 to enable power */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_RESET_GPIO,
+				      &val);
+	if (ret)
+		return ret;
+
+	val = enable ? (val | ep_pwr_en_gpio_mask) : (val & ~ep_pwr_en_gpio_mask);
+
+	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_RESET_GPIO, val);
+
+}
+
+static int tc9563_pwrctrl_ep_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
+						   enum tc9563_pwrctrl_ports port,
+						   bool deassert, int ep_reset_gpio)
+{
+	u32 ep_reset_gpio_mask, val;
+	int ret;
+
+	if (ep_reset_gpio == TC9563_GPIO_NONE) {
+		switch (port) {
+		case TC9563_DSP1:
+			ep_reset_gpio = 0x2;
+			break;
+		case TC9563_DSP2:
+			ep_reset_gpio = 0x3;
+			break;
+		default:
+			return 0;
+		}
+	}
+
+	ep_reset_gpio_mask = BIT(ep_reset_gpio);
+
+	/* Set TC9563 GPIO as output */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_GPIO_CONFIG,
+				      &val);
+	if (ret)
+		return ret;
+
+	val &= ~ep_reset_gpio_mask;
+
+	ret = tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_GPIO_CONFIG,
+				       val);
+	if (ret)
+		return ret;
+
+	/* Assert-deassert endpoint reset */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_RESET_GPIO,
+				      &val);
+	if (ret)
+		return ret;
+
+	val = deassert ? (val | ep_reset_gpio_mask) : (val & ~ep_reset_gpio_mask);
+
+	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_RESET_GPIO, val);
+}
+
 static int tc9563_pwrctrl_set_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
 						 enum tc9563_pwrctrl_ports port,
 						 bool is_l1, u32 ns)
@@ -400,28 +489,17 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
 					     ARRAY_SIZE(nfts_seq));
 }
 
-static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
-						bool deassert)
-{
-	int ret, val;
-
-	ret = tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_GPIO_CONFIG,
-				       TC9563_GPIO_MASK);
-	if (ret)
-		return ret;
-
-	val = deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
-
-	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_RESET_GPIO, val);
-}
-
 static int tc9563_pwrctrl_parse_device_dt(struct tc9563_pwrctrl *tc9563,
 					  struct device_node *node,
 					  enum tc9563_pwrctrl_ports port)
 {
 	struct tc9563_pwrctrl_cfg *cfg = &tc9563->cfg[port];
+	struct of_phandle_args args;
 	int ret;
 
+	cfg->ep_reset_gpio = TC9563_GPIO_NONE;
+	cfg->ep_pwr_en_gpio = TC9563_GPIO_NONE;
+
 	/* Disable port if the status of the port is disabled. */
 	if (!of_device_is_available(node)) {
 		cfg->disable_port = true;
@@ -436,6 +514,18 @@ static int tc9563_pwrctrl_parse_device_dt(struct tc9563_pwrctrl *tc9563,
 	if (ret && ret != -EINVAL)
 		return ret;
 
+	ret = of_parse_phandle_with_fixed_args(node, "ep-pwr-en-gpios", 2, 0, &args);
+	if (ret && ret != -ENOENT)
+		return ret;
+	else if (!ret)
+		cfg->ep_pwr_en_gpio = args.args[0];
+
+	ret = of_parse_phandle_with_fixed_args(node, "reset-gpios", 2, 0, &args);
+	if (ret && ret != -ENOENT)
+		return ret;
+	else if (!ret)
+		cfg->ep_reset_gpio = args.args[0];
+
 	ret = of_property_read_u32(node, "toshiba,tx-amplitude-microvolt", &cfg->tx_amp);
 	if (ret && ret != -EINVAL)
 		return ret;
@@ -478,18 +568,28 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 
 	fsleep(TC9563_OSC_STAB_DELAY_US);
 
-	ret = tc9563_pwrctrl_assert_deassert_reset(tc9563, false);
-	if (ret)
-		goto power_off;
-
 	for (i = 0; i < TC9563_MAX; i++) {
 		cfg = &tc9563->cfg[i];
+
 		ret = tc9563_pwrctrl_disable_port(tc9563, i);
 		if (ret) {
 			dev_err(dev, "Disabling port failed\n");
 			goto power_off;
 		}
 
+		ret = tc9563_pwrctrl_ep_assert_deassert_reset(tc9563, i, false,
+							      cfg->ep_reset_gpio);
+		if (ret) {
+			dev_err(dev, "Assert EP reset failed\n");
+			goto power_off;
+		}
+
+		ret = tc9563_pwrctrl_ep_pwr_en(tc9563, i, true, cfg->ep_pwr_en_gpio);
+		if (ret) {
+			dev_err(dev, "Enabling EP Power failed\n");
+			goto power_off;
+		}
+
 		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(tc9563, i, false, cfg->l0s_delay);
 		if (ret) {
 			dev_err(dev, "Setting L0s entry delay failed\n");
@@ -519,11 +619,17 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 			dev_err(dev, "Disabling DFE failed\n");
 			goto power_off;
 		}
+
+		ret = tc9563_pwrctrl_ep_assert_deassert_reset(tc9563, i, true,
+							      cfg->ep_reset_gpio);
+		if (ret) {
+			dev_err(dev, "De-assert EP reset failed\n");
+			goto power_off;
+		}
+
 	}
 
-	ret = tc9563_pwrctrl_assert_deassert_reset(tc9563, true);
-	if (!ret)
-		return 0;
+	return 0;
 
 power_off:
 	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
@@ -601,7 +707,7 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
 				port++;
 				ret = tc9563_pwrctrl_parse_device_dt(tc9563,
 								child1, port);
-				if (ret)
+				if (port + 1 >= TC9563_MAX || ret)
 					break;
 			}
 		}

-- 
2.43.0

