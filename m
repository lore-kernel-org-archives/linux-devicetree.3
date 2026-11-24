Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530583;
	b=ZnObOCVRSqg/y4qBrUSDMSIqbH0UOvKxHPOzJ4Zbq8e7OPLrHuWQj1RANxDyoHfHECC2
	 IpE/HkiM5luK+NgeYqx0iHPzckqxxGXfgAPob8yezqW/wHa0VqHI54nt/RsJYLOQ+zOOx
	 dFFlQfOZv3qA2HDT7rOT+ETh5UFYlD07TrwFEIzh5f7xLtBwVfI9xtnZY/oaqUVQNGt1J
	 osIVEvCKzUtfSLjcmz8oVFqMqDD8LzA53444Ompt4YwLyN23SRtVsRL7dEfUo6HUezz0O
	 +u+OkY6FSZ16Xv/IAXOUbMNu7A2gzpsbIIOhF+ka4tg3CsbQpJtsJZt+x02/FPzhcag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
	b=y3zA3g2X7NLh23KGiczcs5d2V+1l5c7xpGFGPiyoGsrX8Fq3xQib0eOxjiRkvBRF535R
	 jEmu1nBVK8kTsWtS+c/bJ7E+9MsGflNU0XzMH2xUwWtXEBqcbLI1EUCWewV3Cp6dDgB95
	 KU9Yx/BvzkP7W4w6bxDie3kBCjqA6DsX1n9l7bdAFf/z2w7DsMx6iRTZpZ/EZIJiiCH4H
	 Oiec28N0XcR7F946I5BzTPRLoA1YyQ4oFRn8UUzkpC5VOhk4Tu1Dsz9BXWIKBbauSkuyE
	 p8k7cW8RevIqMnS1Wc5gcNA0/Vfiw7uOPNg2LB1d5DPL0vlDOEJO/GUsaSrgbGByY3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5AjI1ya;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDJygbmu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2B2606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5AjI1ya;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDJygbmu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuhZP1291461
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=; b=P5AjI1yaHtygG2Vy
	K4A7EE51tYhDGAiplmjjtG5FmLKKjylOX85FOqmd7/ldvx7ycwIBhDCG8B2S182c
	t/GNirN5ET4HWNMUt/iEOtcAK3Z5CtAzv36Tp3XGtKTgqgLeefDzeSjmgsL6jLDR
	o1fqdwmZqDICXzN8AaDH2Ye5hrXTzbE9y+HNiomQLVJB7w24LiX/4K2WpF7V+cuI
	2rPrm/l3l8TNBu759BySPu4E4nS5YnrJ0YyVylxV7jmb4V2WujljOBYASEBi/48M
	TmzKwKMRBtzpTcH6i/F5qmArHpwICFu4bNaPhUD30tORSmhVsh4We43eznilIYmx
	L0tzIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrc8qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so441085785a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530581; x=1796135381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
        b=RDJygbmuIa8RLNGq8yWQSHy5XqYGe9B8zX3s5IyCA1EcObmvSuPhE/2t1F10M0mQzv
         gApMoR4d4eH6QwDk5qmVOLi14TbLpqhSyVcm4FCxhtoDYtEneqIBaeBnnFDmYfYeHrOT
         jTulyzDpiMPTpyoSaKAdkEhRksPrNT1zlujzvnulEeFkYeYYs5Tcij6lvSk850HMoAfI
         0nyy05TPgyZt2Gsd0M/MdDSknotBDWFZ9V7tFkyJqRYb8FxEDydG+R8mom+L4A1eTaB7
         P6sC6/DsvaGOgPdjs3MakxwHqbz9tc0FJ50l0soy4J/GIq9GD1ELP0wsvJO/Z+enSgdV
         9K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530581; x=1796135381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
        b=h8Dh7MZo2jEJGvRxZ1Xi3PQ1/u1wf+z67v4wOqz9q+gs0vDv4wzX5zpGcxxjYSi3t+
         ssOhcJ1EWJOmoE9Aw5EECugubgJBtP+k3hdS915iwx3DZjcJSLWws5MA9pLJg1uuyXit
         FokpGCuGPjIsV8sbVLrww9P9PnA11FN1NbTD5qyW/Ke5vfAtuhretUpRvn/74iUtoxjG
         BVnIghMUGVzppo6zcnq9maC6FtiJIecRHJpTVqNxpZlrKdX+fbOOIrTrkcxbJzSzpBnA
         e68sO6TPz5t9EwqkLrr3fqRC2OFf/5giIN7E7CcxasmSbNDKc+j8NSTkX1U7uVOjdcZ8
         GXJg==
X-Forwarded-Encrypted: i=1; AL+hErEzUNB1ygy1JZaxCJW5m8c5K1waPknfgfIso9XDDxTUvoeEaYYCUEc6gRQopTv3iSB6/aXpm0wTf9hL@vger.kernel.org
X-Gm-Message-State: APuU4Z/tlNIBqYqpQqS2anoiVBV9j0mNSCYRV1AfaQdG2Vqf4XqdwTlI
	m+rlD5odp+TcWGjiSfljEe4hpXcFO8Cf4S/W9YqwzFBZtwIr3P0c7c4det1OCaLXRcaZtXiGbiT
	+qZ1iJPmeKtjTty2oqgzalyogz8b0w43LEgFMEHvTELqQeshlTWaOcBtCyaV2cwRb
X-Gm-Gg: AZFdTZcwT6HFj8D9YcZf8AQ4KYotwBKzI7dvt71Cz3xCuAVQh3G08f5GgRaFEhm2Ll7
	DcJIBG53rR8OmTGGZ10MMe6TuI6H6ELqWuU+i/GVosP5qHEoPAeLy6Cw9f7UOInkInBc5801gDt
	TK/leeoFgu/xaqniFr9U+2bs3O4iT1lC/fjdYGWpGKZohkmg7lWWK7iX1uLxvqdl2/hLDe6YgPY
	uklHIF/QeKmSjxkfFeh8mLCjxqI4XQF1NyE4GwEf3xRHXmae+B00jgiqIyEmABxKkFAnDfhUcHw
	KfL7D6nVEkGQAWQHg7rfHyxk8RH3ZKWdT5hOinqLMfMCjJeoYxh+t9cuxI63cq3ciPgpM34NOaz
	jePm4QpMxGUPB6g42KgbuLgIIPfvxOeCU0bZ3BqbZE3jy4qknkFBw/tL3xq2zLjMB1HX8OhU9Nd
	iX7b87nwWz59G98T+rA4LnX7YKp5o9h3n0ZqQgYd2xm4QIqFg7ORYcvHf4O87lde8=
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2436813885a.81.1795530581009;
        Tue, 24 Nov 2026 06:29:41 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2436805885a.81.1795530580248;
        Tue, 24 Nov 2026 06:29:40 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:24 +0100
Subject: [PATCH 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
 function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLH3lnSsVsWM7ZJmdOj9UrSc8vTvxkJ3hf/pgHF1t5M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CEsBpNbQycOF8TWg6uYB8q2XtKY7VavZ88
 ByNtg1px7GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wyEGEAC3PHMigkehjMMkS0o02FkvL5CSj7Ilsf4pXY/iXJNpXz5N8pmawPatVKIGkDQIIEvJC6e
 U0ICUshNdQ5Fs6lDtNVOV8lmowctdt2PFCW8RDyOnPaRowCeeW3rKN6+GomDR0Do0qpCxwCjvIr
 zl9vYAPMsZtFhom6neN6oK9NhmW+7uGuQ+b4QOkv2VCyeLP8zoMl90O03/znhAnAUBkQEPM3VPs
 j16Ny5ESzND9WP+CVxaS04n7fmKEdoGItfTC9PE+Hw/R5rBPUkDQI5KrSsBgBzwHgFy/2N9SHgK
 /yqGwI89hNoea4Z2uKD9oFO4G4T6AHFaU+j6XO7YLwdx/P5zrxgUQQw7WLE4/ygQAQjG4ZZHkLf
 nvyriR1sc2ktiNk6ITD7heUL2w7O11wS2WiZn6Tzp250RdPuOEa2qLkSQi01rvCOCDpauepQwwI
 4XHpgxyInig6SoOQl1TgKwt4HaZChWDyh2a1rkHW9WpAsMaQfF9cHJbxkFfzaBGVBaA4dEsn+Qu
 wk6MxzlV+/JPiYYdDQFvskHo9z6wurf0D8hxx3hTMxKnzYxZlGQpz08oV/ls5f0Zv9W2W7EPWJb
 LmSPg00cC87KEyWbaf3+Q/GObgou4Y8wPu7/k9Pf6O+8UMRL4i1cmYvkDPqs91804Vxb3HXtuYf
 RbirVHwwDjd8Png==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzGL7dMaQ/rml
 lSnpHgPk8lnERHTUpVKyGW8hoIG4knwEkYCLk2RrtQfXAK8EgFokN5gX5pAbKn2FK1wf4Uk2QQ+
 FAqy4qItLkmImw63c0eVSDnXeXE7Xvs=
X-Proofpoint-ORIG-GUID: wP9GNgO7eFcVLjl_ll702BVYyJwOzvqh
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059f55 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rzi1cwwMUWT7pCUy_hIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX8gIif2xFPxby
 nXpO7rajlYKVY2pu2kKz0O3LSWHNgodbwGMhUzE9au5JdyWz0+TuspIediwKvYJAZqY4M3EY978
 /d/4SR+5lUbTdJRTQQqWCBoxkQeQpZEbAHCB7IljsS6KYPrs+ljMypAbmo2mjHMAD19VAsz52je
 WCOfhHFZhJ/PMnKFX7XvnX/dtxkdnjJ46gqyJAaEst7daH/PM7+GSUzY+qTvmDBMB2MScIRWnOX
 JRiGg6W2ffk8LZ2qK9B18xgm4an2nCAixRjKeF0AL+74GClajYNTtDb9Hh4RfqZ752d4qAfoblT
 qGgc8Txjf1eiltJ6LFynWeUkTgKG3PAFf4zQOfze4jc12fro1CRgWbn+1C6F1kj8UUwQrac/A9C
 v34mRg2GUN7d1cB80XRZGv7AKHvT20/lV6wo8jt9UOZYKKqbUIHCFkVAfw9qY1+vMOsdkRFIUSd
 7YWuri4nXit7gVoN/ww==
X-Proofpoint-GUID: wP9GNgO7eFcVLjl_ll702BVYyJwOzvqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the maili driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-maili.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
index b9ff0f4479410656cc73567ed494a1cfe25bb56b..5b75994134238a263856ea2c0337ac196867b767 100644
--- a/drivers/pinctrl/qcom/pinctrl-maili.c
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -1226,7 +1226,7 @@ static const struct pinfunction maili_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host2wlan_sol),

-- 
2.47.3

