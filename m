Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797929;
	b=IYOsleKbuf1Eo2xTpPh1Qw2j5sp8m0Y/2Fquvy+A7ml2pVEuyLu1KeOEB7tvwvbf9ESN
	 X6iodMbt997GXih6dqvlU2n7/kQ1OFvcoL6V6D79OoZEhgFLSpUbHxm/IYvc9pp9Y5UtU
	 dvKmShfR3HcQMWHzG8hVvX1TBPNBNQhIV1pSnuVmqK6Oa84oeeJaltJ2Xv6UniTFIeJ3d
	 /FPGtUHLv4hr8r3VImZAqW4ADYPSOb8rEsS39jxzL6WWNhjEGUld5DBp0OiMjwZOnfJK5
	 921xzmKpGyH0chNWI5Pb5FIvYCXVAy2MVPbsIqA7hgqKj77RjBKEqVn94Bim77bUCEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=;
	b=qa785NA3cIBj/lD39Bfmb4HOjH5zIjoBLBUQkMYLbER948SHviKSj5m6Q1orqCqg60vg
	 7SdkyfRmEoeO5vDO7S8cVu6TnGbqnHKs25VA3U8uaXaFvx1WamjJq6f9qQyOun2jthle+
	 X5ydVLjbraBLy3+RXyPBvWPKIbIjkfR6ZqFxVn2C3AQ6XzPAzAqU4aglv4bgkqLDOFL3e
	 WiFNTNAfPK4O2h16VCFFUbEiOGKZjlezZvhREXveprU7wjaq1/xjowCd71BMcJptAm10v
	 6QalwyFlIHK5isNuNvTpnJO+qaZl6TmbpabbHJR80B8yyWtZpV3jl7dB0DhcAl3q+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pv/fTsZX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IsasEBbH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E7606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9E7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pv/fTsZX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IsasEBbH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LCik1714645
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=; b=pv/fTsZXf7ionkHh
	Nt1Kmr90OHCMI3E27TWuRPKcnjAKo0FlTsc26Yj81y0hZ6tRavMG5Pde1pcu0hPn
	f4ReIi5eyZHMBPFc7oavJlW5UxNtNVfw6Kb55cuPrz7uu8k/V1VGNh9wgcMuuxHJ
	X23Xrc+o8oniT+SaOl+H0SUBBcea9tzMfzPIJALpn1QxwIKBLDAzOkuPWDew6/4I
	4bbbP+u1nuarTc77CRJzRYFp+Lf+g1oHaZKEEoOd3ph4WVTFE90TgB3vfsfbhZsx
	yO8Xb/zwhXaUji6f9N4FeZ8Bcpc1RRVykxURDqrZ1+vwYRoCgWRp+ezH6bNEpbhm
	8ltyFA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8vc0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:58:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3864450eec.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794797926; x=1795402726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=;
        b=IsasEBbHWiAcuL3SLI5ofPO7m3AJtHLJfAW6ym0bt3dWf8rLtDnNRN9FMexZnwA6dP
         JjwsD8FXn04zZGp3TAA3gRnouaMv88mOQ7BfONVkGY0mE6CE17/7j8rSinA56yAmQdLN
         1CBCewgLfNzxX8taeoaj/JZyzDg+tqsYyzuRYzFY00eVNqjiKnw2s8G4eHpWXqG+HaAc
         ft39Tq4m3KU9MapKxwDTW940ugCjETlvkDw0G7+OqQQYfcR9E4/1Q7+V13+3hkk0GXhv
         tifHUkJZeKqv2arbNGGfunVTUgXJUiezbm6rBH0C1G+ixhEmVZsYKv0FdbIbLnALFlqc
         R/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797926; x=1795402726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=;
        b=ytWfEymOfxIZ5SIjZJZmmjQ4H7BQscOpP0w5qiEhUxJZhtGSVdPgY9/CDS8Eq36V/t
         1HRebueLRktPa4DGCWADc1zGqCaZCGAQX53vRrqS5U3Uq0L7qbzxo/xMam//X3yDv7jk
         uZWg3z8zMVyrQCKLLrBSYrs0O8MP4z8mQCIH8VmuhGyu/M+Shb+A8Ii2riLDqRyGx+xt
         js7dT25pKuPTcKfp3urbcCIqLDanOjJ9HhoXu/moQCHH6sOSVVzu/4D0sbWbRao9SLrK
         S4KWh0aq77OzBTYE/t0d1ej0XP5jd7FM97RulzIuGIvu2JUgwy7Ad/1JsC55RraAdWfv
         GcIg==
X-Gm-Message-State: APuU4Z+/UEQbq1bAdBsQDWpBNVstFUly+a7kU+scWUvdKNimVZfMfWfq
	PzAzHeD0WUk2KfCShC47nd2OmQIC0fM91fa9wcSZ8VraHJPzSeOJkEWb5z/GzmCq26d0+0RGD5e
	alfmDU6JZAKIVLEQWr12ywpDKeremGAii/wY1W1G/K89GYiYpdAQbslmVwPASeNAO
X-Gm-Gg: AYBFou1Im1S/zrqXSi9oH3bEyhPPK57ML2Jnp24R/mZI3ZwHjR5C5Tzb279stSidpn2
	9frYsI4E7u9Qsyezi6mnQ8vpJ5V54cIUEwLdFzO4FXq1cJ+ehaUwZA2SxnPz9dxDLx0Yz1WgOR2
	IDz5rQLeB86E029PTC46dTESu4YUIIuH+oCMbb+0CUmZxpSQYzRgbUqOz9bsRpomuaPPK/cmM0M
	N7we+I0qZy7/mdRe41cEHosbq0amjRNsEdqh++otk+lHwAe0XP9aJfA3jNG7Hb3SwPmHrD2Zmu8
	VhK8Geps3K3QSPtdxsW/YuG03w2a9ii8bAUNjnJP8ckNcfAFY4waTEEsoxaYcWPvgB38rxAtznZ
	eZKY1x6V58GVID6Ax1l6qWPG9fa9XjrlZ1J09SEGnOmaFInAIGDjeCgGnDdgDfoaH1nPADs0YUS
	f2no03uvzOqxAa3oYsIS6X18kD+NMeugpk
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr13837076eec.22.1794797925651;
        Sun, 15 Nov 2026 18:58:45 -0800 (PST)
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr13837039eec.22.1794797925038;
        Sun, 15 Nov 2026 18:58:45 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm30469991eec.14.2026.11.15.18.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:58:44 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:58:35 +0800
Subject: [PATCH v2 2/2] nvmem: core: add byte-mask support for
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
Message-Id: <20261116-nvmem-byte-mask-for-split-macaddr-v2-2-96f4a0c08264@oss.qualcomm.com>
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
In-Reply-To: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794797917; l=7666;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=vbRtmFtXmMIqsNIBcPeGrbg7gcHrGqgrIkzXS4nzL+0=;
 b=d5Z3n9M80wTHuDRCx5wdZD0wND/NI7bsadjnlROxRQ/3Psn+r/OdebUxn599GdSv9yCNCNlH9
 CYeW5F0QfVRDr06jICxirQhAihRg8WOIkoDjUR+O3dyMhgZq0C7Vgkd
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa7166 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2v3GwsEA9jBGmIuPRc0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfXzFXUb8kJ+Efu
 Fua7WDswp+lJpJWzu8SUHOXa/qnWzC8BNJt2he6gkEe5FdMuIeTKYaWPW1WUB/cIe6+djG4CqkX
 loWv8MgwIFVi+gzJuQ55VtjRrXoDqoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfXzTUq+FqsTSqj
 I0/AibQGavjlOCH/0e4CI/DNHybtcdGA6aYjX1b2Ma4rJ/AW/9HSVz8k0EMRu/0G9w0HUar8Zbv
 bbhEa7x9Yb7rnmkoOxtpIjU54G5s0xk0GIQXV+8IklleP+bzQQfiWDN7seJrVGgY4T+4cpfzmmZ
 zpD/tZ4F6rN3OMm5QsZEeW/e9tKLd50GBcVbU8h20sJ2En2eGfPtTc7Fii2kbRK7IHGqFZqKVTC
 KPdDWxCciAVPfVd9Lj8ktuTDx9d2FuXktkjGib9ZQ8wv0TLz6zXAuyAjghpb0HVsrJMmP4GReQ4
 AWOCOlEeMeW/Tz4mshyoXMLJ34j33M5TFUD8lb1fDTZDIB83uOp0Rk5T7bXuxLTBwJjDTmFOlt6
 4uhSIO21bA4MCtKhwfhJ8W7UFIOa02ydfdNpslnOIqEifxrzIAxu9+tAKWoquXSUQ9ATcP7Y9rf
 imHexGSfDPlqMR8Lghw==
X-Proofpoint-ORIG-GUID: S5p2yNy8flCdcXiqjgJyNsQQIJAr9Csh
X-Proofpoint-GUID: S5p2yNy8flCdcXiqjgJyNsQQIJAr9Csh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160011

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
 drivers/nvmem/core.c           | 105 ++++++++++++++++++++++++++++++++++++++---
 include/linux/nvmem-provider.h |   8 ++++
 2 files changed, 106 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..7e96b84bc4e2 100644
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
+		cell->raw_len = fls(info->byte_mask);
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
@@ -829,16 +881,27 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
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
 
 		if (nvmem->fixup_dt_cell_info)
 			nvmem->fixup_dt_cell_info(nvmem, &info);
 
+		if (info.byte_mask) {
+			ret = nvmem_validate_byte_mask(nvmem, &info);
+			if (ret)
+				goto err_free_name;
+		}
+
 		ret = nvmem_add_one_cell(nvmem, &info);
+
+err_free_name:
 		kfree(info.name);
 		if (ret) {
 			of_node_put(info.np);
@@ -1648,28 +1711,52 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
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
@@ -1776,6 +1863,10 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
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

