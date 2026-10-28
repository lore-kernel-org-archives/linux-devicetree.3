Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190347;
	b=s4P/gv3OCyzuQzES2xgjBBo9BitIyydWvA5ZGNCRmjuk9v1T5SzYFfxn1FsiMR+FrdZG
	 KdOnaWB2O4VDcAbVIuJqZvTW/PWyNQ40lmwpCm+XKPNW+iKrSKu/MqU5VOZiZ8VM54sVN
	 DskameJVWCSOvhhoFuy43NxAGT6sRVw817ymiMQ7mqeHrtLUq0k8Lhh8TpELsWl5XNE2X
	 XZ6O6MBoX6qb5cqJQFyaBJFpcoeVSfYfHZ1cJjz9l93BQX6FrJhqwElStjn9g6JHx5YxU
	 uWQdM07azG+iUA/Jm41xDC9i5LBo67TlfNNATM/yAUPATL2D0OGTLrS6xsMSit/Jy3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
	b=EvXxb53219q/Ng0roudVMgUyGjrG+jV+yDbzLcH4xlBPc5gA3gDKfRW0XfE0Akpkol68
	 bGnt+DXchpTljIlsYXOZm9vAHwg5XSKNoBZUleEbZIHXch8sy2NLS/mWmMBmmBgmXo9Ja
	 VrT3nsWs2knmkEZ0KG4pahpWfTSE+wCV1ajQ3zqJ7aubNFEtyL5vptPGorZeGxklFfx42
	 XkJZLgTuUHT3dDvWRxFpG8XZJN0vbrJO3JlgklZbdr2cbFBNCWLzhTT0MuYIIhlWg8hhf
	 LZiq6v/Ap0ZpcUW4T6lQBj9xsWDx0iUYmJbR4PJKUbmm60mLgkiXLRxeYFaBl85SAVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iz2BlZf8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vnkqsubx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7132606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7132606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iz2BlZf8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vnkqsubx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3QB691873
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=; b=iz2BlZf8W0+7zF8k
	YVFXLVXVXs+KbPcx0z96X3Maa38IR0tPPEcphuCMRQrxA10L5Bk34Qh93o+5c4jl
	mr23IQ64YsoKgth3gFJx+bSx8yinUqjz8luZA6HdsyUf0w8F9ZHeX7CSsOHCiFio
	M22diJ5ZGF7LY/bFN6Q0LI7CFFGKBKZEwGWUhf8AvAWiXgvlbmaFhsszv3CYY4Gc
	ThsqEllfEy4/sahrUG4DW2LqLyntN9F1c0xXf1pJuznNqpajbbhmVRnD2kgQdi3G
	Fwz2bCRFTQ/4dyqs61p4GZzzIFVdukKdCiAHfD5hLvu+o7JjsH0XSAfHRJ5qFI2c
	18ZUXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2dbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae59682799so628874a91.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190345; x=1793795145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
        b=Vnkqsubxv5H5xf2ssDV5KlcRnq91wM+xH75/9E4nMGTrmoRtn1LbtY4i7lJVpft/Xu
         EUHJ4YwqusQYpfcKI2YpGK83gGGxOZM1rYxrMisPUNHWrEeSwmrusudi8LBzBkxt9fgO
         zWy6/YaiSb62CVD5lFEfmdsR4eQ7J947q6nElyKKQIlhPcBjU8GKhiVbV/e3l75O4exG
         ejG6w9gMAMpjeNGdML+5Hzhppzq1IIxFNcSMbRPvsLrXOM2ZX6FbWovj6Q/EhFh5z0MV
         27oE0kBAWE6Q4iAAjGkiDacSQCQNB7i3gLnqlru8/HmwbRqLXstonp8Xpw2+vSSwhanT
         dvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190345; x=1793795145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE7TTEPp+mYjYOJnw2S5JdN9e/VGEB2SwjVCAm8BKAQ=;
        b=LxwjJYzVxV3eoXN6bdYCnxlNwSF6rZfvSzAF2lQ05Xjs9jeSdQgDKMiOwWp7+Mk/T0
         daUbKzhr5FSPDrWICRKVtZpSviE57b4sLy/VnRw1JLFKGNSb0SD+5bfpG9p9sOqSykS5
         lSQ0019FRncQxSR013jKQsE8xvOy5Yied76Bicibvu3dS/jVa3yam18iKoH13/FlnTAA
         QbYBoZp1NvQfvBCDtEHdl+lyQEi13fVdiCCZn+qt2bFUhxmLBTLc9N24xmZfQsOGP0zI
         CqxuPpMS3SZU6GZAW/CyAwbRCogZwUIlbMJtnufEoKni996pmepEnOU8+mPc0JrisGyR
         o6KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK1i72PSIcSrBtGwAmFXATTjBalpGIOM8u2clf8RSX5nqzeZkTNyhyL4Z+qEYNKNr9f5zjRQ2ozapg@vger.kernel.org
X-Gm-Message-State: AFq9FYJgiFLRvJTOMFlVapAEQ55Ti/OAHrHiNOMVHThNHfyQTWBUW6je
	NddYT0wSb3fLnQRsR9jxL6gXOxEuOjP7UcTxd0vdrzlfk8c/OR2vb/B6HSwzrScVp1RxTsiPNS5
	1fuxxcAgtni/viNgf3NgHcKreJEd3bWfyar1+OoSrgJM8f5rfnQr2UAnq8GBMgYO/
X-Gm-Gg: AYBFou1VdlmgYUJJr5ZeR4HBB6dTTNJ1PLmkzcpMWhnWQxTxCrNYq07SoJ1lXc78vYB
	7ChHPehTCvmdolt5ROmmjoNJwm3u7ReZSTKeRzhBXXVJ3ktSWB9Nh8fD4NixB44Imkpm7CSke5A
	oFREyM+7dYXklE0xdE/luKS029SoBGXCs9yQApBI4nKT5kUjbgMskfPEAQpELC8+wqPEUBX//jI
	Uj+YiKFeCI4hlZX1XBQ7k6thPeqHUxT9RyJgJjywGYgbIYWWx2lV8KepIERNkI3d560aYrmXXd5
	BmHrhIiLTGQpvL1IzKQ9n4/9LzDBe2hXR3ouvQcB1bZsSlbvCylsGaaYLeye5OqPp+j441HvOtS
	6OvQ0OduR7UCzDJ7kT+iyHqKKw2/SZ4Gqn1euNxFrcPBg5drSu2PJkLJrlNwjaQllyO19DbMZnc
	U=
X-Received: by 2002:a17:90b:1f8b:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae57f9afe3mr1580162a91.14.1793190344582;
        Wed, 28 Oct 2026 05:25:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8b:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae57f9afe3mr1579906a91.14.1793190336827;
        Wed, 28 Oct 2026 05:25:36 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f287fsm2995819a91.16.2026.10.28.05.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:25:35 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:54:47 +0530
Subject: [PATCH v5 2/3] arm64: dts: qcom: glymur-qcb: Enable UFS
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
Message-Id: <20261028-glymur_ufs_qcb_enablement-v5-2-09cda5e3bab3@oss.qualcomm.com>
References: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
In-Reply-To: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793190309; l=1034;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=qZOq97SsVPti3oQZnFWkZh3c728gDdolT+V4/jasJQk=;
 b=32awDFy7e9HmWnP/20AX4LOq2FVNW52SoyFahYvtOVEkfvhPnZE7dbpNNlkhNLILqGfEZDoro
 gALGuqVM6y/C6OqU8Q6Ccqgwz3pNh/45gLJSlrhnP7l7B6Tg8Jb/iPS
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-ORIG-GUID: EOIVFvws3JSH-OxT0SmoUvmGWsLZ4g8j
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1e9c9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cMKPt8sKVRzp0kMMbBYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX9w2KEBuaCkbO
 ZE4HaUmt+x2uPVMZd5wI5obYPJ6ykjn52natI/iXPls2LKa1dLt5XxF+ipCRr9GZwAKw2q8Roa9
 /mOkG48VxG3M8XIhybpoJ6l1KWPw8wE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfXxbpbQm9X1rk1
 snB1/o7gf0PrYskQimGe7NCMQ0X4ZthHeJ3Pa4lHC1+10A0Sy5n/vJlspmjfOsGEtQzE97S0T1x
 a/czmL77OqVSKZD/DN367YaXiFXmycsb++R/aV+AxwOx0Ny3+eepOGogYih6cMPTv18T+SF8O3t
 qEOd5d0TGs7RitzShb2XmyNnCFl3QL/DvBYKTZNwnCWZZNY6BHAp4oQmSZ5jMzhiIZ/GpIsZIei
 U0qVJNMlm/oFb7ffvwFz2u3nV6cjajybSgYjbR6QlbbxK3aLlMW6GoQfvlrH3D4fn9yTeo8qfE6
 BofxrFOxuJvlZzfRQVdSNPBJ/1hC7vZ//q9zGHAu8eb6YgKLkB2H6YfX1BGGvpEonD04GJxLGPY
 9pF5M/cdyFluLQ6W/+x35bx5BVVpHCRt0dpojAcMEyP89GJHH6tWntHatdJfnBc7rlnmEkestXC
 BVAmK/AtpchYBysGJHw==
X-Proofpoint-GUID: EOIVFvws3JSH-OxT0SmoUvmGWsLZ4g8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280049

Enable UFS for glymur-qcb board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f17181bfeadb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -697,3 +697,21 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_e0_2p4>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l12b_e0_1p14>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.34.1

