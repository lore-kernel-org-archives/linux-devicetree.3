Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE673DA7D2
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036526; cv=none; b=E+JkgK14r6HW4sJbfYRS6u/mQ+duR34xXSOdVg5QZ7n5+UoytA3lgIkleY8Sm3EQNRiHh9mUsIi4da+pSxfMgCQe5ei8PQaY2mIdT0JIG4ncaJPlE3xDNZrB61qrp+sgyRXE8KCq8OIzKpG6qTNBCXTVbXrFxT1+DRJeujz87qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036526; c=relaxed/simple;
	bh=tg1PT8AF1SONRgj9jI7GaH6t47rBzv7fEW7a2CLtuD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ks34btEoFoy9D3gOZwXSZHhZZgsEhGpfDcIU/GqPBvXw3EZ6z3Eh2rrztBEWt2VnUVMKj8nQIQngNm8XvQHshQMcGz2iF+HVuCeUufdbet7ZRcbbHni8M3mtVgK9u60k0ZCldOgnaQmdHE2JiHdN6Fq7rwHbGqyv/Ct7yE7PTLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGS2mG+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jB1eEOW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGS2mG+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jB1eEOW4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314J6PO3363899
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABlromq1XcHkwDAYOwDCB2ogPYAGGWQWyw7sZ9yDgTY=; b=eGS2mG+QFv/QNVS7
	jCsTQrSSby8L9UtyU8xFA4Wc3dO/2GbgHWIyRgxg6eK3q/XLYju1AbWm+cqUkaeO
	+1DzBX4VAgHhrBWVMK9Ktvger5Bx0d7rkEPBOLF5MXjYPnOn6E/quUWWqRxLC2jg
	nmVSohgyiGEsdDDD9iQUXt2SwHLcqr0hrnG1q7B04Ud8Tge0TssPftXZPD1P0qjF
	ojWU2J1cQ8OAqpY8rs/mNTfJyi+UY+0Dt1dHSjtMS0v8q57RxSyWhOcLIOuzWCiI
	iBxjk4h02DdmBNDRtQxwU8VRDyGh8JYfUlu2ep+UYw9z8MQ8f17q/VVOWJNorToV
	VOef+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddjq6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:42:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89e9d327913so18840666d6.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036523; x=1775641323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABlromq1XcHkwDAYOwDCB2ogPYAGGWQWyw7sZ9yDgTY=;
        b=jB1eEOW43rEZfg3D7pllj8ahORf+LZoA78eEScy1QkW7in7ju2meYTL6EcmDAgms0O
         rXbuJyi+c6x9kWFgsjG9WUbU9lj9b87m5OWMyc6biWhXOIJH4hX8tHMOJSktKGUi+IlP
         eGfApIj2wAiwbxEaoMHV2ZhVbWs9hkf0CaenfbOJH5+cOnKxZY2ZpmmGYd8p2ZT2NxU4
         CW/ysPklT5+2evAiO34GQl4mYTGnnxmgahfftsHnDEYdCbNe+uZrujb+jenaoGjmp2O5
         J5/+udC0ucBDK/yReaXrdX862JmYhigc0X1nubkL0/RAA4fcDbUSBAmTWMSNLuxdc2TI
         6X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036523; x=1775641323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABlromq1XcHkwDAYOwDCB2ogPYAGGWQWyw7sZ9yDgTY=;
        b=faDfXdiRts1eOsbKT5riVVWvamA3xp7kWr7wX+Qnmg1mVxndFs2174AuoBWikFffV9
         TK248IjxDyzd213rmpaLNFTGhQxFsispWXOSGEL+1xFddMw12Fb2lWOMUGVLAbfC8/Us
         Yg1peuJTrE3r42+pnco8bIdmfxaN8Bxsw977Y4/5jkqiEfiuvXwBr+13H/Gqm7TqyXA/
         o0fHl+kqcZyYS+eFjIuIOzQszaaIVhP5pkfrHLIeCQwl8NxUh9yK8gXZVq7Phfge7AeY
         YP71G1RDT1Mf6KnGerlsny5Cgak5ZSxPuSaXrmH1/WAgSGs9qjIvGIBxxCl9udP9ANF8
         2CcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMYvyZ6sHEF7cblF7En6Rlnx6EXIhvqqqPbj6x8OJ6GJIxP3SCzrcvKpJj4skzCZT+EV8LNNwpmM0o@vger.kernel.org
X-Gm-Message-State: AOJu0YwOvcEN+ySc5PcT950F/2TqI+cC9Q9lJc3tCiVh+PLl2/KkM4bL
	SSdPdeNIBLupMlz97REHgSRI1ew97s1v1STM4CL17acAfwXPa/JwRuSAOa0oMprxgbHIT+iDWzD
	6KUuk4ZeQA2vLBW69SKBMTXKT8fSzl8gg8Y7+X+3vBjnOODM/uqxLXjvuOTKpUUsz
X-Gm-Gg: ATEYQzwbEqmAuTH7HhtLJShMckZtgatKaqDjNxVqPqpLq51FttcvSS55YWUKZMq0FAI
	j0IARqwlhAR/vnihVPX3NNehSHWFqyJgobgY4y+c25jbrlzNWrrsycvM1HlV3i7f/igtw7VTNE9
	Eqe0c09wjqMF/B+ReCqB3X1Yxabnvxyuir/qjLzKZHnmgZmbzBIypdAs50VKuyP1t8mX5tmNFo6
	dcFpXl19/gWzIuR1Pf3aJaiTZQqrm9CqiKYsLXdt+Bcbv/goSUPlRgRoJiUcgnHHrw44XF3YH5z
	SppdCgzfyg/bIgpMDTzt2l+LJhE8k4Bb9F7mFO05dO9rd4laJBeLKxjdV1p3DyO4MbKHqfFikVR
	CUDs9GrcV6ZbdQ0wK00aTa78Ixy77358bVAoBeVZshfDVmDQJq3HqTpzDf7Pwh0r8c2LVwosWF9
	7Dzb8=
X-Received: by 2002:a05:622a:428d:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d3bcd6df8mr28201941cf.3.1775036523480;
        Wed, 01 Apr 2026 02:42:03 -0700 (PDT)
X-Received: by 2002:a05:622a:428d:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d3bcd6df8mr28201701cf.3.1775036523087;
        Wed, 01 Apr 2026 02:42:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9bf9ebc755sm146600166b.3.2026.04.01.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:42:01 -0700 (PDT)
Message-ID: <4f2086b0-dac5-4646-854b-8dcfcbd9f5ed@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:41:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add qfprom efuse node
To: Alexander Koskovich <akoskovich@pm.me>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
 <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69cce86c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ukwwJ_iyby0_xtxX_Q4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: RayPsLf9A2yKB727V9uflZ3rMQPKGpCu
X-Proofpoint-ORIG-GUID: RayPsLf9A2yKB727V9uflZ3rMQPKGpCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfXzZyPuFzToWuY
 XR0pKeaCEBuXHc0/ZFe/gDH/dSJGQlGqUIVn2n06IKPN/y+QiM5NBhesFduZhEDpXZ3v01wyteA
 Vz7ul5DCdh+STGNEsrZJc8tbJYblgCrCbBXRUyDce2B9yvf3tQR0P4SYQ8A1Dx4iqnmKnIvQpjf
 m+QC2rBika1+Edcuyt9eZZjoTFovFmrxoQhaNmo/88EkcBf7tEa1wt3zajnIziBKFzIlcVnEEsH
 5TmOOioMY7aUFJwrF6nIp0rRR0Sx9sZ9+x1kvEWfG+MYN9NCkjqRVWVrL1049euWviCUSJSf7VF
 Fghohl+xBuTtBe5+Z6eSMQH+p6bt/f9QqL9UAJghDo04cESjRt0XfacT4FVI79N3T1UWngxRw/V
 sWbljuYDvFy/hZh7CM36SHl9kOnbIWrZ+QsteUSM4T0tD902IB+mrYa+PwQaZMKx0sTcy8PxLJr
 eonIXcebENWQvKiGE9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010087

On 4/1/26 4:25 AM, Alexander Koskovich wrote:
> Add the qfprom efuse node and describe where the GPU speedbin fuse is
> located on Milos.
> 
> Note that for SM7635-AB at least, the value is "221", the max frequency
> for this is 1050MHz. There's another speedbin out there for 1150MHz but
> we do not know the value for it so just document in this commit.
> 
> Once the value is discovered we should add the speedbins to the A810
> Adreno entry and update devicetree.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
