Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAF43637C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770245; cv=none; b=q9cOCkE+0NoRlZ62AsAndRttWeTbIkRUAaTKO+tIaIcT7WLJjjD5SuO2K+HsaItDlyQyZ9e4nwEFLR9zpUK/IE7ACI7KcAPlQp6eVsFCH+6G9dhBL38URtv/voY2oNi6TyJqwvvYcrUbd063sZZXAtPrwWT9w0rITD3v0K6erKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770245; c=relaxed/simple;
	bh=ISGTU9phKiGuZJOMB/lKhUY8x73F7vPwxlZHgCas4m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zqb6l9RyNuK4Lpv0FFY+r4p2p2c3WW9doX6+UuowPfWmTnrD+PHConMzUfOcPeZq53wgrccIrbg664qPsGjJ1SBjQVcIbHdf+JTVt9O9E6FhKa3+9Ch1VIRN356XRCA/KyFuEZ1ozcG6pQlOmenaATdj74Z2yanQ1jzCcZMZX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmhrzLCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfCQDeqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmhrzLCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfCQDeqC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777PFl3352565
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=; b=XmhrzLCBm9dqDXKW
	bZCoDPLIg+3mRZgI+NcNjORKSX4Itt0+y0mkkYmUMPEm0V2cwgz8Wcf9/gNtkvgm
	uvgzcc9wawYcxPhQC6YCXR+KvLZp2+BYHddbiyQQyEvBce5BoYIb3rcxrkwj2l5c
	iCuqF13GA5PaggeK5XN4B6ML0Ly2Q8b2Mb37cHzxQ7CQILg85L5Tes54fICblQNb
	zQ7hf1DkdQhhknj9SMR6nwHvcOJHt1fkdxDBockLhveAyc+e2xD+ryiQp4rVtDCD
	DxBQ97zdUjwpJuHz6SfxGSacgQYL8skH7nNCv+uGotnn5sgpiX6stW0/I7Z4FiAq
	uP2XKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gutb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:37:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so46254385a.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770242; x=1789375042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=;
        b=UfCQDeqCqv/v2ujUaN51p+RLl2nG6Dczh+PoQ1Wxwovnc3kmFalFzDtTcYA3hK9xCJ
         hUC+QVFAji3SPE/0+Sxg1iEArmh/O5U4AZraqy66c+/BE5OzsMeBEmhfkE0agBBkwlol
         uI4A0C7eY97hUpb843sLuN8izLyDVdJugnsIsMAjXL3qMhBEHJ26We0yPj86FFXOkjYE
         gWxX2VqT73swgXcOPRe00QDUb1t0EVferkCX3RYNr+kfwVVKxXATJMw5oaIL6QHsrHW/
         4dGF21KLSqJeI58we9L/vCWOQjUFNFZjj6N1xupoX744eI8vseofHNp8jat3cFwo9FGL
         1Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770242; x=1789375042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=;
        b=IqiUMH9v2v5MYH0pQOc9XXjEgLrqOZCm8CPUhE3VSbC3nYVyLIHjTbiVgp7FAb5Mbw
         XeyNLPeGHSGGlmB1h3WrB3oYI+E/rewh8qQTRiK2pOug3qBJBaKx3afMAW0/RIqeRdZk
         jDyaNmQk0SZd+CBHEm3bNkWYoW8xL51JRbmqq10dA+899ToVRk1Q7xfj89HXKRZdG//U
         x7t9nRbWbrMJv7N/Gu0Patz86SLdo+GgOiwwFNr01ir7QD1ino1wM/PmGqDvumsKn5VN
         ahIRPHVeKXhTPH6CTPRBnC80Ny75hLo7aVdO//q/0jQlEwsR7tFxHUjkYoyWlj/aNOvE
         +cMQ==
X-Gm-Message-State: AFuF++kr1l2gISRDVyy5v5zFw//yqlOkhycODLpt/hadBi6crwyR9qtw
	bDl6mU7laikBYBSuffr1MwMZOzbQcd6zAxATNagAP38UjiR/fG/bTaZerJlveH9bKuTLCKPpANy
	yc4L0bX0oaj0ffoMCslKoqUWeHOdl64MfDig02bMHK9X5YDjtba9LiqGF6kaccM85
X-Gm-Gg: AYBFou2S06bF9FJqHNj9QTm859pYWxMS9OBbgSJM3+CVxBvqek4EyUNEqQBrR2HKKM+
	xQ5znBjA+3A4/Prao1oln/PTMYqTxWqoBEoifTA2pVwWGf4TkWY6fO68XVQi+kOJ2dQlOdk1+VR
	XApFxMsehDdcfsIX7x4GEtVFuMGxzGN8ydICKIabGkB7oqBdzoAU8/IWs5NYH4rDyNAWV5W2n/K
	iKBkEp1kVmiShMT8hp5lrM5jaYHpAAV6UON3VDwtfYATHYztNtvvh6YJGbM6A9A3M6NHgkuo2pZ
	Lugp1pG9KHcHJ1P3R9OXGs2HLKbFH/4zsTVf8wDf7fTiLbYwuzXLg8XbehD/ZryTE3MK2PJbo8H
	7m5Ih2HFzvIVFpYINtkEzJQ==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1680141985a.1.1788770242029;
        Mon, 07 Sep 2026 01:37:22 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1680138685a.1.1788770241666;
        Mon, 07 Sep 2026 01:37:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1f6sm265914166b.50.2026.09.07.01.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:37:20 -0700 (PDT)
Message-ID: <1fd0036d-7dce-4826-8366-a695c624cbab@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:37:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Add modemsmem for Google phones
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e77c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pyxf__bKPmsAz4JLUVQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: c3Olrhd_osteLy_73HHOdy4JlcYsRmNG
X-Proofpoint-ORIG-GUID: c3Olrhd_osteLy_73HHOdy4JlcYsRmNG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX4BLatNS3cAxJ
 E0ar6lbFYnw4ZfN7cQ1dzRtZwBMo8AXC/Fm6rlc68eG1AKBAykZVleNVdubsQOLXZCnFSm5VdXm
 zTj/51VjsYN9C6+cExO3Bne9HNGp6oA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX1Ix8aFkBRkIh
 tqXHeOvxCBJfMrK+CwoxF79VmvxY5uqR7I+pJYhOmKCYWZ3lx0zPIshJWm88lp7nfwnJO8YLm1e
 1b2Ko9AU+0clGo0PZB+aGesOCs0fQmqvANIQKmgY27VVgXJvh4qNyesgi8IHEjcuuYXWeuaaLDd
 NzLw4Fu3o2kuliagK45nlgwu7xhQd3ns5bu4txZnTrNSQU1Kg97EOAMtZtM8tXbmYL6VIy5xxzv
 oMXyPTcVyBuBp7ssZJillvv1pM7K5B6JYJs+pUxNuE21PlJeLaWBD0rFUT/EQp8f1OkQWO2ntom
 KWUgRCSXf7UdbfgBSYGGZM2BhvZhwQKYCtlMjdMZNJnyh599vaDY3ngVL6umto/W9xDryw99b6o
 Vnke5sb8Vvt/DA174qD9866DBCU2Dt1WUfiYcAbBkTDHBUbJ3uKO95I+lwsXi2fsP3rpYTG+swi
 hOvO93HXXk+4F6t4MOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

On 9/6/26 2:41 AM, David Heidelberg via B4 Relay wrote:
> Q:
> Where do these types of drivers go? This driver is probably providing
> info to vendor code in the modem firmware, so it might not belong in
> drivers/soc/qcom/.
> 
> Maybe it should go in another directory, like drivers/misc or firmware?
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> David Heidelberg (2):
>       dt-bindings: soc: google: Add modemsmem

Would a list of machine compatibles be better suited here?

Konrad
