Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989780;
	b=pNxNgNlpFLcis92O18/94weZ4s+kaC9+M61D68sS3nNSbVaIpyVZwqUXy9/ru6LvW2eu
	 gVI5jtOLBQwUTQyuAuJWtm+Lnjio5LHZVJMkOp703CP89HywRB+0y7KszM62xFySxu16o
	 W4rlfCTOKPB//62W0Lpl4kjtOjNwMEz3aqCVg/MlIRBqvUS5IGdJXB/MYhq6MetQb/9Pn
	 2jlQGdM/QWpm2UWOICw/XwAVJjeE+yZUaT0nog8nIWOVs2AROcSG5cn8QvvI7/YM+Xdlf
	 iRiF3HenoBEC7Qh8Vd0/092tN+7F+0+gNNRfhL/VaOie9DcyQ9wRwdUjKWkiibN6nwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
	b=GXV7u3wKu8QbRuiaoeZq6BWVJkyl3w8TcrlLqn3BRy2NeSdqenDtX5Wbj70eFTGYua0f
	 CzCufjBuTJoeIzH9ebbKP+ofW35+cQhsNhUGwAkJjcORKbPIkft9iKiMFXKMWmWl2lmrW
	 mK0jKD5A+dHmpjFgtlXtPUYCMGVBQoxAIPahiA1dtuXqWO4EDn95/4qjoKsC6aag19mYj
	 o2UBitqRZfLm5CLhTTp05Jpk/j8cFtwrQOG3j3bjE1QK0ME5oHbPxej3SWPp1Wy4RE+vz
	 m6KoEACMp6eRqwRLb8rNBoiaOUlTzwPhOlLxv4r8TPQuVOw5e6aWcDOdi0nD2FIqrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E062KLWI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dS3APYEi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723A606A88B
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7723A606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E062KLWI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dS3APYEi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2Jm1959905
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=E062KLWIE7vf8KJc
	8AXOA8YTofeLmze+XEj8E5JSdBXBhrpBdHVINxQX049RZ6KoocV0N/TZyeHIl+pf
	le2RfPQ3Frx7u07XbAjUkWDboU/aJ0V1NMHF+qX+uICOTB80H1n0Mj/y5k/9epjN
	2Og29Udz5x/Cxu3o8tXeqL/0BME3S5b6enOYd4G6eEzrnvOqB8+f/yjJMsXBO+q4
	XcaZzTYIF6mj/mp8h8fMZNX4ptuETpCbv2gbgTLM6m/fT5i4KnKaanpBsJy7YpKJ
	bw4a4DGZmQ7sLV/oDwkKTZUw6CmlFGm8bXsB4o2edgaA5BWmcy91qMDJl+I5TBl3
	QWCBDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hyr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a73a82a1so856004a91.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989779; x=1795594579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=dS3APYEiDrpt6Js/n9KvLWpMppzYuWh+SPMzQv3SgJMm+9dIEY1ZmdUmr7oln3gWBj
         gK0tlyeR+lDBEcK3xgH57jn0XiNSfjh1l6kEvRFvelZMxpit8NVIx4jEw7dBqBMm/dvL
         q++6fCQcQVFR31ZxQpERxVE3cryzepZQRUn96JBTjBch/knkpwvTAdp0xh88N65Ee8X3
         3Wij0oOrObfdm1n4nCkXpVoO0k561U68ebRIr24o6Jio7mvsOGWlfkkhM+JFGRP6dABI
         SbhDkHbpiuU1jyG7HYflyueej3F50NdsB00JtsdVUO0fQk8fveYvOW0xLz4pFjgL3XEu
         wFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989779; x=1795594579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=XhfKtRYnBaazyJ7oUWOp9Sc+jQ0N12J8oVBYbz+XHGJ22xiQsVi+G/FeKIV9D6Umrr
         R6W7R+ps29YDs9fJ+oQyFYUgACh2Sf2de362pvOgzIUi8ysdtu+f9q4jAZdHeV7S1RFb
         wr9fjbv0/dm0HLKxhZSFDdMAN5uSowt04+2uss7gtJbnhOB74xvP++KrRr6K8oCmQ4u6
         luSHukS0tJVud01pYG/FeIf4kYSJMKaZh7bfrFOIaAOgHlhp1gswih0Nc+Fb+eIM9fqZ
         EQZzC+AUm6zgVmKKQwNbBY9zFqjEB4QoZ1UAOEGTXM+Opennr5VyU2zkRjszB8Lpo7eZ
         Etzw==
X-Forwarded-Encrypted: i=1; AL+hErFpVWrnEoFUp39+YJy3yfJ4uyyhv1gSLpVxcj3PxcBOh0Ma/oNwnm+QJMNgTE2W16IcL4HatlOV6m+K@vger.kernel.org
X-Gm-Message-State: APuU4Z/mXg6+O/Uf51ajSGODX72Qg20Q0m/S+ojJvNYdclshu/uCz3Wr
	YwEgA/ehY3qqikI7ajt1caLW3PyfSa8loWRWBy86DNzJ7529RY09pnqSJvh9/inUa+Gdg6A1jFY
	bHjMUTWkfNNNiTjKlIUOzilpGc5dEOuhFioTJEmU6uvGcJsQXiBf2r+IplN6GcGK0
X-Gm-Gg: AZFdTZcQOKz5CObTuyZyyAlm98syklb3GLxtmetcx0fH5ML90J2wG6acnATJueoDrKM
	iQZDTQftrLDAz5OvL29Z2AOdkivndtrNncjZI1+oXmhG5xzAhR+/zNJ5Whc0DzXrhSEFuqycrc9
	CkHa9WoyfH4PP8t0yjPmn4rWUt0IwzDNaoztXGYJ/bM3ECI1y0s2VfDO4m5DjLfBvTzhKCrnVb0
	8HL8GImIvhKr97OycW8biK8pFmn216XaBMJEr77UgbMtqrU4TE+BapGQM12Mgr4o/ttOIjBVPcF
	K+vltGNmoLM3X4qXer9QFp6ILIKbLlQaFJPLf47IAiWXwp+Ekh3UPUXFDjIrdxSQkS6QqpG9X5d
	EinLzELhN3SRyk6ELJTy9BO32MPTmaC+emgQ0yKffNIIilnsQTGkS2d6w264GFq4xvZl0WJkl07
	o198eQLXwl2ToRwmOoWzJ2TRgGeq5ndC8QwIKgVe6CucBt0/0nBXwt0hc/ROH+W5Il741QAJwYV
	Q==
X-Received: by 2002:a17:90a:e7c1:b0:3b3:b0e5:57ee with SMTP id 98e67ed59e1d1-3b3d07e0c97mr2148665a91.54.1794989778678;
        Wed, 18 Nov 2026 00:16:18 -0800 (PST)
X-Received: by 2002:a17:90a:e7c1:b0:3b3:b0e5:57ee with SMTP id 98e67ed59e1d1-3b3d07e0c97mr2148643a91.54.1794989778240;
        Wed, 18 Nov 2026 00:16:18 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:32 +0530
Subject: [PATCH ath-next v3 09/15] wifi: ath12k: add unified firmware image
 support for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-9-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5ed3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yptJjfQlWYdCmDOAxUgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ylGFRlUXzr-ZejRrrx7tVCuyAa89SDcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX6hDnS3UhlDsl
 soqZb1Bc96U+WwEdYTrGOebF6Td3cC8KJXJpWqVq91msw5ffQW+lr1LHze4MIJsjgywo2Ro2/Hv
 yHGH71mOjl/ZO6WVUwt4SaWKeMq5+0dlYbJNhdbVk1CBt6vlPp7QGUhkjcY7H7uDzNdCtwmEBuG
 bHdbyGyTnR2QCcbZzDsKgbuf/nqmSXBIvmdxj1ajkBjzqA0kf4BpDtPhdXUklm/Ko6Bc/gJvAYO
 V4RJV3xKZ5On5T/V/S7o6xORk4MPOPLhxQUcxqTeORh+Y32D6jui9uEwT7sq+Dmt3ENEfbIuj5r
 X/d546UjfqDtYgNZCkVr9IzoZlZ54SpXy7+KpeusDOG5Yiqb/UukFvhZpKhE7TNehegn8qhoe2F
 9aAmNfQTWaVWz/xaDpmcbOiBTWJIvyIm6Z1StPT61ggegA37Z0fRtk1adKGR+ALTJ8OpTp8UE1f
 ZAHG/Co9wsMVzaYnouQ==
X-Proofpoint-GUID: ylGFRlUXzr-ZejRrrx7tVCuyAa89SDcC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX0Wn9XiTww4IQ
 1Q5vHDDO87RE2XGUO9hk1NcaXmrqoHp2FHqy71yKPP4/vj27TZQWGzjvboT1YjqMPdSG/3vA58k
 0i9Pr4p4vy7UjaYGrYEJKkHaPUGDOyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Wi-Fi 7 chips select between single-mac and dualmac firmware images
based on the OTP board ID, loading a separate firmware-N.bin for
dualmac boards. QCN9575 (Wi-Fi 8) instead ships a single unified
firmware image for all board variants and expects the host to write
the OTP board ID into a PCIe local scratch register so firmware can
determine the board configuration itself at boot.

Add the unified_fw_image flag to ath12k_hw_params.fw and set it to
false for all existing Wi-Fi 7 hw_params entries, with QCN9575 as the
only chip enabling it. In ath12k_mhi_register(), once the OTP board
id is read, stash it in ab_pci->unified_fw_board_id for unified-image
chips instead of running the dualmac firmware-selection path, since a
single firmware blob is used regardless of board id.

Add unified_fw_board_id_reg to ath12k_hw_regs and populate it for
qcn9575_regs with the PCIe local scratch register address, keeping
the register layout per-chip and self-contained. Introduce
ath12k_pci_update_unified_fw_board_id() to write the cached board id
into that register and read it back, since iowrite32()/ioread32()
give no other way to detect a failed write. Call it from
ath12k_pci_power_up() before MHI start for unified-image chips, and
return -EIO on a readback mismatch so ath12k_pci_power_up() aborts
before starting MHI and firmware. Continuing after a mismatch would
let firmware boot with whatever stale or incorrect value is already
in the register and self-configure for the wrong board silently,
with no symptom beyond a warning in the kernel log.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h              |  1 +
 drivers/net/wireless/ath/ath12k/hw.h               |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c              |  4 ++-
 drivers/net/wireless/ath/ath12k/pci.c              | 31 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/pci.h              |  3 +++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  7 +++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  1 +
 8 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 4b0fbd6f4aea..9e88bdf4a93b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1219,6 +1219,7 @@ struct ath12k_hw_regs {
 	u32 gcc_gcc_pcie_hot_rst;
 
 	u32 qrtr_node_id;
+	u32 unified_fw_board_id_reg;
 };
 
 /* HAL context to be used to access SRNG APIs (currently used by data path
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 6fd87482425a..9c11edd2b051 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -160,6 +160,7 @@ struct ath12k_hw_params {
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
 		bool download_aux_ucode:1;
+		bool unified_fw_image:1;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 56e697fbdad5..90b7774ae6e8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "failed to read board id\n");
+		} else if (ab->hw_params->fw.unified_fw_image) {
+			ab_pci->unified_fw_board_id = board_id;
 		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
 			dualmac = true;
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
@@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		}
 	}
 
-	if (dualmac) {
+	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
 		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
 			/* use MHI firmware file from firmware-N.bin */
 			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6617440954b1..d238603f6075 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -976,6 +976,24 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 						   PCI_EXP_LNKCTL_ASPMC);
 }
 
+static int ath12k_pci_update_unified_fw_board_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	u32 reg, val;
+
+	reg = PCIE_UNIFIED_FW_BOARD_ID_REG(ab) & WINDOW_RANGE_MASK;
+	ath12k_pci_write32(ab, reg, ab_pci->unified_fw_board_id);
+
+	val = ath12k_pci_read32(ab, reg);
+	if (val != ab_pci->unified_fw_board_id) {
+		ath12k_warn(ab, "unified_fw_board_id readback mismatch: wrote 0x%x, read 0x%x\n",
+			    ab_pci->unified_fw_board_id, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 {
 	int i;
@@ -1484,16 +1502,27 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID))
 		ath12k_pci_update_qrtr_node_id(ab);
 
+	if (ab->hw_params->fw.unified_fw_image && ab_pci->unified_fw_board_id) {
+		ret = ath12k_pci_update_unified_fw_board_id(ab);
+		if (ret)
+			goto err_unwind;
+	}
+
 	ret = ath12k_mhi_start(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to start mhi: %d\n", ret);
-		return ret;
+		goto err_unwind;
 	}
 
 	if (ab->static_window_map)
 		ath12k_pci_select_static_window(ab_pci);
 
 	return 0;
+
+err_unwind:
+	ath12k_pci_msi_disable(ab_pci);
+	ath12k_pci_aspm_restore(ab_pci);
+	return ret;
 }
 
 void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 62b72558c0e2..70952a52a1b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -38,6 +38,8 @@
 #define PCIE_SMLH_REQ_RST_LINK_DOWN		0x2
 #define PCIE_INT_CLEAR_ALL			0xffffffff
 
+#define PCIE_UNIFIED_FW_BOARD_ID_REG(ab) \
+	((ab)->hal.regs->unified_fw_board_id_reg)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG(ab) \
 	((ab)->hal.regs->pcie_qserdes_sysclk_en_sel)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL	0x10
@@ -144,6 +146,7 @@ struct ath12k_pci {
 	const struct ath12k_pci_reg_base *reg_base;
 
 	u32 window_reg_addr;
+	u32 unified_fw_board_id;
 };
 
 struct ath12k_pci_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..282a41980d98 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -413,6 +413,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -509,6 +510,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -607,6 +609,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -702,6 +705,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -792,6 +796,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = true,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -891,6 +896,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -983,6 +989,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
index 076a5a609f8b..92ea24634100 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -68,6 +68,7 @@ const struct ath12k_hw_regs qcn9575_regs = {
 	.gcc_gcc_pcie_hot_rst = 0x1e38438,
 
 	.qrtr_node_id = 0x01e03300,
+	.unified_fw_board_id_reg = 0x1e03304,
 };
 
 static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 91d8f762e642..bffd1081fd2f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -24,6 +24,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = true,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,

-- 
2.34.1

