Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853DC2C08AB
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539492; cv=none; b=Re0J9QFo21Btz2rEAJVA55OtwkwxjdA1+oSzDXFpfkj9KK/sv/ZRAPqp0X1+gq6wwu0WyxQnx5VgR6HwY3W6NmUG0SsU6U4FRO2Mia/Puhhasg+4Kvozi405mkm4yGhVPNhIA2JjtCEXT7j1oennYH9/2TpQDywU4C3U2m3NRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539492; c=relaxed/simple;
	bh=lLSeniYsoBWSndP75E4zyqs5qfewY+ASCyHOj1CT8U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKn6UyCuVHQDLV7czyjG+rLzVKpG+ywbd8Js5sapeylftsuyJ3F2AWSKNV0Fg1nIN4Ptjs8BeAskT2eh1LgplnkdIfx70dE3G0RWcIUenTif6p0P7dSIqMZcF84eH5rEQLDamQc8PT8FTia3pRSNdwdRSwu0x0V2241iFTeO7DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJr2l14T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TT4n3Gql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJr2l14T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TT4n3Gql"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QFA4CO2878484
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YPFl1KJhjzK3rxoLoSivtVJTdJfjHKNGOAignUCRoY=; b=YJr2l14TYxduuMEn
	/a1mL1NhjtrlkXCweoa+FA0vKAjJPisdslUIEUsmX/NVoytBHrSrn2dmKwfQqM6q
	pIEj5mTPV39/2L5qr+ABhqoSblO2HDm60V8tXZZ8uJYq6lNNVf4RGlFfbSmfzuIE
	k3o4Gtij56snABpnUEaLKR36d2s+cUpruP2IsUGEFlEz0NaN5K5LRjkz4FoDg3qm
	VQT2nUnot4qDO6i5XGQoXwI/aez4TJVmLdRM90ZeEzYmZpiah95S6xbmwPPDFS73
	IJfjBG7GugnTFwJggCKOllWhXfMTAM+N3iwPgMusOJ+eUXF8TLuZq/b6TBEwjkmT
	sJofkg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q093fk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:38:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso34348351cf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774539490; x=1775144290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5YPFl1KJhjzK3rxoLoSivtVJTdJfjHKNGOAignUCRoY=;
        b=TT4n3GqlnRkA7AeNSNNeJmkF3VTwmR8iubo6w9tUMV2z+3APNfGQAO1AdnSRmioku8
         hk1d5eBGYTM9CoRveFRY7jAdvydeev1tyz+aWyPfdU/eNS17oQEM9FEej6S2wJTja/pP
         L8epo4yTOh6VEL4/xifb4RMcQSO7obTKKOXbK3uW9723KoyFiWWgmRoC62xcDyqXivFR
         ISBr+MBClcuDAXUVSuNRsZ1MwtiLTpgI/Gk7PJqVQm8ZwJ97EyXP9GLiqXkDKtKL5Sx9
         Rf6O2npEME73VoVPkYkTWI/wDmOjEUAmq1jTLgWL9kmBiKh9mufNQ0Sk4ts24DFJvZC1
         0vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539490; x=1775144290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YPFl1KJhjzK3rxoLoSivtVJTdJfjHKNGOAignUCRoY=;
        b=roDZoQACr2WfrzdkD4ssH12Oh8+FS/bmv5y4sajlKoJjXGg62r1NdTa5bqj/93f7fd
         L5Yl9FmFQVZP1lRoPryaJupwG5wKxvueuXw7ewdv1K4ypbC4LM/7xInFn06ZL1TyZEZN
         XnZaHJKSo4AUh0ss4sqZx5k8W8DhLQRDtb1P/eO/i0QoWiYjeiznOiJhAG5nKH9iDWTz
         +/+lbWnCaQYN1mAt1QT36vMWtVfgT3T6TLL/U/w8XyN0jcSb6+WVM1d1MqIy8mTIz9Y8
         lz5twlnSmkRM4uE6kQRthCqVCB29uBbuEOoBCcF5rioieMYZlbuSvaFq2jaYUg0JNreM
         6QDA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ25O6KA4yAiej4379m8OVo93f7QiWHTqbTp1WrNDpM3aw8xKJhHTiuy6hhMIzFL01lGdijYQvfB2f@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHv8c5CKmacpticZ6P9MbImte57rCFqsCVWAQJ4GdCjGYDRqZ
	Uo6wlrSF3/E9XGUKb9N0WTmleqJjanXYZ3P8DLkxleRFRCVlwDNb3B370Yb7hgV/IMLptmPEGkd
	1pUm4TkzAtKB+vgNQYul7WUz+frjcepRmwmE8/imGukXkkLGhNtILQtKiRxJkQUBzX7UfgF+C
X-Gm-Gg: ATEYQzzCa1MAL8rMmQ1cYHJsWbO//teagzXoSxM62lrWwXbNQYbzkJxKOjNQ52roynB
	tm67BJI/iZXJiRGaEvYlRXbaOizhuZSM/v75baDZgVXVA0GuXanEbVYl88gfdcX3ZbNBSvJm5wc
	kn8NJl/IuVQ27mQoA9U4fKC7YZcCz5uSbnZzLjxkD1DcirXL9ZXMbYz0ULBz9y5MKenFNcf1xtz
	uywo/a24p82hi6AQdiPFmQwdV8eqxc6HC+xsjzgl0gr7HAB39z5gh3+wYVqIWsUlobWE9Hcu1tZ
	YmCOHHnDkty2VEcGejIoQWLir+iFMjv/z5/wLaUG8wOS/fiUv4v+f1dkuEQfXkPWBNswxev5jQr
	9lBFCWNfnKIg/im4BeSuK8kZHU71hwKvX5e/vjeVsgPc4pLPq
X-Received: by 2002:ac8:1108:0:b0:509:329e:bd5 with SMTP id d75a77b69052e-50b80cabd6bmr88375671cf.3.1774539489669;
        Thu, 26 Mar 2026 08:38:09 -0700 (PDT)
X-Received: by 2002:ac8:1108:0:b0:509:329e:bd5 with SMTP id d75a77b69052e-50b80cabd6bmr88374941cf.3.1774539489036;
        Thu, 26 Mar 2026 08:38:09 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm9457599f8f.8.2026.03.26.08.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:38:08 -0700 (PDT)
Message-ID: <fd537c2e-3ae4-4c96-bad4-64f846f2f17b@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:38:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: monaco: extend fastrpc compute cb
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
 <acUzKYUCbUOIOrw2@baldur>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <acUzKYUCbUOIOrw2@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c552e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vFMI6QV04ZLWi53vWY8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vryT1V2zOCiqD-ASJJH856_lnec7ppku
X-Proofpoint-ORIG-GUID: vryT1V2zOCiqD-ASJJH856_lnec7ppku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExMCBTYWx0ZWRfXwMcFbsI6pTFL
 RmDQ7jI+pY3+Bt34xwMyvAmvj+IYMfSB+TGky+YQP0q9IdXoT1JxJnRt3ouf6ByQa37K8jctQxG
 klJsQp9pzy26konv40AmVziBYmobNLH+wYjce9Mjnl3i880xzs2Xa81gZxBaT/U6If/LMEdtTQP
 ShX98Ar1xQILZSiCEboyk24mwLBNCkPG6I5KUZxPWZyFUWJTuQgryqa506GPpt8e/FkO85SgWy3
 dmtDWpHNdv2gaJgOLMAWqYi33qGV/Qjjz4MJ4EwaYjxV0ISs4/LXD3/hJ6Ekp267a2zh7kbZNB9
 oz/kkEguwCqqxMnZ7o3WZFmHK0Rhl6a9jOB/fxbBinOyKIx/eH94iMzz8MW6F3XUVmuk56vFYui
 DDAnFWkz4EwPQZS6Os3/jmCxyxpa8v160PGwPsZRUGLA7kaarakIviQbK3fY9VdOnusH9ybbrQt
 N/6NTC6fohvWJawGtGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260110

On 3/26/26 1:24 PM, Bjorn Andersson wrote:
> On Thu, Mar 26, 2026 at 12:58:34PM +0000, Srinivas Kandagatla wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> [..]
>> +
>> +					compute-cb@b {
> 
> That doesn't match the patternProperties "(compute-)?cb@[0-9]*$".
> 
> Is the reg an index, or an "address"? Should we use base 10, or should
> we fix the yaml?

Ah.. sorry for this, will fix this in next spin,

--srini

> 
> Regards,
> Bjorn
> 
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <0xb>;
>> +						iommus = <&apps_smmu 0x19cb 0x0400>;
>> +						dma-coherent;
>> +					};
>> +
>> +					compute-cb@c {
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <0xc>;
>> +						iommus = <&apps_smmu 0x19cc 0x000>;
>> +						dma-coherent;
>> +					};
>>  				};
>>  			};
>>  		};
>> -- 
>> 2.47.3
>>

