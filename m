Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32DA47DD57
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341915; cv=none; b=D/dPhj3OIGsdVnrupDx+DHl8x7fGXTGEQwEZShRGAH9r9fY4IPLRPKoxYE9FFfpLj55WyqkuckiOA7v8SGimv1v1/0J2Z8HvmuJbLCgu6lrfK4EFNNLLY5gY4cLIRcPJAX1kd00afjq9JdcGPl7Byvl+tzR0x6rIckHqVifzZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341915; c=relaxed/simple;
	bh=+WcdvgZW/GV7zpd63JB9LAlXwRPQgiphP/JVsTCsf9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LA67+rwxnovaUOkBz990cRRhyFb5Z4UvE4NCuqLAehEm0DHkPPaYYPE3WvFloaKa++8/C/JpF/Kr75m0VazZPM4lApffZ3xEGcueIyjrsu0d9NnBlg6ullFRvthqa2g7NPCQZX8Dnp1pUgAiIDpn9UecY7e4xHqypKDZuVMirtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndHVMfvR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HT+hlPqy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndHVMfvR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HT+hlPqy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTfE387522
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=; b=ndHVMfvRot9OESgz
	bmqfKntKEZvo//+p8zWxhoH09IW/KzihNN3W4EvwovRAKx1bms+1LnqsTZKGR9ga
	gxIHIN3cx8h4MQdN2yKrLJPsiaPAMpV3XcjA3009zEVj1O80C4Kpxi6Ev6ZAqFgK
	WpWeOc/IDpLzYVoOrnbVqRR3xxFSbp3nnmRUy9QyWMfPm6BSJJHEgTya9+9MQ0kD
	+0B+LXZQB+tvGXWFJ2qkPNHYK9JfPsnp4S7pdz1MD8SoEPz5KthgBBn/wdLOO9iE
	ufwTG6EeAqd0idJEi9ktHB6kUsfjGyJgdXApDL4Uf4fDDYpNgQdN8u0ezx3x0XO6
	d8QALw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0mgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:45:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso51417141cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341903; x=1783946703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=;
        b=HT+hlPqyUsgAAw5mWBP5V5W+pfWrsH07Fdln/67N5AaKCXGKl2u5FgN1A6LixHJ+jE
         ZcH+I+yF7MMPPOk2c9kWXnAmLCniSPw+HdSwjGFgssDNo7GRNa1XSsx4Q+PvO+diQ1Oj
         kj7xCs7CCjAT33Z2zwFf8lSpecw2dgbeUVq5hjGNE9vHHcaeVKvRqCCDtu+9TKx2mluw
         XEo2NxjVq6ybJZYmfrk6M7yj/jW5E4SU60fDaCI2Mc3dJBJPjmEkzBqaW/j1n1GxqIv1
         c5+ACG/VarRvyDMmCBMCvzHSPBvNFa3s/QnTyzohZFy3j/1RptKlA4dP8mkOLZ0IMfet
         oYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341903; x=1783946703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=;
        b=U+qfbBNAAGhtJhZYMwjqGCHA76TvXLTPvetMFy8XByQiUilavgoivWHwS7GzNAqRVc
         uKmH55BCT3vCqXgFRLSUOLYHUuabwWedG6gPo+/S/vq5dnYK4W86YLlM7RUW6TQMS/jg
         +nWRh3eS/VIxGAnGnchNAhOZnXbxNAxP5PgIpDIgQKGUGFyJ10e6GGFxdWeexDwpkQqc
         NNRpFXB/OJND7cVdPBVie8JqsdACUWXiex9eEuBF6or+9wYBxt74Wnjw65AovbCbpOIX
         bgKMldMEWN5rqxjWev0uAqGz4yCj3VsPhTTUUmIUdzg5QnRQvpj82CtRd3smYyF4ijcw
         ra3w==
X-Forwarded-Encrypted: i=1; AHgh+RqbZNYevBoc6LqV9Lw0AQwqBtZSffBTcQAjK/CZr/KOBg65kC7zeiS7lqLKgIed7hG8ZJJhZAtX/ezJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKEp3c0I3ZJl3Y+mZiIko1oZFi65qP2Um50yoAZH2vxDTKsrZb
	Vwnp9t0Q0IfIUeNz7tapvXo+kwnQhWkQ0PlLmBohF9eS1XmEy2019homb6MzEcm+o1HgoCWfzWL
	+o/NXy6iokypkcapKv2EUS5IJpLtz1I34ubUJtI8lubeEYX4jCvKSr9jkihcfMOhv
X-Gm-Gg: AfdE7cmWMrBLPcCOM0ISUTcdhstfPAfP5L+QFo/VytDBYsOcvqrifTUxdtpuf3GfkJA
	88mjmh5FtjBTWaKIuADjVsavDGxl7UcWNGw1IVARmKvpKrnqbTswgRATmrbNd4e58N7zB67zt09
	BjteXp6kyt9tk+CemnOdjJ9ZW7YrjBaPih5gT1lWCKTvsQtnADxGh1ywyFEYoGpjqEdU/XN98v0
	DkvJFNMqYvlu42cBMU9iFY1AwrMGI9ZT3QFnD5qSz1Zr0UnYInyWAtSaMWNWgNSRnFTWt97GO+M
	4P+m68Xf63S3KdLuXU+XJ2I4+WW0CtOVt8bN7aLhvfmDH86jVnCjZ+JvRFGXWRUlPPSotzE5r/5
	9U5xWkqsr4K8DbpsfKxeIj8r58bxXTc/u4HmsP+yb
X-Received: by 2002:a05:620a:4486:b0:92e:6637:db3 with SMTP id af79cd13be357-92ebb5db477mr46126585a.38.1783341902720;
        Mon, 06 Jul 2026 05:45:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:92e:6637:db3 with SMTP id af79cd13be357-92ebb5db477mr46116685a.38.1783341902117;
        Mon, 06 Jul 2026 05:45:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:16 +0200
Subject: [PATCH v3 04/20] driver core: platform: provide
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-4-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+WcdvgZW/GV7zpd63JB9LAlXwRPQgiphP/JVsTCsf9Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MxkIvUW5KljT6xFge875O9WuwRepvZ/uG/s
 6o6vN4IqrCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMQAKCRAFnS7L/zaE
 wygzD/9GDta/x8WmSP7QOy6l0yvV7/uc7SVNI8SZk0/6EqQYppSZGt+f/ZQn7n2bhy1cxHgZ34s
 3vBKO/fX5ijfkM4Ov3o2x6YGnwXiwoO2TPjfM/6YHBlrfW1y+A8TwoPXIHgyDFPJxJ6PVQ+4gVJ
 /TK9YFAMFJLfxwURMyg2CpxiTR66hwOXPv9nxFXomOFD++/xJHV9pdzxgnfS2IWVtvBgDSWt466
 0bpd7XvxcC6qsIrSuP0H8ZqkCmAY9J+J1XuK93A4UHaQvVF1eC7dwMqhhEHqlpwTymNUbNJQD7/
 bT5qpqvGh8NmBUR9lXPWDtvejPorQDPOhPLJBFNBHCWCSZS29+1Ez5r9ZG5YryWI4cjaq14KBDN
 8k3TbdQDMjMDrsPoQhhTXZQzo6KaLjLdyc8lY+1G523oChbOOF7jgmkhpwdED6yulf0i7zZoSQU
 ygm/QABfr4ibjk8s5uHfaCo5bRazsd138pJesg0BKxivJxckX93Y7Z+fF7sMHKR11BeCpCb4VPy
 FkDkijjNDyiopNnw4UmM1KfleytMiaPMisGpJSoywFh75Z5yMp5kWMt5Odqgne/VT9Dr4rLQi/e
 bFVf8caUa5gPzaoiiuOdbyLor5PcG8kXRX0CzDVWnMKjA7CDypbfEzPWVn7dC+UO5KqKYMZAXiY
 FINuDuEMaN8BS7Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX32KP8ecRFIDv
 pnyBjaYlXR1MbAIZ51ljfvovnZDuFl2MvIprI8eUGSqpw6P8st/FPUUpNsYxqS1LUeRFPaVbB/0
 xS+mI6Z5UKZNdLEG5/SyraCl/NHATInY7jJrjPKocZU5kz4FVh+utKoYopxlIP4S1j2WsqsyId8
 GqqbM8geQ251ibQpXq7v0/haTngfTpOATxscoQAyC5nRdwPdXZ8hGAY7mPN5exPKNtE3dMoOcJq
 3I2ISB20Hnrp2ZW/ILHKcMl9X8qg19FFF+c/IafsJpvggD4aLm5Jmb4f5DC65M3rKPDg9vlV6kh
 tU+sDeFsl/GESTmKgYmXgMnbLrpu+LikmNxV2M3UzdACf8My7fHNbRipLu+5jqw2M3jGWxGs3E1
 9WCpD+lllL0ALAXZZ3+8nY1jVOVRvO4MFRTu/b0yl5s1M91rJQyr38OvozTtCCDJUYazqN3J9rC
 aYTlmmi0PwDAXAJWr2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX6xo6ujaj1HzF
 iea8e1i4DZbCfaIGwAm/9Ia1PIX1rnw7kkBs+3GCeNZ9JyD/RDLi8ly+kZK/bdX8sCabQVB7eXB
 hSYJq/yhKcBBKu3rheB0qUNNunIAGtQ=
X-Proofpoint-GUID: 3K3DRlumU57oKOfVllJHc3gFmxaKPq44
X-Proofpoint-ORIG-GUID: 3K3DRlumU57oKOfVllJHc3gFmxaKPq44
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4ba34f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=nFtAjRmdzOROD1nQPfEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Provide a platform-specific variant of device_set_of_node_from_dev(). In
addition to bumping the reference count of the OF node being assigned,
it also assigns the fwnode of the platform device.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 16 ++++++++++++++++
 include/linux/platform_device.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 6520b70cf3052d683a2ecb1a0dd7227575546ba0..f24a5f406746b53ca9eaab9472f6dd1345e04ad6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -730,6 +730,22 @@ void platform_device_set_fwnode(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
+/**
+ * platform_device_set_of_node_from_dev - reuse OF node of another device
+ * @pdev: platform device to set the node for
+ * @dev2: device whose OF node to reuse
+ *
+ * Reuses the OF node of another device in this platform device while
+ * internally keeping track of reference counting.
+ */
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2)
+{
+	device_set_of_node_from_dev(&pdev->dev, dev2);
+	pdev->dev.fwnode = of_fwnode_handle(pdev->dev.of_node);
+}
+EXPORT_SYMBOL_GPL(platform_device_set_of_node_from_dev);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index f037e4101c41dfdbf628d013348d7149ac519721..5333237ec58f30aecb05a3e160c7704fa07a0490 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -269,6 +269,8 @@ void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode);
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3

