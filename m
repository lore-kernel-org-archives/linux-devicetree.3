Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3C3C3C14
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441867; cv=none; b=q2/yWMc5glVYe4PKHnr9Ga5n6Z29AuuPlX++N8d2PLioXf6thQYRWR1flgn023TJxAHVm4L3NfwkphSwvbXIu28PZkxGWtEZXRQPmIF0VRCA8mnkwFwiyatxqGp/QkGxolE12Ks03hLHsantvOolzvvUiU2yVnpN3kzwrNUxxRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441867; c=relaxed/simple;
	bh=+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=su2NCvyoegPaVvcbsvSbVfv/8+pu2qaUPHazZhqShZF/LM9UCvCDZwzX2XoL/jRUzpuG6lsxeidP6Wi/aPLscdXPpAd5HGe/lJfLLIX2WEqrsIO9otk++dlGHtViwukmlCmexxn0l3PrSkKRKqDCzUlm6MFbh5ZJY6Q+lmNgs+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqWlC/Vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrqWHb+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqWlC/Vd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrqWHb+P"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8ganQ1657889
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=; b=mqWlC/VdunaOrdlo
	yltyKLZEPW7gGXbYdkJoRFHNtW33urNBdJjOLZSfbyPEaTSNer/Y8UxnVKfkvYty
	q0aSmnK1ICe8nVcAXpRpTKj4CfMmqV6+TwYjmNhcYmuAAllqP9lskxqMxCoKbMH9
	BS0ShXHsRzrrdR0hSwEtu3hfxLkKFxXlmdxYEV1OeJE++EMNCGegj5EEW/O/Fsfo
	lM4DhUb5R66cTGN+RXQc/9kixwBHkc4QeH+SAsGXBT+8fOBbEzN+uGDXFPc4j3fP
	hYsz2owceZxIzUGzvWL2gonuH1mW8XdroE5S1DYq2nf12RWZsK/oaoDdAOYou5C9
	+hUxCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkn363-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:24:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914b56f450aso19477785a.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441864; x=1780046664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=;
        b=QrqWHb+PTT0ISrwslDH1/lAr0iwyuOAw0Ze6b25NlZ0VOUWSWa40A41C86WtEaabHi
         jgbNSzCkf1vn0bR/GaiZWdXX4F55r4zT9nnZdCTxQPv0FblGWahwepep4VsV1DYvKT0K
         V96v398AW3/yXYACh/Nytok+ZpLEVSD0pGvvgX+Iy/0kcBmgB9codRpNPbkLyfC9W7uJ
         vkyYQPSpNfMNbyRtQy1MRcWte2pgHnhHw02DJ/R2wGWKT7Ud3Gfb4swG+rOz487+VyrH
         QEgdS2SDrli6IvqN0woxBZIGa0t6VaHy5pVx2ToMlQ8F7mB912xX1BYY2D6e2f4Dqq+m
         Hgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441864; x=1780046664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=;
        b=K+Lk+M1hZmwjilfPUXopHY9Le2e/k/KQ5HM9ZK73jf+QRGetAt77PVCQoT/eIKccPl
         X4ZnN5vHQ2EAM2xTp89jY6WCNznySqoxEScwtlgUS5fGAyjZrvaCMkosHEYRlT9yaFWm
         dBhxgsqNJ534PosRVDE1LS7GC2tZcWhKzFTLXDhv8WzuyMHvJ6DD6WFMyTOj4u10IePL
         DzmqPSgecQo4QtMzMgzoGl518ZvZfuFUtljJyUd0022D1nzbdscd8AoLNnFOObYyigwI
         KnYkIlKUt2jjKzEFUqP5o/F+gVaeQn15htrHDtuZm39UiD5HQhpdU6F5ioj2Zrrg5XiL
         siVA==
X-Forwarded-Encrypted: i=1; AFNElJ9fFrBRbg98igiIuBeHULre1VYxyLjEiHo1AkGjBB/2KHhf+tKAqEg4wbVShUyPvjTrUWKBXTpufxyx@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdwTcVdCYmriAMHlC7SNyyjK+lOO5qd8WdnX3DUFFjDK96KUV
	cr5ujuEDEq5AUMpWX4y0uugbWKtN+hkrOYv70ZarpKV/ERVrrv74QRIl03jeEot1AIBShg5rk8N
	/VVqyFhcufN4AbOS5ZaC3jwDQvXNS1VWo4GuNRiD5bUQRUZ95mMareEomHin/S/dv
X-Gm-Gg: Acq92OHZzCK2phunOzG0NjZQq1wMEvfEGJI0l+z4qumnY0hmYmMl/+PjvLrd5h+yIGU
	3TG7hT1ra1Gn7NiqZaoKLc8Mb+KwO0/cfkVVE0v2sVVUUsWzO+bNEy+HiwUs5KTYPbAge6L10NZ
	1CS9cr3d/Qwkrqv4hf4WPK6VB50QuAKleSoaIoa/0Gh5QHkWPiIyEe78ElvYKgpiheIakgO46B+
	z6XXLlOmVJe8nKKB5xF8K6EEyHhCzIGeZQI5E1UTrsRUxQpFs/17aihjizPogwLJRH8aDANSfHw
	MCLxA3JNBg1cfCVuFc3gLOl5i/8W08vsxEEFnmIQslGf6MMq88ffusCYANDWPc68lcNj9zqIkjw
	GRNDiVJq9r1niOhWGUYFTIQTxcO3giXF35z3vIKUjOz6k+w==
X-Received: by 2002:a05:620a:4109:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914b460262dmr299246885a.0.1779441864064;
        Fri, 22 May 2026 02:24:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914b460262dmr299244885a.0.1779441863651;
        Fri, 22 May 2026 02:24:23 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d6369sm34163566b.45.2026.05.22.02.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:24:22 -0700 (PDT)
Message-ID: <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:24:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX1wdQxgOQdXAK
 /XDWA26bq6pQ8r6cgra37doF3JKLFI2uk1CFmydQYuWSv4wj2PQEwJ1RKKKUGRqbufsIOtJsTyl
 Dtdt4HzzjOAp+v8GSglOjjE3+/i3Fpk2HiUi9iGX4fxIPOuXTCpqGBlnXdZ3hEQJUHJ0a8NfiWQ
 oXbqp87HngRMyYi1xMCM0yY/GEiU1RyR4aVBbkn7u+wYidyFjwb3nDczd2CEykj1FvusgjR3H2A
 2Ig4x4kNeh7Vvo6LhcUPl0qeWcSRaJFCwV6U/Ni1e5JfkpWGIweF2281fSUwm1Yauk75OYxYvmk
 gybVjjhbidRIFkYmdEKOxQLXycSN0EyHgLMNbmDklcamuIsnBGYMt/Enop/7rd0RInfpZyUb2uT
 NvPyeThjtrWgbecpUS9CW6uqH6uSSYsuz49GMe/WSFnFvjvv/DGIlFRk4uswTY3z5L/sK7uDWYg
 wC4bp0P2pXfrqW5XZ5A==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a1020c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=diiQsov5Z0b7G057BPwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Ip3-sQQWvdVW9TJC6Xn4BLouk6bWLnlL
X-Proofpoint-ORIG-GUID: Ip3-sQQWvdVW9TJC6Xn4BLouk6bWLnlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220093

On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> On 21/05/2026 10:46, Konrad Dybcio wrote:
>> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
>>>> Since firmware does not have a way to dynamically tell if it on a
>>>> debug-board powered device or a DCIN powered device, We are required to
>>>> add this new DT property.
>>>
>>> Neither debug-board powered device nor battery-less will have
>>> monitored-battery, thus again, why lack of that property cannot tell you
>>> what you need?
>>
>> A device with a battery will not have a monitored-battery either
> But why? If for such device property "no battery" is suitable, then for
> me "monitored-battery" is suitable as well. IOW, if you say that having
> a property describing batter is not a accurate hardware property here,
> then neither saying "no battery" is, because no batter is basically some
> sort of battery (just like empty set is still a set, empty array is
> still an array).

The battmgr service running on one of the remoteprocs already has all
the information about the battery and it also handles all the type-c,
PD and charger configuration, only letting the OS know about the
results.

Hence, unless there's some other hardware at play (e.g. for custom
200 W charging), which wasn't fully implemented in the QC firmware,
there is no reason to describe a battery separately, since the OS
can't do anything useful with that information

In some abstract way, perhaps monitored_battery = <&pmic_glink> could
be thought of as valid (since that's the data source the OS gets to
see)

Konrad
