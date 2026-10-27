Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080176;
	b=q911xVrdsu1cyAKxLBvv6RHiIY7SpoB0il0d8DYbHJNVnSKAKaXSg8pyeD+NCe0Wi+AF
	 hrSlpUF0J9WLCOxKJBlqt8HFoJC3UJ4vH0wsa+m7CcyNGXyEi7lkQkTdAqG77JmKqFBGZ
	 /HUyE7xM3yRqZt1S0jLKKWnumfkQm6LBL5v0gYsErkz6+3sJafb9W3+LwNl8bAU0cunCB
	 0yL8XW8K0x1VHEScYUEw9/3u1v6ICApo/JTTDglIoGbgzJy14/7hsdkI/sLMNw8mp1fHZ
	 wxW933CHPGmKjiBr2TguJ8806K+8elzQiJaWlaRUJHMbTLS+Ix+yswM9+qepxeTR3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
	b=hScqPRlUYbWuNbbpimov8E8DwSslzVrTz2snZ56HENJExRFRakYqIWi4Cn9qsUwRFqFp
	 k4t0fmNRjjV8V7w7YgPU7Z5W4C1NYXvuBz3CHjA96otitgpVosXBdEZsGOR9lelIW4Xmx
	 l/331QNNzNpyWabr4EpE5QxBQFidmtGR3IZzNx01CAvxZhjhSfLOhjLh4VkdAD1OqDMfA
	 NL00xtQOb/Er/YdTsaqScr3Oovn7avdE9jRCFcVogl+0K9wH97/8JluRazqewhiU8gYyG
	 Ptr8jOqwZZlras3o+btpbvcN2XN+voVv9C4qHRUXZ2r2I93zFsI3tZrTaiuxaGq2OUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpxGzwiZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1kPF1X2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B5A606A31E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpxGzwiZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1kPF1X2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZAhx1259160
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=; b=hpxGzwiZiSlsGp3P
	W9QLw6M5XPzomtb++twUI+iwwedHrG60xbKa5/ILDrcktnaL8yM1xnhnQSJd+6vp
	LlMANgU6F44dEUtizmCSHj2LVn/A8yK8VbrPG4P09Y8xwRVdkFHNY0w+6o911b7q
	ZkYvQqHC1oGi//5Sru+Pqu9NiTyW4IjrnN79PHcD5syyurmMO1kHdy4pjt3oY5l0
	n9iFcrZtUom7HSIA+eBGfzZhPijKgXGmLMkr9Af5OvxJbS+pdXMpJMayHvcErtaw
	pkBQDOkZOtP1h6QXdCOH7IQ/WAZCoOEVq7Qfs6A7DLIX8aYCC78upfwusa9y20R0
	GHixMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavs9ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:49:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so71681eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 22:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080174; x=1793684974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=S1kPF1X2dQElSSRL/X4eRA/IESC96043BV+ewUBnp6mHjymkXvsxnAnDXQBxPr3jJf
         9kbsZyS3NuA9T9f22dX0U+SKMiZk0Q7dci3wGy/R8Ovi0p30hfql7wVhwtHoDHog3NIW
         64YX17NFVuvuqnTT8XN3HX3VE4RtR/dDlA8FGOjrJpn9NjEpy3yJqfmYpC2STi+aaVL+
         KEM8fL7MW8kOyIWEqVaNASlggeAHimxBbmDgKBzfCMoAUuPqpiNf/AITxvr6C3Fl/wOb
         GM0Xtplge7v7OJx8gqchGf8RhXkaFD08fVd5LessAYGEcXISUN2ge55RLZKywt7RW26E
         Bp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080174; x=1793684974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=TBmKFxoBYaGhQrQIc0sgbvC+FQebxVNrcjyeiqmYNZ4aoeO5BPdNDYqoHsgzh3RKmX
         T1s/S8XT+xU5q1kM5LhNQjPGN2p9oeWfZwMJrPxhy7cEBHXIVQQRlp+O0aommiM4lsoO
         6p+oNF9rGmwks5rIV/KZTyAGU0Ln/eO0kEeiUFq1cdI8LUTZDVKIaNJSaGu+sF2NUINj
         E61vqnoOzvwpput/dJx/tEwJsW5W3jjMBRxaepcMynzYxKm2FNoblrxdpQc2EzabJmvu
         3l58wCITz0CuIm6DKxpqY30P/+GaGXReqK8QYM2ow5RWCEJOY5LmdXhsM/XI8mhHovfp
         xdmA==
X-Forwarded-Encrypted: i=1; AKwUvBzy/GwvRw1GHoGdwhvTfsZ7j7QAAxjSpVA/SBmr0LgxL8RpdicrcKqwDRb2zH/GgorCpbnpwtYccAHt@vger.kernel.org
X-Gm-Message-State: AFq9FYKKQd5EDIj037Es/eHQru5Y4WJGpk6RqVVdqEz0drnBm7A8Vg47
	eJP4u0CZmFNn+3AjnIvlICU7Zrg94PfS/CVrem/kt03dokQzSUdgxUIB1gHTs1hXW2cmuxnODJS
	hQQlkA2tBNOicWCeseUqV7bMTNU/Fr+y8k4TcyXvFWRIptNRW/wMGWmep+YXGeLKE0qDK4uyp
X-Gm-Gg: AYBFou3qxMpeGkOCrkkl/fhddYkwtVqks1fG2qrnZS2QfMRaKot1G0Ioxpkuo7yDQTJ
	TfuX9G1HaOEOUnjc2J5DmQpBlJRAJwCp1VQ+CUEfe2KzluWpbkyEs/NscUOBW/OR5aee5PDwwIr
	8GDn3bdnxeylEZTuIVLAHs5tEX4yTQRa5D4t73opnY+al6QTMF8RQWIFv4maFTx8zvrBbd7D9qq
	4pO1NSqXUqZX61bc3UgCXaS6REwtRqAbNMZW434nwp1XZZHrUKLhPfZi51d9L4G8zFKncWrBYNF
	APld5Vou3/XF2IGSQpXjKUqsJY7IT4tt1/OvcRvx5Cjft0stwLD79dsf5L4OohsGv5bl2xlbdSI
	86qd+d7rQrYHGxeX46f8lPrNUfg==
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031707eec.7.1793080173668;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031669eec.7.1793080173027;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm35294210eec.13.2026.10.26.22.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:49:32 -0700 (PDT)
Message-ID: <9cb32956-53ca-4f29-95f4-ceb629b9e884@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:19:25 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
 <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OjD0rGqSPj6JEvSZa8n5LD1xs3MCNsCk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXxPmjJldZiuSv
 /svJLNJn1DlIuvcL1bAIxnHhACjiA087OpRTIRs8SLU0ixzpRnx1+V9YkkbwrJjbH3JeJij5qeO
 G7vqYZpdMDDF1fL3TKz3WzjTXJoNIN0=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae03b6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3tai7eX4eetm6bD_N14A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: OjD0rGqSPj6JEvSZa8n5LD1xs3MCNsCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX1ERqECdribLA
 n1eeymuxgSp+Qw64MBICPEdh1G2aj3UBd9SPNHC8i+kV/CHL0sjvtZE2ioARuzeKpqieAhqw6yv
 crRY88uLKOCCh45zX2cgZb2BmS+9rL6q7nmcFsa8U7rKTBPwVuVzUxm9An8ccZMBGKdjyHU4TdK
 TquokE+oDOpYAh9pRgstSuBywsyBhKR91+qxEeI3PlWId23qleX8fyKEDJ39/2HIFdWjl27Esz0
 BYC6wsdzHegxuTD6ulkRTJPqei25j3/E877qgUhA2p9wBXqASVmlnMRQdow0X8EAdeqomBSes89
 al2k5G8xhKj2mMafm0a/s1IJZEV9Jm07PQWdiIBDuRS8OUcRSA0ae2EYSugeniwuIRE42bNmPSa
 VGbcilBntMU6SIMH8uOxAn/0oCiC19Qw3I0K4J/cVwTKaDSGWt5f8uFlRt9xrxyYrXISXdiGxty
 I1mzr3L9tkrqniAGBLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270022

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> Add idle states for the  CPUs as well as the whole cluster. This enables
>> deeper-than-WFI cpuidle.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cpu_pd0: power-domain-cpu0 {
>> +			#power-domain-cells = <0>;
>> +			power-domains = <&cluster_pd>;
>> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
> 
> nit: ideally <&foo>, <&bar> instead of <&foo &bar>
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I will take care of handling this in the revised series.

Thanks,
Sneh

