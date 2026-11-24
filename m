Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538626;
	b=FI7mkPS4sFgr/D4O2X+VrkVUMuT6c/Zpanr1vVNPiY4WKJywGLabB7BjViBYAq6AZXeJ
	 qhD0TMOmqENYjuB98akrd1T8l91jfJ3TmR+HRRNk6fSIZyyDAiQi3wkyxeX6tIG3Sf6SP
	 zIvvxe5v4Mg3hetQSTZpCJMVyDYPnDYa1gYM/o0eeYmE9S0DlfwmDoqYBS6eGfKf7Rwqv
	 Pc4WvvFnJDUVJgghwRNCBLg23Tn7L0e415jjcWShRdgdP1o1piZUu93rJzsk1JlZn0RGM
	 7X4EVM1NSQh0s4Ur5AE/DzKkB7W3agBxO/OmC93HPYiyqLPLQ0B5CtGtcAeCSF7HBoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=;
	b=Y7VZ5oTQrZ3zBC2KJtN2cZdybjsdNV/MOaoL8DiZRG20nx7IAo7Y+QGgaLkcKHnrK6ro
	 xOB0RBFZ42daFEaiuwgeRTWYaDzP+r+55VA2m3QU2PQkBPju/1NnHkzEdLzNik3wdnhfI
	 pjv+2YMamQ+K/ZqAD89wCa3aS6aMqFPPedUTu6SASEFolBMIPKos/u92lIbJ6dq7TqY+A
	 eMF7JYoluxkYLSVenBS5opxspZM7047XCobkOylt8FvFfW2CyyRlNohFWhQJJAvtmyKCK
	 IwQ7ENW4C7olpSTBw1RgfCdrIfXvNaNtq6NnMfGOSQjTiRv/3BDuBas+Jhe7lVRfLJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbjvrhbH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtlE9xnk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB853606A33C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB853606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbjvrhbH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtlE9xnk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL2Lk1696829
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=; b=XbjvrhbHRhWqbiUE
	MSDZgkiSKt3z7maHJm7TRdqXnk2vekOnBC3JOX3AaZYScxUnUjSQgOtI5i7hLKS6
	6BiU7C55Kpye+Ih97e1pdPSbOSZ7NlPLG7rGNIhgWh6iXIScHBBZsrdWcadzGjXc
	VWTSifo4mZhcTfSXHCGOt41IVLkv2YTOeuTp4/U/JmbOrunSYyil4r73PJN6FXPP
	VBBK0YSM5u8OPoVKCMsrvalV3+DrD/M0U8O8rfv5NNDmoiEEGTVDKu9+J02cz07y
	lmRhbBn7zApKNJ9ov9+U9jGLHr4oB99oHkDM9R2i8bgAJg/JJghVJs68q1RE7GNY
	nf6Pmg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8010n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso8285852eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538624; x=1796143424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=;
        b=QtlE9xnko5N0dEkLtiTnocOqkrl08RHRYSeFs1MLaQ0vgP9TSyK/zll5Sa/a1SKrfC
         AyP3fy8be7HG9zxlw77yp8jyoxf0KL0nS+Rxhz0vttlqcpP8dfvGqTQmlnNXD3P7Dmph
         Ns/SSdIH51kfuB08Wyxddslb3r7mp3N7PSwB5CUa+W2t4yQKMF0TuCW7XIIY0yU/iims
         s7gPUkoCAdBGHoFdziKwxhA8k7ZsC/B5Ked2lLRnxWp+/Vy5j8V0Pcwor2Xa7d3o6KRi
         HAP6tQ3RQOrDZoRgUTBfvoCiC6HEHZVQ/6Bgy3aQlup/l7t23e3qfOdq2fgrL8iWCuqK
         QMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538624; x=1796143424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=;
        b=zHgwLig0PgtUbgKXY7pUC6jBSjBRZ/ffd+RTtRDV8ZvUQsScf94xLYHdoiEqroNGtR
         gZVMGehTZCXEAs3F5fWhAI6Nu6qe35kwuoeDDl/udbXsoLJ5efcm3gAcJM8Pb0elNrdg
         uoWVmEsO+hxyw/MVRTk7rIZS/EBsX8/76n2+4OD4ZGOV1VZr3RKb/jEJhAa0kxHOd9im
         VcgqMPEA7+VK+DDstfOKhJZODmRtIcDPN74Ws6qwstavVlj0HsQu/uSH5F0RRgd9JNDL
         u6uRr7M0wGCJPRkbC2TUAlUxRsypqpzhCz629VM4emsmAW9JqoXH1ypdVptY7pVRLUGH
         9j/g==
X-Forwarded-Encrypted: i=1; AL+hErG1fxyhdgyw/QGpbP7hgEk1nRPMIA+EqrhEER6lFQKH1FB118lrOk4txDxercNcFMjGuplShCzAK3CX@vger.kernel.org
X-Gm-Message-State: APuU4Z9rl4UT3Y0k/bUWtp684yDomNXNrOj+5wdUpHGNlV5O8I1kQckV
	1u7K2uri5hpACbw9UXU9cgG7DzAdOKo8Vbk9RZeH2PXCAoc9vOrQEYfcFVA0LrMuywYnUe2rsO0
	D2ghXLZ2fmdwR5IIB7OGD4cgt48kEKBSVw5OAG1q+VaDePfG8ngmWaQjsBdbPv6a2AfsxbERd
X-Gm-Gg: AZFdTZcbHh+DSpiK5BzRdHOMMnTK9HSkakQDVNKHplBnsu93i8Ds44YhVNi93TtPcU9
	FeQ8gcfAx/5x60PLBwn4vXabIJxDjtp+n1XajAG4MTLzThukC1/D12RQyoMKG+9+XpNQuL+Y6Xy
	j+QNcHSMASlXl/vLKR3TAXWlpL2JRGE7XnSSoK3iWTtXqS4+gHpRR3DEiCNFE/VKnRzZav1KWZC
	pWU5kRuIopRaTkEVbYOqI27G3Yai91fmYbqSi87Nm7UHiMZQgD9PtXwcT5aSdXs4oYDgFai3mUq
	8XdYL6WpbeTGrMVQi8wKkmsBO/P0CHOXOhV8dehJAI0Sgf7m2Anqt2tx50HlpPg7oBXFx0HO3Xy
	/fPt9mAOcQyfy78PxRd4WY42TynQRek92oTDa4pCQTVEBIIFBDDCZb5HgaUNPs00PuBrdpmspsl
	5LAduoM3MeUed8xAdTvGfbM48S98n2HIRqltA17mA8vUJVlWWDXorCUAQ0CT9pKasJYkKeOzgPB
	/Y=
X-Received: by 2002:a05:7300:ce8f:b0:369:f035:661 with SMTP id 5a478bee46e88-38570450918mr12922047eec.15.1795538623490;
        Tue, 24 Nov 2026 08:43:43 -0800 (PST)
X-Received: by 2002:a05:7300:ce8f:b0:369:f035:661 with SMTP id 5a478bee46e88-38570450918mr12922010eec.15.1795538622611;
        Tue, 24 Nov 2026 08:43:42 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:42 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:27 +0530
Subject: [PATCH ath-next v4 01/14] wifi: ath12k: refactor PCI window
 selection to per-device layout
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-1-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX+ceE9zWoCwzu
 c0Rza/AfI0uAqHb2kOlnwTBi+SO44q9BG7R2KVutLZZKpBWUzpeAkL5rZgDx2nEY6As5ntiF7Eu
 5Hfh1Xmx9DcLaO0GHyeGTaT6TrCT+pfJbPyMDVOMpkOSmvhijmDiJHAmHSGJvDCKYyXitOyM3hq
 AUY0tUBHfQIxFhXQQWP43U0eE+R7FuJvwgsbzVxxGlDN/bIkMUIZnUPpzaYrnFqbxD/Hh8kTRpp
 PSwMYWcc0eH2IfgCVKyYKzqeAiTM6x4X/K+d2+nnXjTKGsqqWdJ3dFGdHc5/v2r8/hP5mKhw2Xm
 IGqtVgoSmPW9x/9TLxhDlks83/vEDiJUeMTMJFgQyegEWzOknslBkHHzFGAhTeKtentT4mFlZgN
 Alr6SyhLYoiJ6GCUqip67PSjICtwYt8OA6Rk36flrBrTd1wwGQve0DKTnGjxAYQXPJ76diPBWpe
 WrGIehFEhieXDNiZQEQ==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05bec0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MC8DN0fT8aYryp_U8K8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 6FnABHcVYMhDwmIgwM6OSebjIwlXf2qg
X-Proofpoint-GUID: 6FnABHcVYMhDwmIgwM6OSebjIwlXf2qg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX+an2NPC/OsN/
 qWNeQKEtDVEEH1HIUFVu6hROt73M0rx+uB7q30yYNWUGQ1W8/aBpuAX/6tmxpE3i6h2IQ7ygVot
 h/uDohRX9df1D3pGB71d0mJ/h7dQzGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

ath12k currently assumes a fixed PCI/AHB window layout with value bits
[24:19], CE shift 6, and UMAC shift 12. Those values match Wi-Fi 7, but
QCN9575 uses a different window field and shift layout. With fixed
values, ath12k programs an incorrect window and breaks register access.

Move window layout parameters into struct ath12k_pci_reg_base and
struct ath12k_ahb_reg_base, and use them in ath12k_pci_select_window(),
ath12k_pci_select_static_window(), ath12k_pcic_config_static_window(),
and ath12k_pcic_select_static_window(). Set the Wi-Fi 7 values in
ath12k_wifi7_reg_base and ath12k_wifi7_ahb_reg_base so each device
family provides its own window mapping for both the PCI and AHB bus
paths. Move the window register address into struct ath12k_ahb as
window_reg_addr, mirroring the existing per-device window_reg_addr in
struct ath12k_pci. Replace the open-coded u32_get_bits() calls that
assumed the fixed WINDOW_VALUE_MASK constant with field_get() and
field_prep() using the per-device masks. Remove the now-unused
WINDOW_VALUE_MASK and WINDOW_STATIC_MASK constants from the common
pci.h and move the Wi-Fi 7 window constants into wifi7/pci.h.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.h       |  6 ++++++
 drivers/net/wireless/ath/ath12k/pci.c       | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/pci.h       |  8 ++++----
 drivers/net/wireless/ath/ath12k/pcic.c      | 27 +++++++++++++++++----------
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.h |  8 ++++++++
 7 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 373dc3b92728..712fddb03f6a 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -14,6 +14,10 @@
 struct ath12k_ahb_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 #define ATH12K_AHB_RECOVERY_TIMEOUT (3 * HZ)
@@ -111,6 +115,8 @@ struct ath12k_ahb {
 	bool supports_multipd;
 	u32 static_window_reg;
 	const struct ath12k_ahb_reg_base *reg_base;
+
+	u32 window_reg_addr;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bb14a95aec9..6617440954b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -125,14 +125,15 @@ static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 {
 	struct ath12k_base *ab = ab_pci->ab;
-
-	u32 window = u32_get_bits(offset, WINDOW_VALUE_MASK);
 	u32 static_window;
+	u32 window;
 
 	lockdep_assert_held(&ab_pci->window_lock);
 
+	window = field_get(ab_pci->reg_base->window_value_mask, offset);
+
 	/* Preserve the static window configuration and reset only dynamic window */
-	static_window = ab_pci->register_window & WINDOW_STATIC_MASK;
+	static_window = ab_pci->register_window & ab_pci->reg_base->window_static_mask;
 	window |= static_window;
 
 	if (window != ab_pci->register_window) {
@@ -145,13 +146,15 @@ static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 
 static void ath12k_pci_select_static_window(struct ath12k_pci *ab_pci)
 {
+	const struct ath12k_pci_reg_base *reg_base = ab_pci->reg_base;
 	u32 umac_window;
 	u32 ce_window;
 	u32 window;
 
-	umac_window = u32_get_bits(ab_pci->reg_base->umac_base, WINDOW_VALUE_MASK);
-	ce_window = u32_get_bits(ab_pci->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
-	window = (umac_window << 12) | (ce_window << 6);
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
 
 	spin_lock_bh(&ab_pci->window_lock);
 	ab_pci->register_window = window;
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 55cc875f9ce0..62b72558c0e2 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -77,12 +77,8 @@
 #define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(3, 0)
 
 #define WINDOW_ENABLE_BIT		0x40000000
-#define WINDOW_REG_ADDRESS		0x310c
-#define WINDOW_REG_ADDRESS_QCC2072	0x3278
-#define WINDOW_VALUE_MASK		GENMASK(24, 19)
 #define WINDOW_START			0x80000
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
-#define WINDOW_STATIC_MASK		GENMASK(31, 6)
 
 struct ath12k_msi_user {
 	const char *name;
@@ -118,6 +114,10 @@ struct ath12k_pci_device_family_ops {
 struct ath12k_pci_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 struct ath12k_pci {
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index b6d306fd3b99..de71cd0930cd 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -15,13 +15,19 @@
 void ath12k_pcic_config_static_window(struct ath12k_base *ab)
 {
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
-	u32 umac_window = u32_get_bits(ab_ahb->reg_base->umac_base, WINDOW_VALUE_MASK);
-	u32 ce_window = u32_get_bits(ab_ahb->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
+	const struct ath12k_ahb_reg_base *reg_base;
+	u32 umac_window;
+	u32 ce_window;
 	u32 window;
 
-	window = (umac_window << 12) | (ce_window << 6);
-	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + WINDOW_REG_ADDRESS);
-	ab_ahb->static_window_reg = readl_relaxed(ab->mem + WINDOW_REG_ADDRESS);
+	reg_base = ab_ahb->reg_base;
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
+
+	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + ab_ahb->window_reg_addr);
+	ab_ahb->static_window_reg = readl_relaxed(ab->mem + ab_ahb->window_reg_addr);
 }
 
 static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
@@ -32,20 +38,21 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
 	const int max_retries = 10;
 	int i;
 
-	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
+	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
 
-	/* Update window bits [5:0], preserving other bits */
-	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
+	/* Update the dynamic window bits, preserving the static window configuration */
+	new_window = (ab_ahb->static_window_reg & ab_ahb->reg_base->window_static_mask) |
+		      window_bits;
 
 	if (new_window == ab_ahb->static_window_reg)
 		return 0;
 
 	reg_value = WINDOW_ENABLE_BIT | new_window;
-	writel_relaxed(reg_value, ab->mem + WINDOW_REG_ADDRESS);
+	writel_relaxed(reg_value, ab->mem + ab_ahb->window_reg_addr);
 
 	/* Wait for the write to take effect */
 	for (i = 0; i < max_retries; i++) {
-		if (readl_relaxed(ab->mem + WINDOW_REG_ADDRESS) == reg_value) {
+		if (readl_relaxed(ab->mem + ab_ahb->window_reg_addr) == reg_value) {
 			ab_ahb->static_window_reg = reg_value;
 			return 0;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index ae5380eb6f8f..8552f403864e 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -15,6 +15,7 @@
 #include "dp.h"
 #include "core.h"
 #include "hal.h"
+#include "pci.h"
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
@@ -91,6 +92,7 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EOPNOTSUPP;
 
+	ab_ahb->window_reg_addr = WINDOW_REG_ADDRESS;
 	ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
@@ -112,6 +114,10 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 static const struct ath12k_ahb_reg_base ath12k_wifi7_ahb_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_ahb_driver ath12k_wifi7_ahb_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index 783c5d020f07..6dc674e045be 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -167,6 +167,10 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 static const struct ath12k_pci_reg_base ath12k_wifi7_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_pci_driver ath12k_wifi7_pci_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.h b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
index 662a8bab0ce7..1017975b4c9f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
@@ -6,6 +6,14 @@
 #ifndef ATH12K_PCI_WIFI7_H
 #define ATH12K_PCI_WIFI7_H
 
+#define WINDOW_REG_ADDRESS		0x310c
+#define WINDOW_REG_ADDRESS_QCC2072	0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(24, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 6)
+#define CE_WINDOW_MASK			GENMASK(11, 6)
+#define UMAC_WINDOW_MASK		GENMASK(17, 12)
+
 int ath12k_wifi7_pci_init(void);
 void ath12k_wifi7_pci_exit(void);
 

-- 
2.34.1

