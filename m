Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02757425CD0
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379602; cv=none; b=feLjXjRZ2aIGvg+nBCsecSMMRhbHkCkyIwACtz/iDZMNAL5BFV+3xeWywJuuhGvV8zmkYahr/uxj714QEOc7A7BJNzO1LJ5Li7Lu8iku9V6gIr9uW7Ue8FeE+m6zddWRVb5mybuRFVao9qX1F+C1PRaNnGnj8Fz3PfU4403FPmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379602; c=relaxed/simple;
	bh=EUSSJ1Q91B+Xx9zDjKC/yNPvbAc5HxjMoiAETTuP6HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/lZOk6Fb/+GW42Ooy4Dsw7gRwVcAX1ms7+TAGqpEwCAnURkmSeMYI6gQL21jvdyqFS3M7GqelD7HKpMy6nj6sjgov0ETHDpbftRC7rYqeYFzoa2/ax7JwBjwgRh+al34yzbnbiEGuOFGzBxm0mChF1H1NS4rQFF0uo0D23FRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orEIIWdZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fl8PuCXx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orEIIWdZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fl8PuCXx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SC0TIj1625044
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=; b=orEIIWdZySpVRhh5
	Cf+JGLisyug1Y3j9mI/t/kiROECrg7f4P3964rlz1aTuj+q+gEvx3U4GPhveIFUp
	LqPIpGZfdfQdP1Kq5eLbIJ1osgrsTLutwKkPedYmbaB/hddqgGBRBhICzdotGM54
	7F4qiv84RzxAZtAfToG33ZOHaQ6MXPGFyaXUV6fWL2F0ZHKXph0jnuLd2guXN5o/
	f3yMvhxGJAGU3xKZZGSLY68WEJoVrifNHqyF290JiPNWipRSfURd+TmmgVOs+6Pv
	hjHK88nSg0EDc0NxHbVR0L9cZrHw1ogztkj0/p+nXKfZ4HKxgYR7/hqkcTtKnZMG
	mmDobw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsaydj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:33:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f780a13c9so8433969b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777379591; x=1777984391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=;
        b=Fl8PuCXxt8zjBLDqREQw1a30gQ52N5tzoCRXIn22jPMaVVJR1qQMKOrbPGTPneojwN
         Ndb8qIzMAA1klkQkJg4bUu+ORGP9g4yCD28FrTZjmOeWngBPWrQ7kGqrjAGON86+VW+P
         jGEHHUbPgLlTD+etwrJp15JQgVeaQnoKBlQkuiKc2+NFEzsaSuIAQBmCSiNxKSlFu/+P
         zJ/4yUoOb+uPXExX8Mx5l+udv4BcMKJhs3CfrslU1ZXwRkkmQtG2ZCUKB49eGVF95XDs
         Q+fM0O2/15jtX2lL4+swN5Q7wZN73rs6b6m0e+sS+kyGHRPReP9bWAyZ7Ajti4A15TrP
         qMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379591; x=1777984391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=;
        b=snac7l4CU8PU4GXUX3+8dwZJJch6OX1VNCpbVHOCAYFl3nMXkO0crsINwWgd9kNajD
         jOgaKKB31s4OQ3S6CE1DuBVRX4lam9Inr81aFQrO0IEHCTnVBhTqCnp0PO+0GglPvk0i
         h+XMOxWtKeF76NphpQ9TC1lohWsQXdGLO0RJ2Z1fLJ5e+uDiycK0CwF7bncWpB8o8k3P
         ByhXXwAvXgr7KtRuyzJbfdwviFNhdadnESP0o9OYoCvMWLAtKy2duRDd1/cI8eRb6Ksq
         RDJHhqEEioV83/kCjdJzvIlJK00ENBG1ALzLWB51agaixEgDGlE4GPohZ+UrXXs4Jej1
         vyBg==
X-Forwarded-Encrypted: i=1; AFNElJ+eywcDg0JCxPXwICaaP4wxcHfFiVKbunMxhAY5T3DKmVKmd5mAFtEcUfZehaXK7fDzGrjEXbqjLjZR@vger.kernel.org
X-Gm-Message-State: AOJu0YxJrJJYSdWWRL5Z1VQSnzBwk+OEkbfRU926A0Grje/JI3ugFP+1
	rqm6oJLIqSuNpt4USwOQ8KdFniYcjXFuC3yJoKwuMUmDuydHpib1CbeIcMd98R5/8311zh+4dFN
	GWkxYfibL002yeE20dN4pwKHiSBnIXE9tPTZjFcv+ttlOzQA8s5WPJUcX17KLFkAY
X-Gm-Gg: AeBDieuJdM9ogYGMjcImipDn2/JBxCJobDXo9nIn/yfgUEN589arGvDbJdmBmBcal50
	y9vDAguWFLuZHQVyCNww5/24Xti9dYht6NibZC2YogX6nm07SzPor+Eg8lXtY4nmLOwk0Cle7sP
	T8MNkxDVxfA3M5ONRe6wtVih7OaZTF/ahDhym4lVPRyRYdomsfn8Ono4X6XzTS8sNgVkpNIRYo6
	3kOzFtCQe/L7O5KyY4oq7Js2z+Cl8E01lUJ/TmHxEAmsoubWzRuVLNctrTMPARKeuBMX2h8fIpt
	fwZ1SMtbicGXztO768NecgzR+T6WWuVjoPdRiAKay3i0TJVToxDnNYQw5J5MzziDvt5R1eGPY5+
	SdSAO79iBmY+HQ9tWoU7JLmgafHcJPoEailaZ4bVsTaPm4ZTgYBAV3bEl4TRRQfMxqvo=
X-Received: by 2002:a05:6a00:80a:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-834dcdaf080mr2760981b3a.25.1777379591397;
        Tue, 28 Apr 2026 05:33:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:80a:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-834dcdaf080mr2760933b3a.25.1777379590888;
        Tue, 28 Apr 2026 05:33:10 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae04e49sm3228694b3a.2.2026.04.28.05.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:33:10 -0700 (PDT)
Message-ID: <d0420528-cfab-4b43-8488-015755777194@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:03:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
 <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZG9OUqqjwCMDvX-ob8XoYYV4RovSdcQY
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0a908 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=xJRVJYJ9JtZugbA2SwUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNiBTYWx0ZWRfXziSLaynEbm7e
 7ckM02Jk+lu8gMz4GA1WQzfvUFTYKhWexAYqHPOMsu2vU7W/0iTLjtGLH1mKwAy3d4kgOoOd1kl
 7LOhMlmSVQ1/fN66Dg/64c3wG+rU5fgF8LW5YL7WniktfoBJB48oVeQMar1KYhvYQrLFQboYyDm
 Im+ESkfGvDfEUhRPTZEHtoWV1Ozxap8jf1zLBL6N+UaGIv4GcpxENGvgIiwtoDBVG09nV9bpGbf
 O+/CfCknrLXBsoZ0NM3Z5TKMXfdzjXEmCXVQpxpyGuff12vTPIisa11Xh1ggGEKYeR2TLPgzw7n
 Q8Kfo+bbC0v8JUBd8paBx9V23UrsLOi3JKG6XRfcv7JsEVxF37zqu7uNpKuMA1JpRDwb2OxjJkR
 8q1pclWw9ju7tEjWEHto0xUAVNqGVCmDGM3FKAvsI0u46culGKvjvinfcxJJa1xEIAwC6PsD/d/
 opgo9TeLNs59To1NHxQ==
X-Proofpoint-ORIG-GUID: ZG9OUqqjwCMDvX-ob8XoYYV4RovSdcQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280116



On 28-04-2026 13:26, Bartosz Golaszewski wrote:
[SNIP..]

>> +
>> +	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);
> Looking at this, I'd introduce a core reboot-mode helper for initializing the
> predefined_modes field and adding an array of modes and use it here and earlier
> in the series.

sure. thanks for review. Will expose a call from reboot-mode to init/add 
predefined_modes.

thanks,
Shivendra
