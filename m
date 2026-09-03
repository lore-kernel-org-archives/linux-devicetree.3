Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9303C9EE9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422031; cv=none; b=Pr6wUmFDjScwFZa+R17D0OtkaLpXYe86PNCBFnQyqJHqmjSr0PsmR2ZdhQYqdiG6sU/J9QO7iM6Ml3chhfQtCuV+Gf+Ct253fUoEbPk+zlp3HYK3g0xI2WV/QIsIWj/VtJHr9KgwhfusnxYnPTzJ/l+drXyS7G1CKUPcK+HdS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422031; c=relaxed/simple;
	bh=CHcwrnk7BqNNtDAcRCTciVoNcRDgyYk3W4FG/5/vVF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6IMxPAo4ZU30RRH3TtT4KEyNAiDkSJfsq6ZX3fzm4W7m5mD49MAwqavReYbv6FCPfYDWwgnGKzM/4b8u9X5MSetK3eQKZf/BJEor5lnRswsv5y1nxE4JjJWraTuBlz9BRrAngiFfKoKalb9LvUx03HQanqNOaqtKRPs9GMoj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed9KUjRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuMzWG7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed9KUjRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuMzWG7M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lws44024082
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yI6GCRP4sRLJedMdgEEQEAys0x4qhVAXlCoFVWRK8fk=; b=ed9KUjRJmn0LJIOb
	ycJoU6XH+g3MlLkvgflGzxIg8yq1B29psQNPHhoOlvqCLfAjMFE1TNaFc+GwnJFB
	4fYHJUSn+6n4H1VZWSDStJW2/SeseG4BTK2sWnX2mXHsusBPUHYOZYl7G1ax2kEB
	wJUf9HDJZawe3F3KqLz8U5hdoaFTmP9Dv19H72hdY0+QZFNK7kgPui78fdi+2Q31
	LpslEAL2PFL4XnFA7ErTWpxm1rcUAGP7g6sJjmrjTqNSw3pDFojzuw+iX0p1H+1w
	rjcBqcMK1IBauUVUp/jhmblrv2Me019BsJeFjMVKaJpTfyDColm+yqQUZs5HjSua
	B7Ei6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc2w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:53:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so391522385a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422028; x=1789026828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yI6GCRP4sRLJedMdgEEQEAys0x4qhVAXlCoFVWRK8fk=;
        b=XuMzWG7M5TEaDKbJL+mvK3wQuUFL+OKgr1QdAhI/3k5KBsjaVGovWA0+m15+f+cQ6T
         GD88p4peKaPdBsVZcilaNnNsTJ1ihXpN6+orNFcUidM+QHogLmrV2QrkGi4BJa8uSmww
         Z1xRSr8Cee1GFlN/vLndlAJhYXJIUgsAW8vVXvFPJ6z7ULzpNpeRzDuLO2K5uqd4qn+2
         CWp9z9Bx08vsW0pyWRWPqRWDpDFG8HyDDVX2zYswpOV4ZyJ6pbjireXhSsb48pOH67Bs
         qU+f6LsqqnBM3VvwJWr6FQunQbOCOXWawvkTMKayVZNkn0m6sjxQOsXmHtH+t81om8M1
         9jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422028; x=1789026828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yI6GCRP4sRLJedMdgEEQEAys0x4qhVAXlCoFVWRK8fk=;
        b=Z8nmlhijp/PQoFLudDj/VU1iqqwqYmiej/7YufTfHlwzdxH2aJ7fzxT2721oSqnXAG
         q/alymCXRPkd3NulKI+8HuKS8Nx/Svod9y927uIFxnSa6+pxAJYXT/k+KbvD/lUGTXP8
         ThIiZtE7o5ofB+s33gWYXcYwGichFjz3Ls2R1dgIRBlyjksv6yFM8Cx9b0hSvuHPS+2D
         SRLyV+kNUWwQIziq79Em2OYJGH4MRgmP+6CREYBbOq9u/9nVbD3X7wEHPkzknmc/TLwt
         EVUqf7E+k46ay9WLa45rEB4aS6POhEXQ93W98BNeOrozWcOAZAkiHVGW6PE/t4fh8X+3
         s0Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwy/PKQxe1ioYHlKMXruwPIvO1Qe+cgb8+ULYP6VboClBlMeQNrsK3X11705SZPKFQuQAC9WPH7TKMW@vger.kernel.org
X-Gm-Message-State: AFuF++mRiR8SRFZCfetiRpwTDlljre5tDEEH9F4DK5c/vJuA/QA/Aidz
	eqOTdXhHruACyzHDpvzUKWPtqgTi1wz/zUbZv+EL3t/mpLvcb0JPKSFHz0fXdC4S2D3fWmaP3LS
	m6eVUc8kyfsBWjiLGYBaU0uDGu4pNsi1L/4gY5sEmmkZ1EL8MWty7y/pczyX3hH20
X-Gm-Gg: AYBFou3FXPrLshgAmfXNvG8hDItgLnslFKY8hfLDWSkrROr7MDybnLrW4y/uaE7C1Vu
	cizinUgaUu4RKH4j0TJ3UOgJi6FEpVHm7OSSHYb3WmWeKqVUlD+RMnwTvIrCqcwvUpL20QV7L9d
	qU00/Dug77EBFiEJbVNTWSXMhp6i+JIZMOS1I9JTAybKT8VLjQWfqlkCfGToJfoBCtQ00w/MLcz
	BQZ2qYGk21BhquTyg/0rq7J/k+ZCveS5lEzYm0bKVId9BVRjKvl6PNR+dKTmOA7FGRDfF0wCAYH
	xsoDEXKb0n4DV9g2am32jMwGDt19P1Ek2TnwN0faQW0YrdGZfFJ+uu24X9uLTt7AHZDfy0vbxVY
	0+dy4h8lvCN2ZFA==
X-Received: by 2002:a05:620a:2590:b0:939:6df9:6546 with SMTP id af79cd13be357-9396df96ee3mr521401085a.50.1788422028102;
        Thu, 03 Sep 2026 00:53:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:939:6df9:6546 with SMTP id af79cd13be357-9396df96ee3mr521373685a.50.1788422022926;
        Thu, 03 Sep 2026 00:53:42 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm12697054f8f.1.2026.09.03.00.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:42 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:53:00 +0200
Subject: [PATCH v2 4/5] PCI/pwrctrl: tc9563: switch per-port reset to GPIO
 descriptor API
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-pci-tc9563-aux-v2-4-34c625b542c1@oss.qualcomm.com>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
In-Reply-To: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: B5c2CSSExJd_PLRwdilZHt4GmTK1qomv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXyqMaR6LtvpXT
 9OaphANRjGvaFHwquucv42ZS4ViKn/zJxpOVt3GPpV03k9QNLkEt4fTBqmLa5WlHm7z/CZDkCGP
 6MFEdKc5fpcc0THdin6iFD23y+MeUODIQ5JvGXqfAzPoJIi4Wf0bqnU7vN3NdXKn/q09qcqzCVK
 EvrPG/eWWCJtaPvvXiRxAHNOTFgqgwMPhPwiaLISMlIpGYb4y/3wSfM/dWndmCHTrcSt+1oc+J/
 SYdYygSZuGkKcLEFxAcFmlRB62rf2mUcV4lr2EFEUaBCArVT8H3Yo9CDLHCs3fOIvLKfz7duKph
 6rtsQaEtug9alvtQ2LYWXPLWMi/6wqq3YszBUED2O4Xqwcbywuymsijgvp/P5Omer9ArC94J4+K
 McGRAhG/ofiHtajCo8ZxIN+EJNL2PbJSmbRD6iZxxWpnxwNg+uI5jxLwWA24rp7hY8khgxxcaXn
 pqMAAswfaEqA1ghwEuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX348xNdX497br
 DsbFKDMnABxIE4PshPn2HNdHpU3XqUQia8wJBHa9azDLURPmXdpFyXfIyxKTwTsYgZQ83YLF+VZ
 DXRNHMZQXoVqt3kgY0wSmz7xL5eflaQ=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a99278c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=viGhCAv9QodxNsH3n2EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: B5c2CSSExJd_PLRwdilZHt4GmTK1qomv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
definitions, which are no longer used after switching to the GPIO
descriptor API.

Replace the direct regmap-based per-port reset logic in
assert_deassert_reset() with gpiod_direction_output() calls, falling
back to the legacy regmap approach only when no reset-gpios DT
property is present for a given port.

Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
PCI downstream port child node. The lookup is done lazily at the
beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
is registered.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 +++++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 6df512d78b54..09ab4718db8a 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -57,9 +57,6 @@
 #define TC9563_POWER_CONTROL		0x82b09c
 #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
 
-#define TC9563_GPIO_MASK		0xfffffff3
-#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
-
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
 /*
@@ -85,6 +82,7 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+	struct gpio_desc *reset;
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -349,16 +347,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
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
@@ -393,6 +415,41 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
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
+		if (!of_node_is_type(child, "pci"))
+			continue;
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
@@ -480,6 +537,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 	struct tc9563_pwrctrl_cfg *cfg;
 	int ret, i;
 
+	ret = tc9563_pwrctrl_parse_reset_line(tc9563);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(tc9563->supplies),
 				    tc9563->supplies);
 	if (ret < 0)

-- 
2.55.0

