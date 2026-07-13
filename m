Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A065A3A6B6A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930492; cv=none; b=kYwYWcBZnO+Yd8FfuYMh8XVNrUxWwQ0ctEpev9YIKLO11jkMqv6IqHcVHetmY+aF7xXSKu/lSaSmyHj93w0Em3RrJ3JIkCYSr/gLmlnBn51p6y/kWGtu2S2g8D+xtmFdwMX8o0AJIKd6OSTIneuQk1O2TDqBNssdY5Fn0D/jIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930492; c=relaxed/simple;
	bh=I7iM8du2AcgwXflxNlwNtNuq54CpRR4WVNvb8Odgl2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erRNysltU8lMsxn1C3bkT2QUuQEKf1Q1eF9vuxOVwoE94nwHKNehcw71UxdbtbFN9rAcT1C8moBYMVyKzi8fBZolGS9A+YepSbYg1rF4kU6B5y1XYA95ytvxwcPGIBe7EZSuLcdJjQguluuyrc81mbZ1GTnu+jgzOjHD8kas6IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o22EbOPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMNRTSJM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o22EbOPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMNRTSJM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O2au391141
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa5gwV4FuV45W/DVPi3OpoAJltQZRv63LVhO/gAPcEs=; b=o22EbOPMM/dJPX4m
	VwHbm2eM16tbHLpf+3jrLFY3OQ1d9GYFA9Kw2gJTzp0xtaHE2ojDDUR9zVeyRDe5
	/dsGnO5Mwghfamfw5cf2E9bOMHn5Chyh7SiebatvxPDRSOPeGqpZTNX+qY1kTEYF
	hJAuRxK3sohdvqaP6pptnZXKui55lhRIWWrjuBGYHiUufLXNMXFaWHA4PKwn+CrO
	8eDZ16NQ5dP0rmyDLJDsIZ5IJkWRh/j+z0BU2PrTBYxbgG6SY/iz/EPcXfI0m6eU
	bX/7DLTgsrpy9ftow8tL+zV94ooSRFBqjhts8BxZI5L6UOHpMpLH9D/Mo9fiBQjV
	iJVoAw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gn0uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:14:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so4090463a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930489; x=1784535289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sa5gwV4FuV45W/DVPi3OpoAJltQZRv63LVhO/gAPcEs=;
        b=WMNRTSJMMwUB7W3lJUQliA+TGKxXcO1WQH249oNg91fNm2Z7SFDCf9rWLoAbMUpI2m
         mU7e3jWcHFuhRXynH/3pO5Ihb8kkIBKyo0ioUf/tYu75vfhPIRtvUKVtnWPeeOA9Dvdd
         bAJFfLGswpOvmbPW8nm+aZljQJYF16S+M2ebkzZ4m8eSHWqKHPwFHysUJfPpnYatXy9h
         sP02DoDEIxaxhRRhsxrcD/XZvOcHmmI5a5FCtTT1vG19rirOmTS7cJanBE66b/n3Y/9n
         MNeRfAp9b933sQ8VAYGCOjtFttJAMI8saffjvqc0xA/WoW4diUB89ZLOa73giEjk5mgn
         Cj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930489; x=1784535289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa5gwV4FuV45W/DVPi3OpoAJltQZRv63LVhO/gAPcEs=;
        b=A78+hLF0Woas5aIgIwxYcm/A7C//QeAJ9oDkeCq51dCJZ5gFJzsUsAZFKCp5wn5C7V
         +jH6x51mmFW8u4PsppJsVscRK67Htobdhcr31KWTrvp4NSulq6ve7UAl7itQpzi978IF
         1melcLVu0hs/bTPx1ET81uI84Lw1inM881O+SEYYRktmp+I8nBD137iXKWw6ANKDpxjq
         LE7o0FcEE1bKtTltMjPoTiRi29IEDplYPZpBBjmjU1AgXw1AQmL8FbBxsieu0HZvQn/Y
         qyWdns2yj9uczwNGoHJQO4PRPdWCBdoCOhT8sl6t/QvaZ2Mzu8qgsp/9OcKaFPrrjBXF
         Ih5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro3PMzjk3nbrKXmncFeB+V8xChjtrtYbe/fR+t9nj13XNGkMgFaBvTfvghnQx62fsfVZDy1F++bdwQc@vger.kernel.org
X-Gm-Message-State: AOJu0YzCG4tg/uuQmU7R94tJcUljUhl444QVbMurlw4WR4ZYtM63XCiL
	qywe80kuhmPKaBlrmo3IFfkBGZRhIhEElqruzSDXoqLHOf3xIvNt98xgGHTFodK3wwmESo3JQ+H
	dAZsMsFRQEGz1S4mmV2XFJiBz0hr/JCVwfmNyhOIFUVKNPZvXSqN6Mx5gY/klMGbu
X-Gm-Gg: AfdE7ck2Ba2xNKz5Wm/Y6hCJMjo86MspKIMczdOgPwpsogL5o0+wOmv4SAxdIP+2ksn
	kcIiNJXilGEgPYzvPU3erQkg/nCc8pLWVyNIZ1DmXpEX+/b/zj6/5SgxDgEda3xPqvP1iqtCCzG
	kq5iyaD7TbzwwFRvpVs3jj8ri+HTKI03Fe9qS1sty2rauAlJ5ialLPM5yOj6vDQr+xBieM23yWJ
	8fW84afE1CKrF5jIf11ofHssaPIqf5iU7vC8chYK6Zlz0Gtq+dUOX915WUUDEw6LdcuXoJW2ZI3
	eotJcGoWjTljeMLtwXtsm0Rx+eZxpyWWxrts4hKHioIc8c7YNycPniBDN097ziYM6C3h2Hl0YpR
	nzuPts/ari9AAtsf2+1rh5lsFwI/oYxhIUhgYc30=
X-Received: by 2002:a05:6a21:b84:b0:3c0:ad2e:753d with SMTP id adf61e73a8af0-3c110a1280cmr8438568637.7.1783930489184;
        Mon, 13 Jul 2026 01:14:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:b84:b0:3c0:ad2e:753d with SMTP id adf61e73a8af0-3c110a1280cmr8438541637.7.1783930488748;
        Mon, 13 Jul 2026 01:14:48 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8a5992c9sm23762094c88.4.2026.07.13.01.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:14:47 -0700 (PDT)
Message-ID: <5def8e49-dcf6-4a79-9a4c-b851483ad1e0@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:44:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
 <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
 <qvegfsqxrtfucwf4imq34a37im4wailbw4atk4ixrcoqedbl4s@ztdd7su5nmzp>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <qvegfsqxrtfucwf4imq34a37im4wailbw4atk4ixrcoqedbl4s@ztdd7su5nmzp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a549e79 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=JafrABjVyvUhwVX8spQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: XVd2hh-9NjHPT0N82CjXW5Du3m9gtc8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX8VIU/tY2l+p2
 35iXzp1cZi9aiPKn5+ntsTlMXR+pZ3rEsW3dLFQL4TNjVsA5NNYdfAlJn5YLwKMobUjSbgkfmHL
 kesoB1WxGalopxMX06BT6IjSx7YZxlGEPQ9WBSdZzDezPP59K13Vna8P8lTDrtgvn82Qv4U5FwD
 16LTFVOqxoiJUE9bAkVdcciE7ldvdn+R77frs+A2Lj8wStDFATIHWHCHil6js8OlB5qoFPodX8U
 3JIiyWKZ95OvoR0trmKzsvWaXrptDGlxA78ZWhIcErHGPI8ubUesgDKtbhnJjz5Sa8vsHkH3Obc
 r2U9EQT5ewD6xiXtLmOLai0GO71k0IYl6LaYl5cmBA3xZtg6mjVjJArQEV7YEWQRiGpyMtM/vDl
 /bDh3rjht75TxhY0UeR82zz5jjfkTQje8TbbNgumOp+16ilEcvHMrxTs+XuN2GA0k4dOrY2q233
 oBVLt5VUvX/tcHWXzuQ==
X-Proofpoint-GUID: XVd2hh-9NjHPT0N82CjXW5Du3m9gtc8O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXwLMWTOR7JLgd
 VHUqNk4hTRt3FGMAWAykanju1/3RE3pxS4dh1nzHgUNW+lWYKapMX+fXDB1TR31nTgWfyfmwbHC
 9+pmKOTn7skXlj8r7i8QN/ydopjGT6A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130085



On 09-Jul-26 3:20 PM, Dmitry Baryshkov wrote:
[...]
> 
> Is it compatible with the generic rpm-stats format? If so,
> qcom-rpm-stats should be a fallback compatible.
> 
Agreed Dmitry, thanks for pointing out. Will send out v3 with "qcom,rpm-stats"
as fallback compatible.

Thanks,
Sneh
>>  			reg = <0x0 0x04690000 0x0 0x14000>;
>>  		};
>>  
>>
>> -- 
>> 2.34.1
>>
> 

