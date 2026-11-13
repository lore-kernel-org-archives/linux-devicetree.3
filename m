Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556370;
	b=H0EzNoKiDMbpIIwRM7M5dtPPar8ON0KBzz2COUiL35320vBVbbuIwJpF8xcFpbaacGsg
	 O8QMYdlFTZboPITDuccSEsFFZPib2XEMgMw6NbewfPtrWT25qrJMCJ+Jm+F11mCMZp2Y2
	 ry68rz9E+XTmClS0WnaysDUP4qV7+gFi/LMMyEVl2duRwBZH12QaIuBg/G2JxmKKhiDEI
	 iT6yhZru/YFSlRRnb1vVWqOpJT4o62GrSbt9H/TM5l/mOJdQCE2vvyQICeQKXRsDtunTb
	 R0VA1EJ1uFUkup0IIEwHeJqoIHSeqLVG7rOmkxrZD3NIw0pv7Egojuaomt2xmHzL44Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YT1JX+Lf9eskk4I8xLy/0YzjLWPEtLYHAGMY+wQg+Bs=;
	b=IVVfX804Czgt2F18/FzYCUXKIGgv+aS1DsEsy+MIYDUxhGinXxD7S6Kczuk7JvovBplM
	 PMI67Wucn6C7QjC+S/qFvzIs5elUlW6EuVCzfwAStBpDK9ja3XQYdciPhtzXuP2cCOtvJ
	 XBc65dgf6xqw48SrwJIdVGHd0bIsHTqLoybhhmdWd4VZJZWdrPNbv5a4oJbKXXbWxi6sQ
	 sR039bc/9Sy93R6TaVYUgGUPdhbg4DavoE+wvOmm+4LGGbtumwZ4rVyzS2gQeSB69cA6V
	 m9GdzHT/qu4n7un5AuzXGy1cY0bLdnHRHAMIr+QODB9lP9kiEfTOOGaHuC3e9XQmsgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P/UhXCxu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GICmBHZ1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18320606A894
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18320606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P/UhXCxu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GICmBHZ1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56vhO3556917
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YT1JX+Lf9eskk4I8xLy/0YzjLWPEtLYHAGMY+wQg+Bs=; b=P/UhXCxudi482cmA
	UYmTVfjR3EuLU27OgQoqrx7a0VcZxOOQ3fc5PjRywFs96ji62pvwSsW2aMDKPPb6
	Gof3qAaYFXRJ0xazn3BHBCwa07bW9G9lOd9RSzVH+yRT0qVcjbVgMYSzDyQfdzZt
	MOsJbOTGKCkCokGab3yuGxjLzQXGO51FvfKQz9+a6u+5mF3jPY48vDYFBY+hrqE3
	D74xTbVs6OLWiQ8JXB8wCJ44fz7ox5cBva3FUarybOJgXmoDOlYMuLmt4amLPuYQ
	xRFsFlg41W/9Ep4dl/2uNVHUaPMo8r4cQI6ivztb19Sd1PdwtTbM/X3YMGsQ4bbN
	dxMYOw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdj6qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so690893a91.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556369; x=1795161169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YT1JX+Lf9eskk4I8xLy/0YzjLWPEtLYHAGMY+wQg+Bs=;
        b=GICmBHZ1hAMwxF6QR/s93QCN0S4KQJfhcDOjt5Nh0KjqKaa7xOienusCiavDIcEXh0
         +wH+DkczvVqH/SenCKp0dN1SXIbyIas/HqgQWntON3TOz22/gnXLDUhTMczaEX2VCJpY
         cvutvF43cIz6nfWlrPPtefFcuNSJk+ghHeZY0H3mPQnfF/pu05/sg1KkKmNCPlkuGRS6
         bQs1MtupemqIt/DNMDmTKQNa4IBjODPWAUeDohkV0Z/kblgDRWrDRZt06VxJCfFdmw/8
         VAtGkbP8F2VlSSaFyZEzUVpkGja7+XaTZWz2JFKohXbCkMgQlGOP7rC2Gs8/dEZ76EUl
         mU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556369; x=1795161169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YT1JX+Lf9eskk4I8xLy/0YzjLWPEtLYHAGMY+wQg+Bs=;
        b=MJV//TZsQJrD754YnRIb14oljDRF0DhzG/9ib9Fbmel8/JvIRS8MxN5a2k6tLJzdtL
         HFlfFkyzFcF53RDg5EnPIax4UtpbkY8x2CCIbAAr3z2EmP0MFa7FEeb4ILFKmljJKsyO
         cNhVFiNIoJtjIOwa9LnaQJPb92awv46pCR1n7uDsa6tJ+sQqQ0oTGNUlhs8s2ZG8bnEW
         GIbz18Fl/MpQJ1ZQhysRRjZ5KRbO77gD/y6fqgLrA2Em0aq+xOHTQhWB64Rhu1Pu4mTz
         5kvm+CmNyu5pMNJjrtG7r9orikYnSqxTZqFw+n3RUg9hqUwUPopMqWTqkv/l82d/ChuS
         BPSg==
X-Gm-Message-State: APuU4Z9D2AospuLOrHiAg9K64W36BrKxpXf3UF0nD82BwOVA228jU1Zd
	jPkSf59NLpifQPgmURI6umS8vOPVPGS/1YLSjqci584m+mKIl36zyqFSM63Ol0vRiQi7baOPuZq
	gqoot91Zbd/gklEYkpl00thsfw3JV5SpJxRZfNUwfgkkQun4pZWAda5LFFyRnlWy6
X-Gm-Gg: AYBFou32l3FcCjp4nUTtz/H5SXCRRAeXX6Ej+mI2mg5NRZ26r8KnzMuUqNY3kDyp05w
	y/ftUOzG3NZZx2jVd4wIZ7MgPzB8NUhHhujfCf8Xaspk0n2NO4v455HGbDohslDV8oeL1rRgGM2
	vto70MeJ6bW1wH71nbRyxt7gcB+IJYCTTgqfoZB6qfaIyrKT+D6gpGMjDeW6BuacVS8ijj1vt4+
	a3Ojj/FU+XDNEuJ7YCtE+/8TeaaGXtF5qglMHZi2S9wEPKF/FHxqRdlzb4nK/e0TgRHEx0q9Rzu
	GyQEJMcPwaYmTjqFmiLO6PGZMe9GgRiAl0jov/pWseCMxkV8lA1v1eLaK0dSVLGhySB6Rb3E70D
	ZCeJjT+8GZRGX0bGWz/y5nzNBo96l8py0m1nCR60KYMTxC13gl1cV1GLtZ6xVs86azm/Z0gk3k6
	TwCY+MzPGevfuHkbGA1mVJe1/k0TVLXWIb
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr1021674a91.30.1794556368400;
        Thu, 12 Nov 2026 23:52:48 -0800 (PST)
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr1021655a91.30.1794556367874;
        Thu, 12 Nov 2026 23:52:47 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm1277107a91.1.2026.11.12.23.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:52:47 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:52:37 +0800
Subject: [PATCH 2/2] nvmem: core: add byte-mask support for non-contiguous
 cell bytes
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
Message-Id: <20261113-nvmem-byte-mask-for-split-macaddr-v1-2-138f715f18c1@oss.qualcomm.com>
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
In-Reply-To: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794556359; l=7468;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=9QfULuF/e/+tuH3nrc/YmQK6HByYOsvRzHI5XMsIRuI=;
 b=vl1TSeywZM4CS+30neDmsBwoRaNESyOd0b4tUFa+6ooss+HV6RE2HBzs9KIkS36YQhdAVxW+J
 cIcPCnVXTscDkh9mbfJGtcMIhuRfOu9Gt0geuQLh1OZopM3CXyQfdN9
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXzkAdYJRlPIup
 L5cuvvkwk/msjaTIuJDk/SA0JG7jGLtmXo5Z4vjktM2kA/zDhnTVsT9q2QN0Q9CBbevQmRxzqT/
 OyZBSvtIkABZw7JkJeYfEBsOgfeTHUE=
X-Proofpoint-ORIG-GUID: 9pJSmz2N0f48pzD7aPlgf5DGEkqwNYQm
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6c1d1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2v3GwsEA9jBGmIuPRc0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX4vs4C4U4hWYb
 NmctRgrn9HM+9/W4mLrfGwQlqydz43c5hrv64/EEFsAwQTFO8iNW8bNqrU5j0ElIBZMexIdSqvL
 jIctUayt2ECK40lx7AH5CvGD/dRBy5poeAbg6fDmq1OmKrZe9xoGNM+lwl6UL0mZCeLo+9vR8Xd
 RWqihm/LK7Py+FdCDCY9/yOWGyyZo7JZ0/7p5GvtJJXUA2ianltpdLesUWvaVeeWUHOEaW4QiJT
 vFtLiPJTicDKYY0XyG25od9mLlXQvSTOLPvCNyMD3mWkBEr5MLOryB3zGJTzxOs61+0wr6+CrdD
 0X6xAmHgl/bG43PcHb3lAZavv8xzenhFdHUubT6s3nonEkJSpJTrlSoROCBC40j/sISCv96cOXq
 uwM4y2XjUaNQZcKjCmRWJgmZL+C+TzAYt9SVU9WBjOZLbATe2gIpneGjC1cRd5lCoqXIKAxzDrg
 5lIamyEPI9f1DA+b7uQ==
X-Proofpoint-GUID: 9pJSmz2N0f48pzD7aPlgf5DGEkqwNYQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

Add support for a byte-mask cell property that selects non-contiguous
physical bytes from an NVMEM device region to form a logical cell value.

When byte-mask is set, the entire NVMEM device region is read starting
from the cell's base offset. Bit N set in the mask means physical byte N
is included; selected bytes are packed into the output buffer in
ascending byte order. If fewer bytes are selected than the cell's
logical size given by reg, the remaining output bytes are zero-filled.

Two checks are performed at cell registration:
- The number of set bits must not exceed the cell's logical size (reg),
  to prevent output buffer overflow.
- The highest set bit must not reference a byte beyond the NVMEM device
  size.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 drivers/nvmem/core.c           | 101 ++++++++++++++++++++++++++++++++++++++---
 include/linux/nvmem-provider.h |   7 +++
 2 files changed, 101 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..6c9994abce39 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -33,6 +33,7 @@ struct nvmem_cell_entry {
 	int			bytes;
 	int			bit_offset;
 	int			nbits;
+	u32			byte_mask;
 	nvmem_cell_post_process_t read_post_process;
 	void			*priv;
 	struct device_node	*np;
@@ -589,6 +590,47 @@ static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
 }
 
+static int nvmem_validate_byte_mask(struct nvmem_device *nvmem,
+				    const struct nvmem_cell_info *info)
+{
+	int out_bytes;
+
+	if (!info->byte_mask)
+		return 0;
+
+	if (info->nbits || info->bit_offset) {
+		dev_err(&nvmem->dev,
+			"cell %s byte-mask and bits are mutually exclusive\n",
+			info->name ?: "<unknown>");
+		return -EINVAL;
+	}
+
+	if (info->offset >= nvmem->size) {
+		dev_err(&nvmem->dev,
+			"cell %s offset %u exceeds device size %zu\n",
+			info->name ?: "<unknown>", info->offset, nvmem->size);
+		return -EINVAL;
+	}
+
+	out_bytes = hweight32(info->byte_mask);
+	if (out_bytes > info->bytes) {
+		dev_err(&nvmem->dev,
+			"cell %s byte-mask set-bit count %d exceeds reg size %d\n",
+			info->name ?: "<unknown>", out_bytes, info->bytes);
+		return -EINVAL;
+	}
+
+	if (fls(info->byte_mask) > nvmem->size - info->offset) {
+		dev_err(&nvmem->dev,
+			"cell %s byte-mask bit %d exceeds device size %zu\n",
+			info->name ?: "<unknown>",
+			fls(info->byte_mask) - 1, nvmem->size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 						     const struct nvmem_cell_info *info,
 						     struct nvmem_cell_entry *cell)
@@ -603,12 +645,19 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 
 	cell->bit_offset = info->bit_offset;
 	cell->nbits = info->nbits;
+	cell->byte_mask = info->byte_mask;
 	cell->np = info->np;
 
 	if (cell->nbits) {
 		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
 					   BITS_PER_BYTE);
 		cell->raw_len = ALIGN(cell->bytes, nvmem->word_size);
+	} else if (cell->byte_mask) {
+		int rc = nvmem_validate_byte_mask(nvmem, info);
+
+		if (rc)
+			return rc;
+		cell->raw_len = nvmem->size - cell->offset;
 	}
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
@@ -804,7 +853,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 {
 	struct device *dev = &nvmem->dev;
 	const __be32 *addr;
-	int len, ret;
+	int len, ret = 0;
 
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
@@ -829,16 +878,27 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 			    info.nbits < 1 ||
 			    info.bit_offset + info.nbits > BITS_PER_BYTE * info.bytes) {
 				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto err_free_name;
 			}
 		}
 
+		of_property_read_u32(child, "byte-mask", &info.byte_mask);
+
 		info.np = of_node_get(child);
 
+		if (info.byte_mask) {
+			ret = nvmem_validate_byte_mask(nvmem, &info);
+			if (ret)
+				goto err_free_name;
+		}
+
 		if (nvmem->fixup_dt_cell_info)
 			nvmem->fixup_dt_cell_info(nvmem, &info);
 
 		ret = nvmem_add_one_cell(nvmem, &info);
+
+err_free_name:
 		kfree(info.name);
 		if (ret) {
 			of_node_put(info.np);
@@ -1648,28 +1708,51 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 			     struct nvmem_cell_entry *cell,
 			     void *buf, size_t *len, const char *id, int index)
 {
+	u8 *rawbuf = NULL;
+	void *readbuf = buf;
 	int rc;
 
-	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
+	if (cell->byte_mask) {
+		rawbuf = kzalloc(cell->raw_len, GFP_KERNEL);
+		if (!rawbuf)
+			return -ENOMEM;
+		readbuf = rawbuf;
+	}
+
+	rc = nvmem_reg_read(nvmem, cell->offset, readbuf, cell->raw_len);
 
 	if (rc)
-		return rc;
+		goto err_exit;
 
 	/* shift bits in-place */
 	if (cell->bit_offset || cell->nbits)
 		nvmem_shift_read_buffer_in_place(cell, buf);
 
+	/* compact non-contiguous bytes selected by byte_mask */
+	if (cell->byte_mask) {
+		int out_idx = 0;
+		int i;
+
+		for (i = 0; i < cell->raw_len && i < 32; i++) {
+			if (cell->byte_mask & BIT(i))
+				((u8 *)buf)[out_idx++] = rawbuf[i];
+		}
+	}
+
 	if (cell->read_post_process) {
 		rc = cell->read_post_process(cell->priv, id, index,
-					     cell->offset, buf, cell->raw_len);
+					     cell->offset, buf,
+					     cell->byte_mask ? cell->bytes : cell->raw_len);
 		if (rc)
-			return rc;
+			goto err_exit;
 	}
 
 	if (len)
 		*len = cell->bytes;
 
-	return 0;
+err_exit:
+	kfree(rawbuf);
+	return rc;
 }
 
 /**
@@ -1776,6 +1859,10 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 	if (cell->read_post_process)
 		return -EINVAL;
 
+	/* byte-mask cells have no scatter-write implementation yet */
+	if (cell->byte_mask)
+		return -EINVAL;
+
 	if (cell->bit_offset || cell->nbits) {
 		if (len != BITS_TO_BYTES(cell->nbits) && len != cell->bytes)
 			return -EINVAL;
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..c9891595aac5 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -57,6 +57,12 @@ struct nvmem_keepout {
  * @bytes:	Length of the cell.
  * @bit_offset:	Bit offset if cell is smaller than a byte.
  * @nbits:	Number of bits.
+ * @byte_mask:   Bitmask selecting physical bytes to include in the output.
+ *               Bit N=1 means physical byte N relative to the cell's base
+ *               offset is packed into the output buffer; bit N=0 means skip.
+ *               The entire NVMEM device region from the cell's offset is read,
+ *               only bytes within the first 32 bytes may be selected. 
+ *               unselected output positions are zero-filled. Zero means no masking.
  * @np:		Optional device_node pointer.
  * @read_post_process:	Callback for optional post processing of cell data
  *			on reads.
@@ -69,6 +75,7 @@ struct nvmem_cell_info {
 	unsigned int		bytes;
 	unsigned int		bit_offset;
 	unsigned int		nbits;
+	u32			byte_mask;
 	struct device_node	*np;
 	nvmem_cell_post_process_t read_post_process;
 	void			*priv;

-- 
2.34.1

