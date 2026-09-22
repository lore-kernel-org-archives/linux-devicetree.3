Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDD530DE7
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071831; cv=none; b=ORSrmuunP6fFm0IlRwSkPyMKjxQjt4YMW7pXlOTebAYMOzSvxdaAIyY+wHS45U+Em2tvlhs2g05Eb03+026SMUY1iLCOlORhn2abwQVe2Yt+tvNHyPQi0tpfi1s2542cusG98jKwq7zeZhQyvlt+gU7XoncEiQjljzYcB9ezhaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071831; c=relaxed/simple;
	bh=cp7aLVfqqMmL2LuwJZn+F9gBJmIl/oWao+Xzx9Lsy6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usTJrzXSzXLGOOVUgHdJeoJF3khYAynku8KJO+PFVKkj9Ugs+P4TWu2XSL3QoIFslMl9iVFHub1lnITASdEg0ZlKjztbdnrTi/xl4AtsqYsF0fIqvDohnQQGVOncEtykDwEJqsWYiv56+2JuRO1MRBsNj44Hxa76/SAv7S+LrFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB2KeA+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANs/1D6k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hB2KeA+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANs/1D6k"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9D85A1842527
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=; b=hB2KeA+tD077GQeP
	9yydTU2bHdO/++SZajAN3/vj0KChQTa88elpk3cMfxk6sU8GFRaDE8oD+/oRxQv8
	04MJ1rxFTRGQd00UQpEtMpY4fmYXY3incC2U8F5p8xiigoivnxSUdB0jRMRwV3lu
	F3vrkwB/vUCQzkA/yZrW5TTrGdYmws9/Sou7evSNb6rnjjsBgJYtQwb981xiWlWT
	q74PmrBOweSuSHosqZTDAB43aUy4qnJacjzUwPApopscg9PEZ9scrGJZkD1wSfFl
	CnzNfYMy3VSN8DnSXGTiw30vsoGCvqTon32P9eiVsg/GoB4++M9XNt4jhY6M99X/
	HZn98g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111de4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:10:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso9026956d6.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071823; x=1790676623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=;
        b=ANs/1D6kKOP/exRvlFRkPxqkaMTp6S727JC7HgnPf3L/y9plh9zY+Ne6SgZpGr+Tm4
         9HJozBONC35pGM8Jk997IY1SjWA4m2hUUFFzFnhpqjsP5lHVcRU46QqVy20EAZj2j0xL
         wcGYFWXqKFJoUUUzxlidOcz6SKiz6YqQWr4KUP96QNESijG9GYr8AYdG7n88WcmQv7yk
         tbRRV4sYGju2UziCIi5KclhrACY/97u/J7/mvLawZ8AQ5xekrDXzonaCrJW61AmkFxk9
         s9AnMSN3oOSJK4z9WQD2biKuMOZzkhRQpx3GdZVV/L0cmcqdV/A6WhOMgo2udh51Vxsv
         lBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071823; x=1790676623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=;
        b=uHOJ4tTC/R9UP1ktqjVeGPXsaC6uoP/+J4W/mioCq0gJAW+1ockGmNFN2ZlBSm/VZm
         olbrelyuXtuTVv136ZqW1pz+/nnOkIJdLEMqWaYORSqdzpChB1K2kBlNuT4eTQQnuKQB
         wssxkPdr20wCAMmWOgn48NUFNX4qoGV4tw5jpyWR748rIyLN4BnvnbcDOkMk+YDmBwHE
         Q0f/WheUG+v7F+SDChIlqrF13AA8WyHbyRkuYWNOIbUhzpsJtXlnW6TOdHfMs1RkI0LU
         qlGWpqs0giS2CXPUiR5GrxdfoUrtK+S3WSh81huEjO4wPNnmi3vQkLDa+UFpGGLSTlOz
         MSEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxENpUW8kYYw3G13YaVMO9CkiHbSst6CuxXS6AOF36Kx5i/FclwqX5IevYacmervepDNJSHuLPM57wp@vger.kernel.org
X-Gm-Message-State: AFuF++kFnUr68cMfLNukImp5ojGuQOEKQ95tOqiVC9IgOioKEi4tm5eX
	D9bdMnU2jn3ePyl9H7trEA6Z8rQJRQTy6CA7La4Dvvr0xWAv62mngvN8zLuKSPd8U5XS60v0/6m
	0Q/f4gghlneTFswtXIA+/d+pxUbo8oTNvug8IMIRPVUx5Ml8m+kxnB3Fb+PL9qs84
X-Gm-Gg: AYBFou3+2B5o0wTZ69HnoRWrQV1cq913y7r2Iqy1wBomzmvSH0CbqIT16TkAO4KH+8V
	Oq1m3qc6bPvnpKTslyASXNei7Q5+TXhkEVHZWeZURGSrxAqeiAVjnXo8t8lL0z21y3q9umFlQUR
	Br6GQD6VHHkOiYaFV5E03jloI92km1NdgUJE8peqtyf/kCESXeTezCXE7RyFzGdjEGrJAwfwgA2
	H29Q1lOHHeieZNLknfhX/A+6R+n/fLqfRnFERBlVpTq0+4U/yfG93uMF5Owv9rwuNeYRhqzA/pW
	MiuIY0nD05epqVYXsX9inp20dH2p1OitcYPNnrB/T85y7cJQaQyIbKPSumjvWhDlEl2Hd0rxa2c
	5k/1E3s9eM3zy50oAJc2hmg==
X-Received: by 2002:a05:6214:c25:b0:908:2053:b57b with SMTP id 6a1803df08f44-913fc9aae15mr47552406d6.5.1790071822878;
        Tue, 22 Sep 2026 03:10:22 -0700 (PDT)
X-Received: by 2002:a05:6214:c25:b0:908:2053:b57b with SMTP id 6a1803df08f44-913fc9aae15mr47552076d6.5.1790071822402;
        Tue, 22 Sep 2026 03:10:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f163sm61730966b.11.2026.09.22.03.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:10:21 -0700 (PDT)
Message-ID: <a3eaf9e3-5c18-42ba-a645-2efdfe161fd5@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:10:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
 <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sp0gXBNHf-iFGLdsdTwX2pvSpm7l5Em6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX954sst8Wczwv
 7YQmzwOhpaPzH0He2dYWW2bZtzMHU3J6VFCN9qnVIvmfMWpOP1eCcdBR3m4LpLOfLV3iPo+r6yG
 +H5aUPswWEFAnMXfQhltLo4ENFI3L4s=
X-Proofpoint-ORIG-GUID: sp0gXBNHf-iFGLdsdTwX2pvSpm7l5Em6
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2540f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qXHdgDUTi1Lqi5hRQc8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX7/yM57VN4wze
 7QqbSwEXDJKMGIe9yQJZ0yMYOU4wwJE5dIGgtyi2L6WpEo8/2qGVBeeDJC2shH86aMUD+dqA3Ky
 W+u12NcrWg+ZgOjU7Ql42yc3yqjXzeJELFKWsqFb8BeZvzjmQD/USS4pdRWoo/R4Cue4aD7Xa6B
 iY1RE1JxG+BDmw/StApedB1hSVJTWVUe5Mv0trud6Yr987GYMaIun6zNKYyrFQ2dJoPOS6m0J21
 tjfcRk/aeiHiJhLcHnGun2WWut027MXdx5A8OfKb0br3u7shg2w4Un9IvYlYce1+EMM4Xd7Vmu5
 ZIXcB29jOH4GfGV3JFw1dSVsDcVK5ZU42J4dR4ux5alUIl7fe/O19ZmeurYNGEq9EByGjbdEpQJ
 wZwdp/eqHvVA5a4jabThYfNGWuKQUKZNKQW9I3kvq5gNgKDpnwA37V5fix8yE4pEf6T0RlDBbs1
 KfQJhUQbvu4qfK9k5Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

On 9/21/26 10:28 PM, Mukesh Savaliya wrote:
> Hi Konrad, Apologies for the delayed response. I was waiting to verify the changes and ensure all the suggested updates were properly incorporated. The effort was further delayed due to some slave-side setup issues.
> 
> I have now addressed and validated all the suggested changes except one, which I have responded to separately below.
> 
> On 7/18/2025 2:21 AM, Konrad Dybcio wrote:
>> On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
>>> Add device tree bindings for the Qualcomm I3C controller. This includes
>>> the necessary documentation and properties required to describe the
>>> hardware in the device tree.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>
>> [...]
>>
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,geni-i3c
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>
>> In another patchset, you expanded 'reg', can you coalesce that change
>> into here, so that we don't have to worry about backwards compat?
>>
> Do you mean as below ?
> reg:
>   minItems: 1
>   maxItems: 2

No, I meant that since you know in advance you'll need the bindings
to be altered, simply squash the two bindings patches together and
submit as one

Konrad

> 
> I did it earlier to add support of IBI feature, but i plan to do it later. Right now, i only want to add plain i3c controller support without IBI hence.
> 
> I shall add expanded reg while adding i3c support. For now, its not required. Please let me know if this is fine for now.
> 
>> Konrad
> 
