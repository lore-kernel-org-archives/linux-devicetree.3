Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985341;
	b=oP7iQHEvBDrGL64BUxhJ4eNmlp8EI7cen3fiGTVodosZerwfF+35YuUWgUKwic6TLAyn
	 ot6Ndx1COQmuemKMgl0d7PO0jNnNILXaAqkUvsrcGstS1L2a3CPEHJIZl++FFzB6Lb4WV
	 QCw0GWP6vTY4lFSIgVWu4zPxm+GDgGc0VUgXJHWzd/2z9eyRxB53KV1kIFDyJ/bWHKooS
	 Chc4V1hiDrsPgBejWNQp1jXbkbn3VpV9c8mZn84bzdTt/imay9ldJusDczw7XVxVB4dmi
	 LvcJKucMFaknjEU4KkOArigbaWN35eZGvSAs8O2o1RGL/WkflpkyUNiNAR1aM9xHNsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=;
	b=xNWcNqhAsDpSzzpvj4Sh7a3nguX7Ctj50UvqDfweflQwTCdq8BeUEJvt4pcJuCZ6MEqu
	 E0jn9ACbtlyw5ZoAiv4GB6IQJ0GSR+wXm+RN7AOr/epyXy+wwxyz6bwEvVbLwdQnAKO26
	 T892wSvJdIkUuY255r7/6Arzqmx2i14gfTMj18CuQ2luXYZFR9Hf9kapc3024hOusEsQ8
	 0P/IwM5KNZEb6uxrSSOv4xEEukJ/9xQ0gOVLT2998PLrsL9DRqp9ieORATW+JXf35GaY0
	 9mLlqVTxZWw/CTES/k6a9k4ZUsAcaigReHkOWIR4wrVfO674EQQPo3SPEYK5/W9NNrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxynK2so;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buoJxTlb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E3F606A339
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E3F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxynK2so;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buoJxTlb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HEEO9031461
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 17:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=; b=PxynK2soVuo53JjN
	5aj46e3rVH7kXRVGRgHizLTk7r1efV79/U0yrirlZ7/QvmE9lWyP1ixbn046WYHW
	mRNkgaEaaU5spk5b068thk09RJAnom8M5OiVBPi47dlSmBWBNLB8ncWTx78AAh7p
	jhzXb/yblbck7Ox/MlVS8y+fvGb/gylJcl6EgNx+NlJ/9KmmI9gZjdwjFDv3oZYX
	ZDE+4oTOJNA6cPFKwCcls9o+Dp7zL00pMeN6/9V06JMNLlCrP4ae9Xy4jH1E9HOI
	bLaYdwKm+bI35HThXY48Od99Ofdf7AebqtXjmLlDrhKozB/bTqxzNqKmWqfkJLuy
	dkCcwQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk48r066-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 17:15:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso1730527eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985339; x=1794590139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=;
        b=buoJxTlbXc0+IbRZZQJBqPREtjlrOLASWu0PAprRuh3GthtMrqHrY+k8UJ1Zksdc76
         hMBF8nUYG59zfXGEYwroyKhfriPZiEy0AvpY7TqN1r05V+P1tNFBNy3icX1qRlbwBeFp
         2Bid6gfxbqTxQUwhVB8Tb8PVhVgVISKhFos59uIQRwQ0D1YceQKeUUqV5XJ0QohrvS4l
         MzwICVeuRZ3nflcewWYQHmYaZCU3QUHdThGPfMuY/7QhNurirLBqmbvyaZaJfiEg68tB
         +HMs9A6tZUu+qZ7+mVQAVe6wEHFtx3ATvaU7FwVzsC3LTCQ+DFL1OJuaDfGbI9PzLz6o
         vz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985339; x=1794590139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=;
        b=Yy3EjtKwaMi8FcSg5eOtwHmAuVAX4pnMVlKMopooswoSVSolk/3r0rZ00hL/yRyI7V
         PJTuXBYOETLIqTXvbojqgCNH3DPhMDHwsIS1nhMbzdOnIPZqwIKxCAJq6Y9dl3nt9/1M
         6UK8SJzE3yPmmlUxkfN+m3GxHiwfuSL41lR66oON1N/APS5gm1R/YQMxi5KnEu8iJyZr
         yDwV6KQdbQ2e/5+ab2f9Z2wS2ghkfs7HUhvANYWLTUlkMrMuETAsaIzg08lmVxIjeKpc
         mhlZrLwKjMBLOBSpRWKEAYIIrXBMJe82uo285K7fpvbmSf6Xp5/gmzKuZz2O21SKWn2j
         EoSA==
X-Forwarded-Encrypted: i=1; AL+hErFEkPjK13EKdazF82c5T8b/ms16/aqRYoEdnP77TNfdHdmbyfxuuXNICYEU7DekXGhXu2y4+oNRrY3G@vger.kernel.org
X-Gm-Message-State: APuU4Z8du7prW893cJOSZ+tBXuL18WD+8AIXH0PIasuiEgdaLKL6P1x8
	Dbrl7ib4Gl3JMppQRaygFjPKoJO8xBkq7dAXjPtobsvkaEBmQi4y2KENeiwTYrj+ItkYphzcxxR
	gLGzD+zJUl5bZYYmNWzGalaibb+8cIAvTk9eqn5q/o0HuaqoGe5bPJ9GBU2s3ifnj
X-Gm-Gg: AYBFou0PmVau0+vZvjD353CI7cX6G6bRu6beIz+2nsmfuE9uj9lltjkinD/KkGFQHes
	TqfWdkpJ308N5KJTBwi8RX6yWwURqHg7yNNXJ+6QLeUzzYDILThyF6zgdhDMpqn0xsy5OXsDIIb
	O9fEvzkMpgUbXORIpQYynuOxtBFjG746ICH8gSZJLYGMBmxvThwTUTrFXBbY6WTuXMbC4pBcry2
	OamTjWpBKNSJCKn6ViVoRD5B97bMXmVWDyglrc+EcUlpDkFuNwfIYDaEo/7crVdV8QpW0FcTCQL
	gtUsgam5dXEYJOZfDIlaB7d8uwBT4SEF0marmzWE1ePEZ46RsAPjjY64NTASkHyPpJweh6Lvk7Y
	/o5T+ez/bzvOKlo9/iX9jM+XI0JyX0Z+mz7PfyYAkJF4Pws+dY52cLWycL3f0VWwgxsSZS+6v0S
	rZ2KWYTFiX
X-Received: by 2002:a05:693c:839a:20b0:36e:371:8255 with SMTP id 5a478bee46e88-36f6fb7f6b0mr4460519eec.0.1793985338723;
        Fri, 06 Nov 2026 09:15:38 -0800 (PST)
X-Received: by 2002:a05:693c:839a:20b0:36e:371:8255 with SMTP id 5a478bee46e88-36f6fb7f6b0mr4460485eec.0.1793985338092;
        Fri, 06 Nov 2026 09:15:38 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:37 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:27 +0530
Subject: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
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
Message-Id: <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=3341;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=eqYY4N+b5bBNKlPSwJkXdHdjtL4HfBKjpUYn+IsXKkA=;
 b=GBQVa8RApuiz6ercB/DdrPne5hpMvwbz+39mcf5Gak8TM+/DOIR+JsQkatd14qD1YxOVp3Bni
 be5cEvNi0vbASIajgNIko9PHVXfje8oKBQGQwGiGrYCVoXQBWE0ZAFZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXz2SxN9IJtj7m
 FvgHCtSHQEGLUXEPBwAq8hk5lEL//hiLUioHV5fQX506Q5Ucf84npIEQv7fL1GuR7DPfhjb6Xjz
 YOW/G3aVn6QdU/tChUocKaxKCJuh0v9hIBE2lqvxScibSW1K94FOWGotXsrnUAUhZ8J7iMJkpMu
 o13gLOKWy+7hlYyD95e9mOqWZL4HswdSNTm7NLnyqMqWfLoe3+6yqFFcPEwuk1lavUdUYDjA+Sb
 qZqNicXtVUpbjG+DMxra/hbdS8dFK7PEX3LHoNTAgrEr9LHJNXNfLI12uyYtySjbNzYpJm+Hc84
 +iRk7FSxcWY5pjjHVbnMCahUhgvBKVj/tQ07Q2tYcCGkNU1Z9qu5DD/N/I2Yg0VH6oLJyHqpJjn
 4CBlrT3UTYQ1ygsPbMlw4J8Wh4AeQmu5BNDgez279ntU8qMuz0Wi5mSEwcaAl5FHqEgF0l3qqfq
 rMEn3LvfJELTVHk2MBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX5rwOTWP4ru/V
 0k87bm8wdU20DF8oV3YNCmrUEzx2mB0riMpSVZ1Ger/BEs8sIF+NCwjRaPqMPUnUub4zfPP56bZ
 F/BnABhmI/StU0xtj/Wsm4lLN17Es9A=
X-Proofpoint-ORIG-GUID: w1Yty7nF0yhfQzAIPg046nXhUuGCdxjY
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6aee0b3b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S4w_zJ8MM8sBhC3S0vwA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: w1Yty7nF0yhfQzAIPg046nXhUuGCdxjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

The "iommu-addresses" property describes an identity 1:1 mapping between
an IOVA range and the physical memory specified by "reg" in the same
reserved-memory node. Without "reg", there is no physical memory to map.

The DT schema now requires "reg" whenever "iommu-addresses" is present.
Align the kernel implementation with this requirement.
https://github.com/devicetree-org/dt-schema/pull/207

An identity mapping requires matching IOVA and "reg" ranges. Reject
mismatched ranges and report an error.

Suggested-by: Rob Herring <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 6675fc900e6c2d55b34c61dc9effaeb48e24f18f..00b02c19f27e195fc36c4bc1d91253255147c9ab 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -174,19 +174,12 @@ iommu_resv_region_get_type(struct device *dev,
 {
 	phys_addr_t end = start + length - 1;
 
-	/*
-	 * IOMMU regions without an associated physical region cannot be
-	 * mapped and are simply reservations.
-	 */
-	if (phys->start >= phys->end)
-		return IOMMU_RESV_RESERVED;
-
 	/* may be IOMMU_RESV_DIRECT_RELAXABLE for certain cases */
 	if (start == phys->start && end == phys->end)
 		return IOMMU_RESV_DIRECT;
 
-	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
-		 &start, &end);
+	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
+		&start, &end);
 	return IOMMU_RESV_RESERVED;
 }
 
@@ -211,12 +204,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 		struct resource phys;
 		int size;
 
-		memset(&phys, 0, sizeof(phys));
+		maps = of_get_property(it.node, "iommu-addresses", &size);
+		if (!maps)
+			continue;
 
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
@@ -225,11 +220,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
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
 
@@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
+				if (type != IOMMU_RESV_DIRECT)
+					continue;
+
 				region = iommu_alloc_resv_region(iova, length, prot, type,
 								 GFP_KERNEL);
 				if (region)

-- 
2.34.1

