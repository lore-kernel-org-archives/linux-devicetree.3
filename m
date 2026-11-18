Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982819;
	b=O8gMIGBbzYKwKji+Qm1PpS4vbpBS6nhd5l6kqz5AAkTYeBFZa+q7nlN4JMGaBKzne6HQ
	 ApK1pepaT+yAqAb+8gmnwgGouy6F5BTOiiT5cNQH1JVrno4R175dI719KKNtSUt4qX47R
	 nuiWq/x7gm5Gez4+04t86gTo4feFE/Bdwk0pn60ZME+jSRl6dWHjbBCYcNQIe5DSpzxIv
	 30RRfxh9fyak5TMhlje+sBmlH6CyAFiKS9swp17OifFQYpGzNe8TNrveGsm0tmidOBL2Y
	 e9qb+d+tZfbfk14KGN49ywBulNwGxwQ/17GmRjyFmhIj2ax3tGU4OxvkmjA68yPredQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=406sHpRia6hZEa3PSPTkF9+9bpDgz3KQAnPoFPfHm0I7L00EH7L9RVT14lKjATW2144+
	 h8edt8qfg05vl4JR47Ka0hvwJUswxnX1RmSDE08iEw971GalDASwM+vFaG9q/eHvgd/HS
	 1BlynhIiwwNAmogVYaxqO0ZFKW8rhRhwZicm9vPDZCHUYgeKVwo+FJn0RUeJVH8rRqqF8
	 GhuCQpaIDAjewOrEfur/6BMZ1F/1YNPByyIoRfzJgHg7fd+xY+61CiRxHKTGTk9N1LXrC
	 JcFcOlOZIoiqhVRCdcbWJhSr5+QMvJ+HbPggqZyNYk+Tkb7bFBOpiPUHCDOEl1tFQkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AXbYmap/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6960A2614
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD6960A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXbYmap/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwWl1959723
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=Y3jPPzR8mOV/BonK
	lBRvXmtMYaTAitKtjPjJC3235gUB87lBOZ+Yq+QA2ZsGdo5PhG9GJwPsSJ7gOPGQ
	UA0EXrG2UXygeyQnPdOsRf/q6GrnKDgfGQ77VLFP2gxuKRaLhNFCCDk/lcE8Tllv
	BluwG3MoHd8j4ikhPrWCy0xVLtVpK/bAdTrmbtM19vHPJPWfAVpEU7ULwL9jyMtV
	bBc+oL3Mi5gce+CU/Wc3CQyOAywRr8pautqHw+jbA7/Q1CHxwlAdHcIPSwIevhYx
	zvzXX6Cx48reYBN4DzWAA6+0bMOXUDdIiLaBsvpg/dniVlVA4admmHH6IwdjX3PA
	9UaghQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hh0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:20:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so583921a91.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982818; x=1795587618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=AXbYmap/yUONQYzHi+sHxrL0DkdW3hqI1oZEVA0G+sOu2nIdrz3c91RfRQV0JMENC3
         R1TD+pCFZcOBryO/SybWtmxn+KByR4MPYtp+v+NXWgPXgWG2HCH9E80Sb++4NCTPbZAL
         8VCmVx0mklM1Q9Q9/T9PqMquKmYsFK+goBHxRNuYIb080E81quIlaoTbd3/Z0kLyW7bI
         IJFkFlyv50zQ3c0jF6DcoOG78/J2VCpJrplvWTnpx4sUL7Mk0sngfpvqQLJcdmzcBvPz
         H1rlbIbRRzvCFmnHe6t339jcLgtrvCh8gpbYMSVcx2grdJhECeXT/PmklDuwJ2vIbbH6
         ZyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982818; x=1795587618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=u3Uv9zMcqt9fAjQg9aZ2trZn37AeiZbEXz13COv554gXFkk1Vks9TBR45HTt4C02A0
         1Fqiune4HTF7Ht5Ey7SGtZKAU+ogp/lKG6xvLpsZQi85QkPzDcEf+4ehfeB0AW6iKEVT
         Xde97jo98mekcUvYCVFJ9e4dnJSxLJPtRnq5wocyAjziePfH9WzTTbrV7w66w+gN0vI3
         v/waKL5xIanf76yhA1ssEkZtsy7feIEWM/Ve8w+he9nyMR0UpaG51+5vkiPO8xkRJwMW
         heMrsDYhPvsdiS5ShapiQ+9gyvcu9WNHTEdrk7ejV38ZD8c2aKU5Ne0L5yxK1zIL4FD7
         UM0w==
X-Forwarded-Encrypted: i=1; AL+hErGlvfJKcqsT8BTpstjmP0Q8hGvEYjysKDEJUW1ywXZLkIdEalsh3vSOCs/zq3Ya3McoumNZkoQsxkwr@vger.kernel.org
X-Gm-Message-State: APuU4Z+88hkvd82TvcdAIjX6g8xRPIRnGagn7nrvcikoS8Lpmci1rNNL
	CY9D4ZGXQTroOKW3AivkT/2aaegpCHDR3qZhz1+8RolF/QaW41v2odt7Hw/o+226MsJrVo7vAdb
	wMW4qjC8VORdTyzWKC1bl8AuFyvW1tHeIrOeDaACdk6EHUTLJh7+RkJbIJ0fwATuq
X-Gm-Gg: AZFdTZd4G9m4zYl8vCgKfcjcLqCho08BHrd1dY/MITllZWf8mhFCt9+qKYAovBOIH6p
	b15qGY4EYnatS1wCl6dLw5ivt3FPrP/QoGI3RV2TYxOYHGwcnd78lDOVvMqUgZhSGla0T13AW+Y
	xrlD9o9MUd2EyYmNay2bELrG0xYjFp7KkGPLmARFu67bvKfHB2Wy+jdFV5/S5ZcW4dB0ObtEDuh
	oXL5GFhfNrx58q42jcKImI/hSMMWcKthXB2iXWuVKhe6GTzT2YWOOTfEOE/33tPjORq1Hvltmw1
	AYPUZwjy+FBFek0T6mhbVwabTSDnXlRRaYLUTFpJTf7fUppj4CnquvPySZM0Tz1YcXOvhoLiaRI
	PaupIKMeTCVhbh38uoh0Ix+ZQYTbU6WHzd6XhTJvgzQz1fT5TeRBN1ZEd+ZM4gIsEPdYrNl9Wln
	17VF+/3OK9XwQzAg7SzfYM6JHte2FQ7yu4tBehThrfQQK9DbOUVl4pk2nnEcdQyFFnvxuz9oiRZ
	TM=
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653306a91.35.1794982818120;
        Tue, 17 Nov 2026 22:20:18 -0800 (PST)
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653276a91.35.1794982817603;
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:16 +0530
Subject: [PATCH ath-next v2 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-13-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd43a2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 3-3WWBqT00_ouTzsJ8m2H4xRQ7K4dKYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX3JeRXLVsTA1J
 EoQShv8qpKIEji8mSBTBS5YneMiyW5Z+mFqMBQDeOypLOzOVMb0rJJshRyTrAMeU0r57QTAwAGC
 gn56LNFmXtOBvdHjHUOrgvdDK3XK49xNml7+yPoMm8hLSKbrM3iD3XEk83NrCf6xESGiNzP4BVQ
 MLeIHyxiuoMogHCgMruWT4pJnHVMuGc4r5UVKEZMw9vnOBb+0LRnys9sIypbePLXnd/zBpE6+07
 XxHBC2gKTywh4BFqZwASla7F72umlw1R7l6FU9IoW/LO7zvYmbNt+CE1z6F3WtNvPk7PBVVARk8
 Ur71dGjPvtc4iIvYQ71xNmm/aCnWAcIe90oVoFuwAiWyonzovvvpJ9RSbAE6Tf+Joh4A1znroGg
 DDA1C5ica3GurQ6YCzPYPFINnUp6g3c3HSJ8FbfPr4AVzhe6AlPysSHg289gne5Di1TLyu1MJmW
 hqeCAwuubHppVblxOSQ==
X-Proofpoint-GUID: 3-3WWBqT00_ouTzsJ8m2H4xRQ7K4dKYq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX1PfP/Kzidppf
 HpAnEDQ1PxfAhYjBSD+28UNhQ73OZG8rUn9gRrNT8KcdG/pgKkKpLEfYO2/Gv5Vs5Kq0EIBBloT
 83oyxw5L9PcKqO7Xja23DfqTAEslbdQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

