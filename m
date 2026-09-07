Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2853B3895
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791684; cv=none; b=k6RoOYQPnRsq4x783z3McDpe54kkc5QiWSozOmxAkks0LrNSX2dbm+dtgaOisoXuhInbakv4wIaZQ6Kzt3BBVo1Gixt6u+PysNck3qagA7B+LGIjcwKxCADlXjgwYsAxr7/M4SQDHOS2skkFaLwy39pkuOH37S+YnEBPlAU3hNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791684; c=relaxed/simple;
	bh=CeOaPRCggz46p3spwHEOgqlgtyutb4XizzRTAZHvMq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOrekkKik3/6eQGIC2MTJwRU6LhlA+zHzkmV4C45zY5iTuXlelzQcsT2vrlBDpYzYOrdsknlStdptdjufaRRUcl0sceSOV/oDqcXuX3tHV6+ExhNMKVM3qGhMdyxEWomCgaXz1Bz+vELrN7Fp4QgPHQRFQy/lt4ZbWxKR6IEKGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLIvoTe8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diITGSmk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLIvoTe8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diITGSmk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdK0f244073
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 14:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	osuZCFvrB7vpquUKrOkkWHbBAiTf97Zyon+VcJgxcbk=; b=jLIvoTe8JcIGrIEx
	FKkVKBJKeLXfhi/O0xFuGAw/17S8IUgUXu0/sgdBfU4+lYbRKIFmCGfXoCUikKhB
	ChU2AGcBhSu8Rg0Eg13XffrN3sNxhQNi0FxuAKlHYQMu+BgkWOptV3x8N6XPDBAF
	AIy9lPxWQmVgIoMyo0M9V8FjEvvLhwMIVvP1PZ6vsb4YiU/6pp1vAUrkcNdbT9P+
	Cn4dOLyvr7Q894jj8PZ/FItStJflxBOTAwi6t9/hqfNMjonH7oWxmJZ3n7eVB1DO
	r5or91N53fbMh0M1lm83b313H/+3o2xAAIBBXSAkcGFWOqZ+39YNWoetPQjAeGHG
	tcZaUQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86sm31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 14:34:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7824ec38da4so79730137.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788791679; x=1789396479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=osuZCFvrB7vpquUKrOkkWHbBAiTf97Zyon+VcJgxcbk=;
        b=diITGSmkkLy4Osb4nCGjKOPMRit7PK9IUHCEYlpeM7GxNvfsBY6rmKXyQSmjGGGQje
         psa1eIzD/+uWft7s9q2B/RHhwUQoOW8LB+mo2GyDpI5VsRjeuB3Lj4emv6Z3XCHQ4TyW
         Dl10kWCAlL56wd+5n5hO89tP4995qBC7WlRz8AMgvPAU/zvv2T/ctlqiXAMUEhyoN8fg
         NB56sVMEckyTH5M6mPTzp1trunp5iWYCyvikCpZCGsQDZvR0MvpPIvTJ8kNYhFItdttC
         Xdmio6izfJt7HhOzCWqPM0BjwfE5YsC8X/+tmb1+vkcSY/PQxEYsZrfdm8GSpyxiT6KT
         er+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791679; x=1789396479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osuZCFvrB7vpquUKrOkkWHbBAiTf97Zyon+VcJgxcbk=;
        b=DJQvl2SRlw/yAcRxGxbFLSBzWGqpmM6WymMCVeps8P66kbsnc7EvzfM5Cfidpfxa28
         uKBQIQTZZF1uWgP8snpootpTMKX1VrF/8rNM9S38JorEoYvv8jJaK1sbhyhdrSSHJ3vz
         XgFVaR9Q5XicRcQV8386bcp4ze0Wma03d0l9p96o0/HsYn8Lfhe6qBSmTET2oYd/EOnV
         +joVxtJnfF+c+ki5ymsfFbHD++yNIOqCvlaw2oZVgtnC0RVdSBrk6Ohh6sXxjIY0q+43
         h+hIRMI104r0IE1t219kmxuBXhO16NWwhDxplXPA/COB8f5qXBxbTp7/TbI4/l7UoZLT
         oALw==
X-Forwarded-Encrypted: i=1; AKwUvBxP3aGy5S02YSD0KZLefMEh+bFjaAl2+9jK5NAiTV7/D4dIoQqHjarD6p0p7nMmqLsGxudk4PDhPqgR@vger.kernel.org
X-Gm-Message-State: AFuF++nVkkkuSqrKIK5QL1UBjIEDE9L9TKTUtvCCUgUmJPsBRTUTLEam
	Q4CR/w5Na5tFQ6Ob1P5uB5ztS+KnWOSmypkeMEmjckffZ5VsUaQJQkfoqtdtI9PLX4je8R2830S
	jaiXI+GEL+wsS3ql4TgC08bFOXEH1eVdg+K9QgQJ5hNh/BecO/T8/1t4QQ/QiTfQ4
X-Gm-Gg: AYBFou2Lwm9plTZU57KRA9TfwiCAkLTE/jO4EPuRNXv4vcp+A/Er+T5SkFDX0aoTeEW
	JSODv8BB04BX+dbVICB69hgrbRhL1fE/sobGd9b6qBIbmX0kDa+gYGzi9q+ZKi1Q0qR3bQom9cm
	maNrF2uZ6xi7tlgDoyrS+T4wdwYN5E3GEAqhZsG9w2CQkire8ZVwD4Vj6ZxX945iYlAyUHBqdpa
	jy9hxxSMxlo8IiklgGaeKzxTpQNlIE/i/Re+LIB6hkY1r6QwSEW6/KeevLctJvZL5Fb5SadfL/w
	Mgq96GP7+u4dYZBpHuRC68JEV3c/eH2rhC96am4AcafT9OqBAjjJ8bxpCKs6ZBV3ek5eVZDw4py
	e9ZtldaKplXYucroUkpOpiQ==
X-Received: by 2002:a05:6102:508e:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a60ee3f0bmr1885967137.1.1788791679159;
        Mon, 07 Sep 2026 07:34:39 -0700 (PDT)
X-Received: by 2002:a05:6102:508e:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a60ee3f0bmr1885953137.1.1788791678627;
        Mon, 07 Sep 2026 07:34:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm485710866b.46.2026.09.07.07.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:34:37 -0700 (PDT)
Message-ID: <0916741e-442e-431a-9831-9457e3af1cf0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:34:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
To: Marc Zyngier <maz@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mostafa Saleh <smostafa@google.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
 <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
 <20260527-x1e80100_qos-v2-2-305c6539e6d2@oss.qualcomm.com>
 <apgeBNSiP01YfNcs@google.com> <86ld9d4h4n.wl-maz@kernel.org>
 <f58bd978-ca45-48b9-a928-45a2878fb54a@oss.qualcomm.com>
 <86jyox4fas.wl-maz@kernel.org>
 <ca962589-3b6c-4e5d-a11e-b49cf20dc262@oss.qualcomm.com>
 <86bja94234.wl-maz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86bja94234.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DhrVu7_N9K2-aDojzyf0o12vMQOg1yS-
X-Proofpoint-ORIG-GUID: DhrVu7_N9K2-aDojzyf0o12vMQOg1yS-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfXw+SduseO3kBV
 dsBOCNwYjOgRPnMVaOPMSeNL2xPXp+gscU53x1FpisnE8Hk9vz422Q8VXRgdwE9e9Dk7u/p/llN
 xjB/p+svccWA1tQ+zuhrl3eJhsvmB+c=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9ecb7f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=YAGKaBiEDj2kTEL75LoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX/+kBQZq3rtfY
 I/8eXIQ3SgDNn+duTNrXZhYjcJhgczGfbgLpVTCXd3YuUq+/D/rKP1Q2tMyVRbddUect1PNOBLz
 I+lJc6MgIeq/hlAqTl5Kbg8LQE0ch0ftnJfS95SI3ud/D1aWpAxxD2Y83tOPfIjd6Y64irmzMIB
 +nbpQ13vw5xZtjomNt8bj0bK/2srLSoV+bFkhxMbTOrI221mXywY19QnCamiLSenlvM+ZmoF3ab
 RCd37ZxVUi7qrvpDy3eLCmNG/irbLnx5oQKalvD5TPwC9mgj4y0QnlcF7Dxiig2A8odyyRyGk5u
 3vPHEKvVNzywJPQsykjFAHS5IWpcmEwyKw+rqrjmDU6xGezIWUTOowxeGXSJ0MbicoAvQqt7Ww1
 CIMWmf5wKdc2nks9W+z1itjTYpKW6IcU3infDqP19/T0a+ZRxKOs3QfWYkhnbC0l63VmiiTjfuN
 q3udhrqRkoKZYovRHsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070160

On 9/7/26 3:34 PM, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 14:20:26 +0100,
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/7/26 10:49 AM, Marc Zyngier wrote:
>>> On Mon, 07 Sep 2026 09:18:38 +0100,
>>> Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com> wrote:

[...]

>>>> The current patch enable QoS for Hamoa SoC, which get programmed only during
>>>> driver probe. This shouldn't impact or cause any spurious resets once the 
>>>> device is booted up and probe is successful.
>>>
>>> And yet it absolutely does break things.
>>>
>>> With this patch applied, the box resets within 5GB of heavy network
>>> traffic, probably because some transaction get delayed, and a watchdog
>>> fires. With the patch reverted, the box keeps receiving packets, and
>>> everything is hunky dory (100GB+ so far).
>>>
>>> Which makes me think that the set of hardcoded parameters in this
>>> patch is not universal at all.
>>
>> They are, provided the configuration is for the right SoC..
> 
> Is x1e001de different from x1e80100? AFAIK, it is only a binned
> version of the same SoC. How do you explain the above regression?

I somehow skimmed over the fact you said it's on the devkit and not
on the mini-x mentioned before.

I pulled the Hamoa settings I could find, there are some updates but
none seem particularly related (maybe the PCIe one? I don't know how
the network card is connected), please give the attached patch a try.

If nothing else, please "bisect" the QoS additions until it stops
crashing. Although perhaps applying only some of the settings may
have its own set of dragons..

Compile-tested only
https://github.com/quic-kdybcio/linux/commits/topic/hamoa_purwa_qos

The Purwa icc patch is a bit of a mess because some nodes seem to have
moved around buses..

Konrad
