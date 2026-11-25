Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606446;
	b=xnkJTJudUPINjFZGsVAtztAnkkbAEoa36Pq5ZBx4hjYlQvs+EldfqFuFjOiCsm7Muc39
	 E01/QVMdGxt0yfYwUdmfCoaejM0qzoZ1qZ9UNk28I3HiJSTMPy7YZZUPpayOp/0fdTX5N
	 Hd1o+SeN1QIC99niX0BRiL2MI6DHBj68k+vu1Kq8iNU4RdZ7nAavEosFdz0d4jdlnnanO
	 2mc5C+Bi31wliY9G+7g/XOzoTza1KSEq78q02k98oVHN/Ypdd2Wmfmuw4IxSth87jYcFc
	 ZkPgl53u2f+oqhwz78JM888CrnzZkF8EGcTnoaj8tT8Vx6tT+a7rUkyHNvWMixBhLvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
	b=b8mZjCWqxWorEZJqQaHBTXVRmvIC/dSHoG6qMXUPkjtBiimixjXko5AYK00XO2UwV6xz
	 Dn9jYf/hBgoeCm6ZYFr8GCn2OOZyR5xIq3ywvYky+rv7fW9ZMkiTPPzxjq2paNqz2LXK0
	 +g/dGO4kw6OhMPpoft3LoMrU8my85tIl7w44owQEWGnve4XH+Ou8npuTS5P+K+9nhNJpk
	 uz2h8G/rYrR9LkTQjuo4B7eHQ6qUxWN+yStby4J703xe96fG7XDEJpqjAJTgl8gY1TZtI
	 0hvvXoQrLDR89MxMF6HYjYVFkfQONIlomGyN/EedORuavKzOPkQQwUwF1JkNAyIJJWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KygF8YWd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WeA7TtPH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91897606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91897606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KygF8YWd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WeA7TtPH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mf3E796867
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=; b=KygF8YWd1LOeBnFz
	agQeX+s2Ds4MplCN/Tfo4biB7fP373X2rU2171awL1QuhFxQJc2JqMnEVhtDo70K
	1n5fvMXP+WZcUO+8atBTKPQcuYodxzBR1U1vek3ZUFful9v6AkFxH2mmJVZHit7e
	ZXP7pKyOqz/M/vuu+QthDsam4roucwyQb3pGjnSEfNl1alw4J31H69C4LsZXz4o/
	crBdqSPHIXrAuPERPWiz8a4ypwUA1vwgVPSlS9PPE3Oyk8S2pQz2CtqPSo3xb/H3
	PT3GlzcKH7AuXcawIDxIj2gs/vGtTV7pZ+dAlJiQkhTHZD/sLiQricf5OAhPqCQ0
	DG3Ggw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtfbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:34:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d3ad11f50so7639931cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606444; x=1796211244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
        b=WeA7TtPHRxQ0G+Xy/somJNID59Z6rMEsnyQBVCjnkCTCh2fB+d7dPM+8iRTxRVQZcD
         /LUoqjDFB+WM5ZT4Cji4shWsjSlInzB0KlwRhigLBCtY4hUcU3HX/Cv9NuUcFir87nvx
         MhGfOYcijLSyvHpElOcl7SWiyZe88uccwckEq9Km/FRcxDL3aN9NhzysTgkYKT0mNlFN
         ZbfFolaiJwLuA2rU2mq94wPf09Iqhq68eY+1AtXXcSF7UQXm58OU38xoKB3BRGco0Teu
         MstdaJz2HezJaKDdQp0SGKhr1EHv3We8ZE7Re/3wuykbnDbWeR8c5BaAS3sQaExV9aGy
         DXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606444; x=1796211244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
        b=dlDMyOvzgVankxkdPdoklAdelPhIr0dll4a76F6XpUSHRTqNkCybzvWo9NvEgy7jzY
         9ZgIDsH1hA+0aD6C3nd9SUBHOMsiQBwC9wRf7KYIB9zKXk4muPWD+MMbQNwZvetSrS4u
         Yunj9213Qk3ysHGjYRh++Vts71kBv3y6tVdGMPDEtoDxeGb4Oav0C/OvDsdyBHccCD3v
         pIOcScBRCzqQ1KT5Yo2tZu+wrtXzV23Oiurt0863bZfUiWXlvtluHsZ5wSMgFkFKAJD1
         sx59XmRAv7u1qVolfpdHp45yMQlGL6+9EiKIlfPwPTVlr2magY6unQsHpc7MDfRhG1Cs
         W7Zg==
X-Forwarded-Encrypted: i=1; AL+hErGcWIt9vIVcQwsMHC9Lk5CuQy9xrJqIdRyJ6Tmn09I9ggKHcTVzlqLEau0HpF68Q79WKet9ZmZdbc4Q@vger.kernel.org
X-Gm-Message-State: APuU4Z81FQ33hPLCN6uc4cfmAH/6ig+T07ICMqxagxNG7rbw9bctg+h7
	IAxfmwGfBv+J4xvAvuGcnXDD1r//3YZTdokyivCbnUpiJENwqUxn4Xj6SeYR1bLG5ZQ1Hd9sz8S
	F1Xd6BtsjxnwNm7kLPUw0Bjj2MRL4Hb1KUNYDEIR7ZOVDn2KNLUU6iKO/jK0859OK
X-Gm-Gg: AZFdTZctjjGg9gHTWFsIRNxDLEnuTkSddWLo19ns6iTj4qtHF9HMt2iWF1femX2LODh
	nVw1TfU5sYz176bBi59YcwmWIEu2+9rEUMo1mEz29oLMRXM9ypJ+Tojwr7z+JRqqMDLyWz5mA6j
	F0p3wNTfGIMWNPCKbR+kOLdHwNcW1Srb0vRbNIR84hrOEYrW9oS3AZWmKwUmdLinMX89Q2YmOYB
	eD//cko/WWxGMzL28prtYiBdJ73Klk+KyXUbm0YNNOzJkv//x1yeGE+IC5LNMun0M0N0c/fdaT4
	zuDLC2tnV1N4mJnJhG6utsuOr9J9gHmoG54Qg7dKFOSsrM3oQD+Xwzir7MC+JFJrtewo6c6Bo3/
	OpDy0hZYIZR0wXv/mk5ZX4mX3zazOcfSjMII0PoACnwTsahtUUd5KF8fO3RBo7Y+ijFlLAso=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr295532381cf.3.1795606443785;
        Wed, 25 Nov 2026 03:34:03 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr295531901cf.3.1795606443307;
        Wed, 25 Nov 2026 03:34:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm621435066b.29.2026.11.25.03.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:34:02 -0800 (PST)
Message-ID: <862d4e46-8999-4b26-8bc8-f7a3a82f66fe@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:34:00 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: qcom: sm8550: add the egpio function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-11-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-11-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX5o4fxvPjzs6/
 pvj1SDQWgPT7XGyQ8VaKvpELI2BV/u2prxzgH70/V/bAVy3+QdGBNh8nCQB82XnRMk/KEiA31oV
 yM5WuOlVfJ6FbMJ0gRI3oZ1qrwV1rVEF3ExR8PG9Z7jmcBQ3q3MgSYuynNI7LI9gM4G0edJHO8f
 M69LFAh1anuJ6ME1YjJNX6RsxPeZ/4MhgprRN6k7Rd5tYxg0y6IjvLfSa62hzBRu7eKVdWIegrY
 3fnkrxal82ve/ymruS6OuHd4QRZ4prHijNcbNChrwOofXNFpStOatc3lgEAqkD5A1wVnciWy3r5
 h5S4jh7dynpO7qrh2xWWBA5nYBulrVfxjxycGPwJdw7ptp6IWD3GeYVZrJH6xlqgXx4IKqG5/is
 VhBz/A5uICSyEKKrN+KoskUSvEO/OOfNrISaQFTW2px2eSdvQcqcQntyD/FaVFQdC8neeTFp+DW
 6HKz4rs7uUsJpocMEyg==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06c7ac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JjaA4w47dj37y3qDwwgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 52swTADMqxR5DVKXlXwDrZOdFfwOZdDl
X-Proofpoint-ORIG-GUID: 52swTADMqxR5DVKXlXwDrZOdFfwOZdDl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX6k4NU5f7xYNT
 fWO0OGCiPE2V7JXrtG2J/uqr976fxtLG7y/nHrQ9XZZFx4ELh0L46Dt80akqVtolOHzUONnCH4e
 W2SWBQhQ1PCUnVIscSpn4NJSNMEcZ2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The sm8550 driver sets .egpio_func but never defines the egpio function.
> Once muxed by the APSS TLMM, an egpio-capable pin can never be handed
> back to the LPASS or SSC island.
> 
> Add the egpio function for GPIO 120 and GPIOs 165-209.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
