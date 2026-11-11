Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370828;
	b=XnVkcuyCT+5kiCqut+JORuC/9bgQi1UCAbJ64yf9J0edCLFc+gao8Dz5aHLjBdg8U03n
	 bh8o78Q6AMdztX7COjWSjwPRVxhgvnRys8P0mXLKW+g/HDrv3xWuO+x5KgHNWueYw0umj
	 LooZmuN4j2cPONcYUq+W0Y6NubC5DgXpVkH4/78/WKrYy+8ux5aEw2TE2ARHGmKZQCuaw
	 4eMWTtF1eo+ggNR/cA+rPmAvk07YftdeiE9YV5Kon5vlrjDx1gKRjGAX9x3qoNDqUHr33
	 mqs3+ktymlH54qoKImUv/iCuMWeLUaxS1Fx1V6gK7glC3nx4rtMkfnzGAVmaXeD6svw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
	b=yJzwGpwfofuqyK35WpjHdOj08GoWB++/2qJw6G8qMTwsQsV1iq3kQLU5MBoQA4M6HTLo
	 qBoWHHS/bkjn9g0A1QJPtsKVGgncIe1BodyDhpK4CLQzzluJrx291W8ja3glPKr+3TE6G
	 5NlHdj2V+dVqcJzOoQhx212ljJ6Iqn41VOSZoED2i6jnQNgQEK7aBwSJUse6sXRHRpai8
	 axMuOOQoVPca0Qw0Ab9rkXL0AGRF744zI6GtzPP5SJHWxE+/IlSvWYcYh0E6BHnl6f7de
	 CqfLaYQuCJ209M4sBSlXNhunk6TGY3RZllazFyH5M9+M9Q7ax0VKvT5ql/rK6QJPqPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV7N11Ml;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0l7EcQT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F70606A336
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F70606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV7N11Ml;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0l7EcQT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB28wWP449517
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6VnyTbD/yi
	L2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=; b=PV7N11MljGmeoTMURIC+lfZmtQu
	2+X6oNuhDRpA8aHtgZ2L+nzXiy/PhqYS+0sTSNzQT8FwaNUXvhIR0DVpxSI+5MTe
	J71UE7DOkL1jnxoo2a7vfc0XUXA0IIQo5OvuYOYLz5B99vcvKdKLEdNDXxIas1rs
	vlaUOlQAHl+KqO7+HaG1uhXBGiFrVTJHO/RSqA2sT2qnTGrhZfd8OGnwCu0SnSXz
	9JNZsWtWt8hAq6Pyfkh9+GHgqApKSA4pGHIjAsEpIMWtamEsgEmgzuxL1zbRb5xH
	MOJ/1zCV4Ak3wDFM2TP1Y37Dg1wRla3OlhjHyh5YjMkdYkF+maw9vWGOxAQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawgdht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2444837c88.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794370826; x=1794975626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=O0l7EcQTRBFNrzpTthQ4gQiOymaC4nen2WyPGICa29W6OfXOh6UQjuu3VKIheZwfup
         hi/HWbzB8HX5LqmlkYd4svM0O9JCCBiMn3ro3cSv40CBgD5aHAna3AhugSeyT9uc3Edz
         anzK1H3be9/KK5W1r0BssqLpL46L73NWbWAodds8ZRutX/DdjOWI1LXVuF3WTVTH9pPh
         WbHEIJcGpbQ99aT/IUVbqZmUhpLLr+VXDV5qNWEc0otr/oaAUNo5jUBJ/mMZS7r5w7JP
         QgA3zqTVlrp/GPBpRwyW2vw8qWD+P4E86DsNrD8Z5kOxeZFg7SZ0EcJA8z8GGWeJ92PX
         kueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370826; x=1794975626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=1t7a6iKcQvi9NGJ1l/ub9R6jLsVDdJFKZWo8KD3b1JHvlu/c9eMSLJkwyMnusUdkSE
         R7pIeBFDepbZ4A4pkVDxPjVqy1MvT+468yZJFiQBml/SuEUd5Cm62hScSjv5YPk1g6MI
         Z5EaskaE4FY1IaG8NvtI5CB+wx7Hi/Kela35a+Ry4WpFYw7DxnAIMslKfeHpWtjdYaRd
         i5m29/j2tpP+iqhuo0R/Mxox1CqXT1XKdvkQj0CjobTX/75RwjzAkDyAcHoqYwA+rbpC
         41XfD6omuYFSXJ/TrHpcjZlKvHnFRL2orYRjWJ3ezY6vur6LSHGiEgBCK5RUfQ1mV3/L
         U1sA==
X-Forwarded-Encrypted: i=1; AL+hErEVYdzBIzo2693JSfiu9FzWzjUGwAwDaiYOMHuMXt1RX8FXKVEK8ALEBw1z95DtyQSCQHAmYShvOtRs@vger.kernel.org
X-Gm-Message-State: APuU4Z/Se/uKrQoHdbFQTW24rZXhdbpOEjfsS9Y2OPgJWl3abxwumz4M
	HfghS806qqfsY0Q3zvuyvRxiDUNyjOlplYEosTM1geMCznpe7VWG58cmJQcYF6G3Ez/+99y0eZg
	s/p1hkyOyoZ44XjEmxcuKwrzUXZ1yAYBKtNdQ1cp1kKHvXXGY0qiDbPil4pnkVGv1
X-Gm-Gg: AYBFou29n23kKj+auBAnzLiueutWv01wRx0x9Yr+vKkaya1zOINSCOhxWEYR5ozN4D+
	oGVeY9TeJ39bevwVAXEr7ekfb3qpCgQNCJ0GQg/sssPzNogBdQYaAy9d71R4402nfYdBWlIXofH
	gpsW/NDgWViUpnMzn1osc/1flqvsR2QZahIEFLOHbfvBuBqPAskDvJHNLn+O8dfY1IFu43GCxlS
	z5Gq9hedz4nYKPzmrsyhYzdtTLiT7s1wtkKE6kapy76Ys3HWn2vaeCQ2xidodZiIto4EXUL+OhF
	vTm7Z1+uLIcPdlAOD6OEf+iWTR4RAbqUhdoSq2Loy+yFLuDPGYGY0iWQEkxb+WOR7HlmaY5/Dyw
	XuSLY2xmJgbjpWVVEHLfbYO0agI6uF/x7EeSQrl2hliJ7L0V+bjqZUDeaJeds/TIs71V5EkzWQA
	jFmA2bcN83Mt2iwzXHIfQqmHCaOlhpHse9
X-Received: by 2002:a05:701b:2212:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3c0376554mr1193723c88.42.1794370825433;
        Tue, 10 Nov 2026 20:20:25 -0800 (PST)
X-Received: by 2002:a05:701b:2212:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3c0376554mr1193689c88.42.1794370824674;
        Tue, 10 Nov 2026 20:20:24 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm21690542eec.16.2026.11.10.20.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:24 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Wed, 11 Nov 2026 12:19:39 +0800
Message-ID: <20261111041956.3639092-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
References: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX5ybqd20ZqQ8p
 JeTCCdN2brmhokparsvMpDFwUbkTrQK0qkZfslwqyz4sDaOvqTzup+iDeppTfr57judh9gMi1kz
 tb0i1RsG3onBP8B8p5BuFylrbvqrJPE=
X-Proofpoint-ORIG-GUID: 7ln1vzn9u4rvON8t1rDvwANOSLuhYZ25
X-Proofpoint-GUID: 7ln1vzn9u4rvON8t1rDvwANOSLuhYZ25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfXxcTabCej72RT
 Y7Y9CMakYCRUkUXsexM1u2ElVLf+0YM/fsYwk1+5dMQexXPxiRf1YB/Cs34bUVAmZ9kdwNIaVmX
 uMBKA9+TvX5RpcNUrUT/GzSfRm36azpNloA+jXqpLFSeb7btqi/5BTFXJoFTujr4oWZIcIGIWak
 lFw7C2w5wha34D6SXND6hIuzV23hC2Q5oSAbwhhmBTF/W/m6SQdGdqqBwsN+vl0T9Z4TFuZq61d
 mYfIldVh7IMFqv4M0hjGEiBA1xXUp+0qPM/P4R2u41nBYJZnz5ebbk4FwPEB/WwEIQvdWkODGbk
 lAh68zTFv5k4+pHsuBSz0wjEO2yzrnor3PpJqU42J/k3DlvY4D1//MYvQtCyTevElhV92z+XHgO
 /pPEtfWLIkI5UGVyLmL0ZIwYhgSCAoHlcSv0AzsgJDEG0kOxcZ2/7YznhU4cFlUaC2dIjcjcAcQ
 VUmX+fthYETzlSKFlgg==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af3ed0a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Pbp3yVwj6iIoPtAh08QA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110017

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

