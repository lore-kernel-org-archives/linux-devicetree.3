Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751973FCB15
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270482; cv=none; b=G7mw0TQF9O4GB12IlLV68fyHj2SAess51NZF3jD4mBEgoNpl1qDnT1PSTPvib00u11QsbdWWLb4WblmLmZW6GDx9pDV7DULx7l2wLvv2F449bT5UTl2AO+n1troSb9eu1HmskT6rdyQnToScI7JLysrF/5xXYzvmpnvV6CgnBYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270482; c=relaxed/simple;
	bh=6b0Jqnu0CGr/aHLEgYJK9A+WdSx4puE7YgV7L+bka1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrW+FcMz4CzemqB7VtU5HKGhSR+SHtTR3X99uN7AePHN2jrFDBuksr1kZ48rm2px1dC5Z6GgCwrkRov4+a4qBzr5+VihLEDaPsEEcxiAGdfwO3ybmNxlvQCMEj+hvAhpgDAn5dC8HzFtDAxsUAtHplYYJkLGZuGuiXaJsvR3tos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXrNqc06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtIj8jHf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXrNqc06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtIj8jHf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCimpQ3692446
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=YXrNqc06L7zlN7m3
	6IQJg5pacCoqFjf7ZZ6zyuvVf6fg9Ya2C196FmoQ46L5fU3vcPNDHRqBmQEmG45m
	9f/gc1ABjs2KdCZ/m08G7x8a/smCcdaTwcfP0oMWGSo05BRue/mNvDyFK4QoY8Jq
	TbakKrHEj7hM/a3ZScH98Ftc8o4S7b9Mqrjmb8FQsyA0u99fPfVFpnm6GpmapFxU
	CNRPwJi36GcnVOosFY5Sc2YcCld3jCDrUuAsYU8/fq+6/CjE82kB05pG8Ho94ABe
	u6TQ4djOFDkRbDw/+5lHtzKRofPfkkhrWrG/zdaRvANv6ZXFqrO7e+W4FUmL95jR
	FHucfg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5txhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:19 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69e96638382so974766eaf.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270479; x=1781875279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=BtIj8jHf0aeVz6HkPGwWIcx+980zNnLoH2Eh/RO3MhvhHV/x9/dYqmyPez8MFGWqLz
         REnl4SReC91PT1Oj/UXG12EOmDFC+Eh9Tt3/wuOFtz1ejEwalTLOTgkGnEkdFrRN6M2c
         HXNjRgII3phw2VhAfqV/2obtRNV8ndh7Mbky5JyNj1qnYzQU9lFGPH5307OwdTkOqivu
         8JJgXo4tGHkn2nCJfNHyFOou/anVzZ+AdQwzaR4UbvlJXdqPHb427PETYNPQVy8IT58F
         wfWpGpMsmhPjE4Uyia3kQXl+AhbQ/BMDjc7iRycGpm15sQUIQcj5z0cz+BsBClxnHqkh
         FfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270479; x=1781875279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=a0Pj+URmA6TKIonZbEtQWN7oiLTo7x1bh4PN5HoUA/PbCcBx7HzWTupc0wWJek/8Qn
         OGvDsmCIF2VEbhnk1eWxT9GTcLqfR0rypPuxcxXGxhXWLo0+9YMH4hjY+7Oqy66z/9os
         rdRz0pBDQ18h14gJZC/L1TtaA+ATHO5fbazKhvpw31YlWYLPDBrxa77+/Lr+yMl3BhCy
         dWmu8o9YKs3/Q+urOgX1ICJcbiFtvbOYLq7Kx+TJ4L99cK6T7c96sqJuUuDOKLKbE5UF
         bBb3v4QqPlJgfHZqBa/p5VVnatQjmVzAp3lWtjtrAHK9zYQ19qsguOYbR3AaJAyW2zQk
         nJ/w==
X-Forwarded-Encrypted: i=1; AFNElJ//uH3nOzuUhU14+w9aWFM6q8xoz8RW7XDoX7J4Lx5nHRAM6CFHwUWdIRp7da+eEcWNtsCd1/b9aer9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MhqMnw+7QOG8XJx9ehLE2IOgvhKFo+vvd5J4C4a/XYXIqUx4
	hLkuZD2oWk09xCwrJnJoawLxDPyfEvs0A3zjGWEvp1yt40/w1svaucRmz6cYu0UEbzsY2382HUL
	IFFO/azfp6Z4tm82yuy2xCnjVEja5imXjnnZY59bXZgCkNgRl3/QfDkH5TXnolEQl
X-Gm-Gg: Acq92OEU7FHnSFn0Vpkz2Mq2YbCOLlS/aSub0x5Uyd9N6LI6fOwD22VUltF9Jn0PcuA
	CRm03nxSg4k/MXRcaLbObVPLdqIBJ+Py3HmvGIuV7rQuRYtgVF95ih2zNcWQ6z0bN6Bi1bhAN6i
	DLLfDW7v7DtIH+LSiI6hZHqgBY2d0pP/egBDcv3kIoKZlbMtxYsVL7MVXa7V6AY7vZubNMtGfEk
	qQtc9OYnU46Kc1nw52THmW+pR2nrhi5DNfGs6f/AoxzjfYGbia07E/L6qx+2GH9Zuq8TaHl6RPy
	SFO45fD2eRlnvTmjSU/z9pV1BX79Vn1OZpe+70MjfnaxX9LeUZWxkdgqASvIQSLkaCbS0yRL+jH
	CkWllqQHvqlShhRQ2WLEYVnVYG9DFGJstabD5Jiz4kYmXSx/+pPZhz29o042n2JDYfw5zF8YjL1
	jnr97GmAdOuciY+86AdPQ4JyGlCv/FEcH9BNUXjJHIEp3PpHz2oitx0EX52vT0qmG9XlLPA/QT
X-Received: by 2002:a05:6820:1786:b0:69d:fb2c:77ff with SMTP id 006d021491bc7-69edc6f1377mr1695427eaf.30.1781270478931;
        Fri, 12 Jun 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:a05:6820:1786:b0:69d:fb2c:77ff with SMTP id 006d021491bc7-69edc6f1377mr1695409eaf.30.1781270478503;
        Fri, 12 Jun 2026 06:21:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:58 +0200
Subject: [PATCH v5 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-6-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: uV61rdxNXpjcV8Z_9e3aoUv3nVV0o6SY
X-Proofpoint-GUID: uV61rdxNXpjcV8Z_9e3aoUv3nVV0o6SY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX+CX2+3+IAMMp
 rALJ8N+RXPlAyVLbYotFBS7QVJ7SmPMLddmp3AabOMtZ9P8HN49h8Kbe4n0ZO1qlafDLPOKpYDc
 Xwtcg4xgTjFDC2XPtRP5FS2wrNzPgiw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXyzUWT9UqdsNT
 sLPAsW+lRlv9qCXsQpNfrPikbgLkK7zoq8aHunD748pDZh0Y3UFNa3wlaqdBPDvo0c4D6MSPms8
 3x+Xy5jBDNIlJYrQqFnn2opUfPMFndEumS9g4Gvc3ASZjVfhb5Ri59/ejNE6+pGX8jcNCq7lrkA
 6mEOoplZ9NHUtI2r/VZtcG9Sik9j06vbLunIYGgsFYtX/Z0TRGuw/Bs+yCMmGT5lAVtbTy699xD
 IOc5wS+28foiLozQAN65LgaR2nCMAPmHz4xi2vAUqiI4asSF9kAwIB4eMaOOtAG65DkbqlMODk9
 d4jLZoX/MZ5jDkDkJZsgiCFDIgNGxgLnDg/9XYNo6D/lrUubcMCoaBP3NiCXltqFfgMf3TIzYHv
 QmL65T29Pd4iGTOg+na4r0WA2liySDxKmpoEexpND7wW7TDkC6BKjloXXxEF0t3Q4jrfe3rPPYQ
 Dw4UsoBP346SmB8Ewwg==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2c07cf cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

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

