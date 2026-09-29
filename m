Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C204DB567
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672140; cv=none; b=so9ybnkhHnIgJiJVkqa8lyGfaIghBSEsOKdZCwJYcbJ690geA/uXFMjSp5QaIWcir+TV0lxLpsXKcKEqEd7ijhLNCoChsrr4CkyCuIvZIsfjzCxapbc3yEDyc5j07Cv7/Jx5SRyKAKyKhDgqBpCb5xfAh4EUvd5g+q2iJrkS72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672140; c=relaxed/simple;
	bh=Hq5FAfVkYKBPHqR0T3VMu1ua8lE+eXUIcRQ3nWuqpt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPxWkW8MKzxbzrvKvhoGcsINQr30VwQDs2OkoY7hpBQ796b0Qq3u++a8chVAHormfRrVGXchbgyPcePX6881DnK7v4N+ew45Tah0qRL4lWSpPCZ0CfpN01J1BxgDuzWB3KOOG3HxAqz9WtFdDlja+Ct7EwNa4mG/ElVO2m+HUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDNo1BXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im5BfAkN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDNo1BXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im5BfAkN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tf2q760889
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=LRSv
	BkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=; b=XDNo1BXtzNMvcXKDCBUs
	M9P/Fn8yOAAUJ3c1i6jwUz5rYUd63ZeTRJm5dksyefSQnuPBYxDD5HM6fJPjCzMs
	iK2NLig4GwzlfkoWxQ4CjQfgeffBTHAGyHbF7VM0EGtWX8tH6PwBXBQEIF2gIzN7
	AcKDXkdW4YC/dDsg/BQtN0whsPW/Sf3PzURD2RmzIn5qycNZci/RnuIk5HRp4ERT
	6FTzbSoomYORsBhoyM5IJNQKFneDB0op5a5GHCmFfJgrxUva7yvL6sZ0L4cu5Pu/
	SuPrN12wxCJmdN907M77DeML0JbNR8UF+J9tGBxK52TG2NY/UJvkhvLDc75V/Zku
	kw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03k4ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:55:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-349ffa249bdso2779271eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672138; x=1791276938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRSvBkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=;
        b=Im5BfAkNiWsbhfLMG2yLNC9VS7IWJQDSI1zaTSNYqFjksDbt3FRGNrqn1wKbfFGJzv
         ZZZ7te2c1zgBZRPias8zlNr8D8xf5JoTfEe3whwxhIa+8k6ZoNgDn8Eiddda1Il6wemk
         VwbvgjOK3WXVWF7+pac/5ye7yFbPAXVpbz6PUFZww0GuXVEbnZlKQdSmPa+df2u/Rn7B
         LiHA313+v53rKArWl5/qGAzNkB1O/k2K+N6o1AW9gAa9fC+vNaGCWqvlxFC/xEoKO9Gk
         qAK0JtyAgDxAFnwLEaPHkH9KhCbl52zdG558EyE0zItqD5Q9utlhC6tPuN8677cHRKhs
         Ni/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672138; x=1791276938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRSvBkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=;
        b=yLPylNCEKXwy/PlD6gkFbwkvu4gIzOu5Uro9w0LrULVSVU4iGnDrYWxDDs/yLtlC12
         GSAuEK9Dm9dfE6CeLPOgi48qYVcQvC6S9qVyGuZ2ii776aDRpixMgw21uUDWzgB/Yhqi
         WxFS7nz8M8pVnkTxUVnlFOfeEfzNZPZN4yzZHyVpb1g7njkc4aSGCu6FyP46Q1hBwC3b
         ZYwJYUZNydgUwM0Z4TxmiEyHrt6xZTRAAiew6z596xO4IYoUq5fwyqV2OQRnZqn2d7pM
         gp/sD38rR7l7kRQaE/3h8tamW6ScoaIGil37yVdjNW4zeV4nZHqtuE02HKMlMjubXqWB
         qwSg==
X-Forwarded-Encrypted: i=1; AKwUvBwDqQTW+uZC3VUvIj0sWIqMiARsRL84xm9rjoogzos3qFbubOxU7Wb2IgBeYlb1Uk1UxfMbpVDXHnxd@vger.kernel.org
X-Gm-Message-State: AFq9FYJFl6OamrBTGgVGQmk9EvJBgtZu9ruY8HqJQ00+Yk6OpuMpfwt6
	BhR1Is0R3i7HcXRMcujCSmcMBdN9idBaHtDsal5LSV2l7DYn0MQ8OOLqxF7ucJQOVaIu5YeD4/r
	Ha+gM0AhmxsSHEJX3ocOhUqxFX4K9R1DmrCe2f9k6QJ17gNTyPvrvbXjN0rMnZYph
X-Gm-Gg: AYBFou3Gb0qyujDF50xb78VuaXl1+oPXOQG5FUDT7Tz9OpxTY0R0a2A+ZTsI9MUpR8S
	EpawVOFXlGY+39qvggDuLTu0buBQk+oR7mMDhc0BhQ+VzzJXnjCWTbcVMMOcR6FnXOVEFIIv7hZ
	nMnp3jlkS/HxVNwQMQFgqTPDxCMCSP21n9jYDWZWB1Wnd0OSv6NwzvLzec9PILGcTqSeQgxJ9+f
	BkYnNulQ2u7m3t0vAdXLgnd3cSyDNDoJLkMUx90Rzjr9s0kv2+JDpDg7TqvZm1VBq1dhz4jmyo8
	l81CmLyMv/hgnyQYnOOSTpBjqbaXxohsXOVG9AR3gb4Q6Dtu0FED4tgb7njqxvtMcLkPKPrM3lD
	kGyRiXvJ32L3Cb7b/Vj4gWSB4NTEun+fRLlWkuJKazA==
X-Received: by 2002:a05:7300:8189:b0:342:e7a0:2829 with SMTP id 5a478bee46e88-342e7a0534dmr16856652eec.26.1790672137470;
        Tue, 29 Sep 2026 01:55:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8189:b0:342:e7a0:2829 with SMTP id 5a478bee46e88-342e7a0534dmr16856617eec.26.1790672136873;
        Tue, 29 Sep 2026 01:55:36 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:36 -0700 (PDT)
Sender: Sunil V L <sunil.laxminarasimha@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 1/5] of: property: Add in-ports/out-ports support to of_fwnode_graph_get_port_parent()
Date: Tue, 29 Sep 2026 14:25:20 +0530
Message-ID: <20260929085524.1554507-2-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX1GjfWUcE6a/s
 dw1oTMgroyN8QyVHO18VfYZmC+Wmj8fJhmfU+vgRXECbaPwkYudruAPpNVObak89zJM14IIbWjj
 IkjQdx1JWahSjpXFCD6hnA9VN5kWmG8=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb7d0a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DZTdMQFrvkQ_zHhSGZ8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX2u8wUG0oJpy9
 /fVXE6ofvGsCYGxurS+WVzm7Xueg/n2KgaM1oV3fNftN2AQ9uk60/+LeNbrqQDeOwcvMoF+66Wf
 Y+85r2XuBXe/gWH8IKlQG1SxY453Oy8HkVQLEWuPDuciVN/gon9Wfd+KWcVhpHgSQZhPWYCX1y0
 5TOaIW/1EXwEyHtMYRwmdDLWeqGVva1Jyds6P0rvsVb0VHRyGpRhoIHOZ9SBROQ9cD9+xEC1CQK
 L0hqMapF7E8Jqj/Gti9UnI6ybH1dSWNKXFeXI0RYUwnsgcOym51TmBAy75dyU/c0Inr6MDLUbxe
 CHryclzo7hgJUFlvRbjwLaQ3ruucE2FkNUnJN4m3HR1HeMqV6RUYnL538o0Y0f8HfC8yhZSFaaG
 Y5Oqm+XxOiIDJ3FEqTj0D1MYnC1NCI366MuWPG/PMe1E1B1mpr0e61cnieOla5HrGiTUp/wrd5/
 Z+Akjxj5VYCl6Jugt5g==
X-Proofpoint-GUID: ekDFdNVBN-rgg1FPk8ucQSxQpDfQes1n
X-Proofpoint-ORIG-GUID: ekDFdNVBN-rgg1FPk8ucQSxQpDfQes1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

Similar to its OF counterpart, the helper
of_fwnode_graph_get_port_parent() should also treat "in-ports" and
"out-ports" as container nodes. Without this, fwnode_* interfaces may
incorrectly return these nodes as port parents.

Extend the check to skip "in-ports" and "out-ports" so that the
correct parent node is returned. This change helps in using the
fwnode_* interface instead of OF-specific helpers.

This change is similar to commit 8f1e0d791b528 ("of: property: Add
in-ports/out-ports support to of_graph_get_port_parent()"), which
addressed the same issue in the OF specific handler.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/of/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..c259ac1f0457 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1228,7 +1228,9 @@ of_fwnode_graph_get_port_parent(struct fwnode_handle *fwnode)
 		return NULL;
 
 	/* Is this the "ports" node? If not, it's the port parent. */
-	if (!of_node_name_eq(np, "ports"))
+	if (!of_node_name_eq(np, "ports") &&
+	    !of_node_name_eq(np, "in-ports") &&
+	    !of_node_name_eq(np, "out-ports"))
 		return of_fwnode_handle(np);
 
 	return of_fwnode_handle(of_get_next_parent(np));
-- 
2.43.0

