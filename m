Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF6495504
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455134; cv=none; b=qp5b9yTIPiBjvcXoSWHZFg8u7V092m8ZAnooteYAqhzjA3pFqmJ1dIQPuY5LoxIYQzqSTYDkrGZpMvlOxpC8ki50WbN/l4vL3mqPnADaHlSe7cfiHXI+yRStUGQXygOE0TKkfwzTumGmCC4j/rlai7dHGMjzy2BEo5spk13guY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455134; c=relaxed/simple;
	bh=K/tVYy+6qbueVtZCWtLkH9tCPTJuOOQjJyOkjda3fGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmenUUuAGsfDpOekwxO5lr8P3fE1b9tCsMg2HEdNqWl5DHN0FklFOdKvJzQ5TlrW7lgvX7KPuGOJTsMNqG+yffkEDSCcBEI1HHKu7Ri3A5KMsLKaqav0ZkEgUipIZqRcBiV1w7RC4MDgVTRgk7zV80Qow51lyZYkJLKHVkK0sEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYh3HATT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUVaMKQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYh3HATT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUVaMKQr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KMc81845748
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=; b=WYh3HATTj8NQpdVL
	L8WrDjTB4ZCgvC/7USEJiUlpIxDYZ6O5opUIPus/1BpblGXK5l4NHAuMNaFiru2v
	wZXylQIDpUO6VseYuURW/9Uw5sm5YaCY9msqDpWy0MLoVQmPtlcW9EUhCVB5W0ZJ
	mLa+Q+DeuNDemPxy7mkvpYCYTIx/L6NekzopJijbFkXlOSIVUmh4exIlm9FEmDb9
	KAxE+E1KC5dFaipXHZhhPsbA/OHsk8K4sE2pWKN1KDBs7vb16Pu/VhMXRNsIUcWv
	a3E03xgrSHi3fn7oan3pwjpxk91VgLE/qnZmZPwVKfp5j/ab6FkrLVvivQQTzp+L
	yZO/sg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jhrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:25:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e651510a5dso15207185ad.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455131; x=1792059931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=;
        b=hUVaMKQrhBDQhgm1sxxVEqp4NeYy8KlMrRRL+ih43fprF1vAGanyZEvpCtN3xkG8HQ
         XmBJkO8N1wYBnH0w+BP0FqmMbWgxqrLrdB7JObb1BGX/5BMuD8Zl880gLy4cSpJoRUwR
         dqocCpCtgUBjiehlc0ADCt0QprP5bIwDRDa+UGsyDGkmNfXJY/jjghgjPLVKR8rYKKyU
         dkF0vu+BeayEKspPnyBfrCDPNx5eSh1Yc9/2rvyCHJVX7Y69kgp4soLo0LY2yriW+nrv
         b9NUvrq7f40fLHHeHSc8+3DznzozNpdF1OLilhRf2rS4bAGi2gBQJfH13eYHGTIyAIAi
         888w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455131; x=1792059931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmsQbMNmP8i2tzXsasw6FBSJec6UK8O4ko7kuCL95o8=;
        b=LSEWtNlitpDVDyK2Y0ti/y2ytyHShb4I0mNlvk644UPc7gPXvtGzqGd7FRPKbcswY8
         Ll4B5pjNR93qkkiGVebQuOhs+XOtXYAvRTENrNbgmCRCcfE8rh+t4g9zAYRBh3SLTly2
         TU2/ot7BLlCs5jmksn0IMMcc86n6MKuaXAkUKKlnuww2s2DwIYEIzrlYhyn++vs6SuGX
         +bIbP/UaPGOO4urt8idPqTQf+iTqfwj+kYbb5mj1CTm7YIIjke6UmeLNVMikTOncKvMh
         3zABmteqzRFM1r3VGXN6Tu28o/xpoCwZ3BKlLe0deD0Lq+VwCbc6+Ya+/S58VjrELg5R
         ZRWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrsbJaK+aYSHHoLaAu/1005Squgi3jtc1T1IPsXGn7h+4NLxmkSesBaHgza6Rr8kn0pY1j6ogu739y@vger.kernel.org
X-Gm-Message-State: AFq9FYKCyhlXGgtah/nSCHn5hTxAgec2/nY1VoXpgIqVq+YM9Cmypc+e
	BiD1UwYmu0e8eBnQFsjajrilOZAkxSpR+S/rlHO448DHfl2jQjrXT36PQ4smIfnnOrskCZa3+54
	VzscmORUaFe+EAIrXihHkmntW5x9ekMNnHufRmwL1gAa+dqwYlQhQolGwthsE+WKO
X-Gm-Gg: AYBFou3UcTtGPK2G36Kho5TvDcjhIOSU+N7+r1tb4lJW03plCQvXDTSiRqvY/RUKZxx
	lPlJ8YPiDVY6yGOct37fM/Ap8jnYTyQjJbO4RJjSFY+pI1brLZrPRa0lX/bEgWuvm2B6mXp8xfW
	PZWQaYYutRWCIt6nIrs8G2QN7qR5CxgZO60cVbIgTPwa3uDQWaAGQX36gWNxB+jstolckjZrNke
	ggMsyX/oUss30lSD4cHpowc6rCI5+H5CyXQNtHWHpXd990Cywz+HXWir1hT/vR3ge4CkRB5KNn7
	Kllm+MnzngG9iDzH1/QCjhatyYuEdgHpo0wQjtD4opJ7+XDzhkMiA8B3kbw2IKAUQR11pD1ISBM
	d4vkowXniA++nx3SmXonFvOQWDLOSwLkcHs4yu5Gvi0Sh0wOPySWT9nU54A50u56iq1HBoBSLeW
	CqKKC8nv3jgwKPeFBSmPkbXQ==
X-Received: by 2002:a17:903:4b03:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e7e73e7348mr18214525ad.31.1791455131199;
        Thu, 08 Oct 2026 03:25:31 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e7e73e7348mr18214035ad.31.1791455129590;
        Thu, 08 Oct 2026 03:25:29 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:29 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:13 +0530
Subject: [PATCH ath-next 17/17] wifi: ath12k: Add QCN6432 AHB support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-17-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX220l7cq5I9cN
 m1Tg/wYP0mpSMN3i8EIGwvECGSZ6e/b80HHVDRx/J+V37nCNbaoYl3UirkRVbgcULgor5BkfV4T
 v8i32RddkkOpahQsY+b01UewFugo5Fk=
X-Proofpoint-ORIG-GUID: dBG7oPbtdPaEe1Z8JKhwJQCzaVFEm4Rh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX9IrXvShLik0r
 oRy56qHoaE5HWAntxNo4Vsk8BsY6lLQhD6stEBR/zNLvdWTwNnq0d/bjo4/OAUo/JLU5TpdadHY
 +y4vyOiD07sy/z5+uPKUMu28bfRnuwJjTrqvPCabvcGWbM1uVzsiw4RcR3s+v5frOSq5BBZHgZv
 dBXUcNFxUfPC3xsElP6Q0CrFqajGgyKEkO9Y86uHBBINKZBq9khvTTNZv9o3Kh59Qpshs0a+Z4e
 KdsBw9IjctfGkeYJxp71tHuTOAhhbrWnJgXN5X+cGPQrNZJ4tncprqarx4o+aqcrvH4jCJvmyO5
 iapLmXc7J2+IGoI9Pc9WXX0MuhOY+tb8MPsqnG5G1uOqF55PnuyP9DreTu0vR0/M/LBlR7nbG74
 Te42gaV6Dwz9muL8aNQaGq70ApMOZKj4479CjSr5gdtv64PKwyKcujCM4Qr7G5JhUeoNi4GSTyR
 sUMOUSV6iId+GaZL8AA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76f9c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: dBG7oPbtdPaEe1Z8JKhwJQCzaVFEm4Rh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

Add AHB support for QCN6432 by adding its hardware descriptor and
device-tree compatible entry.

QCN6432 uses a hybrid bus where the CE memory is handled through the
PCI interface. Skip the CE remapping and cleanup in the AHB resource
initialization and deinitialization for hybrid bus devices.

Also add the UserPD mappings required for the QCN6432 devices.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       |  9 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 11 +++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3872aeeb9ba7..04974a6b423d 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1210,6 +1210,9 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 
 	ab->mem_len = resource_size(mem_res);
 
+	if (ab->hw_params->hybrid_bus_type)
+		return 0;
+
 	if (ab->hw_params->ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
 		/* CE register space is moved out of WCSS and the space is not
@@ -1266,10 +1269,14 @@ static void ath12k_ahb_resource_deinit(struct ath12k_base *ab)
 	if (ab->mem)
 		devm_iounmap(ab->dev, ab->mem);
 
+	ab->mem = NULL;
+
+	if (ab->hw_params->hybrid_bus_type)
+		return;
+
 	if (ab->mem_ce)
 		iounmap(ab->mem_ce);
 
-	ab->mem = NULL;
 	ab->mem_ce = NULL;
 
 	clk_disable_unprepare(ab_ahb->xo_clk);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 86359ed1eeb2..98e74bdf0112 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -18,6 +18,8 @@
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+	{ .io_start = 0x21e00000, .upd_id = ATH12K_AHB_USERPD_ID_1 },
+	{ .io_start = 0x19e00000, .upd_id = ATH12K_AHB_USERPD_ID_2 },
 };
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
@@ -33,6 +35,12 @@ static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 		.ops = &ath12k_ahb_hif_ops,
 		.supports_multipd = false,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.auth_enabled = true,
+		.ops = &ath12k_ahb_hif_ops_qcn6432,
+		.supports_multipd = true,
+	},
 };
 
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
@@ -42,6 +50,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5424-wifi",
 	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5424_HW10],
 	},
+	{ .compatible = "qcom,qcn6432-wifi",
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_QCN6432_HW10],
+	},
 	{ }
 };
 

-- 
2.34.1

