Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738903;
	b=KeYmgCW3U9A53o5QxSGUri1oV5ZorCM0JyQMYMnI+SfQkpzvJfNq9jtxN+Eggc4eZUZe
	 EBl/6Cs/1xzEK8yCA3dIpr5kLStD4mDYrIkNy6IWrTSIZmjsgNvbR69nRr7pLp8XBUpqp
	 aMcz/mMrALc0YuUNSOJW7bbywVmVtDZV9Uevq0UJuxy+D5dj3zz9u+BRCGUaczTFFiD3o
	 wnLAKjz9RGfg4hu/0Sv6AXxEwSmfgY6Q80jP2d3jkdBgu2ZiVYmeL3qjvK1e7vanaLD2U
	 ega7iDq1n6qiEcDGVS3PU06dpPvBPMlfe2X2bsqjEt5Iw8i6AtWsw9peFnWMZNrVyMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
	b=TdbdprB/n5QRpjJ/rAyXPiq1NF5mIOuyAe2EzslI1oc1kOBbXtSVSHo87rleQ0ZZTWW9
	 vnYvukY8btsT3Ki9slYbc5R+gawfPFFmFqxBd/KGpM4jQu4qicPrBbxE1kypavcW8Okpx
	 gi7OzQwrHn+7H5KEWyYmovKaqqjtRFOS5/FiNuNw5U9REzyRZpaeqdkwHMhH1f47xOJD7
	 mP+cGa3cnEmkG7Wj3mVssTqJ4zhkgibBO9GjzSEmtJLsc0ldhuVT2MSB2QQgvHXbfzK7h
	 KetOQZcEYV44AjJ1LLXvCvlogE+okYEjWhuKjLkcpeb633X3DezbwsjRv6a1w/praxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG4b6Nmn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkbKWnWI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32160A2618
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C32160A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG4b6Nmn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkbKWnWI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F1SR773027
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=BG4b6NmnRohcPN62
	vIJc9NTestJcMDNEerSQGmIUwVtj2y21qAjQD0vg66T4Q3LtEpeoI+HxJn6I8xpj
	L1rDMOYFeydMKmQqyNyd4SGKwLz74bDzAJMMQbvWL9QDcp3XJyLheTUMD1QFI3+C
	uBy6Nda+9S6yHXhZgCMI+dWEUZc1LhLj9VSiHEkez0zo8yvPcr2An5sPiG2gXV7M
	cMqp+/Us/X4yKF3gXoRAcJ148/r5rAqgMWflUcLwU+wwLioZMsNzmLuHAhfog1zT
	6tWrp0GvrPLj6uiQtz+8HEV97E3Rk6HmuNoOy91kzgKGUVMYfwfoqIeiymIoiVYi
	OeqhIQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttbn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso705198a12.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738900; x=1793343700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=HkbKWnWITzmrMxeeaRAi0981PjgNoZ33OPbaOy1lX/WgpV7xe2sHnJzGa6S/0cjnKx
         FYV0VVtoGq1PRG/Y0QqvplQZt8pkQsX50pA9UUKd5WPANsmE7ULI9C5nbxXCYXxwojK8
         IgqzqFFFVhWCWKgFL1wBgzdQQYDPVDMBGF85aC4OZ1CYTm/hWb12vbX6/TJic4YvrpS3
         6/BgA3gfdzn/5wCTr0/WK4ZD+Fqr8zPYaPkd9stfDUsT6xJfr/QBvNaIx/Ggb+v4/5mu
         2uNuUvVJw48B4md4fj0ky4puLfqXdzhNy0ALH/ZuWWgHP069oDhDUaIINF5E/Q5KKM4l
         f6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738900; x=1793343700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=XGSM8bR9fx/Pg3s/dcunPeSEqLiatcDiEl3V/iit54oRGvACzJYeSuiCLwSsurFezA
         pPD5XhGPvbOWavwPOaVan7pC1vDDpipZVYaaSbO09jdzUe4VPXtm4sCGOIeOiTv3dSPz
         tcp0jx78EdnvrbHUgUvWadljHZosXsptMyQ6yg4JlD8m6norRrqKRmBzFxOQjX5UuTx4
         E1Olyxc9yIDnWllpf1I17v6paIaIUmI0PVlsypy3pC4Q52mUseIUQUNX91Ue0OiB97Eu
         ptZMtvy6okQ55Mt0ipZX6kgKvanTYulRclxutweZh6SRxQzjz88RNJ54lSr5YgCiG8a/
         3ZBw==
X-Forwarded-Encrypted: i=1; AKwUvBzqJsX2Q/eclq4eEz1Pz8DzXYIIH5HtyD5BtRwa34pN8FKAVqNU/P6A4kAH1Vv24JEDCXvMvPK9RDAt@vger.kernel.org
X-Gm-Message-State: AFq9FYLgX8tQioRdAkZPfQqxNsNC5idaE/kXHv/Y0LfM+ECjVzbJfTaR
	PL/vwiJ0nWEcDsQKwkr7ZTahraUDcBVSk23yZTZfROqFpZuzAshL8Qa3EgRa6CmYz9CQZDlKQf8
	FYC3YxbomZSBPu0jsS5IyNoIS6l7TKCMEDDxMkl6QAyr0nUOeFQaRIenxcSGHJHI5
X-Gm-Gg: AYBFou0ZusJ1XJWMOMAobvzjVeWbQNiIHDD8MGrjHk1tNlTnZhhANklXu7HtKjCCpTm
	RtoDhUSpx8sCdPi556mxiN0gqt1f63lL8wNUr/kRsuWlPjPdsspRm+NXOr98r8/P6NYxWru8Slr
	HNw/GoseQYSbNIlJp5InNezAAtxrmaUREpRk3reSCw5BxfG4LBxTgacnxSEbI6uB+jNlUxY8Goa
	psZbxi/yLjTrtEO9UvHWHSRVYn8GRX2kplH8khsw4ntzEHg+BED4QgKXMe6e1MniQfgr6qId0Jq
	x1yccTJZNGdsABPWpRdbYaTpD1PojsziuMkORNy5U9E657ijmkZ3WGyt8GB3eAV77ijKgD/rT7D
	H6GybOCGCsrVF259OPDioNf9L2AsPVSGAPNB0SLMNPT/fZ+A0tmFKjPgW+jhZWUFo1KHwD0dVwI
	v9XAyOCfeHEH0M2da16sqRPg==
X-Received: by 2002:a05:6a21:f10a:b0:3e2:3bc5:bb8c with SMTP id adf61e73a8af0-3e37669af6cmr853656637.50.1792738900393;
        Fri, 23 Oct 2026 00:01:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:f10a:b0:3e2:3bc5:bb8c with SMTP id adf61e73a8af0-3e37669af6cmr853625637.50.1792738899810;
        Fri, 23 Oct 2026 00:01:39 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:39 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:09 +0530
Subject: [PATCH ath-next v3 06/17] wifi: ath12k: move multi MSI vector flag
 to ath12k_dev_flags
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
Message-Id: <20261023-mpp-bringup-v3-6-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb0655 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jN1JcmgayTw_7mYEAw8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Kuz9BN6Uf8k09A4cQqLkfhVPkUpnQcQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXxRaRjzqJD1U2
 7Ww0yFUSCbI+bPaOyzWZD7q7KkDBEG9nulfo2yJEl9ixYmHHY27iQkzeK3bG3XL00wNsgZ4weL7
 +xp5vVxZPS8whZnLyGX5yuPT8DNcJUzqi6rKdxP5SbzDsvT6sbCk486El158uBKs6lUx3cLm/Qc
 gOEGQO8ZiE5ff8RZi108PCwQG73LHRWyPaWB+0Y7B31BGxAPxh6OPFLSoC+VcYrvENXzs1Pp2xU
 RCJHDwe897C1YhaKa/AGVCY+rWs17wVbQcYYFFm6LedniVdfuEt8DAy9Yb0MLR1xOcOKGleFOxf
 gRJGNO8OAWi9v0sz8Va5LV/JaxH+SNzXjtYVWaniqc0C0PQWGYB4lKB+0KzyI+9Dq1bKAU9WtkM
 Pwj8GZxMuWxBr5iLSXvqRE/pbuS7rSrPmMeS1d7RRjhb+84IwCG1ukjDEgkicADa5QkrNm4ON9l
 VZG4ewDqr2LvkXUGP3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXxS8hA2pjMT3r
 yLCfOOqLjQtMUwoCGIqoi5EZq9ujmo50oyN1olciXI+A7xtJPwQ/ewmj4v5bv0P4Z5E8/7bh4/Z
 n9UEVSBd14uK8RNIcZYHrWxe14xitq0=
X-Proofpoint-ORIG-GUID: Kuz9BN6Uf8k09A4cQqLkfhVPkUpnQcQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027

QCN6432 uses MSI vectors, but although it is a PCIe device, it is
attached to the WCSS Q6 processor and registered as an AHB platform
device. As a result, it does not have a valid ab_pci context while
still reusing PCI IRQ APIs.

Move ATH12K_PCI_FLAG_MULTI_MSI_VECTORS from ath12k_pci_flags to
ath12k_dev_flags so it can be used without relying on PCI-specific context.
Rename it to ATH12K_FLAG_MULTI_MSI_VECTORS accordingly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/pci.c  | 22 ++++++++++------------
 drivers/net/wireless/ath/ath12k/pci.h  |  1 -
 4 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d87c59f68c12..eaea601ab32d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -278,6 +278,7 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 	ATH12K_FLAG_FTM_SEGMENTED,
 	ATH12K_FLAG_FIXED_MEM_REGION,
+	ATH12K_FLAG_MULTI_MSI_VECTORS,
 };
 
 struct ath12k_tx_conf {
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..56e697fbdad5 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -86,7 +86,7 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
 
 	msi_data = base_vector;
 	for (i = 0; i < num_vectors; i++) {
-		if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 			irq[i] = ath12k_pci_get_msi_irq(ab->dev,
 							msi_data++);
 		else
@@ -248,7 +248,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		goto free_controller;
 	}
 
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 
 	mhi_ctrl->iova_start = 0;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 736e40492b41..e6fe891e58b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -341,13 +341,12 @@ static void ath12k_pci_free_irq(struct ath12k_base *ab)
 
 static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 irq_idx;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
@@ -356,13 +355,12 @@ static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
 
 static void ath12k_pci_ce_irq_disable(struct ath12k_base *ab, u16 ce_id)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 irq_idx;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
@@ -427,13 +425,13 @@ static irqreturn_t ath12k_pci_ce_interrupt_handler(int irq, void *arg)
 
 static void ath12k_pci_ext_grp_disable(struct ath12k_ext_irq_grp *irq_grp)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(irq_grp->ab);
+	struct ath12k_base *ab = irq_grp->ab;
 	int i;
 
 	/* In case of one MSI vector, we handle irq enable/disable
 	 * in a uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
@@ -462,13 +460,13 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 
 static void ath12k_pci_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(irq_grp->ab);
+	struct ath12k_base *ab = irq_grp->ab;
 	int i;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
@@ -626,7 +624,7 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
 					    const struct cpumask *m)
 {
-	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab_pci->ab->dev_flags))
 		return 0;
 
 	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
@@ -762,7 +760,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 					    PCI_IRQ_MSI);
 
 	if (num_vectors == msi_config->total_vectors) {
-		set_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 		ab_pci->irq_flags = IRQF_SHARED;
 	} else {
 		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
@@ -773,7 +771,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 			ret = -EINVAL;
 			goto reset_msi_config;
 		}
-		clear_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		clear_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 		ab->msi.config = &msi_config_one_msi;
 		ab_pci->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 		ath12k_dbg(ab, ATH12K_DBG_PCI, "request MSI one vector\n");
@@ -1152,7 +1150,7 @@ int ath12k_pci_start(struct ath12k_base *ab)
 
 	set_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
-	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		ath12k_pci_aspm_restore(ab_pci);
 	else
 		ath12k_info(ab, "leaving PCI ASPM disabled to avoid MHI M2 problems\n");
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 47c8760536e4..3097afb03432 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -100,7 +100,6 @@ enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_INIT_DONE,
 	ATH12K_PCI_FLAG_IS_MSI_64,
 	ATH12K_PCI_ASPM_RESTORE,
-	ATH12K_PCI_FLAG_MULTI_MSI_VECTORS,
 };
 
 struct ath12k_pci_ops {

-- 
2.34.1

