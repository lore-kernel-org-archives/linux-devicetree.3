Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530580;
	b=laEw3WLuEm5KeYc4UOlpEfu5kCyhiLD/qRrxx3ae3JoCNE3S0fWFCJYmefidyiYW6Qfh
	 FoaFJiPexc2rbCgG3lMjiyEH68wqVuDe/2quWFkSbh2IprwpRPKA+x8xDc3A2kaNXH7Qt
	 ZqRQ85RbBTFHZg764UZR2POXscOEfVHwabg2JpiXvalXa9AwPf81Z5uB51LB/REpXmp15
	 ouMGV+ayVXhqAhlQRsVzq5wBfglqP9HSgcOCPREvhD6qwLr+P/bHAZ1kIHXbmpRFimFqj
	 bmw8eQ5cdN7CUS9RepKKERSyHDJpnbL8JCRSI8htTj34Yi1oQzmhFT0/Ccv3Z89I/ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
	b=0uZqcLpipqrXV+LCiODd9W1uEApXBZEe0J9qgdEWEuKezRp+wbC3i3OSP9hyo0v8ARm/
	 HnYuH4VdcXzMBY4c5fGm6EbTNiviy7Sqvdib1jR798exuC7PJbDS69mFCrERYrZoZ/xTX
	 yzVqPxKJDcwdNBj9GXrsSa0Bqq3pIHfdSbVJ0zX/eMZ54++Cs7F4SAXHfmrwBQSWDZVCT
	 g6nAjKiH7vp7xU/0ows/hp1qVLMVp1JIt+n58NzmpFbJbiyCr4B0vKPBpc6GK/S/qa5br
	 Y/vdT02gxTf//LlszhDdNcYr7sUWAox7+Aht75cw0dq+gOeSJhqTjZmDvs4hT03koFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3nSwHwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO6sCouW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43D606A33F
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C43D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3nSwHwp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO6sCouW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuuuY749702
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=; b=C3nSwHwpXxUDTOlB
	Z85mhzPKE0SsE5aB3/HidBUKWmlKlr25LDxh9UKeXG2xMPj9jaPk1YM3kAjVC8/d
	9FJFnxjtN+O2rJ2FcLcBh/mChv8XKaCkoTfRpzotXZv20RFo1kYnBGKrVIdDuQOC
	vRLxW54aZyqRDNwvqETo3SYEhoVmPHlVDQaDe5fFyYbwfdnf5ipw1PNkewahRVsM
	haIL8uRD3dh3wB2hFx5SpPrR6uzxwgq+kAbdmzTwcdPSFz2vgY7OEiqMoxISninF
	A1/FAk00cGp4qqNSh543qm7RgWXkhEu1Hj1V+8XBP00gRvXHGc5ACW9eI+2whnKH
	3tfHPQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb393m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:39 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b3ad0823c3so71238547b3.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530579; x=1796135379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
        b=NO6sCouWLZaP4DluoUnnxRT2XDWx9etvBkAEbbGDXRGEAx/FIV2+Ikn3rfMPkaDgwp
         p9P8jqNajGBHPeI9QGNes6OJm3i5BeWyklJ5/39VVrSv2KvKcvyYpsMAFQw6S2q17Us9
         41kDAuBIjrZLj301I5BuQDQIvqfiUvvn5L2PN8dnFUzgDQ8DTtkcpLrLIqrEvEvG4ZEU
         NF+zgmNKH+bY7uSgLoskYifXaODrfZ/lwudn1EA4+8xtdKuEeBE7AkHk6rNcBWl95eRd
         Ogrb3jnue+8veWKx13Xm9VCtF69w/PHRHEpTThY5YqAACSpOCoZkrSCFmnAiSGgtYkwX
         l8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530579; x=1796135379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
        b=DpUN3MIgsJtdM4PYr1TMWh/OTzaALT7k/nhwZq+Zug7fwrd5rwpuiQLNyWDTpra4oy
         bSh1SPqIAECucCvTeVa8oU/BR4cwSLc/ki9C6VDE/+wdrNGWvfjw0l0494uz92s/a5j8
         43CzMq5FIoZLfBXzZsi0Nja0n2JUt8x7jNqhYgAqhKZx4WMmA+bxO+J1oP+zy25hRyVT
         FcLMSYT9NjYR8brDCH0w+EmFoQ5GEgRKEziPgnTB7tzhQpwLkKmtYg6vvB94af4/dl1k
         EPuBoZn9RrsF1tnyhuWpJHBJVO2ddzOnhWYi6QFICfXYHshd48zla3uQyJs8wwHC6YTu
         xiRw==
X-Forwarded-Encrypted: i=1; AL+hErEz1DYNWd2FRPNf1BAxJY17ILXDwdPRuTczUrDNlxWlcYJ0MHUkKAm+32/QYblMgh3Qnzhdq//kP3ny@vger.kernel.org
X-Gm-Message-State: APuU4Z/CTyS/GJ4ML3I8IcaYRxWkHqvVUFuVUmBLsRl+Dd4JyaOW4kd3
	y5BFuZhWGfbuTOs/4MuGLN4W+Ie6n18j+vquhBRa+N3eLpH+hGfzMwIUl8IYtyFMSPM6nkbMcHa
	Uo01zlHy3tkamse+jscXga5b8l1QNlJjKbnRN11M1NOAlNYAly8UEmo0fWu2/3ejz
X-Gm-Gg: AZFdTZfISmPINj8wvFikWJuYwqPaPtsutIKN8/ms94Owt+01kF/DZN5slzxvJ5esLyR
	sixef56hg7bkPtBtyQMI+dxIWlyacChpz+SGvOVXjDvVDq3UwAioetEdGIb8t2XbarFhYqrVaMr
	4Fbjz/d2erT+tYYeFtpPuJkevqmy2rxr0zooQu3GAhhgjPB0kCXhU+ipzIv+qCEr+Gfp7I8YUDf
	RyTWrj20q5GFrRXWazrfIfU7SmcwKUoQoPatWUGJ5i2x5OUcu2i6wRSoMnfT2EPUfo4ml+EFUq5
	O267iQSXxDFmDunnE+KaYxbfg/kTpBTxFLIQmJXEnD3BbKGvuOL1JNhuyaMoCSvq4UYcDQCrnpS
	d/uCV/DTUDfdAR/WjH1muQ6qjY6H1RpykAzlojkDvwLYhdiJC06L6lkI6RE2FSuT4+gPfRKZUgc
	v4AgvcFU1dFaL9dBSDEuXtftr/oslpqx7AUQp7b6ZB2zZT2JXpExGzaGwkuCmbq/s=
X-Received: by 2002:a05:690c:a003:b0:8b5:5dd9:40ca with SMTP id 00721157ae682-8b55dd9415emr14058027b3.1.1795530578748;
        Tue, 24 Nov 2026 06:29:38 -0800 (PST)
X-Received: by 2002:a05:690c:a003:b0:8b5:5dd9:40ca with SMTP id 00721157ae682-8b55dd9415emr14057867b3.1.1795530578309;
        Tue, 24 Nov 2026 06:29:38 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:23 +0100
Subject: [PATCH 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d4nSpgsFUhJq5DuzeBsfwiXaQce1w0wxuso7kWB2flw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9C4f58IPpoMK+d+Ar5hpwv0SmQQ833MMtk9
 N11m6G44+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 w+CxD/9xq2Al0MTuM20HayP4V0JFM0INq/iryR53a4qal+8W1gxajf1vJSt1JcI+AQT/WfFZGA5
 StVbRo49yak2t3CASMR7YFvUGz3nA7dvvSzjYJa6kwCsrirVF9VTHo5FN4NypxBUQrKQ3bEUhoy
 ZApb4FkjRnJK1r4mKo2ub3bGXUS2/N3XSuMrD1OVA2QzJyy7iygowDNxxFKt8T9ztnCO1mwPMGC
 r5MlFeeW8Z0gPv/l9EZV1apFYBSwrJ2s1an+hYOdMMtIZ1uBE3cdLEmbO1P3NBL6gEJmG/wVyuG
 55632sVzG8PZOqawl1HWUezzrCd81cYUx7+WuFPvG9StWqbMKxCq56JmQb97O/WXK4AOQ9zj9tY
 uTPjiIFMAm1w7sM61Rl9SbZBA6ShFzdI0NW4cQR+b83QapHrKGEw2BvBV4kkvvfaUPw5qDmOXnX
 kBn9wU7NwVfE6xCTZLpsoWBKV9/MeimmREPOoIBEZBV/3eCgroDD+4YLaxK22XpjcH6ACXgOYSQ
 aQ3R3yFr7X7g+VRGZtH7bRhGG/Mvt/SOpcfcPypu1duemGdfJCvXUi1PJABhl2ZwuimGw/Ktwoq
 h+Y/WYuow+MBtVnplSM7F79G4X2i5RVXfYIGrwXpm/JwxKChfgXI6zSlcCRdhQNfbPYDlczcN7L
 97mcTaICaZQJSYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b059f53 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=eqPcoR3FCcofXUvmvEIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: 8MH52zugQzWEhNHmUpRtv8KFvgv4mlOa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3JGEbl9my4xi
 pG0Z72S0csgoooksG44PR0fxYgAzoJeKhMg70G8LPCtB7YDuP2TOUZjpkYb0TFsMESJEdhxhFIE
 02fE38rue0TceMkl0fA4IYA0lfNlTuU=
X-Proofpoint-GUID: 8MH52zugQzWEhNHmUpRtv8KFvgv4mlOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX/OGPbQvpwDLk
 NpuFXn05tJsD5qCeYRFQL7gnqkcnq8tuEo4dzhHM6dN76N9njK4MP6WIOmEMxP829vLYFYl+omi
 LAh1i6QWuZ9Bfwnm+rl5asYpMYOgEvpUXLPdYtS7lqhj7ivosB3/6TbaZ2FW8lG3+aQKOMBkCBa
 x847ceBMY8gQkySqEG16AxZ+KE4Yy5BjYgSPDU9yULHLmUR4INLo4I1hfwCVB1yHAMlmdApN4ro
 vmZSKC2YqGphCqg+Ye/jJXXLaEYw7sCIF+R4li1DNN577nXWAzfya4zZL5DLC70nszG22qaFiN/
 MZclbIWCHmbBnLWo2jvJUaMQwaj2uHaL/tldtn/vwW0C/P04CPJqUHQ7ykK4VJax3gqL2aHa4Jx
 wtQvsMzZ209Q085Or3IQFdJCJhptBjCM/ie2SYbe92a/C+e6YMml4+Mu6G6FDpcZtct+Xafpbmy
 od4ukPGg28cb8XFyDHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the kaanapali driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e9351e29d38ed90b093d6a23572805a5a41a950d..85ff2f165c004e2ba0337170f8289661d6080103 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -1374,7 +1374,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

