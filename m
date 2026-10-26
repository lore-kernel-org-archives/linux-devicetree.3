Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020199;
	b=xCQPULXI+xICkCVpXqiFDEucSD9nEfH9vio90n/r8xfISj2cKVvBPWJXneP3NkXflyeG
	 LU/wCtKbwPNatVhbXSbVl27OEtYetcrq9Ay/fe/I+ZL1H3nq5R4UPQowEceoHjzRuoA5d
	 zqcO/OuonL6IZyDi5UFsy8zIEk9XEPQ4CZtWduQNhZHPD/sXiEiAV8D+doprReEf2gN3U
	 Oiuwl9l0Gwv+tUDxImh+GCFCgLvLIMLe0n7mMbyn+vFOP0jGS4cNxOaiNCd0STyZ31wsj
	 VS3NUTt2r4F1Wl7JFLB0gPMSi4ihSGWLDUP4p/3H34PwsqKa59eKndBbH9Ax25yqqgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
	b=LsgT1zUfQUyDsC02SpCwWDXdFJR6l9ihN/EIHkyhR2rd8K9AnhjKxsCmU2903hT/vKc2
	 +16AyFErkSOH4XZonjakBnqD0WlF4Mxv260KKQlYCRIPXQTqQMwWgU/W6/aUBtOHbSKgp
	 iIQJdE5q+2Py8Y0eTrnPRpgtV8sRLDLdKT7feSdArJoeEfFg3YLdZwq+N8kiEs+23/9v8
	 SyAdAH3wHP1c5UnBBjSDeJBSDDEo80iUetl6VmL9oNZgPBAObZaZBBaMwOIjgaM/gR3ka
	 Mg+E27uokrJZeoB7wMfvdassH2Svogp/zjAdwItJG/rF1LNbWgRTUkgEF5WbKddUPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2930606A327
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2930606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKYN2734645
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=; b=murfKBxV5uzBPNCR
	T54ppeH1fTQLM3q/mBgRjDF8P1SH6AV3rdnDYWH0i3t5OJ4iY28DaWIC0mFxcNi8
	vIUm3Xi8GEy6U1GLXNSYwCfDdsmcWOf6r1tGAwS23/MyH3LgIKQu5bGDcqsukvzm
	O7zJfhIsDdGbP4w/2nm8TOW7PClBA2eXKAlD0ygEM72cSir51B2owyLYK/gLmcKi
	u6IH4uc9plP5f6e8X9gbHpgVL1tsneix2Ae5+YHmzmJ+mX7+S3bAiTlHjc9FXxkM
	AWf6368sFLrAjH9BrUG3rB16k7h5ia7hPV9HOkOGcv0zD3ajUxcGqMBsHOfQHH9U
	uRiOhQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8st2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83f6f9096baso4377583a34.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020197; x=1793624997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=eqwvHt3j0UtIVaY/HHDorO/6I4+QBu5n0DLjHVO7ly+Ki2zHoCCNGLxvgZdziQ09z6
         vm2z9CDrXtEulbdwtEJixHAwJC7oXwvL55xrim1jTGPdIHFSPulbpn+K5iAoufCVOlCK
         jSRqgaln7PJeXMH49QmsKAl3BdyhnlOd8F/IaF2ZBmvf8/TJUkxDOVaQ5nAQ1ILNzY5D
         mjsmVyrW9QUUH3IKRqSfAgKmorRDDtpegXIROO7zfUIeuF93MxcfmswtiLSl69dOT2XL
         jTtWPi46/Xf/nXCQverR9jhV5z495EpnbJK3DctrERI0uJ2kvgRk5oBmbUvPIiuEed0f
         8kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020197; x=1793624997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=O+PHrTS66coriU4Uuv8IQz6wgxFkkWUMUvWHJq0BGQ4cvg+PjBtgFjwVDQk+uUmGvK
         ukHWBDmDKL98tQaNNb/598DRIOtYWsQsvETxRXq8mzFPQ/QjJDjqlgA2ixWOHoGisMu6
         VuLu4aYYoNiShXP54/RM5fZUHB0Y1gqvfdJ8rXIpmqj/3jbl85Ou15fi2U/wBtbPx5Xz
         JVuIXCtHxNMZKHWWNFelBOMT0ZFxFZhRaNAC6VXh1zewmoQqwVnCVsGl6oymw8Fh9HK/
         1OegIRYaeFueY6GHX+AyLAeMyXz0XcTALgeSsGc69lgqfArbja91i1Qg1eOIjlmMydDM
         vxAg==
X-Forwarded-Encrypted: i=1; AKwUvBw48/s12LBTMtLHSgnTCxLEHMsurtQj2ejKg26f8f4+gT9fppz5AYvv8VlYQeLUTaUoZNbpabGQsW+s@vger.kernel.org
X-Gm-Message-State: AFq9FYK6+RuPbZnVKS3ktdoreuZIERIOSu3YEouu48C8AYD9emes0d2a
	hSagqxlFhp1MalKWYq1FD9IXpAADiiy3E6UwgQbmo95u2aF/AfmKLw6sCY740CuPhKz9qWPJQEn
	be2nl4W5zEfPKCtOvVbPjqywxVzyZ8genNef3LunsigS7gW5f1Gc9+gqMLdSWe0yp
X-Gm-Gg: AYBFou1GwFRFSkWGtMbRk3GRsFQQAVYfwpS3iwy5m7pcFfMTQmLP9XFKIu5YBYTVWIQ
	xO94oT1Vzgr/dXr90fDoat+TfYYTA2yCtKdLd3+ZchtQhELzfsuU2Oq2160lO+c5FjpvGF9wh6g
	loLN52h+iLY+g8v/Jy9Xmri57f5CdgWdR9su6pXWYWg12Nmnb2A/DDQKoU8YZ3U9Rwsoj+nx7jB
	+QVpQZow/0DHfvwDRiWCA6d4Y0H+I9YbESdUC4isFQ+0qTm4AhTG68YUEhTTVDJMK4xoaRjTFmI
	3t30DzbmLIpspBTFqLap3qC6bN86/TobEGZw/X/oSjbLqs3n+UUXBlYf2Hx7/F39TjumQCItxRv
	w5TqPeEx8Kdg1FCIqYpw6s0nKqDKdBDI1+y9zXmL2EJVIUPUHvZW25gL5Z3mY5KYcmYVWTthAQm
	qvyFdNAAfeueXcDNH/3Lpf3fWFu+s=
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858245eaf.60.1793020196874;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858226eaf.60.1793020196412;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
Received: from [10.190.200.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm6838618eaf.8.2026.10.26.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:09:55 -0700 (PDT)
Message-ID: <0cace778-b68f-49a9-b52d-dc632bf3a0ea@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:39:45 +0530
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
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
 <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
 <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX/aY+6qDMjJFh
 4ISeLi8U6qzKZcptOY7cdyJz5uT4uetHhhRaMj0V24GnfFTGd6QlgyhNkG/DYJmDXdyUhVek1De
 VPxPLuUQmPxO54pGBvNPOqdisnzjE6RmB4jY6QzE958ybY9jUuCyqdZRLTby0x4VspHSg6sKSjV
 MGNL2/2H532q150PnYaWVgnprQ330cWJn+slQO4zuskKvFYYCicaN/t8szpcYFMRZwAWeqbFJ6r
 iq4HCeE6AjTvDOpbZ96YLVUVQdWk8fOhs61iwPnIGW+gW6uWTgBhEvVye0uG7zabJkaj8Y331Pl
 Ou5zUNqmkBsaI21WwdeRSHNU7yl6Yq6xrGxPZfUPd0e7YvU1e+T3RxsFAS9QAKW8L/8Lx61OIeC
 ltIk73GxjtWxWvtY99oMW965C/jbIZyepR1HAljxbL8qRCxQNY4rVw4TZKfS53z73R8ke9ouTTF
 bLYjq/G10qFynQILghg==
X-Proofpoint-GUID: cjiwilawh9-fWSse4YDI-2FgcT1sWVks
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX/mIpgFaUJM3R
 wuTtMyzNW7I5hbObLgvigI2sLJxMoID+qe9G14DsGKIKXjQgSkYrmWlA2hEr2i8W6SaETwJkOcJ
 zhfL2JUnBfJPzX1NlP4enkaX0xtI2Cc=
X-Proofpoint-ORIG-GUID: cjiwilawh9-fWSse4YDI-2FgcT1sWVks
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf5125 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=orzTaoVzejLQ65uNlDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260052



On 10/19/2026 4:02 PM, Konrad Dybcio wrote:
> On 10/19/26 12:31 PM, Konrad Dybcio wrote:
>> On 10/16/26 11:26 AM, Sibi Sankar wrote:
>>>
>>>
>>> On 15/10/2026 19:02, Konrad Dybcio wrote:
>>>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>>>
>>>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>>>> ---
> 
> [...]
> 
>>> microsoft,surface-laptop-8-lcd13
>>> microsoft,surface-laptop-8-lcd13p8
>>> microsoft,surface-laptop-8-lcd15
> 
> (FWIW I don't think there's a non-LCD option)
> 

ACK, I’ll drop the lcd suffix and use microsoft,surface-laptop-8-13p8
instead.

Thanks,
Gopikrishna
