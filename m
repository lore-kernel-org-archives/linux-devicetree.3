Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316215;
	b=eUBJ0dPcD+BCtzPz8tq4dGb9XUnDFnv3V00QRN5ChvWQR/VgVVFlPW5A7sAlhJsy+7mh
	 cIYOnL2Th0nzOnFd0GL5C+9Okd+3F2x2D3h6phT0ioEFKbUOuuAfI6u5RMm0ym7whw4kb
	 GNmHSusQ/0LLbz4hooMY2YVU6Gd3cMRMv9ba5YFkHmY865esaYNohuAgTFiXHw0SyuE0k
	 2H75oD1ulRJYV/RaZtkzm5n6FCiC7PzzDg4MuGJSRUB/dATBSzU6EDvpo76ZXax+lZ3bp
	 2adoHPqJ7t4OYVWumoPMVEmftLfB9Ey/2a/0kxhzymRpFHPpJ01CbGntZ0PP4fheHCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=;
	b=TKhPRfMMjUYxZIOZK5t/wviP6XW+VPrDO29jHQFv9jrUWp9Q/FnUo1J683PtgkzHi9vT
	 IdoBr5kpsKJ1kC3uRuuxmKsEYPGhrmspu3Rd3Nu5ErgLQoHzxXXjO8GO/G7QG6AaeCw3e
	 OwP6HHssfeOZX//oGLz63Mco5ngw06sG6yBt5ijA7Fn8dwnhTJABxnR0tWab66uIo/15N
	 zl1n/loChO15X0vfIih08lCXgdJsPcQMuY0hZOGoVurbkvAJRUlKl5zM6PJl71xE4FP5s
	 MjF7/KJJ7qkDhhiyUQzBay1GLACk6JkVUYDOMyookFvnGs3cW31LlkXa0l8a0scpUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqWur2w8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+MO6Cfz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983EB606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983EB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqWur2w8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+MO6Cfz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07tos270184
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=; b=hqWur2w8W55NOte0
	25+pYAciUDWJ6ENxlF9RXINK4LY/WDrdolJH+Gf7l0EpY2OB+vvE4kH9G8WRejTp
	MKeNetcdLc65tshrOleXckPJbR95hqM8UtaQ22Wp3dCHPnwSUEKAH72qEPERq/lG
	0WPiM4EVzMxsBpvIpTGv5wUABviXAIzloOwdlQKs9xDuiyrTwzbSUyy/KedHYFFZ
	FnfltOlw7BEgQ03SBlkWiGCa604MP78dPZxWAEJ1j9AkbxUs4CSyHPfxzws7ccYd
	fDQXRW6mRmAnCtX8oRHL5jVeh8AxPVV90rYb3/KlFOLS3iE9sn1S1BzfI+piiZqK
	iZipBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk2chh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2517924eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316213; x=1795921013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=;
        b=O+MO6CfzRd22Ejnb5oN/Mokz+T5twyuVLgaUGEhnxLY71B2c7V92agB8q2GlyQCLZj
         eHy1is3X4AIJes27bQy8G8+Tg923OYiJg8An27OHAIN3ge/EF8BvCHTWGbnRZyRAmJqA
         3B4Y4fYHvA0Ma+6dqZsvDK6lrw/8G6trtYQ46oHpcZs9ao20yBVftIkaZtGfzFMDOuby
         xOcCNytCGecsTZnmZ0Qjsb5fNZoQj8p4lRIViaLcUJqdfHQWjNbCeNo6NM9mP+IiESk6
         W9KYoYYNfqyJ1+u86eR4s/0hmlaV5+Dbmm2BWn+yu5Yi5J2TcgBvwfopxbX6WyT4jfZJ
         gUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316213; x=1795921013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=;
        b=prFaWcUzwA/dMNDbTeCl0qm+tY5eRkKqIcnLNupVBnNKlycvBBHvTJge//RvKf2hS6
         JrvztIB1ttGEVQOe/y4gA3NPglaEEzAJzl/kaJV+gIzFLWd/SgX+lKPFmNP5DQ1zgx97
         HxGKy+UOvOwHo1WqCVHJT8gOwXR8th4n+wlYMoWcxhXj5NnZpmrYvGbiV4C3Ez0x4k6Q
         hkcXzxTCimc4WDyhWjtHJRlvVhjqkvg1JkPRLJ8OKyplDkk/rA48VMopg0aJ/HRr8KIP
         uhWLnKEEXvHqREZwUmu7Dmo0PwlWoAwpIdMes7M9Lq3zSyz4S577eToglwHwhwv8Fqox
         YFKg==
X-Forwarded-Encrypted: i=1; AL+hErH9uXRb8jbE9NbEWYIBUPJqSsxqFdVWfbd1XmqYKe52IF8wbM2+RC3dkYMEBJ25xT2P1roWas2nY/+P@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hzdwvj5xbbgN/YvUITqD9G01wYzmKF4/XDL+6YtO7ScW39Gtu
	N4an/YS7o65zrxIf03iWhaLTl3AOVeNeUeXaMP6omCofJ0/Gx6bZpFU8NvkIh5yjHFgAm8iHkJZ
	QTuO+bSxd5im0WqfChlW72UAIWc30z5OWig2sa+xQyFUNPOcltb1cko3SLF1PZDGe
X-Gm-Gg: AZFdTZczj/wed0sV+XeBRYlJfuxcV6nnTFpjupSGfMiNinMD5BLsDrrEjch4sxPbwJ2
	Kcde/z75+cGfC5TySerqnrin5Ev3AbXExNAfKX27zk8V5qaQ/KckpfarHj6cpratLMrXSIrBc+4
	rOH2YzNL0mChLligmX7kEoY5bHGh++fp5gw1HHHC8c4feIH5u8D4eSpiXNyIc9Tj5HQtpiuKjmi
	UUyJU5gRXly0SRv2Mo2pFZbS/ndMU9KtUmA1KiMdyGgKTCW8A6idj1YMnQYITmXkwPV/+iogmpW
	BMOCH9Q+ziQ1N7nLZC8nZrh2blxBTxQoCYihSyQ3sOtt99m3zKlID6b9PrrZCGx3TDfS5NCcwBM
	pFgVg/CVKt5fmpydQ7jgnkw7Davo4CjZzzWZS4GEi7A7zrBTas9HD4PfDltiy/qeZPZIhfiudkh
	ZJ0j8Vpbdh
X-Received: by 2002:a05:7300:e9ce:10b0:385:2564:c509 with SMTP id 5a478bee46e88-385700541a6mr9071424eec.24.1795316213003;
        Sat, 21 Nov 2026 18:56:53 -0800 (PST)
X-Received: by 2002:a05:7300:e9ce:10b0:385:2564:c509 with SMTP id 5a478bee46e88-385700541a6mr9071403eec.24.1795316212484;
        Sat, 21 Nov 2026 18:56:52 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:52 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:16 +0530
Subject: [PATCH 03/11] PCI: epf-mhi: Add MSI-X support
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
Message-Id: <20261122-nord_ep-v1-3-6d8839ffa9aa@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Anvita T <anvita.t@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=5864;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=7QjmuTlVRoKXrIZssiDHzu7/1X+z/zLg7WzPuVHICII=;
 b=A+SSmX+nlmQiS0zohEwoQRgbuhdqSdqltmeiJRJ4cuV6hvQdHXPdssILPJFHnDIKWCA7pMPvW
 lmYm2D9QhSWB0lAbIJnkZ+p401ZCAT36i2ymGTzuXi+p2JBNrfdJLcM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: GSjyFA6o39VowcDf3fSGEbQ-Y6cfNKi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX5eAF7NbrygmM
 8vhAaSlfRIC4d66jp/zawbK9FIK+7U5meqEquWvc8K5da1oameqpj/gMbi4h3+PlaQJqtwnIASy
 upg0tmjZpMejXAUAlxWCr61CxhNR80ukRhblcO5D9uncFVnaboHoG/QAEuFALGTofUKNmaPUaJf
 N7iqvVVO9Ap/0qt1ttTUwMJXThQ8DMj6Gr/Oqr0afSs0fnoNJk1SgepuWDJsT1zgauIpLZb/TOo
 pr0NwDhUnjQCsDkXGYXuJlhiSQLHx/er5ZrkG+aORf0SKBIN9hHVeTLMfXXqRRMITpsVTOzARbX
 tM0OY0PHTZd4VlbesAXXwjAfIjZLhEDdHz/38fqyScCSOqtphojjjP+ByZkChlSET788f6Lyc8H
 n7l8k08uuK3NwaTkATNFbzEMB06dKR7HIZTwuj9tdaoVcrXmMMm/v5pXJenWqxfZYg4XiqGlVCZ
 R/vCh+cc4mVSLy7pnKg==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b0259f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aWPhZf5PStJQkATrKZ4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXwSaM9vFNr88z
 Cv9ZzjCIASQOOmMqldd4B32Know1CUxb7p8fkIPeAge4J+RdIt+5wlCeJTGA52da+w2nvsq58ou
 7A6YaANkpdRULCKh+t76v5tFaQ0THwg=
X-Proofpoint-GUID: GSjyFA6o39VowcDf3fSGEbQ-Y6cfNKi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

From: Anvita T <anvita.t@oss.qualcomm.com>

Allow the MHI endpoint function to signal interrupts using MSI-X when the
endpoint controller supports it. On controllers whose epc_features
advertise msix_capable, set up a dedicated MSI-X BAR (BAR_0) from a
"msix" memory region supplied by the platform and program the MSI-X
configuration.

The "msix" resource is optional and only looked up during bind; it is
required only when the controller reports MSI-X capability. At interrupt
time, select PCI_IRQ_MSIX over PCI_IRQ_MSI based on whether MSI-X has
been enabled by the host.

Fetch epc_features earlier in epc_init() so the MSI-X capability can be
checked before setting up the BARs.

Signed-off-by: Anvita T <anvita.t@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 54 +++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 52cfffcfd5ca..a8765beffe06 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -148,6 +148,7 @@ struct pci_epf_mhi {
 	struct mutex lock;
 	void __iomem *mmio;
 	resource_size_t mmio_phys;
+	resource_size_t msix_phys;
 	struct dma_chan *dma_chan_tx;
 	struct dma_chan *dma_chan_rx;
 	struct workqueue_struct *dma_wq;
@@ -155,6 +156,7 @@ struct pci_epf_mhi {
 	struct list_head dma_list;
 	spinlock_t list_lock;
 	u32 mmio_size;
+	u32 msix_size;
 	int irq;
 };
 
@@ -230,12 +232,16 @@ static void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
 	struct pci_epf_mhi *epf_mhi = to_epf_mhi(mhi_cntrl);
 	struct pci_epf *epf = epf_mhi->epf;
 	struct pci_epc *epc = epf->epc;
+	unsigned int type = PCI_IRQ_MSI;
+
+	if (pci_epc_get_msix(epc, epf->func_no, epf->vfunc_no) > 0)
+		type = PCI_IRQ_MSIX;
 
 	/*
 	 * MHI supplies 0 based MSI vectors but the API expects the vector
 	 * number to start from 1, so we need to increment the vector by 1.
 	 */
-	pci_epc_raise_irq(epc, epf->func_no, epf->vfunc_no, PCI_IRQ_MSI,
+	pci_epc_raise_irq(epc, epf->func_no, epf->vfunc_no, type,
 			  vector + 1);
 }
 
@@ -714,11 +720,40 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
 	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
+	struct pci_epf_bar *msix_bar = &epf->bar[BAR_0];
 	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
 	struct pci_epc *epc = epf->epc;
 	struct device *dev = &epf->dev;
 	int ret;
 
+	epf_mhi->epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
+	if (!epf_mhi->epc_features)
+		return -ENODATA;
+
+	if (epf_mhi->epc_features->msix_capable) {
+		if (!epf_mhi->msix_phys) {
+			dev_err(dev, "MSI-X BAR address not configured in DT\n");
+			return -EINVAL;
+		}
+
+		msix_bar->phys_addr = epf_mhi->msix_phys;
+		msix_bar->size = epf_mhi->msix_size;
+		msix_bar->barno = BAR_0;
+		msix_bar->flags = info->epf_flags;
+		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, msix_bar);
+		if (ret) {
+			dev_err(dev, "Failed to set MSI-X BAR: %d\n", ret);
+			return ret;
+		}
+
+		ret = pci_epc_set_msix(epc, epf->func_no, epf->vfunc_no,
+				       info->msi_count, BAR_0, 0);
+		if (ret) {
+			dev_err(dev, "Failed to set MSI-X configuration: %d\n", ret);
+			return ret;
+		}
+	}
+
 	epf_bar->phys_addr = epf_mhi->mmio_phys;
 	epf_bar->size = epf_mhi->mmio_size;
 	epf_bar->barno = info->bar_num;
@@ -743,10 +778,6 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 		return ret;
 	}
 
-	epf_mhi->epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
-	if (!epf_mhi->epc_features)
-		return -ENODATA;
-
 	if (info->flags & MHI_EPF_USE_DMA) {
 		ret = pci_epf_mhi_dma_init(epf_mhi);
 		if (ret) {
@@ -763,6 +794,7 @@ static void pci_epf_mhi_epc_deinit(struct pci_epf *epf)
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
 	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
 	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
+	struct pci_epf_bar *msix_bar = &epf->bar[BAR_0];
 	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
 	struct pci_epc *epc = epf->epc;
 
@@ -773,6 +805,8 @@ static void pci_epf_mhi_epc_deinit(struct pci_epf *epf)
 		mhi_ep_unregister_controller(mhi_cntrl);
 	}
 
+	if (epf_mhi->epc_features && epf_mhi->epc_features->msix_capable)
+		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, msix_bar);
 	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
 }
 
@@ -880,6 +914,13 @@ static int pci_epf_mhi_bind(struct pci_epf *epf)
 	if (!epf_mhi->mmio)
 		return -ENOMEM;
 
+	/* MSI-X BAR address is optional; only present on EPCs that support MSI-X */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "msix");
+	if (res) {
+		epf_mhi->msix_phys = res->start;
+		epf_mhi->msix_size = resource_size(res);
+	}
+
 	ret = platform_get_irq_byname(pdev, "doorbell");
 	if (ret < 0) {
 		iounmap(epf_mhi->mmio);
@@ -896,6 +937,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
 	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
 	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
+	struct pci_epf_bar *msix_bar = &epf->bar[BAR_0];
 	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
 	struct pci_epc *epc = epf->epc;
 
@@ -912,6 +954,8 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 	}
 
 	iounmap(epf_mhi->mmio);
+	if (epf_mhi->epc_features && epf_mhi->epc_features->msix_capable)
+		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, msix_bar);
 	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
 }
 

-- 
2.34.1

