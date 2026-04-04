Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271C17C69
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 03:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775274383; cv=none; b=IhAFZYP/vuVHor8NPwyruzVBoOUVqZqBADBtMsWCAZwcKpU7D9Q/3qYPXJtzkiFKfgGzsDGs/YuaJqC2jAK2QKG8CHXGg82OXZdZ2OGE93A7Av+6/60AgIFmuHSIxm6ijDX2JCnvOZZPWOPrt3ZqPkZ3jkft2KQsYA7yc0jwxa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775274383; c=relaxed/simple;
	bh=g7BPMnWGYr9XLedyDJj/0ceqM2/mwHQtTeYEh6kl47g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RS4H2NlOfFSa8mglNRG4Rkf61Ud4fL91CPCdzD9b4z34XuJplwYHsRug+USbTGbCXOGyWEEDxcconzNxrpiwDNBS4U90NJ8cn50QpgcfGJhnWmM2drhebE/UVr2A1+Ntt+wW1g96aS71ca6vumvBbvvjG3R6L2cvT05YwPLWok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0XyHZcp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arwF1Ylh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0XyHZcp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arwF1Ylh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343WTtK948009
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 03:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWHLzaZk1ffZwAMB9f1QCz31ZypCQabwOafEwrGdsFU=; b=Y0XyHZcpWbqbH1yF
	cTFYxK7G86xg/EfUZAb8UXd/Ripb7D0yBNYjJRmx15MsU039UTWhM8u8vMJLPzaQ
	6ckan8pcRg8N/7PaZh0tEaqkXED4JrHyp/wIzLYfbcmu7STs5EDtjN+eg/PbHt64
	+x0WT1ydFEn9HNLwp6ZIlu1b+r7TQt7UjQBrZayFBjJdhUJV8gBNwBwjXvcV+eCf
	c+ZXovIn1ZL5fDrtdGN0z0ZV2nK95HfenT8U9n9QZYWOGz0tf6oJ3e8nLH6hixOI
	wotuTd+XObyaBT8yePpw+B6B5CvNZuRhAqkHU2hd45ZunfPx90o2RcQJScJAFR5D
	ucQVlw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfmj6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 03:46:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242b9359aso22675655ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775274380; x=1775879180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWHLzaZk1ffZwAMB9f1QCz31ZypCQabwOafEwrGdsFU=;
        b=arwF1YlhGfzPpWD+zueKvPK4E8c8V7XgEjVunhnlqu7gMb7BFsbX6+GI3F4jTSh1QK
         4seA8p/tM98oL2VwOoASnXmBGgKXOPOsAUCxcZOv1T4+g0akDXk3H4OSKj4C69DWurUG
         P0O5AOS2zjDywhIkSSukVceZTb+Y1BU05quhTJZesiHmoy7K2gYYw92AVRiGRiHV2l66
         KYtXXIF+3Xmsxh3NJamV/iLy7bTkpqMDNQkEOTETe1w0+4aoh8TItct8mpRrB7ZClrR3
         TD+b+aerc+jYxjSrrlRRNUhkbHxfvOShXRhi313cw3KGJlWBh8DhV3a+3KRv2QLPZFXX
         FTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775274380; x=1775879180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWHLzaZk1ffZwAMB9f1QCz31ZypCQabwOafEwrGdsFU=;
        b=RBbYKkFM50Qtd7BsZBAEjgI+IMhciXndD4vZegy5pDlxHDeAiE4+4cEU8zAHFXHn3G
         Fq5NuYnik/rKnKdOrUb+WYpUn8PxAsQBNwIlmpywSALjHLrHwy9y/kX053ygSwAzA0Zz
         7lJn+gDfWajviOBeWP/HrBDomZB3jTGvIECbPsykPx19E/vaz4crO+5Au85a3tFBlf8r
         Tm/0r4i8zudNThNKSThJsHeYpTEG3ib1h5HvveZYqMNXMlyYZgdqfkrIPeYxvi0pcbJD
         tCtc0TfhvzsNP6L5QxWHIXzq0BVg2mILwOEcj0Kr36OGLNEYin/8XxkQe9gwMzPWn5Eo
         mjfw==
X-Forwarded-Encrypted: i=1; AJvYcCU6ySr+6ZYFt34qSxVNmrcNcGA64/Nc//MELTR9+J4lXP8Iijm16KPrybnMeOg4P8vJ7O1h89KGakfs@vger.kernel.org
X-Gm-Message-State: AOJu0YwMB7OsIokEtJXCuWGFUKh0hT/mX0tJQh5DP81rJXFqT2XmhQGE
	1Mrv+mQw78AP3rklZo6/VafoDvcFtcuexv1ubcSUG99E4PF0pF5k+kPtYEbhXQ8q0My3ghk20MT
	Z1FUacjU89+m3CvEQ9AX2/EhAyiUQGKWeuAzhoOKHVr1UYsaDEV0z5oR8u82hUqoe
X-Gm-Gg: AeBDieskEPZLE9gQzAO6AMh6A2lZclb3vN/SOo/EAMaoL6rXFPiZXsxeL/+j/TuSTtO
	ZeO5Lv7a3c3Afup06v1NChejOt/0wazNEL2geiPt7WcN/GZsqzqvj8zLnHv7kq7/Fr68P22pOsS
	D7JcWGgvQ1Q5fTga79NfcGxWbdLpFyYLpbaCrBUfIEcKAWgNrWBVbaMUNl5QYsP0PjvIGU4eX3z
	tt14A6+X+s3sBRcYrey1eZwM+3AdI5vW0i+y8xQc214ZIqEJInkwzVYZt7Kk3Qr78jL30M1NHI2
	3fUiQXBhB60XDHOAQ5T9us24PbHbM9wcktXMHnYmRnS97t6DPhdgV1qoVX3FkJ/0TKBZwpMYYrt
	1sJmn81IlTujdWQn6XIwBDsI+609EIeQTvypOGtjZc6mLfn5sbverHHvEwrKQE8QDK0n1ZXDli2
	G4uAbrss5KQyk35Q==
X-Received: by 2002:a17:903:90b:b0:2b2:6df1:111c with SMTP id d9443c01a7336-2b2816c33a4mr56769865ad.19.1775274380266;
        Fri, 03 Apr 2026 20:46:20 -0700 (PDT)
X-Received: by 2002:a17:903:90b:b0:2b2:6df1:111c with SMTP id d9443c01a7336-2b2816c33a4mr56769695ad.19.1775274379806;
        Fri, 03 Apr 2026 20:46:19 -0700 (PDT)
Received: from ?IPV6:2401:4900:889d:bb8d:7946:a891:556a:a3e3? ([2401:4900:889d:bb8d:7946:a891:556a:a3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979530sm70196985ad.46.2026.04.03.20.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 20:46:19 -0700 (PDT)
Message-ID: <75c2c49a-7c80-43fb-8c6f-67771bd2c786@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 09:16:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable cpufreq cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        aastha.pandey@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
 <ybptzcfs45xn2tkjm4vzxm4y56bh5m6yuzvzhagoifdycrqgdh@hzvad3pg3dcm>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ybptzcfs45xn2tkjm4vzxm4y56bh5m6yuzvzhagoifdycrqgdh@hzvad3pg3dcm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iTFnXnIQhnQbe7oYCQQYguDYMhibCPyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDAyOSBTYWx0ZWRfX/eAdex7ak7f3
 4Vzl7Dnr+lLqdUz7YJwZ01lFZ3MY6hyTqE0X5V4maIw2h+osJx2U2TUCW8MRm0OugM8hZEami5p
 YzRzYn76mW30/KRD+pUT8CESS1MImjo5vhlTsZ/j+y0nTQNOIgEegpwO3ea1vTvDHbPN+tu0Mn7
 IasqWJJ7UeExlVB8i2J0Tf5zjA4qM5KW6jSJ6DDUsvMdbW00HDOHJoPHL82KFwqOfCYv7yUSvwz
 WfW+cxiJeFipceMWHjO+2QqnfiD4aCmD3aVU0OIS8utjN2G/e9v/eyQy7xMCILBY4Su8i311RYm
 jpZODdCPREeE0uQdIbT98+rBxR911lNiC9q51JmWEgLDQnLxmYsfPoaJGRAiW6IJ7gng40XRoiP
 OW00YO8VikivpjtC3N6kok8/SMJFMnOHB+8BBgoViwJZhfgNjN3Z4ykz3qWM1fKEdR61Z4XdHQY
 vvQ27RfXx9c6hPAwMLQ==
X-Proofpoint-ORIG-GUID: iTFnXnIQhnQbe7oYCQQYguDYMhibCPyn
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d0898c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=t6jTbvqzZ6_00VdWSxMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040029



On 4/4/2026 1:34 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 05:26:33PM +0530, Aastha Pandey via B4 Relay wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Add cooling-cells property to the CPU nodes to support cpufreq
>> cooling devices.
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

thanks for raising this patch, looks good:
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
