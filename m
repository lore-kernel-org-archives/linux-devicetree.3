Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468033;
	b=DpUl7ThT+knC3bPwTmphTd+Mzo4xFLhxZ1mr6e9L1FqczrZgXIlMGXSjyFZ7xm+3V3Jb
	 lhkpUsq50smLMtGPUuVWTWIcYcGGREpR+BWVW5MZKtvJAKGe+1O5u6lzjbd4+dzz2Bqq/
	 fbJHwg/KcfMZ/dy5J1sXFDIdXFOQ6lNVeZvr75B3o3LeYD3+bOVT+3MfzIUGflvE36cBd
	 +TsmG9jGIbltipGk9HrCGaTrkJs67YrVmqmehnuqb889tDHpZ+4nDRMSjfYBowthRhM54
	 VoQfFfDLT3s67C5cNoVEknlsGjKtU5KadZGm2/Z4plchkSGtwHJ/4SK0DMZUIx3YZrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
	b=w8pbaTGVx/DcS9EHpzpIS4b/F7fvYDGeiqhMZhxp80CHcbV0pQMko0tWQ8YtbdqtH11V
	 0zsaPF9Z7zWh8o4Rvl+kMi3PZMkrQGMnovdVCtH98MQw/rhxrEzAc3wmSDEfjd73pJfBX
	 3ZqpT/V6/eMA3vSUk6n4J1/5W/bpsgqkqdVW1etCA2jTB3glg3ZMzJ7FGrcJjq4twgnoP
	 xOZ3O1d3H3iKF/KrfOkThRgWztspeF2g1CqLITdIZsdRTYIyaak1mf9fjML7P+8z8bwp7
	 hHUrZYbbWbxwdyI0Vc4Jh0XA8twRPbsfEVSPS5+JC9Gc+qpSTh6S9hb+px9bym/Jphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cJoa/K2j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbZHbGgY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B8606A882
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2B8606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJoa/K2j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbZHbGgY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZODd4092373
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WADlB89QNmz
	wJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=; b=cJoa/K2jnnGUSfJMD2NFxQQiO1c
	zUAJQu2Mevi4ubNyvBBzNDXvMLCTZ9qd14149NTa8Bqb3VTzwslM1A29q7Pi0qUV
	XVpnQXoBkmmZoeq1JD6gYPCaNyIpI25Uem+Lwpyzoe0H379S4qMRrLAwVq/lIAfa
	O55Y5s2gzug26ew3zz8LSBByguGAAR1rSgnQXhneMS7d46sgU2JzDLDun3QLtttU
	yEFRDvkSJR+9p0RbIlZddxAQLb2RIx1BW+jAo3RNdJsOMK473a6lBuwhjWJszb0p
	gT25kq6rqEkK7f+DmLkHBm5oAbsuuliNSN0WYvlh7LOgO543QAeQRQDn9QA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hpqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed1acf9b7fso2557245ad.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468032; x=1795072832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
        b=kbZHbGgY8gHfXCL4PGpGD8quekRwQpAvinmYlovL8yZDoVgm+DtTMHWzA0YtbGJ7FX
         wOXknPPTnfj8yEOFM6KkgLlfL1OkY9AAFxEJJ8ovYrx2aDZxOGfDcWRYwGriwvpBRXRC
         1DYGw+fP/OhINWSHjjWg65N2vYExqinSbMWRM0cK7E7O83qZotuAvaviNRuyoCEmHN5D
         VD652bZWjgDzsOV0rOBqhohiy9k+C908PZJjhpHNCuOo9FR0XRs/dvr4KE8XrgsuFPXj
         LcZVvwYpRZy6CqdnvbhaP8NyG9Z1hKAvcVLAP5lgFaxVu38apPGWe/zkSb6z2ykMpeeL
         KSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468032; x=1795072832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
        b=FPs4zd7Za60yUNBcW2n/b45+fHT+Rk/VI8wJ3oa4PPUeC208p3Ut44RiqSEzBdk9/Q
         x6eoRA3rkc6mqGv6y9XQqEtCvr/H+dlh4YVS9OFvkmzHbiWlhSrEHZtWqppSgMRGmlo3
         sEAa5iS5d3c3ulyhlgfdZWJVdMXNhQ4Y1XY3BE/J54PvWfVYVMOhun9gi2MfgMyHytd9
         xSoZP3z8RlD4ILv9fc7LG+G/j9wMUsMNXLb7a+R5L0k8gTNrq6Q4KzCmIT+s6uAHagEO
         lZkJyQb8u+SxaCLrTLzcFvaz8OA0X/htd0ku4fCq0aHNRklnyyUvsewEuV12iTQ2AJ3A
         ge3A==
X-Forwarded-Encrypted: i=1; AL+hErFna1bvGyE2rIXuOd24wJ2TSbW+czVse/ox0NNI0YEgAPkeR7IssxH07xeysskpbCnQRKy9uzc38ySL@vger.kernel.org
X-Gm-Message-State: APuU4Z/yrFee2y44Wb61IfCxX97/SOXTYoQ6CntzAnMjJLSsEGIin22A
	WDK8qjVACRIh9j/WTI8UTZadie+IH76eREguz8nOCGdPu5GXmOK1KgWF8Tf/F8oVo1G907RhQR6
	0EuTqwch5RGh8xNJj3UNPqOVTcvrHbsfJS9i1s4eMpsbZ0GaYfXMFDXtKUScVUdNa
X-Gm-Gg: AYBFou1Wy9bEu7Vhe1XTZ4U5b5IcnpRsJmDkL0iUB89tmHoQug+oRjdMN4hC9LE8cZ5
	JX3D+sZeS3M1VaehwJK51d6RrUH/8oj8kB/KSRAJB2uWejbVLDjJZMbcsIXp2Ys71abf4s/3meK
	wdDG5cru1YxjkMYwWYrmstX7MYtgj7veSdnSh9iLmqKyeRyNjOYb/a3SjseorqDwVXda2utnkpz
	TfFSNo57VCK0A1MGrhARAMrjTVYKQsvKjeh0yo9f6ZhIqyyHPRbF2huJ9hcjPNdpwt9vTJdMBae
	XFCNM/9loOk+rqlsoAP/zob6d3ufvqYWZ5rXJ1fbPL5g/iIexe4rE37DAskv3fgQrjtuiWtKaX6
	tAQuJmzxM/vCDrXneFUS/+46LnTlO3OhE4kuwh2rUttmWyvtYGMLeStzCcTo+DTKRjC3a8PRicG
	KVZg==
X-Received: by 2002:a17:90b:4c51:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b182de7309mr7512736a91.1.1794468031601;
        Wed, 11 Nov 2026 23:20:31 -0800 (PST)
X-Received: by 2002:a17:90b:4c51:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b182de7309mr7512696a91.1.1794468031117;
        Wed, 11 Nov 2026 23:20:31 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:30 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 2/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 12 Nov 2026 15:20:08 +0800
Message-ID: <20261112072009.3815276-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfXxeVvZkNYiHPx
 nNUn1IEsngNSgwktPf1l9Y3pfLmGwQYR5pXqwQ3o+dfHHDZLkO0CMvxu0ZH3uF9jQO7IgB1RuuT
 ZVO+3L0Y8ijwQd9SAl9sdueyUz4sqIU=
X-Proofpoint-GUID: tVrAbJAB8OGpH9SS_fdcuNlyV7CrxCRB
X-Proofpoint-ORIG-GUID: tVrAbJAB8OGpH9SS_fdcuNlyV7CrxCRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX6ztc6qGLRkg8
 gYH3VUfmNZf70uLLlDIoSfCdV5Y79TY+tufXk7Jk+rYZVkqG7IKLOb6aSDcruDiTSsm2IbVLm3w
 8Nn77vcBIldZ974aBWjfAHGpO8RAeu4otlBvvJCAm9wmitDhhoZ1+iS3GbhWfjDRhJeYacxhkcE
 zZJK9HLBc7l8xYwhzMGPQmIQmFBd95J8H5a3y0+Ljq/1ygB5n1gGRyy4rivoXxOgl0jooe9/4uY
 XAimu5Sw91cmbicuL5jEU0urRZrkv4rj/85hU3YO7dtaScpcaOZ4ynytia8rTxr+s/NvNkKABrv
 wNtDyih/Bcwop7F8lBvowVkKvotu43KEXAfp0z6mESLy8+2UL3+w5vmfhKsYq58BRcVv5lS/lHw
 QQ9syRu6UzWaggGLn0QSS99GPewYkeXr16o1iWVUji3I9uSAKCbJUl4NLIcbkPA2Ip6FbmVfj+n
 Nf6s8/DhfZsR9F+yIJA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af568c0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=d3QjpUUrb7QHECHc-BAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120029

Some WCN3990-family devices use SW_CTRL to signal that resources need to
remain available while the application processor is suspended.

When the PMU is marked as a wakeup source, request the existing SW_CTRL
GPIO as an input, map it to an IRQ and register it as a dedicated wake
IRQ. The PM core then keeps the IRQ disabled during normal operation and
arms it for system suspend.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index e51b655add01..26b436df9b93 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pwrseq/provider.h>
@@ -484,11 +486,18 @@ static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
 	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vdd-1.8-xo-supply");
 }
 
+static void pwrseq_qcom_wcn_clear_wake_irq(void *data)
+{
+	dev_pm_clear_wake_irq(data);
+}
+
 static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct pwrseq_qcom_wcn_ctx *ctx;
+	struct gpio_desc *swctrl_gpio;
 	struct pwrseq_config config;
+	int wake_irq;
 	int i, ret;
 
 	ctx = devm_kzalloc_obj(dev, *ctx);
@@ -525,6 +534,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
 				     "Failed to get the Bluetooth enable GPIO\n");
 
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		swctrl_gpio = devm_gpiod_get(dev, "swctrl", GPIOD_IN);
+		if (IS_ERR(swctrl_gpio))
+			return dev_err_probe(dev, PTR_ERR(swctrl_gpio),
+					     "Failed to get the SW_CTRL GPIO\n");
+
+		wake_irq = gpiod_to_irq(swctrl_gpio);
+		if (wake_irq < 0)
+			return dev_err_probe(dev, wake_irq,
+					     "Failed to get the SW_CTRL wake IRQ\n");
+
+		ret = devm_device_init_wakeup(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable wakeup\n");
+
+		ret = dev_pm_set_dedicated_wake_irq(dev, wake_irq);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to set the SW_CTRL wake IRQ\n");
+
+		ret = devm_add_action_or_reset(dev,
+					       pwrseq_qcom_wcn_clear_wake_irq, dev);
+		if (ret)
+			return ret;
+	}
+
 	ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->wlan_gpio))
-- 
2.43.0

