Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906399;
	b=Uv/duOJ8FAxqqliJ/z3f3QMU1j2ATgVyZnswCgjUXE78CHsnF0850oEfqW2DsC3BY/zq
	 +gbEsrIiBk48oQNh1n6BoesyzN9Y2PDPD4ZVdZNos1Fx7hxpR7bSq3e5F5WyvsCBnJgRa
	 Hjw3762LxiXa35DjSQxZEHWG/7uVGNQov9CTSKPS72pHsAK6krcCgEr1IdVsMn1+/VpJy
	 rMz5Y00jVaObr60/GylOkuxHybephYu2fUakVDypefi/JkSCGVNTqsHF6DGTR9GYrSV9n
	 gIzWgafjvN2+KJ7ZJ9D2K+hHmrtrbjdbvqTK5Wbd8hma7n1Byr3PmguHQaWfQm/9ENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
	b=YDYkT6SI2etKp+dsPMFJSD2ymMRtfGi2ygcGZ9AEDzzhrodGa9NvJhy31t4ZwiAMl+FD
	 ++tTidvA0MNzQoJDCrYkv2CQ5SvZYmfl1C90fouyL7pj0oARdy12kejT1Q7cfzfHrwEdT
	 3yPp9eGJU5Mw7xdkoOK5N3owSZf0GT3byYUuRnJu3XM/YYlfaagDkA1Lg0jkQakF8IgMg
	 X0wPo6v9QkSbPYkZenUht5Nd0EFPbusWSsbCXHn62Xy/mO5ZtkTNJRnEQpJYhlnXfUwm9
	 LxEvjjU2RZDGdHh40mpv4Gmp2+DoNqIoDRnxzj6woWNKCKJx3sAumsDodYJU85oQ1cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzNYJdCQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VzKTcPB7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B32606A33F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B32606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzNYJdCQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VzKTcPB7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NTnp721754
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=; b=lzNYJdCQ+22v8uiy
	hhXCrfC/TRosrojiSfVmW68T+xQ+kVNhKZ6z9BJtyFXWXrUmgX557PPBYZ/xL4zA
	nsTTE6HP6rVdsPhvwgvX6abtP7tninpBz3p1nIlL1LA3pFq76Z7vp5hQX2hC1O7U
	0tkbb3smj0mv68CjhHGqjmw07BkXr4FsPKV8Jvas0zsKDdqlui9sDnKrBjmzbd9h
	NloZqjuX84MHhFCPcZWvYng1dR1WBWs1lv/QcY/AmhFiGoZj7Ki2h/OakXTWORP4
	3ij0G/ueT2OGTOssKU6UXXvfPNyLVzEKEqz7rZvWKxvWKiKx00QRKN9fU6xgqyeV
	vdbBxg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc85gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:06:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210bbc04abso958896d6.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906397; x=1795511197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
        b=VzKTcPB7cez9iV+rs7xGDfqELeBSFAOImRCKWvKOF2BFjZW83XivkGu6+GTRLFtZ2L
         WH8uD1lpI+BGZLnJibP/eGqxUVkqpehhZj3UIYSVZCHchExb0wxmTCDQUp+bHKmVERo7
         xdkjtkAnjakNehu9j0LfrFaBbUDHhMExnpc4YnCO8IKdEa4rD7Htir9/PiwNFHf5hu79
         hnaRpH16YC7d30nMalGn49iHI7dYOSrS5N2cPDdM4DFuSopd2LSSf0/k82KreMIFb0+g
         NsbEPPea2k3qEA+mdar6tDjCoXUi0XJWTN5kXc5YerMGg+8JVVOe1SPQ4mJvX1ym/+YF
         WCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906397; x=1795511197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
        b=qBuFKYGh107BdAmQQYr7GXa3zJsGlZhLcjQSaIPLXFCh2PXiRdTK48HSaq/xVHYaBd
         ya2JQkL6+j4aoZ+9Z4kUR0JDOVvKJeBE0wo9UE7JBXvEe112WxdjS/Fuk63QkixxPPze
         JQF1MQASIaZYlJYgFH/mqVW/YORMGGi9o2cfs+McS7X+/kPB2/EiCIWOb5N3GN1wlgTa
         PuHY3MQH8FOLnWfz7CVIIfZ4fYfGETOmX2GzrSmvTJ3kbN+Uc9a9PnnkI3XcaO1XmHh6
         /LxAH6uA/Ys4jqA3XKvCOjcnoJyOE1lznA/f5Gud7G7VgqJi36wXG7BrbNO6DHM6adgB
         TpQA==
X-Forwarded-Encrypted: i=1; AL+hErFpKZ31wziBbGSRetxpoLI2BNuyJN1+VDZX2tqk4Evxku777f8qMUgGKMFjdgK5gnO72WF2XRKRkh1Q@vger.kernel.org
X-Gm-Message-State: APuU4Z9x6wer4WZqZvDVXcUCKsIDSMWFNEf+Ot4Mh0n0vSs1v4xGNZ21
	ltFapnqyirwuLk81hUFCDSdZDH0zFkmNGnNY+C2J7oDQxxL7QnK80SCmA4GbeQT/lkd8uJDZvkI
	o6CPdEPM+qUBS3kjS6zKZkTULYCOu/D942bMeYSUGeDICt1hGGSEJzmNbOvbER27T
X-Gm-Gg: AYBFou1ML07J1llIBDjGw2Y7XFc9YesdEMWE4/W+Sj9+7D8hS0GaXr1Ec1DTg8DvlRV
	yCJ6htwMlZAI6DJWSclZBQ/9Xys01lS1hb6NiNz3igWdJ2WPmgVP23/LajNXekwgWc+ynXTIijH
	UwcirsjTzso9FfkHxzWcI4yNGuDFjxQMsblhiK6N3H3Qu4agqC2rG/RtduXNZfzuf50ibgpdB1d
	o9vd/HC08dSSljzuhgd1TT+NiHFtcDm5B1TZhadT1fDWJk0YwuF+EnfLMp56dE+HPOhyJLsuLc2
	UBZp1S3TP9UPfSEv1ud6q3ViuyuIcxlRxKPz3ktdt8jg3CMTuEjmltpuIaDwIBRYNO9G9ai53We
	GrPBjMz3vErpSNwPjUUevoMsMCmcYyVagx4dCRK6dryHqq9JWPpOTBwenpZFyFF9P9RVS6LC4mF
	Q=
X-Received: by 2002:a05:620a:8390:b0:949:7497:7c1c with SMTP id af79cd13be357-949749783a0mr1047334785a.60.1794906396858;
        Tue, 17 Nov 2026 01:06:36 -0800 (PST)
X-Received: by 2002:a05:620a:8390:b0:949:7497:7c1c with SMTP id af79cd13be357-949749783a0mr1047331885a.60.1794906396291;
        Tue, 17 Nov 2026 01:06:36 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:06:28 +0100
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
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
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-1-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O068p3qvY13gpO1dapynH3Vca4Ot7GTVTMBYtc7x7LU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkWaH0DVs6hwvZ7sOYbRSydJrmgAr5t8FV+A
 Gp/dGqHDFKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFgAKCRAFnS7L/zaE
 w443D/9TbrlZs9tS3VbmqVk5HYrt3fS2uqe8ksEZV8PZAbNcz+UPZAC5gU1uYtHkiPYpvVnf6AD
 vzLkwE/U+kb218VDHh3A/HVNhL/16BpQjubHC2CCesAoaQDHqyEmhsamR4cbrwHCDc5t0x0GySD
 yOvQPe68WH3Jz+DMvd+I2n84K3QFTRbA2Zskx7o8eKiK7sUOYM1Z1A2pMyWUx8jTMIb+h15XxF1
 wZcw49vEJyDghi4SPkRMDZDp17zN8rAI2uWXx926io1kds3rI93zRjtWCzVZ33q2Sbea2ZmvKJs
 TZiB9LD89sg9ssvCYxk+mJjENzGvE7w4qiEO2MqOflEl+RH6P6pe9f67b6DHXPJj5x30ZjtwyMC
 NaeOsRXws4bio2w3KICUkzPDaRAVKvhdK74OZiUI6N/tfxC31fbGBmZvtwOiWswklDTE3iGgOs0
 mJRO/TaSYmQSH1mm1xpQ3waeHC3AfICnLZ2zQLfnL3ycNjQt967fGYnsmH78zZ3HCls0GAXQB1k
 Az+TX9py9CJiuIEBoN1WOcUX7NLQDi4g2Y9r4azCvjxqA9j561kwdhzd4U+lbvbFBpybosUeCRU
 nzY3tkGBQLcjZk43aVt67wUE0kuWr8oiQRqYH4i3CnH1yZZ5+MquZapgbdbJjohq4ecHwvtZzKd
 QhOVUodO7zGm8VQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX2tCAVbedBaQQ
 EVhiV0gFHau+71utcZ5NApdB+iZ2nyB4RDIWF6sB6FU8f9dCpsyDPwf9eM4eRxGO68tJAHEbDpM
 +nqVFkbgRIYjv1Fcxc/1Qp6Gc4h6DUc=
X-Proofpoint-ORIG-GUID: h1gAZdYunKbEWEQ_fihuP9QVkLnnaSL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX9SLmdP0kKRCF
 JLbjp14J/DS9bA4wotX995xq1/+KtyYMiQMct5/N1m5rhqKIgk37gXJ8FN/8DtoGvBodExjT9YD
 hpkDTj9UzUmWrmBQv9ynAlwWO2l+AA9YpCL9Tcv97wgwykV2zY9e1OpJ4ECBmpNOuTgpgsrVQkZ
 TB7rfJXDZAz9wu8G7vNMNc6Bz7SwCiXY/SC26f90G6ayL1U7NBLHErYmuhzf2yUJkrC4RDC0+Us
 81qpU/hb8jcAiTfVtM2Eih7hqfq2HWsJJ4+vUKbj3woywCHnxa8H6++Dt0d2wRgzmhDgnYf97x7
 mAkiWIbAYjm7c5rTbpk16h5UZhSncSOXxsPlFRUURAkWDUvQK9DM8eqTbFdrvoRq0bVICXrm3fB
 L126HVRUYyr4R+kAHDWICRzSYWN0K6IPXw9qm+6x6YXeHwdwGBooDL0/1fZ3e9Spz5xt1otB6yN
 11Q7wR2mJIkxBwqed2Q==
X-Proofpoint-GUID: h1gAZdYunKbEWEQ_fihuP9QVkLnnaSL9
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc191d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2jpwp6DS_NLBz8rowOEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170036

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the USB3-DP PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Describe the bridge clock
as a fifth "cfg_ahb" clock for Nord, using the same clock list as SC7180
and SDM845.

While at it: make the constraints stricter than the global settings: set
minItems to 5 as all three architectures require the cfg_ahb clock.

Fixes: 674e602140a1 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
[Bartosz: fix constraints]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 13e64fe510b8f..8d09e6937fef0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -209,11 +209,13 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sc7180-qmp-usb3-dp-phy
               - qcom,sdm845-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -229,6 +231,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,nord-qmp-usb3-dp-phy
                 - qcom,x1e80100-qmp-usb3-dp-phy
                 - qcom,sc7180-qmp-usb3-dp-phy
                 - qcom,sdm845-qmp-usb3-dp-phy

-- 
2.47.3

