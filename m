Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FFA4AD4A1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967592; cv=none; b=E19LPuEPZ4vtxTVX0znPkj9IzQhQ18xlx1/Og7NQivfqGxlvz0v3gp4CW39IS6uNQvLv53GekA+VnkfvWP51208EoPUq21cCD5IyuAWlFfbdAR7GqyIsyDh86c7qRXtCoA3+ygvV3SAomWjOINwXmgO/aPZjSwF0lvv2KFIOoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967592; c=relaxed/simple;
	bh=VAmOCcySXayrvceVNgYYbOmGKQT4ami3zg9s6voroO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REP/mo8A0UsGby6lVM7NLA/32SdzRg/e3IRHLIvjOcxkCsmKb8Fib/QpMEimM3XvRHAJaH0dOLHqc2B4KAeiFUp2eCMT/XZebaB4Npe72p/TF6AyoYwlM3nZpKe7UO9oNsZNcHxpOXGg+J45DX312OSyeXT8+dla7hobiFCKP2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXTEl0qG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFXW1Qpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXTEl0qG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFXW1Qpc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67x5x2686071
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=; b=LXTEl0qGZk4zW1Kk
	oaNJ581xTUXwP9gV7tFCygFSw4MB6EOPl6WqArlWYAwhMjTl0IedI4aUcQk3vivq
	Q/Yce/hyJV3NnVmhdf8TPFn8DkEHB4HfLltnBrSCXjjlkViddToddf/F7gUQfKiH
	qUb9qAOS//9JBSXVsl2LTrWXyyf81FMkjwU4tjwkvF2jZvAM96LOl+6ywAOWf4x/
	8ILLpU41x83l1/Q4usSrs6yLLYC5xc/8wWzH3/ljlAFysb1z4Yyf679VagjROwJH
	SGFfdgo3eXJcar8GC5Dh//SP330JZrVBn4+9wiq4hvaHSKoUBIikTBvUNuVXrqLq
	Q37c+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0mm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:46:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179fb39cb4so9894986d6.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967587; x=1792572387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=;
        b=dFXW1Qpc/D6nS2iQ4WdD0JL3MZewMYKmJS6wH/dkuttN3M5FIMfAcowpYCJTPFrKqx
         WMY1yuzsO1/kxF6dvlTt0iVhQxMTf6Rpl79l9LkL8go+h3E5hzgwJcMs+nXDk+EZLBjn
         bh2AFSR2hFYXvIPWCJ8p7sCfjYBYvcaFXpWH8i39ACDcMX3JmYVBeBMCy9CUnVBWWfsx
         DtYJuYclFCSKFS1tL0BQ72FSNXRj15+knINQR5AYdxusgoaCZI1EoRSWHv582QBPfKjH
         6SrNPU/sGU4lfHqyroNd+lT/qDsuuf8dG49tsP7VUSPg9NZLtjHz3ukSBgmiWZoOupY3
         u+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967587; x=1792572387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=;
        b=hrUDy4CynYElp/kRwQZRfqe1ZbCDZIz4Eddb9SR9UeOhgctEjy7zlEOqs29aNk6TxM
         MnC/j9DKPdddED2JX74HkvRDIL/84r+SLwJxHyohJ5ykNeuMqyObizkWB/YcSe55mZde
         uj53gKAHZj58/nW0+ORUHXrSxpDszOAtH/ti+ckI+79q37A8Yv9ylCATMx7LOAQGOudd
         yw3JA1omXoCVLxXa0xs9ocAYW7HSJOjc7CK5SZ4SV6RW/5Au1oXx8hGhOOrqarXRHm/v
         SRQOrgJYpXAZtLaNBJVLXneE6PXX007CZ55q6buax/ZqviEVpyPpwS1sED0/PEBF1LHo
         DT4A==
X-Forwarded-Encrypted: i=1; AKwUvBxq9aRl/KRK92saotnTieCpWooCCb58vajLXjjE1Z+zCVq0r7MjRFZrv1OIZSInmirC21sHNXgoyQfF@vger.kernel.org
X-Gm-Message-State: AFq9FYIKFe9dx/k69pwv9ZQxQcvp0fEpkaZxCi03q0t28z13KNOVXRcV
	ls7paYWGmpfrapzR4pDk/b584kTx5ReZgJpGugw/kZgOI/s2pGhdwl4cOMWc4ztlMUGmHLW4OHZ
	ztihWuCwdhcrZQN09CnUr0MGcjDBWXcgMySvpqnRjg+AWoYcYE62LpyryDGpbGsBtbYLcpk9k
X-Gm-Gg: AYBFou1AGRQEEVOj0SlrlvafA2lRxDuQRxHSdJeBKHXKKepcn4r84VevSDIgu4QQxM7
	Vm56GYgsmRvJyL5v8VqKqEfGvQdN48fxT2EbUtu8+nvthNqy7h9YQ1OxosD4ttXBeOGubf/2e7Q
	fVwFW1qCJ31+EKeJT01/D+NgKN9ICX45PV8ev380ed0CzBhh5ZuBRu0L3S7kIO+RGokRUjoH0eL
	D2TJsXLhYNORAwh6xJxgmLMzqJ1dzhJtXOXx8rYXaLEPNCo6MBk8h8peHQMauYlFHmX0SZrwWoe
	5Ojd9rN95ZPnvnaleXBftNhdyYK3z0TGjCFZhbDw3/XcGZqV3yvDKmlplqokz7YjKysNd8vLgTj
	Vdpy+Dhp488dxDVOK1UMAQg==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2556743385a.0.1791967587523;
        Wed, 14 Oct 2026 01:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2556741385a.0.1791967587018;
        Wed, 14 Oct 2026 01:46:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038aa1aesm853559a12.32.2026.10.14.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:46:26 -0700 (PDT)
Message-ID: <d6c62256-1fde-4995-bd32-38c25e59ff4f@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:46:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt
 through the PDC
To: yoxcu <mick@yoxcu.de>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013203749.3078262-1-mick@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013203749.3078262-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX8+lI7UHnWmZ3
 8BlzGj3WwLHBWXPrqQvzenAt+DatYTRDGnpd6DGi3doWBJ0t95RH9DnfjgnZOPHJyhTwmPSMikC
 cZ8InRwQd+Hg7uSudV0NyJlBt3zoSok=
X-Proofpoint-GUID: NKH6he3wx97aEfqGeNdrcjvuImE6zP17
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf4164 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FxBUbxoBbJN2jJ9NEDIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXzZ6RP/USiCMK
 cihyGB1vhQMvE1gIl3ImwvwMOM/uMYhDhTwfOuoInSP+eZNa6b3WIuFw41fxkv7aAFam2A5KlSZ
 cnAVvw9A7aJKYab7vd+8Q/Mkz+Ja3ibUKJO95nHahu9ZPXqXczPu4vUxZElCV3l8+7+C7VVi1nj
 MNbGrJr09+BscB7goW5aFSfzRJePjeWu71wUR3rQ9bipsjzrRrZQb6zv3ZPAa9GOI55K4IO8Ph0
 6C7dFZ622zfpy8n0XB8JQZDcWYc2vKqtS9X9PCyUgW8kIrmFxrhKz+Ah7t2GPn5+NmfuxqTJzpf
 RoJUNXK0OXKt9OTbHzKrL7mjm+ja82ndIP+0GqyDbXNJQBBgR4BLqxcHA4co84v+LtwQbQTb87N
 94fCAu7Fa2KBPKwAtCkC5rihdOUEidSAMn3HchbSdakRE8JAKWBRe2hB+4HhcJ28eunX/V/cqTO
 vwFtRAiF1TY/iUvFS5Q==
X-Proofpoint-ORIG-GUID: NKH6he3wx97aEfqGeNdrcjvuImE6zP17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

On 10/13/26 10:37 PM, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
> directly to GIC SPI 481. In CX collapse the GIC does not detect
> interrupts, so only interrupts routed through the PDC can wake the SoC.
> 
> SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
> sm8250 and sc8280xp already do.
> 
> On a OnePlus 6 in CX collapse, a 60 s RTC alarm did not end s2idle. The
> phone slept for 456 s, until the modem woke it. With this change the
> alarm wakes it on time (after 62 s), and the power key wakes it too.
> 
> Assisted-by: LLM
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
