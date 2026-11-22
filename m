Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316200;
	b=YdTEzWS5gur71tkXyJnkfay3VHF+odfrQ9Vvs7q/N4A3UBPOFZqc/Tdp9QH/WQ48n0qP
	 4xTDzb/nAbMW2fr6EDN4y0IWCzLfAnObXLaxj3oaXfsgHiUWEVd18lSmFuqXIVcxWlW1j
	 Fx0Yo7MAjkNdpgxoGHjRf9iu2UEv/nUBiEo9s2ILTKDKu7GHk39Oj2yP5tPgdb14uUv9C
	 mN7LiWgqEkjbHqLl5gRUBJoh1MAJPbk2M3MePS2uPubneIEoNHvkm9aicg5ZcpcxrMmM8
	 Gn77fBw+0EE3ezZVTdjeBvBrsFBBoE/dP7tEeJejG8QYyYqkogKq4/lISDv3jikhq5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
	b=5q7IlEIzIQKOdw1SZXjp1nMH3J6ymXRKjnaPaEk/5mdemBUMEVc+ghHKSUlCWBrljsxA
	 zBwBnVMAbQOwVZtlgofe7erBn9qz9WWSdhR+wpZumvas/mCuB+ZFB1V5lRStpK6NixAve
	 /YfeoRug9VWgUAVpXLpV19+XkULW7O9ClYH77WrA2AWxmXg64BvnUYrnbf5+mHX+GOVfT
	 PF4wdVlCW3yBobpK0F07Hjmoll8JI/05li/DaoLTFN+SWIJ5xoGlKe+6JEG9ZaIK37FnA
	 4hdp8P3dhbGs9ILgLllH/aIcMSNGCdTC9JbGt7qd7xdxb7YlakhYGwMOM3M5V8KnDFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQSI7j+K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=geHvC3Rv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12189606A332
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12189606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQSI7j+K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=geHvC3Rv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08TMQ1649482
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=; b=RQSI7j+K5A8pmUvd
	UuJgvxgYgSLpodMd+K0ODeH3uJVk5686TTba1lHpmBjptUjPztoYxHh/rK58ULIK
	iAx21OezOkFDDMGqbL5XO/zkRy+RHF3bcOl81DWKbMlYbyy2VzYIBFKEKky6AewB
	c7D3PJbKx6Kq1piJ3THI0H8NTdXHu1AeUPBRxMSwKlkQZ5r/xriANaSj6iEE/2Ih
	1SpDdKJLHBhzP2ctCnPGMOOSgE/rocbd6qi+X3SufSgNLJBqOenijFVVICMt1Y37
	sZ7yPLZ+AxGEGqQ48yMUfzyzaLlXkqudPk6Ahxv88jIAc4SNMQB3AyUmA6qH91PR
	AVfNyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgamev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso7154705eec.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316198; x=1795920998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
        b=geHvC3RvsPWTF2AB5CXrjmWMaiAznSvPL0zQl5JkvVrtj3sugN4gAP1djLHNaxriHc
         WtYYFSdu611iyWVT7iDcU/r55loJKX2HVJ+9CH5fwIn3/eIN7iGy0enOhCLQY1vofqkm
         Pg4ZTEFsjUtOjLlUx2jsOu0kSfIF6dwH4WGfvdDiRJ3lonu9Z7tAra5k5H5zf4wANbdX
         ccXQldKuNtCLxOjMieBQ8bWEjXxhdjG07Bohj2s5Y2cDWiN+ShNsGtfbyiBMxrWPJivl
         oU7Zh8K67UjQv9D4HAJp8H7mZy07k2fC8j6HXVuGr6kNd0J5W/G1+Cy/20/8FKjJJBC7
         zWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316198; x=1795920998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
        b=fbgYATE24uq+xBH3ggbUIiRmUv3sn/B7V6YNrydgLKpA8l1k22eCVDD6EEhGWsGYsP
         iOppyqNMrHuM9hbSyhhFLDsANaVSULCWtTga188RDdLq3uSTEoTevcugMa2BLkf+pAUs
         BY1msQQ+ni6upLsK/cpERh5aagoPgw4BH/10L1vQGKasNHZfXg15XU75BIRHy/QE3HFC
         P5dCHev10SnZbnakfP+X0hEx89CSp0d6O3paFy7e2kNaun5fTlDXSaqsE/0056oNIpOf
         MfZ+auYxqplXO4KCAAGgVpYlIgKzufQOd+lpKtleq5BdjGKbnpT9q86sV/CdW4qbl905
         pOdA==
X-Forwarded-Encrypted: i=1; AL+hErENVv2ykczI1Mg0MmRMm3KYTn8OKe0S684ey3hi98lJIIRWaQzrcfSqTGujbyfDfLM24n2F1ecfh0rM@vger.kernel.org
X-Gm-Message-State: APuU4Z+hBSyXH3kCYcgN067BYxeAX90SxV4tq4F8xmLdc7eqxtK4DbaT
	RLx+BjPbRxWBaTr620LQwO3MLo2FHdhQnOONytRkuCoxiQa6cG0b3y31wbWEdzXB0P2601wBpW3
	+IE599P3dYMkSlJYPUGtWvZrTR0JQqVdZgTja17e2OzN8X2qERBl1xZiFfDIFdc7x
X-Gm-Gg: AZFdTZdHNMdHQXhfEGdLy2raFQxAG3qJCMHu7WEeJ55T6x5IqBqU9qp93GpM01RMQ9k
	hvw48AhS1NoCLZ/bC2hMVJbwbOCqSwdo0ax2zwHqpSXm0egP0dBtRNyJIGJuNGtkdAca6qcV1ot
	CAdx+eDr2/jUjT9zgmecoAQqa7qtMCIZaY1YvrUQduK3mczmi+QEVeHaRchzVVDWBlOzLKzVEZn
	wmxoG8oJzsWGlJ1NUIcvWrooF2Y0z9Eiq0p3Gu5H0OvttXmYtx0GShjuQZ9PIMMrrQJ89AMy6XX
	Co4KztSUQiRnrFJU/b3bw3hxU9Xob8JhUHQUpfV36qFpSXIJ9EidQzPMja6IvqcQ0lHRUpTsBwv
	/sMkXmQb2VcqT6tccqIZptpwI3Z9YQTLCrLQcvTbalW+QSrAgQqx3O/tg9w6ubyc47U6+A+ULbe
	0pxT8GUnLa
X-Received: by 2002:a05:7300:d788:b0:386:83e2:a8 with SMTP id 5a478bee46e88-38683e2019bmr6001421eec.40.1795316197942;
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
X-Received: by 2002:a05:7300:d788:b0:386:83e2:a8 with SMTP id 5a478bee46e88-38683e2019bmr6001400eec.40.1795316197534;
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:14 +0530
Subject: [PATCH 01/11] PCI: epf-mhi: Pass the actual number of MSI vectors
 to pci_epc_set_msi()
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
Message-Id: <20261122-nord_ep-v1-1-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=1340;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6lmFv0LMj1kepMVfDNDhSTwXYq+rLdkqa0JXEDLBBAw=;
 b=tnhk8AOWx876pmrvroA7ZDRtfUiwnAUBPSnRNygL6UV6R/OUsYeZ7zAh7AZIjO3nYJCs9xbPf
 pQ7msA7ylnuBQdZX9/LqbRBB4npuNlgQ/QymPj1mWjJOZcAVYnUpaxl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX1Ricpy4e9se9
 4FveGNUfiAWl/JSHqxnXjGUT/NtalDjRlzm0ab2kwT114UjFgSDG9RI47AO4lAknZEubr2X+TWC
 sU+hRwZQfMCk6dKHcSMRc95Jp8cuo4m29Rtqyt4/KnXCSzlH0PGfbdnWiKuo2cbkY08KvBvxfAf
 erk4QEMtQCoeLEgcUMHOJyauBwPG00q2c2CojD/qS8O1nhHMgOOJiDVbhtTsp5qNfsed37pvceF
 1iUhjYqDF1uEAV7WJoWfB1lL6WFyy5FDtP0yEjMrb3UrxKgz6KIDSEotmdtlKbVblCuezQNjH2K
 VoVzHGQswNtFO0lcN5oL8yPG4RHnaif2GA5vYiQbHr3kdZ5+yxIg9bD5yD9XxT8MiPxg6OZMsp5
 lfyQVDiOf95uDv1Gxbx5E3yQqCxzSHpISQht/GTbUC/Gcwy5ZT/aJKf5rnXD28FmlTAhwcxsuBK
 HKGqTx/RjsIQRkJse4g==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b0259e6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-BGyM8POLA_osPWRVsoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX7iu+mhlLKwSu
 qE1hr/oHLWsrtaSPyFMig6D3cAQJquPhaky9BkKlzd6iu8Bqp3V5v7Hbk4A6+K8x4sghKot7VVs
 57ZTVtT3Pv4Lb6s1ZeRUDUlppF4Xgv8=
X-Proofpoint-GUID: m8lT_SH9-TLwNWpORWA9oa9TFyUB0uDF
X-Proofpoint-ORIG-GUID: m8lT_SH9-TLwNWpORWA9oa9TFyUB0uDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

Since commit f62da6e7270c ("PCI: endpoint: Align pci_epc_set_msi(),
pci_epc_ops::set_msi() nr_irqs encoding"), pci_epc_set_msi() takes the
number of MSI interrupts directly; the controller driver encodes it into
the Multiple Message Capable field.

The MHI function driver still passes order_base_2(info->msi_count), which
is now encoded a second time: for msi_count = 32 the controller advertises
only 8 MSI vectors instead of 32.

Pass info->msi_count directly.

Fixes: f62da6e7270c ("PCI: endpoint: Align pci_epc_set_msi(), pci_epc_ops::set_msi() nr_irqs encoding")
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index a633e47edf2f..52cfffcfd5ca 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -730,7 +730,7 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	}
 
 	ret = pci_epc_set_msi(epc, epf->func_no, epf->vfunc_no,
-			      order_base_2(info->msi_count));
+			      info->msi_count);
 	if (ret) {
 		dev_err(dev, "Failed to set MSI configuration: %d\n", ret);
 		return ret;

-- 
2.34.1

