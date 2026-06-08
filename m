Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386E31AA92
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915858; cv=none; b=D8jg9NMf9IYIdfC5MCSMWGkbUMAptdNyhEvapHbpNX63XsrLdlRgGvWZ0It+Noc4j1uopJo1m22Qbj/VvoGlSnxn3DwuLKFoL25TdCwutOGD/bmjFcH0a3judMSEHlmvUwElAiNbl7Nn/PqEwgduLN9tZJnWzE9hq+XoJNRbZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915858; c=relaxed/simple;
	bh=jD3L8jwoh7BLSovJJN4zvcH6m1V/AR7MZ04B9wQ9s00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuknszWxNK+2lKh1p0HMteaGJQK3Hyu/tQkMTxIZnJ0JifFgzX4BN/qyyRPlOcPN0iuz95d9JFl/PwCpaIlHn5zH+u9n/ILSyEUH6Ams06N5E8pxhJSdu+wl2SCMTxZljUcgRuRR8U1XxWO8NVw2+YN8tj1qZN+Tf4MBPLLGrPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZQpRPo+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hr4bCXZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZQpRPo+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hr4bCXZY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658928E32677484
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41nbnSBEwQElk6GtkzYHQTOlycyPOuLRHHoqlbc4AwM=; b=hZQpRPo+nxilxMSI
	MMd5pcC9T+mAN3WIClek06Ot8+e/Ai2PmtXJR1Bu3+KZbDdoe2285pscWypVAbn4
	Ur3BnSeo9OH2q8sbNYwqp3BPlAKJ7q5Qnih4dU2Vzv9u7i6hBiy38j5Jrfe3D37D
	SCtq/HTl5YOqo42uhJh94D/tnWW3GQyLuvyxIiKC93i6vhFj+nLPlFGsw3GBEFqM
	EMx9SM0Oia9iv+1qjpuZjiK2IL9CAv4gank/QuwJ2Ob6LSYHcRzdICOxpZXivgve
	W9CwtJ6yqg7NinEBd0Q5d9N/mM9pUL2Tj3z1+UJ2wI/cwuKMOm+dGb9ZZ5qsNGGC
	UIU4Xw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkrfeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:50:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177b8def69so89565101cf.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915854; x=1781520654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41nbnSBEwQElk6GtkzYHQTOlycyPOuLRHHoqlbc4AwM=;
        b=hr4bCXZYD1D/FgfGLH8fVQtgaFNfZ/jcG/341Xv6HxsE0xVAGR4TxeYnZNV95gZD2z
         Y3fRbZEWXW7ZpazPux6+u3A4EHDDY9wEjqo9IHRFfaO62tkPnBUhtTFjeLRjFnrKq0C5
         tEpdUMmyrdvnoSEutVCvYrnYX9+uxLnvw1ArQVq9wJjlklsqUIA8A7uoIHabO/bNUiC2
         MsQhRLX9toF5H9ohuTu7RUyFsuU/mggbcwyYIWeMNJvJft5bAasgJ1YS20TpOHAOLaKm
         hSGcMgaET0GV//I47h7B2CVskXcPWYEdenv0JHtKS+55I0T7fMt7vpNvu4Yg0vrQt8V5
         727w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915854; x=1781520654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=41nbnSBEwQElk6GtkzYHQTOlycyPOuLRHHoqlbc4AwM=;
        b=QxV6TwtOfiMsSGVddBrf8WjxD1jDPpboqau0aGCOiRbugRiIdzVoxbz15uRccZnMsk
         tDOo5NhprAfaI6CCvDoSX2cUBcC4JCRj42IGc3BiFqzLBrt5vBJLfkHNEpo0D/BdQLSs
         Hc1qrtDX8WlmEoVQ7vtiNur4g2b6YCovD8P82bv+yuUUVmhUYPBR6eYirfWHEwVcUsov
         Zei/obiGEuqOR9L9qkTKGiFP281goBbMKnrXOSX+bilYasB4cO+si7h6qnJfv/ISLbmO
         MvipGzizQ1dDLvc0To21+vAD89jE5GARs5RiveGvL3MnXyVdZKxpx5YD6xtwV/HDmD7d
         fzIQ==
X-Forwarded-Encrypted: i=1; AFNElJ89wXEswDEjRW5hRsUt852GRn21oyVgP3uX4nRduL1veBmSVp/Wg9cAF3AJPNJ98rVGVBgScqaZSvuo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9A/7ouUMWbVLFVciT3hHZBFQz6mOz8tuTJ89plUMrgNcljuTQ
	NHXO20sKM4wWqCN91mpNajOGh9Kz16FSnTRsTZ8rgjRUtC6e5pHwph7jx1qsTPgJaii9LzLu+89
	bMS3eaxb0rnfQ65XU3lahoQA4PElkfT+fBBS1Y6DeU8fnLpprwDKYooFa57ERAFv5
X-Gm-Gg: Acq92OFYto4HwLxDwNR69PZUD4ClXWIjRalZl0k4z1ZGN9OCmkP9eV6yVu+oVlB4Urn
	6HcGXTHbx56byK7vkNxZkfYg/GxWZTp9hoBPxp7WH+7zKqsEr3YVbs2aLgk16O4pbwHY+QKGixs
	So6po+w5T8N8R228iaydF6z9pG8GxlzNKkXnYnp7EEMtT4qUCNuyi9LVG9adPKjqb/W/L9nw+gK
	1Sk0axPPYl5ffsOmsHhExqg4utBwJ/ZCgbs6sZl80c0v0A61cO5g4N5TTWyKdR5WiJOwp8hNyUG
	WNgCxAYfCWTkb2KmPzEYftyBFIDsAXlgpgUsHl4kDQ7xwlC3anK2UvFUBi3v8QAF3Ep/r23q6un
	EwEfOvQvPgxq4dt30DLDMbqEqoWzuSjkq3RU1gg5sLZaSx3XxsDfGz27ORfp3aFfj625YzQMPWG
	lTIxwBTiWtswxxM37cDP3t+2kfui0KkdV51Jal7sJlR84+UZ6hlAIvjJIFFYejFpRUSYgBWyipc
	RPNKBgcrE6C
X-Received: by 2002:a05:622a:5905:b0:50d:770f:ad23 with SMTP id d75a77b69052e-51795b4b9c4mr203105121cf.26.1780915854224;
        Mon, 08 Jun 2026 03:50:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5905:b0:50d:770f:ad23 with SMTP id d75a77b69052e-51795b4b9c4mr203104591cf.26.1780915853745;
        Mon, 08 Jun 2026 03:50:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:42 +0200
Subject: [PATCH v3 5/7] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-5-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YadQVI2TWv6w7czIbGtAiYkVnUqREymD
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a269e8f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YadQVI2TWv6w7czIbGtAiYkVnUqREymD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX8ctySorUwpgG
 O8NDaYap872mD8MiCU3mE3u3Ey4yhyOiN5tW2ByF1SUgCe8OLfM3vhHGbAQCT2qLpTxsmXPAWRY
 ucoDXOZLfdS7lS7pWAetsuxtKdx4rwibBNRhQd4kg672lU37+R2La0YZ5uf3cZW97aYHqwEiSNz
 LGhrHAWivX//BQGjr60OeM4/V/GTC3RF5QnM0vV8Oi2xMVnnqDKZV5Y+tHJHtPdJoTdcr+HkJVK
 JcFg3BXdTeg2wvYizqCpl/k4oyRxGrNCbc6RXsEcwLFbYDcd00xzM/EeG/2EwbpUVoLNzFa0BGj
 Nh9S2HIa4u5Cwpuj8AMtKt3SGXGawVBy7OWTpFnxk68/qAmrR4jEN339lznAbb9RwOLDuPkjA57
 lgDOEhR2fb6c2kPMhx3ADn8z0qPsQwFGACraRr9aLX+oc5MpI5gyCfZSfN8lzM6Cd1VPp+2boeQ
 sfF4IIlyaRr5RKJwZJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101

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
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..75341c186123e949fbe21f1e51fce3ac74d4f56b 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,7 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
+	u8 mac[ETH_ALEN];
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

