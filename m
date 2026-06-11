Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137C03DEAEC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176628; cv=none; b=oXl33kHuQO11rG4P3EVmRqwMzmDdFj412jxwTRulp3V8ISB3RcUDKhRbzQr1Ff2SufdQibJTwp7RN0v8OVK94Kdy6VyjYfd+STIWwd92pf3pIyxdmyvaYF3DSfcnohN8WPMA1Pci2QmSuR+p2WzRcNnOP5IQhqcmXI/GIRSD6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176628; c=relaxed/simple;
	bh=4Likmpkqm15YMxIxaBfIhwNTmly6yPNtLnW60jEKZOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xky5HUey18qJOv5xw+iQfyMFb649WrQ6F0eOrA2r2M9A22HLZrbkCtwy6fz9v1B9PUln3SuoQyx689ZQmvkJUUGPlx2zrT6HlVvaay9YDewbxalICo9ykBXpjA930ltjS6/XKntqD68xqIuHQ3Fvlo9+gteq5BeID77qe8seAZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flqtm16o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWY5jL7V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flqtm16o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWY5jL7V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1nNO271414
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeMld8SDJI/XqRhHtzoXqBrAAPg+rzif1zA7RDuIoWc=; b=flqtm16o+6YnEzPR
	0px0uUhhGyRpPFFBK7qMSAScbuspXXkBZVaYSsQf7rOYFO/DlMEPJnS3M9soS++5
	0DtXDOH8yCrkr2lgMed7PS8P7cdQCf/YNShtwF4qSJFCFQ42isEObd50rkt7ST4B
	eYwCBMv8Kw/z49c60HGJ6uuiXaOri1b0VFrYTr73QFAkfGKKxOKfvsHooem/xtrv
	9cpskSrKloSxu1PatPfYGpCPCl4FFslYbWReI9QZMTbEG5SNeWhNLaLpi0ox6gDf
	rLVm+K3OD5fMW3n+lejldUQR2amncZArKp52cFzZxtYK4FCkQyfl5die35bfNXJl
	Ulm/Ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71k721-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:17:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517bdeceb54so11518121cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176625; x=1781781425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SeMld8SDJI/XqRhHtzoXqBrAAPg+rzif1zA7RDuIoWc=;
        b=UWY5jL7VsiYrIDpw2gn8nyzFCYoEuoRLWDo4HFXulR4w/DLgef4Ju8+PfU0jLGYcKx
         ux3NWxbUPfBvM0Bkj5dRN9MUfAcCNd30bmZ5TWtnUat+9slgL4kZnWgttHIxjRa1ELIn
         QJgUqcPtv4iOqJc7LMAFOO9S1stGyvOlrYsmI5lIjP8EOobcBwqtaiZw3+ib0qZFnbno
         1M0jlLQmNEnGDUc9W/Foxm4fin8OEtsWINUtvC+Aa1+Al7VTovcSZT+2lpWVLu/hvmz5
         80D4flP1wtI+xrtrJmpjbwhfhiNmu3LhE68beniTzYef099cQFpaUDUQvXMMDcQnipyp
         XtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176625; x=1781781425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeMld8SDJI/XqRhHtzoXqBrAAPg+rzif1zA7RDuIoWc=;
        b=r6ufXmf+ZbfcEjV6KEy/wqYW2EBsct0e5xhDfIPc9oKVRJiArFNPkw4kvPMgw3YlAg
         xbTPCxPpTUNpr4AY4IgIK8ojy273DPlFqHGuZMlpMHvXet3PW6m74P59k5u6SCkD1Qa5
         QbjQLujhJ+lr/VLfGTu2pgcUda9n+E5dVI42UsL2azLZWcxpiaLgn+AtpO59SFPJLXrB
         MTfwQBXWHcqJIreph5q0A1ET4Ya8rHiAvBAiLoH7KJztDOtNVwo+hsdaMgGJW30SgbIN
         MvLfjMwBdnpkC6E1UG5akna/Ln279cBw1IZ+3EIp+/GA66w4QCLclJNODOgCj+fepzxV
         M5kA==
X-Forwarded-Encrypted: i=1; AFNElJ/RAm8kudJVZC4acuxhREca9N0D16jZSB89wE4S/p7B9gAIkrR62VpOzbhaYaWFjfl3zw369ul2wX4T@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTnu4P2LYwHc3FygPM6g/g7WDCwZ8pY/MHGtrAZ2AcbomjCh/
	NUoNCGxfbnXILThE0UHxkdG5ES3m1sp1ND8p93IuBOxBGnUzq28dhqNrsuLSxS9ZuoqmmShZnaQ
	39obj2D7q1Is9w3IDruRtAWhzAYlQIE5/wbXS1ublfCkk6h9EtvwAGufQt2Y6AOcI
X-Gm-Gg: Acq92OGHIVxTb2eDBo6cDs8GE7mF3TX/+qZzM4SnTylcHbxdali09uMGxkwkDzuzKC0
	z47xa3IwhwC/X2p9Z0xrkgUCjC4vw5MR20uv7qMfdllKMySa+f0qWRfQ+WSYtDIcwvLsmvY2sfL
	I4LcT+1bgePw10gW1v6XUq6IlP0+6H7S7shuSd8TvegzW9tHR6BLw45q4t48zjgCZjAs7a0OiFX
	Zxca/5kXHSnu1T4Ezf4xaFQ3AnPw5kPtyAeNuDft/93i5POUPSplz2cd9IhvTArn+rQyTECsp5m
	GG01dLesXq8BG5+qeFIDmR4/PycL4/RJiLplOl+uKBcMKfTpIe/eTmiANVm1tqvLAX8KOIzuoGR
	zzxg/jP7cOO6c7M7aUgNeVXMpGmgL9EG6QT3g7xhO3k4VufQ5VKwDmnld
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr22368861cf.3.1781176625248;
        Thu, 11 Jun 2026 04:17:05 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr22368441cf.3.1781176624788;
        Thu, 11 Jun 2026 04:17:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb668c9f4sm52273066b.56.2026.06.11.04.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:17:03 -0700 (PDT)
Message-ID: <3d0f0b12-9bec-42b2-b8e8-264c6da0fbae@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:17:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
To: Paolo Abeni <pabeni@redhat.com>, george.moussalem@outlook.com,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-3-f232d9ca0966@outlook.com>
 <850ba1ab-78fd-45b3-9411-97d50bb02ed9@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <850ba1ab-78fd-45b3-9411-97d50bb02ed9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PnMcjziuk8-F6MfNs6BoJfY-fpKQSIYM
X-Proofpoint-GUID: PnMcjziuk8-F6MfNs6BoJfY-fpKQSIYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX+0JvTAJQyEAF
 muCr7rTM0c0sGFq48tqbWXE016EWA7CZSJyVQGJiy7Y4Ux26hjfTWrx1Ndo5iYEEndk7BbI3zty
 7iz0UrKRJQ3O+zJEz4Q3pNyJ8TAcPosl7pfc4ObjEU1mmumj/1iEdT6Uc4HnmDJxZfXWnbEIPWa
 AUxVXBXkbnyvU8+RMjZ4yduBe1R7mbR+tbV7fBDwTFaBfjCYFzlkZTnyIbPn1mEzuT0SH6k9z7m
 4qq3HTGqR4C9XlWJqUueh+vyQHiMgKNInkYVao0AYBCxFQnZwqpO7D0JCAleqgmlleamheR8Edq
 CQT6l03qH9g6fhj+u/evUaHQHKgNSo5Q6uQ+sfXnAylusKElXMcVuJC73PBlDDdzSFBQh6fCLDz
 tgpo4nUVicP0HnTg53450Afw0dGEOSlgj8YZEQv6mAUrixqGdBRjQIkze8UWgsXEPOtLcxRQhjk
 Ju5byCBB1cUJGDrjTWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfXyMfpPPxUV7LV
 9ilmwY2A7LdRnzfydTBV0PDLoVyT/XcGtPhD7xXlHRFbAp+C4KR83ZyWIgNWw/7COB2eWF97v0g
 5nMsevsRqsgmHWxGOrxfGNztKjOAgd4=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a9932 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=U2a-IiVJT3C1q4e4PUAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113

On 6/11/26 11:28 AM, Paolo Abeni wrote:
> On 6/5/26 2:41 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add RX and TX clocks for the IPQ5018 GEPHY to enable the datapath.
>>
>> Fixes: f5f2b835e316 ("arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> 
> I think here we need an explicit ack from arm people to take this patch
> (and the whole series).

This one should go through the qcom tree

Ordering shouldn't matter much, given the context suggests the
PHY either never worked or worked by luck

Konrad
