Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898260;
	b=ncO1xHL6brgx1sesSqZqjDFMp31rIBPELH+ojWfI1nf03JXiFHMEoQASEHSusuWle/Mz
	 lM+TKKkYtHmOwu5BqSEa6x7SHSr8vopPgEHm8U8QiY5HYtvwfW6/WUfSIpLgjQUrqN28e
	 RCEHLs/0F23tx+RZBMSB01R4qpT0/O2MbNmM4naksIFrDVksAU6X8WMqTUNC5qQxWusR9
	 Zfu7tGmKmSVdHAlfnAq7fNfsJOVOx/0XFdN52wJyNHjlGO9DdKmdFKZ2Cq+P01tNsjJXp
	 ksC+5fteT65JWCdh3DSlNMnFtvALg0wkI+AIABZIYeflgGtHBfZ6w6wMbWzaYfooqeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
	b=eQOrve7H0kW/aqwEntMf47JDRR38M32oQexfoeR05TXh/NsaNV96g/GL8f/LUnNq5gfi
	 auPMIIWQGJhpT7zl9sZUFDM2sy1rjmO6tzkS0lJcoXNBrY8TWjHiJov5Mn+q6EskMUFVh
	 K2c1OILC4WOoKb6xEasSIUo0Y898x9jyF0sbjhQvsvCj+Et/EvTrSkyoQr//MmBpClxs3
	 5H21J0YVIQ4qOGA6dvkdnyQzIZae7uADFSl4CZbfiuk+eeDXzxCctnBqLfY8ob1bXN8Hz
	 4YIz1SV2yVri0q4d9IuWFlIKqtK/BHrkVkABAZLL2ZtevI3DFmKWtphaFWI4/aehGYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320CC60A2625
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320CC60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16LTO4172243
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=; b=QYyXW6bUTbcrcDDy
	7ohIzlCQ6Vsbe0dQN8fgBCEoiWRLCwoeNXH0awws9PjgHDTAO1kXxU1ThUeTiHur
	Kojc5pY2dxAtxrnu+yS1Z0t+G2YRgJFYKVWnTM7RmukUcmpG9y2Alnfsq2PKFImm
	LoSqFcG/+niGmH/BcStLHvKwaWwmfyVq6TpAOqwvr4d+9fFnWZhiFkXLaH9DpS6f
	7fbIDdF6+MzC5tyDjM7uHtacGohUCVg/x60aPhvzM1ijL63IJ9PStXV6Qnv76Jeq
	XpXepZ6s4hMWPBJ64+OIfDygBA5tY1Y1wTeT2uHG9HICZl1JEnRfk5LWoZ1mQy3I
	4QNrzg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtmxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408769eec.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898259; x=1793503059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=bZ5MKTegq6nR69TiNuP8efnQ6by831nRuoWGBDinzj/w/7kNE+LhAVMWKQraJ3Cjgi
         6aUeF2gSWmkofC3mbwRcKmaVJOIOR5Fv2pLE/KdeGUQL8cmZE1vOzv89DoRejf8c3N14
         B2hzMruIt1kz7MMqWE+VpztgePE4sfok6nlmpOht8xvZ0CC9NhjNEWZR9gCqMXqbL96N
         TaHBl2k/wDupQcv71zD32JjMTh4STh/A0uM8c5+9oKCJDt18v5yc4fcwV3yESgabEinK
         57FXaUH9WH7NVlB29A7mv3Y6FdToWlZaws8sUhHwtITNM+DblVzMbYsN38K9EMD8xmwJ
         yUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898259; x=1793503059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=Hs+0aCB06oYoBBIyhX1ataGXtxU+tRmazsY6nahEep77Yomq+WKdnsnRv5w/ula8sC
         NK+SIZ3zCMVSgaigORrtPAwLr8LxMiKzOaF5miFAh2fe1lauLCANd5s/92DkWGVimsF+
         byaYWYj138bMi+JBMxPbc3Lq7ABMwl2WWRKSkXunFdVXYu7RyGD0yKO22W8AfP6lK5ce
         3iHEF6qT70BWwNtfxvCOAtbB1xwArEwQn+KY+OK1KJ7ywoIQ/MUN1a5FRRg8Nrg13ZVB
         C9yupfBstoInn2RkBrra674Wf0OuKxumbOQgJw2iUxPsJqVPBFDN91v6JbsyHCBiwxQ5
         AwTA==
X-Forwarded-Encrypted: i=1; AKwUvBwTNcByMTqTWO/UY4vMCyjWR24H+Shq+hq5fZobOAwjyRmB4G9PuznneGd5OFCZdwqU7CMDENvt1M6L@vger.kernel.org
X-Gm-Message-State: AFq9FYJjhyug349Chs6eKVH3WbwJHy5c5b3B2bUsrOlEynCekp5A2q8W
	Uu2BSfCvlyasP73jJy1sXmh/oxDWBHypGnSWnyFus7WjfyDYo849Dp+c+MzGXjKdjft8RCUcs9v
	uKwE6z+wnl9iJY7qESq3YDuV+wP6Kausg5SN7CxD4WyhtQXuZcOb6xWO6C6fq8/DF
X-Gm-Gg: AYBFou2o/LAQBisUZ00zfP+PGEqZnAxSOVG8IAkh1o7QA3opM5Lqy1mTiTRxG2sLKtx
	zcV19eMIrrB2Kt8eKNfXmQDrit5bfDwOre4awAmqcmpt/QmT9OmD+0gJGxcHsRRsajtJrr6XdFW
	AlsnCZB9xXRHhYe3EVladQWawddy4SRIq0mPYttsj6aJfb8jur8c/sBwoJbTLu8D3jre0SEToil
	h2OCUwI3NMr859vC7tw1NYtxsacTwCt+OwDxd089f/QWUQH2Lfi5lOTHHd4vkY4Rn+dWejwgslu
	znLFcnFv92QzRIpcqN+28Fopl1ok0ww7RSknmtlclKIcpntIDY07zSgeBaPhzqFda1js2ziArtn
	NURBzfowU0STRORm4VjhNdWKscxUwDdYQ0K2QC0MafAyCipQgb3mvxFoG6lpeRYR8dF0SbN2lN8
	itdsdO3N9HLg==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537512eec.6.1792898258951;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537473eec.6.1792898258482;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:32 -0700
Subject: [PATCH v22 13/14] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261024-kaanapali-camss-v22-13-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX4euCxT19qKK5
 AwimJVOI2T/+APjDbCwJj0P+MZaD0dmjtOUzzLItU7qb2SEhuFW51HFVQkGHggiJOvTuE92YB3I
 oFvPb3qqYhom7kGfWsWKyI/KcKihd3I=
X-Proofpoint-GUID: xeh79Z3GormNOu1zA3u4-Jxp0LTPuDkx
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add74d3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX9Y4BnJdoIC92
 1FqdSXpZB8jadEXdMsuHisu66j8BbRIBKGRFOZcr1h2MSizl+RxE7SbndTpuSnKN7PzJwZLi4Mg
 MdBH8qWIS9JlZnyaNoOrN3jbhbwOfEL+0hAyr7+luaEx5ZEf9H05T1PtvJqqEW9dYA+YRtLkoLf
 3zWr5w/eKDuDR8EmaP0zYivGKmMuVksgsYfg/qVTjFeE5+EfOq/gr8Q8+ZClidSsDYs0Tysz7wa
 FdfAvBMKEsnhpUJZHntn89rEiiTj5Mpza/zztnj58J9qtuo5ADlCxI7jOxqlly3HexBjUpAuIP8
 2NafqwGmzGcc8Ee6o2jjkIvHJp30Ur3myDvYni40gYTCLfHmPFKHTp57MjlJiENGbUggk1R1LSh
 qidnlPQW+XGIJzR6SQ8Ox/KXcy3SAnZ8KLY56KN80JMuBzapMNvyWKwdHtD5PfcXxzlymPD6Si1
 wwenO5mkOBbMJOAs/cA==
X-Proofpoint-ORIG-GUID: xeh79Z3GormNOu1zA3u4-Jxp0LTPuDkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 86dc1400a25e..e94fa2ba3dad 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4645,6 +4645,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

