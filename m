Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316261;
	b=XYOZ33PZPf8lOCK7pzgeeaWBikaoGRIXLSmezTupCU76XHW2YgRyMfhgvjrrw7i21O2s
	 hdNwd0RLziLwg01YXlGtIuy0uhNuHVMsQep3Ar/Pq5ICYLKLJtnM+36IKb1dcuyfLU6d1
	 QPd78zklxtAYCGMQZHpv3qO+ZmuBJgKRwCrrCtogJFM7Vck423k/LDj4diuHYOEx9EO8i
	 gFQ7aw2Om37VrGQ9J7tLRnTrfdzMbOhYCkAVA4mrTQQNA8723wrdiIq4Mm7YqvcRFqKSa
	 HTvyki1LqaQR8jYzxM22ED6zCtHqGpr+Tjj0F26yn2UPHcFYwNPHfNVw4Ljj8dcBO1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=;
	b=jk8pc0SKumxpp/RckWZyr7UMFsQaGkAdn5zXwDFf0c21VAK17qH1NJYKwBDCQP4+wFnO
	 6ufL44GJ+y/VssD1yc/7fDJBV5s6YJ1AKIklvBS74XoEqUwBMMym542zLye6FgW4eOktu
	 b4hB2p5GCUGTMvNLTJSuaekDqbSXgPFidWLNXfwBXUAasBc8dSesT9h1lXajTcagjZd3F
	 zOKJS6nBizdUDe5ugUXO23z42iElHlzDGRPe2OMTjSDaa/IWSLeKvBWF/SODHoznzX2z8
	 DuP1315kFETUkhw4/NJdV900vKrRWqJRSSRe5aiE0x3oDS7KEsS6B8v58hewgoAZThw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GE/At4Qo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=et1oZpmk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74016606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74016606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GE/At4Qo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=et1oZpmk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07pSG1032709
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=; b=GE/At4Qo7h5pN6b2
	Hq4t5NqVmxcIzG+rKO5E6zYPYTDTO9abWEdyi0wTiDR8NvZ3oxDK93zPan384Yem
	LkAEI9M5o4OnlaBx9lpi61C2fzX0BASMgCj3w+3Xo4jYZkwTYXNEtPz08uXJHPgp
	3G03OPZlA//wZx52V9ex0v0dwDJ4i+UMrpCMiMTfItsAKKEOrcuNfU/2K1mtBA96
	9i/MXRNgPaheSVzOgUrxoyebhWbDluBr51j5JhPKkkt+uF9xn2lS9nijnfL8r7Gh
	ucYWZmAX66MuX5KoPZd19NhRRkpMx0Uy40Fm3E75a7v2GHmX62t3JZkbDlhbfYL9
	Oq7TXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka2cwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso3120047eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316260; x=1795921060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=;
        b=et1oZpmkvOSGFbWs6cNAQGCkRovLD6u0c/RWHwBGsaUJjxE/IwCb/ZH1GTNyl7f7SR
         99aUzX32Nw2KN5z9G2zk0bWBGbGtM9RxHe8BjObU0NpO3B9BSZSp1AXwTwuPcvVIeUN5
         aw7aJe4jxC8zwfrg6jI1MG5WytfPoa2cDHK2F91I/u63Z0UBRVqquLW3BCRCGsiwVE/g
         M2CL2NOTOKFIxSdL9U0w51/8TM3OEDypgrg3ne1ZU73fQlHNFhEbZAH/ndfwOZV7GfAD
         mOY/Tqms8D1rzbqCj32vjZ7tmnw2hcuOUD/2um/Zr4Yk0W42MwsBtdg5I1bRPDDOAY5I
         bBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316260; x=1795921060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=;
        b=F7wD8oyYBMb14f85GuMi0Sh+gIzk8jBUcUb2H7pyqpXdsANd4iV0G3JwzmAx34utrq
         /XR4ZEidiLNNCPb4knLlzKl9Xz7IKiG2bzDaGKEW625pjSv6kIcOMGbse5ZMjF/2DLKF
         nPJti4YWe5ReFXpMmaq1Lbv5Pq0oZXgUc2oq58jeTke/NCz7L96m2DttK9/k74FQZbbG
         4f91T3jR4Bs63IWclfhgVaw2zLT/a2k1C/QA9w1J7Y4wbd9ih9X+8bNIMdUj4lDsTaHo
         pQ45NKohglPy6m4EcrhE95smAZdSgq77MPBayX6D51NyVlErJYj+Xj88SCISvKBRkFRu
         lKXQ==
X-Forwarded-Encrypted: i=1; AL+hErETs8Nz4bqkD92/+fEFs8omF7DV4jwt6iHIm5sj4oaGtr99QL92x9+eJmwkWcxirO2SYJZrabEr85FV@vger.kernel.org
X-Gm-Message-State: APuU4Z/FWgvRPigFIJJzh+2k9t1yDBFE+AkIv2YmhR/XA8/1FUyI/xzd
	HQ4j4GBYyJ4cUlSBrIpvFwxa7ybXjbWq5R5IluQJ5IIofwGFS4Aekm4pq7ZSXpR/0d13EupaG/X
	dmNDxDfnxtsJswMUb4Bi0g5M7y4tBXmdXmNvUCfEV+7cgV/MKdm/hFshH5BozSrk1
X-Gm-Gg: AZFdTZd/qVY4t0eh0aGoi0fSUKoV1aLgkx/hD0qznC1t/UyQIme3ordbQExPSVrD7Cq
	DTbisNXOXZtvZVm/oy0ZJRZb1ZRpgttdB6fgS0rFc2nNWqIlnHBY2SSimqCGaJSPbKonseE6mz3
	pWE0GKp1ZVKLnayrnOVdCgFwq8hWACa8ZAXtqZyrqx23G4UqKmxM6KyDKwjPxDBgh9o7pGTyZQJ
	zRJ9CtjmgWWiPBOwXcWM3PXbyNezhBrqiYI3Avz9839tjRfWwbWpoE7LvAtslgw8rcYLjL4Jpdq
	g68tP/2ycV4OMwZH4DJ8yUtp2BbNakAhIL4AKxEcpoNuQGNMCgHJD9R5cI/mFRbfDmpl+86TR9S
	CMudmgEH0CBHTM4hKBDZcQmP7biC9SCyXdX3J5yp/PmdFFJZxS/XLaIfYDveI/mx+5agGuRi0WA
	0xj4CF5qnp
X-Received: by 2002:a05:7022:f51b:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b5568af41amr5927467c88.23.1795316259986;
        Sat, 21 Nov 2026 18:57:39 -0800 (PST)
X-Received: by 2002:a05:7022:f51b:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b5568af41amr5927456c88.23.1795316259479;
        Sat, 21 Nov 2026 18:57:39 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:39 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:23 +0530
Subject: [PATCH 10/11] bus: mhi: host: pci_generic: Add support for
 Qualcomm Nord
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
Message-Id: <20261122-nord_ep-v1-10-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=1704;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mxFfCYSZbkYPAAgKqdymawNDYArxhGIJNHckvlEpvaU=;
 b=oUzExgrBWSn/PJZCJ0tHQmMjmfUaXiqNmMvt8aljTqHa33vZFBIIrcxrI8RsDB0GGv7RBkKtN
 E000wZ2y4yTBS2JziFrJBs47LDsZIqxbgtl9PQ4SPSizSQ9a5ESRSGJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX4UmBmo5b80Da
 RgHihD4UgkLA0mq9ABBpw4+qReYNAFXBfDotjkGIB8baZNQV9bKBMkKOMt3U90L2rhCDk3nPbTk
 sdZvNL8ndf4wYtDIKYRaqXa5kFCljUqr6w6oaeYvF1pxzZ/uTM9SYDWSDnxZ6vxQzZwrBrL+Jgf
 v00PDAFOw6703AV72UJz3XQEfNBAVbIyhSq4ofeUISTi/ZpBBpC7Jtb/bS8sJLg/Ezci1t1Oh4g
 c2oQvJpLtrkF7qzoe8UvdBgMYCsP7VYK/so+2fRoTrNa2aue4mLhqPJFU78GihZOV67MXkuJzoZ
 jblwS0qjme9FN3b67gCUpzCY+OhLUVzjUWhKpc6I7T7KAAoiBVFhgl5cLt4xJ8gFB2ffp4jW379
 7xfjo7s47cdfGyEjBq1dNtQhF6M8z8U5dQxlfxJaHIuC3ytLd/G7pCIheoywLVgsSJEkN8W0o2d
 FT3DcBZTVfjEr42P57Q==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b025a24 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 1xouqAKMUCbYPeaykVnEdxEABz-iT9OQ
X-Proofpoint-ORIG-GUID: 1xouqAKMUCbYPeaykVnEdxEABz-iT9OQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXyxrugQhcW3Dw
 6z+s/P12CkhWfAldglKRRR3yCFuGIPrAhWE1QDudrqGpKIBl7vD63SX/GaCClMB7/yq+Exp5q2I
 t56QFzaGu0Ej1pjtcr2trKVnrzZjsYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

Add an MHI PCI device entry for the Qualcomm Nord endpoint (device ID
0x0120), so a Linux host can enumerate and drive it over MHI. Nord
exposes the same software IP channel configuration as sa8775p, so reuse
its controller config.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ca9ef4aaa014..65201ec8dc76 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -383,6 +383,17 @@ static const struct mhi_pci_dev_info mhi_qcom_sa8775p_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_qcom_nord_info = {
+	.name = "qcom-nord",
+	.edl_trigger = false,
+	.config = &mhi_qcom_sa8775p_config,
+	/* The endpoint places the MHI registers in BAR 1 */
+	.bar_num = 1,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_sdx75_info = {
 	.name = "qcom-sdx75m",
 	.fw = "qcom/sdx75m/xbl.elf",
@@ -966,6 +977,8 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sa8775p_info },
+	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0120),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_nord_info },
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },

-- 
2.34.1

