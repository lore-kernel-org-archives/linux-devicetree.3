Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538680;
	b=eL84q8TrirMfIzuPHrzgJu8qutebcY6RuUuWzZtIGFKHj4xeksQ7kAjN6Zf8RljrFujZ
	 3BSxyi736L30Keh/2FmmAcPkYbg1z/o3nkz3ciil55mBAGUL8CuM+KRXbZ5iExgTiMrGj
	 Zz76cfuiLew5jEd4FgupLc1PG/Uz+ovrGrmiIy+xa7BtMnk9lNqen4warenRwLoG6RJNE
	 LGtmtaiNbMh47AxlwasvykevIczXtJEl9il9+qixlaXzKXRdUQ8R4JahO1mO7ueM1/FX9
	 XuBJvzHKBeXH9Qf61EHEPthosusAy7y88OUv3y2CZala/0jtJVe9YZEkqMsfxeWpY7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=fOGH/D1fGWm5n/BzhDmfjFVrF2pdsMINpefGL40oUT57C7yV15wiF7DLyUEVSLWk8DrS
	 vkVYrK2AQ5Iz7BpAl89MoUSZReh3N4ZCdMBXYFZ44+untSCAMlIHtVHPX7JBdtI37/v4G
	 i3efMepzLGRykQ1aynFDhFdhxQl/+gKkTyunO7kfKjAv16ZvEkFv8q9WiKc1QkUfGeUi0
	 pIk+Wg3mnlVoMA/Ly96JeAXLqKTD2aZBIjE+gUEZRM7zKICicHkDwVhque/W+UD+ev93m
	 CxaEPYgaTS0X9yf/So3KlrwiM+eN81pld91oAAwvr/cxhB4c/9Dein413SzXnuEowWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwfK8vbj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E4606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwfK8vbj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLCFN1215403
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=PqV0EkHYogXdhnHT
	AMpAdHDUXoutgpJcFFDj/H/HBwszQ/DuWwkZhOf8eXhnTAOQ1/LFKiNIg2Rh7vcj
	u5gpjtLcSjSa3/g5rVwBKmSqBLFH4B+v2T50OKvXrq6rtfvyL+UTVJzsBc0tOzRH
	vfYfk5cWC8Eo+ZW7X/pzW0kghOCEdFNTnRiLJSGBsL6JPPFZ6EJFOaoGYR5oQSKO
	3QBVFge19Mtx6CZbZLoSCFQ6+2LJCvMMfeku1bWgV9FwlY7HHng6tCHP7pxpNBvB
	dcONGAXd/Eses1gvWouu/rxQu8O1gB5bviTu+ayoyS7o6TuirSonfofRqtqlpoBh
	G7pLCg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpjueg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6595413eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538678; x=1796143478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=WwfK8vbjzNQjTPWyfPhdww9E884LGH2+XOe4GWGTsgzY/7tKKyayhv8OXIpaYJSeDt
         P+1/8HpVTqykzrrcN/vzych0PSkTTbkjoDMeXJTPy797rnuekzlq4HfJxksKfmFua7Rh
         sxZdA7JIFyFu+XFsjXgN5N2lrVDZJTKkE41ZxEaYxz7jUaNx3ht99LxJ+cef/kzapj7+
         PGGu388uV7YCZ2Ee1mUEIqEw/MxB7r0r37LYiS9Z7rRMNqLXua4yRMsHKM3NhT2maZTp
         DcSFdD6D1KdqsymUkdaODv28fX3/yjS62+LO9J7fuPX8FJ2W188rAH4VLUl4symh4Blg
         kQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538678; x=1796143478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=MptJurWpDo8TkJ2deq7hNZ8Ps0kUVlZlylS+1t5+USnXeH7aO1I14vZ5wtz0AMf8es
         H8dzJNe12cG/254l/wYMAqGCTT/axn94In/SFssGYx5DttepIkgqZzzAIUVLU5mjAUae
         P2QNwKTFsssEqvlYPaVIOzOciQuzZXuABWOum/boRcXObqmJPthh7q4r5VIG4HKkQ0Do
         hL57NLvkWH8Ci+5kVQYAp6WVEtSoLCNYpDydi9YfMnxJ6G2+IE1MPP1nG00jDfhvABa/
         pg4vDkb88phOjUhwwBr1C+x6WkiCxHG1P37WyF63W1k0wLV/um4hj3Mhlc4zRUnGL5n5
         zqnQ==
X-Forwarded-Encrypted: i=1; AL+hErGDWEDWmY1zjV2pBOAtZYQccDZ+D0GMl8/aTCClhAr+pMv/zew9FRvqdjLWdIZT2yerJRh0k1EhS6ff@vger.kernel.org
X-Gm-Message-State: APuU4Z/zzUoIZ1ms64ko8o+cCJXZjmRj2xOGH0dNE5+wPstV9ur2/wib
	MBpZBRo5NxcQnP3f/ggUBQtrq0FMoPenLqSew6UxCXU6CHiwfg/NKCppg8f82g3t3RvV4htvgjp
	F9Fbz2+Z40IH0D6mq+uD4JKEHvpLwLlSm0SrKhTzpjZgBYUyWY9ZHk3hOH1DjVcGQ
X-Gm-Gg: AZFdTZe6fepRCoSk8JUqDcNmj2dDbnjgck6tLy/pnxQ+DuRYCgCvUKtYB7J3YWwlnGf
	UbaC11kBQPPuPCj/7SQgXsadp8wDOOAaNIVmVCwcxSJDux/miBEVdmnlt8cwcvALmJf7Y4j46vU
	M02xP0QEsAqq7GsSD2PMlYY+eaHNVEewwIrVFQcWHRcu9ZtzIp7T0MfDQY6lTt0QFeln3+57qWP
	E/PAIMHnpDOPxjEPALsyOTqVy3Fa4Uqz7YthwDh8HcwlxcFmfncVfBQxIZ5LcVQ+csk8c5t63JC
	fADoaM/qHAUh3Fc8/89ytKCkSMCUks67oojVG2W0NLitiWckw76zLkgqsoKhdasJhywMqcqheq7
	QHzmMgnG7NxTCunw9Gh1IeV+ZcBSucz6qXG67MgIDCyRWRgCg/QKtuvwwHpqlfL7y2saMdNo9dj
	G/rWEHLjeAdS08CQaJyaILCG46ZItqknl+FzDeYPJ8VMDMfyK0X/Y357FM9FN4nBUAAq8qsY/2m
	jo=
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780129eec.24.1795538678041;
        Tue, 24 Nov 2026 08:44:38 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780097eec.24.1795538677370;
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:38 +0530
Subject: [PATCH ath-next v4 12/14] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-12-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8js15lbQo69u
 NAz0bxz602PwdeF5c/uTYWBAD909y/cYH9aUnGneqXcvNy2fbUtHkoYK5U4fObJcLdP2qaWu/UO
 JffOOXC15uKf1uKd8cVvXHd99eyC65e9bQNWYpyw0+Nxa+jClvFUav7wCUkGc0xGdResJ77PSYv
 sQe+Yglx8jKGmoDm3SmzUNsTlDFk4VCWnJtrUKFz3g2kDbxA5xcZlc5ubUO8Ic8LR0gKazAVq2m
 uMq4oE6s0DGacsNIVb+VbNOV+EBepyAOifSuW3bbVkcn6ixIheqMi9TeQ51ZZzoKQ+KD7s+itmU
 7JYTLLk+/Xp/I8WfnEF98snPVHJyCuRspDE3GTFg2IXvY583ihmHZzJzlLASoTYgLrNIbroBFHR
 STV+wInTBcxPBnTq5Ip65gbg6/4esxTxNzta2AMnUPcHeNm5FZEvaCZgs+mnlzxlkch0nhKbb8D
 o7sY0oz1BiziYB2ETgA==
X-Proofpoint-GUID: 9hqRmI1GFGoz___pXa4Ntmg3WoGDGFTQ
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05bef7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX9AwD6+FVAJD7
 oaBj8tUaCRVC5IfA2dGY7Ys7xIeKK+3Q4qvnkptiilnjZPfrUsN0/oZxkpvbYhViSnk7s4Sk+Ux
 oBjv4B+j6XVDnK2M4NrRaeFvtb+68DM=
X-Proofpoint-ORIG-GUID: 9hqRmI1GFGoz___pXa4Ntmg3WoGDGFTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

