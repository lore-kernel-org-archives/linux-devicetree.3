Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738920;
	b=BPXfzbOvIDRhm4d64fwzmz7Fi07PB17AOKYqHia8lBOpgRHs4Pm/Z+ZspdhVCA/9pYT2
	 Eit3A4nQKzQUQcE0IaZHLq0dCF8I2fL3hGlji+lKVB70BQs3HwOVUMbuoZvh82tkU2F7X
	 7BRRFFSOZux33EaK3Ch949aStAqj7y4vxMqgKX4k9WY5DWSf1FeZFPyG1QzPkcn+j38zC
	 S+t4i7VBIzqD/L46UPzUN0umA9ZJAMRrVL1mn04wkY3VL3fongfgo6TU7MwvnaUbq5aOy
	 D1Gsk1gHAwLvUrhXb286xqOuL/df1fk9FDvJVVBout1nx29Mk/rSpeQ+Hn9a+Bn8tMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
	b=dKInZtRwqeMg+tZiM1BAZjn/KZZv599REBEvoOLiLc2YFlkkIUXdjWGi37kba6+LuNwE
	 R1Kucq3U89NMSwi9jtfzhyfaYL5KE2R4DxiUYo6hUUab+tXspRqKcrp5u8DvOxCyCfWpX
	 lBAVra+nuQ3xPBPnUtsj2aofiNkp5SGrBo1abxRXajICxeImkYTxLBxutNp7TznMFG6mF
	 aRbHc3GfAwO12rGhSIWiEMqQJ0tJ0rNlD0mS0jsfASj7O3aEHAJAFcPK6k0khaTefF1Ey
	 w8vqsHeWZWEa9fVcZxnXnBdnR9FTLcnwt04phONhcVI2cQC74De6lbQC3uMUcvbqWRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZofF8Moh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y9LYm7Kx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD0606A333
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BD0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZofF8Moh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y9LYm7Kx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EvoT1289952
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=ZofF8Mohc+USW1eI
	NDFrJvaaQSRAQsSPoHSy7cpknJ1bfuCth11Q0ARVxBr916UiFOSYxyLIywCyZS8c
	EExb1vL98f9mBJurk8W3rL57ammW8yryZRVgHFLwL90C/YHwz4rw3PeocYmh+cIF
	hrbcMPkVqKgo0EMJ2tFl0eZV7VO/VEj+h+/qGk7dfc4klK6KE1i+cjNhKCfAt/n9
	CgZ2mUC1FyeKmWPi1ZKLkBg4BdOsABv0IYfE+7S8dLJ692DDRJPuLgpNae64B5T8
	J50+bV5STkXSPKQyjh3uXpuUlGv3naULoEmaefn3ZYsiQq3/tneVE5zjv8g/NX0s
	T3aysg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw2vfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso959539a91.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738913; x=1793343713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=Y9LYm7KxY2bk/4TtqZ+1UIE86CmBC42GOyxPhfmMQ0Uw7gRSux2XSGV81r7n4cqyXB
         DZm0ZryfoWQJ6lfKoqC0XLZSw1oDRXTK9tl0Xvw/+OGT1tl4S9aI9RwuVZmT9Hgud6Un
         xHJ1NDc2QY+KRAJmBCxGnkobkZjpJ6UR+cuhfDsuobtU2RXkH3cPs5n6IzDQadPeM64E
         WLpnzARcB8qb/HOHcdj8yVojsXJJu/gfkY8qsxaa/U1AcCGj64DLD0mEqon1Y7Ra//gO
         GZ/8t+O3EtuytBaRT8k77AJd19l8uocSbZGs6cjaBI1khCVr2SVkWeuhMuMTGTKJgrDy
         yDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738913; x=1793343713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=iPrNBElmjpELaWxYjMILbCqLOIBQJpjTRQy2R+OnLro0aC4uTkwr9kfFq3Sw/gOIQo
         FNu17dk2f/5jvNZsQ36YTUuK0TRzFI1Hgg52P1JMKnC9l5t+ih+rvtcMI7mUalBWQMvm
         gVT3iKTqVVCqaUcpn0cadrkPLjxrbYZ8yS2A0IEqwe9Kps0uqpLVp0xiglIIcBdYZ1y7
         J3NeAVmOPGGyyka4PnVjAFNw0/93UMu/rYdIc2yKgRVPOoEslNOGR9I99k/P5Twpasl6
         UkcUrXOnzZX06tqM4RC7tU3VMRgR4GCPySJ4bj0f+NgsiUQY7tbatdc3oEs86hnZ33oC
         pNHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtbvs/uoQq5BoOPQxmmbSIrzHOnqMGceXBSBYKSsSfnYaHnW7dLHXq2nZCtNVZNCuaHYnfkU1A48Ee@vger.kernel.org
X-Gm-Message-State: AFq9FYLefj/6bLzyX3CM6V5f/hNOJwquAgKoDsxHk8pO809C0uex3TZM
	Ir92JpZl260dlsl1KwHNALXN5q6DznmysOiMdO3Nr6EjvyaKd6OU/9A/4+tocvJ70fcesW5BCRb
	1PeTYLzcySr28izUIy+fBBFIVEoJMGJ04k13fQIpEmRtdbtWEDmATnT5dsDdBsgIV
X-Gm-Gg: AYBFou22x3SeH4WwWgafYvPWvLWkte+Yn9mPIphZz5yFC0sxYXclIkD0oM1gtclRhHW
	NxBFxmipu33WAZG7HBaYRT4rWAjeqe45esduPdGw9TCoelwO5x6hh3GyP3MDirYsWz2JAVWh//s
	4Eudj1gwMHIy6jaYGJIePid+TrPqvRhnvHajyrFFP+QLyZAaZLXsMlesmmyOKIFzKXC3gqOJmg1
	2gNS1p4w6W1/egkezHZp+I3BHBPrd9p3wMIqEtsHDAQbQUS7Cvcnf3BZOB9PF1/4yYwTafsasyL
	JjUAU8V0KOWq4FzwpIFpdnmhzjPbMNRNHb9Wd8MkbyyDc8+QOg3PF8n00XieHqriCIDYxTfPF4z
	NgzAX7vVUxqUyATFGBA+FdJBx3+zebpt/FooB3VebSLnnYOG1iFm69I7khrCyPCd9p8ovYd8bWu
	4Fsw9qcgZ3FUfCEDCXtmD/Pg==
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1184627a91.37.1792738912761;
        Fri, 23 Oct 2026 00:01:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1184601a91.37.1792738912170;
        Fri, 23 Oct 2026 00:01:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:51 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:12 +0530
Subject: [PATCH ath-next v3 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
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
Message-Id: <20261023-mpp-bringup-v3-9-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 0WyZY10eK4fI_M5iHlJEqrkPFDnlZCTN
X-Proofpoint-ORIG-GUID: 0WyZY10eK4fI_M5iHlJEqrkPFDnlZCTN
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb0661 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iclRB15sEzZHjfpwsoEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8GSyEWkCsepI
 EvuQikILDyYfUHzcoUI6qA1im+wpN0Bpr81TYzfB5re7sd1nUE0EkkByv4e/oh4EEcntxH0nBlQ
 Dg33WVQuSO7r8+YjMcw4bBJSZd0HuKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX+tQrsU88O0qQ
 glZBAWNfE+mI7TRcJhypofWbNFJR9/CyEAJxafGbQPRI3/j8Xi6j/9Z0Ekz2D4BbNhrmo06XeDI
 GUfInLLP2WCXhmXj/W5PdimIDtaQWS0IkLh0zP6omSg1US41jZ6fIzgT/SSUUJNTagqcGCBAenx
 RJdysmjXf771nmzwAGTBfTbXlyQnLKqL/rklScnto0SBG2vpdz7oG5k2vEQbLeVrYCKpITxpxjS
 iyooD8z07uA0bbA9FRoOAkO0PC4dDdn+jNeD38Nzha+u9+Cm1agWhkFRaG35SHK8/NyKVjB/j2b
 MtfszwF6rm2FMchYPeLS/HBncMqYSSQ3WLe+ffQ+QNKRYdotkVkcul3GlsJZU5a56y0FY67OTIM
 E6oImt/Jr5zw3/hquzN7m+mOkTb3w7vcMrDhElcvrPDhduoEpA8CZHC0Qa1cIIjVcjxnU/nYxa8
 suO72CEqjRR36pd/a+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Add support for devices such as QCN6432 that provide the M3 and
calibration memory through a unified data-region reserved-memory
node. The QCN6432 device tree continues to provide separate
q6-region and mlo-global-mem regions, while the memory types
mapped to M3 and calibration memory are allocated sequentially from
data-region.

Track the allocated space using an offset and allocate each required
memory chunk from the unified region.

If the data-region lookup does not return a reserved-memory region,
fall back to the existing per-memory-type allocation scheme using the
named memory regions such as q6-region, m3-dump, and q6-caldb.

Introduce a helper ath12k_qmi_map_target_mem() to initialize and map QMI
target memory chunks.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 83 +++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..cc488cfe2b2f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2842,6 +2842,26 @@ static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
 	}
 }
 
+static int ath12k_qmi_map_target_mem(struct ath12k_base *ab, int idx,
+				     phys_addr_t paddr, u32 size, u32 type)
+{
+	ab->qmi.target_mem[idx].paddr = paddr;
+
+	if (paddr) {
+		ab->qmi.target_mem[idx].v.ioaddr =
+			ioremap(ab->qmi.target_mem[idx].paddr, size);
+		if (!ab->qmi.target_mem[idx].v.ioaddr)
+			return -EIO;
+	} else {
+		ab->qmi.target_mem[idx].v.ioaddr = NULL;
+	}
+
+	ab->qmi.target_mem[idx].size = size;
+	ab->qmi.target_mem[idx].type = type;
+
+	return 0;
+}
+
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
@@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 	const char *rname;
 	int i, idx, ret;
 
+	ret = of_reserved_mem_region_to_resource_byname(np, "data-region", &res);
+	if (ret && ret != -ENODATA)
+		return ret;
+
+	if (!ret) {
+		avail_rmem_size = resource_size(&res);
+		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
+			chunk = &ab->qmi.target_mem[i];
+
+			if (chunk->type == CALDB_MEM_REGION_TYPE) {
+				ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+								chunk->type);
+				if (ret)
+					goto out;
+
+				idx++;
+				continue;
+			}
+
+			if (offset > avail_rmem_size ||
+			    avail_rmem_size - offset < chunk->size) {
+				ath12k_err(ab, "failed to assign mem type %u req size %u avail size %zu\n",
+					   chunk->type, chunk->size,
+					   offset > avail_rmem_size ? 0 :
+					   avail_rmem_size - offset);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			ret = ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
+							chunk->size, chunk->type);
+			if (ret)
+				goto out;
+
+			offset += chunk->size;
+			idx++;
+		}
+
+		ab->qmi.mem_seg_count = idx;
+		return 0;
+	}
+
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 		if (chunk->type == CALDB_MEM_REGION_TYPE) {
@@ -2860,10 +2922,11 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			 * Once cold boot calibration is enabled add support to
 			 * assign reserved memory from DT.
 			 */
-			ab->qmi.target_mem[idx].paddr = 0;
-			ab->qmi.target_mem[idx].v.ioaddr = NULL;
-			ab->qmi.target_mem[idx].size = chunk->size;
-			ab->qmi.target_mem[idx].type = chunk->type;
+			ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+							chunk->type);
+			if (ret)
+				goto out;
+
 			idx++;
 			continue;
 		}
@@ -2904,16 +2967,10 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			goto out;
 		}
 
-		ab->qmi.target_mem[idx].paddr = res.start;
-		ab->qmi.target_mem[idx].v.ioaddr = ioremap(ab->qmi.target_mem[idx].paddr,
-							   chunk->size);
-		if (!ab->qmi.target_mem[idx].v.ioaddr) {
-			ret = -EIO;
+		ret = ath12k_qmi_map_target_mem(ab, idx, res.start, chunk->size,
+						chunk->type);
+		if (ret)
 			goto out;
-		}
-
-		ab->qmi.target_mem[idx].size = chunk->size;
-		ab->qmi.target_mem[idx].type = chunk->type;
 		idx++;
 	}
 	ab->qmi.mem_seg_count = idx;

-- 
2.34.1

