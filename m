Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E70B391507
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322278; cv=none; b=cJ969hL8pec1g96ZLXXG9C/jCxOI7Rxr3U+LjF9uJyUtskZ0t3ZwYkO7WVSX+lvBhAbO5ZcVSeQV4yyiNzrsNpvVLJr6UZV4tbGoCBm9E0vhLcQZrEVnFPO27Ym+nsXOiNYqbXTvIiMIXE7qGoTOjBwvGEtyrRHEDq2z/tMB4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322278; c=relaxed/simple;
	bh=igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nops7U0WbFizxrt8red08pUtw28s4WYQSyFUHdyhK/HZZLVsk8F+vlun2H8KqmJmMhdeeuraahXJwFYdAvW8AmV2UiAzQfpEh8yN0sooYf4izKQt4Ml7vuE+7Iru5wjes/5SeU5v7VATpibn/lCR4w/bMTVTCQ5n1mUfItYVPJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETFXkgzL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlAXSTQl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETFXkgzL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlAXSTQl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TY43470445
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=; b=ETFXkgzLG69wYWdI
	oQuG2jhHZq8qv9LQBFHD6FsX8nBglJzr55RTL65rh4ktdiaet4l57tF8GQ6ZswKA
	vZpn3GQy/odsNDhEU+BwKLjJdKftzL5ty7n/UD4NzrgZ+h1zGNBNojt5+6+Ib0kK
	p70CDhwhK05dqG1EoJJf1N+wTIdqQgan+hjvkR5+FHk6iGTKACEQcCU0YglRpayG
	KZrrdTMsFwqdovnvA/+EQPBpWzAyaZosPdHeRGyU0s6ybId1aldAd9InDEbcxua2
	7cHunYZkJHMfY5H0osNtZ3Eo7+BU6Z5Otko1fqtPFm5nZF9H6WwuwYn+/S1KosHQ
	Ohlz5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemvd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:17:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5740so294351785a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322270; x=1783927070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=;
        b=BlAXSTQlpmZ2DGLxb0i98kWra3Nwa9RTqSOmqaHc8HBhZLDb/OHJ0nZpbfgOgy41uN
         FsCD3KhxoGSt8+1lR4XayOZ6b0UsYKWLp5ox8bWXhHwBa+g66SOTFLAfiO7JnfuKYdBE
         AUzOtXV8cy0AdL7IUV+VejwZ4CAYLr7HJdKGkju9br4ZqNsjFDpL60uT/he/wVIAtvSP
         /puqZto9cb2t3WqtGmuqyHmBbHNWwI6Bj1YLZvLN9GqlO66/GOhhJLly7mhU7XuxzhFn
         +vxEihbla14y60LXISCReiUi1jgWOKPHhMxveMZyCjMMnV8RJihB2KDdbDSGAEQNwY2w
         GQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322270; x=1783927070;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=;
        b=bDKmnbYBBTDcGnx1IMP7MfHvpgWOl5vAJ6Q6+3dFyMM1VODV0fcUIbOqFeZ1yTSlde
         eqtrL/AC3fq6niwcdgzp+hsX731AnNKVbM3m9XxLJEqt77XY1xm/MfREqLTspikcEHk3
         9n+uCty0LyTcroNn4IbZ8kAaZHo+LA7+BqmEaAAqebBtlq9CVubZ8rxsuSxKghsf2yje
         m6Z9gLseeG4sdUzuZePAoR61f/GqhJOOoXDo/vzAOejtVXx4OH7KEkMT+uY7mDT8aVcj
         cP+kqOU+mjOHgwMq6SseeSUknGOX8++CDjdfnX9Y2aiEuMitpjLJG5EsnImYSgNwGs86
         vj1w==
X-Forwarded-Encrypted: i=1; AHgh+RqRYKp1gNC6eBYYRn+4zkV5fF12eRfFoiRM+AojbCe6upXyVmfbxJ7FKz7JxYX9+ncQaQtXap1QSNcH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi6jlWxO1JJqjIzqWO6pPA75EqNO/ggS46ODnUvaEN+wvYSlkY
	k1ESO1/R8eXzObiMWfmyfo1MdcZ3meDRjJCBkSeDLRSK+/vHV0QEyu+/exDXoXw0RWGqcbj5TZf
	R9YKzrJQelY0qua5P46vnuR9K5PMdTCTqdeCfn5Ql04Mihvv6r9Gj7gqn5AoXChxh
X-Gm-Gg: AfdE7cmjcU9w0YF9vILoiNnmrMMqmEvjzrIs2MlRCv6xSP2HtBJ6UmBY8kyo1hRNY/b
	EZg60+tFa6BE4c7oz467qdpW3TDie5czOAIR0G2OkQedf7VMwQFwgsbrVO4Gcz5O1CLrVzj8Tss
	ZD/sJmWm3b1G1qBgmaiv/wbOIPdHseAWbdk8p36b7pGBwk5vNBn4x/f+Vy3r3rbhKXSWZLBCCI9
	jx0ucmxhT/D8L7xnvT6JvAv6Fjc1w/eGJqYAyn0mnOCuyCrRAlJgHV1Q6a6dDy/emAlOGZvLTZl
	FLKvFjqhS66RE/S449MjkpqvjoU1QeUKpbSxUDEVPav9byDlB2r9q5lUi43NHpoh+a4CeRHZnKv
	innr8HRe1k1KZELnY6GZKloaKDWFRY8JgR3HNMOes
X-Received: by 2002:a05:620a:4515:b0:92b:67e6:8ac4 with SMTP id af79cd13be357-92e9a516999mr1258196485a.62.1783322270419;
        Mon, 06 Jul 2026 00:17:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:92b:67e6:8ac4 with SMTP id af79cd13be357-92e9a516999mr1258193685a.62.1783322269964;
        Mon, 06 Jul 2026 00:17:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm322064695e9.2.2026.07.06.00.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:17:48 -0700 (PDT)
Message-ID: <e808020b-be1b-43fb-8d24-c4617042d984@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:17:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
 <20260706071005.D18571F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706071005.D18571F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX1zH1OzOoMU1t
 vCUNP55Lfk+EnXc/z7i4Uz+fIMXkqLzQJ3x+qHyQPjb5nhRrUyCqtQvwlP9DAIpPEc+dR2ukSIy
 hAoei8U+9hRBkHG7nlGTz9FXwjKjklw=
X-Proofpoint-GUID: oqW2MdiOOg8H6P9agjc-Cs6ndfjtSLBN
X-Proofpoint-ORIG-GUID: oqW2MdiOOg8H6P9agjc-Cs6ndfjtSLBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX5N9HTPsdi+EA
 WMTtYSZoHo+11lw4MM5Cc9OhFPogQ4O8BGv6+4WpEFhR17Gdo2flO1NictExt2rda4IKQEgZG+T
 eEhoFdV1CxV8Ubyb4vpnIPKIlaH9+s+dutQOLW9iGO0YUkOfvYEJBVEdza3bfUrZeVXwz6JSk9r
 sKCf6wmDXbvIiRwV6vr/l7/GmDao6DQ/e6ggfFquUn8Js4Z6llsAWqAGIGKf9rERXQsGRj4SHxE
 dty0x6am2aILPHTEfJJ8bGibuz52FZLltnHomzkZ+r17vR5yvBhz8Uyk+EGMPfuE2bGLty5mJCq
 JR3Cw8TIlO0yy+T2BzkxOaO/Gjtrs8g2zBbdSHn+lkSWiFOk8juUSwEo4kZI10Rb7UPtDaZ7Qy7
 7kZGC6UQtxZmj3O790Luny4A7Y2TU/UIvLR9xTaHkfMc+pCvFbElZCx3jrRhWnkYPxXIrK449+h
 hbjnrD8Sa/LLaMqndOw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b569f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060071

On 06/07/2026 09:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Renaming the `splash_region` node to `splash` violates an explicit bootloader ABI, breaking continuous splash screen and display handover.

ack

> - [Medium] The commit modifies node names beyond simply replacing underscores with hyphens, introducing a mismatch between the commit message and the actual changes.

No.

Best regards,
Krzysztof
