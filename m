Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280986;
	b=ccqf2cF10U9mJO5+5O5u886UHqKCl/P3JbUo9cLptZx3dbQqK2zumqt11gBr80QEliTm
	 +Q2dbfYXQzu++ySZEpzrDkpdAeIOkac7je8ykhAoDVtX+nFC9ZQD/KVkBaWJKRXfnNRAp
	 k4ExViRYWo153mDi2jrtbmnlUuhwv/33wmrfc4Iz3GKc2quIL8DeKg53Witxu69J1A4yH
	 Co55uTrnXyEdUdCmACXPmZqJkJ+Sd7s1D2rzeupZlMZwKYmw/OI69isW5VrZP1eciz0AO
	 rPUvKYTIfEeLwYqdwN/Ugbtg0lVSHpAz0V3TFPoaEIrumEo1Slt5pVeHHHKL9rXZV4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=YRksdkfsLDUoWMdMUObKbwDG6SowfpD8B/OK/+OvBMWPYVvDDheRfXd64jK8Eh+sTgJY
	 eHA/5E1wwmdTwBhJZ611SDiBM/zTsb3Kt2kh+aS6JVlAQJei6sznm1L+icDEcSNdm/g4w
	 fPKW7n9ZuWAF6TGNHFr6eN6X453BLnCpUiMmA2CCe0UJ6NJiuCvhzWyQ2XCsGgwhCFTY+
	 yq7SuM+Nn14nOFn541UqMVl7xKrJEieGUqjTISt/+gfJh9s21Ke3JA+faKJAaqkTTkkzp
	 Dbu2wwxlMYz4+9r9hb1VZzFf3mi7tcS0tpBvXodwlWkRvVqf/DcUytAC/6a1ZrZs8aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gH/pCXsw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGUDEu+y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81126606A32E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81126606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gH/pCXsw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGUDEu+y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA2q4TH508882
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=gH/pCXswSSJ3EuSh
	KQA7b3xmVoM3LnWBCO0vxhLXjren049L0iqemNc18vZnERv0nDAzk/c7vfuOTguD
	7qXtvMAotyfyVzUOM1mtvSsjI7FaUVUGfMP2IxvNdtdiJkZFCH3ljJkiJeD2g+CG
	4DPsidwZi8sY+l6/gEpO5ZKJlnNrnKM2DogtMtdzS7nKtMhAXnA+M6bwU9Jf2csF
	bmH/yjuxJyZ6G0tQfB5B+4DT3rtzUp5l693QmxdGtbBdudVa7DPfusELcFKNd2vt
	t9XSQMNkv7HYJ/svN5owesKOu+fevgq57XWteGgiBDU5nlWb2udEM8xDhy/nW57Y
	aSgDwg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv483nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:23:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so1411071a12.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280985; x=1794885785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=MGUDEu+yHmx7Z9Ep4Wj6oh4YeyQYoRR/eG2C3IJxu9+TzxPtyyg/VfOTpEOR3rhAzl
         xMcyKo/8VGn5gg5qcMPy0lhCMU6Q3QKbIA3xwGPD0IcpWFsVOv1oqp6IkrBpAbgxRcrZ
         mGwy8zCA07XI3D/jzMRMEyiLU+YY1lbHdz5EyQ/1pez6sfZMhbjwguY9xuHfJbslPwTz
         6xJ88L8TgMpmt4l2cZMSPaxLD5e8yTQEW54+V4/4YEoIPIc7mBl+3M7saqHy4AiG/8eA
         JdZN2Fn0sA46djv3uUCaL+RhEKgY9wdu20AA46H6pApERdUklQ/VJ09oEkEVH7y1jp2A
         r57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280985; x=1794885785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=cIprcZExAByKpGrVoub6ja6mW8pGFsH7hh1URfVKQiJig4H+K2guM5Rs8uOMUglfPR
         rQfNQwkSew6AVEEgRELiW472L3W+NUdP07SoOOiwshPXkZLpD0adbj/jgBS83vZgQrYA
         Lc02SbaEEb+VENEwDfZbPeeA55tNyozF58EYK1XM68nkJg80uFdzZc/IaXcsjwlrv2GI
         cEZgsMqpTB8PU8P74v9mvjZOv7za+KLtH1fznzIsO+yA+xbLHL+89ZBs9vxXlA53U6b5
         0YqRlEKxL6FUF8thegQ7WToHzh/vQWfyoJoEA2FuHZrXkNAVBVD897Fw1Pxk0uN4tO45
         2BLA==
X-Forwarded-Encrypted: i=1; AL+hErFd3LzSZVXId2WEX2ETQ/kohBwDhabiKN8iYrBgHyRTuMhHLTbr1dZupODMEVC024z2EdDiGLNxQBvL@vger.kernel.org
X-Gm-Message-State: APuU4Z8l6fyBwxD6TeZixlaNHaoxtI388J5DcQNJAefxcggti0nnEJmc
	ujTMda33ZqI9akUHXX+4u/k+BVr4kOjxXt1xgyk+qmTc76GPkf8H05tYy42YH0Cm+HU8Id5cJGq
	gG4vSYgOtqCsh4nTcgIYTP42BG2LfNVqHFrXlkYtYYbtvWpvTp29diWRn8PZuAwaY
X-Gm-Gg: AYBFou0VMR2RToDF9GeP9IhIrxjPsjftG+IrnG7GPmIqBaVBiSdFL8iPelX4wkRBNyb
	wxShMcE6TsrHpF6A9TLQ6Wv0f9gUMl9MmoKOVoc5tPl8rdaiT8XHaWdzSWan/uh4E18Nm/ihiLB
	uDXH/YDgaxzuj2GylZkq/Qeik7Z/dtwLjztssc1E7ymy7vlLxWoY668xcDvxs9GNL4b6v0T6EIT
	P9EEKEjlEzob5tFAkS3Ov1n1n+7NFaIKgaBfrT/t5nO7t8aqq6Jf+CoMDp9tB89zre7ndu+p6+x
	hlYU39OoazBeG0p+pGIvrWPQ+AWfA1x2n+6r8noZBZVpBHV7WbLrBetekti8kXHS5sGScHWAvWM
	JfIOByQgaWdA9A/+uCgTUwPKmFs0KEZm4ODDSe3g11lLRZpGPeAAcwPAcnF8S4auU/cqTKLlWBp
	/lN+IB0JmAuWO6HLkZNarwiH7njpBtcUhPgyzc
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493521a91.61.1794280985147;
        Mon, 09 Nov 2026 19:23:05 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493498a91.61.1794280984677;
        Mon, 09 Nov 2026 19:23:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:23:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:30 +0800
Subject: [PATCH v22 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-8-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=AMiBCcVxGxfSjuuyQmf1WPtk0fETzfBhVgaDOfLDfYDsgz+Dw9fHYx+UHgz5+Z8gvv0CsjGGt
 t6hZrFaPbTdCOSKabsn+yIYX+kMPuUhaAAxVzjIfw3rqbrmcJPjBdQW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX6NhY6Fse96Ra
 nKMLroiGY7vvdsyyNBGjrb7T96UJDCHZcp128/C/DS4UwWHZ9FrDNlfhb0+AE068pEuRfWd+ezG
 FIghVk8BqDF/BiXLRfSwcMIKxB3EssM=
X-Proofpoint-ORIG-GUID: ZeDadokUzE_58ob2jVXUSbpAZbQbSeSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXxyMScHjSOcyO
 iB9Np5qScgiCMjMLL44VILvahv6ZHSz8K0i7n1RxKVtKhIjeOpDJnKSTV6k3eTRi2wRqsBKuB57
 pl4Ry3LT4PMpI+OfsIsPJAPlVVvTrN+tWqPEVbh+D+shDf7RLs2Et9argvz8MwQesBbUeRIISvC
 DgS84KsTyMZ+xhHImWcBgKWsCk6L2SU4TPeLuBeuIc07vkz+s+3EZKBtnj4vQRos9DNkgVZ/zA2
 9b91tJcHK9kaxSiwmuZlzPPvLqitJK5fOJpswwPHuFQc/Ezrx55FcmIJSkZVfHilzJDjRvven1p
 VSxF/fkE4dBiUJDg98mxdw2Jqv8GyB2lwruwKxxQhYTNR4k6yU7w6Q6yLZVONW3H04G/0CrQVZ9
 F+TQ7tenV21Jnkebx+h1ixzc3SNhnjtWrj63N5XN7V0AjzLP/E926bPUQr7SpNn2yW2xBn98Vdj
 GmGg17ZeNK7+rT54qfw==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af28e19 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ZeDadokUzE_58ob2jVXUSbpAZbQbSeSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

