Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498497;
	b=2pwk//Ram6Vi3jSNU8+PE7g9eTOZswTpJ1THzfFnUD+kYF1CBec4e4pZPjyMl8vKbdXa
	 NaSl/aUcUrsZ/TH4ZXJflpOvwePxd9UF7zbyFcHEPmxFa5EeTrKToJLTbC+/U48jlrjMP
	 Q8B9+vzM4eotrztpHJENn1OskST2trqmckHhJH3D0TdE29vytoAfZZSFKG4dWqXzhJbke
	 R4kmrEmznREWqA92oteuWwoUhlKl7hvp+LDLtK8JDWKFiZtTQvjUMGegmApTr9Zl4FQi9
	 EqNnl2wGrn9YooMynqx/s/8TZU2HuF7nJIsmO2ZkoW6KNIn4TM9rQDb+RPs5eSe37kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
	b=mYqoEUcIBJujNs1bj2rFDyG0YqsO1/W3Ru4UKkaBvnUhB4otYW5CpBH7AK0YRkN8r4HT
	 3neWj1tr3O5Z/XA4AoX4Ye6FSGGPBzkfEpCrOB2UCbLQk5ir8TmpF1SA1UoJErjPSBDiF
	 5X2VlBQ1Jt3eIv+V2S5u23SvlBbla3Dplw/FsbhbfgzIDSbVq6S+wa5lgWaV/XM52FgPF
	 Fc9T2cD6TyYDnSTEsNkSDtpXRz6zBjpJXOikWD076fYMt2c4GTNkoEn+Vg99OBB4Fvkva
	 bcAJTTYrmfBgUcBvDWhP9nDS9llQRfK+7LGsVhNAZgeNayG3X6KO58LyHbWbQLVdasA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgfsrHAc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWIVbJ5N;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCDF606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgfsrHAc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWIVbJ5N
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxN4R1293037
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=; b=ZgfsrHAc19/T+Yp4
	jF0Vwwa2rrG73PUhzpiN0RMdXqJXl5Uwr+ElgdzsI1QDwRXWNe/N87zQ+sPomlCw
	z1XK5Vz/IiTAUrxLL+3iWXF0jlW4cW5OBBx/pSHqkdyIA8+EUKReEWA5JCp/A+N5
	mM4nLz8/+me9vupU95vRUmF6X/VNQ+l/B3zNTZdKl8RaeZSymwUa+QukI73len2P
	3BS6OxhNSXqnHcN5D3NYEjIZuRVaIyqFnkd8QdJ/rZ9sa3sTxi/YExDJ+pzl0WYg
	n9qvMr/+q0PKyK6PjkMq8CmEL6f1xwUsoZAR+lCTlPFLqt4anOpewAd64pN1FJ6i
	16V0Rg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaad898904so58709e0c.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498490; x=1793103290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
        b=QWIVbJ5NmNlYJ7p3bmYaVTQW/TxnBBWVKaliezLTGiXmLmXONDYoxW9uoR9KCIXwfr
         /zAuivXFNjO1O0YhhcO13eqOSLK/aM7+v8z5Oz50dAe5xipXu1dFKUOXczybQLI5GiPp
         L66yPFd+CZMT2q7zFZf6tihJcWl1LllDZEXo3+lHji3nVJvL3zEMztS1CBA3zElUXAAZ
         M4XGiJebEi8knCIe5me1XYFRPmSQo4Jb3rpnKksnih1n444TwZ36mPt525Zoi+rExn7t
         GhiuhMFwg4rUX0gydv9zdWfCC7CB1S/G//9RZSqR+580CMclqLkAK4xWvsdLd5/2c0TD
         qnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498490; x=1793103290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
        b=MwWBZ43CI9vHEECq5c8tfdXJ/18iQC2tMtdWdX+8zRFa4OsF+kOsH8BNmTyL9V/P1U
         8Ga+xPXQ7WmvoVa/nJ5jVoS0NkKUyshOQAPo0rXSsnD2QxQjF3G7Qv6clLKWZiR0JKVv
         CPQS8e5BvfOyE/Km+JnpAxFM/78MQ72+AMDbt/WJJNgpIREFW++w4hUDKbJMNWt5S+Bk
         HtLVyHvJqi6qMesT7jZLgSMMz7SR9OE7OMQrtDW8WBK8FIVGqR41itKkKLykcUiBJU1U
         UDnmDq5tcZhpve7QCRIHh2wIzzkEkY+IzLwig12DaB6NNzq8LC/sLj4QarObRyeI4+0N
         vq8g==
X-Forwarded-Encrypted: i=1; AKwUvByoQStDHJMwEmXRqhnXKSuzkOqw2Fr7874AoWxEN3GLGgw2pmQpigPOBCrXxNFOlZHpPUeSDvvv9zM9@vger.kernel.org
X-Gm-Message-State: AFq9FYLo2Lcdjrl6ImwZwqh6PAsLKDsnTS1yYEeXIvuyjbP0mQdPQ5gN
	GDaum5w8X4fOVI12tNVxCjPVkR3YEKWRzDn8ragLXX4aqddXC37FPc3F/+tAc13dWvjN0MSG7ic
	i4275SXaMjmC20kR4AaBVx3c7QteYYrcD8/jtcSme7Bmbg4sHCZa8sYdAZcoo/ulo
X-Gm-Gg: AYBFou3pQ0Sxbf2NtBO+NvpmpJ1o+h22fAxKee0Gs2QjoeDJwn3AXn/4l3H2S9aFiJS
	01iH3WRBYok2S8hmeq96zPcLXdjzOa6zU0bS2wORa4yvG9o+pDJFCxifoGuLrxfRoc0aX2pfDa4
	FM2ffe/j2Ga0JsF9mVOJVOwF9iGfeA6gRz806pyMCzyrsc92pxhYW/K+Y9h0oC4z63cTjdk0VPG
	7ABR7MkGlmy5yFCHf3VpWuWf0SZ9CMGkI72nZBAk6+crxKfg9MJ/tYREa5+o8gmd9GVaAyr3tKF
	9uqNedDgzcKLAqmK8utCx4m/QzIwMRXwUly1fiHqMZNT7X+p1t71lHwNKvsKhJqXUnt1F3uVySA
	JEI6zDslJqxVstGTSLus6Pg==
X-Received: by 2002:a05:6122:6c0c:b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5eae19634e4mr162836e0c.4.1792498490478;
        Tue, 20 Oct 2026 05:14:50 -0700 (PDT)
X-Received: by 2002:a05:6122:6c0c:b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5eae19634e4mr162823e0c.4.1792498490089;
        Tue, 20 Oct 2026 05:14:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40914c3fd7sm472344566b.43.2026.10.20.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:14:48 -0700 (PDT)
Message-ID: <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:14:46 +0200
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
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iLt01KsDX_2RIQGUs5l4JrcQ3i1UOSys
X-Proofpoint-ORIG-GUID: iLt01KsDX_2RIQGUs5l4JrcQ3i1UOSys
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75b40 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=YyVq5OKRWxwgIy3V0V0A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX0VBXS5GwOXy7
 7CyPZRg5elk8pO+luC9OFwSa0SRS94J9gHNw2w9CwY464TheI/G0RSm/k6xEl/msh7TcLfKe7w1
 MMJciDKH4BCUi1zfGqbDTj4QwS7ZxdkAFmCT8VDAeS0/Vb3Tponb6f+TbsPWaNTz0A7nxXk3cs4
 XYQ3vHDb6Mp4ih6Hd7vcgcJ1yHAYFJm03OL3guQyUHgwkYHfGNA+ndBrV6QFiFZoN5jIsYQgGVv
 WkuAjNBpuxX9sHr9eLcs94ZjZiysDI4UIYkglC9jeNu5nWNfKD1PjdJooah3QevXN0zDHp3eSON
 R4b0ow811LWAE7gdiKktwhf6SBbuvv4E7hLKvIoKUGMt22c8IAjqyD4H5iJKRUNhxyznL9b0Bfl
 d9hsRTQGygvVQosX4nB7xuGt0MSehvir3CYPdRzGTFBMvI1LbyPFhoDGRNMf4p9GZ7Gy2X01s+y
 N2Gdwej+iLX6Z9WXWlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX8F9Cea4yTu1G
 JN/k/p/PXTCFdW9u6qqYl9iVVjV/vMsMSsbFhLTNscX4Ux6UruLwTvJQA9w21aTVKJ/EhPVoOJU
 TlDH4VkvVWtLRznCze8U1+2q5nkQyVo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> firmware to configure platform resources such as clocks, interconnects
> and TLMM.
> Device drivers request these resources through the SCMI power, reset and
> performance protocols.  Assign each device driver a dedicated SCMI
> channel and Tx/Rx doorbells to support parallel resource requests and
> aggregation in the SCMI platform server.  Operate the SCMI server stack
> in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> communication.

[...]

> +&firmware {
> +	scm {
> +		memory-region = <&tz_ffi_mem>;
> +	};

SCM should have its own label since it's an existing node

[...]

> +&qupv3_id_0 {
> +	compatible = "qcom,sa8255p-geni-se-qup";
> +
> +	i2c0: i2c@980000 {

Likewise all of these

[...]

> +	cma: linux,cma {
> +		compatible = "shared-dma-pool";
> +		alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
> +		reusable;
> +		alignment = <0x0 0x400000>;
> +		size = <0x0 0x2000000>;
> +		linux,cma-default;

What's the nonobvious reason for this?

Konrad
