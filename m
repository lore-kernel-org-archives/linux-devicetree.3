Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02B933CE88
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741805; cv=none; b=E3GD3oOh1XDOUoCFj2oLZFs0PW+p5/OlfWqr9o5jZaF5eKP5CjsrA/sVsE9sDbHn+kT1/gbdXhvZzCLPNem9QRneqg5t/p+iloUOVvRW93qGZahlxcmxBb92KqOJs43a1P+Jsg8dKyj3kM+nWzAy3Jf5WVECcLagR2Q4e4iOxt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741805; c=relaxed/simple;
	bh=yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkAjhbkLlZtINyM/H9WiYvno0D2t2SvRrumtRhsg716oEQUCOFQvQG6gYfKQBYdmguPVW0tdEkA3Vrug4FqKfbFRIt7FtojbofvzPIbzdGBkXHJ6GZYrOLZR3+fwpQDl6f3H0sX+fssA9kcFvsjwJnzzfCEuGlijJfpT6GQV4so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McV8P3L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/xnIFom; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McV8P3L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/xnIFom"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASpuh2601110
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=; b=McV8P3L65Po9kJ4z
	T0xMsPyRpbrTNLwpiOLiAZg7oyuu7xsZCz7EddqvE2mKbkYXffvoIcKIJXlN1QEU
	WIjwhiWUpQAjqCJqa42P7XYmOqlJG2nNpWIlXshH2V2LtOtoa8vGnOrEP17Ef1/9
	X6C7H2FR3TeaP6ogXFNyZmZiF4YO7CERbvvNa+rT/k655wLmg6sjUO1EbxBOU41V
	AA4vewqb5P6Lm5GSUz/ov0QkPh93U9wog8RdSa6zgx4sdiPXk4HA3eKob4pE0scL
	t17cuEG2LMHKZAa2Btpt3+pYMmTnIQFmiXtF4Xl+JkT1u1CsMBvM+4UUlUz7ASus
	iQ1zLA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw9607-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:03:23 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a183ff0015so31959eaf.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782741802; x=1783346602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=;
        b=P/xnIFomCPUabdCFh68KIhYpA6BMYXsoZpfdg5L3bB+xtALvbsBYOAhWdPmrJLKYoh
         REzprCkDiTcXwC+7yrpJRhA3o5nTnLVooJKvojHKNlTScNdmipVRSMq4Bh5HI3E+uV/l
         zgDJc4/zVGyXgpfbt1NGfDRVHmsTyq5Ri9zTnmcKKtBQOdpfY0cLV68HK7GJ0Gy/IN/W
         RSZAUku4cBn9j/C2vZyoMevmIcTLAZxlN1U4D8eUydYKCm61thJLp3gGnfhVO4UiKq9j
         4H5GU8SJFHlJhS+k/ISnEtnAjuJNf2cyoxasJ0JQc+KhreCbQwFcDOSXBJUx6InkoLQL
         ygOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741802; x=1783346602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=;
        b=RCW8eYpKkM6LnGDRLa/1Kdoc6/bAOZ9ZKKwARlSZV7sviFOfflav1etvBmgzawfYn2
         cbPFMvh7Rk3ze8ANX9cqQRp+BY78BFx0zFpJ6ATym+7bApPSlStE6ZQCMvQfxcrCY3C3
         zXzd8A4vEiFvpTzH80aFvpmZd8BTAo9MMOMhlc09V5tEhEUscUzs4tEsPbYxM7Ec7X+3
         WkCJ0QlIq35dtbNepc/nlNNIH0qkMi5jb1NWEAnbmPwo8kFxEU/kpHtsDAyUe2IyKQLj
         VHWsG8fLlV5pU8X+ikd4A8zfeUFaIfx0OjbbKqCtvpG9vr7il1nbi7nn8fzRlG/hSckh
         DrGg==
X-Forwarded-Encrypted: i=1; AFNElJ+NZTEkGtJ48/80SteOkM2LtReVkpKCgWlwY+62pxROyKrlLbH175dw8TdIg/jDpaXWHaH2vjLwiJ4E@vger.kernel.org
X-Gm-Message-State: AOJu0Yxga/g5ALl84TDgOqjsaLEIr8G29Ew8KsCCUjgHGY+/zS34CCeV
	7WtBo5k9vqcnLVPveysMrxIwJa/H/7IcOYLvaHpFadg93IUQ+qW3J6r2ur9bTaDBCNbV8C3fFki
	FpOUOLwYi7Ix1C+ri4mSx66vHe0cS5fn+NXH/0sODkYM5wL3IB4Hj2cexbTc8Mhenn2ZA892Y
X-Gm-Gg: AfdE7clmIMPvp5Z3rHKv5dpQJkmJzwoz1YGIyw/F1odpLhaAc3bZkftGETrnShjBl1s
	S+mcAVSFx3fL5AGGFVTTlmHwO1EwqfzJJnjbqBtLIgRYIcDzLf2+ASD6/ekN6uyKfuYAIq48hIB
	kg+jXk9/1ukaatY836/dvr5EnXsO00tBTm/FgKlAwUUAO4ba0WFTDydGYtrT9C0GwTpLYdtExEa
	n4EQJn6PQWbX4C/KsFzxAnLtWSmIV1L9WhWJ0SsaQMGLA5NOOHIDAgU2isXAurxAuYH4xtiSLKm
	HAtc/Hi3X/AxRLCOLBbCEwJhkIqqX2lBkLKV9Wsh4ex5oFC4zAOsmli76RaPXaF7XRnXTQO2NEh
	D89eEnHZ54KBK7QRmIZl1lM5voWNhJ7EAP+8=
X-Received: by 2002:a05:6820:2dd7:b0:6a1:7ed6:9de with SMTP id 006d021491bc7-6a17ed60ad2mr558977eaf.3.1782741802180;
        Mon, 29 Jun 2026 07:03:22 -0700 (PDT)
X-Received: by 2002:a05:6820:2dd7:b0:6a1:7ed6:9de with SMTP id 006d021491bc7-6a17ed60ad2mr558948eaf.3.1782741801604;
        Mon, 29 Jun 2026 07:03:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1250a80b04sm283661766b.34.2026.06.29.07.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:03:20 -0700 (PDT)
Message-ID: <c56732c2-2aff-4c3f-801b-b798c95918fc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:03:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
To: William Bright <william.bright@imd-tec.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
 <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
 <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfX5xN3Dbn2jrQS
 +KZ4oYido3yNLPQyjUABBNLd5uUPqHEw02JuCxI6TP+2vb+7IDkafDuEuiAPwcGcxNxp8c3SY+J
 24VzEMTMwJ2UqvKXKDzlRCGO9pZ7e7E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfXy2Af/5rVkeHY
 +j9pSy7cyC9j+uPhosE212lODufCBTe5RelnAYbvWXYb5NRhEOt7/rET1BtfZipDzytjW7gJ0ej
 5PnSg8WGcUM2fsj2DMbjYwQMXOBwEP6skwptAefAPcHgv8OiW3hudlLjde2/wgkLUTaBITama+l
 kaYrfl4P5ohYxj9EJusPDnUOYZxVHNKwm8lz2qktFCbXhq09e+HqtMyad/Y1+cKK7awzp3wfx0A
 +8RT6i1NtfVR0XfEt2FxnZDHQZxlz5qSu8p7vCcbi5993+fTKEvU8Xi6qf+eFBx4jsDGRMBhq4v
 b97en/G1XeojiEy1FdEKFMsn1XdaDou3NNMCeoBBK4DFjfis+sOl1wzayQcjDvb+KliIpH7uhJ2
 d/oM9fOL4MIGhyNA7KlGtfZyCSs8T0eWiD9E0uLL7vbqPmjLOdXrlGu61AXE+bgTp/GPu2/YXUj
 M/p7rDc6oZw3Rp/mKnA==
X-Proofpoint-GUID: i7IOXaJ3iq_EM0PXOGUnBdv6np44aQR9
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a427b2b cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8RGhZ6I6Z7cABIXISqEA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: i7IOXaJ3iq_EM0PXOGUnBdv6np44aQR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290117

On 6/29/26 12:25 PM, William Bright wrote:
> On Fri, Jun 26, 2026 at 05:18:20PM +0200, Konrad Dybcio wrote:

[...]

> The PCIe switch we are using is a NXP CBTU02044HEJ, this is a simple
> 1->2 switch that is not PCIe enumerable. Given that there isn't support
> for this IC already in the kernel and that it will take quite a few
> weeks/months for me to cobble something together, I am thinking that it
> might make sense to drop PCIe support from this patch-series in V5 and
> then submit a seperate patch-series with a driver and bindings for this
> IC whenever I get something working. Are you OK with this?

Sure

I'm a bit curious why do you have a switch there in the first
place - is there anything else connected to the other port?

Would you like for that to be switchable at runtime?

+Mani will probably be interested

Konrad
