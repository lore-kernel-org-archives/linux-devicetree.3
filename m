Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738924;
	b=qjHIcQCb1TA/GKK7B3BDaqqn1Ul9nzPr7C3oUjG9lqPp0H7/20BphZ27Qwa+JRCdR78R
	 +cfLKtHKTfmVtB/dkFrGY7gcjP4wOh8uiT8OlZoav7OVpyCU615K8Lj6UnCLmpEtFXURH
	 QnlWfp60Qrs9sXv5bQVhR+/4ifsa7hIcqcCh27Iy1vkV5J8jwuCcl1MWBFpTSryfxkIED
	 RZEFYRoOg9I514019Y7QGt63evjqWpJjSvYSX9zA+0DPpk7s/IpW7B5QK+DRdOjeTj+q8
	 am9iUZLX306QMMLQYG7nOfF+63mqTuiAwRpyAXN0ehKovT7WWpCSB/0oqKkH8ddAiPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XuPURx6bW9+QWEqS3RiowGZSfSa1K0dkhyIZaCWE/BY=;
	b=S7z8XPa3rdDGLgBXx1z0NPv5HhTO6vUyO5Rax9oLzzHbrcaVF3Ek1sMfD8LLMgIq5lHO
	 fdE7sO7kKGjrOBtZyg0rOkxsgkjF8//6IZDzWrIpxZ+AZIRjqwW8MpkBMfS1vdHkTUUWK
	 /vMoFhtmEW5UI5j7L2pS/txSSJ0UytObkms++iIDTuoCmcG4M2ttX2JErazcTHnDPA+wx
	 kICjAA5oTg8Vlgf6IFGqh5P7uA8pcAhEk3og9ffJcyy3bLPjia6Bnu0K9Tkvdo/oTP9ZV
	 wBFGC1JDnmPoiRcN/rzOV7l7duSADYIWuy65hRUkBabOZST+vBYB/g8s6a9bdUH4jBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F79nS5h1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=by4uJG1Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D26607E971
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D26607E971
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F79nS5h1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=by4uJG1Q
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F3T11869045
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XuPURx6bW9+QWEqS3RiowGZSfSa1K0dkhyIZaCWE/BY=; b=F79nS5h1GgWSdlor
	fhKn3XpmtY4N6o2x5rDFpADYHgOI3tl6lDw+zJcUzZuNemLrvIvGwvNiBksJGk/W
	VlKlusVNK4pPDvYig2bPK+HP3g1ytqZ1yhanClsGrQ1jWD5zii9nYowQIIJ0PHhX
	Xnam0ytMcmcb5DAbGaIMLzmpePWKDF08OP7aELmIeaoeKh5r6BvElvsqOSYGVYUl
	DvxXu5ftCIxFWY6zdwPIHZ5FawWPvAwz444Ftlu4AQt09SZIiNhW/BpLdaomNj+X
	z4lF8NtUFZtwcJ2Eqf9BL5QLVL3ahiZjkWBVfkXC2CI3X/11lfT+WjD6cvVKnehY
	7VWC6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjad91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd8b299b0abso380803a12.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738922; x=1793343722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuPURx6bW9+QWEqS3RiowGZSfSa1K0dkhyIZaCWE/BY=;
        b=by4uJG1QUF7GDTh4TmRSgBGF0PHGKDvKA6bo3bzMXWSqo79jsK71SWdWcTbHaWXWLj
         o7SZG8sRYtm8m8l8nLageK6T5PG+sBevLEIj2csSJesu5Zdxab+JDMY6bvnC2yblORmk
         KH+6jebD3EGdt1SfuGwQVTaudcilo/HD+1Eb0k327L/NS34LhmXJxqDAFlm6rhAJ1Hd5
         chAZpnqYgIPtJ026Uhmtgu45AgKK1063pPoBVaCLQ3LwmODENwqDQQNY+xo0j+uFFCEY
         TinShz5+s6NxVAUE825bmv4THRnL3yiteK4JVpwJ/3MiuS8QQMgvUa504T0akIcN/w30
         V8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738922; x=1793343722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuPURx6bW9+QWEqS3RiowGZSfSa1K0dkhyIZaCWE/BY=;
        b=BPuT5x5RtOZ0axfpnwjFyBiMxrxtM45NGHQHBkjFPp9aFBgPxM5KX9abRWTRu+MaHk
         Gzd21grEgRyBBF8gehl1a/jdCc1yxn+hJKmMPDI4agQac25ZJ01eRryJa5+UWN3NbbRM
         3IlIHgYOJu06AtgVDzna6bhyeIVcOfgpfGfMDE8Y/Gf6WyK8aCv/f9AXrWcDSt4r6q7s
         hWOKfq+VsDAUaGMx6AYsIvlW9fNwGEGTfLF3ePWkgdBDvabWqVkXyvOUMJ7pfk0PnRb3
         MzdvRi3ZKy89PiH+tfjWJVKJs5BumcKLThxxgySDC8eohQk8khZwk7o8lxepQOoZ3YkE
         wAWA==
X-Forwarded-Encrypted: i=1; AKwUvBzNwu0QXHizpL5DQd8g05oqwr42SmPSsVB3sPvt+804yCejJNQ77Dm9y9m4bNVfWEjvOoLTG8n0yBdA@vger.kernel.org
X-Gm-Message-State: AFq9FYJKa4G7W/um+PMuwlN0Vrgy2z00fmuv/X4pogqUsM0tu75H67Es
	Vc3p00sOyAs73CADm488542t6+1EaNnLtsqKc/tViUgU/824YDhAdf3sYBxNGKpwHdaaXmTtlLJ
	pN4GS3hFUOALwXIDO3LvUcvoLTjtQLpInyJDOPH7zzC/f7DKLooqbbMrp9kpjjbhfzcvRZWWZ
X-Gm-Gg: AYBFou1hi2Gs83+8i/mwqQ0HiHe+oc57nDxxKVNnJ5eCQ/CWpXPcTPyT+mbySClW7As
	sGBMSPvEoZwdtPKatBRnKo67IpKH1fMbIE3hyE0wH+DjPfyVoI/xLC/9bMSdt0hZZW23y7BQlah
	aCM6JWoMYA8u7a66CqS8BnBcZUwvztKIkSGZ/6yMyQsDIcwGKkHJ86GfczxEMRgL2sCg6+YtKoN
	tsXDPouZTZ/wOD7JoKmP7NwXZeb961/oXbR/4l0CeaiYj4tL15Dq+ixpNfvoG/ej2d+NUJbCuSa
	tD3A5DZck7UAaoyPszdJ2FWUW3OXWBukqUZ4k8+J7lQTqO3rIMII8GBMaUmkyld3cwNZQ4QJDfw
	XmG6DhJlHP0Y9P87tdU1/L61eRTr0jpH4MbteE5oGWdvvC6UIVF9yFWYSnAj8sw51Ow2Xrr8wAk
	RZb7eAoOrNakM+xWAM246pDQ==
X-Received: by 2002:a05:6a21:f10a:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e37669a839mr886230637.42.1792738921691;
        Fri, 23 Oct 2026 00:02:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:f10a:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e37669a839mr886205637.42.1792738921094;
        Fri, 23 Oct 2026 00:02:01 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:00 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:14 +0530
Subject: [PATCH ath-next v3 11/17] wifi: ath12k: Add platform MSI support
 for CE
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
Message-Id: <20261023-mpp-bringup-v3-11-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: kQWl73RwmBm_4TiF8wS87gZHaWpKPQYN
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb066a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7KuP-4A2zxPpKnieA6EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX42hLFe14MFSo
 /21lb/iGHI1TB78a5PsBcueQqlaLzLi9ZJ6SJ9yuZMGDZyEouTNwMYLQWZ7Dz95iVHVPdDzqGmJ
 4U+abhZov7Liz6s0Y2ykxAxI5q4siKY=
X-Proofpoint-ORIG-GUID: kQWl73RwmBm_4TiF8wS87gZHaWpKPQYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8FV4oj9eUagC
 XLrR35LeWx+u9/Wuc+LzGtILLqbvZ9/OG2qUseZPgzq/6i4rnCjSJzUPatvsJMpHCaMvsPxePvI
 6wEzurGVDShH9ZvE7BCV5MtAIhyipRbqf4X3GuvhZsxRgpFe5K/fJDG7NvhSWYhuxAdOEXIWQCG
 cEAk+tYWlMgBMr7kDfH9BzdyA3gqjXUPqAKcMuZmZpdxSKbrO83/NHI5UBXUDb26p4EbBaYTHyh
 HpO9/8GU5iqFJl1BRUfFOpWKUsVpg7FyWIWngIjI9pnYtQLIb2gh+eIUjoKo7ZX5wh8rT/V+G2Q
 uZRBDHv+AchvytaLAtXDon+n3TFcAcM4hewcNgECS3P0IPDJRDH33Z08GNBs2IK+fA9qOXGP2bi
 KfBJs/SqJrHBNGHzgPbB7l2Ucv5HeAOjgu5IFlwcXJcaiQuRRYPk8sw+qeLjhKaQ5bXvVulOnkF
 qJ6b2krZhWnXkpKyibg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

QCN6432 is attached through AHB but provides Copy Engine (CE) interrupts
using platform MSI vectors instead of dedicated platform IRQ lines. The
existing ath12k AHB interrupt setup only requests named CE IRQs from
the platform and therefore cannot configure CE interrupts on QCN6432.

Add support for configuring CE interrupts through platform MSI on
hybrid AHB devices. Introduce an IPCI MSI configuration for these
platforms, allocate MSI vectors from the platform MSI domain, and
register CE interrupt handlers using the allocated vectors.

Ensure that configured interrupts are properly freed if device probe
fails after interrupt configuration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c  |  18 ++--
 drivers/net/wireless/ath/ath12k/ce.h   |   4 +
 drivers/net/wireless/ath/ath12k/core.h |   7 ++
 drivers/net/wireless/ath/ath12k/pci.c  |   9 ++
 drivers/net/wireless/ath/ath12k/pcic.c | 155 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h |   2 +
 6 files changed, 190 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index bcb49ff07aa8..b9ec14e86def 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -208,8 +208,13 @@ static void ath12k_ahb_free_napi(struct ath12k_base *ab, int num_ext_irq_grp)
 		ath12k_ahb_free_napi_for_group(&ab->ext_irq_grp[i]);
 }
 
-static void ath12k_ahb_free_ext_napi(struct ath12k_base *ab)
+static void ath12k_ahb_free_config_irq(struct ath12k_base *ab)
 {
+	if (ab->hw_params->hybrid_bus_type) {
+		ath12k_pcic_free_irq(ab);
+		return;
+	}
+
 	ath12k_ahb_free_napi(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 }
 
@@ -719,6 +724,9 @@ static int ath12k_ahb_config_irq(struct ath12k_base *ab)
 	int irq, irq_idx, i;
 	int ret;
 
+	if (ab->hw_params->hybrid_bus_type)
+		return ath12k_pcic_config_irq(ab);
+
 	/* Configure CE irqs */
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		struct ath12k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
@@ -1405,7 +1413,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	ret = ab_ahb->device_family_ops->arch_init(ab);
 	if (ret) {
 		ath12k_err(ab, "AHB arch_init failed %d\n", ret);
-		goto err_free_ext_napi;
+		goto err_free_irq;
 	}
 
 	ret = ath12k_core_init(ab);
@@ -1419,8 +1427,8 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 err_deinit_arch:
 	ab_ahb->device_family_ops->arch_deinit(ab);
 
-err_free_ext_napi:
-	ath12k_ahb_free_ext_napi(ab);
+err_free_irq:
+	ath12k_ahb_free_config_irq(ab);
 
 err_rproc_deconfigure:
 	mutex_lock(&ath12k_rproc_info_lock);
@@ -1464,7 +1472,7 @@ static void ath12k_ahb_free_resources(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
-	ath12k_ahb_free_ext_napi(ab);
+	ath12k_ahb_free_config_irq(ab);
 	ath12k_hal_srng_deinit(ab);
 	ath12k_ce_free_pipes(ab);
 	ath12k_ahb_resource_deinit(ab);
diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index cd913a885470..c15ec0c32374 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -11,6 +11,9 @@
 
 #define ATH12K_MSI_IRQ_CE0_OFFSET	3
 
+/* IRQ name buffer size for CE interrupts */
+#define ATH12K_CE_IRQ_NAME_LEN		32
+
 /* Byte swap data words */
 #define CE_ATTR_BYTE_SWAP_DATA 2
 
@@ -172,6 +175,7 @@ struct ath12k_ce_pipe {
 	struct ath12k_ce_ring *dest_ring;
 	struct ath12k_ce_ring *status_ring;
 	u64 timestamp;
+	char irq_name[ATH12K_CE_IRQ_NAME_LEN];
 };
 
 struct ath12k_ce {
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 293c7561b27a..21332aeb0c22 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -164,6 +164,7 @@ enum ath12k_hw_rev {
 #define ATH12K_IRQ_NUM_MAX 57
 #define ATH12K_EXT_IRQ_NUM_MAX	16
 #define ATH12K_MAX_TCL_RING_NUM	3
+#define ATH12K_MAX_MSI_VECTOR	32
 
 struct ath12k_ext_irq_grp {
 	struct ath12k_base *ab;
@@ -189,6 +190,12 @@ enum ath12k_smbios_cc_type {
 
 enum ath12k_msi_supported_hw {
 	ATH12K_MSI_CONFIG_PCI,
+
+	/*
+	 * IPCI (Integrated PCI) configuration is used by AHB devices that
+	 * support platform MSI.
+	 */
+	ATH12K_MSI_CONFIG_IPCI,
 };
 
 struct ath12k_smbios_bdf {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index fe0939ca890c..a26fdb3c0ad2 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -51,6 +51,15 @@ const struct ath12k_msi_config ath12k_msi_config[] = {
 			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
 		},
 	},
+	{
+		.total_vectors = 32,
+		.total_users = 3,
+		.users = (const struct ath12k_msi_user[]) {
+			{ .name = "QDSS", .num_vectors = 1, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 1 },
+			{ .name = "DP", .num_vectors = 15, .base_vector = 6 },
+		},
+	},
 };
 EXPORT_SYMBOL(ath12k_msi_config);
 
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index e3c8476af459..fea284c3707b 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/module.h>
+#include <linux/msi.h>
 #include "ahb.h"
 #include "core.h"
 #include "debug.h"
@@ -154,3 +155,157 @@ void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
 	window_start = ath12k_pcic_get_window_start(ab, offset);
 	writel_relaxed(value, ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
 }
+
+static void ath12k_pcic_ce_irq_disable(struct ath12k_base *ab, u16 ce_id)
+{
+	u32 irq_idx;
+
+	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
+	disable_irq_nosync(ab->irq_num[irq_idx]);
+}
+
+static irqreturn_t ath12k_pcic_ce_interrupt_handler(int irq, void *arg)
+{
+	struct ath12k_ce_pipe *ce_pipe = arg;
+	struct ath12k_base *ab = ce_pipe->ab;
+
+	if (!test_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return IRQ_HANDLED;
+
+	/* last interrupt received for this CE */
+	ce_pipe->timestamp = jiffies;
+
+	ath12k_pcic_ce_irq_disable(ab, ce_pipe->pipe_num);
+	queue_work(system_bh_wq, &ce_pipe->intr_wq);
+
+	return IRQ_HANDLED;
+}
+
+static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
+				     struct msi_desc **msi_desc, int num_msi)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	int irq_idx, ret, i, vec_idx = 0;
+	u8 userpd_id = ab_ahb->userpd_id;
+	struct ath12k_ce_pipe *ce_pipe;
+	bool msi_info_captured = false;
+	struct msi_desc *desc;
+
+	for (i = 0; i < ab->hw_params->ce_count; i++) {
+		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
+			continue;
+
+		ce_pipe = &ab->ce.ce_pipe[i];
+		desc = msi_desc[vec_idx];
+		INIT_WORK(&ce_pipe->intr_wq, ath12k_pci_ce_workqueue);
+		irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + i;
+
+		scnprintf(ce_pipe->irq_name, sizeof(ce_pipe->irq_name),
+			  "pcic%u_wlan_ce_%u", userpd_id, i);
+		ret = request_irq(desc->irq, ath12k_pcic_ce_interrupt_handler,
+				  IRQF_SHARED, ce_pipe->irq_name, ce_pipe);
+		if (ret) {
+			ath12k_warn(ab, "failed to request irq %d: %d\n", irq_idx, ret);
+			ath12k_pci_free_ce_irq(ab, i);
+			return ret;
+		}
+
+		ab->irq_num[irq_idx] = desc->irq;
+		ath12k_pcic_ce_irq_disable(ab, i);
+		vec_idx = (vec_idx + 1) % num_msi;
+
+		if (!msi_info_captured) {
+			ab->msi.addr_lo = desc->msg.address_lo;
+			ab->msi.addr_hi = desc->msg.address_hi;
+			msi_info_captured = true;
+		}
+	}
+
+	return 0;
+}
+
+static void ath12k_msi_msg_handler(struct msi_desc *desc, struct msi_msg *msg)
+{
+	desc->msg.address_lo = msg->address_lo;
+	desc->msg.address_hi = msg->address_hi;
+	desc->msg.data = msg->data;
+}
+
+static int ath12k_pcic_request_msi_irqs(struct ath12k_base *ab, int base_vector,
+					int num_vectors,
+					int (*irq_config)(struct ath12k_base *ab,
+							  struct msi_desc **msi_desc,
+							  int num_msi))
+{
+	struct msi_desc *msi_vecs[ATH12K_MAX_MSI_VECTOR];
+	struct platform_device *pdev = ab->pdev;
+	struct msi_desc *msi_desc;
+	int num_msi = 0, ret;
+
+	guard(msi_descs_lock)(&pdev->dev);
+
+	msi_for_each_desc(msi_desc, &pdev->dev, MSI_DESC_ALL) {
+		if (msi_desc->msi_index < base_vector ||
+		    msi_desc->msi_index >= (num_vectors + base_vector))
+			continue;
+
+		if (num_msi >= ATH12K_MAX_MSI_VECTOR)
+			return -EOVERFLOW;
+
+		msi_vecs[num_msi++] = msi_desc;
+	}
+
+	if (!num_msi)
+		return -EINVAL;
+
+	ret = irq_config(ab, msi_vecs, num_msi);
+	if (ret) {
+		ath12k_warn(ab, "failed to config irq %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int ath12k_pcic_config_irq(struct ath12k_base *ab)
+{
+	int user_base_data, base_vector, num_vectors;
+	struct platform_device *pdev = ab->pdev;
+	int ret;
+
+	ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_IPCI];
+
+	ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
+						      ab->msi.config->total_vectors,
+						      ath12k_msi_msg_handler);
+	if (ret)
+		return ret;
+
+	ret = ath12k_pci_get_user_msi_assignment(ab, "CE", &num_vectors,
+						 &user_base_data,
+						 &base_vector);
+	if (ret)
+		goto free_msi;
+
+	ret = ath12k_pcic_request_msi_irqs(ab, base_vector, num_vectors,
+					   ath12k_pcic_ce_irq_config);
+	if (ret) {
+		ath12k_err(ab, "failed to config CE irq\n");
+		goto free_msi;
+	}
+
+	set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
+	return 0;
+
+free_msi:
+	platform_device_msi_free_irqs_all(&pdev->dev);
+	return ret;
+}
+
+void ath12k_pcic_free_irq(struct ath12k_base *ab)
+{
+	struct platform_device *pdev = ab->pdev;
+
+	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
+	platform_device_msi_free_irqs_all(&pdev->dev);
+}
diff --git a/drivers/net/wireless/ath/ath12k/pcic.h b/drivers/net/wireless/ath/ath12k/pcic.h
index f77091927039..7b6c55043618 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.h
+++ b/drivers/net/wireless/ath/ath12k/pcic.h
@@ -19,4 +19,6 @@ int ath12k_pcic_cmem_write32(struct ath12k_base *ab, u32 addr,
 			     u32 value);
 int ath12k_pcic_cmem_read32(struct ath12k_base *ab, u32 addr, u32 *value);
 void ath12k_pcic_config_static_window(struct ath12k_base *ab);
+int ath12k_pcic_config_irq(struct ath12k_base *ab);
+void ath12k_pcic_free_irq(struct ath12k_base *ab);
 #endif /* _ATH12K_PCIC_H */

-- 
2.34.1

