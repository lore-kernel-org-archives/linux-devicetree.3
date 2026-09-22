Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210651C073
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078868; cv=none; b=DaCEbMhOCW1rSiNrcTHpNuQ/mUbi0RgFLhcSO9jcWfeJ1HTBSx/v2xR2FlWpnbIMIYp0i/+uuiuRnfpR3l89Zb1/LzEWWgYjF0E8kDHmZVP1AxL0VrGvw9CYX6uWB11MFxsD9tJliqmOZgoLe/V05HVGcVQhF3InbU1CNPGNA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078868; c=relaxed/simple;
	bh=TO/iZFkFwswzAF+yEhGFEaj1c8z776aBTq5j1ZXADlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEtrvh5g0tYXJAIg/WX62gd+42iTHLrpg+SfB0O5k/F11wfVI/vVqnJK29/cp5of6l2HmmjmvsN3FBgvAo6n9gdLnUJxo99BE9B1YFzDKgMkGKZJxtpGl6Qd0DHjfOKMmbo7QxPyabq42Wt6ty1frtxT//eZUW9uYsrjonirwEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SE4yMWaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xpg0+UFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SE4yMWaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xpg0+UFp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPMxP4077886
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=; b=SE4yMWaGoaYDcRFj
	PjnpZ6e2N5mqFRASOBsWaiLFxrmWzXfcIEV13ibp44euS3p5yh9dd095S9rtalMx
	SJdiaWrDgPKbEV3D2AMrD5YrTevCMbHDHtAM4oXnlVwv5DFuVrmgl7Fo6Jl/vQCG
	FySren71Rs2rUY9jtvzA5oKJDIBnyPgtFacWb+dBN7Podz0jrKgj0sUnIYy+3vDm
	knx8W7b8PjWzC4Uzz6Wz4Gd8FdrADbL46+B7v09hwAdBTGeHqhzAixpSQdrm5gA3
	O/3d2XFK631Utdf1gPjwzKjLgq/o+hmlb6r3U6LYPw8FFcGSUWOB3+zPXlvIEBTL
	A8Ejog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgsx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:07:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6534972a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078864; x=1790683664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=;
        b=Xpg0+UFpN+oX0Gte/4R82IHf4vvFE0q0vwPjROuiT0/LC35FSyL11+/LgrkeJR/Wlp
         sH//Ywt2BaHr4hui09f9Q/W0PuuTZAUuSkxaeJmZ22g9Cr9jYlyEHU5+iemZ1gJ9hsFo
         UBCFoyB6uxIr3irABCerpbwpO+ragpeEmglp9I3lezGbNSFjNNn0//DbvPK8ebz6q+O2
         YuptTTgOCI+CMUKRqg+aEG2BV7oWYw2yHG00KTZYyJSN0iQjX80v1UBvrs05Xc1KiAhl
         SKEUYo6JIx0+n+COPZsPpqAbb3lw2eS/T/DUMNTY3STvZPR/Mwo4uyVieVRCjCRM1XRs
         f8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078864; x=1790683664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=;
        b=nCQJ9ueHuNw10eEQEE5DtA3iJy82v9GXSh+KL+fKB6dIHGtfZghehzb7lndPnyltSC
         6cJTSCtHs8y/8SiVpgQmEGYuH3796dAudK7MAgxL4oOgC9ZHD8fnlzHZmIHzd/sejQO3
         ww+1urptQa8Do5f/LK1mX4Hqnx2juuIXSWGLmjJ5M88PbY1KJu28UCTdko80Du1Uo8gq
         eIzpwFrJN+hGJtAr8prFFFEd7uoaadI4O5qnh+34WbD5XgHK9o6Goy2Q1rzGnp4bxLTP
         NwWWoWfWnAow6xEatTYEBw9AsoS2w+Xi8/dgBKn/U1MrjZfIVWUNzHOh/5E8FymrlhoI
         Ws8w==
X-Forwarded-Encrypted: i=1; AKwUvBzr38Q1Owswo+cTcC3e5HWpfu20ueeIRzTOBZsohDUjMjL0d9binVV2JV1xTmWz2i7lL/y/fgRH6tMJ@vger.kernel.org
X-Gm-Message-State: AFuF++kwMWtF+sxF7RglAUhu8v+a5cnEDYCRAOdy4dY8wzMlOcpKXpUA
	H8Iou3ywrHl9x69OnN3d7vn42Z3uCV1DQ61tgxpuQ/j/Bpzw6FleRykqTUC0cOTEzMrUak0isLL
	DZ8Z53Khj6Aj1pvKdOsvVN9A9e+/PxqUzsSe24C4ZYMW80d1JlKlDmC828ycgsfTl
X-Gm-Gg: AYBFou1iXIA5hGJm2KSbCbnT88h4qfceW3/5FHuyENd5obMwwcgwklrCpBd5X+OgrG1
	xXQRCiR+wHlPXeLOYaU4jLDsW2Nt3ZHDdk5kRPaW/IFdB26ZhjPH4wff+zqGGH62ZR0JFv0tzWz
	YxCdDgAH/bVI5ywrVGNcwQgtH5SqMQpU67sIIUt4uoi5sEjmQVdEf0Pst9pg+RmVDW8sXwt1+ZE
	KzxlezJebL8wR0gq1KlCqBhnkqkwbfg3ddmFb6Fua8IZWPj/zD83NpYw9lujko2+IxOtLb55la/
	N6VLJYD671lcjtywRcRT69EJ35NcxFbnqa8StwVEvbcsyQJscpng6GvrMssrhNbjf60MqUmVcMl
	O20fAPc0nzlSkaV9maI0Xsy0DGtg=
X-Received: by 2002:a17:90b:2f43:b0:39e:4c7e:f03d with SMTP id 98e67ed59e1d1-3a073116f1emr982096a91.26.1790078864000;
        Tue, 22 Sep 2026 05:07:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2f43:b0:39e:4c7e:f03d with SMTP id 98e67ed59e1d1-3a073116f1emr982070a91.26.1790078863481;
        Tue, 22 Sep 2026 05:07:43 -0700 (PDT)
Received: from [10.219.57.63] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0715e9d5esm2483450a91.17.2026.09.22.05.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:07:43 -0700 (PDT)
Message-ID: <077cf4c6-9657-4e4e-b755-2f45a9fc67c6@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:37:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
 <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NSBTYWx0ZWRfX26HlIsjioxIV
 9wfPJ9qR69TuYn8+XaOxg8OO7Ru1iMEn4m38cOHCo4Hynj1NvwEpd0G8u0TT+hgHQd1BGjf80DU
 eP+gKk969zrlZHVZM07G8sWy760gwD7SJj6+EGzgvNKuU8MPJh1zOGwAIxeX5Bm9/6qqSaQAlmp
 at2w7k8LMdq339XNL2ck3WusXsbH1BgZPXHBlvzqb8UhKXbnDYXfqVyW8tcP+zEGY0Sg4jwUXiO
 L2S9L70PkTay9C/R8iEmHKPMRLx/velDapnDbLuQDaMPuyoVeE8wxfRukAFT47n42JRKeYChTUi
 x8GwoCFgvDvVPPAL72FlMwbfCgz8pBZDLfq7vPH6b7zGAxdNpdtkWOdjh6XIUKauLuO05E2Cq+m
 ThyoAuHR/+CY3b9Oij3P/KSbmc2AFkXQbW+I+l54K7xFemoSh7YCIG9Sy5nVZOlvrHA27i8UjBe
 A06+CcVTyCYVokmaADg==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab26f91 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SYeg_LyZQ0ZiSJgYx_IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: F7TR-CF7lW2APvy4CzlRCTYA8FekYP_j
X-Proofpoint-GUID: F7TR-CF7lW2APvy4CzlRCTYA8FekYP_j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NSBTYWx0ZWRfXxUAryZL0uz6d
 r6Kd8SikNk3iaNDm9KmroaWpCWq0+6nA9jDT6/72xBBeAJ3BxWaqgaxm//21vBjyRY41NKMdbOk
 Tczeyd1ZU12NOYl3Yw75uPqohiUKzaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220175

On 22-09-2026 14:31, Konrad Dybcio wrote:
> On 9/22/26 8:40 AM, Ekansh Gupta wrote:
>> The reg value of a compute-cb node must match the SID (the lower
>> nibble of its IOMMU stream ID) it is associated with. In the cdsp
>> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
>> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
>> 14, which don't match their SIDs and leads to SMMU translation errors.
>> Fix the reg values, and rename the nodes accordingly.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index de7c395d9c35..51fea666efac 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>>  
>>  					/* note: compute-cb@9 is secure */
>>  
>> -					compute-cb@10 {
>> +					compute-cb@12 {
> 
> The unit address is interpreted as hex
> 
> Konrad
Thanks for pointing this out, I followed other DT files for this. I'll
change this one to hex (@c, @d, @e) in next revision.
