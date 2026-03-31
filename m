Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C8F3DE424
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967018; cv=none; b=WktJArmFL8TDDeo5k6tELjx8TstoyyApecpkYPSlSF/PbYxeb/AdtPGWdJN2Go27uHUf16Q9d69oiw2xtlPqQV76k+8qtZvKdMGCgN3fSVF9DANn21/1aNEplgH3azpgbb/MUANrVGQk5U5J3NQqswl98DIF+LJRbmapbfaJ7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967018; c=relaxed/simple;
	bh=KpnDzCGoxSMFjiulsyeuRWkhHv9HD5upRYyXs87ckes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2nYDXoedAWZErD528LDEKEh28YtUTZ8EE4kId9+UYz8fUhyCjWHsXQFLpu3aAW3Vx4zQKELJYL9MQQ20vDJRFJhpEPcvcVFE1rnUklrdpJJoPO0sWJqVSUwo+0XhLgOYhDTQ3y3Ivjai0daUvAGkQbjI4mjiSZr6DRWQKF3QCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cS/61qha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH7ddWZz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cS/61qha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH7ddWZz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBEeFW1090724
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duNzVU+fWIW2eMrS9MZLuIgJmindhQKIlaRaLKEtYgw=; b=cS/61qhahBpznw2w
	0QHmxgVs99T5WU2CuzhFGCrnNcNvaS7cT7So0ybDqiStJ6ilogttCY780kzWCN7l
	30AxAHT0nSbZlf9VI1MZM83tg7BqPr4/gU6GB4xUq1b9KKCvqYdKR+pbzbCdg3sA
	yFlmfdPGzkA5el7lKvIsGXEeASWCeie/PNGtKiBtMEjWd+WQng9QdPl19+uh9q7t
	IQZr77MbHtssTUfi9fqkis9Uywiy3Hm2MS6561J2gt/YGNGHrBdFyvs3J9BoWJ4G
	0fz0Zft9J0dTkn8t6dsY+G9W7LZ2bGuteb+AnatJiOBb3A2Guo1lkFn1J6ZGlgNh
	krV5tA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd5b08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:23:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c7130f88e3so13948435eec.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967016; x=1775571816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duNzVU+fWIW2eMrS9MZLuIgJmindhQKIlaRaLKEtYgw=;
        b=TH7ddWZzZmfM1gJF5llXg7yO2YZH31bsviQOc3aodO+PWkfKQR2HL/EUMUJptMK4B7
         /BDqj0Ty1sAxVVrSoZ3XUHBrg+FsAi03tuEx+VP9KIuL5kpYJ6bhWvOTnvRGxJ7X+mhB
         JRETPvRElE6OB2ktzkgT+Yq5nzYeW8HNClV+CswfOnAYgn3VM3skzBHRrVKjbJfKI8AM
         6qKd8daNin9TzYZq8pSP4fS+kH20wBRHwrMp9g2EBsPdXTqfOwj8av7TouhfcCQV7H4s
         nPAbv/FV8W2MEx2GTQ1eeXkK8JnhWlM0dGOIVSyMH8v69fubAvL/goE7cCCmDAfl0Sb1
         lwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967016; x=1775571816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duNzVU+fWIW2eMrS9MZLuIgJmindhQKIlaRaLKEtYgw=;
        b=p1JYYbDhNb0GdS5sPhHYf01AYR+TgTAR3FDYEBA726O1lPmZ1qXAtHY/B5oke8RU2u
         z9lONjfJ6UaVeZ5djg04RdGFo/PS7ho46qYfmO7gnIx5xG+ER/EiKJVJM75H3TcB0iSd
         vWhH5drRMEnPby6vNiJ1POBdjuczZrM3ubzypGrjf1fM9d40GPHQbibru9VWOmxcsKa9
         A+SB4okdZBdbisHHSrGVFZ7cSew3q9GoO37/5xVMyS+pJyZ0GBUBsxt9qyG/92dIiUom
         D3FNZT7rAkSny0XB8yjicjMeaAI9f1lV5fIp3MYVDB6C2+gZRyOEw0QlWq7+2PBBXKAc
         s+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCViDozTqHJOG5uOrodV3zfc0G51/EJO5ddN6c8xMwG/W1KErVs4IgEtE+Z/G8p2DzFY4zBi8q5QXdIA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlb0J9dcgVNFZJ6ZGel3hTIR2YeefneHmV3Iv5ohi1uTVbbeTG
	3ggd3V/lcnGJ01wlOb1iUTiQB0YY7i6SW7Bi39XF1GNTbg+ccJmbn1I17uosC/fWHlqpWq+QsIj
	vtGbPSUW/932v5RQnGckcqrY1/0KCSHNXolGkZXQJGgaXVL+coTkYkhQAa61TalIs
X-Gm-Gg: ATEYQzzkNGSkhMqgQOww6M01gDSmZFG0LQ1VDKPWpWWV0M9ely2vTOsqcfBmYiLCnT7
	25EopXdLsblEqPIeFlimyRKCcf5/z+HtUzmT+JA8u/bOVYYsOAnnzBwADWkoQ0QAN7tFwo0stlH
	km884La7+6dxbdr1XnokU80Iu8HplEvZWTFM8LREmlrGH0CWysiDzh6XT8KaAJHN1iyUNp+EBj3
	N1hd2xyLG7V2un15pmRf/kveF02dLWgL8DZBA8ZDQtG93ShdeLASXoEPOpso7iPATs2WnDtL6+P
	Z3pstJBIyvPgXlX9/JiDEEreTyVI3WMu6wZcazd2uo/WMRuNJ93CM8cMWyWfxl9rJmBf2JZZpl1
	gGbIHCx6niWDzAmg/YgA5XwY0Xm9HFEZEwLJzFCirJ0EcStl0dqN5cdGKwyx6bLx3v6azs1CNHM
	dSTEYmNw==
X-Received: by 2002:a05:7022:6884:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-12ab291304amr10304082c88.26.1774967015760;
        Tue, 31 Mar 2026 07:23:35 -0700 (PDT)
X-Received: by 2002:a05:7022:6884:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-12ab291304amr10304043c88.26.1774967015009;
        Tue, 31 Mar 2026 07:23:35 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b399bsm9941111eec.17.2026.03.31.07.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 07:23:34 -0700 (PDT)
Message-ID: <b1194bdb-75fa-4f2e-b4a3-9565b11bb3e9@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 07:23:33 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
 <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
 <20260331-fanatic-elegant-wallaby-913e35@quoll>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260331-fanatic-elegant-wallaby-913e35@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X4p1LAZ40UBkCS3bS8X4R191lq1imEh8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzOSBTYWx0ZWRfX3oWAfmz39cHw
 lImfI0F1GMAuyGOOps/qszoovLFGP+M+uw0Yv+KDuHyaY3z8RlkBKluYHnFD5GcD3J36AEtHLeZ
 8q04ZmJyNtDChfJMrFB1GLQAfJ7yWVRLDnoKsi2e91t9vkm19udUswYywleLgJWB/XXukRyWQw7
 u0ZMutlWqFNEZE5Nm4/fgRUKgDPUesyBU8VqvIOmV0+T7fZY1oJ+kkgR4hmWkbUrAkgOO28p3CN
 eG7hIRI6o1Fyj7+Gm3b3oEmg1JVcEgQByJDDHC3HgDYsikoklviFWa61yxxlq3siWqzQj0+A3xl
 t2X5hpAn5FppqRHy6R7TzdlU8PQSNHbXd6K5DHmx4NTJih/r4K/FgpFugUpnq0a6K1QHdNnOKtH
 zqWwjk0nP1dxOeezubdJx2yQC1QIqi/C2zXX9v0bqfrioiDoZuLWOjPnn8Qb2/7BjGXNO7IzglW
 weNRLCLVCZyhSKrRzkg==
X-Proofpoint-ORIG-GUID: X4p1LAZ40UBkCS3bS8X4R191lq1imEh8
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cbd8e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=fnTOxYT96DSTlMw0mmMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310139

On 3/31/2026 12:24 AM, Krzysztof Kozlowski wrote:
> On Tue, Mar 31, 2026 at 02:09:06AM +0530, Raj Kumar Bhagat wrote:
>>  $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
>> @@ -17,6 +17,7 @@ properties:
>>    compatible:
>>      enum:
>>        - qcom,ipq5332-wifi
>> +      - qcom,ipq5424-wifi
> 
> No, use previous patch.
> 
> I am annoyed that you keep making changes even for such trivialities and
> require re-review from the community.  Previous patch was correct. This
> one doing whatever you want to do in copyrights is too much. You don't
> change copyrights just because you wrote one device model.

Krzysztof,

FYI here is the guidance I received from Qualcomm legal (links to internal
documentation, removed -- I've forwarded the entire e-mail to your Qualcomm
mailbox):

... Repos under copyleft license [...] QTI copyright must be added when we
make significant changes.

... Repos under friendly license (BSD, Apache, MIT, ...) [...] QTI copyright
must be added for any changes, not just significant ones.

... under the regular QUIC to QTI open-source copyright transitioning [...]
all QUIC Copyright instances should be replaced with year-less QTI OSS Copyright.

I'll follow up with them on this case where there is a dual-license file.

/jeff
