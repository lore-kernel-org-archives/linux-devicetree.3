Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD4346AEC2
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167507; cv=none; b=a/S0goEfbxuwbg8m92PT1uUtWtjmHcDW5fiKzGhPgA3x5t9d+VdAInxWivL+eRqR9d3EospiHXSRmn03hXCNQgKmNWOlteUGp4r6KUDfPbeG4VuPoJUivxPchfATPCvPHtwLYx9NRIHny0ScVXBc8O/upjXrGbGu9aCH1iFXZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167507; c=relaxed/simple;
	bh=PTkmvq/Q7QJ06WLt1N+U7YrHr9PbicR5yuKr0MktND8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaL+uiAWSadtjAIbJVGzAy1ToTjEtDlepaSEMdLWx5akGMwXJXHDHgeSg/PxPqYetUVhCtub/2+9nI3w54ngt5mYhnnwX0lRP8PgbONUNIB0lJ+Qq3unKmG91e4tg3mMD2wDflXpiSZoA4ltqEnQv3d+giNubhldzDhxC6RHlyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQGKmWwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoiEoIEG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQGKmWwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoiEoIEG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647A3Ml11669566
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=; b=GQGKmWwPpcYT7z52
	bh2TBhD3xN2aVw+NnsWrysEnuoLLqDCOscuj7MW+9REwKMoW7mY5/4nq9ouPjv/g
	thwhVWE3ViIlDkCt1ycf1AQFZ1cGZ6NmEpXCVrtcQnVpGRxU3RQxdHtKryWF6KTx
	K+xYI7lTzBNnoOWbnW+5KGwx1fJchODrvLFvjUD14mh/H0p4TxPqRr84WwFrh27f
	8N9KTX/ztpP9EOfYjCzV1eoVEbr61V9zen0za/2MVIw/iZ5PXTf+/ZK+7484+EIw
	Cm7l3M9dBPTFL56gluoApthPugAaLSFg/qxw+RHO+JWjyxvQoRxJcadQFKuQf+xk
	3Wj1hw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p2jc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:24:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d5e66646aso1363223241.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167499; x=1778772299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=;
        b=BoiEoIEGSFg2nLyqYhoAS3ipSziX+Bf0RWodsXs3iufy/Qa5PRuz7MUHqznU+dHm0/
         CqCfhVboEOvao6bgt8qedh76exBuQnXexVSN5oyVY0J4XngL5MWXWqxuvqrvcovefsDi
         38NyygRbYNg08ggM+KVxvhyMY5loN1lk8prlnui30qmnvBnG6GaXU/Pbd1pGWh68BpnP
         NtLiMrx8YmEkEXBoTRuvWGd9nYVoXNbJreQ6RAP6DvEk7RJMf6wb40CF1bFe2tUeiOvK
         Vd2epm1UVYz5f9qY8KAc/0Qxe0AHlFmHw6+TE4xzWYAUVsZjhDAlx7bHp74J0vDwYHOm
         Wb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167499; x=1778772299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=;
        b=Y3+y8CMWLF/NyoIcPPL2FziBYQVZu6lstFDOhZzEG+qE6wciZJ1QzIBJ3V5BUN2RhN
         nzJTF+4FkY0wrf6OISYHAx2lgwwZWUOuXtQh1/LsuqYLcxyCB1+IcTvlgDyJEldVzd67
         XsxO8Soiw+3GaGuTm8CJ5y83/Q/9N/77a9u+zyB9qCp6Eofkcs0u6TglL9nMJQ7HXg6v
         na1T1PucOakSZ0CCuSckCGw46M+pnYwXT4ZH9O2EX3Di+KTd9rILy7U+j7morGsqyFq9
         pSF4ntA43r+8b11cwkUHCOcOpOn7OVZVtEcpXi9od6jCCPc7gb66TmNsgAHtedvwfdAg
         abCw==
X-Forwarded-Encrypted: i=1; AFNElJ9rTpVrtyfxGpo+zfKyFh/D4JMGzn1JmbbXmfAliqmbHXtr1ip/FQgDvYjMWW3NR3g6wQ/KP1iVDU/k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36jQTt4pRJ129OLzwZ8F4uFlaOMoUF4FfddBmhU5O4J2zBExS
	iOzNBlndlCJcp86kJEXZ8046MURkXAOMmca0i8YIM2fZ2pvKQ82ACGOj1ss/j7nigmLRAAbI974
	iDS5LxX3WhvFAyr3OZK8RraIVSX724uOoUb1vJwrhsqLtm8i64abG0NIDuB/xYRLs
X-Gm-Gg: AeBDievafykbxALKJNWWFMWq/Y/dTDsyQoO3EcKhI+pr0Hb+1P8sVO9ytq8UXrrrVNh
	tAQvYWyUmEZAYJWm7vL7UXRrAODyCu9YmsTmxrZ2gMR2ELQha5M3DS2d79oXep/VV3rjQAgRpEo
	zpOQA/HMo3L8mSW/M0WYlqzQa17iw7vba7TFzZWa1PFusnDJPbT+J5UYHwG7BsAV35B0hbLrT2x
	hLwPp/3310C3DiumIFZ5pBWEbPGFPvhfrMgWsn/b3Tadb7Nd40cUtvjeJZuys1x3x2mA/LkDsYp
	ciqP+Ck3onw/LRxUK0WVjDJ3sS8Mwd+Jo7CPmBKqFo2GTJASUrtCUgyieS08qquwpP9YwJQsG9u
	j4p3POKy+VYn86+ie2s7GiikYY/B3pcXoGGVtqlNA1r+yQKjd27DJ3zoElWYRju4U9crA7050P/
	ngXWq2cH3H/KEqARjbGU7ZiYSYI00=
X-Received: by 2002:a05:6122:1822:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-575593aea76mr5335429e0c.1.1778167498703;
        Thu, 07 May 2026 08:24:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1822:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-575593aea76mr5335377e0c.1.1778167498276;
        Thu, 07 May 2026 08:24:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:40 +0200
Subject: [PATCH v2 5/8] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-5-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX/gN3cqaZbJxl
 Z4ORmt590TrXrAfni3ZBtF3KAcW+SGBA2a2XFYF8Xi3qHkKopYcNRJVahQIV5KSaqy2wQwvUux3
 R4y8CchfiSX6QjNXzeeo4PI+1qrE9e3UrIFuc9EGC5SRnEvfSFekU7yD7x4GCeVUxJNUNDYZ+KN
 QjeOyt6kvdVBxsTY6+gFB7OqyrTMBZZ+b2ShDbdcuTlJBgHqoRaXOdRy38q9fTweoJrZqyXljMR
 Zzmtow2n8Gbwb9ymGex8aAZajW6n7or2eCNjtQAibu9nd8WNtJ57rWz6iQtJFVojgXKCjO9lbaV
 SnxuMtqifs0x+xMEnQA7wmxxi4muD7ItUrG/X7ZVOQ7KYI8pkcA2tRTiglMgAlmU0B5b+4jL6B/
 RpDgvXR8nTbuknxDDFqsiE6bwKudrAmQgmJBtE400BVNABVziVNFhGn+UN4h6rcp9snDy5Eu6XE
 mIOWNLze6nwi0bwtuog==
X-Proofpoint-GUID: jqzfaUt9XQHCa0t1I--Hihijz4FmtVi3
X-Proofpoint-ORIG-GUID: jqzfaUt9XQHCa0t1I--Hihijz4FmtVi3
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fcaecb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=C98JESGoZJZpJ7w8-ywA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154

Factor out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
accepts the NVMEM cell name as a parameter. This allows other subsystems
(e.g. Bluetooth) to reuse the same lookup-validate-copy pattern with a
different cell name, without duplicating code.

of_get_mac_address_nvmem() is updated to call of_get_nvmem_eui48() with
"mac-address", preserving its existing behavior.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/linux/of_net.h |  7 +++++++
 net/core/of_net.c      | 47 +++++++++++++++++++++++++++++++++++------------
 2 files changed, 42 insertions(+), 12 deletions(-)

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
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..79b289de0f16aa5f8724e84d6f2300648c25b6c4 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,6 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
 	int ret;
 
 	/* Try lookup by device first, there might be a nvmem_cell_lookup
@@ -75,27 +72,53 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 		return ret;
 	}
 
-	cell = of_nvmem_cell_get(np, "mac-address");
+	ret = of_get_nvmem_eui48(np, "mac-address", addr);
+	if (ret)
+		return ret;
+
+	if (!is_valid_ether_addr(addr))
+		return -EINVAL;
+
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

