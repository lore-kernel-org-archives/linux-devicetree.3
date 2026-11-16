Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819649;
	b=RaSC8/3RQF6wBtlQXGujjegrA7fzzcsaiTuHZUeUGZjXJ7Ziysja21lUknBRdfdF/Jt4
	 QAN166s2Fig+UcfAhlSYrK6jYQmib2zRDLHN8jdULRsR/R9Bip9lcHG41MjFo3o89JJVr
	 CjxuM+A3tTzdrk9pccMC2sKY8oZukYYkgwdLaj7yYjQRuQwgBugpm/0RFGyWDflRhxRVJ
	 NIJMUbpHHbDmun6FDS1+9Ppeg4aCPA8g+LdgjsFWl36OmWOozuWxJzZXXxwpT90Uyg7eZ
	 UWsWHdAVanLZ2ziDurisRUJKVuw/44dQSo34WNpgCFt/QkMU+TFOEOcdf8SSc2GyCYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
	b=TRamNm9CjSffa7kGG4550jbUAho0kScXrwNjxjsASyvlCoOriK0wek1q8TQiEe7ZeT2O
	 1u0LJOGus47W0YEN3/sDiGheKwtToG24nAxsqp7FGtGK0iulCPFy4kaMCm1sc6QzxMZ5m
	 0fd0el0M+evFhb6x6xMEnpJ7x+ttxvwSEfgv9ZW/jcxqceI8Mex99NDN+NUVAfqi09MNv
	 rYRPDhBiajpfkIB+yeb6lwWzPKHl0UN2w6FWlPxi7GQBRXDzy8UEr1GvCMp/GUXQErYfW
	 L7erpGtXLO2V2PTmp83HguaSoV4vZ4XzGHeuQhSP5xOui5/NYLDe8ZJUuK148rP7/Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuBHWLza;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMfyRuuf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12EA606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuBHWLza;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMfyRuuf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7f7ue967103
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=; b=cuBHWLzab3S9cxil
	GCu+NrSE5S3uRepdZc7HL4WnbmISgetSMWzwctddIkA5FAcrvkOI3iX1eoKoXSd2
	g7uzdgCDkWaTG0YTXkfRpXF0UBUdx0bDhsqraqY6gjMpzPy3giTeA7y/OEhgswcL
	nwsM31/sMC1vgmjY4PcDa5s9zcSDkd9zJa0IdcoSzOjyFOi3ggnMd2rEBteBacm5
	iFuY7YRF2nNR66aJosdJQx5zm3y7qGEWtBauiyXvJ8I4WbUMbYS0CrriWfUaIjCt
	BtSGNICVZeL5FsqvRPo6j9fVLjsnEnDCXLcbT2E+IWI1OzauOVyvVodQi1btnuUA
	BPbejw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk25ph7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:00:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so2865271a91.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794819647; x=1795424447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
        b=dMfyRuufJHLH5ntW7Dhy/WqrbG/w6yhOEwxWuoBirjBIHWUwDbsiF1THECRG7+jx0V
         8mjKmFgRguCoe5ILsZufW+D/r8C8ts5u0lztgTsx02ruTbReha0zRV7BEI9j8fWlOclP
         pb9CgbLp6jugPcWZtZjf7agQg+LGtR7Z80K+6Ff9QgX0riW0d1etkLu9X4fcTUnTv/Do
         ak5loPX3+uBEv2NP0IVYVxCAfT8meTRKmL3LfPU5BkLRBjMO4OiUsmQibbyVGnPgSwGN
         eCZBXE70Wv9lQoG5zX0WbOOBzsRbhzcYNZTbI0yZQdcCzMgnHG8+5ZaQAYmK1s5X3sah
         vl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819647; x=1795424447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
        b=MO/vysNQTgXpglToQ0nS61RzRvesh7bskg4AKBi8hqNbFkKDrLUdydEZOrlaqiheLF
         vx57o4CdV/HHYMbEZO/Rnqt5z/s+g8TJNeTeSO+lrgSR4yNc4uLjxw65Bf1N3UzxsCTW
         xQYl3SV17R75tIAwy74wCzcJmCHVOBiZJZvSYDHmdsT3EXlSHVh9pmVtIOb6d6Zkulwk
         MVVgcWVSRXDk48bxZM2XjeFc0Ad/SZUtfx/i/pyfp+VR5sA/o2PbtLFPY+Vob8g4pytf
         Bum6Y7rezahuqd7v4ZpKKI5LLwW9bDikB66ebEW5m33g2c5oWUtUHpDy6kjp2WZDPXUk
         EYrw==
X-Forwarded-Encrypted: i=1; AL+hErFV9GtGVahaxHZ9AO+65s5BF1PEx2E92WXNLnu64od5sVxBUEbO5VVlB1sdp/4SBlCvEpccWCA+jR5E@vger.kernel.org
X-Gm-Message-State: APuU4Z9uqcKWY+4YKRfRFIuiaouCuOMh+ZCMEfRvUfZaFcQsRNjHH/wc
	mXDJlCEsrG9E5b8XEkpWOn74emos7AZNtRmnNRy0z0ImkKFFEB/1uuOpV+1rrca1Ooe+TcFS4Rf
	Ae6CUg5QHYyNHMjpCK99cHfXQKhBEEvnPCxPOlfxvmYG+slHqCFZR+iGkxfDc2MZQ
X-Gm-Gg: AZFdTZdwnYKAw3qHmbYvQzP4dMEkvHKBG05l+qEF/651kI3RamcTOvmXEt6n87WVPHr
	UyVSkcuyC9+JqtHIuDmhoyFJdEQKJ+Is7taY+BcovYHxC7phd31YDGnpKMCLLcT1vt3b65OQx3e
	SAmqS7IS4xifNvGI7AhyYkQszX02I8tHu99TVNImt4T7hHlSbQdDPsYPPOPGpmmC73mkWGSII0a
	Aqe1XCHUA90dt+LhgogiyZ/t+mrbL+2mrCKyNPbMMSHqzULsWrpLkgHGID8/gcPtnfOkEIEpS9C
	ZFwfajz4R9VQpu3jqtpkcZqw2D0LqT9FV35g7FuChMN42JT5a5V4t0kePKxtu60QaTEr2RUSMiK
	O2kT6rae0YUm5VvA4mg3aKjqBsiDAdjbrey1LmWcsOpLpPAuuMUDgrq1d1ZjcAmyiuRghorCGZj
	dzyoJMxgY=
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr9345814a91.16.1794819646660;
        Mon, 16 Nov 2026 01:00:46 -0800 (PST)
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr9345778a91.16.1794819646038;
        Mon, 16 Nov 2026 01:00:46 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm15916632a91.7.2026.11.16.01.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:45 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:29:46 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
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
Message-Id: <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 6AOBYZotwsOoggWDWHr_dc5sNzsI472H
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afac63f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=edzx39f0doCTOIfZxx8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX61GS+CbRHf5c
 5LQgps/4TYLlm03qUZ8WRYfhiQN9i6WBgS5A5+U739ugxV10MDttyXPtbVTbPB3dlSiOpk+bwU+
 KAWyB3kTZrSSzZQeWKD3/pJvOYos5DCE1hcLG7lHzf9U2cCXtcXYfUN8NBul8aEM4WhGP2+u5aM
 RNL+2ZwjMDn8KwfS3nP2jczoY63fdKHlcj7SREZBitpNR1YoPnYvdKkWILIFqK+l1aXIjRgaak4
 nOD07u5cENJsQ1/Z68DHS0YmzfDc+xbaXGGLH9wVW2x4HYF+M55sAMPkJNrVmqDSeNovNdo9CK9
 6o1HSL7Zx5jBZ5GSPe82y3Vyn9/LgwSwgoT8W0t8NOrB1U95wea7Vgh9ufPSZ/WckUq6/iAx8Qj
 5Bmpl9uwXWXzr2/gDfydRTIQtArR3lh4gTdjMDrpAh8fVY1FPcNo2O6xMAH6Pg/WYTItf5v/85Z
 yapTBZCZha/l/2T7e5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX9yuY3xerSfEe
 8eLNgBBcfrHK4s+0tvAo9c8I4O23/8aZLwXT8Y/gPrZ+MHUYuEuWYyZpxH0Ytl8LLgIWnlPm1/e
 jsuFufGMYJg37wa4/GTTTC8oLeEzvhM=
X-Proofpoint-GUID: 6AOBYZotwsOoggWDWHr_dc5sNzsI472H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160035

Shikra QCE requires an explicit core clock, which is missing from the
current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
and specify core clock to match updated binding description.
The crypto interconnect path is already described by SCM node, which
votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
the QCE node.

Cryptobam is controlled remotely and its clocks are therefore managed by
remote crypto subsystem.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..d5f0ef863173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1208,7 +1208,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1219,9 +1219,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

