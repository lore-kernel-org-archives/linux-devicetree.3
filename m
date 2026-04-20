Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E180388E4F
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673387; cv=none; b=qE5EJR5d49XxFUUKdoamnTk/ONJjo3K1FeH7GsWI2UHfSFbBnVP8Votxbx6mm4bg9yf4JOCEBdqleey2towwX5JhUnT4a/3gqck/bnDHEpYAupE/HnhhhTDRvSW36i3vhMD1TnZ6gYWGbRMtGhm7mESGTPdiUPFkhTdXXyDiqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673387; c=relaxed/simple;
	bh=xNG5bEyXvPrG2phlTv9cU5p2Zn0elVFIdD1uQJc1KpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5bW861mV9+EYxL4sIX5GqgHMvUlCAxpABjrkRIOss3jmtZ3InCQg5ihOXwSmSZuM91ZU906oSGqQ0HfuFmUZ7xjC5Nnuy6btXtYXCxxiADcR6pLVwriH+wb1bck/19bjOZ8/9uDBfouEdZItE6jPKemw7orLb819P1un1YdVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGEHmpIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTQB5WsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGEHmpIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTQB5WsU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7YrCh3455276
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqexufECQeB1ick+eNc6Ypgl1+IbKlrTi03R5bFR4lI=; b=NGEHmpIcAaMnHfGC
	BuucV4d77hXXVTOYN92m9/cJQ1263ZdMwWdp4yggtUn/7Q+iP6tZ7Ra6Q+GQ4p6F
	OxcekxANGC3nz4iGG75MB7/pDn1xf+4v+PdUQph8q4M4EuZkpfL7ySM70hNIseo0
	PHnL9txYVyWyKC2unG/uUFVVEXG70j1B5x0qjKfUjwFLC3W8C6eM26D/afJdwiex
	G0SqxSLcWWRZfQ8sMrd9qYwhNgnWNP7WQ2dWMQEwoKqwETc9oQCGc0OnyBKKy7j+
	/Y6Xqdwt6+xe2P0BgvRRtKTXIKxGkpOIp2ux9b6Jc0a0gWkkzsmLkceliZRoRdFG
	zThRgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjr67k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:23:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ea85a25f13so27757785a.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673383; x=1777278183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqexufECQeB1ick+eNc6Ypgl1+IbKlrTi03R5bFR4lI=;
        b=DTQB5WsUur5mGxJs+I9r87Js3ARFWMAK5cwCAsZ0/q5Vj6L7BnY68CCMkblBhP2NOt
         oFLnb4gZF2Bu6cHykPcJaWbCxv6b2srU+uC1chmoUYOUfwk07E9lIOyV6+qlRJ1IPcNY
         eU+VuQCe5N5rH0S5KTz5u12/gL4zWzghUqDYx88GpJuGoJ5iQKfqc5aW9GHE1oXrya/D
         huTXdcOWsb0FOcGZQHg1z2WiZkPwL1Kv35OCQAJoUlYB0FaZuaZClTzijgyQ5Ode7Maz
         aRsDz1S4EafMVmzSvdiBmjGIH2UJZHoE/FWR3b6gl6I01I7n8OhAFXVqZ2nLK9UY6Vkw
         ngtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673383; x=1777278183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqexufECQeB1ick+eNc6Ypgl1+IbKlrTi03R5bFR4lI=;
        b=VewjAPDVCENxiTxxzvLF5AnIcLc/qCbl9X/qhzT4/cCtrv6ODbFcPS5/Z8wR4zfl0p
         pK4Lg9BXvTOd4GmAWfsXMSt6nIf1DKVpQrHNiJZyeuTUSKLLlpsm8k3hnfCvZuh7VGyj
         MzziNag2PCSjhf46ZcG5y0QTT1f9aMw3cyBEn8KKnx0jwPg0Y+5uYhrVzQZjbZOYb57A
         +vZ2bJR2se2z5zXWoghdSkT/MNb3Sv5zeTVWEFHZwisELNMp8GE9209W3wPBwP0hB/VY
         FdpMdi0a9i8+VmN0KSSiSOaCEM6G7MDMXY7U6c3L9lpoS7CPiLyKor0pZRfn1XKSssVR
         /xTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8he4oHk4iGMeJrAttu0TIOLLByjmHnmJhJPhcF8zHduno1z+AoYbQA+jpsCMkFL9bSw4xo4OdW+nDY@vger.kernel.org
X-Gm-Message-State: AOJu0YwvCtJeSQqv3xMUAehNobdwEcIDgPHZ7iMaFeHeJ78SJ6iFO3SZ
	sAboRboBrxdOh0qwU7SUEFuuuG+m7EL379pi/Yy5AB6bR1ekBG9ryL3LmfIzBLfia39pDjvC8pW
	M8dQiwKUTSRTAdbxkymgrwPkpaBBjrj2n5CiTthclB1Y5ebR6ctWaPWspXo4c8lEQ
X-Gm-Gg: AeBDiesBQZXomkJylfKLwVxMEE8Y+sWIB8+vRMGB6Xr0ebWlawXi3yscUujiZSv0zp1
	GJuDCCC2sJ+pLuibeyErWyTRGcAX/BDRE8BIWybYt24Do8nfHci3QAZptfcqz7fKZwTbsLqMRdI
	Br/kjxqgTHW4B+k3vqVFY3gtq8+FKKcM5dcESLrywSNzIRXkqAFBIQZW/RA1Gw1QxVn1lYEMRT1
	XYpBD1PZo8x7j5u8sh2uwtsT/+RcgmXkp0+H0ebc8kwyQ4tLp/BOEb516tFHFR+UuMgACvEou2J
	wqrwu7Wo32pKxOcnokYVIGl/MsP2odtNP9VmEIdMaE6tExMCLZAwDiXfCNDR60/Kv6BN1jo6XRd
	Ir0xFxwSHOryuWLYehi95dtl7j/2p/IUiWMrrMahceV7QkCdAjznSLJ+PqC9JVeioSvC9NeWhNr
	Gmp5GFRq5hssKz1w==
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr134890906d6.8.1776673383400;
        Mon, 20 Apr 2026 01:23:03 -0700 (PDT)
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr134890666d6.8.1776673382904;
        Mon, 20 Apr 2026 01:23:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm323271666b.49.2026.04.20.01.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:23:01 -0700 (PDT)
Message-ID: <43db2263-0dab-4652-ae1e-f827d1dc5c28@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:22:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <20260420034932.1247344-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420034932.1247344-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zSGyyoT--k8MPOEWqxwQWwtsjQ6gxrCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MCBTYWx0ZWRfX+xen1yJcSJNf
 ies4PQxt55/nnC/6KNGoqVnbXNpsFn9aduvTUP0gYmiIn5XEakNLE7d0EmEgEkq9l5fDHx0T0cs
 lFJQ4KCtxnSFoIVJ3EOQBonEhRlQ99WWM9QBXWonV3s6Nu84tq5PrvMWWhc5hrqH0iWs3OYBcQ/
 VUQzrw+ud3AU9gPLC/tWcOUUi0tbm1PJ+eFF6Ar9PCbGrQnQMGhHZoZdRt8gWJtgF7T3ZRBNwA0
 jkzmxirjOZ4qH8a9dQVQrK5NuScScxqLiYqcZgKzCZEbSGkxMAPR7gF4DKtcQEaIhaNdlt1WZrw
 CiFg4SDKF/tAtYaMwgtVDxy9RAuMQlxGL9yfSTwwaUjt/CBRLufxBmpdtU2FxLjFv6nYace0xoj
 qpZK+KhoqAXSdRlPw7oDKau9s4k/NRjZjYmYWkfaDbgckSgctqDTj9vFQKYfOIcw+ypIfrAFLJK
 HZEYEKC0HmD+6OUBV0Q==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e5e268 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iw6j4ArIhSFbxnb95OkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zSGyyoT--k8MPOEWqxwQWwtsjQ6gxrCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200080

On 4/20/26 5:49 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> x1e80100. The existing driver hardcodes the channel count via a
> compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> impossible to support hardware with a different number of channels.
> 
> Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> carries the channel count, and retrieve it via of_device_get_match_data()
> at probe time. Switch the channel array from a fixed-size member to a
> dynamically allocated buffer sized from the hardware data. Update the
> x1e80100 entry to supply its own data struct, and add a new Nord entry
> with num_chans = 16.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

>  /**
>   * struct qcom_cpucp_mbox - Holder for the mailbox driver
> - * @chans:			The mailbox channel
> + * @chans:			The mailbox channels (dynamically allocated)

I don't think this line is a valuable change

The rest of the patch looks good

Konrad
