Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688482;
	b=SPF8WJ6gKluWrEAVB6B5ZI3G3KaUCJqS28y8FqZiT6rWXNWHaznSTpeI9mwGXG1Txv4f
	 rF6nmEUIY0KqWR/pZ9PICtpFoMAjKjD6Q/1ocuyX4vMVSMhH4s83py96etWrB6ihhjsTR
	 rwMABZjcRYdERLSKIoURkwLpe0yRO3y9zypBd3Sw1y2bio58a/TKimGtOEcat1kz1OE3A
	 GQlF95zxyPVBYmMqdAZOxmrwZESlZ4TCDDzMZLUGrrQAKT0pwD5muqdPj9H9b/diBPCpk
	 D0aMFx+Zm0nCcFOd9nTZakekkVMyAFBz5JAqcOisrTuGsWaKtDrpcv8rd1ehpzyralA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
	b=NByq/KYyK3VG77zpKjlHjli8LHs2nI0hFSn71xB8ZQUiifRkvb9bux1PYWzuoNQSQeTr
	 lSZediFDOdsgKPQmmvGenfAWxx71EBwI1L+1KRuiV09MrbiVmcUdQbuijGZErC3yC0crX
	 NwU7MwQIVmG4Tn8fkdZ+PrNEaMp2Ucl8+zOrqntDkZgjr/HmcH8IuziPNUucTNc0WDuWq
	 UjviBH8005zwmTKUSc5rpPnL5zURPfnTVXMlifMbWoOeR79AEfyLQd79H+cskEFzADWqJ
	 waQfHOnqE4bWw5udOkETXl3CqTNMgKdVscmhJShghXQH4ybbvQU67eKHBy18xw1PsMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhTAYU39;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cENrr0Hb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A721606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A721606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhTAYU39;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cENrr0Hb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Awcw2175562
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=; b=DhTAYU39nrQZvrz9
	4eOYfjiYSTHXjmMERB/9xzsqhVt1ywAUDH4bjPVnONzDNWtTZ/gA5WaBDPW+PUEy
	HFd1RJOSnEyazsuGDDfaNkWYtTMkIBbmieA/DLclTk4SSX3cZDY7mDVtbojU3zwK
	jTU1tEMPmZCmrYhm2wxe/Y15vmUxCcUxKzS8goDgc3mGUVueqBnlRQ/3mfaXaswS
	/+7eMXS9bAJ7WL2yj634pB3Ez3eYRMQy1jGYM+p/ao5uBeiPKVcKg87ExDx48I0V
	yUh3sj5hPwqW6VANGJmijLenG6J8fO99DtPa8jUjWpDLAb2hAhiPF6i/ffHbkDb5
	1Ywo7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuyus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d3232fso949578885a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688479; x=1796293279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
        b=cENrr0Hbr/czlFADbvqqQG9i0NLWeV/BzR9FQ+bFLVnHWVsJWwFuGHO2G+/FgU3+50
         dWfEaahp6ul2NoOdgTP340OrPDH0ZQedL9KRucYHVVFt0zH28T7Ga3YaZFXetatEjC/N
         adr986upr3i3ItnYNEoj9src/9+8Volp0WwDJQga8bYPz7l9znsrAnYNzxPV0mrhv3/E
         e9iCWjbE0N8MOLN7Xpvzskx4hqpKBbc6W9MDuuBH/XCcTjOOorMrc5XruYAiatssidCu
         iER1RloNdfjMIl4VyA0/f/BRDPQ5qGUvpZrWPELXCTiU9+544oiBI4FwSwekAebtt415
         Xt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688479; x=1796293279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
        b=csv2+RnA3qkbxOSFW4/u+hoVhA5xVNjWI4qWh3/AMj7uVN3MhZuWFwh8Vg0DP1k3nQ
         1wcIDwX5Q93PZzav0p+e/nj3uKl1OuyKDQoX+kM5SiRlBG3OroSE1J01/U/d6JV4lHr1
         ZIw/U7PgL8vGXBssB22+Q7UwOrsCDwLmTtZXt8eoFqz7gMW1kmmIj+hq4SXo80MGXJrT
         4bEqWfBgxyGxyY1/uzxEsakOT7QZmhli1pA6HawhvWwNPUAjyoN6a67iKUhsdBKRr3bN
         zznpP8Izg7jCB2Y+XpSr6bGcsXC2WdnxM1c7wqxMvelnRImKlbMu5WWDoA0uK7G0eeqV
         1SNw==
X-Forwarded-Encrypted: i=1; AL+hErEO8Y9n94U8f25OFVoo6yMOGXh4Cti9lmWGLGcRUB7IAcIj579oHLJts/7VtLO+M4cRd53ZlJkhCVEq@vger.kernel.org
X-Gm-Message-State: APuU4Z9cF0fRjl52S5mXPOvuS8MGwzylItZqLjuygDd0uNqUzqAsk0FJ
	ajf5NZdScVwi8HCy9gp49m8XMm6gBPxOAr7adxForCWQSZ7vYfK3T3shFjOccnCp5q62zDCGK6M
	47JGUemb4i3M5xdFvBmty7Iv0qR3Hf/744nBhJQmOXk9bv54eJ/Mku0YauAGsWXW+
X-Gm-Gg: AZFdTZezi3ycoC2HIksB2oOMKJKHkSekjQ6L97hjT0NoK7DJUckj9xKHZcgs4R0+2LS
	YQDnxu00+Rpw7Y4IrOdKxrSalI5Xh/MlAD/OPVkv/yIp38Neq00XSbfOQgccUVE+ZDgZQ3MicUb
	9zVRRizz8TTTVFbwyGTcgj4pe86rIkBF6Xje8uvp40zHD5M6OhjIYkEwj3daQM587uk96/PRprk
	3UoudcRMM9DgANIOiqqiNM+vlVBnAK5zSjhrGNqC1ndoPmUczd/Pka7yI/jxhMa66QhS6O7VYai
	a5/IlxbXw+Uy4Yg0oDm1iIQCjisnr40QB7tCRkYS3uck8PCD7l1pWcNliqp3rG/pdhCpvpzrzce
	mNf1lAAHE7aaCism4G2LRTGU6PtFFeW6obk8OMXd32+7WhxhLgBNB0MtAx9nJta9lyZ4legf1bJ
	JJYFyEgFD/34D8xzLcwBw3ZV5cb8uumztrB69H0b8XnnsJrvU1RcTrbC6pErao0c8=
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3543303385a.33.1795688479524;
        Thu, 26 Nov 2026 02:21:19 -0800 (PST)
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3543301785a.33.1795688479064;
        Thu, 26 Nov 2026 02:21:19 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:07 +0100
Subject: [PATCH v2 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-3-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eFL3sb9oYAYsuwNA1gL13bp+GdJy7O1UDpqPDuJSOsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgT+NNSktfa6agdNq+6VkQV7SM50dlhs4h8G
 o+oqCb2ZIqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w2C2D/47uDp/aqZ1JtBZgXSYElyuLa5q7DC93iNKVCUPU+4SIag5c7bjVvseU4eZdmnhLh+yHIR
 1+2opnAbNsF/saf8qS9AIX5IQfltDF+7z+/YJtGCVJ3G1m4hF+xWmMlskfPeFZ0DJSgrmPvSplK
 GtXvUrAYF0ADcbIkyGGl5ztcXZzcQRKokRr3w+gOY5d+jyXQB0wvirkRffV6wOgLApEYEth1B5u
 fmTwgYbqfNUqnzcyaxOUEOFdGim49quKKFQ/qzOGqAgqO5U1mlI/POtufVazYiedqnp487x7jnf
 KklvJnR0rA56xpohqDVafMthX2q4M1YO/Cftr3MhcUCibMLIux4L6s9ipKruumKhVH01Bm1nQiw
 b8SpDRYOfvccOxDXOw/XtXIWig3H/SL8fhzhLa4obPs17/yJU/twWjgLGDDUbDf+pLL5dWBqt05
 nS0HrxfgqBMYxE5h7ptNqxUP93Spnn1IG6q7/U8RXNW8593svlmxmpzeXCuzlEJYZwYMFwill4m
 o1bj5phkRZ3UYhIRxECbTR/q0ezTDfwL0gQyHTxzmcOtjjECJAoNqIzvcMJiVSoqlHgGwvghcTT
 PMYOmx/tVqXjbGwycktwHmkDFuSq3/LgeFUU6Bnhxiu1rNI25dpbtN8uYFTQbJIT+VNkSjEPi4T
 xByWkjqjv/QolTQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: J3Oo7R4A6h0-acXY6LmLNnBAb7yQLoaY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX+NV/mSh/3vKQ
 WQeTnKIJRsVkO4dxS+yQiAmDLVF2k1IesvT9jLefKNrldgiWohRBxnGmjuyJV0eBR9v1zR2CnbA
 XrH5z82gX+D4kly71Z1qKgqJ+viF18g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX1jTnukOC2hkj
 BHYxmYgjZkN6woP4ylnxRqzQIrK2lRc7GWU8/Vp7D8lv7vWYdnUovCh5a3UQuCfMkN2+CZ4h2HR
 nv32ONlb7g/xsv+aY8NtQBxusRxe3SM2pZC2iFdq4wta4OPyVxiCDXb+5Mgaoxt/+YM1jRRBzoh
 y9Bs7sgAGtrZkcJgZEtwiGbjIX7jS4Si7zlb0MdoUB65ebyghhGo0zxrOzUJEElBX6gMY3lTx7D
 JmepHXTKmEcye/HVwtG1rHgYKcxXuhoijT2zt6y7YZcajYbWexqZFPGNlIVYzhDPzjwM0Viy5LE
 Mc3qwx8NfQ4aOS01I/n7BnT8/vAs6WmbEHjpXYeqiSzmd9qwPRoru80ZBDKaRbmn9+7IQ/5aJ/5
 MkuIrGL12ZIIHMyy4qOmyMmikAKucnCvtOlPrVRhPtA85LQ38KuuczMDJujX2QG66rzb/cliX4U
 JPHvo2Ot58DubmifG2A==
X-Proofpoint-ORIG-GUID: J3Oo7R4A6h0-acXY6LmLNnBAb7yQLoaY
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080820 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
function as non-strict functions") converted the gpio function in the
milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
cannot then be requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() for egpio as well.

Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

