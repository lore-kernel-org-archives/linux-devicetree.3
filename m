Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1484968FF
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921650; cv=none; b=IqtxT+Yx9P7gq+HqnfP4Fcce1/FcEWkZtWEi9QSEYduFPN/MCnKJp1Mn4hMsIz925crRqg3jqhZo5cSWgtMSstCIuTV5p2YdIZZcGnY9ofkIqSW7mqME5xj9t3ac+50YWf1creFqb86r/HxXlM8lk/+P884fXYSBPacwZEElBJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921650; c=relaxed/simple;
	bh=zkO7UGTBhc0abSbmAA7xbPJx3KQa3FMC3+fWJRmAgxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNbM7nsgoQsQBFWurykX07nT1JHo2YJhoNDjvIlFfmi5Y1B2DDRSj6+psZLvhCkx4afOiQ8LvJd65GPf8PbbQ/avFVEgZycWhrIbIZhP7+rOLloaKufluC9JH2BE4CCNTlQCyE+u1b4LTaICiz0nAFKIGeZA/xZQv5WuZZ31Bjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nI3M/mnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNF8UZ4y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nI3M/mnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNF8UZ4y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9GT1457669
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=; b=nI3M/mnSsplZXCvM
	E/yYWLSoIqVEdpGFBU5EwH/Gviv1hba+cB9tv/LWQc6yso+5yoIZl1/xERs98BVh
	sUlqRQWuUucfPwKyfl23pfghMzXqv9lYjjWJiAJlyLjAek/1pPn7EwsvDnP2KnMn
	aMGOlhKXkir+AMRgLkTzqcIl4N7QIjfUmZRiHs4qNQJZBFxExtThHLQ0YwH8Xc/8
	HseoertmTvfR5JrtSYZysP7IrkkfEcR6FYBk9RoiEfuCccjqN9ugmqnuryXBXknT
	oHIwJnvbojDg7qcYZGPfmki5GpS8DwHb7PMycCUrRljDrLi7zNo0MsCqNOVSHcH2
	K+DsXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502usqee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:00:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915c364ae3bso98161085a.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921643; x=1783526443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=;
        b=KNF8UZ4yz21iqacTWCeiLvELI05jhGwoBybPB8ER3Um1ddN210mQqnYgkuxRa0IdyM
         Pev1nq7qes9S05luk+cW1QYFOji3dTDS6zFsQdSeqvyQ/mLM87TR5b6J6ogWpDqVFaS1
         sfyZCeLBTFMIfLHA9T15LJqtfB45Fw8kBEbpmWQgg4WzenhUO5s+DxHFgpMfHPJyhCGs
         wQtFnQtcJHddk2mnDxY8k/boScAi8k++O2BDtdWRUiHlwF38+zgbIHB2fuU3tZu9z79T
         mZ4Tivqb8DZZfjOK9tE5LitA4808povgrD1hY6r2S+wcfbKQLcYTQKyUuxfXEoQMEHlQ
         b/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921643; x=1783526443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=;
        b=rSwKszekL9iEB75Pm/M0BmmNpJMaI77bikf/j2JeXdnzpAZ3FLsFye/OHDygVPGyy1
         0zfayrEF/XMjA4h/PtL8iCHxYkIhsWI8IEpPwBcoqBRfvm4seNmBcokg/1Dxh1YEFuoJ
         3A0tCmx74pkRlm8vZzzJdkKL4UdcDsHuB960dAd+a8xxeHT7pptMB/ONHSvQJlg3yb1J
         WmlT+minvlHpWN21cxqzvGQGrYypXDRDE+mwSgJwE/vv877fn2nur2CxzyTbzkFclSeT
         ktVTN8cO3GkSjGEgTGWq0gHKyOW5zQitrhrA7V1/YwOhakjPtNkWaXDq5KUpnTpQtxih
         c/bA==
X-Forwarded-Encrypted: i=1; AFNElJ+gmUE//llyXPGjMokuaKzkNBHqLPiCmyCOJu6wCYaPzKdEDhcp4Dbg4Yz0TfQDc5zZL9Wkjis/HcCD@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTbwXge+MQLhMd4LOOHfnv5abPLK0k2s6pjMprmAfSMM5VlmW
	bZy3bP4p2LgE7shylV8ALxs5Zv6ovv0JYAIDV/0V7sPNKnge/3JYhgsLIRXoCnGH570H1itD9E9
	OSjORxlVIJiBf8eUGKr4P81u9d+mM4w7HtDXuBYkbyzQJXPJIYriZyScI8LHrljWY
X-Gm-Gg: AfdE7clOSLq4vs1jn8iL5GnNLz2YI2/g6o0GaLqTCiP1utcAXwFHCZiPy47RqmzCU4C
	PhxlQQkcPSB1Lhr+KxaaASZdqGLv7lmuxXEDgIzXWfpIkfPpAugA/BfmKIzk32NrVPueyW478K9
	hAVtMKRV/G0PocYwrnFwbEk2vg2TccrOrwA1ZTtPeIEkWKvq27agRqt3AaBXSmnmI84jdEZeUKz
	WIGRfU3r7DV/zWbf5SA7EtZsA2KSuxWaLES1clSCfYXBxFi/C4xsgjQvBXO31SUJhCyhQaIPh9n
	kUoWG6wS1KQ4DSBu/HnPilKda761GKJ2X0CY34DcIvPO85Gj8kbQeFbAfJoLZPrLjF0fsHKhaKr
	J7KybAJaOyrlMe4NyctMaFOfpSQh1xBPffvSgK34EVI3i9V8rk+aU0O4fXg7LeB/8XaUsII1fxt
	QgFIXIFNgn+KFKIehRpBdoy15JyTLMM6re3FLVgmCuREUFzKUMQROreTeUsVGVLjo=
X-Received: by 2002:a05:620a:6086:b0:92b:3720:bc59 with SMTP id af79cd13be357-92e782578b7mr323524885a.28.1782921643107;
        Wed, 01 Jul 2026 09:00:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:92b:3720:bc59 with SMTP id af79cd13be357-92e782578b7mr323511985a.28.1782921642439;
        Wed, 01 Jul 2026 09:00:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:28 +0200
Subject: [PATCH v7 4/9] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-4-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX6xqNpIGK9ocE
 Wxc736tzpkIM+TMoUTy7JKRheyiUEkGXRmJ2hDo9dgXVVlT+jvYVwrqSUwstEtsLNZDnlCJl2+c
 NZ66nj4JSaogsQskZPbDmXQlie/V+NA=
X-Proofpoint-GUID: u9i0Rn_j8gYvpi3xQTwQX_CYT3Te7tED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX5I6mVqM+ydhc
 +OUBaH8zXfsFBPVgcxhu16dg+l4Cv27eD0B86lx8VZPkWlYh9eVyOzGvbYuETvMveJnXAsOnE0L
 o7RLS5vs9mMRsQXm4LDAqAgm1GoAtNmOnuM+dpARqJ1iTSRor9lYNGWhQlV7GB+gNJyFMNL3p3I
 Q2DmqwqaF3K3M3PuUf3aypsRUHsWI3HYNuIRKDEiA/Drdf5Y9vTB/dkKTNn9y1e8H8+D9+SIWyl
 xdbwdlLIRs0i0T3Ps68zgGwH2ZPOMybQE1cNis7Q6Gd9YmkNVFdccsFUmAPgWjLsMSmrmdgQozw
 My/dYSooieQXQw8Y2NysT2alIgcvqX1tR5UpdGIA2pTpzKDDs0yodHhn1jzroyFTJAJRGojHE9a
 ypGcAoYemO5cJ+Fw989x8e8FzdnpuF3jDE/w1AyI+NfdjC9pQ6aTMLapbiAl4+U8rowuiSAaaVd
 jcRY2Ab7x2RLFt25mhw==
X-Proofpoint-ORIG-GUID: u9i0Rn_j8gYvpi3xQTwQX_CYT3Te7tED
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a4539ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4SYEPDBQci7QR0ImIkAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169

of_nvmem_layout_get_container() only looks for a child node named
"nvmem-layout" to locate the cell definitions. This does not cover
providers whose device tree node is itself the fixed-layout container,
such as an eMMC boot partition block device whose fwnode points directly
at a "fixed-layout" compatible partitions node.

When no "nvmem-layout" child is present, fall back to returning the nvmem
device node itself if it is compatible with "fixed-layout", so that its
cells are parsed by nvmem_add_cells_from_fixed_layout().

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/nvmem/layouts.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index b90584e1b99eab4217cbe7ec48373e18a7caf0dc..efa631ce7283bdd6c8ecda75915911b5e3a33c99 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_device *nvmem,
 
 struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem)
 {
-	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	struct device_node *np;
+
+	/* Search for nvmem-layout child */
+	np = of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	if (np)
+		return np;
+
+	/* The nvmem of_node is itself a fixed-layout node */
+	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
+		return of_node_get(nvmem->dev.of_node);
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
 

-- 
2.34.1

