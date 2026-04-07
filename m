Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C58E39B965
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554309; cv=none; b=b4eR//qRgCQVwN1dAd1H6t4k6DzCrTvpZUDmGdRqZiQiVPPYq3VT+554l4T+JqWsG5ScO3/1HHRzWfp2culdfkHsUfNsqomeE2FTGRAnpryj9u+3fJWDmGsUiHZnzY2QqgYZQEKBr9u1JLbhFr+lQ3rc/OFqPHgMhHBbFt8QAD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554309; c=relaxed/simple;
	bh=WXb5hWfuZd1kYVDY+Shp1I/cov/+98/X8/kyL7XTY3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rmo0af0eueMw/SJ6IOz2/iU3OZqN7E/jTEzcc0VyaQEWc9AWGD+bUNPE/KPyrgtgCh1kbR0PLnoPqI+Q5/DftAYsIMtYHrWD/c7m1srxevsA/DycQAO5Kr4QuYuaZffq3hqNhTVprxyYIWGTh/Jzx5eFTbiy5z9jzi+1U/fwa8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/LjdOZs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+dJsn1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/LjdOZs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+dJsn1u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63775dGr2009139
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VDpzpJctBF8y00sVZ/9sqzDSyV+Lw/a4IOwwOhnYAI=; b=T/LjdOZspoCOcNjm
	g73mWr44lvKdbGir1t+FSbckqHzQUJ5OkH97lzlcfJIIDAPnCXy5cNurdKgiMSPT
	8CSdjoz7e+vfqIBDV4SQTLCqbvURzL7bXA0imLLnsFXb7xtcYKPXf1PLt2ktGedI
	X9+SdZ67Brz5QW+YdUAHCKz+Cgkhhf+GJLVWV6SoBrRpDUc7cC1bRi0b66eBf/Hx
	WFq1i5Ab1RBnvZ2Y43XkulTuTYjP1ZJcfQEwb2QYDrPTGg3MVw3kht7HBHdQEQNa
	ajjB1ciRyrIu6um1e+NCeyf8+sl5UJMY1zake5xkRmjqROPMR+/UHhhvQTDbrEgE
	GpUz6Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrt2e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:31:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f59c9bd28so15261176d6.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554306; x=1776159106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3VDpzpJctBF8y00sVZ/9sqzDSyV+Lw/a4IOwwOhnYAI=;
        b=S+dJsn1uXuVICDhns0MCQ7Y/ZxIGeLMhwuu3n9r58t8wTkHUNTNQFC7myjm1WSzPK5
         4eFLjdJuXCDkqmq3O6wwCz1an2gOycHUj6pVWHxAHUEZa7FbD6SDRIWqRLfB0NhzCtoj
         ZUEjke4vDFkQ9HkmTWoIkb6i8dJLHVEbUkdgh0yR08r5Ntt73ww2Nggca8T7oW0imZHn
         47MHMZJeY0/vl6vmWKVIocGLu+p++88Z9ss5cmzSO+AnsFBMUghgzA4qMZp3QXxQGhIV
         Idx+tCpYs39+J7j1NlWzTvQrg2yf2OimpqGAkqqQMf/5330dCAfWDmmncXzLAdoxzP72
         qAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554306; x=1776159106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VDpzpJctBF8y00sVZ/9sqzDSyV+Lw/a4IOwwOhnYAI=;
        b=g6Hs1rUPWYoW8EsXLljskNlwTtrlceGPfxxqz8tTaAvlKUG/fyA1MqSpXvNhVNimuj
         BYWUjQ5P5BOCEUQLb87GRnYaig2dbxtaCZGqW0SGWr2/WTHXMsrFUcJT5zS9a/JCuU5q
         cChXzYg74f+i/V66yLoQdbFxnaOHUZ4NMgkiybLuMGA22LhyrHG9WT+3DGYirNIOQNDz
         2hM/yMB/ZBMsvFeclyCttlX/o8oDip66j8sWrjgGj8hduxvWowZLHMkybLyeD86Y3Yzy
         MMH5oVYgCNyDK6SaV/KoWpNf7JX2LxjNa1V0UX8ILxKYdUMNuU9A5+q50RZCSkkQH0Pu
         oELQ==
X-Forwarded-Encrypted: i=1; AJvYcCWspIxga+54MnoN9RZuJ68pvC6nh0dz4xk5KIk+gu2dk0zy0W83dqOEjSD4IvDrrwvv1+3JE71uNqSX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9dp1/QhAOOIqtIVCvQP52MY+h0EEoat4AIkwg2+LBpQUgCiJ
	3Mtzg6O5PDgFRiqR/b2MYYwUb4q+B8mlUAG5iDY2d2vh1iLs9P+TNWho2+lbqUxDrkSUbiEhxgK
	up612UWeS7PnfbqQDpqxPxTMHB5tQsL/FbkIdMT1wpanTUUCQzkBkUOgTHydkW3YS
X-Gm-Gg: AeBDies48V5MXHm7v18NCHyp7uY1re9EF+WcPi+m4S0dG1UtdWI+pLHyXeNCq+/TVYO
	Z9fYt2mmIW93wqc69Z1UXVrAPeS7eH0LxfC+CjvPoZJexht5tBAk5cNCOo6SOoTa5qtE9OAzrJl
	oqIU1mLmIwhcoH38jAoEuzS9m2tmDcHJg4iUMJBGg+rdwJf49CY3wt0ZckN0HKowzh6R6T4uNVe
	FbIjzSeBtEYG8Lyvw61rdg7VhghIB68KmiYOK5W3QBn0NR5KLjIEl3NrH/o5DZKlRFIQF6BqBrt
	IW/eKEuQ9NlQx3LKzv5NZMKHL0GVsZmtDx3wVqWL1VqaqU/0Pd/CW3BrTPt6s0legXSG+ooRaYv
	4clfsxLhzmhqjwqNWENfkvB9+EHpxWTyB/iLAdJBd9x2A3H0I1h/vF9aMwM7HR1I21Cc1hoVm9E
	OuoUM=
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr187084046d6.1.1775554306016;
        Tue, 07 Apr 2026 02:31:46 -0700 (PDT)
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr187083716d6.1.1775554305557;
        Tue, 07 Apr 2026 02:31:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm533499566b.14.2026.04.07.02.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:31:44 -0700 (PDT)
Message-ID: <8723c893-28e2-464f-a9c4-2d4abc67491d@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:31:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX44iv+mq7B7m2
 iTOc7mOqaEMgSrvNoVHYqykZggu/s1C8NaPIi3VyMdzYoj/aq8sdzxmLuOfpy35FhX0GVzdwRI2
 KNVcyHW1q3/SZWmkMc8pZ2lfC3jAu51pdTOPlBbRmiaeNg40RDLdqqYfxP/S1I2kDajL8b1UsSC
 OeUvt0Ptmu/8PfCANTsv+6yAxSEr92gCMMjFXTyPrYU5mW4f5J0+TBUOhfmqNO+12u1dIie/k8g
 4Hr5IuMqaeYIrxTk6OL5+utQI4koejTf1xWWQWv5r7vZ9sypLYl+2VQ/Q9bHHiPi3ANbQg1VNEl
 pR3SaW2aioWyHAP1v09aQUIjTgK6JdW2+aPRKZ5i4OJB1krdp/41kidGAGGtUOBbOjwWZp5d5pe
 4BzAI9OEzJfj5mK5siDmyQqgo9L7s8vQmaP6alR6bP3Rfz+jYZg6PYjzZLnLrdBiCTJjmN+Kwy9
 YwHadNclfNNCJIiL/CA==
X-Proofpoint-GUID: dVMNjq9mRsQBDIpGpB-u-SrrZLuiowiZ
X-Proofpoint-ORIG-GUID: dVMNjq9mRsQBDIpGpB-u-SrrZLuiowiZ
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4cf02 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YTqrmQZhOYAkcZPAGwYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070087

On 4/6/26 7:46 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
