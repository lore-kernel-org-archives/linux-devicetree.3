Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F144247DF9B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326931; cv=none; b=WPl1rzBdBV/ee2ALNP4Zs35Bc2zAxlyugMA4OSsNDE0nW9Fz/ZkhlWaIMvK2QTjwATGK34IE6v8sCyIYneq23pFnI8VACPT7umGVjKPPRdhVn5Eg+fmWnMnjFlkNsUBXNPgkw89bUwCzVzxUxZ16YEW9ZCdVCBnaN4E9s1KMZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326931; c=relaxed/simple;
	bh=PTACpgriF3fXFc1znUvCKOHkbE6BdgVeSMikchLtn60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhTN9YoIiS2Jj2GH29rM11Sch1p8tAoeZy4Ds2FLZPLn2F5GM/qWbL0K4uV9CuU/ph9Po4BmXtyqni2kn+rwSkIGw7DPFqqoCXApZwowT4RJF4TAc+VlFSlnggkHjLGR0Bgx7rJBDm4pRSqZMwH7J81apbTYAlA5b1fMst+yUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJaypqnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUW05ePn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJaypqnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUW05ePn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBv9Dv1982016
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhc2V/tJ39Cxy8zcEAYYMH9/BpAcMyrPkXXGKtbgZGw=; b=MJaypqnL0eWQCXCd
	bcKIJi49b756Qvvb88O5tAGJreZdpY794n6SI+l+2i0RXPnrkFm0CtuS7UeckuWf
	c3d9XNpE1Hg1xxx7jsdkRAOil0hTNARU944K1yqimn8NH+EbwqjDNdZymYpbsDQt
	sSGThJfRCCN7lNoNa3+FbEiAnHoYCVnUnHwcqNcni5PgCM2l+C9+ELEk1h9pY/Qk
	PLW3ViXmSwAV9C4hdT/Q24ikwVb0vPyyw3CkzBQKmwG24vY4FbH2UwdkVGw/3YhZ
	OuO5MFDuk5YPUtYPVOLxJvxHr71Y3Nso8sbI778Y7pgx8xhrjTZUZiXO+0WZLk7j
	9ojSGg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3gg1gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:08:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf89cfb2adso15097e0c.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785326928; x=1785931728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhc2V/tJ39Cxy8zcEAYYMH9/BpAcMyrPkXXGKtbgZGw=;
        b=cUW05ePnFGQ3LY2KR1PWd7l5UlHdlNYYIRmBQKduu36gUkF7EnAW1/vabJmk0XIbgD
         58LPHvqm9OYMst+2KDaSGKhCjdYqg1Rkw6urMz2Dir9lG0CGPtEmY2QXuv6+8CT2EC04
         p2C1RbSKCX1NhHQEumRFnsaQF56y606/mQGLXUF27zLKM1xS3Q0J7qtecOIfQ5ps8MYH
         DhgnvO2wkTDTzZyFFr9/CVeGrHIGQ51t9+AcbHqXIXq6WfH2Ty9wGfW/v0rGCE+SIIEo
         tDd6U3qvT00xcLAEqIpx0HPNSllRWgRZwVpXGD2rdW7r4mQDh93FpabZrxaeeTQJYPIz
         ejTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326928; x=1785931728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhc2V/tJ39Cxy8zcEAYYMH9/BpAcMyrPkXXGKtbgZGw=;
        b=KC3PEh9uJx+iqj0FqMbwQ5KU8UpUY0QsY+RQUClUiSOW7B3fB2IR01p3D9aDggl3cR
         9p1ubUaeECcJdRAytaTvcLTbUZZuQRB7wCg5H7CmPXZUsOsjKCP5xawOGYVJrBITsb7a
         hEx8O/ZkSEaxXMz4A7CQD+pSXF9oHDFN2mu27A6JTBuq12LSA5wCqjSey9Vh8Bgsy4f/
         HydtUagu4TwoaFEs78xQrnHMjGV56zDe8c+wzW8KJ5e6cW6g17LarYfNl4p3pEZVFMsm
         /PeaEmFhcbiI/DCHbKRcCUwzVrXuusUf1vKYI2KBcThLZZNNj3jRf72qtKdlfY9G5BtG
         XPwg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3/NjBj0PyLUhvNRPL9QVZrt2gD8nX9CXR7EtV8DBIp6Qf7jfXATmwxhNNthM5Zqvz5UpLoSXLcmQD@vger.kernel.org
X-Gm-Message-State: AOJu0YyFjAhLg1HysH8YCGZGY2lS04MLAge6Id4INXmL4Sf/gMFWssQw
	5MMyLk3oyHha5XyI/Ida6F+t81LyoWZAm3PTrdy8OCpg1zVdt131c8zs1fqHQaezrnAKTLCPGL1
	GUb0tvyRlNmtY6fRn6lR+iPFlRvxRoK8cIj1tNZMGGQ5SL/ZGFXGvV7no66/5veJs
X-Gm-Gg: AR+sD11oH+4g9BkTVSt6onZ9vBS3vMLhjLGsY803dk7wWEvYdpjC/i4Mb+NrdneOZmP
	ufnhDTMWtE/GkbNk/A/MJ+w4uXmMfE/bPH/dPKWz3//RfHqXLkkRkzOPlVeYR2RP4eZYa5YLOEm
	WH+NWx/T8uG9WKFU0LQ1v2EBL91/7GVqRjeSofzY6CYCs+0lhpzKaRZQkVufdLH2mhdytiY+A3U
	X6lSTRkTEKASvHrJxtpLtA156UMJzUkFKyRFRz4MIwC/d9wUQOr5M3snepXf72qPsG9wJTMayzF
	qTBSQTEa0ju6ofoQUhdjNujnC2f+PyknJdRJSR5pv1BahQHL1YYJY8StrnBwbivlVCWGYdleURr
	NwG1b32/54vRtC24wssPHoNB8
X-Received: by 2002:a05:6102:3f01:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7549c77cc44mr1326093137.0.1785326928132;
        Wed, 29 Jul 2026 05:08:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3f01:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7549c77cc44mr1326069137.0.1785326927671;
        Wed, 29 Jul 2026 05:08:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050bb9f06sm746967a12.3.2026.07.29.05.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:08:46 -0700 (PDT)
Message-ID: <11f0df89-8bd5-41ed-85a3-b7164123f8f7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:08:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-1-65e61a1061f0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-08-dts-v4-1-65e61a1061f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfX8/0RoFmlRhgB
 zh+TtrJ6x5cC4qq8gXsjB7udkyecoYS0E03i1F0/YMLjP3viNEk8bFsWTDbpu44alcHZpZbEg/o
 Jf9i/osstphTfXweDTDkFpj+UiSiLiAcwY7m3aLJ919cFNiiZWtnEIRa3v8C7nlVKE54fnJgBwV
 EcTsJ027gajUAckFbx4/odhpjHuTgrI6DzDpnl1C0BZJvVY8t0Ocg8WjxxO4z/wPfI1V3b+qpoQ
 8YAk7rQLmUtePA1xy28sqij7vrzYRtXmn9O+nIxoZP1s/AbBH1pg+QmXuKu7pRnLGpX0UYKKh60
 utsaFzkRU7s0/ySXqYw2RtMkwYDT1ifO5cytv0UD/SeK9bbenA+2NGlqbpES829bMqyvuQKbq+k
 DtLoiRj1Urrt6fLJ8Yn0iQEI7udjA/1LrWhOE0Dj595M6kQDX5Vl8psLzPdQUUgVESXC/SS3Kvr
 MF5WSn/xRD4ySb9kKKw==
X-Proofpoint-ORIG-GUID: 67TKkVAX_Xwegq2_rL3xSysbHG3CObPa
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a69ed50 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=f3PlIj8-Wq_HpPfY3gMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 67TKkVAX_Xwegq2_rL3xSysbHG3CObPa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfX72qFGE9xhaEF
 cPl0IbZooU7oBxRTCTdS09X4UACfMPOGwO6X5M8onHpfjWpUCLColuGpt1HHWtNqRPSUdFGjDMX
 oWPsfz4zRzaAsbze5cBeoUkNaUiUNOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290100

On 7/24/26 11:54 AM, Varadarajan Narayanan wrote:
> Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
> can enable the hardware they use.
> 
> Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
> Also describe the CPU OPP table and CPU cooling cells needed for CPU
> frequency scaling and thermal throttling.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


> +					trip = <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */

P.S. This comment could go but anyway..

