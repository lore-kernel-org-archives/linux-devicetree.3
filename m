Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703534;
	b=Sg9Irrvug2PzMYIQADD7XbYEGqfJrYciuj1BxBhkRpMOw2p3KqR9GIemNRmCIgNsUoMt
	 jnJUJ8Z0tOjIYVb1FpDVA3m2KvBRUAEWwwiUWZYCp4O1cM9Q7/1EyApk92QBDXziA9bfT
	 M8hldk3H89SDtsih/Sg5wE8iZIaCN1WkUWXlT16HnOGr+pMzxGAqzSN2aKP8al6UPFaVp
	 xuLKJTD5EqPFNOPaBkou+4nw4xhIfORT1q9PMfuM1oNSfgjqqveObqBzvkYjycQN7pkBa
	 FSrxgJtTPezL0nKdD/fQgJ584R7L9vhFOYo669Su5N20/S5v8PYWp1/0Cw0+TcuJPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
	b=fGFxll1cEoj/qemLpd1Zvi+Pyp1TSx+Mtq4mrSlWlUwvg0bLZQn1NOy9iAE2vTewcIky
	 G2yjl5TAYFHCHFYfweUD0FBDK69qnn7ciVbuvRQGGyrL38jDXIJX9rG6fQcV8Toj7jzOJ
	 E06OlxnQ8BX8ZfnJkrUrb/pAWQyeH06H1whv3Jk53/QRfgJ9opYsRho8sitSYeN5PqEpF
	 lK3PUkJp01Vs9RupWUQOSmdaKrlXTVy3TEzKbruHHfgp7C/aNlZerypdbX0UeX7EnPb7g
	 eNY0PgXVeAt2baShQ+SYoEAfT609eva/nlVBT+UDjSOo9uFFxZJ/GBwsaWzEj56g62A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8m9wcIP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D70606A681
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D70606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8m9wcIP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVFwg3143527
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=; b=Zuic+b+ZyUBYCnYB
	Ye31Y4qBd2rm+sfBodz25oJpX2oO8njVZ3iT96cRqLD8R/m7BnbEP7wTfYBRlJ9m
	pXTy0u9zfxXuJJ7QD+Hj9MgnsGHdl/ZtQkcDWCA9EEDYTqaD2qKzdpkB46Bh+Hg4
	uNtratNK0owXs+ywKZ8YU5q1oiz3O5ddToJLkSJQ7dSyvnZUhxnQWiX7uBkNv8Jd
	wWFYC2RFQKK/01Sy5OHaeh7BvkdKsxwPJITg5FWTnDUXWolrZyFmFXwNXVqNEbfg
	Uu54Wdu73yaxZACxCoxO1iJbKY3mZdAA1T2dHhE468o2DawfxaNAYpfsYm+d1c9i
	mDRKOw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvsp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-574524df347so660495b6e.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703531; x=1796308331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=P8m9wcIP6IgcKOB1s/ujb0wz0GvlIxz6nOZhsW45kTekV5dp+ci8AU4UAIErO/sD+5
         9lTORsEF5EUbZhSqhXVZuUSHiZSZ9O8SIMjO2KerZH535dYVJR5gSR3Vfoy2wYjEyWef
         Sys8b858PzHkqTSmoBBex58feo6v8c7V65E5BtU9eTFkDbBsZTgeAXxsFzm4J9bvYcjC
         KsQ6BO10tKsdJt8D7PfcjN6KmhJ6dJaA/2g3TMspLTIJFvwjuR5Uf+SIaByjPXfKBAik
         szgtaoKv+JZ1YJIeABO4P2BVqqC4MXAHfnc0FGv8dVLANd3mrPEpMDU+th78TA56QGvi
         +eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703531; x=1796308331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=KbqjhF+3cLj/DNvjBRc1I9enPfsdIP5BhtASoKeRZKJCoT7ctzl7KSyBcNXAXyxCEo
         HtvvrD9oSf14iU+EQBvXGftd0GxZuPUFzZaP7gCbpqwu3avdFD9dAd1ChEIRnV1Q1frN
         JXL0ITUMVGw+9HWKtxf3SDVh+4n27fJMOnmGu56tQ4chI6QRSbwwp1VWWyW6g62Tm8Ap
         hYZEuH/GZgYMEaJJAf3z4rKqOOrr/2HjCrhNnDuIwAah2ZWnMijs36Ubqb8uWrOGUg+j
         Gqv1XlRdFFK92X4JECFZCfMw76vAigkSj+EQcL1IORME07BAuj4VP9a9r7CwHVHi2p23
         12zQ==
X-Forwarded-Encrypted: i=1; AL+hErHBKfFdZKblbcxeieX/22QbQfZqCkMeCadsLVGV0Eo9egPgQiuAVz5KfbCr8a+Sf5o6Wf+w1fMngWJd@vger.kernel.org
X-Gm-Message-State: APuU4Z8es67+l9xbWpmABEQnEajM3ZalcAJj/XBkX8thrqwkk1qltmTe
	lx7mC1EJaAHcAuwxoATyyJI7yzucE2Df5pSORmB39wFmv8CurWfW7vQyEhNmZa8bgMrprAVuHHi
	hMQOucZpwGYlTy/H2l4OW8Af44QFDBgV7sHZ315yTZhCCYQpUl7OPrbbp3Zg7Azl0
X-Gm-Gg: AZFdTZedjhZNCMNe99g6zz9oJEO2ZiLT8QZNO4DhUkl4RFeFVZKFgJpMWRYnT3qsg2w
	qhr/nYpsM3YkSKOkLcsjrZVT6JTkLB2PEI6vjj+/OF3Gcxce4q4ZPkOlGW9o0T1JTtDpRBAHK/b
	pfIupsl6KQL5x5UE6wNcricxzJxuVM/5Ed78kV9FJ5IpYnlNd31xkbJh2FpT6WIRTgGNNOgG5HT
	1S2NRS7TSXwGZkBMlsvqlbuUgU2wSN0rnbdjlg/xRKhAVDfvc7Cf3rEAjUH7dH9vwXnuRIabuzt
	2/6K1CqmrU6aEIK8RoeTFg8Bk4Xus3AwiVoWTRclzL8AELVm7nExlgLrR8JjGz3q4HbujvXPjGP
	MyT3EY8KWRQD0dsPA22rpYfXLtYMplbZ9svZEs3QPayVqpplm4fVhXc6k2c5PK2xCydsytvCOKP
	sy1X3K2/w=
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443868b6e.0.1795703531651;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443826b6e.0.1795703531228;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm676995995e9.10.2026.11.26.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:32:10 -0800 (PST)
Message-ID: <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:32:08 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday
 (SXR2250P)
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9ss8NG7Y7RZueOJDJHExOZWU4xK6WNDw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXznmVqqWQ0h6k
 pO0GQoQ5YYXORJmFKCGdUY5jN/VaNd4HafhvWIBLkVIW5JO+DWxAwyp681az4fL6MRqnJR092Om
 4C6jd8ZtVv4MjAJzlGbNRktWTx80yus=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX4PBpCclsZO4u
 sE1Z7M2Ko9JlmRJL3HjTM5RP3o4q7u5PcWsGdBm5VyWwNPAGHVXzC9kFFm4jXut2K91lSan30vl
 rA5/df895faeQO+X5GsU2JWMbzJ0J/9tPQXD2LSYtzgwRsTBUE8SKF3cIbPTIJzMZIp6btf5uGo
 JxYPGMxt5ael1Qc9lZOmY0oEuKxZh1XBGlkSJLI/s0s3c0RGghDwuJegU2xzRdupMv3UrK+VagS
 iXrB/07znAs6zKhp6aCAofQ/vR6egMVVMOhh+fCiNlISZHNe6Btb4Flf7mMCitdh500DwrFsNGc
 iELJnKSDaWaWGRqQHJnB8caIQNIXY0TR4eErbokcAReBGt3kYy9y3xtvkbyd4C5Cie/+l7aqx6x
 2xjM4Mmru52tQzFNAH3qEjjbuVYdjXZVQqXZ/iydrK8Qakn08abVdL205UTU3NqsfcdW6Xhs7Ek
 fX+YHqWGNKlMjXhc9zg==
X-Proofpoint-ORIG-GUID: 9ss8NG7Y7RZueOJDJHExOZWU4xK6WNDw
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0842ec cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=dvIHkycpzy01oOa2bCIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056



On 24-Nov-26 16:29, Stanislav Aleksandrov wrote:
> This series adds the devicetree bindings and pinctrl/GPIO driver for the
> Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> Snapdragon XR2+ Gen 2) SoC.
> 
> This is part of the initial bring-up effort for Qualcomm Halliday
> and Samsung Galaxy XR.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Feedback from an LLM with doc access:

gp_pdm_mira: GPIOs 35-37 at mux 2
gp_pdm_mirb: GPIOs 88-90 at mux 2
gp_mn: GPIO63 at mux 4

Konrad
