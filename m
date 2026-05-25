Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127A356745
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714365; cv=none; b=fDPCXwvMRoaLr9Ktqe2WgQR+vGEOKEeD94E54OouJwa8OUGDQ0nSBhyjjIbCJx6YZeeteq5X9esDb9fDjRKr4Tx2syqxHYcjQr7xIh+7cGOKPp2MB+gAXn2yViRnHIhkHJIz+y62MPnt7znm49P6/3q7Lv+3lzeXHf9iLND2ZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714365; c=relaxed/simple;
	bh=/Pr+5Ry1zTs8aUIk6lNGig6XVxgObTH7nUPuyTIi1bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKG0om09Jhdi70iiVXGTO2KO0RFKL4bYg8x37Ws7rWjFyAVaTVSqI1R+TDw4ByEtgJZqzg6hV5C7yOTT8MEZQmBWR4e0uNnwiJXKc7aVRe4LBR4GrzeyaItv0HzMBQN4R2COAZB5JcN78SewLGpSZypH4+hReuGXaivAurQSma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qtz4TJxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWTsaUJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qtz4TJxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWTsaUJ3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P70Yla1688066
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evZk4pgnuT6oNp4zokHouUD8piNfRkq1KbjkBraCMps=; b=Qtz4TJxas09hgh2A
	FqZ38xAI0lpycFIBZFYioJNy31J3D/Q0yo7INzdsjR5j/AMGE8CahvNeRdO2vEw6
	2uYoT8RF8ME/xykhPRqm1pe58GmRuUrY6uc0KztoygayAphGOvD0QleHzUUue7D9
	z6ENMsbw8IDAYy8Y14eoI7GUB95kbwd0AagkpwKNJj0RZ9+XfMzZ8/5lSKpp9Xcn
	TsfZVfYxf4o2N4kp92jPkFtwpVtVqGHQInzkG/6wvd9ILX7dazRwxtkcABby7oBY
	+uR/r6HqyCUH1oKLrE2+bS4qPJXAZvCuVx7wGhaIyqezSs/vQ2nr1ZVkQ58opJYk
	wa6SbA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asxs51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:06:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4855acff336so331000b6e.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779714362; x=1780319162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evZk4pgnuT6oNp4zokHouUD8piNfRkq1KbjkBraCMps=;
        b=UWTsaUJ3CWCQmnRRAsyd//TkUhxvL5TnEJ6hU6OL5Zhg4rKqysuQ+gw6YCawHW6alT
         Pg0apy2IpDLZwmjte57t8UdlwrlUqxVv8i9Qfu89+dgRKcRKjaV4sVaUkml/xMJMPErh
         nwxXypfjR/XgtfRsmGv6+uk500K33szDgLHYqK1bEWs9/V2/VQpp/sw2T3t5aTKIGgxf
         ySnTqO3jmNsLBHu7sUKhK2FZ30GQvhU2Ef2zcWosC2V6uyjyKvA4OFsvdCJZnkjrmoL0
         D2EGNTOyibAQoTvVBtrtlLi8vAHgVY3ZQv1eYW+pveyrv5np8SLf60X1FNP3+MU1GfIN
         Mk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714362; x=1780319162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evZk4pgnuT6oNp4zokHouUD8piNfRkq1KbjkBraCMps=;
        b=rZ4lmy1dc8pNFaHmo2lQUA5kAn8BRNo/AMDtPklvxoZJvL61/R1pJ4dIIWjwy3Fik7
         hVJ+5dvcutkTQhrffzU8/h6nB3xBxx3Q2aSbzESF3pJsqS6JzTz5tNzJqbxNT6QWcinx
         kvw5gZ4OeLpLgs5SvuzawH+njVSmrbtVSQcqYQsi/3yBuHJ+/z0FO9IfIGq3C5ksdGuO
         acG2YK+8V7l1ro+jaotjk9wUpPNsKM1yG980w36xbdhX6g0j6KLSIG5wh3e9+gK3DgWJ
         xCmuDBs1FS0utAjpIM9rqOT2WrFj6F3N8YMyPou642oC5XS2Eyd1qg+Fd8Zd+MWTcjBq
         us/w==
X-Forwarded-Encrypted: i=1; AFNElJ/yxxTghsfvDTqx8FL1GWuUocq2xRNrBiQW1z3LSy3FRwoGYQXB6M76O1rtpoypZHjIOLgx73lNVE3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOpYJtBNNGP0zSVCP6NT8yE1CjVqrBHWyosDj8Q0awB5Bm/T5
	0/6SXHQ5cKA4K6hpg+bpvVgGfC2jGDmuuis16XIt9fOpPVUBjWOnotljEbdka8o9DOM+ZBf/9o/
	SxlUEf5SatE7+5wAisQb7+rTSk0RIJK9L+k32+I19CsY6Z+zjjgDFOfXwi35hJuTyH/lfjuMK
X-Gm-Gg: Acq92OGp+MJinNBYYmEqntCYhn8/zWxFjR1jcqfc0XI3KF0fYK65D12EfMxZ8asXsn4
	SGkjhp7oGn1Ao4cah0dZvbnFW+P/Zm1ZonVtn4LxDvosxb7fBVQc5D82lyEjIVSZBawMJBD2pSt
	7FprmMmYNZu70Ugzea/cV2NCNQb5Raobqzw/2p6WyKmDcg/TbGM4gseHEcwaNdjtcvH0AIJg2iA
	xUB6PQ+zJJ/v0oS2S7xuKETXsLS0+PWPk+E+SHx7ulUwu9XIttQv1ReRKiaNLVledmnPWp6siBY
	mozskbLuPJ+ws176PL3Bl98D5KnlKB1XqxLtV95USzzSnY/t/WwdreLNrizGVtV30zVQpXWt8fY
	aNEjMzjXrCQiZA6RdCfC1COXeghQjvjHZjQKoek92plIkuw==
X-Received: by 2002:a05:6820:a384:b0:694:8f39:3bf5 with SMTP id 006d021491bc7-69d7ecc6b4fmr2810933eaf.3.1779714362017;
        Mon, 25 May 2026 06:06:02 -0700 (PDT)
X-Received: by 2002:a05:6820:a384:b0:694:8f39:3bf5 with SMTP id 006d021491bc7-69d7ecc6b4fmr2810912eaf.3.1779714361426;
        Mon, 25 May 2026 06:06:01 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc2c45ec9sm405950866b.14.2026.05.25.06.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:06:00 -0700 (PDT)
Message-ID: <7d9ea19b-c6f3-4f14-8752-994fea304a17@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:05:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Set MDP MMCX corners to LOW_SVS
 per Windows
To: Daniel J Blueman <daniel@quora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260524115704.9442-1-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524115704.9442-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMyBTYWx0ZWRfX707Dys2KbduT
 qFJvB7brzuxqTZaKcGfDgSyhV8Xbn5AKMNdgRMahfhQCUAm/R+3TjpxoGcMe4pHJVooRQ7Shq6d
 RwWy3k5dJW34ffefsPyRxuDWRoof+j1NgOT91kUoLeG3XcqVWqaFYOITqH5SsdWJHqQopepqj6q
 Ii2+41kMchysdvriCThOoSbu7j92dHUGoYgWFERvfKJ2IcKRIusudAY/TGh/TpvPW1NnB7RCOGi
 i3GdOWfgHhhDMWJLZOIbsHNp9Q4qDSpJothfo/iRUa5vzBTHlZy9Xi6MRuR+q5+eseEPpR24wIo
 RJgPv96J7f4tJcGFhD89IY0QO78LRZCR5aHvcXqGexC2kn9c5JBImyC+1xCbaih2JDB6U0YF1s5
 OGroUZbLbVX5VClQfIwEBN+o5JdwH9ggQ+7oiJlQbTdLE0hjICFn5hPCOgq3tzrdwMFHNVSb0d3
 1S0Qenv3+wBwq09An4g==
X-Proofpoint-ORIG-GUID: LDUZ1oQQ6E0bcaAjohnAKbfp_n1vT5in
X-Proofpoint-GUID: LDUZ1oQQ6E0bcaAjohnAKbfp_n1vT5in
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a14493a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=80NRCOff-oOgzxwK4b0A:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250133

On 5/24/26 1:57 PM, Daniel J Blueman wrote:
> On the Lenovo Slim 7x with Qualcomm X1 E80100, the current Windows ACPI
> DSDT votes LOW_SVS (0x40) for all 7 MMCX OPP packages in the _SB.PEP0.G0MD
> F-state EXIT package:
> 
> "FSTATE",
> Zero,
> Package (...)
> {
>    "EXIT",
>    Package (0x02)
>    {
>        "NPARESOURCE",
>        Package (0x03)
>        {
>            One,
>            "/arc/client/rail_mmcx",
>            0x40
>        }
>    },
>    ...
> },
> 
> Apply the same in Linux for power saving opportunity. Validated on Lenovo
> Slim7x across daily workloads over 2 weeks with the internal 2944x1840
> panel @ 90Hz and a 3840x2160 @ 60Hz monitor over USB-C MST DP alt.

This ""works"" because the DP host holds a higher vote on the same rail

The max frequency for the MDP core clock at LOWSVS is 200 MHz, so this
patch is incorrect

Konrad
