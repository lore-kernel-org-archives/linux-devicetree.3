Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688485;
	b=tyOQ6EXeCgyRl5HI/IAnz8PI1AAtxJqVikNwKcavCRvKFKelAelIviMUYtgT4ReL1a9A
	 vG92lhfpTi4rA7JzZBKOnn/UkX04/uuABBUmJy2Gza0VUTIwVxlm/r7K2eDC03kycSwcn
	 Kz5waEzskbPatlTkrcCH4XLeCEV5agUpj0eLiLZexi6MbzzJk7S2EWF0g25/wMdWpTp99
	 jU03u82uH58YUkALJ2slDp74Sk32UbK7qaz/+4qsdCsuKwhaBddsl05z8qOkOoPZ/2UO/
	 i+uhD6zxZaPGDBKUNDHQYYga+w+NphuiEOCOTi8i3+LqbkmKpxQxG3L2ukJvPjWNjlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
	b=IBtfv/Cy3bIhJaQgnuXhJBR4rvi9kIgjY0pF0Q++3vt3TLaEqbeNW4QLu2oFTjISkBIi
	 1q0aGVaX1MczW9Yy3HNMwcNmn8ZnqL0f5HMJ0QdfeITY4X2JKoCo6j4jpr8vZmTg0bGnf
	 jTA7CAWC65jWlfL6bBoa6oTXf7oAdXfPGYuv+FgEsJOm4BQhs7APqdaPHwhLVHAe6sbZf
	 cjzI5C+mu7AHUK3HlXjKNptiwzCQnllogycaEqma75mBtlEdlReRCsCv2uUH4EiYj27jU
	 PZt8MfPyyWgDlnLPNdoOulJBnhuTyUuQ1uwFmb/3gnCoY/9woj5JFoeNZcfofwCRMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHFZ+ERz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcWqPUnQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C2606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHFZ+ERz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcWqPUnQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Av6v2594863
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=; b=CHFZ+ERzH4RF9Xwo
	z1VDxDVc2HjBM6hZ9/9iSIr6/Cc+/CyH7+LS/kwvpm9isf4UVZVdj2ASKg7kFxGf
	EAf/IdK2nNMah6tduZKzXfAd3S5N7aWJvO/m9bsnet/xjxchQJbbwfkmACIPgCys
	atoWa2VnWqkBeobPyIH4WCEbuw7kfb8b6OUYkmr04ofOR0ApCBQ0VgbTyoJoLZGd
	CmnpRTXotuUI3on6lHvNFcPdCC/NLm38BjqeYt7kQyTvkmkR7vjmUO97+R1ADeGO
	o2+TEIB4FEfNUrxbmEu5KFHP5nxzAvoszVlDWpa49e2nE4OB2PNoreP0qRhFVerq
	u7D0fA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sapac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1195447085a.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688483; x=1796293283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
        b=gcWqPUnQ14wTWWz/4bvfgIdV+HZfBQ7zfg6SVAF+8b2rm05XAAV9JBd4Rd6QwBA1jM
         ukSBfj7Ys72T63S9ulZ89HaAZmuSva6KtapDBHzS+RUi5DZq9aUs5Qj8RWzOV/ArI+zk
         WwPxWqA3t+ukKaK0iQ0/q4NOvWoUOJDPLizUYddgaWpaCXFOpDob1q1C7ATWlFRSd/gq
         o0qwV4ltOOlp8oJ0hs/YZ6MyKwN9FbSsgc+sOy76As43jMQWlBC1kppHVTJUifl+0QlF
         /RThszp7GsGwgBqLqRA2aYgutFMY33wv++VFb6rql5OyAe+aUvyNO3Zk+eCs7TOb7jtT
         GMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688483; x=1796293283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
        b=Rg+C8yBlsnF+STgBRW6s9iCGoJA8aiu80sWr1E9J6zTU9UnNOrwHmH3FW4AhWqsrlR
         IYbUIVVsjxTStL9ZwtP6gxBFBieoMl3reYWTX6iZkia9OQEe4961D7kQ8FcTBPj7rLEm
         fx3K+JBKJz8RIpvHhd8y027HfA5yrrvH9omtkiwae8QoFQul4isjO1WTG/o7yE+W8/Uu
         K/+sZOW7Sc+MsVDVBD+OEuUXAg6wODwc6aeqAU8aBbXat0ShW24I6RastH/yvRJBq02b
         TNJXj1lNPCqdTBbHbF99RKYnNmzUEMryUuzEk5Vy11uc8RoEPZx7OXA5y2oclvvYf/SA
         4TFw==
X-Forwarded-Encrypted: i=1; AL+hErHRuinuEWMoySPlBOc8F8PjrhTbYVcSoHZnlkLV7f5fkLeDSLSvuK4FjRW3xVG2zt9jhfYphYil3xVM@vger.kernel.org
X-Gm-Message-State: APuU4Z/JDOUHjJECdq7v/God0wBXHnu8zmA5WwvuRCjmgH5C1/jy9Hqy
	B+BK9vC6DC8VbkaNrlP0j3LnclKaXLfKIjtxVgYkheq9Ojo1TzQPCv5c4F/QP1jngA4TrKMlltW
	yUmnqHYkBW8fpLZoRZag3VSE/5uJu7ftiZ4lFKcVEAnqhjfDsPEeGipbTbAz+xcgB
X-Gm-Gg: AZFdTZfWO/ePpwR//4xZZvkmjEoPsIDKg4nZAdnIrzAY1NJ+NgbYWwRn11+ftwqEcdc
	jas8T8GTy1EsiyjhHobN/6ST3EgjkGw+KzsQw77pHt7H5XCJevXfFoIX34w+ieO4HELe1NROHqr
	A6RshtsMAGh+1nuXuiZNo52k20/xpF6OSKW+eDKZMBY53UsziHh7iL0Old39RaSVN0ulELDWB4r
	hNaMbuF3y/54J3UbvqzD6bEDeatLCietCfi4sRUG+IsF1ksO9SZFqSE8OgrmFTud/42LvVMx/WT
	irQFA37Mhpq/Gapx0xW/ICy666XGhsT10sGRcYQ8pNEnOHYv0DAyNIa6EcKrQ4JXdwfQ2zLjee3
	D21BW18ceareBHTQ2iLc/S/bvgcXG5BGMW9X5DiyE8LuxTX3ttTN+S+jNjZP7nYHquWspFEecew
	EJrlZYCssMneNWowD9WmdvEXkn2HoAyF2bcmK9Ipyw9UE612MNlCQy9Oe3YJE+qAE=
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr3753655885a.5.1795688483519;
        Thu, 26 Nov 2026 02:21:23 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr3753651385a.5.1795688483062;
        Thu, 26 Nov 2026 02:21:23 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:09 +0100
Subject: [PATCH v2 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-5-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PXcb7Wda7w4beGr4z8FvdCTWfP5iw2i4mvm4TpfkBlk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTFsSdMu2DU7NhEmocafPG0tvuGTey1JMbg
 xvvkiJtykiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w10mEACKw/NXXRrMJCusgib6CueanCuVm7+pDZc2nEEF+OTuLbP9D8o3yB7pR6nvUlg7rGbyT4i
 HhmWd+WzNRxRNEfcKNGzU2lXn4xqgJ5g2WW86HYIKlhNHKA9bYwYizbtNkF4cg9l6lb7z4Sb9CH
 uoS7mTdR7s0BYz8xPqKWH0mf07C6jm+opD9+g2vc/kth24NQcVbd3p93sd0gsSUK2cTH+KIkG1h
 D49rhneFdQV0NpqHOkqAO5PSQUoICTcHV133VaflKkhRo/YZLRlOluideSJyFcWz/cZ+Xo1iNt8
 PI1COK80O1sZslnztJxL54td+NxtVYlxYKZfdWwalUqfu3lltpRdgcIY3ghLSI9LxhNFGSQFZV0
 z4vJws4w0ur1m197VwvMlSNqw7E+0OZJ78EXG565vu5KwGOROP8XLhXgONs1SLy8mWsBbU1x86L
 X4jc7YZ+OU9GCwyqCdXNhGvD0iAbAwI7QrYLIiG+oKjzhfkeEX4p+5lJv/jAQ3Q9JsoowjN1Z2t
 M7klOSrSiuYDHy43yLri4l9m9RXv1rHGz7DQESkdjouK1T/P48yLMo5NHfquZJV0RrcIPx0ijjN
 4tr/u4P9Pk9uoyeifaxF1az9HRvop2f+tlHlqtdQbDNXqKKsnaBFCd4wiKAwJDKChqzOckIVa4m
 gFWtV7SZ/b7CMQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080824 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=U65A1e1nmbD1eduP8fUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Dqg1eVIOG-7hKyBN0v7rzdHbK_357oSa
X-Proofpoint-ORIG-GUID: Dqg1eVIOG-7hKyBN0v7rzdHbK_357oSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX6uxD+j7kWaHm
 H3RQSb3Jv+gb0VyOY9/HI275serWRqgLzNIn2BP5iXO5pJkBJhPfltsg7nNNmyR16FUWgoOXMj5
 ZJKq47eNsQ0qI84PWhAsAG611+SnZ9HPk8iixtWWEH3R1XQtCMvQw7LiavN217mDl3uybo+d9Po
 FpUpRWIMVFWUJTju0j+u0nR0OhDjCee8Cjny454oUgmtryvX8RvA+s8p9iBC9RGd63yY9i7zo3g
 1vBv9Qf8TDiZ0XWRlDEaEhb1R+WK5BXGVfmsfzhuKGR5G+om8IR51jofvWnPWTLGMs8OZkdU0rt
 lUPbBHGgdsEH++mbyEvD1FugwrdUgGbLvS/2hmVi5eibZK5kn5HQA+E4gIdLqMqRErat0lwc5TR
 ppdqA3QbOiR00lcpOUQ4li2jGp+vC1eRKGjaoFgQkC74RTdhCh44Y4Np/Fw6zFtSTwDrV+bzjhW
 Rp4SMAcRL0ZpjncBURQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX0oAJR0T4GuF3
 eDDzE1ujEPxbxTTe+UHEcei4XSuwfoZJbTk9bsaDVmTCNoXTdxmLz/hsqeKni3mnD4adl266G9y
 nT3uLZN3RcwrBE/6ShbEiMpX00akXlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the hawi driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index 3486a6d63d10e71b0ad78f10b0a88bf6f47db738..6856ace6db1b2253da1bd168a0919e72bb131c5b 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -1211,7 +1211,7 @@ static const struct pinfunction hawi_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host_rst),

-- 
2.47.3

