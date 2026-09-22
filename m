Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95716526AB0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063527; cv=none; b=D3gUbeHbh9OkHKZAYhpPumWbXdB3SZcaqg7C14YNJbCqj7uiaMr6EV14dxgMENKVhaGcRAbR/hSjFke5g3brfLvl2qCSmhTC8YDiW3S21nPQDo6yNwwJt/iOCkGIiV7vyypUVmmXd6Xd/LWxTLvHJhDtJonS7Qz+eLJAMX6igJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063527; c=relaxed/simple;
	bh=38zsE10IUIg1w/H8v2oc5p6m0CLDmimV17cgjbcoE/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvdg3zMpkyZx9ARNag2dJZDBigVI3lkrIxARtotiJmhKPsbrz3Qs7yURqAiEFGFLIKIz9Dc+NpHQ9jJkVBqjwi7Qx0bbtbRiA0oCqG/Z3h/4fr+BDP0OH06d3WzB8ttvhfteM+/dvkoJIWjdvKAHeTRckLZdXKEXTCWf3TxA1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq9jQp9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNiGVKpv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq9jQp9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNiGVKpv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MhDZ3382676
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nx2quzm25b1cB8YCz3DyQ+MKwR2teEcFlLWajpF5LB8=; b=cq9jQp9SqWV8BXUN
	WdlLPjBva709h6SydWl3oX2JB3KYj9EKk8qbZa/84rP2y6Cg8SCnBwKmhO0Gw5x0
	+bRwFXC/zxpZpVf9DW69IcrqXE0ltA4CMXx9z2SmhpCXzFC+ZEl3uN0N9unziCrO
	H+64JmBcsH/YjiBX+vod3v3JHeAFW3E1RAcPUrfMSwxTxLG6kR4FJKAKurcsXtOR
	PSzJ20lcDsmmA+pEDaovIS2C6kZuMGwos6wYjdYX7jFtX5INLH6dGjv/75oy79hm
	rQ8U3KI0f5jc0B63MORVuC2KvGsmHRejKseGhE1M0IXv1cQtH9b3nvlqjYItBkh5
	v2pGKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8rsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so881034485a.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063511; x=1790668311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nx2quzm25b1cB8YCz3DyQ+MKwR2teEcFlLWajpF5LB8=;
        b=bNiGVKpv1a96hHUVgtBLKPlzLvifDm0KcU/mlQ9JY4/RMK3iX2mde7o/ojvV2xeOx3
         EajrSAfw8vCHgHd6An/mtNVbvYaVvcLA8OzEuzicjjpmGDZ7AgMoIooKjfcKyPQfHW06
         dUKUCyoD6UAoxt2OYYd5cJi3DjIjK4WEWZkqgevNoRshsOTHEbfWZ/Dx38mA2XS6BhlB
         vqlGqSrCRzlliNl7OBQ+jN7oT5wAySDdZv89an77BL5T/lACqjfMg/KtQN7JbqDID7Kr
         aTrBV1XSnWbMxcmxIZQWfFE+bJAWpXLd0KuAUP7qewAF0Eef9zhplrAADseQ/JPzZtHv
         MTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063511; x=1790668311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nx2quzm25b1cB8YCz3DyQ+MKwR2teEcFlLWajpF5LB8=;
        b=LDpx8OfWk9MrCQFvlGHcD+UKXKpTDe3KFTZHXMsA147ycRp20yzKnhXfrpDaQ7WC1Y
         iF3rCwj/wTuZzRovmEkZNPmW5mJ1/hhq5fDkCs3Bn9HrkHfd8Jm/65O//lqUePple8oh
         Nq8ycJaXQgKktI3Qf/QFJSDk+qjBp4vQ3L5W2vLgz6y1x5JVa6UKAKic0g8mXjJ2f0nW
         0XN5bFUZ9A6blCmitFX5cqyI3WTBjFXLqGTUvsdnwP0pRjsnHk30aI580sYx6BfiNjB+
         HcOQrHyn4I7LnCygzLLu0UbtRMM7nAHSpI9a7AYYArLPBUT9kmV6SwaBt6bWfjRoUimU
         kC6g==
X-Forwarded-Encrypted: i=1; AKwUvBy0WJonSbnTO4nR2y0pT3Ih4rMAlnZOqQNO3V7ynpFbciCE0tFczGHsnQpzLqjqi216wYTQW6Fjhdmk@vger.kernel.org
X-Gm-Message-State: AFuF++kVYGwBeWxGZNLM0nOMZsDuBhtsIpIkudXYlUp+IMwp5d4Hqwfe
	dNN2nXkiHaMyxjcV9lBR2VFJ4DWfn5BFOn0D7Fjxd5MAbVu5ZeRcGw7yjSdLvHnvssJYOvpvLOa
	PRjQXyFnrazHSBW4niESZinhEu+aY9WHk5CsYsbXRvnvj7YvREnPblblAfeAiKs5o
X-Gm-Gg: AYBFou1AHt88gHijRVtfsMkPSuBfN5nHN5YNWrZXdMnwez0w+VZiGEqo8xETE0QXxIM
	6wmXcquP2mp9HwhghqUVIChgG1N8Q4Eb2F8UzJvltunDOxnuMyQEn2y2oBVq1lB58ucbFlrXlgc
	z5nxgcv/Kc/M7t+8XHYiA2XOQZDW9nJjjGbjO5eettEx5m/0F+X7aQlMSnzhEasTnSg7Ki7k847
	o+McfOSoET6g+P3zSheKQ18bl5FKz6x3LnyfM+VHT67GIwlXiOqa2FkhQfd5NWAkptw0Zn/UV9X
	Rxih+czp+maiWmXDVzMC36GCVxIPheRvEzwKNVWI9Ab46ZG24ywbesBwEQfqG/5QBs/6+S6cKRO
	IO5pKH8YZ
X-Received: by 2002:a05:620a:280f:b0:93b:e9d2:5ece with SMTP id af79cd13be357-93c15e412a9mr427594985a.39.1790063510743;
        Tue, 22 Sep 2026 00:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:280f:b0:93b:e9d2:5ece with SMTP id af79cd13be357-93c15e412a9mr427593085a.39.1790063510291;
        Tue, 22 Sep 2026 00:51:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:19 +0300
Subject: [PATCH v3 10/13] arm64: dts: qcom: x1-asus-zenbook-a14: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-10-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=38zsE10IUIg1w/H8v2oc5p6m0CLDmimV17cgjbcoE/s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN7LO/fwHB1GkipySJd8Nuh2g8l11Sk/Yfzf
 AKpA9pw2VeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzewAKCRAbX0TJAJUV
 VpDlD/4+i+ykGUmR68PDGSZ0EYftvcw0JqmZBwyNR3bMnAzsRQjEP1ZsDOQfCZFBj+d7Mr4kaZH
 joFRkspdoRoOWNqRhCzxFRcZFlGfkSj2RFuiZupTF7I/Y26VXTFmUGiyMvfGXFU+Npnua4e+pi3
 ZG4g+T6usW0R7yATXLWpZOnPV3jl/cI1o0/FLbHIaOIZl2x27lT/fB3BP93ab08/roBxWaZuQ2P
 2tGfGWuPC6EyqPNua/CQK417fGWhrdkC01v+eRnudy4fuvlHWpFiAuLbcOTlyw+vlw3IaTf+T/e
 SUB+gTVwLoVU9arPLapwkOaZqWzmdj6EbPtBBYRrI2E4oBi+c0CbEjxRNMuM+aeGoQeC94jNqqv
 L7Zk0BcmA9ad2EIEFEboKQn07xcR7GaMAXDPDqzlP+iaZbb7e0dvC81u3nBpxQwrLWJMSp8ys5s
 EQR1RWruAZrM7nza4VvHqAy5U65dR7LgRpIlfDl0+Oh30XU/LNifKOMgL8QodNbixzcHc7iXhZj
 a0WdhjfVyILq/w7t4TgD6s5PzCOI7+3D9efMPUH2Iq3g6R+jVDGvMpHLMuf/VJu8iKslpVvDdv1
 9GSJx0ySK5Nm87Wq8w6zBjKLgJRL/qFFiY9jC9y1YtMDvpEXAAPls/vedSYkp4JnO4/2IbA/Cep
 ObkUvjyG/r+2yFQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: nEuv0IW98E00Ej0DtmJ9WA1gUvu70VIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX8AAPlQwtRsh2
 wT1VLbdBoglYCyWeAbLzvIEfB7KjRBzrMfumlfnsTUXgdoA34rciPFqFoK39JctVBcTAwtUWdZp
 TKz1bs6L/yF2JpbyqimSVqkijiwOpRhpiBBsDxn6FL87pJyhU7E1SatSZkqvDHerCM7xaUc4jlD
 BZCj1P7Q4+gLF912i7LkJFWxq1HOROok9Mb7Nte969CvZFl6WMGBduuiu9wXrHGT20scELXove0
 ZrKoUv+gMBEXXWNS4IsMZwn/+BfhWwfxrLn+fB4yNp02iUYQr1++Fer+Wp551Z7TusvkqdwWFl9
 gaqz4A0yJ9xCW+BPbz+EunmXtbfgDNs5k+Gv2+EQmO/mUXifR/aCm8/Rg33LYzm5c6FmtnKpetZ
 jar9MqaLh+cEr596Bs4FldbdIkRFdDIDbDIaB53YQmpWNU8Si1EgS7F9Z7TboOR1mZZLKodflWS
 PcuhFOtycgGBASL7tWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX2DtxqMALceGh
 ReDVWrb9e8C9fIYhvovPRLkqCgeTLSjF5hKmpmGVo/Ex9wiAi+QWBFw3MNrBEfCEBxDwgglhVia
 EJjK+U4GTlYL4WFgXjg7sKteJi0Gn90=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab23397 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=19dZ88v4spfqzsZ6lMsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nEuv0IW98E00Ej0DtmJ9WA1gUvu70VIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 7b1486469730..ceda30b1f254 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1295,6 +1295,7 @@ &tcsr {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
+			       <65 1>,  /* EC reset */
 			       <90 1>;	/* Unknown, TZ Protected */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

