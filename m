Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A44E80BF
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889319; cv=none; b=mocDrIMR6T0gKaPunLHiPeuGXa/4SCeMdcvGx/IpY3ZdqoFaLVTr3Hn4Q1HBORwHI6hqXWuvsHJK724rEmk8FJvPGX7cJoaE4iq07x7tmFh4W44vZ+MH4Zy2tCx1xf1YfiGouD69X9OYsY5b9XB3blQfqMUUVQAK3cXMK+2PpZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889319; c=relaxed/simple;
	bh=GHmwKE0UxwHRtrATAosll6uYBXuuBS4AK3dGPwQgzSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QH368Xspm3z1sPfLmRY1+DModjhZlnh6c4DZgVKiBcvMm6mt5Ptw++ES4j3dF9nOI2orA9wRBcSawu04Fl+hELyDOFnbdT0Q30ZvEQfz79KvtPLXZ+MCFf9yVakFn310e2Rs1RVbav8k4XlbsqOkaQMLCdwxWhX7Z+FjFi7tfu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOO7bPzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqwbeN01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOO7bPzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqwbeN01"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6Z3x43209360
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=; b=lOO7bPzZ3j+m7Sha
	w6srrquNg0hkyIjnQHnYDd9qR5MZcYdM+HiNIn/xELTL+gchT1bK4Hgbq+ysJFt5
	T5hhwZz5OcHyLWuQ6KiFKeAxlqx1l3fu0P/oGaB+rVfPEict6RnmqBRHX6pE2jZp
	fXaPDQVP/ZiO51olPrkL2ntXLAfG4wNUW7gdt9ULeHgUnl8nhas+s5y29aFSMEDr
	LWtOp9UOl/2e984qcgQ1Ch91+Ctjgk6rcwDFtvq8XSOYacwzu3r3PIqXwWGpC9X4
	S80fbSweiv9SoHCRPMYvcMBAF0SMmqf09/i1vGxlsgkv24miYfXzT2TDlGEoilVL
	/4lB+Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjh3n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:01:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso66808137.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889317; x=1792494117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=DqwbeN01j3fEAQ1IRAEX1OauttJXuR4cYSyWMWduGKF4x2bw0pZgdsFKZvrFCqynG+
         F6H0puoqGr+OFLXhfIWhs9qNaJoSOab8T5yYI+H75zHIGbT2X+ku9LgeSH79XL8I0Vmo
         auxQF690qm0NSJ2Ln1t2X+sswf/fO2V2B+nXRSGfN5fqqMidDA4EYFeSKnOE7Qphp3pl
         xsJwtxed3ijvFXeoNuR2pdfdLQvGV8m7rbM8wqA1Q1QB159MszPtpfZnGpXNcjbEGe5q
         hwv6k/w0qgrU8GllN7JL++fQlctx4JZhl1Xh3ofFsNwf8b8s2T05Bb4i6I9jPEipYHb5
         eQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889317; x=1792494117;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=cuxeK+BQLbYRxuYsx9C0xkFMwQvPvMyB32vct+D16/eTdqV/8avAsimZ49QNI4Urxr
         g6/VOUZvvMD6sBD8WE4CFeqZ0ZWVt3sQ6W+EMJtto7FLcFAjysUf5CH1Ir3B6mr4jGEl
         QsjSFbxD9Bbxm0EtPubLcxmJ3WjUaOG6+fclEQrHEeTCJE8DJS+NXFQc9h09zy6RzfI7
         wEXheGqOnFc4Vc+1oPn+xU51rXtWb3YaGYwiqabbLOShu+tqQsE1VbUa6xgb10ovuBTC
         uB6dgmoFOYHkKSYeRzy14//HbPIeNxtjKt/MHWK0ANfyst6N/9efMYauiCXwrowHhW3f
         wCpQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2RhiCbIaiaVmlQ+XsACBzeIJ5WbfslteXArba3/dlQxKiiRVBzZWcTnyyxsOBgQzoPYDTaSn2r2Bs@vger.kernel.org
X-Gm-Message-State: AFq9FYJpVC8rk8mqN5HjIOPYznHz/WXFwfhb0j66YcUMtN/hJhvTK4Jx
	lJrYl1o8NMLUGXuIh3gD7MWM2mouboqszFLo0lMq3eKgecT598IZ028R6LlU51knzQBStHtmuo8
	Lm25UeEMd7acfqQmZe3fRLHQdpBzajhpmI8SYUX4oQAUT6aJz3k1dxA7XzQZU8HbMsZTjLG0W
X-Gm-Gg: AYBFou1wFagQMoOnxokj10VaJrHzsaJ/CKCauYHnXRBkceFu9Y6Ajum+r+p6ryVcbqi
	H5S+hJHEV2yEOxtFSl7qGxvZxjVq8QMOtlk2X/TVqW9llxhwTQgYO5PTlBbcgvQg84ug9r0PRmx
	TjM4xQkngMFWwJ0gXAw9BWHvQC5BIprlT3l2rYxcJbFOhiDNGutt6g6z+3lC/hyoNx7XKaS6UqV
	9mn5IOfpt3I//Y+hrhS5EBkVsxhASPWJjfpOUOT4YnjdarPHh2VhP28X3VjTEKaI1S40jxcJiuJ
	TXKcH/9yqtoZjcjgI5QYPkuWHJ0DsAQ6sQp0YUlEjgnF2ptf6MLmLYlCmVi1mbRyDDGpHVvLMJL
	B8fvMTW38fL0Da5tvMfUYvA==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310914e0c.5.1791889316550;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310887e0c.5.1791889316040;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1da0641d0sm1640396a12.25.2026.10.13.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:01:55 -0700 (PDT)
Message-ID: <1afa3099-055c-46e3-b7ae-3921b8ecce3c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:01:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing
 and connector mapping
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GvRn4RHaHZ1HVY005ywKxSQA4aIuRx_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX0UM/9mGLqmt2
 lcj0bSZz7cfkP4BICv7jxm3C1TFlVdUiK+fMjhGAAoABL1cgJoh0fqZuikrtY8ADri2a40DSMac
 6rdECjOrSiNS9RHxnIiJH5K0sMUs4ifWZPEFERotM9JiqyShM/Jq7IDRmTsmDe9vPcPsPJOlJpJ
 ghT6/K75FNyJwaXhX9B7GpPw/sTMCaTJlP7CEP8BUv1erIUsBgqyc+gIpz4ymOH5Ij0rS47Wf/I
 MqaUs9oqmk3lA0U4LYeMvapLnZINngfa7Ncz+ZMxFIAEo54IUlYJdWFgSyOZCm5IUhfXA+2JXWr
 DRsSbRV5oefbmkiedCyP4SWZRN5Mh8lLgxvDKSw/yqtLJ1Cp8ntqLNQPFRsZVvaY1mVFFtHUz8E
 ZcUx0zpAWTZyeyw+jehvFi6/e2E3Yvjy1QjDQLu5lYBRh9CtKxXKNc/fbzXWrOkTZpUaOOswox/
 PnCPoV2xTMqovmkbmcQ==
X-Proofpoint-ORIG-GUID: GvRn4RHaHZ1HVY005ywKxSQA4aIuRx_H
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace0fa5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZFXNGOwF0fqHmEQM8WIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX4RkxMz+jIJeT
 UAThHkdUTE8IjcyoQEW4wYPfkUKWSWdfZLexDGfwi9FHe13S3kVIr4bLKc1Il0vrtOekuyoMMgO
 vy/hmMRMr3RU7eMvgP7KExTinUf7YcQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.
> 
> Update the description to explicitly model the topology using eud path
> child node and add a role-switch declaration to reflect role-dependent
> UTMI routing. Also on this SoC, the EUD hardware intercepts only the
> primary UTMI path. So remove the USB endpoint mapping to the secondary
> controller and associate it with the primary controller.
> 
> With the intermediate EUD node now in place, update the Kodiak board
> descriptions to map the USB connector endpoint to the EUD instead of
> directly to the USB controller, reflecting the intended hardware
> topology. Enable the EUD by default now that the complete topology is
> described.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
