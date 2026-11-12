Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472363;
	b=nvVU0C7JQ/5SVrj+8D2qgOD2Qu0uKj+0l7cYt3sFfC1XM3qoEJyTV8Staj/QATu6r6Tm
	 9wJSzV7i/0nULeVkY4od4t6OG0DiMCb2Nf7f0b4YUMBWhFuJwvbX6OW240tgKNIih5Zrk
	 K+2WjDcAR3Gk25oaSZB40ihvmG0s0mJmCzF4LeOfqHg+ZNa1Qwadq5l1QnDcLe/7sT2cD
	 3j7/f+gh0Qmwc4jbNre0Hn5NKicxk87h8M9NGBEQwc3wmZRa5fVcPTmZsSlJdXFsrSDn8
	 pWukQuC9vbQZNxkgKkyxoh3WzZdKVz4LAHVFNEIdiqImCK9sTADxrdLi+wSMOrttUgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
	b=ov7+OQr7QK2yDa0iC6/dNFbBmKkerixvYQa0VqyEOlmMbGUR4OjNz+Z+L4QMo9LKU/oT
	 rI+QjNY5lycFzewCdrd1V6cfmZvo51FJH4OOqIG+LxgdyvfAyMtTvyO3LDHCZ54Ma+XI8
	 FvaVRDjA1VkZdfoGB+xJAE5jFcH21gYGAngDDojuc9HwqOvLzl5V9mtyhG+GftfGsfbPZ
	 9vU/1khkiBLa6kLZyl3C9SYIyPVtH3GjyNLweM5E/YWI2WWuFjldN9w5S8bzadKH4CciO
	 zbFsY6wz/SvaBHXtMi8C9p9V5igtnFZ+wXw6AqHmGWb13vX6YA16fEMjWKCTSeNxOmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bkFP41DP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EakHInJP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BB60A262F
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90BB60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bkFP41DP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EakHInJP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZpBS597555
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=; b=bkFP41DPNYORvX8l
	I3mZfwAus+PnqnAXrsyupnmUkRgiADAd7Raw71PorxdVe9e4y7D0I2oebXnH4egL
	mlQYDe5QW5PIxeN0fLXAm7sCgu3fWLAKOuihF1So/i2G/HYysIJX36olIkqyo7tI
	F5eFNRytTzUORzyHpV9PeJ7bDwyr1WGQROseOmg6dOlaukB2YdPEePH8U9X37Qfz
	lTevuYH7iqke6V0pkNAf6EwzuaOqLDut3OGAumgSIAJKACb8c/7ZUVA9xGXS/xhS
	Dk09/ZxzKyfdfeM70JWMTb+/4sFOx9NXImrHbO61BnEhASxZDP/9YvMiWpgQ8lr3
	j0xAIA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153uq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so2739580a12.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472361; x=1795077161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=EakHInJPVbBuk1L69zizPa34jZ4RytVGjrRWKKCs23h+uCtAmgwvCvOgSJbXz8f88z
         VqZgxSiISdNzxib+0QXtbDq2wqscd6E3bOpdZTBEhh7Y5FZ1Xv+Y7ML9Uh57lrLXAaD9
         kP6dTxozNqoEXSP9dSOceq8S6X6xQ0MURmloyYl4695yAJiT2ioCT+C1T9uubUeF86r4
         jn2c2r+k4OWUmuMgOCORFMuwi9gSw7h8MZQis2PYQcQk6SEp0+fjU2RxUuTWGcsIrAjf
         o4tSkcRe01tvYKpXBBcJZ+XRR0oi9OLbitRvzSWs6zTCXgEbru1Zy0zQVPn6hM00Pare
         uTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472361; x=1795077161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=gV96z604WGR91mOekKwKN7b1EoSTcIRxu37Kgp6FTNf+1O4t4gtCy7UNMvvaMJQgaV
         fVVC0DzX1rnR8s9RBur++UoKIaPbJraEZyaDNvKVDJx+oCB+eP6KG0/R8Cwpo3gqqBQx
         6vNg0oAM9CLkEgn6212YpzbZqVpQ7TMcbjRPLI4s69QrM53CdrmigQu40GXStsk3N9dB
         sb91QjclJfVcyLd5yFf7EVwj3XV4uteOIJ4zWwHucaUulUhQmjoI2KxYfs3N/7L1X+jT
         sqx5SMETYpRK+PbU2f9uMu43E2z7K7sMRoX4YpRFgCu+1yg2lx9dUQNHPU2RnBt0C5XN
         Bbzw==
X-Forwarded-Encrypted: i=1; AL+hErFkzGA3mEBPDnoMZZg4XQQyk6OU4EWrPurT0K4pnVyeJ9CRiP8pPwQ9Beiyg99d9YlRc72G0xV08tvt@vger.kernel.org
X-Gm-Message-State: APuU4Z/DkSKXrE+WxDrCZLKGfIppD8eeNQm1uRb9ULAUOhrQvvm55b0v
	uutLx9z4QGMpt6JRY2dg253yMV5H1Qha/gN8EbKRaOUUhilL3RGkoofM7vOhxv6GgK94mfe7u9n
	AhKtkpJw84NYJtmc6UMxfWu5iX2NuGchfQ2KcEic7zRLEjGnoF8KgLIZEqAxc3yYL
X-Gm-Gg: AYBFou2zG7rFSU75oanpyI7btD8LGIZ1DJ58xg3CktF3SCrynhMze8iYY3pggNuFC9I
	14GvUfCIySBkng6zpDEFPZU7Cc3T6PlEoDbLy6OUF5+YRnD7PwGUhULBMUXAyRy+7+7PUqfqDFn
	Z3DgalXTC78ua6abP8knQ44csOQJfFcWyvR1qJUBNExeMsSwLd6YI82VGPepq6g/XfNICElS65M
	LCIdrhQUEcO14WL0tIN69777pAhfUWAREredqwj3mq7QiRqGmYFiPRGxrMDg0b4sZiIqXo1J6e0
	HJkN2EAG+W3XRaANMg2dHsoSY+KVA+obl/Vm/XG35qHPySFl/zVQsgsH1tPMH03hIxj8v7iTeaD
	qgfpqVGsQ8oUNcHc469kD80knZcPE2dFf1mgROuN3jr38mS1ALb7iYPqfLiJU5xiFSUHK+ZlB79
	neucqAnQXr2RWH63ZFisHBDrYuliUF8jW7JLE6NJ+b7IClkz4BCt4r9OwcYunUn3OqlOMEspFN7
	Q==
X-Received: by 2002:a17:90b:4985:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b182f6d752mr4136679a91.42.1794472360575;
        Thu, 12 Nov 2026 00:32:40 -0800 (PST)
X-Received: by 2002:a17:90b:4985:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b182f6d752mr4136649a91.42.1794472359925;
        Thu, 12 Nov 2026 00:32:39 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:38 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:17 +0530
Subject: [PATCH ath-next 03/15] wifi: ath12k: add extended QMI WLAN cfg for
 CE and service pipes
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-3-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4GzkY2kdkyGr
 2Guil6KRRG/E3XVUPxf38OlTiZFtyM2MWxU5i9g/SudvCU+2xZBhp6hSwU/sx9IC5gZVqACW2sq
 HCBZBwFxrGKZKo6MJrrJPb372baHIFM=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af579a9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=z7nB0JqBhXvykku2dhgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: a-9gSXd8AerxalSLWwaX_SxuLY2H9POD
X-Proofpoint-ORIG-GUID: a-9gSXd8AerxalSLWwaX_SxuLY2H9POD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzMH7q9U3f5f8
 jZ/nR114t+Ou/Bq+OUR2wwH1AJl+DiXF9TE1c7Yr00HoqKiYVj79Go0RRjv/qPvyuagSBqETCAD
 ML4LJzR84herAXSHVPbRvsL8E2pPfpAwDhNDNPJOv3ls99F8uHci1jjkPlRPy3cwM49axlllMBu
 uQek01cM0VdwbcYiL08Msdrh3Bq7UFfiI/MGjh93z+gLU2YjtkHdiDZwS+yI+T/YyHK51ACmZvv
 /1JdZUMXifxSOsG3qjZecTGeMxLP5gu0VFp8wDTm5v0Je86ODTgvdeDxHGvi1GTwArPGEApUUfG
 Xk0f3LDIkDUc2mqEBve0aDIurJH7lwa/7t0tZqEzwYKEMrhWMZFVG9yASVE/eI+H9g1WOtolyml
 cL3nK+p1UutTQAAEhh5Zh1RYb9m5jYy/8zmanqdjklbedjNCOXrc131KSdL+EVYK8hq+8Dp+T7e
 2BXkTO30f8dvgqsiDOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

QMI_WLANFW_WLAN_CFG_REQ_V01 carries up to 12 CE entries and 24
service-to-CE mappings in its base arrays. QCN9575 requires 13 CE
pipes, one more than the base tgt_cfg array holds. The old code set
req->tgt_cfg_len to 13 and looped up to that count while filling
req->tgt_cfg[], writing one entry past the 12-element array into the
following svc_cfg_valid/svc_cfg_len fields before the request was ever
sent. qmi_send_request() then fails outright, since the QMI encoder
rejects a VAR_LEN_ARRAY whose length exceeds its declared elem_len
(12), so the WLAN config request never reaches firmware at all.

Firmware accepts overflow entries through ext_tgt_cfg (TLV 0x1A) and
ext_svc_cfg (TLV 0x1B) in the same WLAN config request. Add the
corresponding fields to qmi_wlanfw_wlan_cfg_req_msg_v01 and extend the
QMI element-info table to encode both TLVs, so service-to-CE mappings
can also overflow into the extended array if a future target requires
more than 24. When CE or service entries exceed the base array
limits, keep the first entries in the base arrays and place the
remainder in the extended arrays, clamped to their maximum sizes to
avoid out-of-bounds writes.

If the combined base and extended arrays still cannot hold all
configured entries, fail ath12k_qmi_wlanfw_wlan_cfg_send() with
-EINVAL up front, before any request is built or sent, rather than
silently dropping the extra entries. Update
QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN from 803 to 1835 to reflect
the larger message.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 124 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  12 +++-
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 52a925fc44ee..69512b82aa3b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2018,6 +2018,62 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 					   shadow_reg_v3),
 		.ei_array	= qmi_wlanfw_shadow_reg_v3_cfg_s_v01_ei,
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_CE_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg),
+		.ei_array	= qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_SVC_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg),
+		.ei_array	= qmi_wlanfw_ce_svc_pipe_cfg_s_v01_ei,
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -3537,10 +3593,28 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_wlan_cfg_req_msg_v01 *req;
 	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp = {};
+	int ret = 0, pipe_num, ext_pipe_num;
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
 	struct qmi_txn txn;
-	int ret = 0, pipe_num;
+
+	if (ab->qmi.ce_cfg.tgt_ce_len >
+	    QMI_WLANFW_MAX_NUM_CE_V01 + QMI_WLANFW_MAX_EXT_NUM_CE_V01) {
+		ath12k_err(ab, "CE pipe config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.tgt_ce_len,
+			   QMI_WLANFW_MAX_NUM_CE_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+		return -EINVAL;
+	}
+
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len >
+	    QMI_WLANFW_MAX_NUM_SVC_V01 + QMI_WLANFW_MAX_EXT_NUM_SVC_V01) {
+		ath12k_err(ab, "service map config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.svc_to_ce_map_len,
+			   QMI_WLANFW_MAX_NUM_SVC_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+		return -EINVAL;
+	}
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;
 	svc_cfg	= (struct service_to_pipe *)ab->qmi.ce_cfg.svc_to_ce_map;
@@ -3555,8 +3629,17 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 
 	req->tgt_cfg_valid = 1;
 	/* This is number of CE configs */
-	req->tgt_cfg_len = ab->qmi.ce_cfg.tgt_ce_len;
-	for (pipe_num = 0; pipe_num < req->tgt_cfg_len ; pipe_num++) {
+	req->tgt_cfg_len = min_t(u32, ab->qmi.ce_cfg.tgt_ce_len,
+				 QMI_WLANFW_MAX_NUM_CE_V01);
+	if (ab->qmi.ce_cfg.tgt_ce_len > QMI_WLANFW_MAX_NUM_CE_V01) {
+		req->ext_tgt_cfg_valid = 1;
+		req->ext_tgt_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.tgt_ce_len -
+			      QMI_WLANFW_MAX_NUM_CE_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+	}
+
+	for (pipe_num = 0; pipe_num < req->tgt_cfg_len; pipe_num++) {
 		req->tgt_cfg[pipe_num].pipe_num =
 			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
 		req->tgt_cfg[pipe_num].pipe_dir =
@@ -3569,9 +3652,32 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(ce_cfg[pipe_num].flags);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_tgt_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_CE_V01 + ext_pipe_num;
+		req->ext_tgt_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
+		req->ext_tgt_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(ce_cfg[pipe_num].pipedir);
+		req->ext_tgt_cfg[ext_pipe_num].nentries =
+			__le32_to_cpu(ce_cfg[pipe_num].nentries);
+		req->ext_tgt_cfg[ext_pipe_num].nbytes_max =
+			__le32_to_cpu(ce_cfg[pipe_num].nbytes_max);
+		req->ext_tgt_cfg[ext_pipe_num].flags =
+			__le32_to_cpu(ce_cfg[pipe_num].flags);
+	}
+
 	req->svc_cfg_valid = 1;
 	/* This is number of Service/CE configs */
-	req->svc_cfg_len = ab->qmi.ce_cfg.svc_to_ce_map_len;
+	req->svc_cfg_len = min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len,
+				 QMI_WLANFW_MAX_NUM_SVC_V01);
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len > QMI_WLANFW_MAX_NUM_SVC_V01) {
+		req->ext_svc_cfg_valid = 1;
+		req->ext_svc_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len -
+			      QMI_WLANFW_MAX_NUM_SVC_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+	}
+
 	for (pipe_num = 0; pipe_num < req->svc_cfg_len; pipe_num++) {
 		req->svc_cfg[pipe_num].service_id =
 			__le32_to_cpu(svc_cfg[pipe_num].service_id);
@@ -3581,6 +3687,16 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_svc_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_SVC_V01 + ext_pipe_num;
+		req->ext_svc_cfg[ext_pipe_num].service_id =
+			__le32_to_cpu(svc_cfg[pipe_num].service_id);
+		req->ext_svc_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(svc_cfg[pipe_num].pipedir);
+		req->ext_svc_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
+	}
+
 	/* set shadow v3 configuration */
 	if (ab->hw_params->supports_shadow_regs) {
 		req->shadow_reg_v3_valid = 1;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index ed024084cac2..7879f439a5ff 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -544,7 +544,7 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 };
 
 #define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	11
-#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
+#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		1835
 #define QMI_WLANFW_WLAN_MODE_REQ_V01			0x0022
 #define QMI_WLANFW_WLAN_CFG_REQ_V01			0x0023
 #define QMI_WLANFW_MAX_STR_LEN_V01			16
@@ -552,6 +552,8 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 #define QMI_WLANFW_MAX_NUM_SVC_V01			24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V01		24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01		60
+#define QMI_WLANFW_MAX_EXT_NUM_CE_V01			32
+#define QMI_WLANFW_MAX_EXT_NUM_SVC_V01			32
 
 struct qmi_wlanfw_wlan_mode_req_msg_v01 {
 	u32 mode;
@@ -582,6 +584,14 @@ struct qmi_wlanfw_wlan_cfg_req_msg_v01 {
 	u32 shadow_reg_v3_len;
 	struct qmi_wlanfw_shadow_reg_v3_cfg_s_v01
 		shadow_reg_v3[QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01];
+	u8 ext_tgt_cfg_valid;
+	u32 ext_tgt_cfg_len;
+	struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01
+			ext_tgt_cfg[QMI_WLANFW_MAX_EXT_NUM_CE_V01];
+	u8 ext_svc_cfg_valid;
+	u32 ext_svc_cfg_len;
+	struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01
+			ext_svc_cfg[QMI_WLANFW_MAX_EXT_NUM_SVC_V01];
 };
 
 struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {

-- 
2.34.1

