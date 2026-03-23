Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47045388E78
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269508; cv=none; b=jeIAdZlMVDj/csnSvYA3ji3vKTzQFXDmW6mRzzZcIo4OZUtUrhmRELGxbjfPo8VNlcBNwFg9FfaTc3tbeScRuJ5eejBqVaOUIFYCySPyO4JoO0oBHQZRsATAyOcLHA6t58kCYsQ5wIe57J2gon5o44AVrZ7PNMZg0evDltsfqoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269508; c=relaxed/simple;
	bh=jv/jRVDtcHHI+rZD3ITPOyl7IuExS9Feda8LNxdU4/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IulGPmf/wG80L44rglktTREEW2BIw5DnMPUGxEAnFoB4RmbN/4W8cCCplaJOmBVKlfL07QcVAo2P7ynbfJLA5HCxnYnU52HyC27Zfe+Hp0xV3m+HwDQbx8L6PEIHBaYSw0JXRNk4PvbJTMbtBjgaPByl5dCU2UqUPjdgvuH0N1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsS3abBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekWKQDuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsS3abBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekWKQDuZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7eMTf3503696
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8eOrKf/wN1eLL27+5aZzGuxxl/Ho+uemx+Sv/Rd5OM=; b=OsS3abBApC0HDibR
	R4ZZT04WBjssfTqmYeVeOS9JzfQqjnbuVReYAcKLXko4ns0ii0VOGKt11kedj0CF
	/yW0rcHYGEJTR1hY54GP6XhC+fKd/GZltmbfdHijm7KGmvCVibtqv2BzUxIYd4nG
	ikDFb0H0tKnuZAoFsaN/ULyJO0F7HHRhlleHsEoi6JG+MMTlCqnP92qiSKnzHmoB
	3sDTLJuwJZM3/NEdSkoumgiXSvHRbopJFQOr0udYyhg9Gedm+5/ciVvqAbOH0Anr
	QCUOOvEix8JiSNywEOzRCVvc1S/XVLO2ZBdIbi64Vs/8pIVC32ZHYlVl2T5vOESA
	HOfP6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng5ccg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:38:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2d5e61f6so26486161cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269505; x=1774874305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8eOrKf/wN1eLL27+5aZzGuxxl/Ho+uemx+Sv/Rd5OM=;
        b=ekWKQDuZAO+zy5Lwdarlx9m+97DrMCwRcPrMaBmFsR7sf3LHS26C31C09TMvy4kxfE
         8gdicGjtxdj2LLG5uos9l1M7z1GJV8P5i+7h18tgpxY8T1Vjt8cBqS5X55kf5AP13648
         QRpi1qoHR86f55lesHA+0udVp79v/3/YUbn5GerQmrRxHb2Vn1/dtFopLDV6IiN4DK/a
         8TeY3/0LsNRxM/ezpBfMKf9dGMnTlKTOt6ls1/28JYacForUdGgsBX96S2YjkSGrxZIB
         RpLNBWPBR+8P3nMPGizCiTU3esV4Pt5iZe7FB7/lxcw0Ixc+7hlJMRUzQPKhp0aldSc5
         1tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269505; x=1774874305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8eOrKf/wN1eLL27+5aZzGuxxl/Ho+uemx+Sv/Rd5OM=;
        b=cOqrSZwr02o/BAHJc8d0s80D10VIrvO5qZ2yra/oaRx6VNCD9DtQFWyAQHv4eXOLhG
         /a+SdpBEvbSSTy9UezPyqV1VVj8lLnZbNUKnptt01NkhBvShL83Zp5xoCe5pu0rYcmJB
         0OUpz4xGaO12OVJafSIABMCVX6MBfSUfFFwSKpBxxR3rfsT/ceGi7qSEgmca5Lv7bjVs
         be3MXcOeZ3fRYQCIu/gIDtfQV7eAPlF5xC5VKl3xd4k8pAn5sPLPlHtrt49PWgkKfgJl
         RPu8mqwrRW/q9jHy+ENb4VjqEuhJgqeALz4BGtCpkeYoXawiq1pBzVNgYPi5mQgU92vJ
         yI2A==
X-Forwarded-Encrypted: i=1; AJvYcCUjLCvD//zan9g2LQ7oK0sUf4rbFwIHM9St1+yPpAMw4a4IWmYWgLUMxhvWreYJnQbcs4dM4UgJ7+N+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7x9qnx6Djpks0W/VNxSry05BXRrJwqXShrHQbwBD91eTXI3mx
	BPAhKcTjW3jTi1myy65ctQk/RP7ePyrbXrhSMrWTk5ol2bWeQPy/ws93TszaR7B+oAe4/fHvvtV
	9vOY7GeVRooUYoruNkpGdOApSmkuBiCdmUszrxNz5/gune7/SMIIoTVzG2wHw1qx7
X-Gm-Gg: ATEYQzzyJdNhEPTz9ROsYoW7moPo9dDLpmgdpFqc2GEhizxk/emNRe8LGs/N/DICI60
	rBQ/QA8j0hCN9YwDaEbtTQ2kjbVTH10u0TqiO7pmkSIs5nGpPyvnBf+qqbmccJmqldaxFmj5JQE
	cEAyo+GjCpP2dMrpGTbs7YnnL5NmV/UBn0CoBuGLm3t3WGM+PW3KBq8Glqto/XJ1WdPlcWMzpeb
	+vv2LvLrWp1NGTeE3iOdzThu6GsBUEotwVcvGasgVRNeHpBPfWUaKwy7ub8ri4ZaI0V4jJdCyLL
	sQFncsCNO8SPmCJz7iiUiMtuUiW8EQ6Oic2fo92sltnQaR5lTvnScryfHaply3oibvWZD5DZV2h
	fugezMlEfiPl3ad65YC8nbFT4AgStHOW5xpgYPh7peLKOcEQpM2OWJfaCS+mLw+36+an9Db+U85
	J2k8w=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr152870211cf.1.1774269504451;
        Mon, 23 Mar 2026 05:38:24 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr152869881cf.1.1774269504038;
        Mon, 23 Mar 2026 05:38:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf4f8827sm3796627a12.2.2026.03.23.05.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:38:22 -0700 (PDT)
Message-ID: <62242f73-161b-4bf6-bb66-3775b7755971@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:38:19 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to
 2.5MiB
To: Luca Weiss <luca.weiss@fairphone.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-1-4b902901cb49@pm.me>
 <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>
 <DHA5WVPN3F25.2Q71FMM8PD7UL@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DHA5WVPN3F25.2Q71FMM8PD7UL@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZbSVgk5l70FjO7cUFi8bXBzSFc_BEdpE
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c13441 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=W6naqKN7AAAA:8 a=EUspDBNiAAAA:8 a=Jnoa2UoM1I-2u1HpP8gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Xp8b5NkTPdl8jt_qJiRs:22
X-Proofpoint-ORIG-GUID: ZbSVgk5l70FjO7cUFi8bXBzSFc_BEdpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfXx/Pmn4k1KNl/
 TJeu4/hUQgYXWmB/Q8e2xASJvi1uviceIubae1JvkFPoTg8a7+iOKYfVXsvi0h5FgFyCOWD4fwT
 KMBY5FBIT0Q2hTU94f2/kBZVLWuy81INWCLXBFTNDfauXwl4dWidTnSZmwKtZjGzGibD7rq1H23
 EcCgtkMXFZBjtldPzXzXF2TQka9RAlm1u4Vo7PlIw7PJMw5v3ke8Z2nURI16rnex0zesnT14+wi
 cjbBRnk80LLmoC7fztWx1DYPBY+fgTKXiM9D4twp3QmoqbTPbZYvfbaBPKxS3TobRCe4AJfbc2p
 1QJGaLj4+zNa/C5j2iQtU7o97ANrKbJRPZnUE8lVq3EWDTwki9IaIO82E6YZJpG6r5x9E0GPN8I
 mAUTyAux5Ld+WKouHG7YgSOBppa2qq30i0F+ew03a/M44EsdDJutiwusPAGnxTT5JkhqYWcMTqD
 6O2y1SzNPHGdpIcTIcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098

On 3/23/26 1:32 PM, Luca Weiss wrote:
> On Mon Mar 23, 2026 at 10:51 AM CET, Konrad Dybcio wrote:
>> On 3/21/26 6:00 PM, Alexander Koskovich wrote:
>>> The rmtfs_mem region is currently sized at 6MiB but the default for
>>> milos downstream is 2.5MiB. This causes remoteproc crashes on devices
>>> that expect the smaller size:
>>>
>>> modem_ac.c:281:Access Control Error: Could not protect the region specified:Start:e1f00000 End:e2180000, PID:1
>>>
>>> Reduce the default to 2.5MiB to match the QCOM downstream config, and
>>> override the size for FP6.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
>>>  arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
>>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 52895dd9e4fa..c0981ab731c4 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -724,6 +724,10 @@ &remoteproc_wpss {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&rmtfs_mem {
>>> +	reg = <0x0 0xe1f00000 0x0 0x600000>;
>>
>> +Luca
> 
> You didn't actually Cc me, but I found it on the mailing list anyways :)

Oops!


> 
>>
>> Could you please confirm that this was intentional in the first place?
>>
>> FWIW I see that volcano.dtsi indeed only requests 0x280_000 on a "clean"
>> Qualcomm tree
> 
> Yes, it's intentional that it's 6 MiB on Fairphone (Gen. 6):
> 
> https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qcom/proprietary/devicetree/+/b3744ffef87e1f2a232b26e9cb270a1f82554bc3%5E!/

"Root Cause: Requirement" :D

> 
> I think Fixes is appropriate since the default for Milos should be
> 0x280_000 and not 0x600_000?
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> 
> And maybe a comment like this on top of the node?
> 
> /* Increase the size from 2.5 MiB to 6 MiB */

Yeah, sounds good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
