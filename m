Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806886;
	b=s7tu0XVLfhRKGzdMa4AmZQAhoMqyRinucmLjlpJ3/DikSX+T2HZNhMArAZEF6ZqYlkh7
	 RKx89riXfMSyc8cvfRWo4g6LuOz42J9QHzzAMTIFxKQM1uJSHTIYXRcLZfJm4J4RYjzym
	 8esX3jdSDcSp09y2dXdZBig/YIwiQjiAElpZAAoK4S5CXBLGpalrGGkEmrZp2KMI8gdh2
	 +YEsrOLrCyXrAdHMwxaWNIByf+VWaoXStY4XvNmhFys1s1fGwqCGh8niNUH0K/oawUtxx
	 LUj11/Foln9iyNZKWCqxSh9qEqqQJv8q8kmILeKGAD+V1rHgQMjZTOSn6pVks3Z3Z8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
	b=I2k2xvMDRvX6je1Odc6NjCHBb2wItVtN+tCnpc/Puep2EpXoGSy78aQ2SShoeSombpIy
	 MnRJPHVDUpyCMVYH6I7Hqc4Kl9My+PSZShOvsO39mVScfPrpMCPOYLsc+HXvvRlH38ibe
	 2tOaJE17sRmqSqm6e80vjjkf2aDudizFZsvPWg0LYb56dTq5jhyigv3UcRAsuVidLPHLU
	 mOUfxCYRPRR1vEF9yPLKD8LOrZs9Vm3FK7cqQqtMcgIShrJhmSVF9X/YVMW8rh5v1lEM9
	 R4KK1OPZ5REypK+Biim6EVZ+BrHX2E5h7J1dBvBRABGDdD7yFDYKQmCq8CeBHbX8xUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C9606A33B
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57C9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LoOQ323069
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=; b=lgU9aBCvep5OTeVe
	CKIG9Qa2yYKfBBe6Ts1PyuGw14n77riQ7lCDrD1eYJ5fQwqLHrW2j86B6Y2xTAsV
	FvzmOe1GjOkj8EsaqGsz82cXrwudtRbeZCfIJT4W2JtJpx6FIE9jJ6/+kYClK7Lz
	Ka7Ded0TIOEqxgm/74+ZDAmtKTCz+tCiiRzMQiEsUgt3OnEav4mskhgaPZOXzC5g
	PGEzn/s0RupRidNHOeM5l/zHUCFUMR12rmNxclmsgDhbuq3zHl9SgiDYhUC0RQpW
	1sv7g1NghGArc21pNHK0kuviRsOVzBVltWLykeh9wKIfDh9ckV8EtB7OaWmGlFeL
	odKuMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx50c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so12327055ad.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806884; x=1795411684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=hOdD+iUMZ272ZRQVb9MEKVS32yfNVni9+wSm7zO6duL2SH0AcsE4Pj+/NK4xmd8qj8
         6YYKetwAoZFc+Lzh7xB3/yc/uPJWjmzkkZTtJp5+yAXb4lfc3cx8NBC+4LY4RfwAxIr4
         qI3V5vZ5hkXdaZYRg/tktbY0PNTzUuoyV66liJd0k0mi31iYdHSZdgyU1Rqm0DnAlHjH
         ykYVKnWrnLKH9yQOZSpBSOHvf2DOqpOcOERYaTJELPYiw70m5mRYogHa1WD/1Fu4DzLY
         +Twsp5Y78hSJVxikMnqrSYABu7yYTsymvVcyIHoDqjCWn7uP7Awudjmxgxy4GKhnAaJK
         +5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806884; x=1795411684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=J/6CWAhdi750kUjEQpQGmQMohZL/M9xMgY7fIHANcn+6WrCTJT7O75KZ/sLCEbjmc+
         X09fh3L3ontgKp//v1ueShkpMKeU9n8NmYrfQA63oqk6ydq+AOEHB5Ds8JshpQKDMAM7
         Jh0a52fGkuSxDkmpHrIgZj6Bx5wLIBWljJgk3GXdXw5uYuc4dHgEZWL5BoGjpGtiirzG
         osvC5uW3qoH5VA5LY+HBrCZ/1dgLn8rIN73tSVNePEXaDNO+ya9F8o6bHhywNqStZ4Pm
         fAL9a+LLMWxBQyKIbgMCreUJBXIa9YUIyCId/MZYwAZVJ07JxTGeD5zqRJRe1qcevuLR
         P2nA==
X-Forwarded-Encrypted: i=1; AL+hErH6RgIaWoNd0vSRyQV9hCB2dd3mQZf4M2tD6kf1GXiG2pLiLwAananesRxgIidk27aPTIBz+rlfKDs2@vger.kernel.org
X-Gm-Message-State: APuU4Z/usZWX3izt8Nim4/MCoYe5/x0nWShggQogMauc+F8/m0jwnWAJ
	2xjixFw0Ye+XKWKG4EObkTymL/kxDosBdraFQfj4GggVtcmPN5GUAf+cFQ9tpegpeL8KzqIh0ZH
	BVNcGO6rhb33c/YBGeM23iflaW8dnP5BCddySby39K/s9hDlBwwjy9d4LyQz28Bx9Q3sRUqrQ
X-Gm-Gg: AYBFou3npYlpzGsPHdSyr/xh3Ql0Vit6XuhAgtoDMJFM1vdrDnCpmNuIyHqvjdoAZCq
	8EJli6M/QwEfbVL3c54BTYLUY6peUUGiZHhmKoBz2oIev7SwbWlYydTvHSif2+lpkTF8CwuHNsz
	3/+0ZF/arY8CmFeHIr/wx8mYEPpR8LuIdVjusRd6fHsxtxOYQjNAd6EljAyBad+DvU02+QBSde8
	KQ+zJIJbUJs22ONK4zb1Qqf6t8VgIXW9Be+c6fwzJDkek5boKX+zdT994ZAazvZ5qRwW8ple2V+
	bxnFulwduQiYGme3U+zwhbux4qLtU27rrV39tubnhTl0PAO7RU3q1ug5eqsz+LmhHU/GzT9iN9a
	1jNME/c90mMu6Sha+rFEeQlSDWyWnmXhJXzsxgyGu1UODVJdixTxqHmZgft8QVaDAK+9RF+xV+Q
	==
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068805ad.30.1794806883704;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068535ad.30.1794806883260;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:02 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:44 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: add Shikra PWM XO512 source
 clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-1-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfXw4+J36DyBHG8
 HgrJNVV9EoPrwXWFD5Oe5Iht5bjNx2bk5UmpW8b/nvtqK5NZBhy7klwHyOfQLctSnB2s15lqkWh
 qS5onJpa9v91Jo+ZyVBmKSc0FZarU7701oed6DpQMa9Mapy9YJPdvaKqvc+sJCtDF63QJ3uZ3qe
 UiDW/Nz18mbVO5rv+ywatlymqn5H5OIHyQfJQxppuVM+9zZm1/MLkJp3slUJo7jzmD9dVQa/rle
 Tgw2kt2GaWirQlhk4nuvcAxcBKpg7qwLjPmGKQBOobF+xCDyM0lHUkGFHD/1fIzxmWhHFtScvdj
 Xyr5agk67XOyxRjzsxtGaqdyZgzIihrKrv1h5mOcZVWufykRTaJrs3oN0a3Lc5IMJxsYBpskGiA
 rUCSsU39ES8bIe5pPnsdl+y/I4bOUvVU4xJCJSCRPhFW33B1UIftZGgcc013U71hCYuuyLWM6uZ
 xM8Pii8YhLya8Vh8MQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfXzybBxaMR81TX
 +tHkXL4vGQxRUJIMIsV2aNSsrAkXEYJkAaEieoASDWWFMeygfOf/Cxjx2EzffWln02xTRXk28GO
 3/kTFa410XksMHKAlIh8SYN4xk+O7P8=
X-Proofpoint-ORIG-GUID: QXcByqeCwGyyV_YhMEoN5aCgm7qF3ulp
X-Proofpoint-GUID: QXcByqeCwGyyV_YhMEoN5aCgm7qF3ulp
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa9464 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4k7nqb-1yaoPLSLXa1YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

Export the GCC PWM XO512 source clock ID so the Shikra PWM controller
can describe and configure its complete clock path.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index 656c959c7e1251ed9af8fd04285fe616dfe9ecdc..b86f122e7a9ba0d10c84aac954626eb9caaf0788 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -222,6 +222,7 @@
 #define GCC_VIDEO_VENUS_CLK_SRC					212
 #define GCC_VIDEO_VENUS_CTL_CLK					213
 #define GCC_VIDEO_XO_CLK					214
+#define GCC_PWM0_XO512_CLK_SRC					215
 
 /* GCC power domains */
 #define GCC_CAMSS_TOP_GDSC					0

-- 
2.34.1

