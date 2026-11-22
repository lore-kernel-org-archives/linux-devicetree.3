Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372959;
	b=NnQxc0Ag3edL2bqv5g3N9EB/71NYlw/N75NTGO4IcKg4s99tsQdgdVGBwnQ5H1dSKgdK
	 scwLhcg0gkrkF0EhVWjkURUbx7B5Fri7lUeDQOIuDDZaGgqzCAf+bDZGAvzx0eltTsHuf
	 MSxXbWUho0HagrCssKdKkunDuQGYQtXtitfAuGBKDxwzEiY7EdEnbkbCVU+GJV6c5fX+B
	 0gnCUmeW0jeSqJ13p7HVAVon2kShD/fguuhPaKmnf15o2Sjeva/ePUrasNLOQldCjz7an
	 8c6aWHvx4KX7GDYnEo8ItL5SLSK4ulr3YWAazvrCwQTxY5YJhjjTCYUwCrwqbhFUVPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=c3TUoGYJ7HISeaskmqU3Oup5It7VAHrMfUnbZ4H+DWw=;
	b=zXuNNvYO46zT29yz3YklOW5e36igU9AIBCuVx6Thnlk1dDwgMVbyH0nEhP4L/h0G91bC
	 wz7CeE4iwVfCKLkhtGvn3csuIqoRu08POzr6rNikJ4yzkuv7vKSy/ANNDEXjc2CwFS6L8
	 0QjksfDN4OQjMsyipsp2DI835NVyyj9AfkB47o/Qxi+548r30Oybbvsh9nRjgwXeLjBFy
	 u7j24Lt5fAt73HMJFiAdyku10bRoA19pUNJguh97X89N7E+/gpRjNrZFc/RWI+OKEOQs0
	 YB1vR9IgRYp1+tT4zdx3Wwm3OHaoN4dkUUSzzHM7mLsOGh9CFGOINePiLJhNdHXxwzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVAaFG35;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0FbXe70;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4200F606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4200F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVAaFG35;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0FbXe70
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUsiO3985617
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3TUoGYJ7HISeaskmqU3Oup5It7VAHrMfUnbZ4H+DWw=; b=iVAaFG35ZYuNn14E
	3VShQjzYDg1Q0kgP6WJsAvi8mmfhpzQcw1vYCN5PUsETOcV5b4Qj5FeWDLcl3Cv9
	mk7N+tkOU3hm3L1tZqPTCscg14JYbMirmLtIpRD59MkyXFWWMV2x5KOMkx0aAoA/
	A7ClgR7q4IPxSSSqQeDVYfru4juO2U1tx7uYe7htqDNkyFzWKlMxxxB+0NZQQf7P
	tn4GY0NkE13tF6BtxnFPBu0dqwBWE/v+IkoHx2CKgeBAG17V/dbHh+NVhxZ7lbex
	E/fLniq3bEkoa/fogDKyqYGGX/FbgZ1B4ZkM7MyHc99VmzWLtw4MB1Wva6UrBsUC
	dnAtbA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu40wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so2660136eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372956; x=1795977756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3TUoGYJ7HISeaskmqU3Oup5It7VAHrMfUnbZ4H+DWw=;
        b=c0FbXe70Q+kFNwQzJeCOwOowWY/LO463XvQTKmOmBFLM8R5wnLP/jUHk/IwBwTnl0l
         mwsrIKQv8SWSmNE2/rshJ6dMtGedXPlqZJ6CfJ73DAkko1Ev72tACzmbeOUp3bzhtgRD
         Oh34LZf51FLIQgDI/56nvpVaeLxKVccPZB46yBkYbHDjuBrpKrfgEEEkFDAKB9oKINqP
         Rsq6S3hHkNNiLbbt2RBfL8CdROrLusnItbrjSI6XINeLcd3HNi+jyVLFj6Xwp8KCs515
         TSDbAyGSR1GCgc/60DtwCjBwDN16Y48pLcH2fOPgK1BQX566OW+3OdxShDO1HOaLDPJH
         JFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372956; x=1795977756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3TUoGYJ7HISeaskmqU3Oup5It7VAHrMfUnbZ4H+DWw=;
        b=ZA4dc4l5wV7G5v+DEOVhawrGwcswIDHZaMoAzWcNSlzz3rkdiFwdUNGJJ/e9NuwiVM
         BiTL/+Io/Q2gfY8MRSlnRVxFg8QDWPiJ+BDAq86wl//HO5Kug1SodRClNWxzBDCyZgn2
         jMbScx8tb8Xvo2AixqbStYLiWMeRIJUhUSynFA99TH2HiTQeMtvrHCTFk65mOOzYGmQd
         e6/KJvENg6xI/EzC4RC1xJfU58h4TYaeaUkFfsJFhuMmms2dKLYZlKRMHCgxCIDiN+dU
         b4KMvuCJ9IXj+/x3FwCIP9iRdgecv4QvB/AZKXNEZYu+VbXIep4rIP+q839ZE4w/387W
         GXRA==
X-Forwarded-Encrypted: i=1; AL+hErEEnoLVdg7+fxfCnWSuk99UwXxmYXkaWB25QxsZInFkdUoIcH9uPaF105M2hk/rIqmUT9VDu04ECtcJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9p/6mE+ru2NXYZqraIqpM9fGYY1lz7uvrtXJllmDuLX8DL0kz7
	Rsag0U9bKqL6b9OqlNv4LmG4/yQTdKc+bqf6rG8+I+BVS/pmbJrv68cZ/xBKLPHCRVlewfIl6FV
	f69cGx9aA3jDm/oBxbhdld9SDXzvnYDjrD5qPrDzbCt5Fxzc8uo7Hyz/TDQJDjJD3
X-Gm-Gg: AZFdTZeSrSQvmbL/4cz6chqWljo4Om6l45HaHulHPOPG26813khCuTMRbhEEj65LuJz
	DlGHlhSMGVw727wn7AwAKZFMczCXAZnfhbYgLNfFD19Z6kP4vy1l71Tgf74wbJ59wWeAoAfHLrN
	+zBi00xznjGN5Bjbxdst6F1egOZ77bROXA2wJ1WjLa0aVqM9VifIt14nKE/FZIkd0+iE3PDGHdy
	cltVEmsh2HjfWudme8oiAA/vHcWXZ3m1BS3Gid0mS0bGVCqRscE/Q9D9yFJylr5lt7LntCPEQ+j
	qjJ0wK8NrjzWPk65DySnpB0096CRCPlYphGFo8LHf6ro+NjcmeNGO3EWQuy/Kz/IyeiPvNm9WGO
	K043Rw6ovbrQ0QnOMskhd3yeJfGIdILzs+b4cYZ/GYbBT3dh9HW/fmgG29xkwNMWKUsWhCuuP+K
	JmIQqvmulK9w==
X-Received: by 2002:a05:693c:890a:b0:386:a93c:a637 with SMTP id 5a478bee46e88-386a93cad9bmr2021271eec.34.1795372955147;
        Sun, 22 Nov 2026 10:42:35 -0800 (PST)
X-Received: by 2002:a05:693c:890a:b0:386:a93c:a637 with SMTP id 5a478bee46e88-386a93cad9bmr2021244eec.34.1795372954349;
        Sun, 22 Nov 2026 10:42:34 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:33 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:38 +0530
Subject: [PATCH v7 8/9] ASoC: qcom: lpass-tx-macro: Add support for Hawi
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
Message-Id: <20261123-add_shikra_support-v7-8-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=32028;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=9u9azvHiiMVVpaZ3ohztvc77M47DFWqg7H7fW5LFNnc=;
 b=MvXdNgtTfdVeKsdOyzjJXlxfolmz9sW3KW+h/dyrCTW2IadlVErSjyjLplY6Urh2mCRk2x2BA
 kBiahrGCyaWCqSSCodhVnIy+Umo5w4JR5ivdtPM5Yz3AFFAxkHQJthZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: Nn7zc8pOkOoidT1FD-Z9ofn1S3eBoEfl
X-Proofpoint-ORIG-GUID: Nn7zc8pOkOoidT1FD-Z9ofn1S3eBoEfl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX7oOgNOCUtimY
 8DzUlugkbSsnv57tBGcYY5Z189ayU4WXAK9XtZ8WTDoy5JVfjqda18r+suMUReJ9K1kCfxB0zwH
 Pgj+CciDm+yQxXscuAHbHtEprIrDMoXqKUVSQcVVzs3HkjjXxq38ozqQvvzPLHGmHSN5Yaqd99T
 u81tg8GqqE1whOT3Mk2pjr/f//SqZkkG4z2fNf03lZmzXH7TA7tfALzMDx78ZS80wl53+ia84Ew
 pMm0Y5AAgxxtoJEFVizUeYJm/pleyahyL95MQ+qQUsTDt7do13aSZCZ0dlNv8mYhdrTeBMxq1wc
 Tze/SuWjZrtZT6TJrwdm6FAeP9NIfe5+PLL7UhsJ18PLwMUdLk+k+TT9VNm8544tKyk65d4pCc8
 /IuyvAOYBFfOTWe/S9Y6NrWFz3uukC70hIAQ/TJEpU3j07vwjtAe0dH4zAKUb9ZSLhS1dIjbWz2
 8fiNHe6XY/pLFRcjAGA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03379d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KrMgExgf9dcUfBKOTL4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXxWKH3kIQCDwb
 3Kt8EJSAi+bVTZdCBEoK9EeKPHT7+mTKUaA9JzGa6zM/Fo5k7aSG9a6qq/D/kg9q/wWa1WUfPnu
 8kB0VnseOo52jf6ApzlnfiDK0d80ifo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi is based on the Bolero v4.0 TX macro. This version extends the
existing TX macro register layout with CFG2 port-select registers,
per-path CFG2 registers and an ADPT control block.

Add the v4.0 register defaults and extend the regmap accessors and
maximum register offset only for the v4.0 match data. Use REGCACHE_MAPLE
for the TX macro regmap since the register defaults are sparse and the
v4.0 layout extends the register range.

Bolero v4.0 also needs a different decimator mux enum. Move the common
TX DEC widgets out of the shared widget table and register exactly one
decimator widget table per version. This avoids duplicate TX DECn MUX
DAPM widgets while keeping the v4.0-specific enum and DAPM events.

Add the v4.0 SMIC, WSA and port-select mux widgets and routes, and
disable the ADPT block before enabling a decimator on v4.0 hardware.

Co-developed-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |   1 +
 sound/soc/codecs/lpass-tx-macro.c     | 576 +++++++++++++++++++++++++++++++++-
 2 files changed, 565 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 77933eb8c4d5..93d9b0ad165b 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -18,6 +18,7 @@ enum lpass_version {
 	LPASS_VER_9_2_0,
 	LPASS_VER_10_0_0,
 	LPASS_VER_11_0_0,
+	LPASS_VER_15_0_0,
 };
 
 enum lpass_codec_version {
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 6f2af4907cb8..6cc700db7d04 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -66,6 +67,14 @@
 #define CDC_TX_INP_MUX_ADC_MUX6_CFG1	(0x0134)
 #define CDC_TX_INP_MUX_ADC_MUX7_CFG0	(0x0138)
 #define CDC_TX_INP_MUX_ADC_MUX7_CFG1	(0x013C)
+#define CDC_TX_INP_MUX_ADC_MUX0_CFG2	(0x0140)
+#define CDC_TX_INP_MUX_ADC_MUX1_CFG2	(0x0144)
+#define CDC_TX_INP_MUX_ADC_MUX2_CFG2	(0x0148)
+#define CDC_TX_INP_MUX_ADC_MUX3_CFG2	(0x014C)
+#define CDC_TX_INP_MUX_ADC_MUX4_CFG2	(0x0150)
+#define CDC_TX_INP_MUX_ADC_MUX5_CFG2	(0x0154)
+#define CDC_TX_INP_MUX_ADC_MUX6_CFG2	(0x0158)
+#define CDC_TX_INP_MUX_ADC_MUX7_CFG2	(0x015C)
 #define CDC_TX_ANC0_CLK_RESET_CTL	(0x0200)
 #define CDC_TX_ANC0_MODE_1_CTL		(0x0204)
 #define CDC_TX_ANC0_MODE_2_CTL		(0x0208)
@@ -107,6 +116,17 @@
 #define CDC_TX0_TX_PATH_SEC5		(0x0424)
 #define CDC_TX0_TX_PATH_SEC6		(0x0428)
 #define CDC_TX0_TX_PATH_SEC7		(0x042C)
+#define CDC_TX0_TX_PATH_CFG2		(0x0430)
+#define CDC_TX1_TX_PATH_CFG2		(0x04B0)
+#define CDC_TX2_TX_PATH_CFG2		(0x0530)
+#define CDC_TX3_TX_PATH_CFG2		(0x05B0)
+#define CDC_TX4_TX_PATH_CFG2		(0x0630)
+#define CDC_TX5_TX_PATH_CFG2		(0x06B0)
+#define CDC_TX6_TX_PATH_CFG2		(0x0730)
+#define CDC_TX7_TX_PATH_CFG2		(0x07B0)
+#define CDC_ADPT0_ADPT_CTRL		(0x0800)
+#define CDC_TX_ADPT_CTRL_EN_MASK	GENMASK(6, 0)
+
 #define CDC_TX0_MBHC_CTL_EN_MASK	BIT(6)
 #define CDC_TX1_TX_PATH_CTL		(0x0480)
 #define CDC_TX1_TX_PATH_CFG0		(0x0484)
@@ -185,7 +205,8 @@
 #define CDC_TX7_TX_PATH_SEC4		(0x07A0)
 #define CDC_TX7_TX_PATH_SEC5		(0x07A4)
 #define CDC_TX7_TX_PATH_SEC6		(0x07A8)
-#define TX_MAX_OFFSET			(0x07A8)
+#define TX_MAX_OFFSET			(CDC_TX7_TX_PATH_SEC6)
+#define TX_4_0_MAX_OFFSET		(CDC_ADPT0_ADPT_CTRL)
 
 #define TX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -257,6 +278,9 @@ struct hpf_work {
 struct tx_macro_data {
 	unsigned int flags;
 	unsigned int ver;
+	bool has_adpt;
+	const struct snd_soc_dapm_widget *dec_widgets;
+	size_t dec_widgets_num;
 	const struct snd_soc_dapm_widget *extra_widgets;
 	size_t extra_widgets_num;
 	const struct snd_soc_dapm_route *extra_routes;
@@ -480,6 +504,26 @@ static struct reg_default tx_defaults[] = {
 	{ CDC_TX7_TX_PATH_SEC6, 0x00},
 };
 
+static const struct reg_default tx_4_0_defaults[] = {
+	{ CDC_TX_INP_MUX_ADC_MUX0_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX1_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX2_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX3_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX4_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX5_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX6_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX7_CFG2, 0x00},
+	{ CDC_TX0_TX_PATH_CFG2, 0x03},
+	{ CDC_TX1_TX_PATH_CFG2, 0x03},
+	{ CDC_TX2_TX_PATH_CFG2, 0x03},
+	{ CDC_TX3_TX_PATH_CFG2, 0x03},
+	{ CDC_TX4_TX_PATH_CFG2, 0x03},
+	{ CDC_TX5_TX_PATH_CFG2, 0x03},
+	{ CDC_TX6_TX_PATH_CFG2, 0x03},
+	{ CDC_TX7_TX_PATH_CFG2, 0x03},
+	{ CDC_ADPT0_ADPT_CTRL, 0x00},
+};
+
 static bool tx_is_volatile_register(struct device *dev, unsigned int reg)
 {
 	/* Update volatile list for tx/tx macros */
@@ -643,6 +687,32 @@ static bool tx_is_rw_register(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool tx_4_0_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_TX_INP_MUX_ADC_MUX0_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX1_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX2_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX3_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX4_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX5_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX6_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX7_CFG2:
+	case CDC_TX0_TX_PATH_CFG2:
+	case CDC_TX1_TX_PATH_CFG2:
+	case CDC_TX2_TX_PATH_CFG2:
+	case CDC_TX3_TX_PATH_CFG2:
+	case CDC_TX4_TX_PATH_CFG2:
+	case CDC_TX5_TX_PATH_CFG2:
+	case CDC_TX6_TX_PATH_CFG2:
+	case CDC_TX7_TX_PATH_CFG2:
+	case CDC_ADPT0_ADPT_CTRL:
+		return true;
+	default:
+		return tx_is_rw_register(dev, reg);
+	}
+}
+
 static const struct regmap_config tx_regmap_config = {
 	.name = "tx_macro",
 	.reg_bits = 16,
@@ -650,8 +720,7 @@ static const struct regmap_config tx_regmap_config = {
 	.reg_stride = 4,
 	.cache_type = REGCACHE_MAPLE,
 	.max_register = TX_MAX_OFFSET,
-	.reg_defaults = tx_defaults,
-	.num_reg_defaults = ARRAY_SIZE(tx_defaults),
+	/* .reg_defaults and .num_reg_defaults set in probe() */
 	.writeable_reg = tx_is_rw_register,
 	.volatile_reg = tx_is_volatile_register,
 	.readable_reg = tx_is_rw_register,
@@ -975,6 +1044,10 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		/* Disable the ADPT block before enabling the decimator */
+		if (tx->data->has_adpt)
+			snd_soc_component_write_field(component, CDC_ADPT0_ADPT_CTRL,
+						      CDC_TX_ADPT_CTRL_EN_MASK, 0x0);
 		adc_mux_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG1(decimator);
 		if (snd_soc_component_read(component, adc_mux_reg) & SWR_MIC) {
 			adc_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG0(decimator);
@@ -1502,6 +1575,17 @@ static const struct snd_soc_dapm_widget tx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("TX DMIC6"),
 	SND_SOC_DAPM_INPUT("TX DMIC7"),
 
+	SND_SOC_DAPM_SUPPLY_S("TX_MCLK", 0, SND_SOC_NOPM, 0, 0,
+			      tx_macro_mclk_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("TX_SWR_CLK", 0, SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("VA_SWR_CLK", 0, SND_SOC_NOPM, 0, 0,
+			      NULL, 0),
+};
+
+static const struct snd_soc_dapm_widget tx_macro_dec_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX_E("TX DEC0 MUX", SND_SOC_NOPM,
 			   TX_MACRO_DEC0, 0,
 			   &tx_dec0_mux, tx_macro_enable_dec,
@@ -1549,14 +1633,6 @@ static const struct snd_soc_dapm_widget tx_macro_dapm_widgets[] = {
 			   &tx_dec7_mux, tx_macro_enable_dec,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
-
-	SND_SOC_DAPM_SUPPLY_S("TX_MCLK", 0, SND_SOC_NOPM, 0, 0,
-	tx_macro_mclk_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
-
-	SND_SOC_DAPM_SUPPLY_S("TX_SWR_CLK", 0, SND_SOC_NOPM, 0, 0, NULL, 0),
-
-	SND_SOC_DAPM_SUPPLY_S("VA_SWR_CLK", 0, SND_SOC_NOPM, 0, 0,
-			NULL, 0),
 };
 
 static const struct snd_soc_dapm_route tx_audio_map[] = {
@@ -2073,6 +2149,418 @@ static const struct snd_soc_dapm_route tx_audio_map_v9_2[] = {
 	{"TX SMIC MUX7", "SWR_MIC11", "TX SWR_INPUT11"},
 };
 
+static const char * const adc_mux_text_v9_3[] = {
+	"MSM_DMIC", "SWR_MIC", "ANC_FB_TUNE1", "RX_SWR_MIC"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_dec0_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX0_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec1_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX1_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec2_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX2_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec3_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX3_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec4_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX4_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec5_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX5_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec6_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX6_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec7_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX7_CFG1,
+			0, adc_mux_text_v9_3);
+
+static const struct snd_kcontrol_new tx_dec0_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec0", tx_dec0_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec1_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec1", tx_dec1_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec2_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec2", tx_dec2_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec3_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec3", tx_dec3_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec4_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec4", tx_dec4_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec5_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec5", tx_dec5_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec6_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec6", tx_dec6_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec7_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec7", tx_dec7_enum_v9_3);
+
+static const char * const smic_mux_text_v9_3[] = {
+	"ZERO", "SWR_MIC0", "SWR_MIC1", "SWR_MIC2", "SWR_MIC3",
+	"SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7",
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_smic0_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic1_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic2_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic3_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic4_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX4_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic5_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX5_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic6_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX6_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic7_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX7_CFG0,
+			0, smic_mux_text_v9_3);
+
+static const struct snd_kcontrol_new tx_smic0_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic0",
+			tx_smic0_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic1_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic1",
+			tx_smic1_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic2_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic2",
+			tx_smic2_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic3_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic3",
+			tx_smic3_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic4_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic4",
+			tx_smic4_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic5_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic5",
+			tx_smic5_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic6_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic6",
+			tx_smic6_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic7_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic7",
+			tx_smic7_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+
+static const char * const tx_wsa_mux_text[] = {
+	"NO_WSA", "WSA1", "WSA2", "WSA3", "WSA4"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux0_enum, CDC_TX_INP_MUX_ADC_MUX0_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux1_enum, CDC_TX_INP_MUX_ADC_MUX1_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux2_enum, CDC_TX_INP_MUX_ADC_MUX2_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux3_enum, CDC_TX_INP_MUX_ADC_MUX3_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux4_enum, CDC_TX_INP_MUX_ADC_MUX4_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux5_enum, CDC_TX_INP_MUX_ADC_MUX5_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux6_enum, CDC_TX_INP_MUX_ADC_MUX6_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux7_enum, CDC_TX_INP_MUX_ADC_MUX7_CFG1,
+			4, tx_wsa_mux_text);
+
+static const struct snd_kcontrol_new tx_wsa_mux0_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux0", tx_wsa_mux0_enum);
+static const struct snd_kcontrol_new tx_wsa_mux1_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux1", tx_wsa_mux1_enum);
+static const struct snd_kcontrol_new tx_wsa_mux2_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux2", tx_wsa_mux2_enum);
+static const struct snd_kcontrol_new tx_wsa_mux3_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux3", tx_wsa_mux3_enum);
+static const struct snd_kcontrol_new tx_wsa_mux4_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux4", tx_wsa_mux4_enum);
+static const struct snd_kcontrol_new tx_wsa_mux5_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux5", tx_wsa_mux5_enum);
+static const struct snd_kcontrol_new tx_wsa_mux6_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux6", tx_wsa_mux6_enum);
+static const struct snd_kcontrol_new tx_wsa_mux7_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux7", tx_wsa_mux7_enum);
+
+static const char * const tx_psel_mux_text[] = {
+	"PORT0", "PORT1", "PORT2", "PORT3", "PORT4"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux0_enum, CDC_TX_INP_MUX_ADC_MUX0_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux1_enum, CDC_TX_INP_MUX_ADC_MUX1_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux2_enum, CDC_TX_INP_MUX_ADC_MUX2_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux3_enum, CDC_TX_INP_MUX_ADC_MUX3_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux4_enum, CDC_TX_INP_MUX_ADC_MUX4_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux5_enum, CDC_TX_INP_MUX_ADC_MUX5_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux6_enum, CDC_TX_INP_MUX_ADC_MUX6_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux7_enum, CDC_TX_INP_MUX_ADC_MUX7_CFG2,
+			0, tx_psel_mux_text);
+
+static const struct snd_kcontrol_new tx_psel_mux0_mux =
+	SOC_DAPM_ENUM("tx_psel_mux0", tx_psel_mux0_enum);
+static const struct snd_kcontrol_new tx_psel_mux1_mux =
+	SOC_DAPM_ENUM("tx_psel_mux1", tx_psel_mux1_enum);
+static const struct snd_kcontrol_new tx_psel_mux2_mux =
+	SOC_DAPM_ENUM("tx_psel_mux2", tx_psel_mux2_enum);
+static const struct snd_kcontrol_new tx_psel_mux3_mux =
+	SOC_DAPM_ENUM("tx_psel_mux3", tx_psel_mux3_enum);
+static const struct snd_kcontrol_new tx_psel_mux4_mux =
+	SOC_DAPM_ENUM("tx_psel_mux4", tx_psel_mux4_enum);
+static const struct snd_kcontrol_new tx_psel_mux5_mux =
+	SOC_DAPM_ENUM("tx_psel_mux5", tx_psel_mux5_enum);
+static const struct snd_kcontrol_new tx_psel_mux6_mux =
+	SOC_DAPM_ENUM("tx_psel_mux6", tx_psel_mux6_enum);
+static const struct snd_kcontrol_new tx_psel_mux7_mux =
+	SOC_DAPM_ENUM("tx_psel_mux7", tx_psel_mux7_enum);
+
+static const struct snd_soc_dapm_widget tx_macro_dec_dapm_widgets_v15[] = {
+	SND_SOC_DAPM_MUX_E("TX DEC0 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC0, 0,
+			   &tx_dec0_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC1 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC1, 0,
+			   &tx_dec1_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC2 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC2, 0,
+			   &tx_dec2_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC3 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC3, 0,
+			   &tx_dec3_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC4 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC4, 0,
+			   &tx_dec4_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC5 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC5, 0,
+			   &tx_dec5_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC6 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC6, 0,
+			   &tx_dec6_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC7 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC7, 0,
+			   &tx_dec7_mux_v9_3, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v15[] = {
+	SND_SOC_DAPM_MUX("TX SMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_smic0_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_smic1_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_smic2_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_smic3_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_smic4_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_smic5_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_smic6_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_smic7_mux_v9_3),
+
+	SND_SOC_DAPM_MUX("TX WSA MUX0", SND_SOC_NOPM, 0, 0, &tx_wsa_mux0_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX1", SND_SOC_NOPM, 0, 0, &tx_wsa_mux1_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX2", SND_SOC_NOPM, 0, 0, &tx_wsa_mux2_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX3", SND_SOC_NOPM, 0, 0, &tx_wsa_mux3_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX4", SND_SOC_NOPM, 0, 0, &tx_wsa_mux4_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX5", SND_SOC_NOPM, 0, 0, &tx_wsa_mux5_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX6", SND_SOC_NOPM, 0, 0, &tx_wsa_mux6_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX7", SND_SOC_NOPM, 0, 0, &tx_wsa_mux7_mux),
+
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX0", SND_SOC_NOPM, 0, 0, &tx_psel_mux0_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX1", SND_SOC_NOPM, 0, 0, &tx_psel_mux1_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX2", SND_SOC_NOPM, 0, 0, &tx_psel_mux2_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX3", SND_SOC_NOPM, 0, 0, &tx_psel_mux3_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX4", SND_SOC_NOPM, 0, 0, &tx_psel_mux4_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX5", SND_SOC_NOPM, 0, 0, &tx_psel_mux5_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX6", SND_SOC_NOPM, 0, 0, &tx_psel_mux6_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX7", SND_SOC_NOPM, 0, 0, &tx_psel_mux7_mux),
+
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT"),
+};
+
+static const struct snd_soc_dapm_route tx_audio_map_v15[] = {
+	/* DEC0 */
+	{"TX DEC0 MUX", "SWR_MIC", "TX SMIC MUX0"},
+	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX0", "SWR_MIC0", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC1", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC2", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC3", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC4", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC5", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC6", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC7", "TX WSA MUX0"},
+	{"TX WSA MUX0", "NO_WSA", "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA1",   "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA2",   "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA3",   "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA4",   "TX PORT SEL MUX0"},
+	{"TX PORT SEL MUX0", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC1 */
+	{"TX DEC1 MUX", "SWR_MIC", "TX SMIC MUX1"},
+	{"TX SMIC MUX1", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX1", "SWR_MIC0", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC1", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC2", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC3", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC4", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC5", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC6", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC7", "TX WSA MUX1"},
+	{"TX WSA MUX1", "NO_WSA", "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA1",   "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA2",   "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA3",   "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA4",   "TX PORT SEL MUX1"},
+	{"TX PORT SEL MUX1", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC2 */
+	{"TX DEC2 MUX", "SWR_MIC", "TX SMIC MUX2"},
+	{"TX SMIC MUX2", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX2", "SWR_MIC0", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC1", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC2", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC3", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC4", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC5", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC6", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC7", "TX WSA MUX2"},
+	{"TX WSA MUX2", "NO_WSA", "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA1",   "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA2",   "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA3",   "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA4",   "TX PORT SEL MUX2"},
+	{"TX PORT SEL MUX2", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC3 */
+	{"TX DEC3 MUX", "SWR_MIC", "TX SMIC MUX3"},
+	{"TX SMIC MUX3", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX3", "SWR_MIC0", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC1", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC2", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC3", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC4", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC5", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC6", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC7", "TX WSA MUX3"},
+	{"TX WSA MUX3", "NO_WSA", "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA1",   "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA2",   "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA3",   "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA4",   "TX PORT SEL MUX3"},
+	{"TX PORT SEL MUX3", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC4 */
+	{"TX DEC4 MUX", "SWR_MIC", "TX SMIC MUX4"},
+	{"TX SMIC MUX4", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX4", "SWR_MIC0", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC1", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC2", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC3", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC4", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC5", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC6", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC7", "TX WSA MUX4"},
+	{"TX WSA MUX4", "NO_WSA", "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA1",   "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA2",   "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA3",   "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA4",   "TX PORT SEL MUX4"},
+	{"TX PORT SEL MUX4", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC5 */
+	{"TX DEC5 MUX", "SWR_MIC", "TX SMIC MUX5"},
+	{"TX SMIC MUX5", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX5", "SWR_MIC0", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC1", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC2", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC3", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC4", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC5", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC6", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC7", "TX WSA MUX5"},
+	{"TX WSA MUX5", "NO_WSA", "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA1",   "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA2",   "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA3",   "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA4",   "TX PORT SEL MUX5"},
+	{"TX PORT SEL MUX5", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC6 */
+	{"TX DEC6 MUX", "SWR_MIC", "TX SMIC MUX6"},
+	{"TX SMIC MUX6", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX6", "SWR_MIC0", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC1", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC2", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC3", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC4", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC5", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC6", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC7", "TX WSA MUX6"},
+	{"TX WSA MUX6", "NO_WSA", "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA1",   "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA2",   "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA3",   "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA4",   "TX PORT SEL MUX6"},
+	{"TX PORT SEL MUX6", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC7 */
+	{"TX DEC7 MUX", "SWR_MIC", "TX SMIC MUX7"},
+	{"TX SMIC MUX7", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX7", "SWR_MIC0", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC1", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC2", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC3", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC4", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC5", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC6", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC7", "TX WSA MUX7"},
+	{"TX WSA MUX7", "NO_WSA", "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA1",   "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA2",   "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA3",   "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA4",   "TX PORT SEL MUX7"},
+	{"TX PORT SEL MUX7", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT4", "TX SWR_INPUT"},
+};
+
 static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("TX_DEC0 Volume",
 			  CDC_TX0_TX_VOL_CTL,
@@ -2131,8 +2619,21 @@ static int tx_macro_component_extend(struct snd_soc_component *comp)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(comp);
 	struct tx_macro *tx = snd_soc_component_get_drvdata(comp);
+	const struct snd_soc_dapm_widget *dec_widgets = tx_macro_dec_dapm_widgets;
+	size_t dec_widgets_num = ARRAY_SIZE(tx_macro_dec_dapm_widgets);
 	int ret;
 
+	if (tx->data->dec_widgets_num) {
+		dec_widgets = tx->data->dec_widgets;
+		dec_widgets_num = tx->data->dec_widgets_num;
+	}
+
+	ret = snd_soc_dapm_new_controls(dapm, dec_widgets, dec_widgets_num);
+	if (ret) {
+		dev_err(tx->dev, "failed to add decimator widgets: %d\n", ret);
+		return ret;
+	}
+
 	if (tx->data->extra_widgets_num) {
 		ret = snd_soc_dapm_new_controls(dapm, tx->data->extra_widgets,
 						tx->data->extra_widgets_num);
@@ -2296,6 +2797,9 @@ static int tx_macro_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct tx_macro *tx;
 	void __iomem *base;
+	struct reg_default *reg_defaults __free(kfree) = NULL;
+	struct regmap_config *reg_config __free(kfree) = NULL;
+	size_t def_count;
 	int ret, reg;
 
 	tx = devm_kzalloc_obj(dev, *tx);
@@ -2350,7 +2854,40 @@ static int tx_macro_probe(struct platform_device *pdev)
 		}
 	}
 
-	tx->regmap = devm_regmap_init_mmio(dev, base, &tx_regmap_config);
+	reg_config = kmemdup(&tx_regmap_config, sizeof(*reg_config), GFP_KERNEL);
+	if (!reg_config) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	reg_config->reg_defaults = tx_defaults;
+	reg_config->num_reg_defaults = ARRAY_SIZE(tx_defaults);
+
+	switch (tx->data->ver) {
+	case LPASS_VER_15_0_0:
+		def_count = ARRAY_SIZE(tx_defaults) + ARRAY_SIZE(tx_4_0_defaults);
+		reg_defaults = kmalloc_objs(*reg_defaults, def_count);
+		if (!reg_defaults) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		memcpy(&reg_defaults[0], tx_defaults, sizeof(tx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(tx_defaults)],
+		       tx_4_0_defaults, sizeof(tx_4_0_defaults));
+		regcache_sort_defaults(reg_defaults, def_count);
+
+		reg_config->max_register = TX_4_0_MAX_OFFSET;
+		reg_config->reg_defaults = reg_defaults;
+		reg_config->num_reg_defaults = def_count;
+		reg_config->writeable_reg = tx_4_0_is_rw_register;
+		reg_config->readable_reg = tx_4_0_is_rw_register;
+		break;
+	default:
+		break;
+	}
+
+	tx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
 	if (IS_ERR(tx->regmap)) {
 		ret = PTR_ERR(tx->regmap);
 		goto err;
@@ -2506,6 +3043,18 @@ static const struct tx_macro_data lpass_ver_11 = {
 	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
 };
 
+static const struct tx_macro_data lpass_ver_15 = {
+	.flags			= LPASS_MACRO_FLAG_RESET_SWR,
+	.ver			= LPASS_VER_15_0_0,
+	.has_adpt		= true,
+	.dec_widgets		= tx_macro_dec_dapm_widgets_v15,
+	.dec_widgets_num	= ARRAY_SIZE(tx_macro_dec_dapm_widgets_v15),
+	.extra_widgets		= tx_macro_dapm_widgets_v15,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v15),
+	.extra_routes		= tx_audio_map_v15,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v15),
+};
+
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
 		/*
@@ -2528,6 +3077,9 @@ static const struct of_device_id tx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sm8550-lpass-tx-macro",
 		.data = &lpass_ver_11,
+	}, {
+		.compatible = "qcom,hawi-lpass-tx-macro",
+		.data = &lpass_ver_15,
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-tx-macro",
 		/*

-- 
2.34.1

