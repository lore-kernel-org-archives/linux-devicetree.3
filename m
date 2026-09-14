Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B6846C821
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389062; cv=none; b=p3LLa6FU+klKNQxGheQqKwhhgccR2q+LS9x2jL1XxxX8iucW9ttVy/ouZ84eBaOP2Piqaht50yFBvI8w95Px2BNPb+VxwdY5v9DXN2YIRoBCnnLKwMVJrXzjadZXpIuXY8J38/oQbOLJG/rnwf5LPCkLeewThwv09S+/bhVPTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389062; c=relaxed/simple;
	bh=4KMlHwFQQyRLI90XZ+lD7GxY4U8Fg6eWl2hPAl1Uhu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDbfaaWSJE+nQ7oTPvmdtlTQMcchvbSwKDIHwNWshfLvwS4roFzhTjd4hj6y54/yGNDjPNNp5kXu0lJGIyWIU+5wOefLX8HOGREgng2aM+M8vGFsxnnPhTVC88vsaAkQjk8WgKULjRfuxgulCSUTnUISyAUU17Aslu2DEV5CPaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZnAppl9X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBho2sOZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZnAppl9X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBho2sOZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRHl0406865
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGUo9Meu4HFS0XWi5GZylJInbwusqwOZ5wQiv+wpt90=; b=ZnAppl9XmQjv1s2k
	Gp1uAgkSKc3+UuUSdYG3yAY6q7VXe9qP2g7C6LLsW9KWYGQ2dld6WpHgpbiyK4Pa
	6t5dOjRbozbA9JkReZiBFAYxxdsy1sRN8JSJw28d/64te9j/J/5jOyjsFEy+v0q0
	UFCpw/wMDYhmxthywTwBTnQ9vNaZFD5XO7i+SQS4yIhCvA0moc886GLn2hz3zJkP
	Z87cf5ireWvkUdxD6AdQZ2iU/bLSMTTz/p9D9XmIl09V1Q7LfmsWhpgTNkqtnpjk
	z00sqzD5bmf+n3SDHokdU3xB/qerUMHnvUJuBsH2FkbzVdf6+CtG4nzjo/zBquxt
	YbzeFA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr67w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:30:54 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97f18b9d6feso41957241.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789389048; x=1789993848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGUo9Meu4HFS0XWi5GZylJInbwusqwOZ5wQiv+wpt90=;
        b=SBho2sOZ0+5xaz0WmNJB2p0y/nIDavFovU7VPgL/erI4sC4ctHKvY8K+gj6s0Z9YCq
         igKXU6+8UlaF3ZxvJAdES1PqHq44GP3Gpd62E2GLiS7+5i5B8TVj0dHC9Dpn6h3sbFup
         d+HD5blXOl7clFqbj11DZMH1PZM9PLvovbGzZcyfdXf+cwwLz9WXWdeZ/DR+MhawRTzN
         BREp0jJWWNgBefA6gr7JBd1YlkHT1DHaeWorBJJuUplMg7WHPkFwWcI2Bv8YUSVco6cZ
         SqJ41/jGLx1MWzctfaSv1Rx0h/xFexNZUgrss/qg5ixH7GsnKV56VEKjxzQbZ/dlRzkj
         5BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389048; x=1789993848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGUo9Meu4HFS0XWi5GZylJInbwusqwOZ5wQiv+wpt90=;
        b=sa8GcN3a/M57zITpzvBtRiWzfSomxD1wf/5Z6ZMts/yRzS1MpIQPR6durKJQgPkr7U
         n0fQePBxpwd2Q9nZC4X4LWlkMEX62WegzNTuexb4klF1JDRNugkdXXKSUEuN7+0EL9mc
         lSPqzuxIw1Pg1LZLMfd8BgFIoNrvXVEPmxrBkcjMQ9jhEHxffyC9A+FbaVl2oFpjIkIN
         gB9k3X9cUltH1xXlz5kYKQxVuXFsxuEWjystzzEi9XwYFhLeDlAnj/CU95GCtpN2SUr5
         LpLGNX5aoKpcpskVLVkUVHT+eayqZoighEJtBSGvqWr7iPmAo4Mx/ay74WsLNeH1pKCN
         BTDg==
X-Forwarded-Encrypted: i=1; AKwUvBydeo6jxF/vFO6s+iFQmm248VHDCYOHo0wydPAyNS+dHSI+Ek2KtYGq9jkPM7injIZPBLiB18dROLs9@vger.kernel.org
X-Gm-Message-State: AFuF++mB4df8hFWhQuy3eA1JVdR9tTVrpaZQlxjHL6bdfW5fd7DyAFhD
	75Vlnr+uNJwdfaICDlLJp5ayr5nXg7C4X6I2/tk9LTS/pKU+zYjU9NoQ3tph0p+1qdf0Br5X7dx
	sTL3e55VKVkIHw7DEInYfHrwJD+D2PD7BqH6molj3+4aY2NpjsqhpotFQ+o3E41Vj
X-Gm-Gg: AYBFou1HB1YQE82E7LXkX0O0vZAuwDe09Jd4M8h512Y1IF/4qFqnp3JYTlGb8HJG0kW
	WsXZ3ohHrpH9mk0dXBxEVWI5p8JSS5HKGnVhyOglvmVUcyKlXSicC0R8nN5DcR7VuDxoEel7O0a
	BKyGsaSm1p1A4pww97IkuZXg7chU+/okAg1fB4TNMDuCDiP/4JkYHqtLmP806z4MrPPSgCIPbXt
	TeM6so+ZypBJUDLMBH89gc7HLukLGyL8I9IuO3mNZQ7Wf6PcqpxSir4pRH24P7KDvIXuGek3Raf
	sZXgt3LH1DsVEzolhJ5L7Od/OVNNCB5hEkgA8WyLzbnEaqxhRlW14B/b/gEpXtncG2VfxDQA64U
	vHyVMmHnRZkytAFx/cb/RwQ==
X-Received: by 2002:a05:6102:11:b0:79b:b389:d6d7 with SMTP id ada2fe7eead31-79bb3a8603emr245670137.2.1789389048523;
        Mon, 14 Sep 2026 05:30:48 -0700 (PDT)
X-Received: by 2002:a05:6102:11:b0:79b:b389:d6d7 with SMTP id ada2fe7eead31-79bb3a8603emr245658137.2.1789389048060;
        Mon, 14 Sep 2026 05:30:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456bbesm2368480e87.22.2026.09.14.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:30:47 -0700 (PDT)
Message-ID: <d83450cf-715d-426d-aa65-6a9c57de45ab@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:30:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/31] Add domain idle state names
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZOqEHKQOUumna2SA7EzO9bsy5r8eF07w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3OCBTYWx0ZWRfX7TSCNdf6LVmm
 ZHY0FkVPNrcS29d1LJFpiGgOHUg43GzjU/9QYwcqu/TbnTUCTKwV8bT/iAb11mrQ/svei/un3OH
 yr63zYJPLEXUPDhD9AvB7xYygboTg0TzHFij3u7e35Vf3xIKsxLwnA4ylHL9vzPd6Sp5ol3u22g
 Nvr8Ok+ID6MHa+h1VLX08ppo2eGiYbO9/HAdTTCD6sLAIxli7C/tEp3b5MCOfx1eES2u1oHoobU
 cJghTT038YxeWb402KOD9TO5O+Z6Ll9ary0K4AvjzubfB/6AQ8hnRgouMis1qFMW868/s/ZCEcb
 /QfVkUsCoqy41JJe/XT4DjazAk5Ww2BVuwQK8Lkbv+9YtEeb9b2yAThsKHlCfqmZF/2+OOvxooB
 497KDvPoqSmw3nkJgtpRzLoJ/lwNHMSeXy2Jgf/zqvPv8+9OlG25sC46fXTUybUSosD6sMeKZJa
 ylvSoWZWnV112OdeAFA==
X-Proofpoint-GUID: ZOqEHKQOUumna2SA7EzO9bsy5r8eF07w
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e8fe cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=5S0Yd9-XfeUnBg4NLNYA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3OCBTYWx0ZWRfX0EkHpxxdozvQ
 IQZLbl+zodqQqdiuD2Hh7aCo2qnLAskkWWSznhVKy1wS6/WmQ8okdp79QYuaSDw4Zj6Jp/9+0vP
 ciRupw8H9tFZCve0VDvADLxWNdfWiWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140178

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add or update idle-state-name properties for Qualcomm CPU and domain idle
> states.
> 
> The generic cpuidle parser can fall back to the DT node name for CPU idle
> state descriptions, but genpd domain idle states do not get an implicit
> fallback name. Without an idle-state-name property, those genpd states are
> shown as N/A in debugfs.
> 
> For example, before this change a platform may show:
> 
>   # cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states_desc
>   State  Latency(us)  Residency(us)  Name
>   S0     5790         6118           N/A
> 
> With an idle-state-name property in DT, the same state is reported with a
> proper low power mode name:
> 
>   # cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states_desc
>   State  Latency(us)  Residency(us)  Name
>   S0     5800         6118           l3-pc

I left a r-b on most patches, but I have some comments that you may
take into account (and still retain them)

> Describe the affected low power modes explicitly so the CPU and domain idle
> states are reported consistently across Qualcomm platforms. Shorten
> existing power-collapse and power-down names to use pc.

This seems mildly useful.. I know that PC stands for Power Collapse,
but for most other people that's Program Counter or Personal Computer..

And the llcc-off (or l2-xxx) states should be more descriptive to say
what other implications entering this state has (the name does not
make that obvious in isolation)

Konrad
