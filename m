Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A241BA83
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411308; cv=none; b=qRCduDed6UYzDOiyDaudDWF0m4RjXdcACXfboWlpYDD8nyhkllXV0DrM3Tnz8wZF3PFoEdRhPaNh1tvu9m+80mGihYFy5p63VsZDD8PcR7W0j6Dj9FRvAebI/RHhdqygndMmacx9ZtuBaiSkBBQQx7b8+DSL6F8GDHCJQMaGNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411308; c=relaxed/simple;
	bh=5q46ffEKe/AL/tCJ5clvNOasJqMy2l3vKZtTmAh4GQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meL9k1eD6Zcx7o5cw2QY5vFJCRLmCB4tlagbKXUAJ2MJRdHTshRLQh1DefqQ7z+92O5FVzwoKTvZk8MwOUaRzvyqRNKa6nPVo4Dird82cPWE7rohVC1LUBfYifZyWsdMxdtP226PVH4cMtqRaounW/hsCko2sXgcMEK2eS9CjHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6fclxRi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQUtsX11; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6fclxRi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQUtsX11"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UB5b2F429057
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07/dZmQGLQpEoux0gZ8DuLcNzeKHmPfKLFyU53AM5uA=; b=F6fclxRi6NecK1lX
	D5bR/vLg6WzqjEO3ftynbg9l0r7oLrKFTxjVNcZV70JMymLnGcIBKhrwHG90drQz
	oKlA7jF+g+N3pFNJKQUCBSjUJKyZIwTy2HAd9BRkb5XoK2PBorZtw/qsI3CuKZcW
	1mbNpj1/0enrYEe5+jrqpC8nCHgzPGV/8s3cJLPFFnk8CLxhqk6TFp6AZLTVCWPc
	zAH8jlI7Id6mBTdJ3nqwK2a4ddivX+rGFHuqPHtxf8WtJrW+JrMp1F0Oz9/6tjR5
	yAOUWWojumWOv8j8NUgg8LiAk5dX7g+IlKJBQUJX6HoHmND/jQ8BiFsHvitESRj8
	pe+OOA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5efg3th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:35:06 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f582244e9eso51265117b3.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411305; x=1786016105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07/dZmQGLQpEoux0gZ8DuLcNzeKHmPfKLFyU53AM5uA=;
        b=AQUtsX11GIJci9w9zsYdSekoJ8kJzfnFa5kEwvb9WlmH4HJPM4dg6iEbmIDat9G3BY
         4beE9BrXWy9bOVISl/NlONekO+PvUTqjowsmKp3KFwPMvrltkXMTG+Xr/jJJCXRhzcxX
         WnnJG3x772WcvwZ8snDHGYOffnaXZVcxMGipqCtKEhic41GJ+VGHeQHPXDpyIa0v+Jqz
         me9QZngF/ZXi7zM5MRqA/4m3tqlVY+jT0A1LHECGDyem/8KkK1gCOjh3jqK7g3shtejN
         3tf7s5KB7hSrC/kZBhFNHiyvkzO7pO1jdBXf2EQ8yIZvvSkAG7H1PFnXQ0Dvv07Om5IX
         4XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411305; x=1786016105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07/dZmQGLQpEoux0gZ8DuLcNzeKHmPfKLFyU53AM5uA=;
        b=tH+k0Qf2NUUV9vMGaC7MZOhxsPMqYO+OXRK5RMicdsvncaHSr2p3iokUX0EJx4JHbP
         CBQY4Fen1GkimM5fh5fAHKHhKXxKu6wuLC7bBW+O8sKHnYRLQ4FeErlmqwklFACyeH0m
         GWvCfX4T19WBBFjacAs9sjUkpnfxUt+u009kAS4WvwNOpBA46eMjklVNM7EUbxnmExQF
         YJskJIbMEwlj9KXZpCtkWl0CSw9V6fk6tHzx8KwkvxPfZ0Ymud50irhnvO0J7WzD2Rol
         JEnE10TZJj9HIPB2R5gLRBLqSg7WeYMD6GcmFRQm/+guB+cEhwzvvdXE8OhwWl2Pu02v
         Ocxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrp0x19gFIplHCm7SZaoEAkgHwxlb1J3EIogypeRa4RVTp1uMiK4fztElDDem1izaftaaOnsSorwbvo@vger.kernel.org
X-Gm-Message-State: AOJu0YzpW3LFh9guoJGDtTT2enupVZAp6ouHm+bQEkFPctYnRp3sFQ5p
	erx8h9PF3LkF1CETVeWyhi6mRIhS9eKCB0BKmlo3CWE00ZIHkgB4mCIbDNN4eGDmRIl8m6ixTrf
	fU6w3T39OA6sSgVXO7MJyhPuX54qOnCK8mJfyJuTP7CiBmAhX5ebN0zkCXiXXokYV
X-Gm-Gg: AR+sD13EN1mq6jQSe+hWqFKKAbXSlc04wsg5Y4Z9bh7G2YMnKtEhJbaHXMUzdwPddyW
	FO5B+yAA8kFkCGjhp901ryfJO1SnuDpo3ZPf5BRxdTKgXnpTZPLCsEKGVPxM6z1NPpFD8XokWvv
	hEUYBRcbtLAtU6ZGY8wNi7ppfPp24lJDr4U7aGJg9dCwzBu5KwJ4cz3bUY7UlN28aquljtu1MuB
	OR+2AuHY7VWXsfEL/+1pxC9qODtFgVZr3X/imYQ2nQz8N6pZyAVJvb5MEqBdzUW+0d+mJh4V5bQ
	ZjC2TUuUCcHNkDsS88HV7qO3SvQouQ+FFov6H7E9RizMNuBqvhhyrgBRnWwZK5o61Q2C85EE7SI
	pVBHhk73isutJGIaRUjrRDABwaLWmzrUyLBkvQfSXB9lEeRVXtIb694zU20oYvyNa
X-Received: by 2002:a05:690c:c02:b0:81e:4e5d:4848 with SMTP id 00721157ae682-81fb89076a2mr13889987b3.17.1785411305449;
        Thu, 30 Jul 2026 04:35:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c02:b0:81e:4e5d:4848 with SMTP id 00721157ae682-81fb89076a2mr13889687b3.17.1785411304937;
        Thu, 30 Jul 2026 04:35:04 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8926becsm8201587b3.20.2026.07.30.04.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:35:04 -0700 (PDT)
Message-ID: <63b4c911-d1a4-42b0-a66f-b0c84308d5dc@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:35:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
 <20260723-radiant-scorpion-of-hurricane-cbed57@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260723-radiant-scorpion-of-hurricane-cbed57@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XBPPgV8sCG38Cn3jki8DPfiZTnKRB6Bg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfX8Wr52PV+C2o+
 i8yGGr3kkYcWQp7iEfvHDMaDKufYJQ2F+nin2dOMBcC3ss8Nuql04fs90fMAE4UxSefO3wM8OQb
 56wfxP6oe7azrbwViKB6cVri705MlqA=
X-Proofpoint-GUID: XBPPgV8sCG38Cn3jki8DPfiZTnKRB6Bg
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a6b36ea cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NFBEJmUEwPxnxbdnG5UA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfXzMbxlVAwKkR8
 GfWwdhcCTRhVBkqxy483tE4GhZnNb6pz5yVSfQcOAXrEWBb40qwCfwDLBQdSTueGnBWAwJmSXGV
 6P66l8H2UDn/mQxMVubnE/ncNlTF+QsJOB2b3fU2xyE3GpUqqWENXS2lnKO73nvS8tF7BtiadO1
 4NSIUaUHGYXbI/zl8bHZPiVe+BAk5iIP4D91oWZM5jlnAJUmthucKju0wSesnN2ezHAbkdQjxae
 9gN7zS9HcWK9HS6c1pPY1Bi6o5Pzxs/PaOlZLsq0xErvyd0wfPXJ9dQVIO/onv7y38DEQ7jrT/K
 GhP0QWiWEHbLt4QmL+oTkKlZDc4Mq9uSvE5kPIGutxgU/d43yDAcrgBOfSEzv0eWLikh5Ga2IC6
 89Fy2oM0un67+C9ABpqW4yoX1scUqE4mFKiR2ryUPORhtLRmD9hVxVBHG584KNHk5arWF7+nGlt
 gGZc6OWMfwrgiko62hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300086


Hi Krzystof,


On 7/23/26 10:11, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 12:00:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,pm7250b-bcl
>> +      - qcom,pm8350c-bcl
>> +      - qcom,pm8550-bcl
>> +      - qcom,pmh0101-bcl
>> +      - qcom,pmih0108-bcl
>> +      - qcom,smb2360-bcl
>> +      - qcom,smb2370-bcl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: max-min
>> +      - const: critical
>> +
> 
> Binding looks in general ok, but feels incomplete. If this is battery
> limiting hardware, does it actually need any battery data through
> monitored-battery property?

I'm not sure it is relevant here. The BCL is not a power supply neither 
a charger. It monitors a power supply output which can be a battery or 
another source of power AFAIU.

The monitored-battery property is used by chargers or fuel gauges if I 
refer to the documentation.

The BCL monitors the output of the power supply while the chargers 
monitors the input for the battery.

Manaf, does it sound correct ?
