Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550536;
	b=G07L76EfvcCkK/Cc8mnIjBWKrKX1jQfdFr97CAiDRQXtMKX2i27586WC+AA5OCVWsVax
	 4G5yGkRviA8G8iqY9W5m9KmDRKnyytfY5HApCW7Lkh/9o9AsTRIYqw3yenb0NMUv+864S
	 YaFQ/EFjf+LnzFl9TLXsvaPqAK5/co5GCeuym95mFEUW5jiCtNnpABBPeZgSfIXAfNmKH
	 3b36ZHcmjMu4jjI1qZfR8w+r5czCo25qrDDNy95xFfEv+/WDRicMUNLItdIUWLEZVCKiM
	 YihZrR8qEkWvF1suzcPddJI4hmixwJNpWtvbyWouRlIr6qBQ8vsRltgOr3CggjpZLbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
	b=XBTIu0ePeWS6lkFXh+2c91r/dkJVaqhFJwMpP7kGfzHpmGEEUSRck1eTh16nxRfuAzLk
	 ty6UljoQ1nUWdtQkOarrEWlBvEmorxiG5YG2R7473ehoKM+nc4f3xVINUrz8OaTD3mcLe
	 Ssa/PzX2Dxlp6Mdh/rk8qM/kxCz10Nean1OcWAmI3Gf1Gvle82DcqY6plnVMI3FLYv+0b
	 AI2u29OfmmTi1LFKMA07FA41pVZFUOiDhUTpnSV0UuUtsxiooxaolAUFCC5+aOkSUNWDa
	 op1oCN7aR8G4JZgOLoYDMwlE85/8QQM8AdiY7WIBNqAQ4vk3OULUYtrG3z6Rzgu/TRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7t3jS7E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3F2606A6BA
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3F2606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7t3jS7E
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXN7u3000360
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=; b=IC4IN98aD3qMMEOt
	0/ZBAR6kZlsNSyoJV2ql5TRgq5Aithhlw3NiXK80diUP4tatEE8W/L0FHZNqbzeW
	cvddkNTUUUx4H9QZ/ZYL7Xjnh/XxQoWYHs+q8UN+cK9a85cOGpt99ISk5ylzfgao
	MNEtC6y2kHRUu8Nfkj4yt2f/MzpQaPBHlX/e0kvKkdeIfYWGqOp77WO0WyLXv3X8
	05v3ELy4Rzcs40UYYP4oFubxOtgYGOdhzvamXDcn9I+jp/HNFXecoMDOoU4/xSJ6
	9C4oimlwryuUy6Ixw0QVRMVxXxa2zMUvV+ZK6N4VRmVH6FU/sPXSd4ZIcZMVf8YQ
	3ZhiAw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00gms2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a6f57c066so502327eec.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550534; x=1796155334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=U7t3jS7ECoUcRGBjc2c9SMcEhoOh80+/bGEYe9U8dNeaw9LCJJyVEnrkM3sGnBF8Kc
         cBXQEgVAIJV2YnjpoyvqaPrranLHyo3xZ3O1XVjSWa0Achke629T6ZCxKVITENzr+KxV
         B2oNY9nalQ6uqTIxQRueQaA0Wf1H7Mt283nOFpqsRqPybyb+mbymnG7/rNtsNLKUBrd0
         2GW3hpN2g9n3bd+wdAXXR98ZqWucmFNJcNR99ZEKLawzKwnT8a/Hi4bMYYloB8Drve8+
         06b/FmQFuLuh2msPkUAt1Vd6MznK5c35XeU+XzA5Ql7nS50BqwXk5JGDl2Siumfv0Aeq
         4iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550534; x=1796155334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=QEmA3vpxH9mSLBKSiN+1Cnp4VyaKJtDc+CePZZjWfaFQtolYB7V3rBUIRcXsYA+nMw
         P15hqtLL63qpbxIzyz5g8/TwO2PGDu/L/CYa4IIltR5NfPUJ+IGIEV7ll5TM0dFpn7ka
         hV6OUSPpxj/cZBr4qgNx9owKa5oV4rvz89Yv6+G1+oQRzkadHapcAkrlzpug93zdlJoR
         2HmQXr1RHMTNY8p/Za6mhv8geNMwWu+TQpmmxBTESU8MnYohzXV8wXjhdnp7vJt3IxBh
         pjJhzWsrxiee9l0hFRDPzWO3VDH7fFEI/Rvw6R/7t12Mmpq2/U4r5zIWXZPzDp4GWw0n
         Xguw==
X-Forwarded-Encrypted: i=1; AL+hErFVUWIWKiaO1YBRrLz1o47+pBHnFjl6JP2EzSfD/4GWsT9q7+quXy/+6eY/s+OHHjuc5lcOOHLRm5EB@vger.kernel.org
X-Gm-Message-State: APuU4Z8KaE8cQJaRqAwo0hIX/jnxZTvLtK1pNRj33DtYR1uP96NZIRss
	0fUooO9Qp/148EXef2DejrkYGUMYbQttpXE9A4XLFHsGa77QxR7DGoAOH/wRlxt57SURV9/5ieD
	NhsALAuoFzlsKzuHQFzr97PuZTTOKtH0mvhPjxhvAinfwWnWEf5ufB/uJajeo38Ov
X-Gm-Gg: AZFdTZfj6C1d+LsVnwDTbazyhf2N4gM5Aq+tq5Z1WuddkFZrpsCiKE7UUkTptZDSpuh
	68icth/5CW/6HyHEjaG3rUBMeLBkNBL9krozjJeOQ1dtttEUrPiNkpMiCKUP/DOroHeNNh2Z9D4
	ihv6M5REtbgVNJZibql6nQi3XumKHl4v/HzVBYZs5LliHm93zOBwfQTngQ81qdwWHFe8JAtH0L/
	KE0NAjzEZW+1b+F2t8B3kawEkTlCPjDZ6Ghv/Erp0+mtBFS25Orc30MKSZO8RuVxWVGNXeqm9yI
	vtU5czFhE+Z17qX4ih9O9ZhOP5jSgvARuDjQRZzIcE3n7+paIdNqTBnq9kpqOEwGZc4S6GX3axz
	5zZdOFtoV9BVTgDgGTDznUDx/DY5xc3Dw7JUzhymjlwB25DuuFIxhYa7/+5mZbh8B4slQyF/A3d
	DpHvKOn0s=
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181169c88.0.1795550534070;
        Tue, 24 Nov 2026 12:02:14 -0800 (PST)
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181120c88.0.1795550533379;
        Tue, 24 Nov 2026 12:02:13 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:40 +0100
Subject: [PATCH RFC DNM 11/15] thunderbolt: Raise TB_TIMEOUT to 500 ms
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-11-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=771;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=QbBiyvqAcfQWLt33cWM1d6MRIS/efAtBYRH5kpUuajs=;
 b=ceEoSnWOSQpTKTmrasnJ/E5U6w+u/Bzq7S/DCRvL5JzUoYBrFt5Cr/GlkYw1Cau+1LS5gz3BQ
 g5SlBy2yDnSCde294+DUgMW50aPABreI95lPJgrBaNZOLzRqhodnx8M
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: Hnu4Joz8CeSf6JfIPfCxANz9onPPmzX9
X-Proofpoint-GUID: Hnu4Joz8CeSf6JfIPfCxANz9onPPmzX9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX+jb1MR5dDrS7
 VmFAK0t2XhNfrQ0lqewiw5qGbapeq6fxuK2mx07PsVEfsOQOhYds4snGSA1c9D+xDPx3AEDK/5B
 RHngQCJpYoZ/FS57hIR5jTZnC16hYoQ=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b05ed46 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=S55nwNfuHOdlGrVOgPkA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX9r3zyStx+3Zm
 qEdu0NvXUSNMQrwfGrqC1LJWMARS8ie2ieiStAPr8vqjiBVawU7o0NhSxl4xaDBVLwfhe2N9Y83
 woptzVtMoFYnOSG91jn/qgxEQAllc/j3A4SkWbk1HvNNBy6T1lwDNGFd/F3jq/Ab4B5rpl9locR
 sH1LsKFV1UB0ez1qqSvpSeYfcoe+K2wgpJPbIrn1VPxRAKhLanI1Mad1tY9gY7DrFeBSSlsd34l
 LFAbqcbm1/dlIbmdyFxzo7TQnyKAINlUzl/dpGw6xIXxKmqKt6XhF7GeeqpTFca80hh0+v1H1on
 gtbQ7VHD2e9CQjCYKQ0343Wmk3nTv5ze/rbZwRnsK2+jXcXGxFhef+DgSGD3VrWQTJECkJ/7DL+
 vCz3UowtifSxIWWTpL7URgbTLwXRomjRHjDD8NQxC2Ojx/uETj/LtKMFFQNBU9thLgfMATt+JHW
 ZuP1VdUXhHgYYe+NFSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

Routers with firmware-managed link training (e.g. Qualcomm) can take
well over 100 ms to answer config requests while a link is coming up.
Increase the timeout to facilitate that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61a5de84717d7653c3516faca2a3db2ec..7594bc24c443fc27af651dd22c2db4b6e5acd696 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -16,7 +16,7 @@
 #include "tb_regs.h"
 #include "tunnel.h"
 
-#define TB_TIMEOUT		100	/* ms */
+#define TB_TIMEOUT		500	/* ms */
 #define TB_RELEASE_BW_TIMEOUT	10000	/* ms */
 
 /*

-- 
2.55.0

