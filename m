Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530575;
	b=lJGpJ3Q1oTRWiVdg1Aw/sVmGKaEsyQo7AnqdliGjTbCsRM2f/GOzn+qEk2rcgD/9R1Cc
	 KyUhjSorNxs5NOMzrPcYb+xCbDX3MQZJMvuzkAELwNi09UhHBXkCacuNPmv+dTStBMAju
	 gGJzT4vCoes2XCpsY0T61gyQNI2I1tLc2BHx2ve1G+mGowyXIqNW/D/kxH1tmMINitjdg
	 OKHyZH2R7bXDH2i2Zs4/svdGjRakczPXDjpbTvPg0sIK9Z/ChTKsaAEZVvEXrmFlBE2jz
	 4dT93XHAE906bU0nTxIOCxDbg1KtvU9iOCHPPTGYVx9aNEhbLlrb5t+1ETisvYudnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=;
	b=3ZNZSldJYFqGQqmSszZVzz7SzuiTOCrPvECrCCLj939TGcfHlNRnY4LZoRq4ZHoFO3oG
	 eU7MQBi+l+OuIaHzpjiUmDrtzYFZhF/UbQ5Rsw9D469TWYNo5LWljZl7/uUW72rFHjy3Z
	 dyidu3wpbbS5K9OECAZ1a57JdnWP1DqtZbcOgftagSB972tHj/npomUdgzhGtvNcTDfyi
	 3qdC51ggl38GJn33xrALF0cePmI4Ag5oCDanflv5wL2iWUmH6nd2vcDgPZScG5zItbMux
	 bExdx2qIPv9cMQx4pc3Kk4Av8xNJeNg2ccVIYYz3hGdsgz4PuUuRMWxv05EgbeXEDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAWngP85;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6rWQS9Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A3D606A335
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18A3D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAWngP85;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6rWQS9Q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubD81025305
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=; b=gAWngP85nkR0gwsQ
	Is1qfpbaoMDJXOr8amonEQssAKJ0b2OP12Epwh/7fnAGTLUln/anxWTW1il3ZESJ
	Ub+5B+lCgsKACQprvxFgALlSm5v27AdiEiBCUXRuH8DZLqDkOdnxiDF1z0Gw/iKf
	XJ8odqUF0J8Ulplr1GrjXLhEE1HPI15ctUU2fi8uOa7sVQ+1aKvcHZgXNzDyKFHn
	QuueFzqdX1M563xeDewbsCUYxUEWE6r+zXaUoEj4k8j79vdQNcHcIJQeV9frbDI9
	T6hDOOFDULQFm9K6jNZG128LU9SiKx1ZvhuQwMt+J4eHu7OpLNsxdPEQBr00uwWe
	99g90g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt383s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:33 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67c58f18a42so8239941d50.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530572; x=1796135372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=;
        b=a6rWQS9QS78N8PTN8o3BZkv5VQefhjov/+ETGcpxkpCmCGQgGqMHoj1SXvxYGIPTGt
         mHDZAs69shLIO2SsREwXkM6m6PLCrREntvDJ1IutDliVSDGn8l4eqqttcUqYAUzUzxP6
         dabaKN7i6/34v2WOiUq9HlumIpachUNt6d+HaGBikjJZOHBd3r9RcQM/XGIiOl3o53ic
         JQFNxdfDDRQ9z7XjS7nEBUHUJhg23j+/U8rR0h491Ut+SiD8DC2+WgTVS+njEYNZZEF5
         jqLeF8cIQV1pz+xo+DZwORY1doxa2hmFSRBKsBklVDibe+N/9c14R4u1h4nCZSB/VWOF
         74jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530572; x=1796135372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=;
        b=BBQD3Ztp0k4z8fQxXn4j6q03QxfnqJ1/j48GZ2KPhyChfpw99yIGwh/gJqK7Ljux5r
         mrVmH2SGouYThPQ21VGy2mOzRSTRJgijednbPLWId28KBFRhZb4ENUO9VXVhLfQJWrWm
         HQ4j3ypwb9AgAZM/5vmuD3evA301jRmjWAHIoXhMEZFnyFbH3SwSgz28xrB6wkKUCY4I
         bTnvjybcDLSqSL+GeB36vyvCrnChyYGpfYyWv38u+XSXO+Gzx/MiEwRwFVBPdtbA4ZZD
         Ke6nKzbnQrbySamnqm7uY2WIsiYrpJFw7CzG+5ZS8jp3kZKx7LnLif8N2OONiCWcdABr
         bDQA==
X-Forwarded-Encrypted: i=1; AL+hErFIyTXXusRn+kcDw3NAp9lKJA1ebeSSala2rJdxVGAB2h1f7D1P7BSVTO9G/zKsXRwEcfOv3H9IUjDy@vger.kernel.org
X-Gm-Message-State: APuU4Z/A7t00ATRXglvKEdGDAmxBARy0ircF0mKP3joJzI/o1QHzPLEq
	bk2NU2mxFoW//uiiUJsPxBRRPkqsoroF0ulJGzb3YGbmIURenjJx/6yu6d26HKkzsM/PDTyVYHn
	pZS0kvyyl/sYRIvPJ5yATf2ZEZoD7YyCJMeG68Sr669gacicXYSZFdoMuLIVpK+Df
X-Gm-Gg: AZFdTZcjFaMHZ3ku64dWTlGrwHnLV/o8XnvrZE20+Lxvas0ZRDpkomkQe3of/5zeVcw
	DWSQg7ZSaH+5Tmu2hCtI+3WIyq1RTccIGVZAqvb+T/lsu6FiQTqya6yrf5/oDyJr/DBkBYS3W89
	BX5mI3UfiyuoUZn5686Yqbm4YpQuzFpu6iQdIXF1+T3HBvVsv8hXY7HCPRGade4V98HBvrr/iN7
	DMaeTXbwykWVGkXbPGYr54ZOfZOXNf1j/6gE3VBK7AMV/PRXKFBold8+2yjn+lrKm+QT7f8WDag
	HdlW49y/y3v+KsUwDOd46ksM1MS34cQMJJzzVOv83TaDsi5Z8nsGGFvXz1+BM4kX73XwB+hJ+aM
	Ae4b9RxFzU5WA4YN6JwN3UjTG1vUmxOpqdIkvq7RLxlgakynwioxwRTVZmlcY23FuMUMwcMkGaL
	DDI0h2IvaK1KCWyfUS/hKkUPahHbaSXD41IjKbHng/3PbbVe5dP4Io21MDDWLWYIA=
X-Received: by 2002:a05:690c:48c3:b0:8b3:615b:71d5 with SMTP id 00721157ae682-8b52051d1d0mr46647837b3.107.1795530572398;
        Tue, 24 Nov 2026 06:29:32 -0800 (PST)
X-Received: by 2002:a05:690c:48c3:b0:8b3:615b:71d5 with SMTP id 00721157ae682-8b52051d1d0mr46647657b3.107.1795530572013;
        Tue, 24 Nov 2026 06:29:32 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:20 +0100
Subject: [PATCH 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=USFrusBLjzVGtNlhMXFqgRfWrH2nvPIRGCilQGpXYks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9Chxn/NhPHJWX72S9dfm/NiBX6bAxyubasJ
 EkpDTk/oCGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wyIeD/9nd/vmpqUfnAuZ0wLiZ/xTICrzSJZPqOOotjo9bFbTrk4aMdLoaGZuK8WFXF+E+Ggk89N
 g7jHLzb6cO6J1MPB4IKyZ4TS8CaQHEGbPev5q2mbVOnOyPjlr+BiL1Q6GRHhzaQdzdFUD9zSmI1
 5/dM7dKSO4ygn+92C1GMyjIOe+0ZGuztGZZWklIrS/ITYU/QsfDhDOFpbWLeI2YUcECBqwU7OuG
 Ws2t8PMPgeOjA6EkMgkaFaxPN7GiS9Kb33jsCnRoBtkqmuMQpglkNfmtC6hpGgpdXV7/AcntRFZ
 JmVkJI7w5+nHyViwA/BggYfgL2tk31iN47f7B/NiwVJua14KA9IMymjP1GvhlC1gO/V63Y1zYEk
 lqdLYEjR9S6ydOWLL0BwZF7gD0swMuwGtxdGcaVWvoXnOIjlCY1iEVeMu+nfFgZHAGjV975kRA3
 o4KD9s7xQ5Kx10oEFvCBy6Tv6bdSkxah2k3kr5f9fXjioAC08RSVg/SsJvatzf/hgsvyyMhvyXH
 l3zH9vnUUU7JEE2zJ4xKOieZ5ULJM93xsl++MCv+5d5M45VwuSS4kO4pvTgBFoXiChkMNiHCogF
 bJ5FBhSv9tNdd1DTKjN77N5slnb9IlTMQB3ruGXikknjMCp7HDQZmyNTrwDL29KC1GA+0mSfAY2
 ERtDKxpbbyxmxWA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXycfwyJ2c8NUa
 FjX0kF/fJcULIG88Vjhh7P9ZgjTGwKORjpHOilQF9MjlC/TPi2SmD4h7loZdA6mQuKV+QXCkC8b
 GB6q6Zvi2xt+ztvf+NvPUO7pghcMzUc=
X-Proofpoint-GUID: yGx1gomL1ueWhkurdUByTAZu88pDiF3k
X-Proofpoint-ORIG-GUID: yGx1gomL1ueWhkurdUByTAZu88pDiF3k
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b059f4d cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX6RP1hqYbTXFT
 z1En6VKqkTYyvoxcshimV0h1+in4WRSiwRGCmkb4yz8yBoukV9mGUywQx6bRhYdnJBSzk8p1z+6
 /snyAFGo8ABgVVODzSBhQsneUGBBJ7x8T+Hgya3HPt5f1easf/yJvprX/oi267rujj7dxYNo2L8
 b8WhFVl5gbmQCC+D0a3TRsNK8AQuYw5UH4/7x51RhzzjTgtfkMc/6HNaEaKVokqqzXC9KL9iSJa
 2EQ/0vkvo8t77+8lTULkFJBLxMp+CFbb3wdZYEbAAjCaNsqLNK8IjLRN6q1FLkVpob/xvd+ztAO
 E8QMpay2wKm0AXLnd0m95maC0P5nMKwO7s2NPBVbfIG+sbvN3d8RXg1HlIc34nDmwH+WAJUqEod
 D3P3fdQ8aI6XbX/hZed1rkqfUhpEXRvFWOKECwzC2BxFFIp8dZrn957v7t4edfYCiDxHF38BAF5
 Ysu20JnQbnzpsl/qOdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
function as non-strict functions") converted the gpio function in the
milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
cannot then be requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() for egpio as well.

Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-milos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos.c b/drivers/pinctrl/qcom/pinctrl-milos.c
index f5079a0ce0a3ea64f301427887af0ac7b32e3734..5dbd543e6057bfba5846bf6e87d4fb6f637064a7 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos.c
@@ -993,7 +993,7 @@ static const struct pinfunction milos_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi0),
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(dp0_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

