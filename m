Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C68367283
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871283; cv=none; b=Iy2Xax/8UhmB86M2IH7GyCrYrNG1Tf97GRJsm9LMbGk3CuKe0eV3XOop9kvJIVSSG0acYGR/QZoau8nxK+5dTODrLanSqwdKUTT1vWeVyDcODjQuq/WPXQ2hL413DZt4dbalUPwCW0X/XzRqzyrNi9S2f2m0yEk64LkhAAmvJmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871283; c=relaxed/simple;
	bh=gmlc2x3Sx9TTXS2SnEsXIeKsBRFp3YpvrWD1xNAK2HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLv97m0BrS7S+kcTu5iYiGGm/gsZz8Ssfbu5F9tVieXpsMlsYYfCR5vtEjTBcUtuNGcRo8IiqbOuRQifUHnaRGiu1Evp5arKpc8EAPvC+rnPtjSzK9d4VswdQLXNtNIU5wg1D3I7qlg1/ygCakNHspP2xKM3C5IgdFe524Mqbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2+p+fQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkC0SvdX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2+p+fQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkC0SvdX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7R840082229
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YB5TdQQBRKdo3NZtG8wlUHn81r0WZQz2AuX2RuLMVLU=; b=n2+p+fQ4wCRjumLr
	9veJ7nFFJGeEtOdWgOFs1ybRBss+PDVGhQEGMHlenqzHC7hEbextHucdEabVTKPO
	UOtTPWPbi8QjLPE501VmZkFaTl2Q75ETZrOeKQdZM0z+YDRG0p6qRc1ICku8bEXd
	PvIxR6mt1kAiFrA2poopOGmsCvcn0Uzt8gjd3SzeGVsXgCsDgmbUgdMzKBi1PVne
	LtXdnX00ovAhka7v5I+VbhEbQfaLeUimLF4RoP0o0sNnHhfS8HoQj6pnpt23f/o5
	GTiLs61/miBQehGAdMak3r/Zw6Co1CEX41JdKufLNRgMkPQSvidbyCCyVOHRdnpr
	F9LEpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtjbhct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:14:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517bdeceb54so4693441cf.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781871277; x=1782476077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB5TdQQBRKdo3NZtG8wlUHn81r0WZQz2AuX2RuLMVLU=;
        b=TkC0SvdXMnxdbJ7qh05Ekxyl99PsAU1gkNU54/1uBRpDtcA0R622RyEy16xgoJTToi
         yuGiZmTg+9zExR6YMYfJzFIG9MEgt5muZnHiy8ORukw51uhLWVMpb+NANPM9STdY224Z
         ZWsYeBLbMOnpBI6ztwNvk2ealERPtpi9nHMXgeY6lKfbeEBDcpX3PzuZQPFm7rgmRv5d
         fTedEnXAj2X9mVgDmp2snoFa2QnoBmwuAollcrvKlT7bXP5zqCxF4UzV50hclZIT1MUx
         C9AIV3va97s1SVtdNrLIhH3NmesRvwgGcmakP3NhsINxjYAnXGJGBQIaoDkF2d7RP3LM
         uA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871277; x=1782476077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YB5TdQQBRKdo3NZtG8wlUHn81r0WZQz2AuX2RuLMVLU=;
        b=KF+bQ+i6sWD9bX3z7P02ryKDVolMIvlongkrkwUhA5LDACX6zDXSIS09PKZNilHy3I
         bLVkB4iVlcBl4200FlvAZ2ApS5IOw/0ue5zAxkuA7wJyS2OXBjeoWIg1bsUBx365rx2Z
         LPGxV4OUGdyQupLbGbEGR/TUmAZzX01L/hgEHLWDKo4m60SRazGzMNlIw/cWJ/E+s8Ad
         p1KkaKnV+/7y0FSxpyllpKKHnc7mAfdMAVUOV0Y2VD05eQAQzh1jcXPVXqrTxcIM+kZq
         lTAPrnja1r6Dx+XTA0wXuYR6KPIZls/Jy5TeGQqREafou0NmJDqNi7V++IHIp69isuWx
         BhkA==
X-Forwarded-Encrypted: i=1; AFNElJ/edeIO7/foNtLMXM0KtVcHKx9LWAQNBKVxMTnLtE0flYZ7sBSFJDNHwZD1NJsgeS+eSXy6q7Vivy+d@vger.kernel.org
X-Gm-Message-State: AOJu0YywEM4As//KCr/vYQ2l/fv6D2revAqqDj6z9e0g1g0cUkKJR6zU
	0GNjA/uYpcHHpNFZhdiLarSQtJd0a0UKHG+kqC1BhsaUC1Vh1u5dA8FI1W5Og8vYNJqXf3iKm5I
	7UIEkVrzpBQY2vVuoXD8nQs8r5b/LSiO4A9o+Goc0mrd5jRQohJpFx+rO+4nr+5QN
X-Gm-Gg: AfdE7claeYeLGVEiNga63xRMlVp/4xy2FG1nkNFFpgHdIrDhzYA40NIWsw68Z8XHtxX
	5HHc133u1cXLvU5ACf4xX+GoxXgZExiyYkgmev7HuRbzQ7F/knG9Z10NlzlC+tZtanXgQjiYM9t
	RzGZ020Rmen57ufAVpzd0tvWXof7iEdSDMR8qCtHsanQ1Gq5+NjzZY2B76VhJTknn/nC4KPrh3H
	YBiVLqpX+eAaOjMXdlQVcDyB5FVxR3FuzHhuq7F4QtS8VnM0ytcKYVnEIfvFoaglut1T9PJRkKC
	vSU2NhJsLn36LXstmxpaDqZBHAQ9vjvwSLG56vH3MB90wYuukeBZDsvy2LM+0huP44jRHYX8Msk
	mkjo6Q6iVH3EfR3NUtw+lmH8Pt+rtgZnxMl4=
X-Received: by 2002:a05:622a:41:b0:517:8999:6c50 with SMTP id d75a77b69052e-519fef5752amr3187571cf.8.1781871276940;
        Fri, 19 Jun 2026 05:14:36 -0700 (PDT)
X-Received: by 2002:a05:622a:41:b0:517:8999:6c50 with SMTP id d75a77b69052e-519fef5752amr3186881cf.8.1781871276235;
        Fri, 19 Jun 2026 05:14:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc880cesm855827a12.8.2026.06.19.05.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:14:34 -0700 (PDT)
Message-ID: <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:14:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
 <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfX9nIBm7jIpCBm
 1qYnmMI6ixoGdR5SgaBFYMv5caGG82o3H756aJdGyMWDUV6aUmSMJLTnQX2jh1QRXtTHC1DFJdm
 fwgn+P1azucNL1dLvrDW31eBBIOYdXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfXyWoqlslEs8S/
 cHukRBerGM1oVIOQaGXplFGPd8CXurSTdbbXu0gAuDPH4vdu4+Rztg5L96eIPkOxNZeZ8T2zV9K
 q3uZ80v2FvKvi25rnkA1sWcyEUb9fWZV8WdUyHCCmijtF9aQiqH0IbFmxXrUSDRQEP0r5zfOu7b
 WZ0J1L8BPOs+pMCXCJEvpyQ6Bl6Te2XIKDBtmM1tqRY8h6r5UptmlI1Y1qLsgIy/6wnWCfwm+wJ
 dl9rNOFahrykReFbhWm2S2NOiupAZkFW0f8lwIh4mTwWjH4t7e4JeDhIyWKyNMG0yPojOoVUBNr
 XIAkXhBvEQnYgRMRhtmlvAmafk6m3vEfHoXJHfdhQXq74EGfjkIzmDV7+FfI1JOZrVWFtGQLX12
 fXg80F6ldU+pNFhUqoLxpkzfqt/qVQh545HzbrxVx/1xLS+fNeK/lrROHjByyhS2WZpNTNGlNCF
 j1xif7wGa6DnUNBkenA==
X-Proofpoint-GUID: ET5IWb1xFnrZe5-Ea6tcvbllUwnJkvIT
X-Proofpoint-ORIG-GUID: ET5IWb1xFnrZe5-Ea6tcvbllUwnJkvIT
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a3532ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JThlKoFKImu4mk-f7WUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190114

On 6/19/26 8:45 AM, Sachin Gupta wrote:
> 
> 
> On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
>> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>
>>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>>> the die temperature, and when there is a level 1 upper threshold
>>> violation, it receives an interrupt over spmi. The driver reads
>>> the fault status register and notifies thermal accordingly.
>>>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>> ---

[...]

>>> +    /*
>>> +     * Configure the last_temp one degree higher, to ensure the
>>> +     * violated temp is returned to thermal framework when it reads
>>> +     * temperature for the first time after the violation happens.
>>> +     * This is needed to account for the inaccuracy in the conversion
>>> +     * formula used which leads to the thermal framework setting back
>>> +     * the same thresholds in case the temperature it reads does not
>>> +     * show violation.
>>> +     */
>>> +    chip->last_temp = temp + MBG_TEMP_CONSTANT;
>>
>> Will this work fine if the user tries to set the max temp supported
>> by the hardware (i.e. is there headroom for max+1)?
>>
> 
> In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted trips (strictly below max), there is headroom for the +1C adjustment.

You check for `temp < MBG_MAX_SUPPORTED_TEMP` and there's:

#define MBG_MAX_SUPPORTED_TEMP 160000,

so passing temp=159999 is "valid" and after the addition it becomes 160999,
which in my understanding is outside the range

Konrad
