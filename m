Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772884;
	b=JwUJygXBlzLc8hDrV41kb2cmXNOCC7BYkMwmu4Rz+qFgGYMnjuILgq5XkZTw4QWQrhoI
	 q8UBiSip7fBC397ATwuPLldLHsfT3kkgYUJ/QWj2zUnFCQ0VEH8dkDwcCi8Agyg5thBMh
	 KmZByD8IKBjjMULPa6peCBr7NljIFyA563CkP6sZZyIhORIKlb7IoxIu7lCp7iCh85bR5
	 XjT2dc3/MFK9mvfaImYmuvMZfkoNHOCnsSctmaLCfT3HVUxOlOVw7DXpYc0y3NrmBVrac
	 7f6qfYZmaKOK4o3aQQuMaz2yc4Ov0xTZleX0HWvg+2Cys7JUh4SLsTfuuSnO7R9Gf1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
	b=gnlPHraVuJ1uvN3pVrFpGZudPaLKvYgSvIGCO75PHtnEWrqBeS4rkq0oMVKYffRnkHii
	 WlWwCVGsDtQIo3AFIC1uRzjGgJ796hqf162FfWaEMe79JLazFwRpGwLJS3Ud8yrl7IHQm
	 DFQFEpc5ke8TGT0emq4i+hxsJpBrtcMJCCreQ67dGs3xXt9xgh8/vcOPvJutKuUepkK/E
	 /O+dnbujZGfRZMBh9ypAD2SKlLNWZ3AybV1OINa3DLqJSIBBZXJuvKur7PeISwO/gH9tu
	 4vneXu+CXv+mlAOl9jEjbF3m2ov2cQ2RWeyoFHgEtvr8RZ7RNy2vxHUQ+zumqvPRLww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTNkDsG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hx6DAByH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5105606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5105606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTNkDsG9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hx6DAByH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3r653812282
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=; b=PTNkDsG9A5emxBdq
	Pdnx8L7FgDxoNVqkFA2NtbEIyf6WUMTnmbcDT8G23HbLjPiLCMt5MSAvJ/mD2ci9
	FICN5MdG5/wyNgBiGbRxgDDropOPEfi5FKebw9B2bsteteFRD2F1ncmHoSiIcZNQ
	4pNvD2pcEXQxNrIBSbFqNWbRlfAmVyaYlX5A5Iqs34WA1KZIrYzkfoSvpdQsI97b
	ISmo6r46Cj6qktZPtm43ptgJW8W2dMiXF/SmmygTq7HbDsX/u5SRc1+ByKcGUVki
	HMtxxSCkCa/xE5tihNs65C8BDUmF6IITGqIWqMtufiiBLaMQef0bTRWiRaUB20Zz
	tTXGsA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas8832n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:27:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso74882e0c.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792772876; x=1793377676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=hx6DAByHxqHHpsqa+EIKQJzX/ToMEE9U5Cbjaj2FZaaKJbovJSAUxvQbgFxBgjb+Mv
         +Kqsoq9CVfpi9GllC6Kd0C1M1IRDfMAIV6ydzbI6+Cc2qz0TTNgRBTS0n/cRWexerO5w
         VoJ+uGac4uyIo5sJS4bNfoFPmeaVRfrySFeZGF6CYVUpMUWABEC100aoNigV49LdkQN8
         phv05OvVCaMwHlkechVSZzPYS/RYvgboY8w7MEKXH2sidG5dqMAE5SeV5MsdnmynwdXh
         1ZNnzmAna1lc7KBqlELMBfi/0c0HytzRJGLm22V45NyjXx4IkRRqDXjvBOw21eoxMM3p
         uLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772876; x=1793377676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=z5/Hv3v0xIfiShP5CthV87oeRwpiXdNt1H4CSkNB6ikElJuALvQHDtLrXrwfGRUkHg
         lQ18HbnIrNQIoiBXLGEBEnPqtntQdic3bLEa/AJIQJCIcI05/8uvPTxtaGDsz1QXcvkt
         941INi+6/qAKvLs+80VPqtbO/O22jGq739vOdXSspafcoHmzbhfeof/jp4s++JjRtgGG
         1w98UuvmuD73oYg/Lr/OkTOHIszyXHOWevbWvyHMWMRaS4loxPFDsTgTG6Batizdc4Tu
         h8AanCEIBxXORbqXUHeFRLFJkstOVvDJszMJS3ZZYfO5NXeA5UfLEyofZv6HKjHtsfaH
         eYww==
X-Forwarded-Encrypted: i=1; AKwUvBz+Vx3YiKby03RA7GgtzwgKxK9O7vZBJfu4SXdzH70S088GTmqzo+uqyPx2S24zD/47YfHAU4MoCXLv@vger.kernel.org
X-Gm-Message-State: AFq9FYIsv1PtaZSbtazuTQEdIJKU/ILg2rBqe22wLUzRUNmeqX1XFlkx
	u4Yo2FRK8FZz5g+JVH2mrGZfrxQTLwHqfVRCoP3d5GeONaMXVZAiC6iQsaHQpQnF26ZnAFcIqN/
	RIJEJ0uhMeJUgllAbvUIWW3XhbcD4DIo4MOeXVL5BtUFNlpAKCWjAtP2KPW42mhxT
X-Gm-Gg: AYBFou3nYpQ9k1hYVJ9bORYXG3t8u5e0400RgAYWGY1L+o0UvfQCBNtRngb2Nv5X7nd
	nkCzs797cB/t8anbIYoR+uBYmuROOZyFUJnJr5gpwB7khaTAh+0KTXpAHsFfGLOseVzLue+LAaK
	G0692thb8QYoTqy0/PT2zDI5mzWhITYM5ze1p34Xdu5PdMVNyZzQzwpg5n6UywUNoH9CUz4mlNm
	hE45ASlQ+NPHeO0dPlwpS7xlNKOZbQVgRSKLqGp/Ixkt8RQYL4Ukh1wjG1Ez5lK+K0uPYGUYGGR
	PwVoe7JAWJo2UMZj+zrp5i45YxOQLgb8PTf/QRj4lF+VFoQlY8wLX2m///IQ09DuXhqCFpLzIeF
	VqXx4V0genleXjO7Zdz/n7A==
X-Received: by 2002:a05:6102:a187:10b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7ccc32a88e5mr1227645137.2.1792772875884;
        Fri, 23 Oct 2026 09:27:55 -0700 (PDT)
X-Received: by 2002:a05:6102:a187:10b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7ccc32a88e5mr1227624137.2.1792772875358;
        Fri, 23 Oct 2026 09:27:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4420e7268sm40969a12.9.2026.10.23.09.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:27:53 -0700 (PDT)
Message-ID: <15c97297-379b-45f4-af63-c9c71733ee52@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:27:49 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle
 states
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
 <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
 <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NCBTYWx0ZWRfX/N5bNKpveLEL
 FiIN18wxLB0RBHmr6G/6ZkFnvkZjvK0Id9YIdKd4QfE2R69GhXxJzTlmArWunXm7rTYGA9C3Q9f
 7yh81P0/InIXNiJ3J9txZx4GYRfKrNs=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb8b0c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2CUSOdstmcgysknA9-EA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NCBTYWx0ZWRfXy1qjbEwHlWgj
 L6ei7D9SD130ORUeDvdbiFHHuCkv7YfRlJ4yRhWwF5a3x2cgkWMxPoQZhF12ljDGZZSFHZ9uTHb
 Tb3UotohR7/5FqohHLgivxP6DL3z/rHtrJNXrkJT5FXqB0fBMpuc2D4ok8E+i5XyxZ60P1R8Xk2
 nIT2+3gzh6Wr53x3I5rA+adFe63MjoJyS25yL9aL1H2+GaC0Jl7iZ6wtOAWp87WxA2J3OSkkME0
 fx14+FSjhNOeUWgcy4ARTEuhFafQRh0IulD7zZzJ/IE9z5wHp60MqBfyxSRcrAfGBn8AXY02ahL
 55UvhcohGUlXmWxGgH3kMg0OkiisYM8IyIjRcQbe0P31biXArWPrJG9VC4kjVD+fX+dS4FrD/z0
 yJWXDmKJZVFW2xSvAysXaxD8zVcUlS9iqmHhTeeHySsl5szPWpucStxkDOa3qQwiN1r9sNd2oPt
 pd2S5GwZD4p9jxS/hrg==
X-Proofpoint-GUID: bhAfLruw-LV6PqtwdOy18Wt9dwObdnb6
X-Proofpoint-ORIG-GUID: bhAfLruw-LV6PqtwdOy18Wt9dwObdnb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230064

On 10/20/26 6:15 PM, Fabricio Akio wrote:
> On 10/15/26 3:51 PM, Konrad Dybcio wrote:
>> I threw an LLM at the downstream tree and it decoded the states to:
>>
>> C2D, no cluster state    2        0x00000002
>> C3, no cluster state    3        0x40000003
>> pwr/perf L2 D2D + C2D    L2 2        0x01000022
>> pwr/perf L2 D2D + C3    L2 2        0x41000023
>> pwr/perf L2 D2E + C3    L2 3        0x41000033
>> pwr/perf L2 D4 + C3    L2 4        0x41000043
>> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>>
>> sorry for getting it wrong years ago!
> 
> Thanks! I had decoded the same values, but I didn't just put them in
> place of the old ones. This firmware supports OS-initiated mode and
> refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
> set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
> may only be requested by the last running CPU of the cluster, which a
> flat cpu-idle-states list cannot express. I tried it: with 0x41000043
> in the flat list the firmware returns DENIED to nearly every request,
> accepting only the few that come from a cluster's last running CPU,
> and the idle CPUs spin on it again, at about twice the battery current.
> Linux runs OSI only with the CPUs described as PSCI power domains,
> with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
> system power collapse above them. I'm working on that, but I'm not
> sure yet when it will be ready, so this is not a placeholder for a
> replacement coming right behind it.

See:

https://lore.kernel.org/linux-arm-msm/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

> Dropping the states is not the complete fix, but it helps now, because
> as they are they do harm: cpuidle records no successful entry into any
> of them, and since the deepest of them is what an idle CPU picks, each
> failed request is retried instead of sleeping. On the Moto X4
> that is about 133,000 failed entries per second with the screen off,
> and the battery current goes from 277 mA to about 115 mA without them.
> 
> Is dropping them first OK with you?

Temporarily, yes

Konrad

