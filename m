Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316255;
	b=DREqwiBgeUA5vSu/nq11NbMPgeYQNYUUky40/ZMiX03Se5yGipOgWA21XYU+Njw0op3L
	 bqvs1JREIPs5remaN+z0IoIXIRDnOnNJfQ0o9TedPJjonxwSat0XF9F5qQD34itQTP0Xp
	 6rhQ/sOrLfhjm/IEx7V1IT2B2p2THx+xR9qCrKIkIB6GhIF2f1tYerhfUr7AuDn7vWq8F
	 zGm93VQJxo24PeKxJIPZqFb5RcQ0oZeSmI8yYYcj89bfj5hDWJR6WhcP4g4Cp7tDd08My
	 hy+J2lH0C6UF/nmPQWdUttbRzgnNV2QvEoqkLvWGsCpkoiNstorJ7yPbmCLHHO7AgQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=;
	b=glQPfxSFXftFwXezOVOQMUDnli+D/GPa5bfJQVN32pi6vvCzXQiuWXBGM6mPPgShRJct
	 JpupyKfRKPIeQlRGew+9kCC2VbFfHd4Nv8WzMJuv45lRaK1Rt97VDzG6ngV977oULmTi5
	 FgFifhW88YpCsaOufbisDduTAfYcmsWwdI91Y3NFPvp70y49gGv0sKWnPA0AB+KyjE07G
	 +B3V/rWlJYJIyL9YZBHVDgyxmFST6bMWbX5uZDEjxnDZlndrfHDZuFbkuWbZQXQ/CUPl1
	 9whdJlqKbBedSSZQp+V86RI6TvxSwULJdjrtoNzP8MixSyYx0YcNd+5rUFB8/SgJTTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bg1kxkQp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SSwj5R9S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23C606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A23C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bg1kxkQp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SSwj5R9S
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM2b88B568342
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=; b=bg1kxkQpfoNFuQk1
	XU3tvuDHduXd5FSsTB88+hXeWCiBebY0+OrTzduUgdmhlw+6Q9IlHnfVrfNm4wRJ
	+Ik3kxTM8m4j+503cNMrmlEzE7wsnnKMi0Hz8PWWY7WClIB668/0THkwGOXA4Hy3
	PeZ1evtQPkO1RH4ezqRCurjiXGfnWyPUg7duec59KqRSSNrlXK17bu9cD3n+1O+I
	gAFqV9ObXzdqlRfCWLe9LdfGywq9d3D028cWuiADOrtzuqTsQKo1v3LdaYTziXDC
	tUl6Coc0JsRwzdYAW2//lEU7WPojwKGsAfWP04s6ZDuqpCbGqlemuOq1UKCJGosm
	YpVDdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk2cmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so5773159eec.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316253; x=1795921053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=;
        b=SSwj5R9SQ5kNPa4JGl7vqkNaMLeD4RYmIsYjEu0e2iM8sbo5S2EI3jkgt9/YnSUCPa
         gNllJKgyld8to2UNyPEXWQMXPf+9/5LMXG2tr7NIZZrLog5DgtmbhZj7W7hPKlXXkpFe
         NXPONmKU2gs6goJzqSDzHOA/bbCa2dvuJsWWyItNIXlKm5P5FN+lAyiO+rBbeFJFBddy
         tpxmEvawYLd9+PB7qt2SjPw2pygc2z8kbZk/HBb5MnKALy7Yraoe3w2DUd3PFy74rkKh
         AgubxzlG5C1ldChF8B9JoAdpDqY8yuZAMoVBVIxrEhX77z2aik44dU2B9s9aTGJGjRxS
         nV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316253; x=1795921053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=;
        b=UeB2RyxPpE/ZmiV7lB3MYayQPsOIv/jisBHb5kBoUmAsiKjcM04COPVlUogOeT8DF2
         zPpqc1+MS4TO4DXKtyVNcNZmEaq2yxgwzPcwo3fnT1vgHXrkClbA8Bxa934wUosHOZot
         K5AO3+0Z7eRHADH4MZdmEyT7rtDBs9rBZEo8WXm1Ny4jsSs9IriGj8Y03BcGioBtSfKC
         UTD2GoV/WZCNJXbWROvYG7tusSPiFo+CMOXzIoblHFEJQ4x0zFQIWgOOUVo6o4dzsp/a
         FFZ1zktq67ggpljvPpjx/BouY1L0SR2Nd9UrHJkpbgFw8xpPD1ZYayHZB8YqgVMutrra
         Vegw==
X-Forwarded-Encrypted: i=1; AL+hErHAYvz2gLCk41+oncVabXMroTJ2fGddmB/o1YX0xYRUOS2WGfdfeLYyP+/LY0QhOjjPExqTMxlHU5+U@vger.kernel.org
X-Gm-Message-State: APuU4Z/pNh+k/FnqYV7hDTKdcCsMEqrcRqDBG91++m/OlwG8RBvDDvmZ
	4BhRcFrVQfJviFH1+GBOI/9LCTvNoB1/tM0bQymLV3Ke+9XC9hpDiB865OJ7Q60j8CZXlJquHsK
	x2aDqCx5pSO/1NucoYZtTG6gxd+buHzdINk8NsQ+/uLwNKVAO61NsgZ22+jvx6FQ5
X-Gm-Gg: AZFdTZeCSIe3gO3r8ezNC4luaN72ICPybdYucWiwX59/1HNgZkXxQtJFmvvIGghpC1D
	8MnorWm28efJNovAPK3vtVtuCeKEuFEkAThTgxhN85HF4i0F01ug8pd15OBRXZlLu/9QxV5Cotn
	BLQIXBWuZxlUtx0FNtVweq+kWVBz5E9ov1/UsHcSHw7eLdbSCy4X/wzH95d5c+MBkWoYmUPwuGA
	n1nl41wAF/RGr+UJcppnN0mw8Mm4XUWj/+sTYoJJRijOW0zOT44xAgzJtci6NkYeDFrxtbVYQdQ
	dyJLZv4nNDE3H005ehjRgtyihhFdE0mACVL22Ev0k6cS+0/HyK5eTq164fVVX4tVhM27bNFMj6p
	7XYvoPB8U6jwQTV4IJVJ5c2O09sMKHOfIpBoi0rgSxrkI02tZtfsn/wTXXAJAYyThFiSZfxNads
	dg7hvsPRBh
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr8113364eec.6.1795316253254;
        Sat, 21 Nov 2026 18:57:33 -0800 (PST)
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr8113338eec.6.1795316252785;
        Sat, 21 Nov 2026 18:57:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:22 +0530
Subject: [PATCH 09/11] PCI: epf-mhi: Add Nord endpoint support
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
Message-Id: <20261122-nord_ep-v1-9-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=1777;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rwRoe+74f7bx2POD29Ux+YxHW+5iqQHbqs8P/8PmtSU=;
 b=YZQKTBQOD10iDyG681HTh0xmsqt4Qmo5XYL1FKzxtHq5eUKwzTtsF7luTOX+KE2ZcdN//i0Gu
 l+gQgQfTVhGAeykiDXJVJhvPyafafbh6y6wu5HMuigJUIPsLaVD/vZc
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: NtLF5ALwvZ251QIyChFWHUbegL7dYzYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXwTXs+em0Gut/
 /LvOwq4KWVFDT7Ppaosv5UN6rDDgma0oSzPDN8hlcP9WjAfB4vNHNsOcxhe8J1RNGksN1eiECqa
 2ywuDbfavQK5Bx8fH9JMS2tJ2LXiKeLKg7kTJnFsYaaTl4NMYGc1gzmEGMJ9L8vsJKxUqNmdhdl
 9BNNHUufZtFCAgMv1JZOeOn0cpcDBx2XHIVDWGvISWqYzI12w30l8Wzd1AVmOPX/jqQpMKLHgOH
 nXclUXSRapUXUpeR0Jg42spX1FlAig44X7MWAQcaQJHQet5Jxd4MT2XX3SjBjZ0mrnUkzcWPY+X
 jutxTZh9eXbafYFKuaCsopTFPEuDynX2j3sbRIMBnLD0bezxUDIGV3ESuKRJKlaQJvzMi8ynfD3
 Tb4GB1/dHjRsurPMflmPxGwIWuo18uaLi9lblEk0l0rDXPFJ4lc92gs9XvOlwivD2KxpWuxjmRk
 SHvt3kSO4vHBI9unKHg==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b025a1d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-BGyM8POLA_osPWRVsoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX285nnI+O36lJ
 YGfsRhQ/0bcvo+0gLKK/rORAqxr3nAv2q29IAnx0MFAB4xokC3/w9unydJ8NWbEhEuWkDnRUuM8
 uLouvepp9HGvDAvtN0S0zx49U1uAKEA=
X-Proofpoint-GUID: NtLF5ALwvZ251QIyChFWHUbegL7dYzYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Add the pci_epf_mhi_nord endpoint function info for the Nord platform.
It uses the v1 MHI config over BAR_1 with 32 MSI vectors and eDMA, and a
Qualcomm vendor/device ID.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index a8765beffe06..6476a2f33f6d 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -140,6 +140,23 @@ static const struct pci_epf_mhi_ep_info sa8775p_info = {
 	.flags = MHI_EPF_USE_DMA,
 };
 
+static struct pci_epf_header nord_header = {
+	.vendorid = PCI_VENDOR_ID_QCOM,
+	.deviceid = 0x0120,
+	.baseclass_code = PCI_CLASS_OTHERS,
+	.interrupt_pin = PCI_INTERRUPT_INTA,
+};
+
+static const struct pci_epf_mhi_ep_info nord_info = {
+	.config = &mhi_v1_config,
+	.epf_header = &nord_header,
+	.bar_num = BAR_1,
+	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
+	.msi_count = 32,
+	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
+};
+
 struct pci_epf_mhi {
 	const struct pci_epc_features *epc_features;
 	const struct pci_epf_mhi_ep_info *info;
@@ -993,6 +1010,7 @@ static int pci_epf_mhi_probe(struct pci_epf *epf,
 }
 
 static const struct pci_epf_device_id pci_epf_mhi_ids[] = {
+	{ .name = "pci_epf_mhi_nord", .driver_data = (kernel_ulong_t)&nord_info },
 	{ .name = "pci_epf_mhi_sa8775p", .driver_data = (kernel_ulong_t)&sa8775p_info },
 	{ .name = "pci_epf_mhi_sdx55", .driver_data = (kernel_ulong_t)&sdx55_info },
 	{ .name = "pci_epf_mhi_sm8450", .driver_data = (kernel_ulong_t)&sm8450_info },

-- 
2.34.1

