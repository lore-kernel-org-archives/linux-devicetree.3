Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D43EEAE9
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270465; cv=none; b=Tn6Mv9olb5VDgCvwFzpHrPGI6tiTNhsavNKVDPYxQQH3i5TF6j5Y5ETS6qbOwXaVghd0/EHqTqFj3VSuWie9zIMj57t5OYpjaNi62/82XGkBi0LWdYdNZItU2TJFb3srTSbsLZU5Es/Qg41WXTTYnSSZtwIHr1ToB0q2mYTkYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270465; c=relaxed/simple;
	bh=ND8QCWihnx/5SzmAjMX21FeKkkTEai7fgVEY9yu2Gdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkFr8+Wp4x67F/UalYoKnwLoI8rDxSA7HH1pG7M6ThtJVEGJKpV7h/nALWQqEtkZpUl0gjBrZTmX9X9cS6utEYmt9jF5BzcfPj0knafqWf08NJuBT+mk1nhuV/cwnXpcmOZnHdrsgBS0jbc1u0S4/yqUpY5bWF3m0Ta1+GvRTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ih25a15f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+y7On5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ih25a15f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+y7On5S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCixC93716162
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leied0AaOznatkz/yNwlsN4mHUViLaKycB742NpUAE8=; b=Ih25a15f7iXbpzty
	m5yjqdwpdGC0IJlGeKlWrAQFy2yLuxPcCWLUN8imPBgtPjAN2FeWU+7FvlYmF7Aw
	WDhZ/Fh5xxkRuZ2G47GesuXjMjrqPzEO5eLNJlUJ+6d4EQRonYXjTUutDr23Ilkx
	knHZSte48LpRQMBNP8oukwa0eyryq3WWcYPVFsJwTXnnLFOljrMZ/kLSuSDH7Jfy
	Ap3/z4CFWrtBu6m+1szEDiF81RrHgu8D+65N+qeR9NQ3LtBmF0876KMYSU9+7elW
	ET9ZNqVwygbI9ivhL5dBV63/0R2CpY6zAWMJcecJ2+Mjwd3wLtxpZN6ZoqtoT+/C
	BpPZ9g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd3j4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963df05f08cso175781241.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270461; x=1781875261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leied0AaOznatkz/yNwlsN4mHUViLaKycB742NpUAE8=;
        b=D+y7On5S4Nd3LyiHl3/maoqli1GLJc9ThwAccgTjV/KmliIy3NLBAmI053ixl7qKH/
         2nGKAz1+r48Ry5zKlf/jrqpIo70G8IqvapLgzjM+m38BzVV50QDjAdtX9Shv25AbWfrg
         LerPPdQk88gCezMxOgAk4ULfEh4OLVZzDZE0isjnAmZXQSW9EqKbaMOBN0O+HMY532Gj
         WYLpo3XisfkThqqj55k17mc7q+yqPQWLhwLoWT+FrwplbTn83Vsf21RE5DVEZk5xMch6
         aXLBFVeCRY63wosn2GZ1Ex3mIk+EXTihRgS/TU7VO5l76EKdz0kQU1E2E4SeqYrzrdmz
         5QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270461; x=1781875261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=leied0AaOznatkz/yNwlsN4mHUViLaKycB742NpUAE8=;
        b=QwKQ3iTEBYc21/I+01ehpKz9h648KLL0YwFs70utaJhuOutbMixymr1pS1OoWbE3DB
         X+kPRKm6mTHJCPEIx6h0ePdUcyO5hwDTo0uT7N9p6yBJKJDiEKoB8gOmW/3Q0hGWe73h
         1yMb2WIVaUKdGPlg8docxYjhIO8UdL6N4HEFy9YTGtK0UryyeN/JD5SgVuHTtNrohfRD
         pyJnZu6z3NhQvbcUejCBFfd/cxaoPdgWGo5raAv5Glx3FQ361uwuJiutBAGKqPdTrual
         KFXE2HDHS/yHf6qm7OIshbHX6HG2xJwzQA9kF8dBzGVjRkF0+EGsRQHbFwf2cUuxMazH
         anJA==
X-Forwarded-Encrypted: i=1; AFNElJ/sElzdfg16Py6fqbN8RxnDVAquXctaw5u5aMmpH1Jlzfep+4N3gZWjkbaFezeGG2SoP03YLnGeZXd5@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAnXwZhBrQAC8e+ADdDBQIaaTX9Dt2ayy6+lVzd8fcj3SiboC
	lEPNfJwhzHFRqkEBg4PbGoF2UxdNG9hyZ5FH5kfXayl4OQ/qIxBCisHRMcmuSf1YBU1/bAZdvEl
	F8QzKzh3csRmjYBCVS0TvfiOCyXjTl1udy7ZRDlwzeSpVUb7EF/y9AR8/Ah4UGklj
X-Gm-Gg: Acq92OFgDbA4UW7wjqEptgadEXRWUuhTzqLjUC/vZ6X/mYjmI6JQ0RjQeA3FWYLxsIo
	+hPnZMjbPLmP3pRNvhvPpVmNN9pCH8pDfC/dhT1S46seGrDZ/Vb1xCdGDVv2WrBBRpE6cxsHNJe
	fVpm1Hs2DdITiPLGhrgC/6Vt1l+xOQd7JE0b1L9uInHLT70KEWtvVTZy7PwhQTguu7+kLzD5Q7G
	Y/0/mguSJDhyUv/Z2kZoaJcLBKRAauMl0bzZTm4UCXn21gJD0/7in9eoujaGInWz8rN3FfSphCs
	J6N7w0xfMZNfAOVqJBrulr4zl4lCQKoc/82jYLCBsPWKryCYRvQl/pSoUQpqjlGqwkX0e/QlEsY
	I4HHdpLl3LO4ZfrMlxZ/HgZYyfAptAZoIrSWHPTbXc7emUwiRYlBO2Aaq6Dm15uZp1dmIUge+Fd
	FW5zYvXCDRP5lXzBHExVvWrDaOHxbhSqcDJbt75jVntGE7VrVfaSZAc/PKfmkmgu7KnSUVeLOB
X-Received: by 2002:a05:6102:2b89:b0:611:61d3:819c with SMTP id ada2fe7eead31-71e88b2a46bmr1202662137.10.1781270461445;
        Fri, 12 Jun 2026 06:21:01 -0700 (PDT)
X-Received: by 2002:a05:6102:2b89:b0:611:61d3:819c with SMTP id ada2fe7eead31-71e88b2a46bmr1202596137.10.1781270460929;
        Fri, 12 Jun 2026 06:21:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:53 +0200
Subject: [PATCH v5 1/9] block: partitions: of: Skip child nodes without reg
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-1-95e0b30fff90@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: cnDPf0b59QOFzLB43XiYKfIMWwYT4SqB
X-Proofpoint-GUID: cnDPf0b59QOFzLB43XiYKfIMWwYT4SqB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX5YuwshWxtpdZ
 dlxYDUqYJkyb20sb59jedwr+F1Xw5s1rjgQPwb36nBiilE0bGG2yfCkPodOIAq/PuTD729wGbnZ
 aYUH+0tmrTSL2A+dJ0gXknHpXoB4nLD2/4bJqPFeOP2GZpqWnVOEhf/3+n1Vf6I2mP6nA759Zi8
 jJTtEdWmqqjmatXx+MyV1Ap5/6IhR/e8EH7plCCLwEb+H7huwgzJEWackSQ1EjR+T4k4qT4aKOf
 6/6jfbvZGQrNuc+aT3g3sJRktfV+XDl+w6zUaNgxR8AzYpJAssDuDftKfaVxPjx43y9d81YYkPB
 2qV4o1/dhUMO9XbjW38XBkFKrOf+5gBn7dQcVPBipood9ak1EpdNUt6p1v0+5i16olnYYx8FmfH
 tn1kftVy+GuDB8LlPQywOVduxlNhNmd0/DefRIc1toBK1mKhFWjBaFgA4iIzfwEOLjV1mIuO2Vy
 xXfgj3SkGBtSgNgp78g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXynMMZ5RgXROT
 OtT/kYJrdrXX2V4QftHwLg4+NVigk261Rv+tEG+c2QTVAKPzKl+3/1L+78rUcdrRUOPTW8aeAmJ
 vOx3S0eqJAR7yNAldzGlDFaJhFXcJKU=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2c07be cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=e4y8cmn4OwqddjlM7QMA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

Child nodes of a fixed-partitions node are not necessarily partition
entries, for example an nvmem-layout node has no reg property. The
current code passes a NULL reg pointer and uninitialized len to the
length check, which can result in a kernel panic or silent failure to
register any partitions.

Fix validate_of_partition() to return a skip indicator when no reg
property is present. Guard add_of_partition() with a reg property
check for the same reason.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/partitions/of.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/block/partitions/of.c b/block/partitions/of.c
index c22b6066109819c71568f73e8db8833d196b1cf6..534e02a9d85f62611d880af9b302d9fd49aa4d46 100644
--- a/block/partitions/of.c
+++ b/block/partitions/of.c
@@ -15,6 +15,10 @@ static int validate_of_partition(struct device_node *np, int slot)
 	int a_cells = of_n_addr_cells(np);
 	int s_cells = of_n_size_cells(np);
 
+	/* Skip nodes without a reg property (e.g. nvmem-layout) */
+	if (!reg)
+		return 1;
+
 	/* Make sure reg len match the expected addr and size cells */
 	if (len / sizeof(*reg) != a_cells + s_cells)
 		return -EINVAL;
@@ -80,14 +84,15 @@ int of_partition(struct parsed_partitions *state)
 	slot = 1;
 	/* Validate parition offset and size */
 	for_each_child_of_node(partitions_np, np) {
-		if (validate_of_partition(np, slot)) {
+		int err = validate_of_partition(np, slot);
+
+		if (err < 0) {
 			of_node_put(np);
 			of_node_put(partitions_np);
-
 			return -1;
 		}
-
-		slot++;
+		if (!err)
+			slot++;
 	}
 
 	slot = 1;
@@ -97,9 +102,10 @@ int of_partition(struct parsed_partitions *state)
 			break;
 		}
 
-		add_of_partition(state, slot, np);
-
-		slot++;
+		if (of_property_present(np, "reg")) {
+			add_of_partition(state, slot, np);
+			slot++;
+		}
 	}
 
 	seq_buf_puts(&state->pp_buf, "\n");

-- 
2.34.1

