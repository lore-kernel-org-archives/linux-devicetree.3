Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688477;
	b=YSjxeCMiTsI5cUXC1EIUG82+hXu74fw1Tv53Zd28OcnaGi71EAFCymfifVt4UmwL7qIB
	 26L5pNKkEOb0gTqBHseTJ45T3L5CwvKQ5b1H40n/vLjr8HVXp/ZpGlPAhkVFaxm67QCtW
	 nacmQ51v3MXekphokROEkTOnxIIjvtBh9ht2wrtyFwOnY34UfFiFfSJY/ffOMKPFY03bL
	 unnYd2hdwBeC6t3KRvSGdcORx9YFF/IVFvgiyhWrENwEmR7Ge6i92ewel5OqTqkteVZP/
	 Jq0OvA/2HLAHLCnzTD8dB6cEmrXmpjxUZb2Br7h5EPUnsPH/aTmfdA8vI10rLRJCzNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
	b=2MjJgQ+oBe4dgvNFuOu7l2gtTdQv5+MZKGiyWCxAeJTBWX621x1CpTMC+p+2jI57tN+q
	 cF8ut0iiViUGwvJ4G3wqu6OTDqjy5gspGCYd0kCYin1589G5hzM0XFFAf3CJXyjf0wQtA
	 qhwL/GD0B4zENOMEKfUcAtZ9BV4lfID2o8196m5WucBzC7KayG3AvDsV/WfYUqSs2sxVm
	 VeF95N82T+R0OC6GvcvoHDp1tY4iHEIx3Vx+037y1m94PoxRxcE/dPDtMcuEbudOnEzWR
	 ftd7lBV3x+3EuK3yr8Er+5Mw62zUdUlLVtIRpsrdL24UmFzW6rn0DtCtOC83jtFETmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cel+veus;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDYDXEZD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0A606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cel+veus;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDYDXEZD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B5SA3548359
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=; b=cel+veusijpS9hNf
	IpuDHqhFg2B/FGsum9pCNmeuH8/HOY0I+lgdM1hL0jhjfVOMqXn5UzSitb7ZxAUN
	w/KNaBUN9zHT4gDv/SWr1IfBCMLsWxyj/CtnSHpzn6ROx6wcv2k22PdJNSGXAPmD
	JB4NLj8EqMPQ5GYAkBA3vnyYo/Od7wHdWd87YzJVPmwTApW4cFxNMm5kpkGold8M
	A+GNfUNpKTzrAN/9G3FkhKsnuT9CZvY43m0I60LVQfQHmvmmN4XbG8amZu5jaBmU
	g6tiDW+5I01Dx4SG9T++smMe3y1QxlgwlC9gzd7bYxXa/skAl25ytzWwJrfIEhTL
	Tq0+bg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaug79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960bd17b5so1082979685a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688475; x=1796293275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
        b=UDYDXEZD5QBY4H6RgTHkyDhE0yST6vBWjPkT+VteaEpGKpkYzwcL+PvAxL7lwu2oS7
         ZD+kjCt3OL9VqIM1CsbXSrPtY0Oui0tCD4rXcXEICbCn2pdmD2j5+1IbOobWml1AW65R
         W2H0AZXIqZDqd4FIczVyX+YAM85hCRLZqn5Jb/hRPM1iVqd3f2ShNe1qwt/HE2P1no/i
         iW8+fGRZ3FhFIrmPpxw/Z4dI2+juBef5oJFsR5mCO0mzcNz6yIWe3Y+KqjolWCqgtlai
         qCtFugAEPlpYDllsFuiB5eqaT9yNdaxI0E/DGc0bvs5vj3dBPgMEI4a6QaU7gvj0aHeU
         /RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688475; x=1796293275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
        b=A4E2Fqw/32uLuhw9daRFB4nzUM2I1SUtiXml6cNNEQCZ2cAEpmA9M0mluf8VYfqEOV
         9pNI3qAW87q9ByJphXUNYDqBoPkyC5qanRafDdBxzR1VmmMZQerjsmrJ+G6D1gNEbIwh
         4Xrn+P+qznq5QfliSrWVBgEXdM5OgYJ+6+4RqMVEwgWPhkYoBHpPkt+7Rkxe7DGsn4E9
         0EJOit0z54fC8NHT/RHYCsqiVIwGXRdKUG1q4VYWNVoEDMvmzYbzrFxoVSefJqne6u4b
         zvOh5MrdkD3v+P/8TdHVNfoA+YbsTEjZqMc6MdnyyurlrhjWF/AtrlbocXh7+pnCYToQ
         ZaUg==
X-Forwarded-Encrypted: i=1; AL+hErHGCi96Odp079gLsgiXE/FUmG/RjJdjhH8avD6f1BXFg8EMI9iOabASsYTHSN3KmG+13jngqtkL3c1+@vger.kernel.org
X-Gm-Message-State: APuU4Z9YCfCOxZ8SIc3Mgkj45+BHgjBuqBxSBtAz6gVFPqNveIR3OhyU
	9B45NAioOuB9rcV3RVOZbJvrgnskLQfvyMkRhH31s4SDs8hOCOgIHCzQ9yYXq3vzlkcAkUjqlT4
	pzLgqHTfynLnNiSCcP2jcYcdBJuNlrUUYoinWNPrzX+rsLR8sDBbrm4EeESZ+Evyh
X-Gm-Gg: AZFdTZfw48JP5RD3L3WIiarIuSygpemxHadpbwuVnTHeV76FZx64O+UYhLdMX1Hx4w0
	bRUfC7nODtm62N6mR6tp2kJjroZOEFUbnorkQ139dIIheezdHE3SnLfgO2JfCkGedR0ktId95Vq
	dwQd4hr6mDq/YB+HnpNpXqm1qd881ZD5BAUzaEYTfvWRji4i62wFVApuP9CL4bHLCmxLHq/zE36
	piJePciSLDr77VQUyWyakILR9SIhITonKdEoWjY95oN8KxB6OYk5pwV0Pkelx39pB3/wbdSveAM
	nP4hBGQeOZgNZ9i/WmBryb/Dv1S4iSVeGLpgZ6GI1FcmKaEyPYqjMYuC8Qwt2mGBdKHRP6/vK7m
	brr7h3VoWOLbaI94jTUiVmQxQVjuRNTy6Qz9oWl4hzIglZmz/kQQHk0ehc0KSCOBvBj2WjJmrW7
	J3cG8aq8TtTUBF+4nt/CfZpSscg5m+U01dIwiWlscstAxeuj5y+faatmaxWdkAvAM=
X-Received: by 2002:a05:620a:6487:b0:949:9a8c:7052 with SMTP id af79cd13be357-949bab1577cmr3086814785a.70.1795688475348;
        Thu, 26 Nov 2026 02:21:15 -0800 (PST)
X-Received: by 2002:a05:620a:6487:b0:949:9a8c:7052 with SMTP id af79cd13be357-949bab1577cmr3086810785a.70.1795688474836;
        Thu, 26 Nov 2026 02:21:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:05 +0100
Subject: [PATCH v2 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-1-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HuQaVy0w9sKhfLfcac7vUBnQCG6ABvcFlLk85ZOsULw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTTHs0R4uOlA8vgXUYmQEhLdFLXMWcy0IGC
 umTJqNPYhiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 wz5wD/9Glzv7uPllPNGfQuUx1EHN3JQhGMFONxXQy5iBEqnFvMKyAaDGxc+to0UeAyAcX1zTu5w
 vt67t4hc0rT46DGlnbsdSsoYf6P+3JQpDJ+SaiNWFUb0gw56BYL1JJtLCOu3b6vCQm7drEk5Dv/
 P0LP2p0jPxUeYr+3NS3A78mMvjtGnDoXN9es5KTy94MN8F7db2xwMM2YGDt6gFvJa9DyvMbu+4r
 lfujdzqd+VubD/VOiOYOT1tpCz17y/CtTuq9UM7S1OJyt5Vo7ETpOWZMqVULfRZ2Ls7O6Uw6bAC
 ijucnrXGK504DhpQqhFQcyMjfVughPgZaS15YW9gvjgSBEKmpD4SveVr+VkYymZxec4p6dIjtlr
 pBY3n9HbXXVnnpRv6GSZUvhyC6VQrc/2XXpIwp0ZLiEi1UGQM9ZRrtrvAwOfKpoia2TSSkS6Kr5
 AdrCKt7lCkz4mVrOneOkC6qGI08e1RQ8LmkF4hlI0xBUclYhxhj16MJ6OhxR2Q60c8bIgkAo83c
 g4r9Asr8twrXPurjKcYUSUNp4SwM0r/97ay0Jcil1vRtuqPhGXiHyWXuGFI47DGyZDOT30bbQGJ
 NDN5H5a53MmrXoVc+8FtfihqpJvmtbfUtaM5NWThnh/zYecetX/RY+1cIm9kPB0NOlqqy6C6oRD
 mhC647v+Xsha8wQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX4tCH05a+Woe8
 1+BM0mvBz8wfVenfDSY9ec98wf7udldL9jP5DnhEMRTREPF2FwpaUyEsbVkVXLvRd8ZA96Yslri
 +miUgTjfpqvQeU7FKlGWVWSX2NgB61s=
X-Proofpoint-ORIG-GUID: sRAaVoIRE49U9E7_rZYz-uT5oFifLmoF
X-Proofpoint-GUID: sRAaVoIRE49U9E7_rZYz-uT5oFifLmoF
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b08081c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6-PDsE6mYu08rWp6JRYA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX3QnJ8rLMay/r
 sism5BVOYpNmcQlmchTP8XJm5CrYVQw8uIwp4P+LQwJqDuuSLcGgOeLKQaA7XoWicx38ykQKC/e
 K9xLxvIVQeddruzIF5/6DgeuEDML6uxiFp1CgnxoC5/xn51iEXLLxwmX/hS+Z0kCqB1fVKhqShP
 6cZsn61RMEcgMzVBU2bKX0j7lShezNpkt8dv+bhmC+LImoq7uzGpp2zJUBDP1FQ7OH7CwAf83OY
 S2l6NdMhffX9ciWdgWqZeQR5tqKR9+/LTtccJi3DjJ7UQcstujZ1JVhQo2raQxrT8IJVfGNzmM6
 es0+Clb8LstBvUJcZarkyIT4JEsT5D7pW93y0TL/6Iaaok6fXiaix01Mn1i+G5DnryznF7jnceo
 bhf+KVd5Ab2vnWJgiA8ZzrGs78JZFsks9CrrrQ1cuZuNKvJRmsFUUarzCCxkU7vB+u6/4L2Q0Sc
 6jIK3X1Y+dVuwWohX6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the sm8250 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index abf5f68ef62f58eeee3354ed8731d194d6d60b5c..8791b4f0dde415e1dd2e61e2219392782c4752d1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1026,7 +1026,7 @@ static const struct pinfunction sm8250_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
 	MSM_PIN_FUNCTION(dp_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

