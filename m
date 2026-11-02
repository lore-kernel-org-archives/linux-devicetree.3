Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636850;
	b=nNhaM1fauoe4zffcp1NHCvSymdOqE7T28o1Vbn23doxUcOUIMR+ctHomvFjTlr0qZlsW
	 dpX4vX00TPQR/DR5ECnWY/HB9tpkhz28Kv9D6q59SnIdqvyu9R3ALh7Gspy4nuUhNepX1
	 6X3skEm/6ibwpLIN6nT75WmbF0ZjYjstE1nIIrPXN3QBNx8fyaG1ciiDmHv92wUXjVkHQ
	 bi2wcK3OGWtSjHKs8IkzXsuC/vsq8ws/v3vCAiNaL7Bgp29vHHx9Ea12R4pvcFhl8ixzp
	 1Tr9Z0dUhoKwxgKE7HfRfr0r20VBp/W2uIMn28dDrGc1qcD5LJetn7DJ8IYtP5bL7Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=;
	b=ziESF5rEpPPLm/ZUp6D54vddZ1v/y0KzZT8DbIf3guMk0ZuH/ifF08Wkh74lhro85Cls
	 rraDziAQycOcDSZ/dsf8RRWFd5yJFA358oPt23KYnFshCWPnwAI/AzJz25k89yC9o5NYE
	 taZ78f+aHh7N7Bu4xZuK1oYOYT9qpJhYAridse1zjQGTgKYkDBZu+XssM2zWtrk4hKIEY
	 16icxVg876hMlGnOmHlC3/pVGETKqStjkWdyC0aOxB7SIe/vkzwBTsl903QDWuRQFNe0i
	 0STAh3HniYSETLv7KD+9MdH7CN1vRcxZyYIpr1zR+svefefqHCu08u8eaE6Fk+Gjjsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmS7v6PW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8YCTeBw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B26072237
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087B26072237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmS7v6PW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8YCTeBw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIpI2991833
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 16:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=; b=cmS7v6PWAAEcGhV2
	yVNk1/HoeP+HdcxRfgPcIqWH08IduF66sTf/rpn4Jtf77R3s9nR2WYT0I7J9pG25
	eC+wGpvzw+sCuUDQeJDiygd+V1PzNw1NmtNr4jPMb3E0oS0pESzxmB7H8cgBWpGy
	23fXshUi4C8NzebFlLl8LFtmnV4p0Q+QOMdfU36p3r0mZXBdb7zWPbQDSK2Abro9
	kTfjU5VHMuU9IH/JWX52vBGKIWJlyyeFdLgFY/Gh5vym2e51Isx6ZDqoWLudVan/
	w+/iSlGbo2tQSestH68O9MT4Ltn2hQtWY4eyqxLiNqrpz3nai7/A3QzAKj7Xv2GA
	pN7VTQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavhcav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 16:27:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990634bef80so498826241.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793636848; x=1794241648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=;
        b=J8YCTeBwllzueA5d6If9AO86uK8/9VHs8qZkIkd666+IhLFyml5l9azLr4m/tdk9WR
         dJldbowLh8XMN1SnGjKmC6JWKzq5qvHAbJCJJ3hsAr6AfTvvTrj2PxBMgo7NFkVs0Zu4
         YzTDv/ktwTNAJuhMkdthGK/3RuReoS/JiQXQ09lJzqgLD80epthFjWw+CkkRVP+6KfLe
         TX/YkvPaUsK5nbaGdC1vgEG/2KeBU7/wpc/27JZlU5uMHUnrefZRRrlDDKcniyly+5K0
         gj2C2fLUDt4CubWfcqOdXTJ7NtqAomVVFNTK7CAFRqSgBWalmLtHP0wNR8YtQjOFQ7DV
         Y3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636848; x=1794241648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=;
        b=Scgvcm+9rXREkerP/DF0yQsECnU2RlnD0HRmuxHlx0YngPAmgZIgoBLadTaAOV27Nl
         6BdmkHfeo2eu8bKVyuQYmMbP/Pux6IpbSF8iy95Iq0Rk8R0ia0ubQbY68dS4ZhYOmeFl
         tRgEvSRfPl8ZPxiUc0cEHauzu4sanN+l+fwhPK2tt6osRzhwi7ksKoOAuU7OBl2pW7j9
         PzThrKNydhIuD5s3UMTq7mxTyVh5seg4lqfg8iFN08djOo95ck5IfZR5uAQM2XlCvRf3
         vUAIKUI7Inuv1sWpwUBg4QOQr0vowlg9dIP9XwAZCSZb2jXH5r8i1XHhxnIfnjxr96Jg
         u4Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxlOvncZ5Y1DTvhUyFwpCy0RzITyrcHaluhmFaflP0IS4kjX3UtPwhOSbR2VNyxWvlShZs6Fy3MVlcd@vger.kernel.org
X-Gm-Message-State: APuU4Z8/MxYj+a9a0GRSlriVgR1CjJJsRLu+NCSk9bVNNt6m+HhN45CO
	CHV0QLLGqNMxy5zl3bE2StOWrhetN+nnsUqIWy2zf+wU4phb6fI3qikkO3e+6J79cMBMSsMJ0bq
	n3Bo8IKwfjB4E76r0jmdBTfTDfctOpcF5HAKwt1Mb2b16X7ZD0mOsrh7pq8ofdZ++
X-Gm-Gg: AYBFou1uXchgi/To5tD4Ow2YKEkjrZEEkCXCu1QOC8Uw58C1AUfo0oQ4WXxRrqEKakK
	OsKtvxOGLMt5LTUvRsYKhnPhoWzSS+R/hqrfWG/Vq0DzpPY6ITwSPLCqk5YhnoASPSBwBYs/grC
	6oFNJJUxafqC81tbexHYFbDPP3Me+BBK8Z8AwMLU8SXVA92kiEh7VSUusw5MwWxX49puvUC+2M4
	uzZiRwrcGG7HGtGr3XxKpGFaL3Y9YV46NTgvC+z+XOiwRJz4PxjmCv0DPoBispZxLUTIG2JmWID
	GRIf7uTQKyB3S1WisHhnB4xvA4G6A1DsiTOY13iIaVlpn4fD2vqG61aysTdw1MqBPllBRbB+zNY
	WRV6FvTai8253k5BgyFvj++cV9ieE3H4Ti68TSpOSnEZ4a9bD9wNocnpEoRGNrPLMrsdUCLPAeJ
	tlsn7dyXso8BEpqO1HrLSMSvjsOPhzeDSXGDLK5EobeNjhJ2mrmuLOShGEu+UXje347XPf6tnhE
	pZ7Rq5x8T6bQ39J3aXfhlHYtTYd
X-Received: by 2002:a05:6102:8097:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7d0725cfd65mr3871177137.6.1793636848067;
        Mon, 02 Nov 2026 08:27:28 -0800 (PST)
X-Received: by 2002:a05:6102:8097:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7d0725cfd65mr3871137137.6.1793636847453;
        Mon, 02 Nov 2026 08:27:27 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm20490695f8f.45.2026.11.02.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:26 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:27:20 +0100
Subject: [PATCH v12 1/2] block: partitions: of: Attach partition fwnode to
 the block device
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
Message-Id: <20261102-block-as-nvmem-v12-1-f4a2a681087d@oss.qualcomm.com>
References: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
In-Reply-To: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfXxJujw8Jcx+lN
 yfdfMLcytS0AGUeBCC9gY2q3+h90hOeRcmpGPzoBVgmlxxJ/EsVe6/Aq4cm7gSXMwrq6xHFZGdf
 wySM/7d4ASaIFtF7KVtIfHtYjG+ChKhcaw033LheemNgJ9mKBUFmzrsNU+KbM45h+HO+LvjEVLb
 b8eYmxobqSha88+BexfxAfDytIvJt+3PNERh/iMtzE40LvszlWuAixcXFAOnJVR/RnRN4n5yge6
 tOR8Tz7nrpUiRACre7cHUahQ+bBSUGcH2bT25CAEAA7S1HTjLLNursy9C6SiG8fSNPAeSXGm6GF
 kT43HkdhhGDfzoyXQ4OrmsUEUfeNk3hPKskqIqssHhSLf0s6iTdfwmsbx8DzAO4RE/afayMcg09
 /dJRwx6J2wWMgZv0lToWbM09DwVthRrFCI1ODl78syxLbrgKTVW5cSqmhY/Vl0FHakUTXdlZhwL
 yRBxWPld3D5Lqejl+Jw==
X-Proofpoint-GUID: LZ3L-gjCtp4OLTTUFV3SYBhRziArovsr
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8b9f1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2ffTNAQyBkxXHBiWhEgA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX6kvVfGd46VOh
 Hz7TxPYFFCCuf3GDFIjhAx8f/mwuCqN3jbsX8im943RAJw01p70i8AhBXQ3t0Mr793+MydMvKdJ
 dEM/56SrNqG7Zz/nv+kJ0wU40iR1uu0=
X-Proofpoint-ORIG-GUID: LZ3L-gjCtp4OLTTUFV3SYBhRziArovsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020065

The OF partition parser reads offset, size and label from each
"fixed-partitions" child node but does not associate that node with the
resulting partition block device. As a result a partition has no
of_node, unlike the whole-disk device which gets its firmware node via
add_disk_fwnode().

Carry the partition's device tree node through the parser and attach it
to the partition's block device with device_set_node(), mirroring the
whole-disk case. This lets consumers describe per-partition properties
in the device tree (for example an NVMEM layout on a partition node) and
look them up through the partition device.

No functional change for existing users, partitions without a matching
device tree node simply get a NULL fwnode.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/partitions/check.h |  1 +
 block/partitions/core.c  | 20 +++++++++++++++++---
 block/partitions/of.c    |  3 +++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/block/partitions/check.h b/block/partitions/check.h
index b0997467b61a54a8a621b9c155c8329289649460..326081499d9a6be730dbd659c110449cfa06921f 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -17,6 +17,7 @@ struct parsed_partitions {
 		int flags;
 		bool has_info;
 		struct partition_meta_info info;
+		struct fwnode_handle *fwnode;
 	} *parts;
 	int next;
 	int limit;
diff --git a/block/partitions/core.c b/block/partitions/core.c
index b5c59b79ca7cbb28d4d93478ee1c80908f76ee9f..eee954df1ac6ef7dd4f02ad5c9d49aed778bf015 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -11,6 +11,7 @@
 #include <linux/sysfs.h>
 #include <linux/ctype.h>
 #include <linux/vmalloc.h>
+#include <linux/property.h>
 #include <linux/raid/detect.h>
 #include "check.h"
 
@@ -110,8 +111,17 @@ static struct parsed_partitions *allocate_partitions(struct gendisk *hd)
 	return state;
 }
 
+static void drop_partitions_fwnodes(struct parsed_partitions *state)
+{
+	for (int i = 0; i < state->limit; i++) {
+		fwnode_handle_put(state->parts[i].fwnode);
+		state->parts[i].fwnode = NULL;
+	}
+}
+
 static void free_partitions(struct parsed_partitions *state)
 {
+	drop_partitions_fwnodes(state);
 	vfree(state->parts);
 	kfree(state);
 }
@@ -139,6 +149,7 @@ static struct parsed_partitions *check_partition(struct gendisk *hd)
 
 	i = res = err = 0;
 	while (!res && check_part[i]) {
+		drop_partitions_fwnodes(state);
 		memset(state->parts, 0, state->limit * sizeof(state->parts[0]));
 		res = check_part[i++](state);
 		if (res < 0) {
@@ -247,6 +258,7 @@ static const struct attribute_group *part_attr_groups[] = {
 
 static void part_release(struct device *dev)
 {
+	fwnode_handle_put(dev_fwnode(dev));
 	put_disk(dev_to_bdev(dev)->bd_disk);
 	bdev_drop(dev_to_bdev(dev));
 }
@@ -294,7 +306,8 @@ static const DEVICE_ATTR(whole_disk, 0444, whole_disk_show, NULL);
  */
 static struct block_device *add_partition(struct gendisk *disk, int partno,
 				sector_t start, sector_t len, int flags,
-				struct partition_meta_info *info)
+				struct partition_meta_info *info,
+				struct fwnode_handle *fwnode)
 {
 	dev_t devt = MKDEV(0, 0);
 	struct device *ddev = disk_to_dev(disk);
@@ -343,6 +356,7 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	pdev->class = &block_class;
 	pdev->type = &part_type;
 	pdev->parent = ddev;
+	device_set_node(pdev, fwnode_handle_get(fwnode));
 
 	/* in consecutive minor range? */
 	if (bdev_partno(bdev) < disk->minors) {
@@ -449,7 +463,7 @@ int bdev_add_partition(struct gendisk *disk, int partno, sector_t start,
 	}
 
 	part = add_partition(disk, partno, start, length,
-			ADDPART_FLAG_NONE, NULL);
+			ADDPART_FLAG_NONE, NULL, NULL);
 	ret = PTR_ERR_OR_ZERO(part);
 out:
 	mutex_unlock(&disk->open_mutex);
@@ -564,7 +578,7 @@ static bool blk_add_partition(struct gendisk *disk,
 	}
 
 	part = add_partition(disk, p, from, size, state->parts[p].flags,
-			     &state->parts[p].info);
+			     &state->parts[p].info, state->parts[p].fwnode);
 	if (IS_ERR(part)) {
 		if (PTR_ERR(part) != -ENXIO) {
 			printk(KERN_ERR " %s: p%d could not be added: %pe\n",
diff --git a/block/partitions/of.c b/block/partitions/of.c
index 53664ea06b6540e3d1155141adaafac7286f2d21..4fc7c80c407de42b2b31be2c82e0e6bc2a30c9e3 100644
--- a/block/partitions/of.c
+++ b/block/partitions/of.c
@@ -3,6 +3,7 @@
 #include <linux/blkdev.h>
 #include <linux/major.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/string.h>
 #include "check.h"
 
@@ -62,6 +63,8 @@ static void add_of_partition(struct parsed_partitions *state, int slot,
 		partname = of_get_property(np, "name", &len);
 	strscpy(info->volname, partname, sizeof(info->volname));
 
+	state->parts[slot].fwnode = fwnode_handle_get(of_fwnode_handle(np));
+
 	seq_buf_printf(&state->pp_buf, "(%s)", info->volname);
 }
 

-- 
2.34.1

