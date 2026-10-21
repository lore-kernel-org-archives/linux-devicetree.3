Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590704;
	b=yIpnDOLnYswI7pBU34jep9LXUqzWgZ3bJJgCIDterFQlNt54S7nEBjKWr8ICDlB3dqXA
	 xiVQODFfgp2nkhFB/eydmCWZoK2Tr9YBhXE9x764RhkIUpp8ommCdU7QzYGbOHjQ5boJx
	 G+k5MMRuPxqYfEuIShUvpqGCnLUUjcGAW/oeAtGApfIHawJ5gMuFe78gC7KHl5bDwm+/5
	 c+aD0NwTOyQl0ri2vMaaqZzj9OvXRTlEqhbeawqEifwZAy4GXUReejfaEMFzekc2FrpXf
	 ZIw0BvWwr7yxfeYI1SChUAMaRzGXN/QO7HAk+rRe1brmGj6h4e8l93sfPQ7fw02Zq6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A6HdOEiXNNGwTsccgbIYty8lETuR44TLn/Iqy59Js+k=;
	b=goUMow4FwklJKMELOsKlHdLtkHVCc2Ti13L1d+LnBnImAGLGGLu5wZAvNQCs8LZDqcn+
	 8fD/rWLtzwHVwnhbx8D3ez+9mYN915tdeppGBLa5tygYS09owyaIfLVa5dE+PLnM5jPXG
	 /eDJbgzCxjVL1OaQJeqPBJI8jQT3HCbS3wXykUiebiqR6wJREKgT7V29+lt0BiwDosS46
	 Op1+NMI5WGWBci1J4kh7MZcC74wXZJLyfgds9/3X9qqV1z1aK0IrGjf56YDw/tUpj+9vk
	 9asJcWyiw5WdGPLfbFMve7YNGKVlCOXjAD+K/G7pO1ZGWbNuPmkOYh3RRI1srb+L97w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKg5+0ZU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DSRVI/TZ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5298606A331
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5298606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKg5+0ZU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSRVI/TZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgPsi4168178
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6HdOEiXNNGwTsccgbIYty8lETuR44TLn/Iqy59Js+k=; b=ZKg5+0ZUKItN4MQl
	jd6DvWNlARLGu+LBUHR2LWHb/xsjzDQttPT/Mnc0mEN2bZb/WJRQDIN+01ub8Jp6
	qMSoFXpK8aR62TXUOxn5UCiljxyET0nonh7sQZvIyTONBxrZKMNlS8PxOiuHhs7c
	1481WuaMOzzOZzHPQfHvhRVUgRZ2BqNHP3FbNlOBjpVA+c6/r6imVR6AdCyCyMMq
	1ixZfQVXAtIjTUANaWen3RUHlRhIGqvDwCQqW7AvnMkQguaJJio4wXlzbwdiaFzP
	sVil3VduxM4yvqcI1CUDqiThFP8umBA54bdMSpQHEevCjl/jPwvi1Wv2jMEqGJMx
	S4l+Jg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m7hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-366c279b454so1544454eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590702; x=1793195502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6HdOEiXNNGwTsccgbIYty8lETuR44TLn/Iqy59Js+k=;
        b=DSRVI/TZif+nx/zCTqReqPKw8dsqxpoEgYD0SLHqWEKKDZW3CAJ8ptNo9NDkCCd/CA
         k47720PFVjMuXk5ZzXmyzqZzqjqbtskYJtlADKC0XkbXh1GrnTNxqzPalfGCrj/xOk1S
         1ByyqlL97KwGxfENgWsvXNqWVYQEzmTxmXzKjy7xnnlQnEDXtJZrChYVBelHxjpym02X
         Y41QaFwtl9ISXCK7qw+g3mRXw6cL4buw6z8JnRqNhgSvsGgAZW/dp7UekiHInggU7hmt
         bW/m1Ovcfk+gISUDHJp3ZUYuhPbG466LthxnhJ+4JBYgmswiC/8bMe/+scrxzue0oa9t
         RB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590702; x=1793195502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6HdOEiXNNGwTsccgbIYty8lETuR44TLn/Iqy59Js+k=;
        b=juymET5/4NdXN+GGkNc8E00Bktg/GwcsLmHYeiy/bUHfGaGyY3U3lBh/Susxii+Arf
         UbmZBh2zuOXXvYUtXKF55VyDjSEHIyKJN4Bf9kuXo+SbNvVaraGvqFKJr26VGblSlv6N
         wBwru4BJ1ZcfZ1QAisJHymsVkNMT2MVUb53+mkpEZ2lQUiSUoQwzCAJyP26Cbe7FCWrO
         HwZuGoptNt54tplEnjE9Gs18Q+IIy4DxCDjDuWDvyolsPldMDKX5sbobETHb/NAUDCAF
         ePUDgcvIZBdMZztbzmAc91fJwu3Pn5FVIsse7HmLncCnAi/x8TR3oaiaytm8xaF3KBxl
         meog==
X-Forwarded-Encrypted: i=1; AKwUvBxI55UeOX2iInRGmqcmJByScVMWUHAl7V3qPFa9W3JN9cPjYu/Ovbl1YqbFsTskeggWqkPJcPoTAFIJ@vger.kernel.org
X-Gm-Message-State: AFq9FYK9obwd1h03OLcem3mBbOdr5ESUk8XvAT/6mQ3iSjZVTpoOe4wp
	xXS3CoIkYvyAhbEZsDGpkNCQhS52OjgjzNWgO3dp1BLs+79Yli7wBu6tDvfsuuNZw/VnuYmaHCs
	wzSsQPqGb5StC8rmF46RS/TXYv8LcUOKYIFDgS7sZsqqemz8Wj39qwlxP/ChONNRj
X-Gm-Gg: AYBFou1SsO3WPtNzz2sRVpY0Z3zPVkZBukohKyOTjN6AQlnhZyD8U+zMKw7h+b+OVGC
	K6w1lalYqCdrTk3X/0n5Em5viqWE01CcPBG9PXUS4fFUBZizUfFg17yF9CuHmDUam+qHbvzowzX
	cyDyrL94kEDiKDqVuxRJ3YyfoywMAvNBYA5AYikVFyJFV1ngANkzyH2ke3zQhsxkFlrCAmc1fvG
	TLnoC6NqSOm8xVVGSpLvzHAhxkUSPFsN2egdtyHw9IuD5QQ8eWFpVQme2/ajFVBbSJBWBNOxoIc
	QRrYYn26LqSjHyVOiel4B+HrEiTAc8TQh3OHn7dMcyLq8OYaL09F0/upGt9YxO8osgGPuUISCIQ
	8ZeRj0xEbQZP6UCuvWRuNqkEQg47hWdsddw==
X-Received: by 2002:a05:7301:619c:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-3674d7574femr3257875eec.34.1792590702193;
        Wed, 21 Oct 2026 06:51:42 -0700 (PDT)
X-Received: by 2002:a05:7301:619c:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-3674d7574femr3257839eec.34.1792590701513;
        Wed, 21 Oct 2026 06:51:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm7534332eec.13.2026.10.21.06.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:51:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:21:23 +0530
Subject: [PATCH 2/3] power: sequencing: pcie-m2: Add support for PCIe M.2
 Key B connectors
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
Message-Id: <20261021-pcie6_fix-v1-2-ad37134c35a3@oss.qualcomm.com>
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792590686; l=5232;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pVhUYhxs6KQ1T/CI44JRxbLe3qLaaRGFuWNum37M39I=;
 b=VQW3OX2obJt4ghRsMP4Ee8708R8JZJPwdoz4zISmNpz7bXgo6m6qDUApCttZOVfAWygfrUufB
 WCZBwE300rRCsIc/JIVm8Sju9Yug+3Xy/c/srO5U8FVdDtNpyow9gZm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXxepuBHZEI/XY
 bTbMAx1xuBewAFSZucKzm+N5PWQSFkoaID4ofkfaT98ZFEXsXcCwMB9tXl+K5wCuCgUMY5UAgnx
 zPXscAF1e8yfjQd5NDt/HVHQiSdJbTpuRtSQDEzpzLa26nB/o4IhqRsi0jo/iGXV9OrpcD4EDHF
 m+Tazq376tkjLDbKZwSi8RGwv8k8XKhXa6ySUBYx04eeI40Jilpje9St80YCsTkvKiSWoL+RC7C
 d1TdEZHuLGqQunuVlgO4Wa64yMN+L/GRh9HARBMV6FPjv0XMTNUJuaQAl0yrEwdqqIldSYIjkSW
 5+p/BDjjF8j8/fgA45k2pywHxW4ZCRVSe++HGpbUpdHdz2GSnkRZXpnRBQidRJGY0kmzffrItUY
 qyn+cN42FLuyej2LNW7jFdOGK59jT3MpZQDDzal1aSwYcZpCdyqhEK20WxNgREklB6yY9LArcuo
 E/QNFdg6BueF2d+nx4A==
X-Proofpoint-ORIG-GUID: fN3MEmR3lLQFCWS5ZDIzbwVX5h2OagUh
X-Proofpoint-GUID: fN3MEmR3lLQFCWS5ZDIzbwVX5h2OagUh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX4zbsOJEJBs6L
 rhN/t+rbObh8m66sAatm98o91V+pvAFeYRUFD5K0GlA+GDnDF2bwc9HUnIGkhOCk1NYFIiuebeS
 fwYwcKD86qIXULAfR8vXHC8mU0wSzbA=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c36f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LWHI3qZMtzRrPHsxVWoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

Add support for handling the power sequence of the PCIe M.2 Key B
connectors. These connectors are used to attach WWAN Adapters to the
host machine over interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB
2.0.

Currently, this driver only supports driving the 3.3V/VBAT power
supply along with the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1#/2#
GPIOs as a single "pcie" target, since Key B Adapters expose only a
discoverable PCIe/USB interface and no non-discoverable bus (unlike
Key E's UART-attached Bluetooth device), so no serdev creation is
needed. The optional WAKE_ON_WWAN# and DPR signals are not currently
supported.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e42e85f47629..62185bf30d73 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -39,6 +39,8 @@ struct pwrseq_pcie_m2_ctx {
 	struct notifier_block nb;
 	struct gpio_desc *w_disable1_gpio;
 	struct gpio_desc *w_disable2_gpio;
+	struct gpio_desc *full_card_power_off_gpio;
+	struct gpio_desc *reset_gpio;
 	struct device *dev;
 	struct list_head pci_devices;
 	struct mutex list_lock;
@@ -111,6 +113,53 @@ static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
 	.disable = pwrseq_pci_m2_e_pcie_disable,
 };
 
+static int pwrseq_pci_m2_b_pcie_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	int ret;
+
+	ret = gpiod_set_value_cansleep(ctx->full_card_power_off_gpio, 0);
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
+	if (ret)
+		return ret;
+
+	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
+}
+
+static int pwrseq_pci_m2_b_pcie_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	int ret;
+
+	ret = gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	if (ret)
+		return ret;
+
+	return gpiod_set_value_cansleep(ctx->full_card_power_off_gpio, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_b_pcie_unit_data = {
+	.name = "pcie-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_b_pcie_enable,
+	.disable = pwrseq_pci_m2_b_pcie_disable,
+};
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
 	.name = "pcie-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
@@ -140,6 +189,11 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_b_pcie_target_data = {
+	.name = "pcie",
+	.unit = &pwrseq_pcie_m2_b_pcie_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 	.name = "pcie",
 	.unit = &pwrseq_pcie_m2_m_pcie_unit_data,
@@ -151,6 +205,11 @@ static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	NULL
 };
 
+static const struct pwrseq_target_data *pwrseq_pcie_m2_b_targets[] = {
+	&pwrseq_pcie_m2_b_pcie_target_data,
+	NULL
+};
+
 static const struct pwrseq_target_data *pwrseq_pcie_m2_m_targets[] = {
 	&pwrseq_pcie_m2_m_pcie_target_data,
 	NULL
@@ -160,6 +219,10 @@ static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_e_of_data = {
 	.targets = pwrseq_pcie_m2_e_targets,
 };
 
+static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_b_of_data = {
+	.targets = pwrseq_pcie_m2_b_targets,
+};
+
 static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_m_of_data = {
 	.targets = pwrseq_pcie_m2_m_targets,
 };
@@ -534,6 +597,21 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 		goto err_free_regulators;
 	}
 
+	ctx->full_card_power_off_gpio = devm_gpiod_get_optional(dev, "full-card-power-off",
+								 GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->full_card_power_off_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctx->full_card_power_off_gpio),
+				     "Failed to get the FULL_CARD_POWER_OFF# GPIO\n");
+		goto err_free_regulators;
+	}
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get the RESET# GPIO\n");
+		goto err_free_regulators;
+	}
+
 	config.parent = dev;
 	config.owner = THIS_MODULE;
 	config.drvdata = ctx;
@@ -598,6 +676,10 @@ static const struct of_device_id pwrseq_pcie_m2_of_match[] = {
 		.compatible = "pcie-m2-e-connector",
 		.data = &pwrseq_pcie_m2_e_of_data,
 	},
+	{
+		.compatible = "pcie-m2-b-connector",
+		.data = &pwrseq_pcie_m2_b_of_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pwrseq_pcie_m2_of_match);

-- 
2.34.1

