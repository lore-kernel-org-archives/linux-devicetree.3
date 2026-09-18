Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CBA342514
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722757; cv=none; b=tqUtRyGDHTopaTrPFsU7g8yGym3iimgBN1mhHRpeKtL7WyP6dB2AaYIZQOjtkjUzEEZkbvuG0elGD0RlnhX69UwUJ4lE9LZ/vJe/nAE2yW7zrug0qXfEKCYhxz729+6h09XdcreDl3T7qUbToXrvIR751tK2sZf4cZAC/NGehcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722757; c=relaxed/simple;
	bh=dqNLkYWW3gpedw8yQO06Nn2TvNDxzw6IotmjZsfjq4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qv7Ai8OVyyJlae0sULUlqagAT9XWFZmQ/KjhAiraZVjU86SUP5F1a5TxebdBIytW3eLgdVk0mTkWpF92hfqjZ4W1JIaFBoLCN16HOn1yTG6XMZO9DwaMp4Fsm1BJGca81+AYtDp7KQjkZ4KSij6lT83RTs8RWJ3O4OY0yGqmb8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCVq0oo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXZm6+iK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCVq0oo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXZm6+iK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xhFq4082729
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=; b=UCVq0oo8hh3zpuNN
	YkqNqbz3333d1T73kirv80Sdf81VJxW51udbIcADdlqdimOPwFrBroXRMNZmCa76
	kAeBZfibEQL0ApMCmDR5Yli8Eb+1FTGBUYooe/kIfRqwteQSs/Q9Kkw/lOQPmJcC
	P3C8IMJkP61fVh4FHZ2v/Dm7Wj+kidskCGgUH9uRCWb5JOlb7RmHS3xb+JwgGWeI
	Gp1UtYJuSXW/GoRn0ybRNCpk0pyvklL31mHpqb48WnvgoievVWUZysFa0eqKW9nD
	JzzYetzT3VYrkLgMM2DHhuCBz2nVo11zppWkJAlEXh3mCCNygH+p1RyoFvOwI4V3
	gMIuqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrs5m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:12:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso105872485a.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722753; x=1790327553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=CXZm6+iKFUl+TDKQmvTF03XLC+tqEHyFbdUs8DsQtC8MSs7+xL5OZ/K9G/heFHiUWX
         oQXaCG9nNVt2rIoYlOW0tkGZTbNFomAszQiYfm+Tj9/+JB56xfKb2A9nc8EMD647booF
         68RU8CIZ2TtaSQ03T0/UXZKy7PGgiTcJYOJq3lWWuspLlpIGvSRnnte6CdJXPREGfWqp
         4npQ4h4G+tvMVppnC9mk7wuRC0N9BG9Vmil1rsPIUDntTLAjrm8cJjsCosAGwQx3Mury
         +5sxbPZuCT3ttuxXNgqrmIpjZFQ0hpw1lR59cv25tMCTPo1xVkTYWePP5At16cAvBGgc
         ZTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722753; x=1790327553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=kbPsEtGpCkzIzihEALClAAG4XXiehm+lAoVz4ST6PEAdA1v37lc6Aaikvhj/Fq98qR
         OcAKRj2bcwI3eRAt0Hey291vVDTY9XkHnmms/o8I6WbiptrEXRmbGakkui3atuyTI3gl
         4wjVS82F554I8J6axykCDY9K+XGNA1jeh6Pv9Y2vpNQkgjhOqb/Jd1M3T/6+qb7xSnqb
         f5QgYakcuxLxaiFCCh9/VAk8lYWm0FsA9syG0szoEOLl4xk1Z2Os3PdppPztlERLCx9I
         JVgaYCAaUwcEofwIlXCDdvbQlE+PWGfsTs3xnoisJcIZwPRKtunXZoFGjbF1lWzhmse4
         o6aA==
X-Forwarded-Encrypted: i=1; AKwUvBxAK3VAcydeW/Q/Zti9cRp6mVEgGbDsWpCUSpsMz4Ovz+jC4JlH1z8blCSqrJYbRPBhsiYAnLA5vY4B@vger.kernel.org
X-Gm-Message-State: AFuF++lPfMGAwHvLfVfZh7s7JlVucUgunwJItCjiG7GgtiAIUY5QvKq2
	i0mt6hOrnd6ZOhxTwq5hcmd+xYQ9igoEL/3XVCj6T0+X/tHcusYwTy2VPbTolPA/wGnuEtF/fcd
	3mfTnM8A0b3Ni1zvoq7n1UihdHqILw3CvOvpjC+4b5lTOYbcWEQQkE0+qU1tC8c4o
X-Gm-Gg: AYBFou1HRCkLhGRTqdwE9qc2CHUivOsC28FyxZdnbQ/XNabwAzYZYlXxQGs0otwpgiM
	NRpeYSoCvwgQ24vtISIPqfxH8qMSHQyiNfx82XlY6JgswzGC04mb+kovROPK7GgAlib9+W7CryM
	/Q1pav4Tc2krlyCjXxvNj5nX9D/jda7B5tr2Ie9gUIphjO/rlaTMd+dDIIa5fAajkaw17Mwo837
	8zUY7/DKtDFUYb/hnO6qcUbatrpsuzJZxvQB5b9cMWKXqmUNkXxRZjYbKEtig4s+JUbVv1BEV38
	wn/qXPVKf6ViXk2y9ntlt3cauM+2gnsVDcJpOvZiVfNz3kp4X8ParnVxaKi/NqC0ZeFM/xbMlZd
	7aAGrT7HUC09Ev5xkBC1dw2xe5eKm/mgqQpTIQKW1n6bPMWD4ZZGmZG4TUbuhM2E=
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216695585a.42.1789722752726;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216692185a.42.1789722752340;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm31018885e9.2.2026.09.18.02.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:12:31 -0700 (PDT)
Message-ID: <45768828-d0a7-40c1-8eec-3a1fb2d66a71@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:12:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        mfd@lists.linux.dev
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad0081 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfXxk28bTa0h/R8
 M4k7rfRaqr4LWiJrsG9q7CwTp+Iy1k4aR6bLihq08bZ/+zkxNyOtcf+eFzpQ5yr3ZGWRpisTkIN
 IuFGzSGnck26azsahaOM8JKTXzq2/dSGA9VIaSPGDyGQk0aXar1HETX0K0I56z9nvvBcSikrDf3
 G1YBMNUr4DayWgsfZjILAI5rN1CAd+MkKobTq2PRiQZPuepMXVDtfLqMcYojX9SLcDqEswaMxRg
 6JmzMERwBYkqN1lOwHutRprBT/wwR/5sQikxNevck0ZvaEmXcN+j96R4OKRzn0Q4m+D0rP/fFSj
 9ogqKF1KQVmBtJlP+rhtIYNdsUw4/HaDD1z2TZjbo4liIXkUtR3jLLX3f2HQQaKEE5arPUF7hqa
 I9LzHH+ZoMFu9SEE/7vQrBrzD5p2252Gtvv6gfdS/yR5gl9V+0gESPfo/6nYpfnJMmQamFDgXSJ
 QFcsOuXF6WFJf15tEQA==
X-Proofpoint-GUID: nsokUib4MKM0Hjt24qpMyaUsrym7751A
X-Proofpoint-ORIG-GUID: nsokUib4MKM0Hjt24qpMyaUsrym7751A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX0pmbE8qxbTKG
 2hhdWzcnWDXr3KZ4dGPSBlXj1C5JlB15lxxP4WBox7QKhBWazFEU6UZiUckdNA6cVm8KNdAdHgr
 +W4XEeZg1WPJCW4O0GDM+JJTiDjsoEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180126

On 9/17/26 09:59, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Introduce platform name, control register and duty-cycle
> levels per variant.
> VIM4 uses a different register and level set (0-100)
>   declared as a list (0, 30, 40, 55, 75, 100) compared
>   to previous boards (0-3).
> 
> MAX_LEVEL is kept and bumped from 3 to 5 to make
> the speed change more gradual with the newer MCUs.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> The regulator is released via a devm_add_action_or_reset()
> callback.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
