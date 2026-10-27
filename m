Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106788;
	b=QXp3+57fpT6163RgZkDJt+qo9HxQdNH5P5kKSICxV/JXQ5NJKcMJFC3N0GvNhZoDZ2MJ
	 u7mtg1XIeZP9+AUqXDkYKKPSvcjXVESFqu70t3yRTYMoJLIuIjc6KbKvWx4voLQIOQV4w
	 HrwP2+HqUIJk/G79ZSpxFUlbtK9SN+LUt0byLJDKMHfN3WqoHpeu0KliOAK7K+XHFJ8Wx
	 t0gDCBnLU4OZGQhzi5qRtmFeBZXuJy2km6CHAzsgVAMk5nK6CTMKC76rfeWUcJyzzkb4V
	 So8ztHg6ls3mC9QiiDQKw+VEqNgAzHGUqcYE2Pw9Uh4HMA++UDGdB78DuvPfVp7HaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
	b=pbbfI8wBYOECuhlriNa0XqP324ic0bjTNz1bt5LfRzTBNB+aJKvTEcqOqvtIV8hGI9kP
	 4WQhK/pbd5RimjGGLoddz1TSiJD1sTMbmLXFAHugM/P8dsgMDAn0+jWw72SqgIFouNzAW
	 0yWdnOyrpyisItAzYiL0/Dnyk/bgwSSkjDX2TvbEC43V4t+6HKpdGT75tekk0WnaQUjvE
	 OnecWDWa0S9KHwC9DT8WYRzCaT6EFIClda+Cj5pkBD2IHIGIsO1sqh+xR3ZQhrhAI3QyO
	 ONPXmac44otYgh7mZptlwEVpSvaxruRhHKWxy/xIvU/czILNXlqt/wtmK+Ld0edj7Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0SkaBPo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjJfy47U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BAE606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BAE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0SkaBPo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjJfy47U
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0ol1921832
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=; b=g0SkaBPoD2DSomoW
	C/Pw36ZqeeBH3PkKVjeb01huIbylnMejQecjdd/n465bfDGvQoTOWnhfvBXi68rS
	7ttyexsHI5SS0rtOdZ/IYu1OJHAzOqYV/sVcdE6mVfkIQcxn0L94yuMv5b+M+OKM
	3KXhN5rJ4uF6ty69PN5AtnB8CoCCwQX1nTqG7xrStx8virnkdZcIxybKj40k/ZOl
	TuIcPXFX3Cq6FBwhLcRvCxX6p4orTbFEa+4zEJ498NuGt7DF8Gm6V+olhU3vGBGw
	wweFAol6BJ+DtDGa7tf0eEhmAXe5XyiLZRE0SyeQdn1HHVyEeyxoKiUDp6XkgISo
	m4k/Jw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq690rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:13:06 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e83fd0663so4656024fac.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106786; x=1793711586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
        b=LjJfy47UB/6Xk8eCpfZEwBLMiZ3QuxxE6qJvFivEUIFPJy1i1fB189Kt1u7nPNdw/3
         ePz+OaNJq642NfGlVgIn0dCqcUhI2yRSdpDbOnjO8h/ZN5VJqms5c+Am0/xGtAxtepbT
         w9KrDrDVfs2JHxULqm4Z4tEImTBCuc8UOmWsP198a6E9Jy4aOwCDAj5e5zwRShsb4vlD
         9DOwlaH/U1rop62YSEb15XV5WSoRXHhMU5lKRKGUcRM8X+U+lrng2HQDDPja5oejDM9e
         XoQmnzelypEyrgaMGw8yqssvNVJchqH3yWxjYTcMtlZ/yBpwYWIT42p6OzZS1C6Z08o4
         uh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106786; x=1793711586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
        b=bB/MovYfVc2miUdhMDm/47ThqLF3XZFgFy6jFp7hw47CpsZMaXlaaH3T8U4ddJ5BkE
         /PVEf6WaJ133f55F6yT2D05x0FddFQz+uc5dC276HzOGe/meuyzeBanX8ix+lZroqN/4
         qeZSpnGtOXflBbgTIddkjMB0v/QGNmQMLYEAa1xCZdgUYKa5faWAjv6e/FD14gmea12Y
         CrjlNu5sPs9QbVa2eBZdtGoKQecS4RzzLdRrZiIOgAV7zlW2m4Ougyq8ca/3y2sNFLcV
         jzYiaBZEul5MgH/EoP6vNN+ZfA0a4OR+L66uvooQVq9S9/ZK+0kvAieBSbJYw8otL1D/
         o8bQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/jv78VTnCHO5V2QmCXQgamr/JQTMkl8iCCVNmJ7Luv7+gnkhvKY47JlKtiapvqMSJRBsIhOvhkS/p@vger.kernel.org
X-Gm-Message-State: AFq9FYK1gHVK7fiQY5yUnY5yVRr8GcESZcaNnC15lezdM+dI2ZlD6Hb4
	4aQMN3ssWky5llpOFkIs4e9D8pPcH6QBCfBym6t9glpagQbKyUiZdaFOy5PSrtyI3ICpChP8ULX
	3ugOmk8O7Y8YeOTVJmH/xNwpjxm+fpmqdQXNOgwruFm29NI5VYkcdJQUvk9cal+K6
X-Gm-Gg: AYBFou1P1EsiqBmIzeWHjbE6UZanjI2Q3LdoCwOPCM9YkBjECqsSvPafOcHnB2ROg8Y
	M2nGCgm8tqlmDlXPZr6GOdV3BTmEXSR/Ac3baeZXqExdwf7hN7ImJV1UURY6M+UWT56xSMCEw8W
	LAYxfQfJMlJvg+psw0ITyv1NSOH8/6hGHZbVDLJdaOt7SKCL2Zv/JBNv9L3gCHL5GXgtplQOEpX
	e2QGkDAEoBoiMkW+Z17Wa8LGlPzKx/4m1S1gEkHk5/iYDV8SIcQmh4qWb92NN1YucgkPD/Ec+pA
	JFhnmxH4EoYb4x5hGo55GlgsmWwKYfCmy4b87WNMWnOYpXXzJgl5Zz3KJeh/cRo3gpado3/JtEg
	D8Mqi59ulBWDiy9NIk64KLbDzisrNkxs=
X-Received: by 2002:a05:6871:2114:b0:4a7:c737:5a11 with SMTP id 586e51a60fabf-4a83f40c1e9mr5690943fac.20.1793106786058;
        Tue, 27 Oct 2026 06:13:06 -0700 (PDT)
X-Received: by 2002:a05:6871:2114:b0:4a7:c737:5a11 with SMTP id 586e51a60fabf-4a83f40c1e9mr5690892fac.20.1793106785324;
        Tue, 27 Oct 2026 06:13:05 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm11511fac.2.2026.10.27.06.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:13:01 -0700 (PDT)
Message-ID: <1276435d-7102-42f7-ad92-84c61aed6d2c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:42:06 +0530
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
Subject: Re: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
 <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
 <20261009-space-crane-of-prosperity-bba4d7@quoll>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <20261009-space-crane-of-prosperity-bba4d7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0a362 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eYkptJB4znfycLMIrrkA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: HqEFKOVX11ZmbccxcQMLk9RPczsAwomy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX+gmUo1YEVunD
 YPCcU6wRPBnCaLtj6bnBDZI1L+9T4BM6Dzfd2L1JYFMfDrY1C9MiZLVvMqVtCOVvd07ADI3/Nqu
 LXwVE1BxTHI4WjVzkgprBhDGe16Mm6A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX5mTkax8CudWj
 wKJtssR4A1KTs+erBAHBRRiCZtrvoxENUlK8GTL+MoAsbGrMZ9GbqP31gPbuBaYmvOpNmjlHozu
 yKYJ86QEgFqJ2YsPWw9YnUU1+yoUPjV09QKmeHN4G42ScXZTHrFG32x/ulGrPA69irHluRTGep1
 PCsyjq5xi2EBSdOXFszpoNA5gw9JJiWHPBUejQay/wacmSHspnXvuI8TAFYCF7oSZ6YxFxcVOjX
 nEtQrhRF+Gu2q4LDQIDcYHpmvtJArfYMezVsP9yQGqcPoiR5xW8PTxFFppbCwBELWXo2d8EQzto
 SORuwVfw3RHTbCM4dJP2RHFo7fuWTFi0CTpoFoy6g2igRuH82iM+C2lIcllO9m+3mXE8BaeXumS
 5qQRF6hts5OMQAgVv7VD0ZqhyOX1iYDeVyHTayq/sBSRF25PWbPg2pYo7jXYxZxLSIQCnEvsrMt
 /0/lSmHsgP8S3+IjKdQ==
X-Proofpoint-ORIG-GUID: HqEFKOVX11ZmbccxcQMLk9RPczsAwomy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052



On 10/9/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2026 at 05:07:48PM +0530, Vinayak Katoch wrote:
>> The driver uses the presence of iommu-ranges on a context bank node to
>> identify it as dedicated for extended IOVA mapping. iommu-ranges lists
>> the IOVA ranges the IOMMU allocator may use for that device; any range
>> not listed is left unused.
>>
>> Add iommu-ranges to the compute-cb subnode properties so the DT
>> validator accepts it on context bank nodes.
> 
> Example looks incomplete now. Please add a new example showing complete
> picture of this device with all new properties.
> 

Sure, will update.

>>
>> Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
>> allow platforms that require 64-bit values in iommu-ranges to pass
>> binding validation.
> 
> Which platforms are these?
> 

Kaanapali onwards, I'll update it in the commit message.

>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
> Looks like this needs some dependencies.

Yes, it depends on v5 [1]. That series still has open comments, so I'll
wait until it is aligned and list it as a dependency in the next version.

[1]
https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

> 
> Best regards,
> Krzysztof

