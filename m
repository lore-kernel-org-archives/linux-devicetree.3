Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB0A4FDE6C
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965824; cv=none; b=qci9iG6ebrRBPri08TD4NItAAYwf8KSThHAzz9+OfkOQaYey/4x6qapDZo2XB5vDTBYTyldg5qx655N+sfpgBhIebBiL9QBjo7kkzEDmmmhUb5lm+RWpB/S2rcBcErM0frq6NAsiksq/KvRhAXSvPar65/CqaaraFUo5km2jLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965824; c=relaxed/simple;
	bh=yr7zxykqaTEaqzdPRUQ5MNYO5+hsegnlEgHIOVDefkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3pmEIf++LJDYO5AcolyWhZK5I1m2sMCQmimZca3/8fbbKqf73gVtwK+++wy4qD1RzJ2rG8b19HPqLyBu/JdT8E6vSG41wool3Y798wmU++ogOsgGleXdEha2nrOe/kuw+4BXrqQ0AFPaiN/X2eJNMFPL3wS6yxslaM4KoOXCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqBPnfhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZgf63cG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqBPnfhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZgf63cG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIQUt2080970
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRt8wHoXcNopaXjD+865R32+7CTYvwmYmsu8jeufAWE=; b=IqBPnfhnHE7adOfO
	kBt04nuTYV7puM3zUBtUurw3QH6K0IR4eiCUu942/pcIg+3cu0yQpwW2zkarIXWt
	cjl6pXlM+fKmDg2cZ94PYVHCQlFHuz2tWEDBehkIQ97KAHSW0eO2ukqLGRnSJR25
	9z+ygs2psBxUkZLcudSOUeWkBCkV+c7tfRaqkpRDEw9U/jfp9bhcSTlsi0xKOZpa
	jBeZbiabRCdZwQmoYD/iNcEL6nY52iHxQ7zoUToV01aybK9wgA0zmsZ/7CP7c9h+
	Myo0NbI191Vcy8e5nGlYgXXKi6aAZqOnCdg6PUqeZiVvgHwl7ZazNywRqBmcRGnK
	F79h2w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r0fs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:57:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7828cdd1214so674794137.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965820; x=1789570620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRt8wHoXcNopaXjD+865R32+7CTYvwmYmsu8jeufAWE=;
        b=hZgf63cGspSN5hXM6vRhqxEkoQX59ANh94BFrkjdKVwtPBjZPHsd89eHcri/NkJkrf
         nu/uUxXVigsqA0D5E5J75Omb1feOneOgcxRkAgy0TQDdirNKiD9pRoCb7SIdJw1Nzn4l
         on6RnL9/ipqLIOdo8C/500xY5EC6fcUJHssFnhJ1ZzGLlo9AYV0YWd8LKtpRDU0TA1T/
         Wk+FkNt06OVH8QydTNEXjzowglQuATbxiehWgrhy90A3wQeIoW5MWyD+qpxDRY3YNByu
         dtYgAbYWUsc8A7xla4MAeKcKReO0QS/zvFpQMmjzj3X2c0/PqL3sboHxYggRry9tutSm
         yc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965820; x=1789570620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRt8wHoXcNopaXjD+865R32+7CTYvwmYmsu8jeufAWE=;
        b=oxFOW6hzeexETbYaGEgOMLdi6GU3lAiY901vmp5CY+PQuRlZCj8T3oPY2gh9dJMUKQ
         J6euCWE+GpiyPiwBbkY/BnHoG9WBKk24/1hgXeEtnw5mCyGE4yrcnsENWLF1cPh0tqrE
         2HGkLJjtY+/1NPajnVXjXrjzVbg31pBhWtc711znzTcW3lJplc90xp5NPcguwJnahtn1
         Lb1UYCKsQUlv4fuoqI1SDhwQV2DyeU6PiN0ZFPbfh1B/LbZO1jrVSlSWAIkGGvvikicD
         ccGb8hqlcDd4IzzdnbeaacIG9ZcmgIkbKPHS7iIPOSKKZ/jyz2fK/b335Gx1ObGNLTKx
         4e9A==
X-Forwarded-Encrypted: i=1; AKwUvBz1Jx5xdTAvPFoQL9MzVmwMb8FOkQly/hlb8wuj7lfUEDfRkcoyXnQsnMoDRzRTIpfimTalD7xe67Q1@vger.kernel.org
X-Gm-Message-State: AFuF++kxxcC84xgxC3kGAEPxfCWglQh/4b9Hkz5V1qtnunbtwPdgD095
	1pv6r1WQpYHNRCdvgdT5j21CODJhu7/VtM69GWZrddBv0SKSMNToSxZqEmEQ3jMG9H2upqrYdIj
	9JpmqBat7UVxPilKnUJEtokcoChOqiA/Tu1ZshXJKaJn+35l6FTjZCEk6a2vVhZP8
X-Gm-Gg: AYBFou2kWRbT/hsAPctllmw4tUncRvzZz1l8acexBiYRMoOYshvQfZ9VpWLR7M1nQip
	urh0UnbXteTwhcVyruysF/nKn/uxPoXR0N53s6rXfV4qAC0qGQQ4FrUBL0mOKwOuoABRz1OQKUR
	r+wAJj3eAUkWobRYoKSwRx/E3crGNAOxzTpEa6dsZDf6NPm5+Gtb8f7YFgvXzlk69wjuBH1CNwE
	JstiCAZytjTyhUnvW/xoTg+B8JXm3YOghE6AFhNQ0mvtmGs8eHXJcflz/SrcR2+lL4zF9xxhv3i
	99qkbQXbrII9UwoUvSYZdSz6xCv3p45R2tIOGW6oJsODC/u50JK5wCWp2v1+vH1X/irHddHxk6Q
	WhuA6nOOWPg1rRg==
X-Received: by 2002:a05:6102:2925:b0:785:ac20:bdc4 with SMTP id ada2fe7eead31-78a4aa0796amr14035567137.10.1788965820439;
        Wed, 09 Sep 2026 07:57:00 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:785:ac20:bdc4 with SMTP id ada2fe7eead31-78a4aa0796amr14035531137.10.1788965819950;
        Wed, 09 Sep 2026 07:56:59 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm560702895e9.15.2026.09.09.07.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:59 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:56 +0200
Subject: [PATCH v5 4/5] PCI/pwrctrl: tc9563: Switch per-port reset to GPIO
 descriptor API
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pci-tc9563-aux-v5-4-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa173bd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=Vto0WN7G90g_gJJAuHcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX0WE+GeDN6Nw6
 Qi4NEiXoBJS0tWFmN4jrS/U0b5ELzAvBKwy9RsiBsWjI7dCRre0gIiPip8loporEjinGKftXGRF
 gNH+7xjqT/rGwsFIRnNHx/9exV5+ITFHBE6Ef7DTEY/qdJUuL9kEfTex6LSxMykk5izipLWyrZa
 QwYpIrtpFQZRsx1uaxsu/UE5I9ZyGVAqKiifmUcOfnqUZkgFGMAY7HvUMn4+UGi3GTXGKafNeWZ
 nhPrsXFsZ6UnxXrkIANQ6w5g2L4eDWP/hmHnvS5MigCWdIOTUtj9xWuGYccIUso11Pf4mj2jryo
 udxO852zlkMS1zsv49Ihf1/VzMUlQVcVKU2VF4gE2jPXYWE74fnu2fU6Jn+yYZBePsP+duLJ/WI
 aBEO3v6nPYe7TG5N0HDvkIzKhfkOCGlQm3nDUjndpa2r9+lx0HzMxqfU03Jv+Np5Ry/4EH0EkVT
 CtEqJEUJf6M6MNa9rJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX/mrpzyE3DifY
 dURyr0aoBr+Hp2mStIH8MABeXs7LPSZfJ2evoz7k4Zy1tasKW6Bplozc9vLUjvssrKo2yZMFhW6
 3o5kMPyvVdrYRLE09SMLk47VF650MxA=
X-Proofpoint-ORIG-GUID: W43ZIi7ZfkaQSDJusq1Nhrr319kiRtYO
X-Proofpoint-GUID: W43ZIi7ZfkaQSDJusq1Nhrr319kiRtYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090167

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
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 ++++++++++++++++++++++++++------
 include/linux/soc/qcom/tc9563.h          |  3 ++
 2 files changed, 73 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 3fb862105fa5..59bc0d77d3c4 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -26,9 +26,6 @@
 
 #include "../pci.h"
 
-#define TC9563_GPIO_CONFIG		0x801208
-#define TC9563_RESET_GPIO		0x801210
-
 #define TC9563_PORT_L0S_DELAY		0x82496c
 #define TC9563_PORT_L1_DELAY		0x824970
 
@@ -60,9 +57,6 @@
 #define TC9563_POWER_CONTROL		0x82b09c
 #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
 
-#define TC9563_GPIO_MASK		0xfffffff3
-#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
-
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
 /*
@@ -88,6 +82,7 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+	struct gpio_desc *reset;
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -354,16 +349,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
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
@@ -398,6 +417,38 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
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
@@ -489,6 +540,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
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

