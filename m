Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F0A3890F8
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120985; cv=none; b=bNiiEjTEYRSWtrSnl3Qzg2kLFt1tYSmlsZlYpvrWZfpXQEI3zacny4pUV1OQifSBLWmsJ5YJg0EO8hoN3cFblzkv0RZEcSUGUuEHi0GjjKwav73nd0nyJOFtJ1/lWSa+zko8+CTNF4slxKvq8X8HqcpPtJ5QZYx4GLuvL5GcMWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120985; c=relaxed/simple;
	bh=RsOQhBYGNatwQvsh2PMvNMWcbp4BrFTghX6Yuoweomw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1hgjGekzQmA1kUx3VEYJ6x/Rd4uU5MsvAjgXDDJWFl2xmagVIXyyCjwKKI6/qM9FDm5RgOt13pQNxBXXzXn9bjY6zEl/nDCPmOFZ+4pi5susdK1IzZRQqmsFdNP8744uOI+eaAfYJId9pGOttV/Q/IsEFrT8nJStox2ASx2Lhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSEBLOf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APL1Wwly; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSEBLOf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APL1Wwly"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G06To61596370
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=GSEBLOf5hxVD7pUD
	wdKA6JG1oQ3LCTjdGEFgFpKJ/hYsgZuaO2OfhgeAdEzDMLmKmAyQSDp4kQCBxe4q
	nx9XiYVmkDHoVjQnKvbUeSohHDcg42eh+XLj32c4/PISuCIIkj3sWmVwzlWL5Q4q
	TnH4kKr1cWgRPKdYIcb+vXxt04LSm8qoMjdRr9k+lACfirQp7R1/9rIiKgbZRWUX
	8fCotgLkV9MDf9Mah8Fe0AQ4MFZ2rjycZf/JEZyiq36+H3/9wmgeYjXhPaehuKOt
	QKgzq+wfwh3NTMqCFhn6JwTXa6RMAaF510CuiL32AY/BJ/viwOrIDBovkyhQNAO8
	0SNKSw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2vbjr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:23:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2608572eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120983; x=1792725783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=APL1WwlyBesiFFWO8i2NFfE6wzg+EFi7HjSZ1TcYJYuWdt21efIrZnrvCONHNIwbTo
         eptBmZpBjWdudBOGeKBUHRIIbVKZf8UtaoW4wBde/eS2f2mYx62JBrrNbr2z0JY+oeyY
         NeyTezz+HHJnwTSNIEUUZEab1yhb7tS4dRoQP1zL9R5YCZNLynI4Nbn2dJ/bMT00T8SI
         2Lo3iafSFur7yhecoLRfw6oPg93vFew5+M/vTYmMijj4Nz9G9D3v2icfg5CkbNa2qNGK
         n5AumiJTWdBgSrn54r02Y4oGxB2s22VYo4vpbuDCINRdC2XmUR+vIXKZJVrjUB+99CfU
         f8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120983; x=1792725783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=DdHWON1nOylffH5kezwUbXCzokeYthWheiTMfQxiuQcg512BnAO2EAdfPX92+h6seE
         /B5tfYyUvRAkLt/LEAh9CSDVgvweoY9o5jJQ7JWSL1eEpP15rMhZUEUnQkWSNZjyQlEN
         BFh3iLVov2rLi97mLgCBlUtetTuRO1PQ/5tEB3vKwuvI8WvkrUuiipKa4wKuNt0V+iu0
         NyqcW6r+UT7gXNNEt5o7tcdVhA1qNhLgHkE12YnAslFt145MfOq3j15XSzmr0AuA0Oda
         y+xzxWM8fBd30qv0clP01S/ZFIqbmu2LflA4/j8lm/oOgZc9A4vwuop4NOHVckk1OYpb
         VLGA==
X-Forwarded-Encrypted: i=1; AKwUvBwB2hHgDmcGn0pInfmdxyzIGYgOvo7byf7/+wNwZr9MftUceCxA53J5f1G7sJW2uwaoKLZPfJ8AAAt8@vger.kernel.org
X-Gm-Message-State: AFq9FYIpMKG5WcXPyYbwqXtaXfmkQwlfZFB4160rfciYCRC4qv7KSkOB
	cbKcQHG/YEHQeOp7UmJb/9OMDjCGit5VS4va9MvqJN5Oeu3i137lPoF3NH2gfocLZZg9VAFioW8
	lYow0VqSqo8/zQWYbNtniSrhyJqCGnXeLtK0d7NpPaHvk4Q1Z+vPUcKNy8+zNneA/
X-Gm-Gg: AYBFou3n4M2l0JKWpzPf7q4TxO6BvWxXM/GkSNRAWG7ChKEhvtb30xkqy7fJZxLepzf
	dRwnmVCu9rhM2B7A4hYvYu2efZ4zAzWiBP5GBULjVLMTBB6IlzzpiPcv+GWON5BbbvUdaJwyGf8
	JeQrdud5AoEMlAn3pxwrm6GvKs6/3XrMNVypqA/yc0U9KQYRS0TWU+rKZlxfE75mqC9Y+D1wktD
	UibtclgI+KN8j7+lkyz92hWDaSk/AF5CwMF7gt3YAfE+kZlb4NoQ3Qgl3HWBRshSJIrmxZkOTsg
	iX552h7rIOOKQicZbZZ5Tvgsx5esRTR5NQapt0DayJIB1/cbesv1hVYZBrZpmL3mntDCGhaf0JV
	Xb7zTDQcNjUIqfLdup6oZD0ehc4CHbQQz+AM0fh5c7RT9nfSJcPjDbeixag3bSVSoBS/qEO5XMA
	mH+Gcvwgn0pGd1nKsta5rBoA==
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr39108228eec.14.1792120982716;
        Thu, 15 Oct 2026 20:23:02 -0700 (PDT)
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr39108183eec.14.1792120982148;
        Thu, 15 Oct 2026 20:23:02 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:23:01 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:53 +0530
Subject: [PATCH ath-next v2 16/17] wifi: ath12k: Resolve userPD ID per
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-16-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX2Dwa/mtg3oWU
 A2yN9T1AFcDc0WF9BoN+ZD+MNTMVxqi5Tbiu/fEbh9iuD1apAafWrPmpZGdj++PCX1aUzy5sFV8
 3BU7aosSyCqAjm219a3+ILJyLEvfzsUFNYVprV+G6/p0LucFFT+x/T3GdgtcHum0R8Dcb3C/LyG
 Qa3GwAWdQ7bNK55DIKXEq4Hit0P9gV0WgANPYuHsyFneOC3Twj4REGwFAkFpH3SprdZDtdQe27c
 LFcaI6G0fXNoUkV8BF51gcD/K1WRXFPeHBK+uXzsrRIuvr7J8W4vfckqItYWlv2QM51ZRio3hpw
 uOcMHTsqzVZkRHElUO9g25r6mpe45tXTM6qCUKqu3ZkpLX71OEqBE6z4xSUPPNp+PnJmYkvqHxt
 qDvcEh8bFSyAMkD2JBMGoINP3kTdhkx6FkM6L93c5fROEwIeDxZZZVvuRuGOZLJgCNKqwBQb0Du
 x9KxIsGrb6p4pTFxQ+A==
X-Proofpoint-ORIG-GUID: H6ZCyrvVOcHooIMT3QvbUG5jOOuih1sT
X-Proofpoint-GUID: H6ZCyrvVOcHooIMT3QvbUG5jOOuih1sT
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad19897 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OMOyA7uMCkrHFcBVPHAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXwJhIJmVtKObo
 wro/2ZkbwghvL5NiJWf4keyv8M1Ip1KTkdrmM3l6ohEfBRaFMb//7JzskUQneaLlTwUSzsAmFLO
 iJupCz+rl2fHNWZi1S/W+X6nuudQQHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

Currently, the userPD ID is hard-coded during AHB probe. This does not
work for multi-PD platforms where different devices can have different
userPD IDs even when they use the same compatible string.

Resolve the userPD ID based on the device address so that the correct ID
is assigned to each device. The userPD ID is used to determine the
firmware name and PAS ID for firmware authentication.

Also set the multi-PD support based on the AHB device descriptor.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index bff48b2fe124..889361e637af 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -16,6 +16,10 @@
 #include "core.h"
 #include "hal.h"
 
+static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
+	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+};
+
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
@@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
+static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
+{
+	const struct ath12k_ahb_userpd_map *map;
+	struct resource *res;
+	size_t i;
+
+	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
+		map = &ath12k_wifi7_ahb_userpd_map[i];
+
+		if (map->io_start == res->start)
+			return map->upd_id;
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
 	const struct ath12k_ahb_desc *desc;
@@ -60,7 +84,8 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
-	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
+	ab_ahb->supports_multipd = desc->supports_multipd;
+	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;
 

-- 
2.34.1

