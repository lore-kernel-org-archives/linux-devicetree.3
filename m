Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E39D3314C5
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291138; cv=none; b=O1D5D52X3xeulxFhtnaQnuS00ytyVej4vWvuUTJAg4vu9pQMRZnJ9qZPYASm9QcNRprU6T4QnX33ac/+Ha2wfz2e3DL06atESccjaCM8NVm85p1ey7z2ioAJ42VDdVu0akSKUsudnLzbex3s2w1bnvxsdhzz5z0XtWQFBjZcbJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291138; c=relaxed/simple;
	bh=p7AWCj1C8bqHYIdpczNIePK8me3XA5oaofDf2GD+x9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bS51DcbH5p1qOaxhbnmSOnR+b80KZJ1myjd35AL8cgkfI+Dr7wvwSE+oruWAF696zw6SANYInMeH5Tx2BE5l0PSz6Xjh9mL/GrmUAOPKVPQxHts4+6JuecuO4yihq8ADH69omhRRVm6PLEK0qdkRm0gMFRQZxj3lhkqSn56QLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFrqPalp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRCM/QLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFrqPalp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRCM/QLb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VNSii33250706
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 05:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlSMMMtaXrLtkNd5wTU6dZS175RnMVkwyaFlPWPKcGs=; b=iFrqPalpV6+rP36x
	ip9iqidrG3pmJD0GKvW+pZ5W0fkc2gxG5r7JwZEvs5sVwm/iGDCuPDLbVJcLAn52
	8KqtCuOXpTat1FIilnO+one/3RAapdJxmWN6KyrAjdfZCQM9ARR0f0JOfiikPe6G
	pb16IcDQKtXAi0fnunbnfSvGEM2wGQzDG0+t41jje1Pln0QYmjmX259GB6Vz/M4j
	roGHQ89W7/3slFKPXsfQ8yIBq2FvgUKQTmyq7Pu3O/nWO4InZdCiJuQTH7OUKGWX
	TlHpxu9zeOTp4ErQ9bhKp86os32UEPecA7N7rea7ednAGopLwHsCTXm/O44oqO4F
	qJ4ZTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98dpdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:18:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32259e0eso26886685ad.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 22:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780291134; x=1780895934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlSMMMtaXrLtkNd5wTU6dZS175RnMVkwyaFlPWPKcGs=;
        b=NRCM/QLbaTAZE5s1HIljovU64z8ASTWZVJwhYnP7zagxv2OEo9KefpiFVJWemH7XuG
         0cSRZemKcoHBWIJEbrX/usdD9drhBHE7S6bAOHEgJzYdGevdOCjFm77eo0Eork+sCjtF
         tnrKL2Ac3pxbbGO27JWMoEOH+6kOKPVLTMNPzZOoi32VOsmmaa+hkq02Tb/EYVXsrW0R
         IwYENJBqcduoVGZo5OdCsn9SEX5R1ydlTkRHMIrLu6HAIC0UXYGForMHTz7qIUr4KP1B
         c9uLM7Wz/zS6DGkxjY4QRoakHNEAvr6mCp9OHmw0gJRA5DltfFIkNzBQd+DMm6owXA3M
         /DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780291134; x=1780895934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlSMMMtaXrLtkNd5wTU6dZS175RnMVkwyaFlPWPKcGs=;
        b=rzhbXRVIMxYLdnJVrBmXXhgNd1IbHpbeHHy/HavutZQpbyewMCEFFzZ5vW6BDHsLxI
         REpNXUDIbBBkbjGkKKZW9hrigjDCZXjnLfj6cG/C+rS0MQlQovRGL6FereO8YQcQ3Vtn
         1JWctYBqBhT9n8uUv5Et6SZk4/JbhzgkKLk1jkfForBtzuaDHRNr1Gsb9iyxaCZGjq2D
         zey+yxSTMQ7h97ZZGdn86kKl4G2Ro4oe7cq3Tl+1mtBUmKzxinCc85JP9T5nlFD4mGVZ
         58fOQkQrgFzncWFhKS0Adn5LJjQ7jka40ID+yH6M7GwcjBEZplcBm1rPmweULAtabU+4
         e1mQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SfY+WLHfFyfDnxQrCIwzmAQpMbWd6r+e04re8l06+Yf9rwxYrsMp69306f2sjL3OuYAjSvvNc2deA@vger.kernel.org
X-Gm-Message-State: AOJu0YyFW0ah/R1Svf23Iyvy7tzpyAc1dac7CQT14Hvw2P5NI3ZMZ9yn
	OkAzprXC18Hk5LYJVcwSibx+H9ubQzuCB8pTpBl7Un94YDqudoTInR9ipN+XeC2jz72gXUBLRTy
	nuY768Wl1UP/DC0+woeQvc6RvLS0EATa9GOK4JtuQ/TrHfjIu0IRHRiN+xt1gkhsp
X-Gm-Gg: Acq92OGc+FetPaom2DO5sTRoqgXA/j8cJwemOukrSgnhLxmdfykz4aRpanLBS9t9r9q
	b9J7Tskdwctsd1sEmXtKpwAsSQ3Q/xoJOabsCrCOiEkkNVOe6X5k8luQxDSAddQruNLWgQXToWl
	Aay8gBrPQTUEM85LYCezR77rR59lhXxrFWfNxAtRm09KirJEw61058x1hw4udtnR/2tXYZcY/Zj
	rewB9UrKTdmsAMJZZ99AvqDQL44dF/gVhoAov5as1uwAogTua3Nz4Q86Qg08KZ5hs8Ku6NFfzfY
	J3tMiPyrLAIk7XQa0Tkx73ulOApnQtrOGfnVPA2GrgEPKmuObz1QCVwX7VDIfnUGEs6VtzbjKky
	IcoVsiiFCJaok/iFmKe4u+D/k2X9aBV6oHzdMY8nbHyjw3tETmGuuw0Cgyddhzk+Kk2wE0rYfhz
	U4RQHnCOZkxdwc0tg/6fX0cCDV
X-Received: by 2002:a17:903:1905:b0:2bf:2188:a916 with SMTP id d9443c01a7336-2bf367a87e1mr110120625ad.10.1780291134310;
        Sun, 31 May 2026 22:18:54 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2bf:2188:a916 with SMTP id d9443c01a7336-2bf367a87e1mr110120185ad.10.1780291133907;
        Sun, 31 May 2026 22:18:53 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011ecsm93533405ad.39.2026.05.31.22.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:18:53 -0700 (PDT)
Message-ID: <0334b4ce-e696-422f-9aaf-42a7b58706bd@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:18:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] pinctrl: qcom: spmi-gpio: Add bidirectional
 level-shifter function support
To: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d163f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9AdMxfjQAAAA:20 a=EUspDBNiAAAA:8 a=yr1fWzbWVowEr98sf50A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 3DbGGDsC9KtZgeSHxsUSGS04dmC7OEEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1MSBTYWx0ZWRfX9GU4FLU4Oyfq
 Clsw6e94o8p1yT7MjqyWkBlLSodLiGQd0CGN7B2KSQYpANJToil6KEu6F5PE2UdTYAoL6VqJ3bo
 7Wu5H8pkTprqt77M63b7bBoNwJwVQjQDbNBtlE96cyKMjMZhr4Nj+4oLx5JqHuKHui6zqcPctX7
 tlKv0nTkxNcQpJsRiPcH0UzXM1TG6RAaiVah4iADgr8c3m7OyAo8UyVqW6m84/MWjDVvWemBEjC
 mr8PeQD+sUsCeDEmdSB8OhRuUW5uj4wLsJxa6eQqbMmTqiR+EW7OvRw1CAd/8QZ4F2yaWOS3IBx
 mI/8tpe8w8NTDA0paShQpZzsibvEFeah20Szv8oR/oB3bMzzgPX9GbsUjYKj2E20HwEx87LL7fM
 YcDHKDSOojTHF0FVG1PlB0DewQuLUeXaH0vFSU6liy8KloRm9bR0wKyJhE/ZkJtYW1EYLtikkP+
 R+l3H8A6b+q0X4w7iSg==
X-Proofpoint-ORIG-GUID: 3DbGGDsC9KtZgeSHxsUSGS04dmC7OEEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010051


On 5/30/2026 4:25 AM, Linus Walleij wrote:
> On Fri, May 29, 2026 at 3:05 AM Fenglin Wu <fenglin.wu@oss.qualcomm.com> wrote:
>
>> The PMH0101 PMIC introduces BIDIR_LVL_SHIFTER modules that provide
>> bidirectional voltage translation between 1.2 V and 1.8 V power
>> domains, targeting open-drain signal buses such as I2C. Each level
>> shifter shares its two physical pins with a corresponding pair of GPIO
>> modules, and its enable state is centrally managed by AOP firmware as
>> a shared RPMh "XOB" resource.
> (...)
>
> This cover letter has a *very* long text mass, something Andy
> Shevchenko strikingly dubbed "Dostoyevsky commitlogs".
>
> It adds completely obvious descriptions of what every
> patch does breaking the rule of "don't comment the obvious".
>
> This is usually a sign of LLM AI-assisted commit message.
> It also contains emdashes and other obvious signs of AI.
>
> In that case, please use the Assisted-by tag, because the
> LLM can then read this comment of mine and learn from it.
> https://github.com/torvalds/linux/blob/master/Documentation/process/coding-assistants.rst
>
> Yours,
> Linus Walleij

Thanks. I did use claude-4-6-sonnet for assistance. I will add following 
tag in all of the patches:

"Assisted-by: Claude:claude-4-6-sonnet"

