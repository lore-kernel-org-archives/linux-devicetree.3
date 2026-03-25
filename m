Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC635A388
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420827; cv=none; b=t/Ia+jBTPW2DuKdK9qxilI154gMBYr+pR0Ek0xbqyY+/RYHOLNA62cIllwqY8P1uexSKh4tNMybAciqwOXkjz6iPW2H9Nv9iRFAV4Gz+xSHvbmU8kpPd7f+iQCVoltefaRQw5Q70z3YqSQlpzfwwF3vNpOziCIC27RLyZIvrszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420827; c=relaxed/simple;
	bh=ZHoopXar0siBkmA0gR71OcKMfxqsxGEaqo14KZd5qGQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wnw0/bpBa5pMfzYR7FNwD/EbiLpmAZfm0dnINhLxrpLY3gAmIh/dioW3At1bVPKIbt/eh8FBR1oWJeIz2MYLpBSeDmo/j/A+A/nEFkeIwTtbG1AlnDB0avAFxN4cd8z7gNKWUnjN4a0D586qWFOnLFxNNxGvSDZeMOrslTWA8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1RK9Ry/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMcu2yjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1RK9Ry/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMcu2yjW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4Ex5x989005
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXnTIakBJkyc+2R6oButNsRNGUqNe2dpEeXBojdHfNQ=; b=R1RK9Ry/mdJGpqGv
	l5zWjxZibnvDaauW8kv7SjVdD+EJi46sh47s+558S0QfgKEz3cqSFWdtfpdoGm7C
	DrPWZg+Xvru91kYgHCgvgxTg8qBgV8hlTyM6X2IdLqRklGmO388WVEKwmQVJHR4v
	nuVU+RedtKeuehFkst8q0rRRLdU7gD3asCANL+gWtesEm6tw5qeUlr/6eK/Hhx48
	9Mtpbi/u65qaBoucMl32TQQZqV9sVf/CoWaMQ6Z7OEZyCZ/qGTfe0qBRA6DjYQRO
	lHi+/tWoqis+lXJVu1ZRSpNfrkdZDoL6sKUWn006O6FRW+eX1fVKDv9QoFl8PJss
	KPFTtw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m3eev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:40:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso33535065ad.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774420825; x=1775025625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXnTIakBJkyc+2R6oButNsRNGUqNe2dpEeXBojdHfNQ=;
        b=FMcu2yjWwEtQC/dlsxdS1LQ16kPWlkb4Coqkh72KIyX00d0Yo3cVRq8LVVqrVN6NBx
         UKsdjsKyuKlJ95iZzNSReXR0ZX4JxwV7BBq8R7EW735jSdNZepayKY3tNldDo6HNf5lj
         UoxB80b/LIvKz4IH+89g8kp3F1cRCV4phRMGYBsFNcjLB1JEVx9z8LPFZtlfSrVknQoE
         7XeXmY8VzONo0aXy6eGT9qqL9ZSOQbzNg9DSl0UAyYwRFPsquujTsZrYwfOfRDcVbCM6
         Nt6Re4mOTjE3kLskgzhvMBMPd2InNOGKZl5K0ll7OdWqF0xTDUwSPxSr5l+aBPmUjmCs
         EkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420825; x=1775025625;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXnTIakBJkyc+2R6oButNsRNGUqNe2dpEeXBojdHfNQ=;
        b=Kn/x/03f/xjS8i97WGPam7acDEs2mAlQWYaGeBwShfeC0qFaXfL6XWH02OXY6T1Toa
         JCTveRI/4Mtc5t5mZxW7JWTUJHo67Sw5iRCK6fb+gtgMOhyqX0g2Z5GTexaBUBWRpLEQ
         jyGz0QLCMWtzX6ym2BzjmkCOPuHzlXmKLSUcD5ggNcRGz8j69Egbl8GyWnsaVgxYweyk
         p987LjUhu4Wk/j6lcL2Xa8RWp9JjTd64p1sMcgIOaf9rBAKYFLBBbhxM+ZkMW+yu7byj
         rquYHfmlurwS4y0PdIpEaU1iO54t1gIyOp6OzX7ZjfdZigsq6EmXCp6EKGD3iXAKj2xl
         bLxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSHFqRtNRipkc1LWmGpiOdD9xXaQDAJ8QqMH8EKeSKX4GwWF4mySNvv//uxuFlylihBXN39mamXqkJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hOwEKz2DpMIKBhua0rqJnLoDED+ZnBxu7gvfNY6HO1BHXQTo
	o0YtdtncfLpxDmAbB4YmvTwmWzn37DeT+7gu4/PKCGbga+C+y0MBDUCZ2nG628WoLXraZ95COnA
	NcVjDiwAfO/tfoLn+rR3PiqvGJ48P1Nq5neQUgA2SoZznmoBXdbAKqsYLaMhRTIA2
X-Gm-Gg: ATEYQzxaUlN7ice0ppH8HFFtlrbLdyP0z80TzbozlfTFVnhwR36lBtssiVYQ9NGyK4c
	p9vlB2Vqz3vX18HSdwHerOIO+OuCBzIpK/PdbekGGIbq5rUCCF+AkfcKIATR3hra1yDQo1cxPb3
	hAYqJ7ktiZOEw9KzF8ClNavn5lUHAKuT+S9Zkkun4wR3Vn7IUOGDnk6vUcZOfZJqqZcXop57lKU
	hDqq/104ScREc7YO30a1cbzCsoOFZ0iaXczGyV6Urz6vtHMTFoY4YrM/9rkIiLLMRGX/eeroyOF
	sbTV5Ml9Erql9sUrWAxRt929MX9LiZx6f9JhGMZTMv6/l0avXMOWvW3IVQtJTmeCHsrq/dHGMcP
	BB4GW3bhBro3lq9gIQ9/BW7Uvkc5UCGHesUQvfQdPJM7KeJV+zpxQIR+dGMCM5LXlWNkjZmgz+D
	iqRJgqL42r6Ik=
X-Received: by 2002:a17:903:198d:b0:2b0:ac1e:972e with SMTP id d9443c01a7336-2b0b0b1744dmr17052145ad.8.1774420825098;
        Tue, 24 Mar 2026 23:40:25 -0700 (PDT)
X-Received: by 2002:a17:903:198d:b0:2b0:ac1e:972e with SMTP id d9443c01a7336-2b0b0b1744dmr17051955ad.8.1774420824646;
        Tue, 24 Mar 2026 23:40:24 -0700 (PDT)
Received: from [10.133.33.49] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm215601545ad.60.2026.03.24.23.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 23:40:24 -0700 (PDT)
Message-ID: <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:40:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
Content-Language: en-US
In-Reply-To: <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c38359 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=joGeVZzZuIZVIFhqNwcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: nXpTGcmdsLkeD1lRIqXRNjhFro3qwOfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0NSBTYWx0ZWRfX1IcAayAIj+jz
 ie9+ONJ4Lf76N4Q17ETIAWbZKolPrttA0fP49NqWC7PF9Xmfmu/Nvr9GFup0wjycuVnfmeoigF4
 vicn6yqdOW5SUm3i4u720l5ZVtNIrtQr2tYKCU+xfKCFxgOxAOSbfxPIfODTJDX9LolwyN2XJ7y
 Mx7GO5rKA9dVEHsROMbt/HggK88sIy97frpQWppZtqCQ73Dnf/TGlKQ2ltW+jWPwM5aaTZ62fs9
 bvxOOH4lQDlCUTB9oVZEhSGgvpZzr3k6w/ZLiSn2s/AunLFPeLPsMl8AZmdq3qQ5YadjplB9mrW
 mCAFSiEP1etrT9hT2v1LvFrzbpOGZ9rxRH5Day1A/GI4LswEGo9Hu9qY+L8X8Zk/945AFqHXeGd
 9y5uOPnoilrijKozUT65GCOFgtzGZPj56vX1LiAxtfBUf77uS1PJCxCCQsgRienegsVztGBtJLF
 bg10HIk2hFzt82rAoiQ==
X-Proofpoint-GUID: nXpTGcmdsLkeD1lRIqXRNjhFro3qwOfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250045

On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>> +		pinctrl-names = "default";
>> +
>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> swctrl-gpios?

it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
the input pin is not used by power sequencing driver.
just give it some default configurations here.
