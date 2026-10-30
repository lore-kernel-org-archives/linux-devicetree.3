Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353217;
	b=CjREIP/KBUER01b/VWUDSo+WrqExfp+FRo+Z63dXmqS6wypfanGaWkKr6htrUO1a3omz
	 OwArUfC6GQ4GIPWjHvLoAcOwUMbKmmyA/yIn1xrUuVKwyuVxci56XP/BJ4WaWi/nq+yAZ
	 cHHBFv77zV64bwHUBmHQ2ReVmVi2xrWY+ITQJwsX01yWuLmGWJGymLkzA3rK6HAPICCa8
	 d3yZJk5BiUVv3paqr+SK3P+4GHs+dQP/84mAPavT/Coyk33mjHA/snlZrEkB2jONKsmAE
	 mOx8LJyzaXesVXk36oM+AcAC9XOsSxKdJ4M8sh6ueHGQGcHcCTuvLymGKLklqA2DEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
	b=SxARQIgAWrB3WgdXwioNig18NwRdtk8ygITA5QQyYgCAMBX2SII0vTRB5hvpRLnUxvAz
	 y/GBDG4PiR/j0veQRK5IC17TfNb7uTMpzCP128XoxOcgQguiD506OG1yvCqRhTuBPibYz
	 H5CuKs39Oy1F2FVFq9olnrWKkIqOEq7bgDtfRQcye6M9cMrFKdoQwfTf8LGpslx68e1qH
	 Vzb3So50RV5Qa1tXdsZnv9JCxz0ytqcCclSNCb9pT872GUZlf6DK1+HB3YUMWmmoQjwf4
	 vDmhQSNVW+gFJRE2iNT0O2GmuDGvojI1/FzvaP9UU+R6RsQ2c7ZAQ2P8S3+Wb/02dUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9QdXPMo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpoTlSLW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383B60A2606
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F383B60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9QdXPMo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpoTlSLW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F4b91120741
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CfivT7f6AzXhM+eASp8z6B
	DLEz8vb+/X/mhHCdqRcYc=; b=V9QdXPMonMVn/SqgE8m+cs9R/C92q2Z5sFW4+Z
	PO4V9mpFxa+SsfWMNijM4lGNQKgGT7fxVvrEsP/Mtvsre3X9MRgklJiz3BZNSiq/
	eNWKN/JlZ/FSn6yTWrpHZE5x/GHbQNfDLsg/b5Du79hXUe5Xh+ozuTMzG98L752m
	A10fXKAXPutguijTR+9XVtD1ArOcMZ0sltvmmSr7HXh/mLC2fvNFX6jCrULMKlVR
	4ahr/KebIP1ADrDpnZFPaoPxvEPBnXZ7EdbUUKkwgIea70kEzdO1XZfbMJ9iWBe7
	Rpl+Fj09LqGjPbZGK+hcz8q1IFcnyJOtPOR1xfBEwCoV/8KQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pj8h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2453955eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353215; x=1793958015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
        b=QpoTlSLWoe7raMlnl0XzzbsjcJsEO1qr5Y96oJow7FT+RKJcoiog6KScaE5ZduFohd
         5QBMeUZUFMUKBrJV0Xowi/GeiQVk0h1oSx2OKJeN3ffZ8O7wxRvv/aezFtkpHGgCfR1J
         yBiflC7GOkHAy34W7YkbkSyMu6DO6lBDqG8syRyz1nKvQ/0CzgXkTOawKFKXOzCrSAHw
         aR+ldBxkPmwUhoxU0J9WwfqM6mogAcHweFDxbHetp1oVxvHqWrE+EFgiVYD9trDN8VHZ
         hc89O7oWkeJrEyFg9y1KOwhG9yVhE4povnm2HfFGfkIdb6ho2ASlRcVGCr+461t4SZRw
         yMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353215; x=1793958015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
        b=khLJrmG27r3VK8M3OMlhSWgZbTeqMQcoeBF2sOJ7jDiTXUm58rwmVxSbcEf12rNdRJ
         T9Dsck69nptUQaWZeubZuVRc7q+2rNdV45Qu+kDSoQzcITAXhVjiC2nC4tpGNd8pTazY
         eRNyKZ2qiZgVbEEfZteBzAOcYDdrzjtbMIOLTs3YaWmqAqcBTsvRQw8ExOOFY0jnbsXu
         wEaxbhS4Qcr/y2Qq4Os6OL+serYR0JBQbpofdUsNq+JDU8ImRn5u7kX6j5fztoEiLnG3
         MrgEapmXIQYpfVsZmas6ocLjmAuhvPCa7++whY3MFEPo06YLVNAsSrydW+psnZQkInXu
         Vv8w==
X-Forwarded-Encrypted: i=1; AKwUvBwHD6J6Mt3yDJzVvy7qJrabLIb1Tw6qNRgzjfHyg6Yn0BTwdawrjGPQAQrFc2K8DbpCGLMr9KxFxmL4@vger.kernel.org
X-Gm-Message-State: AFq9FYJhKYVVkxg/tg8Xs4gwiSUNi+8NIiTEOkcxOlx36VHZGcmXnON9
	wpQHkg8KC/fbEY/ngOTikujc4Nerq09wwYMtdn6CR0XmSbpFAJgFABipHRX+QDlft6MXiBSac/j
	rX5QjCxfFl/qMnL2r3tlNsEB91Cy1hCesdlKTIBeBtbFWnz+b4mgqIDacjBhYiMYQ
X-Gm-Gg: AYBFou22Yutn2iw4Q1hlSvgtojsrWbwsA2geFlFMm94UEdiUvFraSUqJWRv+WvBAjj9
	spo2D62js80ZmZoWzZnvWEn20DjFi7Vbra4VMh5zGezt0j7N3m+zrr2PpjZqCXPuk/UNllGQ5Fq
	ZGmmt7H1MCSeh+imYC9N1TKOCP2S27HbYVwE9EC23uZxCjX/D5JTquEZmWpIOHqKhL7p28us6mU
	RfFi1HXZowlfWb8rFVPRzvH/Yfq/ifNYnkCYtzTq0hImfaq2lXrmBXhofju85mlxXekkOxFfnCz
	Z78PcMjQIBVy42TwVTRt/ioc7ntayqRWt+24KEqNuSa29RrDFchfzih08zSm5S7SjsjQ4EflHif
	VNvCQajcBjC5QFdkAcOu5LliNW3NR8ewjbWJoEhRQDumpbk9p309gLtAb+hWBALif0cTu8gC31S
	Ob6Rkb
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr3037965c88.1.1793353215232;
        Fri, 30 Oct 2026 02:40:15 -0700 (PDT)
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr3037909c88.1.1793353214643;
        Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH v2 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Date: Fri, 30 Oct 2026 15:10:04 +0530
Message-Id: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPVl5GoC/32Py2rDMBBFf8VoXQVLtl6mlP5HyUKPSaPWjh2Nb
 BpC/r1ynF1DN4IrhnPuvRKEFAFJV11JgiViHE8l8JeK+KM9fQKNoWTCay5ZzQztL8nSEHHq7YX
 OE+YEdqDTiJnyVgrJpbam5qQApgSH+HOHf+y3jLP7Ap9X4npxjJjHdLnbF7bePUSc/SdaGK2p0
 MJb2xgflH8fEXfn2fZ+HIZdecj+tgkTnOcyKm8tyACI9j6qq14fKkWz7UfchLB804XTpSkGKfQ
 hCKvAG/PH8Lb2f4YrzbORjHm6qNJUF1BrlHam1UYe2HOQswh0/Ym5q1pwXGjpQlsHx1VQynvhF
 G+9NY2WEGqvWBBNGXn7BTlKlnbBAQAA
X-Change-ID: 20261019-lyra-display-upstream-post-24656268a902
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=4288;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=l/KjP8oydKHmymn+QMM/p6UUas/pmtAZFnZX0nIpC0U=;
 b=YTU8fsSxpHE/c9kAWWkPTH9oSzsXwF4O5t1mp/6y1PgZVzm94C+fbfsPYgl3FGyXuIPET9MAE
 cvwjUbScDIYBe2NYIKbW1fld7t7ifBzj9HHSoFOrBHKZ8u7s7hQVRKI
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXzPtwfq0yPTy2
 L1UdnCZ2tfkKasZGkaw26PIv/D7dblBKzsWAPBfCrmEbkHyiRIcrFQ+Oha7JTPJdoqaWGPu5hUp
 MUnwzFfTDwqGTdPrOrxtbUZc/Vmf0e4t/KA8L8CxKvvEYJNVkTM9ERVbhdCoAxNx6i4vmLAfeXn
 W/Wx9hJrqjoT+deGYwZHe0WZbds9kZt4iP8ObUia9X0qoXMkDDDqvV0ArAaDUSvmhZuQZ1JzrU3
 ZwBn3fwQsBiSDc56Q/LP9hszVjBScB0PuFRksj2JP2qsxOh06YQOmK+IFQPsgBw9pXDagc26OZ2
 yA2+EXCyYfg6qnrKA+SmkhwpGCIe/fbYeTC2/Qq+q38JLPLx8T4KUFYvlTC6RdTuje2CzNGwSZN
 HFFXRN+zHqe0Qlk6PQEg9bMbYVSpgfLnmpdOSaAVfpdqRDpN6UhO0HKQHmn9uDWgFAxqe7SmSGa
 /4+SN6OLJvmM8i6PPIg==
X-Proofpoint-ORIG-GUID: x4YZzaCKjD1-ogt6_SJIcjczkgDGVXEI
X-Proofpoint-GUID: x4YZzaCKjD1-ogt6_SJIcjczkgDGVXEI
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae46600 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX/zlNt4O8ohu1
 p10UvIzN1ZfKcqxgh2goTwuDOAiPyGwXlZQtvUn+dJJn2JXehqRXT8CtDItU0DpN6IazFTSv5ZU
 OcKYcoqj4Q6sQyZYxJbjjD6blBgjZNM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

Talos Lyra EVK SoC card are mounted on the Lyra carrier card. The
DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
connector, through a MUX which can be selected by a hardware DIP
switch. There are multiple daughter cards designed that can be
connected to this B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

Below overlay DTs are added for additional display configurations:
  - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
    daughter card
  - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
    Lyra with LVDS daughter card

These overlays are applied on top of the corresponding base board
DTBs.

Link: https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Changes in v2:
- Fold in the hdmi_connector port remote-endpoint indentation fix.
- Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
  patch; the dt-bindings dependency is now declared as a series
  prerequisite (see base-commit/prerequisite info below).
- Drop default-on from the DLC0697 backlight node.
- Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
  panel overlay to fix a dtbs_check "too short" binding failure.
- Reword the PWM_CLK defconfig commit message to name Qualcomm as
  the SoC vendor.
- Remove a stray blank line and non-ASCII characters from the AUO
  LVDS panel overlay.
- Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Anand Tiwari (2):
      arm64: defconfig: Enable PWM_CLK for backlight PWM support
      arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

Shashank Maurya (3):
      arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 106 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 498 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261019-lyra-display-upstream-post-24656268a902
prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

