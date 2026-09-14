Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54444A3E8
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388808; cv=none; b=j3mNKcLJST60w8rkusaUuDnmHpiEzkVWSNADGgJ0UjyO78mAbWAO4oIfckAXxDq3K/WKs5p6Deg2J+vPEZRjXjKJY8k0Yks68aXRjvXYK7AIjDKPAoJgmoxzkiNettLZt4Q8MXZmIIYiEjYnkY+4FQyCab8UMmQeQvFToAQmFVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388808; c=relaxed/simple;
	bh=j+hitAAPFMbwqsPEZqXJrefI8wl7jXzr76x2hUOjwDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAf50XRuTUjlMLM/pU1WCMKYMkHUT1IJnvz+rle4j2wh0CzkJeun8nS81RCPGPyoyEiTj0JHL5DufZUpzF895ZrILHHuJkc/DtpPIUm72iGrolhl8Jm5cvT3i18eL+HcEL+l/tN/lS7VSJOBRQBOSQsvVsspauUgLko1ZGdp0NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENS+aZQy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYeoqkD/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENS+aZQy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYeoqkD/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlw1e3860386
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=; b=ENS+aZQyUZgwESD+
	sH+FTSLGIUnstA2I8fW5OGA2dDlXsVl5ueHVVmYf5AkNc1IghAFvGrfvMxWJJQT+
	ja/6n8tG6V9ziV5go1sKcOqHHlCqn2Kg9YtMkjXSN/uXh3NY9keL37UVDYh1vzNI
	Fp1zq0SL0c4qw0MjURIexfJYw2dvADhGAES3wu4eUuN6byNVtC0Ksg4nMorylqxC
	HZYVvsAmsdB1eET7IZL8m1GrteL7OeTj37QrS7khjb9b1AyVnyZnHTvHcomPRW7g
	46Beq9HERQ3ZZN3zYn0wWlVIkZE7AHxGIBCUxK3Fr1YPUMq6K9b1EyU6c7mHq/t0
	pLZuNQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79750386c59so23773137.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388804; x=1789993604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=;
        b=ZYeoqkD/SiTCs8+Tkat3XxVtRA2b9IXgSBLNzUIl4TndOfbGty7A+60+iEVjsy5IDW
         jvnNGV/LjfunoTk8Ti0fZ0Rh29gR3qanBbWcfKmkzXbXSSGPtqHbKqhdx0tPwWE29Crt
         iGvDS5y+cOl9ghhaVmUOi9m5W4u+cyfMGNQdbro+c68/+My9Y7mMeCe8nEhwLTAPMY0b
         Jtpoq6zuhy81buXC4PPVMygKFB35YdoupxTdUs6fHa6sUfIn0/eQX7o3iZwWeUEtakJC
         rrQxa0CFJZw6LfY1ACA09+sKJzy4WyEXINipoz3NnbUeY8d+guYCel8ysfVh6FfHh8+M
         g1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388804; x=1789993604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=;
        b=if8PveUmErtEdoDhEr1Fs6GW/tg7w5BzseNJdGQogB7qHAWIdSnVbYa6Glx9zVCbeb
         iD17SAaDmwz1Q0PQwSw4L0VY9T637xBNXZ47RqV8oYO0KQhtReA2K9kl4o7yLmYQk3O0
         6N8FkuRfpj+8c6Lu8F+YnTLanj+aRHaGR3pkrg03skmZnH9UXlbjF1wzunUxlcc5gPnh
         Z1UMdxT5UGv/8IyQGwOSv4YB45SuKv71q1x8AGppTXqv5gHNd8pcWZuJkyfeuxzaYGh7
         0TiPaHBgSXoYGX2q361oUYzyEt7V7jvx6uSyawQAl9tMU7JYbD/q0LXlmOInhyKdBIB4
         fR8g==
X-Forwarded-Encrypted: i=1; AKwUvByV6xLMF6S8l2FaMTBD/J+TPYkDMe8XHAsNoA0f/TJy7bmXUELhCqRoRp2jWLAEFwzGkT3cRtEg95kx@vger.kernel.org
X-Gm-Message-State: AFuF++kvakoaxgW7CzhE3tz9ppKPT+S4mp6mG6IN7V1qJkjvLiQ10CxP
	/9gL7kpJ9xGm+9e5h///GlkjPp0Y/75Z4uCp2Q5G1e0S5cORAtmy7ZwcvnSSv0bUtr5GBGDWVVF
	ts19Tp+lBmRqUvliomEyQqEiVvu+l/KXR2Pffdh1RIV8yf8PUuT4bf10Vv4ktwBv6
X-Gm-Gg: AYBFou2T2jINLxhoBQkpPKpWF2v7SWRSVj7lXg83jPuuBsjL2hEThsNqtKT8vPBDiW3
	0GnWYqcIlOp/0uj6UHlUHRZXEQN8RjFiUkCG8AMFfIQo8y42ClF779dZKQgLefivmqR66ysguYy
	yzofm2pMBwgsL0V57fHRbLyuZyME4I0QRzWWaI/Pw3TjmmcP5HnT+ZHpcHKNHTpOSeaaOOtrWjc
	M9BmGUZoe7vuxStW75POr80c6pEG8wqjbnMPj4dqF94c4YvmpOVfaPBZJgn6Rf2UMltyH9v/FXN
	zlONDqMInfZTAqUcPJzd5d8omM7VlpjjPqhZev8wcHA+CvYhqF7N7bDTDDyI9M61AhAi4wghldW
	jGzS1nGKrZAsKJVT0QBuqOQ==
X-Received: by 2002:a05:6102:c54:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-79b5b676f93mr331162137.1.1789388804549;
        Mon, 14 Sep 2026 05:26:44 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-79b5b676f93mr331102137.1.1789388799225;
        Mon, 14 Sep 2026 05:26:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:38 -0700 (PDT)
Message-ID: <550e3704-ff44-43ce-aa0a-2a1a0727773b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/31] arm64: dts: qcom: sm8650: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LmoAmy0JbUvmKo7o_3FjAuklaEnEgbof
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX84C+2H4Bo4Ev
 bWDuNCVFvrX6TYeFzmdHonRv9s4hXhrKm1yIEQ/SyfvrHvWqXUNQUc6yhlAYVDGnpcRhxM3wlcW
 U2eO8YdPN6Ekdl6xygMqg10jKv44vcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX9cMczGWXB96d
 Zn2FJCAJSDZFV7DY7UNMsfmbx5s2kPYwh6m/yFQaHZ1hK2UCHqp3AnT1G5bHeQiOyCCVLNYAzg4
 DCqSn6EpLjTYiWgVVj4blyGUHrcaBWb8H4Nku8ji2sMxAFRRkObbTD72GbOS+biTflV6nklcdSP
 +trC/t4eqshVJGJnQPPrE35n3wN6UqORmdsyDdfkwXQdeMfhtIiQWzTnP6cpP8I+4iv8d/SSrpC
 G+ZasGSE7djGo9qY7XLVOllkReN40Xc3qcCrxOoe8NGwh6kKMyU16xpFBD/n/nV5QELJoLL3D2i
 B3JfACgLmZ3Y7tWXoHP0v0wW3WwmLkxvZGnyPDaHrDAbpY1WwvHhP2DvJdyDiVctbRkI7aKeu/D
 kgdqRzqgwlVUJsVuORUYNNlgxQs7FX+IY/8GgyWSelxwww6s5vgLUXFIfiP0va0qORHsGvMSznw
 NTJy3ewKiXTeiUtmQCQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e805 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: LmoAmy0JbUvmKo7o_3FjAuklaEnEgbof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
