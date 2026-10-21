Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579023;
	b=3iTsmUECCnH1syLfm7nf7fHW3PTtVGtCyi/LO5KEUcNvSTQ2cS2AwV+LJczalcYiYtx8
	 GvzAHRsCxM4PfVK5+ZpqBmGcejrwZM2NMvvErs16UUrMBHkZEvSLBhqTj5mXYfM2jTXpV
	 aDfCPk6PngSNaVu/OrDGzrbs1AvLDQme9EtoTxT7SYInU0KUYK8ELncNNmfIAQZz9T9vT
	 nGUcW6WrnusaBVe68eWpF2JuumiWNVmPWXWP/xf8+2yqMGU29EMjafXrukFnE0RprcXE2
	 KayqnrDbnrenSTisSaX6TU0GryQzOhfps8aoxjlCB7M0p+F6sQi33PH+KED10H4FQ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
	b=xrtxwvgGbdgFv7vUicPc5Wujs1EivMIXUOK6q70kSwrT+hcWeT6Z7Jve+TUTrDgIwkOv
	 gfFXSTHbvlGZXgOeBfBnSKaYA7+peO9++eFOVdXu3Zvgsg4C88zsxhuuU892YaCPsYwW9
	 TnAbMl38LrP5umpZqzkVxmdsjM/AHffD2UtZWAsDuq7rg2ZGn5fRnIKRXCA0bLoEH+oov
	 TA7ulFL5ztwgeIyjDoLI+s15doqMN0II7GGgzzfUoxHijaljnRZavoQj/rKnk9rmqw2+0
	 wXBe678w+yHnyC9Et+RCAYoCah+R4HSeCbS+KCbCQBYQjDzOu/mwhVd+D9LZIEDjesg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5F8606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5F8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6OYL118830
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=; b=lYvByqasiZYQc+Mw
	9/c0oEbK5E/s858jw6UQLLt5Vxr2aH6UxMfnu5Jx7lJFoQWeVWsbSIwveHZ+lSl9
	BWBY8ScKgyXvQKN7gEW6k6Zbs3JfdemxEcmy8N3PkShAfpI2MfD5ODL3X1w6GLgc
	9hOKQ0ybQDCHAXCu4Urc19lmx2RWHh5Oo+QH5jEudEH0WBbHmu25KygHnESqQQqa
	qA6H3+EhZWQKX1PZ9HAsicRBZvkgmQD5b532sluXsh26oYKyb7qRk3l/xhnTAUv+
	pQGiKyPAsobOXzTYG6NIzoHfKFyrVBVMwtQVShHhHaMnwCcH6RRQnlTMhuW9yM15
	43dK3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3j2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:37:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so9457685a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579021; x=1793183821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=B3AhXMHEF/HDQ81BnijAdjSTKZMV9rz7FhK2ZdDoNjtLGQ+CyOr7nyLzXN2/76NaEx
         G7soBe9KLY8Vk9gdg9JWA1hvl8Hi4QV2RpR5bRTOnYc6//AZkgM/2dxrJYfyjTDrz6/3
         Vy+3/yxYElgQIKlnUbDuo3dHxfedBJ4Gp0Zdj5aCvT8tcNrBRt+xIDfclMe6kJ3xKiut
         DZG5wnTNtZeiv7yGCVNZ6TU+3zBoyynylSL70nuAoWqaB8VAQaNow9QBvLlUZZ86DGLN
         0HED3V4oMHUnNiXwF5vXBwrV2YlAGp8D5/LdZ0qml/H5wEckG37aJ9oNgvTpzMNKRDxO
         zxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579021; x=1793183821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=PXc8l7IWLMipnlr3OKlepS2HPkeqfGFiych0nC+lhI13+Q1gYBjT91jGI6X23n+F4m
         zqxAW7tBngoCgc/cXCPXitaIVDZzFrVDAiXelydIaQHq6RNhKuQUopEOhXrH2Uw4sqPe
         eTaZsXTWuqPrwciRGcKhGlT8s1VWmKbh3ldUd7kH85bZwTkgZKObcQquDVeNZ4tDruu/
         /VYXNfwqrZ7wFxiLl48UTMhdYLOn24uUhuSjilNUJ0DTom60dcyUZGHf4r/kDEZKhZsg
         uIjb61i9KomYW7ZZ9OMpBqijkN4a+7kbovMcImWYhDIpE9rKRoRmxLTs+YImaY02Z/SL
         E+ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBznzxwj9tmEwpKTIZheBMXX8cHyrUi3dB6GsDztIpssb8A1hxBydiUOMwo2bs3J80A9eqTRaFK5YDnC@vger.kernel.org
X-Gm-Message-State: AFq9FYJn5JnbPIUt00KaOcQqpzAgWtO3PhbuCZ8+hvXbzGmNQsWOa7C4
	S2+c/5ioicAaNb6v3802sBgMaL1LZJlu0g3qGR6mDSj3hkjc57b4/mz3cK86TRbWH/IjrxfNFIr
	pnRki3qXu1AwjYaD6dTcIZ2mQsS5gUIcFibB54RDG2D7tEBmXtJLBcW8Pw9O+mVa4
X-Gm-Gg: AYBFou1ZSQCIChV+d3J+Ife5bF2EqZawA+lFrRuiRcOWw4mfmWnMmuOU0R5TgQ8V1l8
	+SLeUZ0QVHWs84bUG1G0c29UUMmXjpJwq1kGO7t3o3zcK9RJs5FTyDTaLUKICYtZe8RYEW44IYx
	OYyCM/20EzB5cIRPiXUF4S5GQIM+jbHnXQ1zcMP2KtvvLrdDw/hPu8Ku8hrlTOIIN5aNpcbrzDx
	Y34O4lWInDyYuKwIvLiKqQeerDz6NNoBiDxYKhpk4SS4BLhv5itGrdvK0ElLHo0Hk21cZCGoEtb
	qOc6cef9x2ZcjnVLh9GZWd+H48gJo+cEdilpXC3ag5rz3UUWl6ZheDNr9UPx1CyNmDio8xFhs+t
	y9+Ijcyox6RcyjFTqAHysBA==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417908085a.1.1792579020797;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417904585a.1.1792579020322;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dadecsm673656a12.11.2026.10.21.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:36:59 -0700 (PDT)
Message-ID: <14992ec8-cd5d-4245-997d-4b5ac93d0c46@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:36:56 +0200
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: motorola-dubai: Add sound card with
 aw88261 speakers
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016073157.611956-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX60bcyWNZbckc
 X8tIMQqaQ16PtuBrp9O3EQ51W7LB/WixZKRGjg9rp9d9lotlYhscRA9kFVOE5lzNCO6BxhR+iUW
 TgWbRSAKNCn/Fyo3xXGw5rk9oTdkd0I=
X-Proofpoint-ORIG-GUID: ly0fkFKdYpUfd1sPfQTcAW1Fg77LEGvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX+3wz4bRtA9Ou
 35RVU9RdZ17yCsS10aLPMjSpRQVtyOaq3P3NOsBZdHRG+0+oFfcgAZNTAA97iVJDY+yWBmGqZlz
 NfhOfzOb2SS8n8P0Pklo4vEg3++iBJ1hPUf20kSlIEH3NzhpqGBB9G5tNJtQY0sKimVKYH/ntqv
 uuTB8CCqaDFKdrjCGyUjfWTIj92PzFx1BoMGrwjCqPfBYoUZPL8OWLUdZuMgmy4FgAleOfpWfzw
 op53UcZng4G5Cdw6kQgRegIPwUU7tYSOcwWQOjVp/JeTm6vGJQ7Fe2oeWyq+roIY8jcw52KhzX2
 rHNeofCEwSQInQxb+3vOJJnZQbvFJoYnPo8CakjaRwE6cTx0hLsdYZM9Abs+UEOK7HGD6aQLCTL
 kJXJQu6cv15teGW1Q3Sht2famM3lPyInOyyJqzTgdF1uEHB7bwjVzncNKDUwpZOXX8WFlBA3+za
 uEa+uemSwhlmN+qFzTg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad895cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Uo9H-UCNI7IvtxD39T0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ly0fkFKdYpUfd1sPfQTcAW1Fg77LEGvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 9:31 AM, Val Packett wrote:
> Enable the sndcard node with three MultiMedia frontends, a USB offload
> RX link, and two Awinic AW88261 speaker amps on senary MI2S.
> 
> While here, use the correct compatible for audiocc for this phone,
> and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
