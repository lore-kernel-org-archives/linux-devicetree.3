Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421581;
	b=Bk0ODFMSKU3/Gu9k+HdLg3FKOAGHayUi+x4BfoIhr1U2QxfhcjuHo9xrYdUI1ySNk2e8
	 lBbSkSpP22A0unPwiavos2Old82ZJXUnBYlxRkUlgE8o81tEuMr1CuRo8KUvhT3/oUuod
	 IkaIg2OOMNInsSQMi1tvFKpnZTCID8ZtyLQNWM0C9fjWSnfIe7mywLFZfvOueEilFdiFv
	 MiRvSo9Oj/xV/hPyoOdfFoWlLDu4WpIqS1jEMvKWDvTWL2g1vDkUB9LeQdbu7CTzitJYs
	 yGvN5ITS1C0G2BDoButJJMxfKXCEluKOdn47hILNSMHCyfRaduvhl7JV3dV7ZEd1MXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421581;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
	b=XK6Gib+g7XfyJWX06VYHgoj2Ybj5+YH5Y2vpTE03ydbB6CrvbkP7leDzvbcXCtPXMu/g
	 i7S1RQmAx8ATg+VnAjPLCJYYR+PaPvfMD3qnEHksZbqb/qcksQOIHZgDWDODibOBEm83H
	 TmY5BQ86isbGKghKmTo6DEXeU9ZN9fwWOs6sRwoThyWlK+CpWSgC4VaUEW9KVJG2rzAbB
	 wEDgh1CS4TMASOZjng+FnCqtTdjM5gG3/ttW9nNQE1HVoTalTT6NKQoTHDrzhLASyb84G
	 qnrazjDkqsU7Jgw1QkHKW9UXFnXnJysMGQIuWMogN1RCT+vLyLPM/OmC06yAxGs/f0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDD6606AAC7
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72724D3BEA
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421581; cv=none; b=Ketf0L0zUlYSbbTHXQRn030DL9tFfkLRCLq/zN5tNPzTuxYTVJ5WLJhu6+pMFpm63BEoszjFAPm95ZlgDEOzSmBSgAL4gaQvyNdnFAWtNkmzz/WMON5cwzWAp6niL4ELwkUJ0C3JctBGULa/+1tNITxvNYmQLfcy8QA04ATvFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421581; c=relaxed/simple;
	bh=Q8ELXF6LLbtqADEm3zzC52Pu10rc3XpBpK4nD5ZwOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB7APtzZWCs1XD527Dpr9cP01uvd5ujOBsAPL6ksKHtipqSlsHGUY4L2N4NpJDgXuly9Ji1kHWay4ylGdMth+9YARbLGPzSC+ZFUmzsEp4WVrcdTqb5bKkyMzzdMbz2JFlOyiYrIiZ5qMGQvRTtNiom5TaeGTrooqWR3rkgYlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pptyslek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP+22tCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0hZi1904087
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=; b=Pptyslek4ttLiH5m
	QQHolh96lkqa5dPpnl2zIbUN3kvq6bimL1s4DNm1dlnyH/0sZcX4KF+RHNiH1m1j
	rUusEkRTyh3ZrSGbYObcBDDDiYINkGr/ciZ47ih2biuwHBVgJMtTpCbJi/OZIz8e
	g7YFqFwIkJqlHbzwVxk5EnaEdH86nUgvSWNKjVC7U+u84ffDstcwA7hiA7Jbuubg
	/DrgcdXgMkjFt7Nz32G1s6clnRTtgwtROq4IoIHIWizxKJVsXH1cAI97XZl8pYoF
	xVQqD7aiGnQaOcpq6kxo3XDpx4n0OfkZLv3JjD+jh/UpmkxtR0+J8ij+QYgb0mob
	6CkQOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9qgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:52:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so60063485a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421578; x=1793026378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=UP+22tCeXsHmvSoohOKJedsC+lnLk3AzOE0gsVg0VTMaftWiE9Jpchujxo5Q7RfhQ9
         1guYbcqKA0yjFJ4wx/2j8CPYQNO5XjPVX/kEz+Ac2hPhuxqnViWLIfEoENzcxYPGCUDl
         26tg6vAJXg7N4oGa6m5GQREDqfmQ1qAwA2oOt+ZvWTs5kNrXPIne/T/WNtsWKUWk7k/E
         2At610cfYw/qSTLuWvoVGeXNN3Sq4QLOW5a5HAm4WrD+vcptF3+ySpL6qbhlRNPU7JDx
         oLL2zFlj6QzEag3MhO2m7I3bfRKBS2EB/SIi0mar5dq90C8nPFsgazrB27RQYNXk2NVZ
         HQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421578; x=1793026378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=Av/JhrP9bsTolmHGbmFU1zdRJ5NW+6MGWJAjppklqMHh3jSYdfZJEMbCtaCNOeanX3
         iOv2dVVjy0IYSHvZRaRgTuofPQo5NRII189aqq5CLMXR5Jwd0/i9DzNqIg4t0ESkAw+s
         Fwg1huezkjwvCtqFRjb9ww9KI5LNi5nxqjSNokM3NZq1BM+Sly8JEugqfuXOGSeLDm35
         4OHZL9mIcOIdQ4lv+8TFTHNICc/U9Topg5lfwmpiBTcYunJH4PuU7lKOf3FCR6Z9PqeH
         QHeesE8PcWB3YjzDrww0gIw/OwikaxB0bTqJKezM8ixZY1OGgjgAAPAXI08nJpohQHEu
         jU/g==
X-Forwarded-Encrypted: i=1; AKwUvByisJ/881TM7vICsvidWMOwx8YfzCbdI/yEJ1C3jmSBXL2h0IcawreJVnoC4MZyR0qdOJjypxeXy3Ov@vger.kernel.org
X-Gm-Message-State: AFq9FYKmm+pS5F971p5CghS0C1koV4yOoL/lyPlWNHztHsaCQUJ64lx8
	oMjEiQRUqWY3aihjaM3LQj1gkJdJzQ+Hpn7wcGDWZbPawLemQn0OK8FzB4WuGkLSEz9YA5PB701
	B9sEcwtE6F6Ora7VTRLeVqktrI0eVmLpvo7TKKZlvFHpkiAjcoJ9lGCWll9k/hodF
X-Gm-Gg: AYBFou2Vmb5tT2Rh/5onQZKy3OGqQEwOQHtsPe2C8a9WKL8wzSPNUf9jIVWXAHfgHva
	o6AJNnvhpzB+F9EqUFm4qBZowlHyp0Lq5xdAhSFxQAaI0sngTkXHXOC4cRJdVuupeoyV3yKkKHy
	Vdq2VnQrXpMQ/OhxjOikBXxCUw/ITf95RqeG/XpWb7zPCYKhg5b5iT2dKYgZzWJZrJWMxyqc961
	/7WpsUiJ0f3eWbNikAdvH4pa/cVIaQ1Sf8L1tO8KaOBIC03Wp4R+x/Be2pkRYcW8O+3nH0ZN6vD
	a0aGDAibKOf9u5UOFz3l3XZ8ft4DiGxnOo6b3pGfl5Gh31RIdgKmQDobKdRVw7HW/MS/HMGePas
	dbjs7lp1m11VvADMK/THiXg==
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459384385a.6.1792421578059;
        Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459376185a.6.1792421577483;
        Mon, 19 Oct 2026 07:52:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:56 -0700 (PDT)
Message-ID: <a334b115-6fac-4417-b6da-fd0a2e5fc43d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:55 +0200
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
Subject: Re: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX/PTx0KUNOPlP
 Tpj5zgjyupLUls2Lm5dGM/IwQvXLT2dHm4jH4d98dMsUlWLhA6O/CLSfeNXZ/mzAzNKUWVGO8lH
 8sKHUTtd8EvKFelCKYBo+WJpKdYth8k=
X-Proofpoint-ORIG-GUID: FlrXWOQZXqyEBlDa2Qum-DLVryQw0TK2
X-Proofpoint-GUID: FlrXWOQZXqyEBlDa2Qum-DLVryQw0TK2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX/ztm8htbKUEJ
 0eXvm8Jl5dyrfRG+QQHQ/NtrCthDcdEiydg0JgACC2AgOi6gxVo6MtuM2lbO/bcZCWU1kB5p4xE
 tvLmMfqNoHvyYe0SL9wDnoIjZTl0LSEkHRW6ZWCoDgDG6A0x35KLJsNPY8rPH7fC9VLu4PIRo/W
 I+ivsO1oozwrx12+xJIG9mrFmqFrDuXtLWrSzwL5/hgoo9dBzCL/c1LMM+wNHvGCvtVGShGvEpr
 8clQzBQbWF1J5jIwCGCYV/RzyuUM+KH3S2ZPjsR16LKTNy3iGHOHoK84+GhA2vj7zoy8ML7Ghrk
 /5G66yrDj9xvNxsBCMKO46xu85fvs+5++8KDTNSoMqSg4TQWNv8fOIDhWh5kKx0LRuiyvcIOGxS
 HliAqmQuRZZsrHYB3GieKjwFrlyR8i/eFeJk/oq6vs1eGzgiXmAJfdo+zRP8U7xKdYJu9Yq90eo
 SGmAj9AKt2v7VrYDagQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62eca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
