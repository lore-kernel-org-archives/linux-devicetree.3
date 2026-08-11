Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348E42FCB5
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455446; cv=none; b=SWVoa0HS0+DfHpAFcV7LXqVrtVHlseoWLSoAVgYPrSe6vgDuRknnurfqbzzw8P+3tPx4bf7SWvXMHAhr+xhrw5lBD30Sr1vMn2iMNbvTQ9fcAWIqDpFXRXAtx9umBm5H4lWzf1OMKpltRV8dAQUFkF+ToNAtw9pwbKg/g2cypHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455446; c=relaxed/simple;
	bh=xEGu9ankifD+51CN5DkNsTxhHVikQCAqtYX1v27lJqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1kv4R4th1hRk6wyj0Ki26lyCxHFf0ZWCHYjwDLuv1lTYXErSVsrkvmUgXrmE4jXrgwnetTuJeu+2yj3Yxv17QvqB8D+OqbRdZOne5O7L6F9D1C3B5LbWR3kqOwbusMcom6VXZgqYprygtb+WWzkzRa1piLKOAvPQpeZp8KiF6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXs+g/RR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjN0oFwN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXs+g/RR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjN0oFwN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWaRJ809587
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sh9i3yxZfV+elO+BP0wn88wpFBVoPnDZd+GVxPIDGSM=; b=PXs+g/RRULrKwZZG
	d7ZgXDcF0l3iHt+d7EDni4L/e/2JpumneCwNj0TMJBdWWEi5BN/oKMVyPGrXrE9X
	a5tp/fP3+ZEG7AN5cq0zkwU9lgR4bH4SnC+9NY9UR8n0twe1O1cffPdLL4EqyRWA
	3boEBTxgLnUcUVMJYChdnftmVtWOErOyrMRVtMliAhfdYB9fACjJ+mAFQx5Qvg4G
	ydnmRmCwuV5m9KNd/b+Z7fSrSZ0s8AH9iyNS6BEAqBJqsrA93ENF9+JLeYuQReBD
	WcCCOh+KZjmRmbWu468XaB4Xxtzf36cZDSAHSRpo0Aw9WaPU0Eve7MKTGxgAIDdl
	wkCuZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049dg5bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfe48ca1efso37153815ad.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455428; x=1787060228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sh9i3yxZfV+elO+BP0wn88wpFBVoPnDZd+GVxPIDGSM=;
        b=YjN0oFwNZ80cWPHz1l+8vEmdTmYqDjjrzCM3vx2L6jphwLO1Sna4SI5h6NZPEfDFrQ
         n5j4+xJ/UVB5lv4r210/b2pvLr4dI5AV+pXsKsbDHW+uLVBbDtxQRzxGMkAGH59VCwXv
         2T5g9x9UGyjl/gy4Ct9lePoKZXGQ4kESFFNai0yJlfzg9vi4v/lFCvqu4fOiHTIb94H2
         WFt+2kCaPyyzgKL+iA3GSZQ7eCat6S/KpKTw1JBX40C0WS9vFWr1S2FlR4YdV2pj+DCe
         WilvgbIYgEUlkZjiSqNZ0u7a0YaI117+uF7CCo942kL1ycArhGNVnasVgBtpUzngF0bm
         anbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455428; x=1787060228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh9i3yxZfV+elO+BP0wn88wpFBVoPnDZd+GVxPIDGSM=;
        b=bDte439Ne955EYVIdAE968s+4osYFyYdTbNOcEEtW8csFqBpahhrWFOmU8glpRHDJB
         E3lvkRAoL6brkBSytG5/QVzEU5NFtVuNb1kxxbN/OBti4Ulft0+lzl73PoBey9fo9yc1
         BwQYX9ekbEoje8bZmO0GeaDpDgFvF267z21+HD5hFYEPAES+NJOd/MCXYzM+okNnd6rW
         d5p1lbfBaw2UxU9PqGdnTMiYB/Gl1SegJEIvviZfePJz6jQ03golpjaC+FWAjtFw4W3F
         zXhJuuBO8hFLp+GDl+WIrW7IgAdkvOBODq/L2PhCxtrfxtHSYSPKoHKIfYsi/Oyri+TP
         coMg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1r2+WTytHDt5rNQ1+joPEbl/5FXGpch58j20auGoO8c7qEB2leZAtQHoDI/gsSS/mCN5e8WGq2KhI@vger.kernel.org
X-Gm-Message-State: AOJu0YzwgSWPOm5HW0yIhoiyztw/DKTIg0SL55Bw5t/p2RuMoq3yXisM
	GPvE9IDytmDk9vnLYzhy/2Odv8AF6zR+X869fnu9Yycw2jYuFSYWisMPuy8jYno5xcw9ctAlpNz
	iZgN/BExexz763I1Ww6a2Hn/SW0PXiSZnjoA3OoGseqHmqAjsq9UoQPuGqHNgP0dw
X-Gm-Gg: AR+sD11TTAy+iFoaNbqmk9eR3nOTYBDnTuaD+ZDsooV091SEU98GjyFrySrFCq3wnxt
	UOC3zb5irkt4iyLr0es/JCahofPeIem8Mdxu6A77p+A44IhE8Qsd26A4hpQ6OMaRIVpv75+7NGt
	hPKGo6GBaXSJZakVZmPOzxDBYiQ0YCw/P3WDMCyQGqNZLKj824y9smI4tQVlu54zF761CCVz71F
	0hWp2DL2kmJfwjMTHqS+x+imKJKIzy+GVz59vWdJgl2Igb6pAVbxajKHWjuT794zDzFjrcmNZSq
	bj1DhNRA94P9C7D72GLTYXAYDPzFPGnXmJIIpV+L4Yo6aUWODaYS7BAFLQtZH+Iqhc25QvhnNcL
	pkoUAR5wB3tS/ncnTIzLwSs7gZo365gxDdyvqzSH3Bav8mWvRAEwMuslG
X-Received: by 2002:a17:902:d488:b0:2d1:1a18:4d0a with SMTP id d9443c01a7336-2d3177a2163mr36651205ad.9.1786455427489;
        Tue, 11 Aug 2026 06:37:07 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2d1:1a18:4d0a with SMTP id d9443c01a7336-2d3177a2163mr36649955ad.9.1786455426911;
        Tue, 11 Aug 2026 06:37:06 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:06 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:37 +0800
Subject: [PATCH RFC 08/15] arm_mpam: Fix ris_idx type to prevent range
 check bypass on truncation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455324; l=2590;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=xEGu9ankifD+51CN5DkNsTxhHVikQCAqtYX1v27lJqY=;
 b=nLawrdlW8eg7uzFaMNdvW5wUFGrxG1csc7DJAkmCcYWAALdt1xSxw8ndGkGreUQ6JwQGXjnFV
 FMqi1xwnc4hCwd91Lul5ZOg48Ruv5gC/Vsbf+ko/OYehp0AqtDClXhP
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX8U1NU9+ZzNIP
 McuK6LsG/pCXJYCAcH1+jlWRS13keTFkJQLrqY6Xl0FZ5mcBurXH7u5QNS25tBvMlhkygeDS9bz
 D8SiBfEqLMkYG2WrlNq74nDOAzIwt/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX7zo3fXH7DiDw
 YmzpqbRy5vwCgUv1Xaa0+IWFuzcLfXRUBclnyQTXCthvcKoFckmn0NT5XT9r8nvgIXhT9wVEMEN
 eYVZA+GAudnLqs6g5fImOiPx/yLqST4T9hET0jyDY0xCsS8o+seJ/btwWo490p6gmzJXI8iI+4L
 2UgoOmLvM3Z6oLahYNAcKiNfKpBhoQVe8Exc33GBeL5IS54nvMW8Tk/9H/7UZREbxCnJr8eNC6b
 f1DoA5Xg3zpXYDvKyxLdPN/FJbWDqtdNc9SCcbJn9y50HjbOF1FJiPiwmKByY2iHzmbEV425tTh
 rwBs9LsBi5KeZtx03baY0neL+Z9Nr8qqCZo3gxt4nr2zx699qyK1j8e1011ciirNA44c2SJUYbS
 bdLXR5yn+VvuDxqz4u7dmxgE/hVucQ+1t4f9dlvGfBD3a0iNoMw8tfjKD3xiV8jtzV5wK4nmWYP
 K29PK7yu1uKmUkx8jWg==
X-Proofpoint-GUID: GOg0F2TDYtxSl4hhqRjmDnw1WceYw-Gu
X-Authority-Analysis: v=2.4 cv=CbA4Irrl c=1 sm=1 tr=0 ts=6a7b2584 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6Dh_s6ggWNQJvp08L6kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: GOg0F2TDYtxSl4hhqRjmDnw1WceYw-Gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The RIS index is read from device tree as u64 via of_property_read_reg(),
but was narrowed to u32 when passed to mpam_dt_parse_resource() and
further to u8 when passed to mpam_ris_create(). A value exceeding
MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
passes the range check in mpam_ris_create_locked(), leading to incorrect
RIS creation.

Widen the ris_idx parameter through mpam_dt_parse_resource(),
mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
is preserved until the range check in mpam_ris_create_locked() rejects
out-of-range indices.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 6 +++---
 include/linux/arm_mpam.h       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index cc9fa1d78925..1e082fb60e30 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
 }
 
 static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
-				  u32 ris_idx)
+				  u64 ris_idx)
 {
 	int err = 0;
 	u32 class_id = 0;
@@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 	return 0;
 }
 
-static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
+static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
 				  enum mpam_class_types type, u8 class_id,
 				  int component_id)
 {
@@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris *ris)
 		mpam_vmsc_destroy(vmsc);
 }
 
-int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
+int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
 		    enum mpam_class_types type, u8 class_id, int component_id)
 {
 	int err;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index f92a36187a52..30461cd71199 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) { return -EINVAL; }
 #endif
 
 #ifdef CONFIG_ARM64_MPAM_DRIVER
-int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
+int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
 		    enum mpam_class_types type, u8 class_id, int component_id);
 #else
-static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
+static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
 				  enum mpam_class_types type, u8 class_id,
 				  int component_id)
 {

-- 
2.34.1

