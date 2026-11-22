Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316221;
	b=W+7lgvUC8vfp4SPotCbi63NU/7Oev1x7Y8irlK67mnB7vjo14daEyu9LXWCItrVjl88O
	 b2nrVmbsR6jRUL2MZ9t6lBLZiAV9iQiaeyW0muB6OS+0SHUcP2YB/JGbuG7RLYmk/CmpX
	 TxNFEFOlFeJd6W+4XXHwqwjD25dtvlcVCFITWpiZCXWRFj5qUkbY2BuZ70G7wzfBXPTTT
	 s/8jzXM92vY335z4KymVFizAVubE2r+3qTuln6qbi3pq5jtI9hrUIm4Y8qNHp5hZ6x1BK
	 8s0ROe39dcju2zhIJ6xa0T3QUUsWKr9zyYDdArrP3EAaHmMOp99RFGb3k9INmapchDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
	b=5mW1kzQepiKYoGeJqCttaQlXMiVZN1LY2U6NvOxW8322t2+Uvw+3JXdi6t1OCMKZjHEL
	 BkXM/dIGFXuEgeU5fN/CqCk/g6iIiq4o9BG3iggN/6WQV7cnOih+W4hEG5LpCTaRT/Lxv
	 goiFq5MGfBOX/0rr0V6Z8xI0ro+pYlVqxSiZzRTqZLKaKq9n/LD/GZny2yicR54DucbY9
	 ACEYG/w/NhwMorihRGHLd4qfnk4zRxM4AAs1cE0QNV3tMBYqlloi7MSV+DlJzK6R/63ZZ
	 uyu3anmQcifpZDhW+AsiAV8PbDkZt/YEzKUF04ZDxSY9oOf4EAGwyNs7t3uNlrNNcEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K71w6Paw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nq6ghdv8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC7C606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC7C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K71w6Paw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nq6ghdv8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08PHO1034225
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=; b=K71w6PawdporSph0
	dnKuzUY4F29USvSCrf86yHj625sjEf14XoUba8J3V2lF1Jio/iZSLyE4RW2A5yUf
	PxRYAEkNM+mz2tiZ63EvyUC9At1Pl0PT6iJonVfQNJro4WxQ7Q6Hehu7XaoJA0HF
	tvr/AvbScps78NkPhtQsg6JKhuq1wXzVf0tp8pFadlU49zsFyEISoEqjNWyM/cqe
	p4IgsWcbjHjx9VlA3cajuYFZsoYMyktl96jPYtgvdgXqanrwyftNhOM90NqejHjs
	eBAJEXT5l05FJH5Fh8uQKUF0COBCkWxyDsUtkBJeGOiMypg7DCaTeCDt5zriihmI
	kalV0A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka2cu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3056490eec.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316220; x=1795921020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
        b=Nq6ghdv8MvY7aj7tfhoUEUAlZ5do7jEfscF4NkgVUuGFBs/MjxvLD7WQb7mMUSxsDl
         N/wAbQclsc/vxW/YpziH2bJhSkyvzjbEzkHm3YJ8rY/Gpd8b/KkPfylI1qMSh2hRWlNZ
         J01q/HBfQYo6xiyKbRLe+fOhBD1KUqJpOFZ2xbXw0hwvrN5lrPKE6kYpSz4Q8AJFkGd7
         uNu/jPH/cfX+aHZJz1jZf3mC1EsHWiBSiP2uYGNrARY/Fclql4LQk6IZ2E4XkSYupvne
         NpyBIDSEGtIp4r5e/X0mxeI6xuJ2uGV3E1fcrHna1kZqnLxQdcEaCeB4NM4CCRVouGi3
         670g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316220; x=1795921020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
        b=AHj59sWdXjoCacZGx2gcyEA/25HjVVMNWmDCl9xxMjjNQLeWit4iqf3tzADsOY+yGt
         y1vvhbzupPVB5515iuXtbG0PGH4JHJXJEK5YChb7I5BbipykPyDHHRbHfBOAeqIkWHqz
         3VXNepdxuyvhpXB/hzysaCXXIgAvwVjGCCyg0hbiHzfah/HAoiwhsFNIjezApP4QQmIc
         pUNyPC4VLjnIEb6/dn4FyH+9RLNgaYG87xSmZG6XJ+IU6rcqOoZMhHQX9rc21iSBwQIw
         LCe+TBqI0PoG5+4uOqJL1tLKV2vnT5vcdnqfKM2+XggETmcbvABFwEk6HMLAGx38+T+q
         pLYw==
X-Forwarded-Encrypted: i=1; AL+hErHlVdn16QnteTBc2Lu07NwTUx9nyi6bbPfY0nysv8iQX6Bd8a5NSleGkdDnVXexGpF70geF+ROCQjXZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8dRf3Hiz69ccXEnzftYPYT99CQSDU9kpRjWw4wF7kgiEUKjwgx
	r3SoBFkuogpK+npzb4uPpT0hxJ9Od4+AmMAgfy6DDEfPAno3ipVX3cNdkcWESib9sqpyTHdHpow
	3p+HSVhdLrtnsfhTjBFMXX18VhPGBF8oT1Wqzp4RVeOdv/htETw8eO/8D4N+83OsW
X-Gm-Gg: AZFdTZcmjEnTsLZGgRyV4QXHS82h8TC9jIfe1Rh7NQxRCMfRM3aBB6vxQ32SI+y8/7R
	rxMVgy0FtN0ecEVe0fNsu5S78k/YD0N/59UO7V5IFYIiUAeJDw9CFFVI/ybO/75XsQwF4FS2fDU
	QAxTRZiceWMGe5q4NnHIXZj2CWuXyLct6D5e+CXJb9Ddw7Lt+x+sVvbuzbe3y1Eeb1gq8w4gdwM
	iq20nBH3T12U7TuHbBFL5zDN/tYIfH0uJdPQ+MXi32zj9IPOihfZn2C8VqJ2jP65u8MNVdpyTnH
	9z/024veUifuWjJQqmBpMmglrWMD26NSGm2zRSrXgzoCTPPf8njxjpQVH0l9dgXVHZsT387afUG
	/U9rwYthTOrnhgQKp5rkocxDWKjDJspdnM4bs9Qq9D5OYooYpJ+5IuicJlxeXc63yQzoR6aVdy1
	2nYwWqbLur
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr10087789eec.31.1795316219749;
        Sat, 21 Nov 2026 18:56:59 -0800 (PST)
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr10087748eec.31.1795316219213;
        Sat, 21 Nov 2026 18:56:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:58 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:17 +0530
Subject: [PATCH 04/11] PCI: dwc: Preserve glue-provided eDMA HDMA channel
 separation
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
Message-Id: <20261122-nord_ep-v1-4-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=1310;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rD9zOfPOcAYlNN684/JsuvviV/gb5ok1TJTsrxdDyck=;
 b=/lOwFB1qjP7iTr8eSfhVpDz71Nc9Af2j4lHx6UdjaMj/dm9tVfScEt2jnKrs8S68TXY5KV5yF
 KEyzdXp8En6Dfq8cCoXNyUl6qyeeiGruxZavENr+qcudrrjvKu9e4aG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX7CWCa/mLdhBT
 eY6qmpGJjru/PvBsVgkLAc194WeDxBl6XJSAx01iKZLsyR55ECyndD/cCUBzMYp22T2bIHjgT+/
 4vmvTgxb8qot5F1Fr8JEB+DJncWzPNzTtl8Hn7bGw44Tu57HLjDzAjS/uMkINTjIjg5DR2butzR
 iglsksq0avyia8keMyfB9Q5iarrkkui1vwgx4ltPMXGtmuNm/PQ0oHMB1BezSWWw5sSpEVjmjwI
 AMpU31lGmzU9ZAgYs+mBDrixKJ8FLMnzlU4O7Hpj86MJs77XFVS/8WM3cyiOZ5OgqjKIZsh8Qqt
 OKHunYw3I8z4P4rmTclkjj1WOSKEf4HayqQ6Nfz6Y+pHWxDotdtlDZfcHgV0pFZKkiTv7yEMqmY
 X6ui44YeQzeGywSTs58EpKxP8areiDqjaW1ZkHBQno5wqgdCON/4qKfupfTNOyBQNDQpWgFOM4t
 sIYm6k/lz6B/wSDzATg==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b0259fc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 9NXCFIpRASZjZRBFIcBzidpUx63ZeRpf
X-Proofpoint-ORIG-GUID: 9NXCFIpRASZjZRBFIcBzidpUx63ZeRpf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX6zwgN5PCMIww
 v1uknGFMAR2daDh0L3lmiiyF8RrxFEnWDQevdyGlI2V+66JdDN78Nm4Tgbo1jV9AGu1Pgw4Z1wq
 xRHKsgUSfc/qqIoad5iU5W0TzSMU5Po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

dw_pcie_edma_init_data() unconditionally programs the HDMA channel
register space size (ch_space_sz) to 256 bytes. Some controllers space
their per-channel HDMA register blocks further apart, and a glue driver
knows the correct separation for its hardware.

Only apply the 256-byte default when the glue driver has not already set
ch_space_sz, so a glue-provided value is preserved. No functional change
for existing drivers, which do not set it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 12f102f48d5d..d55d4213be33 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -1041,7 +1041,10 @@ static void dw_pcie_edma_init_data(struct dw_pcie *pci)
 		pci->edma.ops = &dw_pcie_edma_ops;
 
 	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
-	pci->edma.ch_space_sz = 256;
+
+	/* Default unless a glue driver programmed a different separation */
+	if (!pci->edma.ch_space_sz)
+		pci->edma.ch_space_sz = 256;
 }
 
 static int dw_pcie_edma_find_mf(struct dw_pcie *pci)

-- 
2.34.1

