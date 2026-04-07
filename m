Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5439B979
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557634; cv=none; b=fikf/n75y+GfGuOWZKkxnjpyLNDffzrk6QW4bq/i6q8Zj515gI0uxQz3Xtw27gyAABg9gFDMLOnPBNj5cUMhUYbca2jbqavvoVCkQq32Bf90q9UTHFQwH/4KdYognjS5hMUhr8CQpGoQfK5LVjSYq8QpXIBBg7SaTCPk3OLN5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557634; c=relaxed/simple;
	bh=C9jS0F/gOzlNdQxVxMT4uShJahv/zsqDh6pXRNRZRew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rzjme39L6C0RkmWpwm/706au8FYMgl7KHSS4HwbhvztVj3pLEAgss3/OiEbpl0heMbVvJWDxQJEVVCxOzntKfGDXl4PoPQoTVDP6G+nuaDs3hrjoN7WC3tsoVju8/f1gIJENI4eC04Ay5tCuunETn1nrn2mg0z4pe8b2MoQB64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA5fkyJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xfekwt8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA5fkyJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xfekwt8a"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376L9rN3537351
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=; b=IA5fkyJvl9h0hHVo
	DOIu8XsmmeEekiKnN8+PaChhtIMkjVJrVtWxeZrrpt7ZF/wp/ioF7ruzzSnj65k/
	M8uJQwIELhJ+mzfmC7kyjuUucyTFOIvz7w8bIP1vsHSNi3W/EZgoQ0q7VmrEr/mP
	8v0gBDrC75hq6F15CNUPuzCDqP+jPDSWX/hTNRSC72gSLyTzFkCBZ0FFaK8Ng9iU
	7JP3L5GShHhKmbw48Poz8ofFge/x66g2b8guwEFLgfcmrBcudBfFX8w9tK/bfMDD
	GsP9LsKvQNTt+qpa+BXcD2GdhvoFmxjiCkSoxXc6v/ssbJnaa8+umywahI20laEK
	3vxbWg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra29nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:27:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a18178713cso17038076d6.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557631; x=1776162431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=Xfekwt8a1/WtVoSxqscHnwGHaShjMhSX8D5BvTsTSJhEN9Sa9lWhFeBLYyRJJmGH4i
         mVyLbgm/nnpl17Pn/dhpec1o/yLz2QZHHqo3kVXPQuUSeF64NAF1aLROpAAcRrms6FyP
         MPcbmsKQ8RuUOaSVrApJsCz1YbgqBExTwNtFV0xRVBTGModShp1rtlHdT9ZXvDV4/LTp
         tg4kJKhKVjkSSstYGvcEEYJ7LPMnmGCh/r7MPpA5AVTQRM/N0pJXlxdFwbOroQI/iBoX
         VDajHDsH+qBqLxDIlJU1KZIwu8akAuXzvWZ2R0Z7ERe1JeeIrTr8o73PWOl5ZjA5ym2m
         M7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557631; x=1776162431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=I9jk6wrqnojU6L0BzpZ0x6YUd7w6AYyRIg7gAi67kD5kjP+aBasusHZwX5HSJ7A9UA
         AMtnjCtyGgwpmclSA1gyu+KUFrBwL+UUk5AAOe9fYwbUezzY8bPzi9raGdnXwbZZ/ZIX
         fd5U8WL+f470V7zz44X1aGoN/hvWpC2+igyJX1KExFpbwpufxaoHNmp6pakyO8tEwnNe
         WTgO75yoFXnld24AZwYJABHSfw8+0Jx7OkLaK1GFPkhPSKfYci2aA8BT4SHrWXbAHyUc
         EcT66NxiSq9rWhZWMbLBvWGHYrnNB81TNWHZV7Ol8CckXRn7pQleM/HXL/Qiq4yxDgjM
         7z5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/QcDt3nmBFa+05jdO0x693kC8Ujgx/3ePTOBqm9BolrQmD+ZUYU9sqoFOMn70vJJ0g5vcPY9X5LuS@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb8ktCvNQJLWOGM4SNVr+NNWtJ1yWjd17+TDw8vf+LFqMOnZ+
	v6W65eS19DO/w8RFOjEKsRYvzPeZ0bJ/A9bgnaPZ2Ax/weGpI0wSje86MCkMES+frp5FFV29mEq
	d01P9wwpQDIB5QerlBK9wosX3Pb1YLWEYYOh26spNHiEeZ43CaUgfQxHu+5R1WakEBcLfEiCp
X-Gm-Gg: AeBDietRh3hBHleTZCeKerZVTR4kJU4agyJwN350omapaFU0X6aJgY5/IAG+RPdY+n3
	IrxpXhbWohRjvrWytP72lqafkNJAKbLLboS9Z9VSID/Ac72bv4IsOsTHLMkGo5rDX8GeTcp3dry
	O/EN9z/XuDj76xhADPKC+2ivMG4KO7U/YVcxCoYXvTleXJ18RxN0rZEutaL5RUACDDWA7wLjwlc
	MeDbvBU5SYGT2yxprBI8iMROi09WoVLcZAam5iITjhxKthbKvHzgO7Hde9pQ890AvgFyqwg5sbT
	8JkrplDS7A1RiB04YOre7Ferfv2MG899V9IaDvBZE4XwsR+7lTf4UF9MOk+vw2TefBSzLRL50+g
	kY1/MC+nB+y3UF+AxExkUUW8VgXQU7AYvAf4QInIvmkmkCaPjQIPWz8H4Fq66uL4bxyDpBm1RH5
	9aJ9g=
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040766d6.0.1775557631055;
        Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040476d6.0.1775557630576;
        Tue, 07 Apr 2026 03:27:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm538210066b.40.2026.04.07.03.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:09 -0700 (PDT)
Message-ID: <42f82377-c30f-4cf3-a57d-9c85d9c54053@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gUpgS--UJkVD2jipWl330Ixv4eKJgCQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfXySBI0tX4JByx
 eH4bzbwrs73dpjb/sqaw7jsZ6wcfb4NZrwPKtEqLzOHYbArygDN47nEVY1SAQ3jQvhp/dDXazQi
 FX3QqR/R96kdAKleYB9EYkawgJME69lvY0pkIdDEQQH3ehlIlNyybi8xCuxMQh2LAAAvPk7Y9uR
 AEdlC34Q47325kZrnm/PwfenbGgelf7XLonPvQcIi0bXZJkkAkNmBMvTGLkQ6LK1969lBHqyWu7
 7u2deyDbddqYfqZ4PYoyV5MfSTFg+ihCKzvSlN8gdn7hxeydH4aiimGNbtqmYI1tb3fyK7ygwKw
 l7kxVnW/Dwkobc4pduV/sZua8bMd5HU9lmMAU0HzROVDvEhhkQD/U5K9hi5QxQ2GqaMQq9KN77e
 odePOPYppx+DkVUg6u6KXm9HaS0GHxHTumtXP3depS7POd/AYiIMeGy9pNXP8XEeqAI9M38ePjP
 BPlQFeaeU19oCWU2hLA==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4dc00 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8poMKPHdAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uSwIeAtNGuuqP4oK1qMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: gUpgS--UJkVD2jipWl330Ixv4eKJgCQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one orange and one green. Together,
> they both form a single notification source, so use a
> multicolor LED node to describe this arrangement.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
