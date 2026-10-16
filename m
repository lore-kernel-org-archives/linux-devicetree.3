Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B6372B57
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126120; cv=none; b=PvywpGVx2SP6Dyg1w2CTM2PIL+m5P2yv6ZMUnH+xcnSfW7XvBf1nyQOVEwrP+1Zi7Cy8wrHGhdvCSvzU4pvlOINkbctB5ttLsj/uwFpe4wdQ2j5OUf+NTbbWKBzi/g7g7fPbjGeENvztlPLdSMWhGobdCUEe5I/FU131FzVRi88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126120; c=relaxed/simple;
	bh=e1jV3GGo8gSwoQ1QbA4dsd+gyLiiRLrCsYghYhZnAfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axkFkblf8GE8P4+jNEXCE8hEWtGTpt64u+25WSX06pXmyRqzO/R3qy4wl7CeD7rD12BsvpZDzx/RbAXng5rzJNHXhvKKohCmsdu9yq3+JVjacMEcwlbku3UK5xqwM7O3g6ookYs9SP5kG5P2JiRyNq8aJAMqulV1LyWGmZhUgOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+pEHTlH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtXpgYyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+pEHTlH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtXpgYyN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2Qrxw3902229
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6UBLvC/f9cs4JzfuqkJfj4zh7qigCnSMG6XkIEFpCo=; b=b+pEHTlHXfflXc7h
	ERbuImc1LHNL2V+ZVzQGEcYz9sR7YNxg2DjX7iWLzAU8vZb1xVxO03UciVwPDFLC
	ee2q2HR0pD33XqBfsh2mcu1FfWyS3jWfVKPvAR2PNVidvukP5DYgmUARdTBMY3Cl
	P4U0uZU9SwyKs5NfcAYs9OeHBYrTfXFCttVURtekG0nMuzVK1hZee8wNHCI6CWNr
	y8d2Ls3zO+YtN3xV9nxa55s7QX1OXfzTFxZ1tsDNqTqZMgBSLCKApqtJzb2mTxcr
	ueIbPZquvm5YyNr3f2V3JXCXGYbL3cQDX7QFR/aOVRKVaB8XUU2/Wqu+s5cnzwRp
	+57kLA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3set21d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:48:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4228946c88.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126116; x=1792730916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6UBLvC/f9cs4JzfuqkJfj4zh7qigCnSMG6XkIEFpCo=;
        b=YtXpgYyN0y16uIUCV5eLL5BeBhpC1ULyt86AQ4NlZZ3rqshwpMp0BekjCo7knIjFnF
         Wc0BRYiiKe7mfoN8UFDFkCN3kfASUYpoKnuLdFCm+TdUwEsD+QGqPpBrlR3N4K5bEJji
         y5IhFV/d9N/fGamtvmBnO/bn9sE+BPw1wLXST912bADA3XGPWbIO0s8zllCAVh1lnWAq
         2y9rreyNnY9Fe3B/WtHN98Ru0AvD6cH79yyI6pob5fT+ZQqVdgVClh9shJuGFkcz4tI0
         rdZi2602FxMj7CYFy4/JC8mTrF+mysq6wfBffaBu8yV9t6E6yIIbzC41/Fb7SgzoYOpy
         74Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126116; x=1792730916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6UBLvC/f9cs4JzfuqkJfj4zh7qigCnSMG6XkIEFpCo=;
        b=yhhMiMemda+WzSWQNqjaCZukfVNuIEp3f47/u1eQFjftAaYr7EDNTakrtYXtnndNVO
         8a+jOY0CEtaOPVJ7j/L6OQDXzkgEOzjnIUwv/dleapuPk8+pxvsTfnBN//EFHcU+7fLA
         JPF032GSP9hSgAl2f0wWbcd0i6tPwGHuQM+NUZqtUoPxT/IjMIH8PkNrNRaiD0VQj5Yr
         7mzdsNv2Yd/yygA7cs0uQ2UBygq5Ozw/JlGs/7Y3z7WmemJu8rVTOZ/5L5dAcu9GhrXA
         K0ZBZcClGKiflQE6fxBWONdsSPcT4TcplNVSwD2EPpS05yyJCSvFPWQ89DLTA05cwWIJ
         6WBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqO+9sRhwtfJFmPnZZ+1+1Iym72X9rYFg2lrSykh2DlynvWINfdBIEKNLd+Csrts+BpNojAfD0NYyh@vger.kernel.org
X-Gm-Message-State: AFq9FYJLDOIpZ3cS9MfEcNTU2OK0gwuxf9ylSMX/4RRT1p3P2f+3F5+t
	ZAkSTVP+/Jlloun0PQtCAN2VWUx5KTQy6lP6wF5X6wSI3kN0qgZGngp3AFIUmMjZiy4MS2LGtvn
	3uKQmmy7BllnxuStMM5Lm/3bve74EtYk0MA66NRdCkx02z38zaKtUopQRuED00XpC
X-Gm-Gg: AYBFou1dido34xbVgJyKCM8jjs0fNEnVa9zcv35Bx+e/gU2HcwX4O3zwNFgF2FH9GBJ
	ThQimiKhffQK7Zeo7nxcBSLL7BS0tDRGJOzClkDm2p8MrB0Ae2vZYFQHv0ky9WwHnlE9NBWp5OQ
	sWDAj906QUzrauVF6+H9HdmUHRwzWIfchRK86N1Hx84RoOu4luUOR1cTbzBpDAcOKDKzzVNrC8M
	Gwmj9s24wXhN/dv6JNeo+GEfhLUVrBpDdapXLSb/spwrDrAquQMCced10UZBSKES2z4nxwYI3z7
	32KQ8bMbPKx4xUZ44YEJba7YBPp8m3Vg4kLoLKoW9rbJmPtJMQ7VpxrLuyb0v+a9dPt5+6KcrRz
	4djqikRsHwwTMgMWV4H4JuJ9aSMSB
X-Received: by 2002:a05:7022:b057:10b0:160:a80f:3ed2 with SMTP id a92af1059eb24-16a5dbfecb9mr28022746c88.10.1792126115848;
        Thu, 15 Oct 2026 21:48:35 -0700 (PDT)
X-Received: by 2002:a05:7022:b057:10b0:160:a80f:3ed2 with SMTP id a92af1059eb24-16a5dbfecb9mr28022713c88.10.1792126115172;
        Thu, 15 Oct 2026 21:48:35 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm2213699c88.18.2026.10.15.21.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:48:34 -0700 (PDT)
Message-ID: <3c859faf-345a-4ef6-bb61-ff726e4b5d66@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:18:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _KQvzkRRnOHym7hGyevkbexrr4aN04YX
X-Proofpoint-GUID: _KQvzkRRnOHym7hGyevkbexrr4aN04YX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfXwbfF4NpOxCTL
 k9d2JP7K2rRCtb11H48a25KjvY73woqin94E/hdWtArEQ6qx+zRPrYveRwq72pyBE7IZp/bHLPB
 MJjbgmzfaqF5VaftkDgBjB1h67JGPds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX4PMrEVZJFaqq
 LiKdD3OgzkPMhjY+fHHgSzO+gWgPw5qJtlzjjHB+phBhEZHXX9YCOehrmdlO2v1BncVJFEsf9RW
 W87IFgvURwQ6Ow6svSFeJ0mtG0qqMg/XEMSG/dJwad0VmOv8sKbqsPuEDiqKySxl14iKNcKtcrT
 r+shDJ/cNKiyItR4cVZtTfENymVQG411qPK45GtkdDTUXNnpx5lU9vcRnwjdZYRlNiyABMAqTwq
 TVWmm7irdufDT8PGXb9T4dAwYpUeGKNyO+Ue2W3yMXvaistPJwiIMsnzOi4Un3d1fHaDH63lIcj
 A75aUGp03PzKa7hlrSxV1qtWNZ9OmHh7MQzWFAULAbXPaYSMDuuNV+nziBq7s2oUsOMD8/pjffq
 QSRhAtSuEHUMRewSDm/Nfd47R0O/GjZgJemA8w5WrHHxk5vN9izh5DhM2xHWqf+YGRsJTuPAK7W
 i+Rv0iXNBD8q8cCFkGA==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1aca5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WxrJ1OjRqBU2I1o4brwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may then access
> memory for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260701-glymur-audio-
> v1-1-2c3862d95a09@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

