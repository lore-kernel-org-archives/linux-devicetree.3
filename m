Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADA5803B2
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965886; cv=none; b=AL76288PbMYpFojLT+OKwSBrcWMdghLAgBeagnS1KUasFBpDTc2+juTEHBPgSGvTLoipJBRSrUhAAfrOGJIBvj+avE6WIgnRLQhR9hjjboyDipal46wx9LpCLrYxQT/yYNZYDxs1TB1t0PrNFqrwLWfqlG8b4zHu0HeeVDUBmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965886; c=relaxed/simple;
	bh=PnyhyXsK/uKdrS8E0sDYZofAuweW5PtRkPRa36gAFh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIpOCqwjs+cOU0mFsYVzadov5OdMs+il2OGbSy5rThY21SRqIZFS4LzUKbkpycriGRd1XrEifuYUPlqF6RHfQiGYXPhg8h8iRdnzvBXEqZ7/93EJLPW8vSHZSboGuPkSICYThV3EvGgV+P80PkO7V6ZPorkMXNf9rgwDk66Spk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B06ahjVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxyRpu6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B06ahjVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxyRpu6X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFYR1810365
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w4mHrMNwv2XiFKZ4wSaQxIr6rcxOi2dXJs6ooQxgIb4=; b=B06ahjVVEr64lARM
	u8vS0jTMdgSXQauJaNDFDb7gCw9k9Jzp6s6gPljKH3uFnx4uocdk4vI4L7laLImA
	Qw9MrjaEdTZVSjVxwK25Ge0QzX+sr09Zj0ypdP7t4fZtN/uTIQhcmYcjbbWDmFHT
	UWKc34jxqC0dlwurcWSzoex/yzn9wIy93H7sz4p8sKHhnQKQOjhReaTMdMJpZE7c
	nIOAaVFrDctc3Mbh4uo0oRfHYEsBX9nDLH/980U4nrQletSeCRtfRcJkl6jE7+8+
	biNoULO2swasBpBNrBWkvEqOa2wa9yEwCD+zWlCruX2OZEG4J5TwtsoP+FNuQDsk
	6t3/cg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj19dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:58:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85415923c8fso2493760b3a.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965882; x=1789570682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4mHrMNwv2XiFKZ4wSaQxIr6rcxOi2dXJs6ooQxgIb4=;
        b=bxyRpu6XP2w7uaf4BvRRYce9FgP2vqSGUCkCOh5hkqSIDlSqtd+iHZzEl9RgK1gje7
         br3lmchf4cnISMt3cMviBg+V07DfeeqlBxb82wJkfbmXQdnmjo7q9k73tZkB4NGy2INd
         Fd7N9wVgoAIihSeIIyLWdIEK1CY+DTYrnYp5BQXo6g+GYb+/3yl/aFrNmgcq2nTE3oNR
         gnGe1QE/BB3OdHp++ePaXfhUBtoNbyGx+Tk5fBH47iv0kaceYzA6CezvJB9DUHyH9JwR
         M1YMIJI6do2gFmdhTugDtZ1L+U6FiB/yH95xTUDmn6SdSK0iEp4IVpL43g7lli3d10WK
         5hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965882; x=1789570682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4mHrMNwv2XiFKZ4wSaQxIr6rcxOi2dXJs6ooQxgIb4=;
        b=p+5ZYOWz1GgsIU+o+LuAu2oGyn7nJ6ZxZWLn+vsaM4qvsJdOtOV7J+EIhvZJn6qOuc
         mKcFCOAi2rT7tCZs4pN+jPy2X8YEPyXs4n1AyezvYNPiMJq1159a08FDpZbMernggDpf
         Ch3BKu3oG7fEbltT1wMXDnve15cijttR4s1mq/o2Vxp3oCKX7vPgMR1Bk1x49jOVtYbo
         01GbkDAJHqbWLGs2WXBXLiSFgdHCzkW3Pf7bV1wCnV5NVh+eATDsjn8o1JvKvUppxnUs
         so4TTlYa3mBRk5BcW+7QSzron369sqN++i0jcoosGvHgqTEIE/1aLGby3rfmACTNU0ON
         bwsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwfFKrGfXvogfSelTAU0nKFGxdiUX6azZ8boPNsi+drZaaSygosSQPui9u6qZit2htToaiNHdgdshF@vger.kernel.org
X-Gm-Message-State: AFuF++mLoU7ONvqA+oIk+t29+1GRIjNdHOELaDXtAJKeM+PHN4xecLMr
	qUeZX+gd4yGaUP1PBXJjT4WzJDJOkVrdsgfZ2hAlz0ADPl0xMRRRZPmw47+ok0znF8ufDP6kk0+
	8gbZ8/7npYuQk5aOJ15Ywzsm2lfO/729OcF0Reus6sjycCPLjtVErIxvXRN1CId0s
X-Gm-Gg: AYBFou0f2u4j3ODMvj6WU7uhB8Agz/dG0Bv/vXRwG9wsic/uWDMCDpDMpFvCsAHEkHD
	tFHEnThbq8g+x1Ry4ABti+v02YEOmh54Ppe04QhdNwJBJ0Qp6M5lLxW9EB20+Jw9ppnN/RVoNv4
	wXOYPY8v3wd38FKs5U2zYMm1ueUPaNmIhZWuFUIimp7Aqtyy5wu4N73e4IOtq5/qgNWFh1EBk4c
	k58/pDScIu226jG6ZhVJW8DXFs+IDyTVqz3ganeXB0xRx/bD5SUfHwfwG8GqGWcqjwx3nBBM0Fa
	MCAziI3fX+enM/TjVU35E8T+Emgd6nc9hk7eg2NbgBN05RnJPn+KL1RHdMDkUKNo2z/gRaRx18g
	a+UGP4nNrpUfgXvL72GwwagyS59ZPzl5VmjY=
X-Received: by 2002:a05:6a21:6e04:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3da39cffb2amr58878696637.1.1788965881551;
        Wed, 09 Sep 2026 07:58:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e04:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3da39cffb2amr58878605637.1.1788965881031;
        Wed, 09 Sep 2026 07:58:01 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:11 +0530
Subject: [PATCH v3 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-4-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=5846;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PnyhyXsK/uKdrS8E0sDYZofAuweW5PtRkPRa36gAFh8=;
 b=CIIS85QEWP00CNdqoHfAi6N5Mbyl5OiOTkszOZgBXEba/tiTYSzUYezZrj2BppyysJQtqhy8l
 zqG/sGicuwtAElZEBu1f0O/vxTfn0gZHGJlxA+SSorpfxXzDAbFsqTu
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX0gGFfg6n0VZ+
 ipCO9vbyprXBcmVocPffZFGNBsU9KBxj5zelsJGV1JJW61KpfAmiKktJjBFLUsvo4wxMavOxHD0
 ikmln5gY7eQDkXNZXiyzzeXjBSUH59w=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa173fa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=5d7BNXMnqyCmxenBVOsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: F0j3-SAQKrccZhH5WtFg-ScWR7vkII5O
X-Proofpoint-GUID: F0j3-SAQKrccZhH5WtFg-ScWR7vkII5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX3tkCf0Xm7EXi
 tEb1zyZbdy7qE1rs+UE5ARnNCBTQU/zdROPKKr+SdRDObvHe7OOdPkgB8E6YLgcaQGd/WxJUnMS
 0r8jMZlHSjT3+lQMGG70+XWoS3sPMAQyfQjyx2ZN4suNFV3Fxz/Co6urpJStadc/O1xgS6nhRFS
 rKlwbVlKYXSE9XQ3c0N1xlyW2ZNI5N0gSvUu/gJhT4ppVvj4hbQYlHAAHTV6LKpI2Xq/DcA54kg
 XF75GSBEVeFecXu2vMhYK/jdfo/g2WFESxvrJvXEtFNRmTS0GlizVa3UzHD7NANxiUjxc+ugV4K
 su/NHMK41jN9runKpllJK2XO1vWSGIQYJ7RWFEvebOKFJNkx/TUxNi9Y1EQnt1mp1eruGXFRfxD
 jCyvKPvg7FxBYknQOEbX1belG5obcSOWaNarbgeqiPAwSS8EWw8gjpUdiVXzWWc33dqGHM9EjMf
 wbE5Uj8sA3cnEgOz7HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

Reserving an IOVA address using "iommu-addresses" requires it to be
placed in the reserved-memory node. But when "iommu-addresses" is the
only property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong under
/reserved-memory. A device IOVA range is specific to its own address
space, and does not describe the system physical memory to make it
qualify under reserved-memory. Given this, place "iommu-addresses"
inside reserved-memory only when it is paired with a "reg", otherwise,
define it within the device own node. It was discussed here:
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

Existing "iommu-addresses" property expects a phandle, which does
not make sense when the property is defined within the device node.
Introduce a new property, "iommu-ranges", to specify the device
specific IOVA ranges when there is no backing "reg".

This patch depends-on:
https://github.com/devicetree-org/dt-schema/pull/207

Suggested-by: Rob Herring <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 107 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 100 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..1b014666d6b8ee3beadbd77e2ec8a24459468652 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -190,6 +190,90 @@ iommu_resv_region_get_type(struct device *dev,
 	return IOMMU_RESV_RESERVED;
 }
 
+/**
+ * of_iommu_derive_resv_regions - derive reserved regions which
+ *                                are outside of iommu-ranges
+ * @dev: device for which to get reserved regions
+ * @list: reserved region list
+ *
+ * A device can describe its own usable IOVA ranges directly on its node
+ * via "iommu-ranges". Everything not under those ranges is derived
+ * as a reserved region so the IOMMU allocator won't use it. Entries may
+ * appear in any order in the property.
+ */
+static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
+{
+	struct of_iommu_range {
+		struct list_head node;
+		phys_addr_t start;
+		phys_addr_t end;
+	} *pos, *new, *next_range;
+	int size, prot = IOMMU_READ | IOMMU_WRITE;
+	struct iommu_resv_region *region;
+	const __be32 *maps, *end;
+	phys_addr_t next = 0;
+	LIST_HEAD(ranges);
+
+	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
+	if (!maps)
+		return;
+
+	end = maps + size / sizeof(__be32);
+
+	while (maps < end) {
+		phys_addr_t iova;
+		size_t length;
+
+		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
+		if (!maps) {
+			dev_err(dev, "failed to parse iommu-ranges\n");
+			break;
+		}
+
+		if (!length)
+			continue;
+
+		list_for_each_entry(pos, &ranges, node)
+			if (pos->start > iova)
+				break;
+
+		new = kmalloc_obj(*new);
+		if (!new) {
+			dev_err(dev, "kmalloc_obj() failed\n");
+			continue;
+		}
+
+		new->start = iova;
+		new->end = iova + length - 1;
+		list_add_tail(&new->node, &pos->node);
+	}
+
+	if (list_empty(&ranges))
+		return;
+
+	if (of_dma_is_coherent(dev->of_node))
+		prot |= IOMMU_CACHE;
+
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		if (pos->start > next) {
+			region = iommu_alloc_resv_region(next, pos->start - next, prot,
+							 IOMMU_RESV_RESERVED, GFP_KERNEL);
+			if (region)
+				list_add_tail(&region->list, list);
+		}
+		if (pos->end + 1 > next)
+			next = pos->end + 1;
+
+		list_del(&pos->node);
+		kfree(pos);
+	}
+
+	region = iommu_alloc_resv_region(next, ~(phys_addr_t)0 - next + 1,
+					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, list);
+}
+
 /**
  * of_iommu_get_resv_regions - reserved region driver helper for device tree
  * @dev: device for which to get reserved regions
@@ -214,10 +298,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 
 		memset(&phys, 0, sizeof(phys));
 
+		maps = of_get_property(it.node, "iommu-addresses", &size);
+		if (!maps)
+			continue;
+
 		/*
-		 * The "reg" property is optional and can be omitted by reserved-memory regions
-		 * that represent reservations in the IOVA space, which are regions that should
-		 * not be mapped.
+		 * "iommu-addresses" must be used in combination with a "reg" that provides
+		 * the physical address and size of this memory region, for an identity 1:1
+		 * IOVA mapping to that physical memory.
 		 */
 		if (of_property_present(it.node, "reg")) {
 			err = of_address_to_resource(it.node, 0, &phys);
@@ -226,11 +314,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 					it.node, err);
 				continue;
 			}
-		}
-
-		maps = of_get_property(it.node, "iommu-addresses", &size);
-		if (!maps)
+		} else {
+			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
+				it.node);
 			continue;
+		}
 
 		end = maps + size / sizeof(__be32);
 
@@ -258,6 +346,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
+				if (type != IOMMU_RESV_DIRECT)
+					continue;
+
 				region = iommu_alloc_resv_region(iova, length, prot, type,
 								 GFP_KERNEL);
 				if (region)
@@ -265,6 +356,8 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
+
+	of_iommu_derive_resv_regions(dev, list);
 #endif
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1

