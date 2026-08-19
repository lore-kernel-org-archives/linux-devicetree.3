Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DFB339398
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152221; cv=none; b=EX8irhb+8xjZ4XWCJGR8FhiN1naix0vBcK4lgvVxPNYBmlhVCS9UrEPT5ECknECReblVCi4jS3zFDZeR1M3/v43M2MSGGyvYc7xkQBZkghOzpAHZyUDMnDaBz91OQ2iFcEMiuHtC7zc7mO3vnNn82+iV00JBdtUjA91cT2VTa1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152221; c=relaxed/simple;
	bh=jEX1Bq35FTE5RsYsAvjGitmkzRiYC7EBEbUV+rHCP+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPYMe/NXMyaxyvlH5+PthVVdPTTZ8X0G8GTSIvN2Se5PeLMVRm/YShQPE7yKSUCwbUSjQJgwMOfCfp89MfPlB3cLxkEBO+Kv7YTNmGFBzLwyJanZ3fFegK1NtVZWwrCj+DcLPtqXeRkqqtSURmFuXvrdiMSxqzXvqwtfNtlbje8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHz6I1mD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IABPSeq3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHz6I1mD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IABPSeq3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2Ed6190698
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1Wdps88SDUGWtBZ7IRm8D78qGgCVzrnQy/Gf8AgY40=; b=HHz6I1mDVKqJPQZC
	CXaOLYEWTAQaByvbu6nn2bl6sx/Le89uHDRAqaIvoQRsNLvh8o0hAQ8fANThjuts
	VGYsL0B6+dupa68Cqg4gr/rDPQQRmWJgASlsvDgzsVOtUpk/txVPmsrbfWSzPbcw
	zpJSMDbADZWk5OugTk2DTfh+hkEdgH8rUeL94c/vxsX2fJ+VJVUv6yAaIAkWWAvr
	2j8pWCWZd7pcBwP3DMled7CMvpCq7ndQNiVTav+4C2LGzhrcaaDYAbW8nXgByRr8
	LFTIZsLzfxNkshcJEfVay2RS8P1q+Sm0koVwt/rg82oiGNWLNENaIg6NR2cPiqS0
	I2VgbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc01b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:10:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so37714485a.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152218; x=1787757018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1Wdps88SDUGWtBZ7IRm8D78qGgCVzrnQy/Gf8AgY40=;
        b=IABPSeq399yKyKI5n19MKbY5HfDFQBm5PEFsmX44D2uQtcQEXwzWAquj+kSezy2Ewa
         6JjFZ2XoLPChkK0hwXg4so6zYda9CkWxFu4CdbUIsCJDRVnWlgyVcJxfEeF/Dnpg12oe
         hPcnbuqvQeXwYoJ6GyscPxG/dTeLbyc0N21ziFAh/ZMZSHJX+anib9YkPjcZtxWD4VaK
         IxcUsUDBTuCSoWjCNc+KJQoLYbMp9XSkKvJOA2cOUbDFbfI0/oqbpe5cvnNTEftgK2Ix
         yC/yNzSlyJdqVkEytVV/6So254ghadSogj61xPlg/pDYhtOg8GQazf8o9M2dPgWGQ05v
         1MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152218; x=1787757018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1Wdps88SDUGWtBZ7IRm8D78qGgCVzrnQy/Gf8AgY40=;
        b=k5BJLbGkLgURR73Ts76rv/s1HRD/XYb3fc+me9fxtBgh2LK8zAZLidvNO3P0rpzLNv
         GeBg4Sp7pRbJR+Pb2uPlA5/VCgrqMFbq84x+Z7/slx8CAWz2H2I4Y1o3gOUZOnjplUNj
         +rArvw3dtVfSZC3vHLlrGOC/YbQau1PAKddgzOYmo1h71/BOQ407vavrBdkL5pvuK8CL
         rqaRqUfe6sRDtDOSl0RhsaKMPvii69uKPm3Sclgrz1M4zNF35WoVXj4mWQughHiuZocv
         CVm7M+7X8sq0hMFcv88lI0vk/ufHpgS+96I2DDmnvLK41yWBbKTQnP/K5MbugrW5keAd
         tc5g==
X-Forwarded-Encrypted: i=1; AHgh+RqFpFT4jhDnrbDlpRohWXrqx4vlB5Ex5NlJPgQWURtQuWHpQlnIzANY6DM1O7E3y7OWCcIhR/q/zKxA@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHplfSKhCAX8Uw0SGi0RQnPuoHA2ThbG5z+tKmpxE02eAtU8c
	wezz7xwUXBRpkXaFXvIHd+PKhR0pOe+vtbgvfUPHBVqj55A1Jv4XOC9VnAbnCdfdaYMxWsUDBQ4
	1j2JBIxY4lpyBaO1g95UFdFJNfUANtETxxlwbeqv394XOcIfpNv+r9hXih11hcrxI
X-Gm-Gg: AR+sD10YCHYM2qeAhGvB3qJhYFwhlntO7wHXNMYhna7HFSniLBcDwibPQjvbK+5JmRN
	1yMV1xT4HB6moHCkxjXBKAIUaceXYb7J+b4adPMjxdaQuy4G/57LxoENs8/6kAQhBMziwRnZxHJ
	PI9mGZ7xq+iyGBPE0aBNz6ozgrrWSP+sWZiuBdYw4+G6/m8jDmSc0kvvjig1JVE+WECHzP0HFmA
	x46Sgydz/5KKgCF0gC3jfvRPERURnVw30gsIOfjeWb6Moi/mxkymOVQy69TcbBb13vs6kDIbQ+q
	xqmPrNqsrPLZ6mPBSk+G9/V6arbYVzvzI6t/EKl3OKa9rspmCdKMvqxvDFAIJC2QsH54H7VR5Sg
	Byz/Q1azrO6VW4e3109dFsdRy
X-Received: by 2002:a05:620a:d95:b0:92e:5272:4e3e with SMTP id af79cd13be357-9371e14b32emr421969685a.0.1787152218524;
        Wed, 19 Aug 2026 08:10:18 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:92e:5272:4e3e with SMTP id af79cd13be357-9371e14b32emr421961885a.0.1787152217990;
        Wed, 19 Aug 2026 08:10:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38d0d5sm90120166b.41.2026.08.19.08.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:10:17 -0700 (PDT)
Message-ID: <05840b83-e447-4f06-9cd4-e17826d0b225@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:10:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
 <20260727-ayn-qcs8550-v9-6-e3db456e10e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-6-e3db456e10e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yZU4VM7mkhlrdU-Gg0eDGBSz_3COUHJm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX4TkqHxFKI8Vi
 Y0Pijft0fx96QiH+YgUGaqarjZqYtf0MV0NVQ+uNP29L81tS0bEHxYnv8i3KwzQPhvIYAwsw+Aa
 nAznY40Lg25Y9/71n+xECfYwBJDjuM0=
X-Proofpoint-ORIG-GUID: yZU4VM7mkhlrdU-Gg0eDGBSz_3COUHJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX5FEXs6RzAuVD
 7HtPvK5Tn6cvG8JQUJaKnzfRmStD3mA2tE3O2C9K0oxS+6ZrC5ATsUB3G1ACI1iR3dXOr2vvrLT
 skmkKEC17RpNAmZGjjGIct3vV3nVvQ2jd2G7Ag35nwwH3Ot2UfQkwj3230o+DF0n14Mr1VgBYt6
 SCrCaqExHcLwPIlI4lwJxPSivjMSqLefhEgDgqWEBPNtizTYE6eUf63CzioNyc8piFuISGSk494
 45gD5eJ+z8F/iyY1tuRJ3YqOXSQbL0znbLD5JLb3dlPHKitBybe2WKEqkl6N9FcNULCgEj3oHus
 j5MYY8BiCgzHP3lNN03rXazLgGGnlKYIEW1+ORICaiT+qiYnuTUdEF1NwlFc8/95wLMzu9vBLzc
 I4LTqeG5bbTDNCjQTLKPAt7Zp7AWuw4oknfOU8vwOLnatCX2eTJHR0rYQfqV24NAjI2LwZKmCJ5
 dMv5LpmneYzmcCJ/BNQ==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a85c75b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=I5Wf6Tv452McHZCWETcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 7/28/26 2:20 AM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
