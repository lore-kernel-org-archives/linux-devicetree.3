Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998812BE056
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757597; cv=none; b=pMaAHwgMrkgyoBJGoqQrd8poptWH3hZTPFz3T2iBWYpo7qszduzza3d8XBM4EsiTZ2Ds+WnzwU1IqCWSrBH/DiWCkaZOEelarZ25Qt9/zK4BQUgzUfClL/hse34VFhljoT+fEAwIsxWOPYeVpa5n0ZYcUjNyTR19lYu7WEAD72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757597; c=relaxed/simple;
	bh=UwTKJqIuXUGJa437O6+rI9hIW9lYlI4aKyAu0vnxf9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoRhpyNhy4Zq39wCCZXdhI/29nWrMLv6E8DiSH+Ep5Ntd1Zg6rENU55nPga6Os3Y1/X36zxFx8jWg3kz+NkyO0CntSVl9Ob+CmsUCXt0tqfvGTpN46BheDdW8c7LRKLJ1wRpqSVRKIM/GqcSvxNEzb7RCwb4tNTpR/kwQoKVgiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n87eBuju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aafETJFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n87eBuju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aafETJFR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Cxmfc1729917
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 17:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=; b=n87eBujujRU2JwR2
	1pIelmYVDonQlfkw1Ws6dc4xep0H4alt1HdgclQIbVe1kNshz3Mbxy9r1rCtpd7n
	270B2TpPizMz5WZrGshTol3uEPouMsr2EVMWKIQcV39W3gwd7htEqQ86mNz2RAZX
	spm/5h8Tm01ZlxJWVyum5ZYr11TyXoECE8JHyUiUtzYxwSKJO/2+2ViGPf/77ltE
	4h7fP5h+84Ceq//LImlzmiTWpBMNjbobR9fiMmtcC2KgFjxl541KcU7Rc8or+fPI
	WsdMe4HKdhh1GhRqTDqCi9Q1Um13VjOezbTpf2d1qG+6NYO2U+9VigmuGLcsxVUU
	vKMhhQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxh4jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 17:59:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1568607eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775757595; x=1776362395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=;
        b=aafETJFR0zcxuymhyNvgLc9LHglpSRw7COw7j28oVURMu7bkyjXKKOAj07UKnQXSqD
         t7LgI6o67PhZaj7Wf5GgPwphq0UMZEGkByM9ajkjq9vnWryCwti33i+xW4/haBzwIGcq
         TNpvPgisw+xQXZ5gX/ibzH++/J12i4aQ+9DjuxD/0DchevwElLlC0+BgC2LIPaMQcmwi
         fW0nAfOD+kzVuY2ILFiBzjrFh4swSBwoIHDZuSX3SZrskTEe7qE1FllJZM+v1ptMSO16
         PCRbJUanR6EhXsj2Pkr12hFfZIhOzPoAEuHJcPQ/QoiskabZzZOpQrKpFskyNvW12gwz
         I9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775757595; x=1776362395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjEY8hTmGJ3/wMx6dnV1mYL6lmUJ+FGqfFbqbgSdHUQ=;
        b=ZQbm/dY9EJPO2KCakTqdZzciQ71kkpiCV1qK0SlrmEkpPXqFCQnnEdxRCNwbdvZ0Vc
         Q/x9Su4qLzxCIWId/ncHt97IpA6Ws6nWVcFR8omi2G/bt4TAS8S28EYfFwnlw0todEwY
         vQR442r7na8wG3URQ19OwBaK7nL0ieJSjwNyvtkJxJlIC48/CRlPi6Bu/kruSBA9UkVC
         4ZvCi4t0mQhljoSiB73VIAYC1iuOp0Rs9zkXDrZlYMJzGXJizJPvbOHZ1pVEI9TiIhPH
         JaU5CrhDaXEjT5D/anf3BRC1QK45BaNq64BXNRt9R4coo6CBXf2+UNIr2L5ndJXByp/z
         lTnw==
X-Forwarded-Encrypted: i=1; AJvYcCUyrS6QMtA61BPGPuEJRwA2NPtQ7ozBTmzfXgZXshs/iHqy32Uy0FA126o4z/N4PHiVi8YnUQR1Xckq@vger.kernel.org
X-Gm-Message-State: AOJu0YycqWW1GEkSEcj5fa1+x3MNHL3BBZKgJ4gR/wAxqXp42r0PEBPN
	6Kpxi0j8kZ489Yue4yZgy0JnV2YrlcXlLaOM4Fx858DsmCtolEGWhzz8L9dnN0HS4wBl+VunpyC
	nWoZFWiK37vGSnhpT0Sa3z8+tWspGusk8KmkYia7sJqTKm4pHg2Ljt7cLn79P5EoI
X-Gm-Gg: AeBDietaXwlsxOHXPSe3UauVyt/afeWIYtOTELc4kvSdI2uuhZqIGuWTfGsveXelYHG
	5M6gznVJ2KhEKb7OcspOHgVad/LVqd9N77yl2iAUj31FtQviiGYN713jg2+WBQRpkEX0cNmcyLN
	y13hcF2M3F3z0QR0DyMeyVbHLMc5U79JXRs4SOX1nanznsYquwSZ6Peq+xphMSchxHFoHxQFiE5
	NPWBwlHL1nGptW+ybQGMyCyfeBmHTzqN5HwH5bcB2fJ85BGcfgZf7eWbANyVOnMd6vbHFdxS967
	Lk0lmolPhGR+4R6yCBgZd04MlWrq57gexjAh6gzuYoG2QDme/p9kq5PJx+HDBiLl2Q6hTIpd1uK
	O5Z4wc2G9IFQV4c4SGKQmvwBEJUiwAoljHx4ozk+uER42+IDS7d/Hhf0=
X-Received: by 2002:a05:7300:3246:b0:2cc:3684:d1 with SMTP id 5a478bee46e88-2d589cb5e3bmr26036eec.28.1775757595235;
        Thu, 09 Apr 2026 10:59:55 -0700 (PDT)
X-Received: by 2002:a05:7300:3246:b0:2cc:3684:d1 with SMTP id 5a478bee46e88-2d589cb5e3bmr26018eec.28.1775757594609;
        Thu, 09 Apr 2026 10:59:54 -0700 (PDT)
Received: from [192.168.86.243] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm779899eec.15.2026.04.09.10.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:59:54 -0700 (PDT)
Message-ID: <78cc27ee-ff1c-4c98-93a6-d108bc6f3b2c@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:59:52 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi SoC
To: Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
 <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Gn1HAqpgnDOIRr59_ccP75uEWQroOrky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NSBTYWx0ZWRfX572xNwpQIGwC
 owlc5xPNPlLSfAG6+XndWJF9JEkAR5bMDd0ZsrdQAQgdF5xsL4aDBDd+4V5WF9OxWqm7W0h1QpC
 Bt+3eyP96/vD0HmTQXKesFo/0T1HUb0u77qKi6n0M7Bsrl/B9SK3OAVk7wx1ZsF06erYnIS4BUD
 4fSCwJNgDmu2Ac4ER0rMxEOlHL5HXZUEcb7TAOtgyMmvZo6KG3TLNujEhQ6a26vRv83sKmf2x5A
 HR/IqomXf6QUAm80TzJkq6Xd5Y8kKW3Lm1zhnzlQfb0YjCdbJ3uXfNXcYuZkTWnZqN1VpjQYB0J
 mO5/u0Ceep7vdB5wDudwQXb2xTMqoowveUHT1O0O5THREuqYgQNtQ9sv9qq7/38/ubElMvs95rv
 7QhTXpSeRt+wPFaTJzNczExN2XGN61lgk9TeD/jR9h5ZJ+x7dOLdvSUzqjjSKFElnf1LeDwbHT/
 nrkaRqV4n7rqUmFR+PA==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d7e91b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NgZ62R0EuECE8gCXEp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Gn1HAqpgnDOIRr59_ccP75uEWQroOrky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090165

On 4/9/2026 1:53 AM, Linus Walleij wrote:
> On Wed, Apr 8, 2026 at 4:16 PM Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> 
>> Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
>> Qualcomm Hawi SoC.
> 
> All was reviewed quickly so patches applied for kernel v7.1,
> because why not.

Thank you Linus. 

---Trilok Soni
