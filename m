Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895491;
	b=iU9C+jSHSBzK6cG6yT0ruzurFYuU4/1LAv4NsHWVHYHUC7BV4ZzC1eBcBpttvI46bwAJ
	 W9eKkJ5Ljd8PR9Y3TZv9GYt2kjNFhS7P8lVgFmjToet9e58q/YadJuNjB1yBakLo4Gfkk
	 enDlhg7s9PZBZls368eDOpPgOheVExLdVnRN62b25SCb/lHm1tk4ghIRyvgf25E3ks6lx
	 4QvC42cSx8GDCt7XWDtOJatM3gnu3dqtD9UtW+UPcH/3NqXBgzAmzk0z5/jPXBUe/K2KC
	 UorBTRGrXtGnP6lowM9g/a7nCpAttd30NSK1c1SS6v/9ZAQfBPazhPthY4M+a0fFdGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=;
	b=2kzbgzv2fWGvdlCFJV5Y91S8APWJZwioLNwGESMnf1UjtP9+NSrVVnpqZ9Gpo9mbmywJ
	 g2PFP95CRcDqgUdz25nHlKN9fOwZBwPASg/hUMMk5dVMZ3HOLI5OJmv5161uRJzEbWYb0
	 Z0bE54VIaY+FZCC3OfAoF+8++Rbz/FsVvDr4O8gipl98xqcrpMZW0a4qgRzfsKfLIO7Vq
	 YHSjjGvkGmDI7YvlYBkyuXXvxQFNpXL29hS3WsQQoFepFS9jIGGEX0aHRlu2BodL68q9H
	 eu4NXw58UANr4jwSY5tEflBPDNkE3hvgljNXe2py8IXkshZCJqnSWMI3LMeNuuVeTUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwmqZr4w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBMdcYZ5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91984606A332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91984606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwmqZr4w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBMdcYZ5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aKGR3486807
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=; b=mwmqZr4wzwrpJ0a0
	aS4Ju+7ycQY2VLpkKcQdZhMOkSAHWQoZKyWyuo3ollrgPtkJHGt6KM8/Kj31vlq3
	70aQDE7qfr7VEhyMTI4roAHK//i7QWmiQphjIcMIKz/tS3e98NYVTqNCqUsP96/s
	zsgbm6d9n6vkVmWjxFlMvNvTEg0mhuscKLSxs1ESqJyh2Zmf1gsJSYO6Bb14rAFj
	dSbHRKuqbAgQ30M5rLJfp9TXvew8qZEGHXcvLbTuT34my4y7jERlVPlQf/l7Mq5o
	ZyZAzmlzu9PBT2ykm3VPwQ6qT/U0aJL1P0j2wrZrAwkN/bLNQv6+N49IaPein5Gw
	T4GJvA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2mehy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:04:49 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-54dbbf252cdso5317775b6e.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794895489; x=1795500289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=;
        b=WBMdcYZ5p7UVZ3iLN9aFgcbKO8/MWbZGmmKWHhvLuOYrv3WFAK2AMIC1PKxNYeim0W
         x10tN+U8caDd4Wg/bx7+KbkfpL3SvTh/rbaXIxWi7aSc1jWL3H10xl3DihbRW0NoLGFA
         L46wmHOKOxkDQFk3DJH8wVHQdAM1+vzIIAMVzL62VMqIwf363jLTCMHEzrbhZ6savImn
         PRRen6ZBsFYJ0igfDIxgkCuQbUrp0I8mXmo1Yrg7fNWnyfrGvVj7Z/1yQno0E60VIjNT
         X/QsAkkZbqXGubB4lWnuOMdncCyNMOfWwbwrOMRQEIkNYR13GKIpVXJnDIRqiAHkarME
         mzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895489; x=1795500289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=;
        b=aCdDtiXfqwkqBxKZaVkU3es7Q/ylAxfpwlGru7nMkKKA+67P6yr8cfsc8ktowCSAiP
         Wf0/yr+GUKG8ODsrTKNkYlSITboIXXQly8IUO1dGcBsVmEA90v42M1KkYvKlqu9Q41Da
         upZ7bVSLvK+J2heYXnNyW30xBixD6f2aRqhs9xl9t6xDDOfrkrXCRm+YSQJYTJZn8d7W
         C370kEjNotWqDXsyKYLdrG6byQdTCFZfir52gqwsL0FvIthgSEu2l5Smk9qMntVRyGTo
         R0ezpYfBGyV6j8buM28+ARVQZDHY98arU0fnFXPBCXdrAMBjaUmWsdTJCfzeC9+HMKQQ
         56Ig==
X-Gm-Message-State: APuU4Z/Wn+aGlbWqLfHue9hOQtUNrSqlcaFo0pPoWw0UIUQQMBFA0mSW
	toycKmIF1u7nncdQ+bUHBSSsbKxU0AtWG3roU2HQq34DvZRY4X73nXFj5b6ioWXKNDUL4l7XG8U
	aTLTU9GY8P0JFc/V5iAklkd5ZZyfPHhZgNq7NnT+KffnqIXiMJlSPiB6XJmWaWV1D
X-Gm-Gg: AYBFou2Ixr8IAr+gme0X85qsyIcjVy4k8aXcwHQi8LnhCTekG1ov6yBq88ltjLBw0kA
	ce+mtjjuPuXtxvuJ0BSO+RXKI5tHtoGyaEhOPsbyEwAkBccNUIvMNoVo2CzbcM432wgM6/dS61r
	6k09mki6Dga6iXaRP6DOS6d5dSfTeCEqV5lwRhcwBP4guPt2dIUR3gag08TKEsJJxe6qUoy/TGu
	10FBtRzSheQOqZQfUVnrNIWNciSZnodgn2/KJEyl9Aw2oqNdUd9HLTkAqFGq1LKbrT/qC34wRs6
	hPC/f+H5Soph2K6GjMdz1nv6Aneay5Dd/e13uvS2XXuWElsPLXHkpFJT1kG2VAieLO7+cJOoEHd
	UGPU2IIrIcHk3XxXNApk0exiJvUS8Pw5sT3uG8lp9MRm1wHqHxSs+nkVoFXKafcOGCd3irEBJLg
	y5sWmrIYZgr0tmfajuz4uFuBL7w9Z5bNcz
X-Received: by 2002:a05:6808:2217:b0:567:c44d:c1fa with SMTP id 5614622812f47-56e63790ff7mr10381239b6e.16.1794895488575;
        Mon, 16 Nov 2026 22:04:48 -0800 (PST)
X-Received: by 2002:a05:6808:2217:b0:567:c44d:c1fa with SMTP id 5614622812f47-56e63790ff7mr10381192b6e.16.1794895486882;
        Mon, 16 Nov 2026 22:04:46 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70243e1bsm11903464b6e.7.2026.11.16.22.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:04:46 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:04:35 +0800
Subject: [PATCH v3 2/2] nvmem: core: add byte-mask support for
 non-contiguous cell bytes
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
Message-Id: <20261117-nvmem-byte-mask-for-split-macaddr-v3-2-c02177658f66@oss.qualcomm.com>
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
In-Reply-To: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794895477; l=7363;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=ShDFJnDonjnKccpMuvBayR26zt22z2glIqSe+McEOEY=;
 b=3Jw0V6oJLKz7RVzjPuNMWtV3lagugOArDTGsepKjeR4X/ckPOdk/RxHQZyjcCnI1lYc4enxll
 Pd9kU7rjLV1B0blHbLKdSaXiqof0mQqjhaQbkzmZAgp+FnPC+XEDVYe
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afbee81 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2v3GwsEA9jBGmIuPRc0A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX3I4nbRcUksgY
 zPqQs25jT/nLp2JDgSwUMbkoyw1JwxD92q5+Eh3hVvXh4RGUVM24Aeqfbk7GMQHltUdnV5+0mSu
 yuKJQFtXHnjQ/3FEPJn/+0cQbThAAYM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX5B7us+SVwvhB
 24OXg39ovUpPUD0r+mjPMuPgHKvLmhITBdFjh3iH3ug+w8wuD/FmDgXi4ro6jSfOUp3WUik2G1P
 lTHedldEOiPicO036DiGkuCw30Dlb/TOmg7PMF2CVVvtwlEXDHe6uxv38F5XJCTV7eqtNYgh+ft
 coDGNDS8vPn2MeiLYX/XCwoCOp7RgG5wX569KJwfO8FY5DpSAevNA/RzQ7CsPOVQ5Ukkqhfxvi5
 LUWT5vVyAhtLMtIur2O9KHIf8l/WKuU+4zEz/LrttIFSJtVxRAJckk/lUsMqfnEGedDAm2Uwl3F
 KKoZXJUzEl8SzOmtfcVOZ/IT8lZM3WfdESIUKSECa0AX1QBG0Zkcfx9QGzPpVRWe9/xrWGvczU5
 jeQuCL5R22tWPQ7gqML1xyaWzdVc5CsXFvd9DcaJwBqzyvQs1P/LNwDuYIe4gtRF4/ZVbpts53u
 rINQv0PGzRd+eLajxrw==
X-Proofpoint-GUID: ABCe9l-KHUfhyiqiyUZriI5DrBP16Jy5
X-Proofpoint-ORIG-GUID: ABCe9l-KHUfhyiqiyUZriI5DrBP16Jy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170023

Add support for a byte-mask cell property that selects non-contiguous
physical bytes from an NVMEM device region to form a logical cell value.

When byte-mask is set, bit N set in the mask means physical byte N is
included; selected bytes are packed into the output buffer in ascending
byte order. If fewer bytes are selected than the cell's logical size
given by reg, the remaining output bytes are zero-filled.

Four checks are performed at cell registration:
- byte-mask and bits/bit-offset are mutually exclusive.
- The cell offset must not exceed the device size.
- The number of set bits must not exceed the cell's logical size (reg),
  to prevent output buffer overflow.
- The highest set bit must not reference a byte beyond the NVMEM device
  size.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 drivers/nvmem/core.c           | 95 +++++++++++++++++++++++++++++++++++++++---
 include/linux/nvmem-provider.h |  8 ++++
 2 files changed, 97 insertions(+), 6 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..8bc657cd9930 100644
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
+	if (ALIGN(fls(info->byte_mask), nvmem->word_size) > nvmem->size - info->offset) {
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
@@ -603,12 +645,22 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 
 	cell->bit_offset = info->bit_offset;
 	cell->nbits = info->nbits;
+	cell->byte_mask = info->byte_mask;
 	cell->np = info->np;
 
+	if (cell->byte_mask) {
+		int rc = nvmem_validate_byte_mask(nvmem, info);
+
+		if (rc)
+			return rc;
+	}
+
 	if (cell->nbits) {
 		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
 					   BITS_PER_BYTE);
 		cell->raw_len = ALIGN(cell->bytes, nvmem->word_size);
+	} else if (cell->byte_mask) {
+		cell->raw_len = ALIGN(fls(info->byte_mask), nvmem->word_size);
 	}
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
@@ -804,7 +856,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 {
 	struct device *dev = &nvmem->dev;
 	const __be32 *addr;
-	int len, ret;
+	int len, ret = 0;
 
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
@@ -829,10 +881,13 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 			    info.nbits < 1 ||
 			    info.bit_offset + info.nbits > BITS_PER_BYTE * info.bytes) {
 				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
+				kfree(info.name);
 				return -EINVAL;
 			}
 		}
 
+		of_property_read_u32(child, "byte-mask", &info.byte_mask);
+
 		info.np = of_node_get(child);
 
 		if (nvmem->fixup_dt_cell_info)
@@ -1648,28 +1703,52 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
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
+		for (i = 0; i < cell->raw_len; i++) {
+			if (cell->byte_mask & BIT(i))
+				((u8 *)buf)[out_idx++] = rawbuf[i];
+		}
+		memset((u8 *)buf + out_idx, 0, cell->bytes - out_idx);
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
@@ -1776,6 +1855,10 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
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
index 6063fe5b7784..066d27bb4284 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -57,6 +57,13 @@ struct nvmem_keepout {
  * @bytes:	Length of the cell.
  * @bit_offset:	Bit offset if cell is smaller than a byte.
  * @nbits:	Number of bits.
+ * @byte_mask:   Bitmask selecting physical bytes to include in the output.
+ *               Bit N=1 means physical byte N relative to the cell's base
+ *               offset is packed into the output buffer; bit N=0 means skip.
+ *               The physical read window extends to the highest set bit,
+ *               aligned to the device word size. The number of set bits must
+ *               not exceed the cell's logical size (bytes). Unselected output
+ *               positions are zero-filled. Zero means no masking.
  * @np:		Optional device_node pointer.
  * @read_post_process:	Callback for optional post processing of cell data
  *			on reads.
@@ -69,6 +76,7 @@ struct nvmem_cell_info {
 	unsigned int		bytes;
 	unsigned int		bit_offset;
 	unsigned int		nbits;
+	u32			byte_mask;
 	struct device_node	*np;
 	nvmem_cell_post_process_t read_post_process;
 	void			*priv;

-- 
2.34.1

