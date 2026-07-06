Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5280422554
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339151; cv=none; b=peU3BDILlnqHJ6RRmzcpZh50XOdg00s1EXwC2T7mOnba+aZCBPyCvgku+EaFVb7Rt9Fl+PbSj8XOExYG1BDjDCXfuKJcas5/FbIGYQ09ygaYsdNaI1Gw0BivCtoBkrZxC2lBOHQAyASt+fUXmUI8cy8hNl/tZslimSgpS7HrB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339151; c=relaxed/simple;
	bh=3/3NupMV0lpEENgIk+v8OcFOLiygURUAD6GMHrRKatM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfccSaWfpSDuhkKfxGe3nAgGSSaOu/LECDviR3jL5ZGpprZ7UP9KQUgknWcUgqNmuKDdb5FpW7QpDVWrXe71zucZQEy043Ctt6E+ts6nnc2MACLnHY7EjH+hm1waJ6RGGHSD50LPnP1AUev2d0sLLtgAdf2K+J3nbPjjCKfR2Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImHEXVpw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exZusrO7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImHEXVpw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exZusrO7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7ST245535
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=; b=ImHEXVpwZNkclAUP
	yNYErsS5u/DDuiMJAu9BDkRy0enCmK9d4vr8TejeYiCZJijalj3aJWFtZkM5NqXS
	5KuAkPepLzZ4nFyDF8xEtlFn8VRdYeC1TBEZ7hd57qzWEvo38FhndfF6jOJbZ/A5
	ek8KYgcJCLcmPahUgrxM3d/F/o3CQFVVy9Di9f7avaju6LBqMZmpHD7ej/ZHRjLN
	9ztUo9tYWJYEceKReD/U4KPlVJwLFWp7Bo71zOE4h0tbZJC3XdACGzsnmf3l10XO
	sDMxal/U+9wO1JlOJ/NuDONHRCAIz9oiJeDUoqO2z/ugYJjxiQTJ2BRjZ4NWs8+H
	+rsVQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gd86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:59:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c267931ebso19754331cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339147; x=1783943947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=;
        b=exZusrO7NqWgJVvCj3kSoGGEo56imm2gK7XcZLVBROTGKecYQUk3UnAYzuC48+Lxws
         qo6qzObL9569T3yoTAjPORkBu1xr6Mw9xvMU3eoV0FWyd96CjSJEFwgzRZzWCC9p86Wr
         m9UPR1GfT3LkocD+ItASUhiwm9W3RuzQwvR/HDdrwFNup6YSzPJwgN3/1fskv+bLJfiS
         1llniKS8Gr6tXIT19cUiTRxY8v2nw+ZndHI9E335lcDl73qE3t+sVH6RScsEYHVV9Uvn
         ZdOWPo3R2OK7aaS0yxWRK8fWcD9K2csO1kslrl3oMYqyUciUCwn09Zo2x1NAmoUHMrBA
         E5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339147; x=1783943947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=;
        b=R47Ak4sJWw5q7pGE9hebFP4kEOLR5osEnmfGpMGagH2na9lcdoPfcq72wNLEY2/1ng
         G4O3GDprRHzCerXqcKPOM8ogC4/AkMPhe5ri7sBbZ7WfyVLNOz9RunZfhr6Ql9HyAAf7
         f83f4MwBE3oUm9a5yRZ+6HjJbrGQkbTGWAU+god2+CzlSGbmutg4K5qAYCuH8/UMSzlx
         Mw9otLMY9f9MXOqL6SIcj1HW0h+675BTdcwyYLYaW/mZWPK56sV5QRJbsgQwiilOqhCL
         Jq1CY/7d4wnPi8pzynPXhvi3h8W1F+bcJdDnYirKtnXJZ6dRE0RLkkxlmep1mnc0YWA8
         kh0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rovyz0RXeDPY7QiKkZyVhP+mPro1ut4FCFJ0pW825JskSKJx0SX4hx1i8BhYlwYhksNVeAI8iplYcYf@vger.kernel.org
X-Gm-Message-State: AOJu0YxGs3G0rM0O0bqz0aCVYiMt9Irq/xJc4i0XMOP+a0itf4582jtx
	Hc4gLgFtjG0zVKWJRhwtBycjnyzdidPG+7qmC7MIDb2NYLrUe6n13XSbEPmbmgrBYi5XAnK1Raq
	JbkOtptziBN0i8lclUNnlgqsp65iaONERuJqwGx22Sr5NkYEIBT9JpFDSZyCxYuMs
X-Gm-Gg: AfdE7cklvRo4F9N/iKszNM4ancLYDqrRm3whVvAqKUjZx36U2qXMa4WUHwpK7ujlUx2
	zd90kOqUfIm1u2gn+K0AUrmRIYT5DzhnTsVxGgVxhenX1IzlmHPM04v9DYAhUuXQC+uscnXQi7U
	zIKOsPUAkcy+feNO+3y9T5sHiR/oNJ8rhSZEqTJS1qJNJHEF0iDIOtH5lYJA+iQDkrgx0Q3s9t+
	Fg0yJArm1/v6TNF8jcqDOihNkIW+4CGXdPFcgmBy8yJM+lINoLhQbPbA06oPgJ5/T0NcfB4bV8Z
	1cP/EBrBUR4dsGKPwHUlh3KjMdZnJXfK83XA6R5uzL94DXtM2ccR23Nl+8n2fmafz8egTrwMkdI
	knKc+sh8PqvZcwlH6bWepAL26Bb94upkdjEA=
X-Received: by 2002:ac8:5e4d:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c4be3f317mr84350301cf.7.1783339147159;
        Mon, 06 Jul 2026 04:59:07 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c4be3f317mr84349941cf.7.1783339146652;
        Mon, 06 Jul 2026 04:59:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm3830222a12.10.2026.07.06.04.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:59:04 -0700 (PDT)
Message-ID: <54f5177c-4373-46f5-ab32-fcb452e17a9f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:59:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <373bbf80-a874-459c-b77e-a86dc5f75d51@oss.qualcomm.com>
 <323f9495-16f2-474a-9604-c67a3279571f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <323f9495-16f2-474a-9604-c67a3279571f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b988c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_kqV_F9lkCdbSKCJziMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXwzyBYxzjBw0j
 S/DZ3JByLuLrVTXbvZDADPGRvsXveiPcsBrXAKesClugsRj6uo+RzpMkoaJMasSqoHjMNaA5ilG
 n4xvRwzgUyeoqkG7njp/SfWrORhFd2F82SNYXw1hdvHDVUcpn1uatyBF0QO3V94RbhWZZJnfgMJ
 1jrQhTEkmxmD8xVa/0vzJ8RTU8J83AvNr+2lDwK7hPdWs7t7sN8OyaAFE3F9M1RbLHcziuNlPCV
 VRNSq54oaJLvOOGBM4KagrmFgMKmYPkNYWHu5wtxBeREVaBqvBinJFyvcDDn+PKAJWjdkmXbteC
 TiT6ys/VpaoKVQyabJla5oUUHJHbaDT/o1vrGUzUO+5QV5QfwueM7uBjMww2nXm0mZxKbjPUQR3
 XnEcZtTdoR/m+SHPENi9Iewr9L2Qvn9pQ3PjbanC1h5cEm2WYPT88OyqsjJm3oyRlOe16jE5PEH
 +a9cpRfZwXR9R/+PJsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX65sdQM2/DZY4
 CWjZHjhBm7wayjNV87onbaHm/GeDVQp7lN6YtfwUZiMMCSXrg6vhpwV5lzN4yjL5YuuvmZ5fGmI
 uZ63fzeIGBV3udgkvcR0Dl1/ODRuhWE=
X-Proofpoint-GUID: HALUFzyKudk5wmy4Mp_tciNBQtBBqmuc
X-Proofpoint-ORIG-GUID: HALUFzyKudk5wmy4Mp_tciNBQtBBqmuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060121

On 7/6/26 11:17 AM, David Heidelberg wrote:
> On 06/07/2026 11:14, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Introduce support for sound card and wire two CS35L36 audio codecs for
>>> top and bottom speakers.
>>>
>>> Inspired by commit from Joel Selvaraj.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> This looks good, but since the binding is not YAML, it introduces:
>>
>> failed to match any schema with compatible: ['cirrus,cs35l36']
>>
>> so please also fix that up
> 
> I did :) bff7fad1010eea6f183fb110b54171cf8700ef8e , at this moment in the -next.

I didn't run git fetch at the time, you're right!

Konrad
