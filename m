Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A427281D
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546473; cv=none; b=HmzDH/5pn4nZgiWK9NLggKWjDV4/tMK33mMJE67O6+UB8B9+sQMBNIH843pbJvS+gV5wNOSqQiGp4a3Z2Yj5oRINizXE+5pGg3Z+wjXTLzO9X6psXR0jQPLs46VAUv0R6MmdBznWkxBA9LhqJrbXD39NoCjIZEEnEsKq3fyvlvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546473; c=relaxed/simple;
	bh=NiGIsc7+2BG9Ag9y3ftpDM4w1lYngC9h5iIud/W5nAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9RME+e68libVRIJp4XJQ96+eYI4k30pbvtJTtPR4yhZSmqDb6rFIcek3baOim3FxfGgBaZf8lFWku6ObDXEpUYUufPyU5HV4Y7dBe6aHvEwbPhygxnDKzly+yd6G8HohECBi7dTJwg9V7M4EwDPMRd4Ux2lcJbOhK3mJq4WhyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+wX++2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vu/YtEYJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+wX++2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu/YtEYJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UA5mNe3729473
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=; b=g+wX++2sRsPI55ef
	GBVjeOGFlzHmNokT2GEZzxno+pNQ8Fn5VsAA9bd5S5nmCyc8e+aJY+oVBinzPl27
	fJwa9PlB3jt15/9wc+94ryDK0lalNl8ofgdg8J3ESgnY5mN/c7JVKbNJ0NbN4d1f
	1yQ+hJaSfAaRSyRjSdRKO409lOMZk7syAaokmoj/7gwTmYc73kxNEcK1fYkTcQwH
	HHqTzrC35ykQYO97Nms9pcJVOMS18LmKb3kcsD5z/OuKU+QzSaF8Z4ouixDAst/q
	si56y2gLKz5BEpei7AOUK3IXfDrHR5oL2ymvabNJEGWr5Ti/Vj0IYtpAEXDP6IGQ
	OYWsng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w9n2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:54:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so16974485a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777546455; x=1778151255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=;
        b=Vu/YtEYJXwTR9WPd9KUV98J5qekPNzU2r+STjbP8T/0w93oNi6iTcmZIsdx5VF0Zwc
         +cDYQrvV4/9Ag9meTXp70BHZROhsWGrSdvsvQJ40/xwOKHY812bV5/eJf5+tTfaifOIv
         K6xa0UMG3K+XZWcjcyTVWMM7vX+a3URhS1OLFcfzWJPBcVbI3BvC/zFuL+WEUHYM7yJc
         oRBTWY5tAXGz+1XJWfQhCViwfiCZE7HTZktxBkzClZNXyc6i11mHR5Q5CC2w9v7SUODm
         D9ubudzto7sJzJKRxsyJqE9yAkqPrCbeXT2HfBp0yHwZcl+TLBSYFEzHD1ykURQk9yES
         RNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546455; x=1778151255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EDKwO1UG1K0QkJS89ldvgWnbt8po5vsN8CULEuSTRo=;
        b=A+DV/nSZ9iykidCMhEBGqZpxU3mumuogrJbrvk4gzp7b3IAM4TSQaNRjhpyktlPI1/
         op+MV/LlqGEV2JzRUge8YNb0mm2UgtI0Z+ir58bab2SfOHhhfwg4IXAka9Zdam8jaTyI
         jFweaJ13q5UGLYYRAnfXpbbEmd1zx9JaMSi47aovwdJOhgzuWdfsZg3vjkKLZUC8W9VF
         LhK5d/DSFx5TLeia8p336+9cRFHiWsR4R2AI4Rtzf+MZ+44eWYeb/HeCiGr6T19HWEC0
         73QRN8TJCwPG1zayFC6kmlHZJsxf99HMAvosxpUKAeOqq/NGXDuC5PA7XdRGSTiZCoDn
         P/jg==
X-Forwarded-Encrypted: i=1; AFNElJ8tU4q9YNn4j0p2SVZjdEg+kXug8EDMIUfVXYwrfxwNzLR9/SJ+JBwUXE8NYCpzys3R30ONVMPfhpwh@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0yOpxnXJ6O0xR38cbNBxnMe5ECkyoO6d63zCYrn2cZaGVvMD
	UNdObSrV+Ei5SNPB+4RpPw6z9SCIAAlYUlRvLauOZMdsQotF6pPh8W3YRVd1R2Dkx5ojEkV64PB
	WCwbU+M0SE7Vcv9yN1i3JgPhkDdelr1prq9muGj+S00y7uKneJbg6RcHg51Ivo0+L
X-Gm-Gg: AeBDietzI0DW+tZAvotLZTOqxs8T4uh+Ma2hOHl00dtXedv/mmx2vypZDBHmBZYTBqm
	oB/omlWViyaUj4ItwLxyiEg7p1F2Eur/2r3BfRvPnj7VIadpiOds3Xbgoou5JPbCYtujmc5gAMX
	AttnYmi2vk0oL3CL0m4ozfpOUKn2qUxTeMbqtPOy9YdYTpLo45mGKnxcGLoYBgAX6SZU+W4Zit8
	qxY4Re8BwUzHBo8GcosR/k/c6HWMd67tPvmr92S1M786OEPvqZzRC7yIjzR0MqbxA4GntsBhzWv
	kREetlCDVtFfY43iTvimSVoUGGyy2pyTgHFdGwWJpt2OcLUAlOomZhbOLuda8gKDUvhdNFCETPl
	Qq+6iGcb3jq3LlCfp5HWwY3OQ4Gn6lefFcZdoksNQv7sHpVfX3K9Immj9jasoxRMJXVOo1n69CS
	iYU9kSaL4PHVzHgw==
X-Received: by 2002:a05:620a:444a:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8fa88a4341dmr240220185a.5.1777546454635;
        Thu, 30 Apr 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8fa88a4341dmr240217685a.5.1777546454135;
        Thu, 30 Apr 2026 03:54:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b220d0656sm1771099a12.11.2026.04.30.03.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:54:12 -0700 (PDT)
Message-ID: <bf1e9880-745e-4c7b-bfde-3c5ac39175fc@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 12:54:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yPGhCRAEXeLhp9RExJX3zQCmpUYowheQ
X-Proofpoint-ORIG-GUID: yPGhCRAEXeLhp9RExJX3zQCmpUYowheQ
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f334e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JYc5Ya0DD96nsJLtuCAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExMCBTYWx0ZWRfX9cAXOETqaj4X
 gqoce2NJIdudjOJGyThkIDIdrVeAVTrE6Onggc8C4SZNkoBFQA4xR/Yz4bYKjCwTs3iSaBQgCDm
 L4jNQZim4w0oBokxAqmawYf19u8UGQRvbTT7zRdGyIHH4hFKrorGlomUVlcSQDletuLz8TaQX6L
 cQs8SQYUMSLXArp4cKndf62FCoybOcd4yFlq4JCPXI5df8pvkIhx4LLeGVezmg2rhLBS6V6llXN
 JEATfJpnUHajUV7s1Lcvycct1OKh5z/PE2Cm4mbKgf0DUAv6LqZKvDl7ebvG5Tr1jTEowTrlyve
 mDtUpWtTyQjYUBcOXCosyT1MaV4aseMB6G/Qh39aAaxLNN5DZuhKFAzgyAEZZEukrTyK9m1sCdu
 2guzeBFbypqBXPAWmf4ZwoIQ8+BmZIlM6psTbeJO7wYt8GbUwZNsQehqvlkT3xU0kqJDDOjxMMV
 CIcyZeEjlQ+6ST+LgGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300110

On 4/30/26 6:06 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 4/29/2026 6:41 PM, Komal Bajaj wrote:
>> Add pinctrl driver for TLMM block found in Shikra SoC.

[...]


>> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
>> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},
> 
> It would be better to have spacing before/after brackets inline with other pinctrl drivers.
> {1, 9}, should be { 1, 9 }.

If that's also something that the generator takes care of, let's fix
it there too

Konrad
