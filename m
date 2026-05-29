Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF61714AA
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066764; cv=none; b=fnbh2u7uSZOnUdzkXyCO+NtV1KXPVyIfd5D+qYPtBT03JfTHYOY21Plo1ykjkhR7MrN6WNcxbPqPovHc+G8WlxuT0YehbggjVyyMyEgAGB10nVdAsQgkejTq03+ouh9klKTB+WPN8taOzqS/5FQApyIkNWmnApP4rmUJIAWUPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066764; c=relaxed/simple;
	bh=LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UT3Mb9znTnc991OGbIT9d6cQH0fQju+021QEiz4Pyx3QWom3ItLkA16wXJLmTtgKmrJvQj6K08jfTKVnCDRSt/uKoIzvCidcFfwTVUJ7v+8esP3Kt+4cF7NrKgCmAiIWGUNyOHk6mR7FWBtHEJkaP4KU9XInrO3cdvxBh+YW2RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBBCHTOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3UIN9uB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBBCHTOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3UIN9uB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKn5h1202007
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=; b=dBBCHTOc6KyVWWkn
	Qj73bATiXfDeniSqg95Okj48ji+dNUn4uI6iIygFvVXmB2rmX6ID6yhBgFhwhDIZ
	BB4zmtjKkPzD7tuhu8nep37zBrVjRkor9dBsaJUTw2YrMoYyLzcyR7avOBwDOxud
	TzeCFMG+a9u4LQc7DjwqiLsDWOuriazD/o3+GrJTlLe1KdKuxpSevvyhzvKi1pCs
	5D/6o6DnWJniKjvcQVl0WafeprQi16HFXOoXEohh1coAIXsLPXQuPPZQj5jnFX6M
	X7uOKnMN2WKpowL8rr3XHF/W0QQvC6I8pI5nTeg+r8gV9+e3AsZXVgL8ocQJZxbl
	lI9xlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te2gcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:59:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so869901a91.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066763; x=1780671563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=;
        b=R3UIN9uB4hwo8K8ZQRscwg9W9rI4TtoAw/w2ewILD5x+6IkvqKrAGSrsG21Zb2LxKZ
         VKGXkLS1Ru4cqV/zt63MEUF49ozBB3JGD8Z8A7LULwmT/nEOumzboN9qVo+z9V1eqUVT
         sW6neFr7/QHPow1mZ272ZtA9MD1VEzG2uHsjgv3hRIzUvS9/lYTfK5D4Zyt/9NKySEQe
         8nAa3Eqf/lfO5x/SN35MwsLag502oqNOIW5u2FaAb7xG+ijS6JPbcAq0M5h/Dxe9T2hl
         YTKEvfxLaX/PQSvDipcfiChqOyT9N9D8NKjYNOEQllI/vHA+3Sw335wLNhwJX+jAdiUP
         5qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066763; x=1780671563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=;
        b=qq2EYUfviI3PBl6VVmq9+5cGGWIKQY/eM0q7m4VK2y6vzpqruDQSb6s8rJFWf23UdC
         wkjC8zCbR+qFFWaQN3eqKoqiWxZgZuRWV2QdOoHc6OfW/VwDTC0s6N3S6r7tMydMAzVD
         Hu2kAPaNTFJPvXHol10mqyXboDTAAb/iPa6e1zHFu0po4iAGUE21zeKfYDeCAqyWBGYJ
         K3Hd/n2bfeH3xkocEhVjdSKgqxq9cnVRhoPtO6Ta+rB8m0eceXf7Tli9no/g96zqLaT/
         IuDR3Aypd8R8cc8B2fQDREWmN6dYRdivXAfxDY7+Eqd/OCHJ4jJNuuEkUq1SFdC5vzh2
         Aiig==
X-Forwarded-Encrypted: i=1; AFNElJ8esWmv/3OaHzkLwTWaAlSlhBquaSkdVgSsYWlNDVeoBBIHlG6m1q9sx+wwExrIRwDhLzC84bbLv72o@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8tFPe0NcBWeA0NbmJXCX362AC1T5KBE82aPQdPZ5qO+xqCnxo
	orY4aOp6WPmI+iXtFk4lKxz+FQuId1jIp7Q6dZFyMWD/GsQ8gRWcRe1HJwZiNmgSCoKv2jkd/6/
	vqgkNoelMKWd4coJVmZOcMFxcFHKukzHoHa8TLPJUaPretqE3QtS5x1pYj4Kn0/hP
X-Gm-Gg: Acq92OHOFTqjccE0yT4wMvuHqG/VEXRhOG3vkQUQC8QSSy0hoRVZ78wur4PYtYLmhvB
	5LJuxrqQET+cGn8vZ/49/Ca9AHtR+Fyyi0q7AnPlquBMr+U03PVlYTrbGzmWat9WCRzW3QuPCmQ
	SvXNFHVXPPuUFPbWA0AKELa/vATshIep5SzBS500vmke+YayRiOWPCNL5gEV1xKUMQnuWsXhvRH
	8ZWj/VbBNEMLPFdKMtH7x4xNJj2A3lrPCbtIBruEBYVdjxOYuzqmX4eoyjVu1omt+LAe2un1Ul7
	2ZEfwSDzPNs9vgJfDnUKaqTbKZ3//ZTVnNgtTvgXOqZ+87G5KC8lIc9XO9lToFuwEQN+UEhD8EJ
	+VvZ4LNcBnF9SWRaXtF15tYhVXMqTSal6v91UjKxT4I5HqywrqCJ7bycgGH+fb8kK1w==
X-Received: by 2002:a05:6a21:b84:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b411deb1b1mr3867894637.29.1780066762723;
        Fri, 29 May 2026 07:59:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:b84:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b411deb1b1mr3867851637.29.1780066762292;
        Fri, 29 May 2026 07:59:22 -0700 (PDT)
Received: from [10.216.22.197] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c858108940bsm386644a12.5.2026.05.29.07.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:59:21 -0700 (PDT)
Message-ID: <df7cadcd-05f7-49e3-9758-369575126292@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:28:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Liu <xin.liu@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U11mNgZ3botpyhPl6kN9VUj5QXZPlcHr
X-Proofpoint-GUID: U11mNgZ3botpyhPl6kN9VUj5QXZPlcHr
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a19a9cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=cSNgkP9xN3AXbRQt_EoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfX6GZv4PiGMW1f
 fLcFSKdgdKNZ/i+H5aJBbO0Bsf9RUG3vzBNrmGuyaRnjKQDxomUgwGeymEPbPzdtX3a9NY10TiR
 xYh4BIY0HkldPNYnfCT/7S9JUTy6R7THf6EWC0/xWzHcNjGLa8d5KqUPFGmhxZYFtTUk7+gC+Ic
 krwm3QbDeeZnNI+OHd60hyFAQByslGXmSe/NkIGEQsQh7nrCpHomxuaxto2so8VA4/TbqHoZ1Qw
 nJKRFdTnHDjHjW63MohX4dAJxL2nobySfoUn6CNg0kDGnfJXu6MSJm0iDqEyenSq4C2rypyGD2l
 wS4hMeYcVQHSaeiglKPOUU8eKI72+2iQWvAq7DHO0D9csuqiNsczhEaJMaPn3PYKOC6beOEOK8Q
 i7ND2y0RQ0qpWVUCX2mgudaih2DdC1GfVJnKBINcer/llY9wkTyVPIBlalpwV6mI1gmHO/v1tAu
 GjLpwA4f8J8kGiBnKjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290149



On 5/29/2026 7:41 PM, Anurag Pateriya wrote:
> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> kaanapali based boards.

Please ignore this patch. I have sent v2 fixing the commit
subject line.

Thanks,
Anurag Pateriya
