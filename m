Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759584C8FE9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921681; cv=none; b=GoT8/waVXxIdROzHd8FsbTldaLwxCIgRfc5SvvkSo1rPs55I6X47kC+WpZp/LbDZ10o4E/fj29HRwhEbk13pajbxNGANh4VvhZe6mEVdNet7hirWnRpFfD2pyt3YnPoE6PppWuIyDibU5M+txPiDARJLOrywyy5skRqMAhfcWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921681; c=relaxed/simple;
	bh=6b0Jqnu0CGr/aHLEgYJK9A+WdSx4puE7YgV7L+bka1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUIFKRdX4W68v4BfAP6Yhj/RzQ7UCrds9Ng3u6EAikyOyI+5nl0FZIfftfB5aaVFL8SZMxncpwlBFOF02nxsxa4l9b/nTjXTbKpdtkn/6D2kEQFBz9k7hVG3jc9Ag9JZlYh0GeORqu1WEf6MDHJC0j5qjmWa1ww4tTgSRWSQhB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZKJB4Gq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0VlFEML; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZKJB4Gq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0VlFEML"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo83m1428915
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=BZKJB4GqHyp2aIyZ
	VaS0G0L0nXtvGM0/o2igDMHE6Bgn4FSYWPb20BGXgUlSQlQV8XxU3mQ8WVRBgyxO
	vtw5fDqzjZsJVqbuhL4lMBuo4CNA60vcPU/8pdd85/KWIuajtDaQNZKDhAaK4DVl
	9KESl3hjp4OJY1+PWLV4Bxi4I2NcuDm9RLTDSNWnjDkQnQPeek6d2pqcEILISHLa
	x4FM+XGu/yxeEULWzlJ5BOHlIuCgnaOc8ql0gSLzaJdZrjD7FadC4p57OGSxj0N1
	M0AmpR2ylGigBoPc9HZExgn1OesFrV3vIL3dzhMWHe+RadUcSo9LKLm78e60Pk2z
	H0yPyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q08n9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:01:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso84379685a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921667; x=1783526467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=j0VlFEMLFrqpWDEGUgAwWVQSuvkls66DtPNCBjkeUJfU9BnT3AoN9xbpC8NJmMK8hw
         SAdj3RBJEJmHmc/aO2V7Zq8jZ4IxZkObbbmm/5aNKtFYOFe9bYPYjRAvwto/X6qGXNas
         ZUSok0HaNjlggiHk01R6riXln3E9v+oLj5HNK9hoDobNBBgViHxWLv6t4KhQmdoanjMT
         V/rAGwkCF86Ii1BN7YTYZbJBx6ANKbnlLhRD36sx0mbSLSWL1wGTzQYOXJ02W3betWsi
         LxubH+vL3tE1yakw331jgPGWk7TVG9F9DIYYgoOR8JHkodrwX4g9OvdimD4NHUSFVWZD
         znpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921667; x=1783526467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=iCZ51RpsvscOdMlrvhadXLihWWXAhGLwRktvnIBipmoPGW2IZo4haEAWmbrKEHc1TP
         sUTNe57KRR0liBS9dE+9khco8RkhRu2S9MHpmAHTK3lMACdiSlGvCC8TknIyxIcR8/K+
         RWkNMRl2VG2SX8K3fMQYsn6IX+ykEPRrbCgrLzy3U5WkK+mKxJyaPtXg4eXSJ+0B8Jsd
         nvk75YIFqp7gRWCamgo0ISD/6ibMrctMoMVPR3ZKWBb/eUJs91aHI9FJyqvi5gf9Gyhx
         L+vDrS1nZGoDx1ENmA2RAYWoj1n/enaaMfVnViSraq2W/RM5yfBl6hTwOBnBv+KUYawn
         iYDA==
X-Forwarded-Encrypted: i=1; AFNElJ8JCfNmQQK57STIVSEjZVce2DgZPMRwWa+dgnsDn3tADcCDHp5DrKLik+d+VHkREtthg/W3nnetyUdh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8DjfGos1WDQb4AGOUEC+Ks/JSeAJBJPgQysPbG6ZzJpEB6Mqk
	nyb5ZyhSvuHXe1tqpF1US6fAVIov+l/hwfQ2MxdqoetrDO766K6RpXT5wrZ7vCXWdFuU2p77sw+
	enK1k8K+jUi0kpZx2m7jyGgfaLx3ic7zWbHd6cFmrBn/U5spx0SsF6DMWo1XdOMg7
X-Gm-Gg: AfdE7ckTZj6jyPVtFcP0SH5tnz0qJ8TFgkZeHtOb2hvBgy0xR8bldbEiOQpnLVqy/QO
	LZ5ys7RyMkUI/bWtdfT4XYFggALtuhVPpKVaOrms8RPvAp4OS5wjeFLmx5oASQvMtCOVYMZ5rvg
	+J0DM+PfwQOZa5Dc40wBqTPJuhTB5/tI73kPtJ187Ah5gCzE+a9KyZS4AHRdI5MBpCAIZ6AIm3d
	Gl3CaiWil4QX9wEJTBo/18UvAvJ5CczeCVyZCnMyVcm2czHVSiDEFH6+Dn61MWM9Da8dArbpCM/
	yBbmNiJjCoPdOeLjsiXi7ieTcFPZZATHL703anGMRdPfwBNGK/YUK59uov9uKdaJLIERTK6CWk1
	E1/5XKu4It9JtVxv54fftCTBQPKAwk4Jo+SLyqu8Zl9IRfJBTG60d0k+bXYS2e+cx57k71miSiS
	cJE8z5r0Au0d0J8EHB485aXS0u0l+/7YZBM9dVbynwUil+JVoLyrjUWP6iBax/cPc=
X-Received: by 2002:a05:620a:2586:b0:92e:5c56:727a with SMTP id af79cd13be357-92e78506001mr341353985a.60.1782921659044;
        Wed, 01 Jul 2026 09:00:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:92e:5c56:727a with SMTP id af79cd13be357-92e78506001mr341219885a.60.1782921651391;
        Wed, 01 Jul 2026 09:00:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:30 +0200
Subject: [PATCH v7 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-6-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4539c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX5TSrmvJrZ17Q
 yrpW071Wt4uBKf0GfQHydvEYsu9VslzWNDulSK45ME/2z/yvrcNtbhr5XqhqJHinjKR1puCA75M
 zdJoQY1iv0n6Ufk+ZVd5FwMHo0GjI5kqdb3nTCvRN9ALiuWAdl6fO7O6Hn4rxcmdfKl2yy1vxFx
 Vz1pi2uoP6/S48iVxqUDz8Q3MQP5cKlfV+CFEdjt7W0GGC4YaCJ7qBo1UcJos8lCNGeNugYQJ0O
 8H+HD3zzWfqp9ROC7mFlE+1m5Em8bQWU/VoXbZ4CJfx3/9pp0jd8OEXrLTHxx2uG6fWKpmZoXqy
 VOq3I/8E9tEzKYPmRBGalpC0TQH/Cr3XOUOJEVcw74IDianFOL/Elfa4qP76Le1I3V81bapQUL1
 tl/ea7YJZOjVOs4Z7N42DIt9qSgA5Q==
X-Proofpoint-ORIG-GUID: QjgmSLp-wjxHWFifC1mS7SHmylOYLsch
X-Proofpoint-GUID: QjgmSLp-wjxHWFifC1mS7SHmylOYLsch
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX/VWI4nyCc5O1
 6tNKdALWye8U+IwwEfntf5WIXnJ05kPIddF1Mb3eK1JawmF+2Sw8U7+VztKYuB/1wsOlUjVMEXK
 6DksdzhA5vm0mYiBT2F8VGlH9RvxhRo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010169

Factor out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
accepts the NVMEM cell name as a parameter. This allows other subsystems
(e.g. Bluetooth) to reuse the same lookup-validate-copy pattern with a
different cell name, without duplicating code.

of_get_mac_address_nvmem() is updated to call of_get_nvmem_eui48() with
"mac-address", preserving its existing behavior.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/linux/of_net.h |  7 +++++++
 net/core/of_net.c      | 49 +++++++++++++++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index d88715a0b3a52f87af23d47791bea3baf5be5200..7854ba555d9a55f3d020a37fe00a27ae52e0e5dc 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -15,6 +15,7 @@ struct net_device;
 extern int of_get_phy_mode(struct device_node *np, phy_interface_t *interface);
 extern int of_get_mac_address(struct device_node *np, u8 *mac);
 extern int of_get_mac_address_nvmem(struct device_node *np, u8 *mac);
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr);
 int of_get_ethdev_address(struct device_node *np, struct net_device *dev);
 extern struct net_device *of_find_net_device_by_node(struct device_node *np);
 #else
@@ -34,6 +35,12 @@ static inline int of_get_mac_address_nvmem(struct device_node *np, u8 *mac)
 	return -ENODEV;
 }
 
+static inline int of_get_nvmem_eui48(struct device_node *np,
+				      const char *cell_name, u8 *addr)
+{
+	return -ENODEV;
+}
+
 static inline int of_get_ethdev_address(struct device_node *np, struct net_device *dev)
 {
 	return -ENODEV;
diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..11c1acca151266ac9287457b4050a54b08e2b5f5 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,7 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
+	u8 mac[ETH_ALEN] __aligned(sizeof(u16));
 	int ret;
 
 	/* Try lookup by device first, there might be a nvmem_cell_lookup
@@ -75,27 +73,54 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 		return ret;
 	}
 
-	cell = of_nvmem_cell_get(np, "mac-address");
+	ret = of_get_nvmem_eui48(np, "mac-address", mac);
+	if (ret)
+		return ret;
+
+	if (!is_valid_ether_addr(mac))
+		return -EINVAL;
+
+	ether_addr_copy(addr, mac);
+	return 0;
+}
+EXPORT_SYMBOL(of_get_mac_address_nvmem);
+
+/**
+ * of_get_nvmem_eui48 - Read a 6-byte EUI-48 address from a named NVMEM cell.
+ * @np:		Device node to look up the NVMEM cell from.
+ * @cell_name:	Name of the NVMEM cell (e.g. "mac-address", "local-bd-address").
+ * @addr:	Output buffer for the 6-byte address.
+ *
+ * Reads the named NVMEM cell and validates that it contains a non-zero 6-byte
+ * address. Returns 0 on success, negative errno on failure.
+ */
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr)
+{
+	struct nvmem_cell *cell;
+	const void *eui48;
+	size_t len;
+
+	cell = of_nvmem_cell_get(np, cell_name);
 	if (IS_ERR(cell))
 		return PTR_ERR(cell);
 
-	mac = nvmem_cell_read(cell, &len);
+	eui48 = nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(mac))
-		return PTR_ERR(mac);
+	if (IS_ERR(eui48))
+		return PTR_ERR(eui48);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
-		kfree(mac);
+	if (len != ETH_ALEN || !memchr_inv(eui48, 0, ETH_ALEN)) {
+		kfree(eui48);
 		return -EINVAL;
 	}
 
-	memcpy(addr, mac, ETH_ALEN);
-	kfree(mac);
+	memcpy(addr, eui48, ETH_ALEN);
+	kfree(eui48);
 
 	return 0;
 }
-EXPORT_SYMBOL(of_get_mac_address_nvmem);
+EXPORT_SYMBOL_GPL(of_get_nvmem_eui48);
 
 /**
  * of_get_mac_address()

-- 
2.34.1

