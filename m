Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757890;
	b=Nz3/trAPTeypcMGx59Oi1m9NCFLTsFO1p58F87oYd+Qt9e0bNmZAmiDdRVger6t1CyaD
	 JMzcxo11j8lqtf1OVIkFfkzfhg4/9+nY2Q9ZDHpIRk0jPH7D6rorbw9H+OZA4bneA7z5W
	 CvsI24bZiH3evx9mw5zmglKU4x23oVHFj10RcmmQvsb5ZEN5br4ALcLJkyLB18UrBRNSi
	 JJWA658Z2YFbhUwRpHasGK8HAURAAlNWw+PLPdBryK8ZhqcVuhGqhTV4h4CLkOYbWrsY+
	 4SSth73HTRYSV/tUx+OwS4alLiE+Q0ck3ZETrw/d2tjzFwSfha/Sza0g1xogwu6YoaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
	b=JetKbCGXQPPKScnrMIaICxwojXLUQ6DI3yfIhF96NxCE9g73OH+r5775ktTfYl3ox0Ws
	 u+TNKd/NRRqroNdT2USJQtzqBAhcniarXxI5Yw0H+PuYEIfMtpgASUaKUqbl7NjNtnwQ2
	 CQbXOMwhrUUTs7Ny4bKlEkWrIWs2hfg8IRWcB9HOdjUJ8bDeHNEa154zgatkJ2crLiVxs
	 gDf7M4kdUKhb3bvBD47Z1iiYqTG/Xng7TVR1tITL6Aae4qHT+J7nDVK65//g/qQbIshAn
	 uzV4NEwvlNnjAKzTvprkd87XyQ/8B27P17idBJak4NV1GrCRm0GiudJhiV2w/NFYM8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBaCu4fo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZ+5j0s6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D74606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D74606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBaCu4fo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZ+5j0s6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwoFu1012321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=; b=lBaCu4fo6I1f0hp/
	9m0DXSBssWM1gumZcrCKWjXEhx4lFammqAoX5r5Ct6t2qWv9IvQGxqF9w1Xfp17t
	xUDN4YZCR4uz81q1x05mCTmS1BJLfO2C7Brzr0rcSh1zlmF04VKtX4eAp9gEarYj
	bqt47CE13uHX6W5bsYiXPOYTRojsS9OpyM6y7YHfUfT1VZvZWN72GFRotJBK+sxh
	zDvlqtKMtYYVh4LekXeZBVtXeYYkeOZWZtTs2deyc9oalS6j/MZ/nmC5uYcKrqc6
	Vqj2NKCFPtX88jsyFXeMqeoeaKtCmlvXPAGttztbw921f1JK/v8OdQneMeKHLE56
	G7d23A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf91x2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:38:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so9052346a91.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795757889; x=1796362689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
        b=cZ+5j0s6Bw+cijAnbD/1oQ+VmctASDRDfdwOupth/TZ+ZtGDgzgC7qvLJlbL4bNHrd
         URCKP6fuj771aHw75KYZ78J8h4uj+hCIgpLiVLIlIyxJhgxTLUpSJeWyFNWh1fA3tKB6
         EY/asbP7VinEqV0ZSsM9rHuoKfEKcHF08gFAwggoefJ23K5YlBEqAj8Ba9ZawPzmXZ2s
         /8B2P1DIcW45vyvan4YnZ1YZnuyqdxaLaQ7GybzQiH0lQvPod7AJjHsGTFBQi2gihTaS
         ZN/0sC0SMdxAO3fUA4XNmapSI/aPwF9kbSiSVWG4hitmD41cfirsMAUIn1ewceG9eM/D
         7gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757889; x=1796362689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
        b=2dEEk7HVjXb9J5dO3js4JvurddYhhnLuWBlWHnhRp74tEAgQZWvDxmgPHzbqu5J6/l
         bEdFpiCZVakyaqjGJcGWimcX0bnYsmVZKeC6urCaw3419sYgq5eaDAeA0oGFLB6X/vV2
         B3IEmodqz46GW34lVqeSnivO4vqMJKBwEQPICR06JN/xg4C4XdcmymGMciJi+MRlX+Uv
         8MMBRiSKioHk3dZaJmE62PwWBnnTouaLhIKCgwI432hsZjSihqttvjYA0nEJsA62JNal
         5j9cM5ab1ANpUfjw9fFwqR5r5+yxYZnRuU/6TjkV+YjyXtlNngIaFx3KnS6w+DbqdS8x
         QICw==
X-Forwarded-Encrypted: i=1; AL+hErGC3iXC1wfHIGUaM7vgFwZK8XtQJsAj+muaEUvArZ7BK+Gq/XdfbICDEds9oNcxJXxK+6f9qHAb8LZk@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oxz7Tmyu/UbEXWJOlw5JWKVy+HmxBA7tWRpQURP6K/HHkJVOW
	/r/51a5uhzwwO6SkBlUHoxZdkaEAC6ffIdOOsN5ijtshh4pWTYicCb8dgrTfvPSpZg2iMqXEMX9
	q2fvqKlq+/gD6qKDtme3NyjiRayRpUBoLyMCF52qbfWgZJU107zem8CDYmRLfERpc
X-Gm-Gg: AZFdTZfUKggoE3o34mXd1XCTK4JMMO7JYUYYhRZ2x66qbGWk3EiycUMCrsXUjXrPlkv
	Ycg/7C/IB7slC+p6cHxXFWSk1yWaHndyLvYqzyDhiRh2b71kL2bKi3133K1eNRKUjs+keZnk/Iv
	9UlqVj5l6By563C9S1n7S71ixXgh7c/jRZmUPbDl0AaoitzqqELGpthvclwOboBAqZefKVfgfcT
	OkQViXADIMoE5hfdJcEA7x6uvx+TVpKfT5iwby5ZIZXRyvjN9LELi8X6SY6l5jfNvdy3AG7PiuZ
	68HnCWxcZ4HLTrcmGbbBKTseyzsck/z1kqq2OhoCSn/stihM23301JXTt59Z2zBmeP7Emsrts3V
	a9JYzgWnsg+KH5RDg2xxfKbOIehfMW1j6T7yXgNQhXipkUVy3rkw+WN12/IsriKrk3n3hVerq4f
	FYCJqf
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id 98e67ed59e1d1-3b41c7e119bmr22968541a91.1.1795757888704;
        Thu, 26 Nov 2026 21:38:08 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id 98e67ed59e1d1-3b41c7e119bmr22968496a91.1.1795757888236;
        Thu, 26 Nov 2026 21:38:08 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm38855983a91.16.2026.11.26.21.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:38:07 -0800 (PST)
Message-ID: <ce0b6c2e-e913-4c8c-9acf-7bbd443f5fb4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:08:01 +0530
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
 <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7Zz0jT8ovfl1DLs22y7_DN2iOAz7UO2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX4aTrRMPIZwJz
 8nj3Lni9aPrU1xdC9rxmapRgAL/7k0ZWEH3pntH3vmSER8eIt2afgPP1IDFoQ+U+PggSYSTF7Cv
 amVb4DKSfBMrOc8uKbF6WUXijl4KCPlgYPtHbLqMyyCNTELq1knKiFUir8dmkzqMDzKtTUjFrKC
 8fPm/SDYj0XoIuScwWimJPEWcDU9nVzGJL6U96Hv1SFCnrpnP4vmoiJSIrgmJGOIF9Gx1JqS+bt
 sHUdRNhoGgpGzvgHAaAbZxfYaVLm/+/yIHlOU/THQX7wKoIXsP7oxpz5E748zcr9dpt7iTL3+ei
 /aGi+1uTVE/3k76xQa4V0v3/7VWyoUJ/TlD0tPWYVrahRxAi/dA/f/wGgEy3MTa2XFLTrB7i/tj
 LXYSCZwAgPc6AFjgPVPVsM7oG0mbLBUkcn3sWGRKKORCYawj1x/e2H03ORPROOpbYk6v86w/mf2
 XV/PTHXRKUdRwawhBGQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b091741 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=YcclnU47V90UdgMnL5QA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX9bDHeJUmREl1
 jTQKAxFx4WPEidb0o459VPCCRA8YVKWGAzevzMIEvg9YcUBxDiZv4ZblWq2vxJXCp7TNcPhzwQU
 +OrSIE4dESPdVmxB4hhYtZU/V9kOUVo=
X-Proofpoint-GUID: 7Zz0jT8ovfl1DLs22y7_DN2iOAz7UO2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

On 26-11-2026 19:46, Konrad Dybcio wrote:
> On 11/16/26 9:59 AM, Kuldeep Singh wrote:
>> Shikra QCE requires an explicit core clock, which is missing from the
>> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
>> and specify core clock to match updated binding description.
>> The crypto interconnect path is already described by SCM node, which
>> votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
>> the QCE node.
> 
> I understand the need for the clock, I don't quite see what we
> achieve by removing the interconnect

Yes, interconnect voting should happen and I fixed that in v4.

-- 
Regards
Kuldeep

