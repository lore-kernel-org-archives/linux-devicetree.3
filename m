Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B9345ED3
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120958; cv=none; b=bf5iN7b6F7aCYjj2w7PqgYSBskWpOOOgBBIqrhd2WTfTjIVsVV7ZRHyhCD7p+p2ooNXnBTWtUALvmS0ico4hnIl2af+8LMWrazZkqHfdtQeOF5TQoV3EAh2hbX8KmWN0tavENwOGuJPCJDZgoRPV7XY0cuN2CcJqjV8xA5CEiQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120958; c=relaxed/simple;
	bh=0QRbdJf2wr23jgxU8aOFYqXhwWKN+nfRv5rDGTDGjwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfOJuG+1QHc4SLn4dVLHz19mx1WRct58YaNv1IkdjVB3M+Ln9Qs1axGIZC2aYlr5dU1NAwIVrvFpKY+eVhkyTsNYkDnOc4LasXqtdQiC6G+UU21BqybvKmIWSgziIhOq8UR39V/bkAPG+3TnJYSHvY5vG1ZG/JNZvi39DYv/gGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVei3o0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dd2YI6g/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVei3o0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dd2YI6g/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNg9gn1635468
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=AVei3o0rrTWrsVxr
	W46F6cdjgt3FILt2kZ9zKhEjv1/RcpUmshgO9L+dHNvJaMj8x8Nd7cmFZE+r77mj
	/iioxgUCbRTUzFILr3jiPv+vMaZBrpaoEzHqMQa8QjTo3GcIPr3+teIxTYYxtHTA
	vF+Syl2RcojLMnhp7PqORRkJP+modeeJmaQ4KCtMOGOX13s7z41Apt7Ic5mT6hhv
	D3sGd0baTlv76j+VTICyRDJLCnzeY+gt8Trw8CGGD2EyR7ky4JGt8us5wP5XNehg
	g34SnLYISys1dl5C2K7ElguY9kbgSlj2P+Vcf5uULIbNYTzg//oFWiWbDuLlXzMh
	OjT80g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r10m2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so572471eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120955; x=1792725755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=Dd2YI6g/brFlNWzDtNdo/Wt871uyfcELVEJtyCnBsq92rgAfkVbxDdtoraCDlVVfgF
         UlT+Y5lxltjpSYre5mD1R22XQzDlH30mzhF2qQZrmg2e5nQ8KYEh/2dCsLznZdkHOMYj
         JEnP1LOLsgsZ82BZZOJ33KC5D4FN0rPJeXNJoRWsWvsA0ouCvhFr25qtYJid/t1btrTu
         6bonT5xTKY9lVpvS/qcrT4GsMycMlvm9DYEjYF/DgUMcf1YLfzBkJ/ErrWbDfQYip8QX
         kZkP/R9G5dc/lmZs6HUv2HdH6nJXEqfeibeRp+TBwEE0fzeH3h6sSG1fZ7MVy14Q5aNN
         GBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120955; x=1792725755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=RciJOdWxDMfD79FDiCE8RGIz+Ej+/Lf/Fz0exp4qQPXjhicc4sz+NOTqZ/q9splm3M
         iPoO6RxN8O5DyWMkek90VyyKjLacOqXVJjeCJR++Eejy4ArXW4TlF0tDW79lbG2nTWwe
         SPeCoaFZeyKapT+HdJiZZ8BSd5I2Ov0CLz0AopTAb9UYHEcv0ujxsTidE3U1yrPH4rtd
         JDxKPnmSXtlGP0YJTEQSS8MJRJjRa8IWp0h7M7EHaevhNVC+Q1k0yvU28kRaLoiL2X2e
         7U2qz33GgAo62tRSRnZBIegxMzt343XNQt9au356GHHSyiZaJ5jKrHNJM8YmVHWOoBRY
         SGgg==
X-Forwarded-Encrypted: i=1; AKwUvBxwz7y3fqStEaGURQqQl/aE9Rmo7/d2eTCTNLBfLTqT3DbRnFjwWNsGYOHdjTHnIz7Xo82EegH2ckU4@vger.kernel.org
X-Gm-Message-State: AFq9FYLE7uj9X5sluxZJe246dQm2PR0DOx0YvlPnZcjD6j+Is6xKl5f/
	UF1VqwhNU5aORSBIwAGS3bVd1NCOvAwoSDcAAkMIxEGjYYk2lO9pJ6o2/J/wXnSt6NC5lU2CNNL
	7JXzxCYPv3eCGVhqhenoWKVHCWy+E65SS23C4alvm2s2DepZU9LaPx0GUvxVi3zdz6dUt7nKT
X-Gm-Gg: AYBFou2weMq74etESd9vpDJTZ1iG3YV5age/6XMyHuSAgakzgOJ3VhZQBTY6SJMSH/R
	/8rkbwBBhQneq9dsyLwwIBBqf5TNWimuJiIWSPUcjB+B0FlfG+HwkxYG3gkij5HgwA5lqUBJzx6
	7hGVfUVEocEgPYUHQksQ8dufMAXZnAaanPVmdKH+nUy+Hu9lx6JlQqjg//xjO3fZGeYBPTkVSr7
	btbl0/nm+3zS5iBF+Zd4N6dGktrUE+gLd+0D+ZUZoPHGkNpGDiTQuI1aTiaqyb2gEUS+aIu9jHQ
	+UTxRv94eFCewVXHVUD0S7Lsi8PU4qGFqq1N4mxGokffuE1zsARgHuM90dhLrFNcxKuh8EjhybT
	xMyvvvyLBOViTUmwcH4q3LfsB0i5StuKnNKfZRLABOKmNX5EWAhyIFzn9BVO+daxwvfv/C/DtxG
	hmPXGzKfW0WGy9MSw2FmsFmQ==
X-Received: by 2002:a05:693c:808d:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-3602f1757f4mr2286968eec.21.1792120955128;
        Thu, 15 Oct 2026 20:22:35 -0700 (PDT)
X-Received: by 2002:a05:693c:808d:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-3602f1757f4mr2286935eec.21.1792120954568;
        Thu, 15 Oct 2026 20:22:34 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:33 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:47 +0530
Subject: [PATCH ath-next v2 10/17] wifi: ath12k: move MSI config to pci.c
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-10-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: Ge84IP_Imszuzd_0bvgYkTuw28d1g66j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXwfte4PhWBfak
 Ozga7G4G0/+F18mkop1d/nkYkeECxFgIefihIPLAo4W62Nn5w4dWYNvBHdVUku1AdCNBylaBW5Y
 yOflLy0zPtv+BMiFM5TKAzP3lxnDfRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX0qZi6qoABk9Y
 +AefgW0RF7dVhSebDHeq+Of723T0QVIZ65dC7v2e0F8ttEKOtKb2CrC/wGXTogVEcjC63La5Ub6
 Sa3jCIDPPafn6NjyPnU3bqwjBSWuAWwnUDsIDC3rZMyQdUe/cNFgagpUJaisaWHDAoq/i5J4qKw
 mpQBWLZ/S2ht7gQtCAcJsVRuSNUYoXuJeoEhuwppbetvkpKTfVHVKf15PKohIw3lvsMWfAa6b37
 ynaLhc0vakEuIqj1B/sDuRLeiP6C38SkqGpCMJJ/xejKMWtIAc1cPV8pJFfWhK0cANQ29d6zvrL
 vRVcnqjFxL2xEVhvL/3X1zz57IoCPRefd16nLZ83rBMxpkn2LsiLd1xjNtar04T/tr3UayxJPK/
 sXaPLB22a6Ibu/mo0NWzkeR19W435On2EsB8Z1W6qMh5Lah7TMSxvaQu1j+o1zI6xFEyJKB36ha
 4uj7zsix72Pu4JZwvDA==
X-Proofpoint-GUID: Ge84IP_Imszuzd_0bvgYkTuw28d1g66j
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1987b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qUmDSaCxm7SoV8805q0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

Move the ath12k_wifi7_msi_config array from wifi7/pci.c to pci.c
so it can be shared between QCN9274 and QCN6432 devices. Rename it to
ath12k_msi_config.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c       | 14 ++++++++++++++
 drivers/net/wireless/ath/ath12k/pci.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c | 19 +++----------------
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index e6fe891e58b1..fe0939ca890c 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -40,6 +40,20 @@ static const struct ath12k_msi_config msi_config_one_msi = {
 	},
 };
 
+/* TODO: revisit IRQ mapping for new SRNGs */
+const struct ath12k_msi_config ath12k_msi_config[] = {
+	{
+		.total_vectors = 16,
+		.total_users = 3,
+		.users = (const struct ath12k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
+			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
+		},
+	},
+};
+EXPORT_SYMBOL(ath12k_msi_config);
+
 static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 	"bhi",
 	"mhi-er0",
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 3097afb03432..55cc875f9ce0 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -96,6 +96,8 @@ struct ath12k_msi_config {
 	const struct ath12k_msi_user *users;
 };
 
+extern const struct ath12k_msi_config ath12k_msi_config[];
+
 enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_INIT_DONE,
 	ATH12K_PCI_FLAG_IS_MSI_64,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index bb617bb6b71a..783c5d020f07 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -37,19 +37,6 @@ static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ath12k_wifi7_pci_id_table);
 
-/* TODO: revisit IRQ mapping for new SRNG's */
-static const struct ath12k_msi_config ath12k_wifi7_msi_config[] = {
-	{
-		.total_vectors = 16,
-		.total_users = 3,
-		.users = (struct ath12k_msi_user[]) {
-			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
-			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
-			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
-		},
-	},
-};
-
 static const struct ath12k_pci_ops ath12k_wifi7_pci_ops_qcn9274 = {
 	.wakeup = NULL,
 	.release = NULL,
@@ -103,7 +90,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 
 	switch (pci_dev->device) {
 	case QCN9274_DEVICE_ID:
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
 		/*
@@ -130,7 +117,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case WCN7850_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		/*
@@ -154,7 +141,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case QCC2072_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS_QCC2072;

-- 
2.34.1

