Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A0370D67
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035151; cv=none; b=TGTV+KT9z28RsyXuQOQKYtY0Ei6miUHghSHJPgnCeu6rbVEzA3jnitRJRloTIzIB3zzQMGuRIs0Fmm238gqAoj7eTnQlsYdx6iV3bzN93vZwd9HNa8IXXUqCRK43N58nOVfJ74U7LW6iPBFxZrEdf64SSzChdy2VDzHMbNDrSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035151; c=relaxed/simple;
	bh=mxFI3JYDZcuOP5+ZuhPs0a6U6SGrGkPOvDAyzxjAwHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lS+0f5In206GEXAPGV5wT63zi1o/f9nG8RoQv7ZQjPKgpKOSl/FuzgLfWNvA+I7GIy28oF3EwQwI3zGhP9dzuOxfPEfUGAiRyPjcFJ5FzHrRkc+H6oBG9GAgb7ItKaSLRdpJHpMdukh3jc1hLI4kFD2Bi+3pWo8MSG+U4GWpvl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j031HHt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8BaDYuk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j031HHt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8BaDYuk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319ABn33174233
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=; b=j031HHt3tB8/jo9k
	xb99RzalIlu1EbFKvZjtF5Vs7/nqpgiYLekrEB3/ziU37A+DAG36B2aGRXA/sxci
	nTmGLISHInH+DfxJ0BdSNZiJ17E6aAp6FgMrcIu1VV252ld0+aN6lNxw3SfrnRsu
	zsshCW7IGHwddIcawFtAmDIxh4XXZqTzxad1MAkTZPrZbud5Hgvhz4g8V1RIMIls
	jtLFzXHgPFaAmwCQ8TaP1Tsnu+IobBXTa1Joefj70LE55BKS1MYsBkMXaRA6l9MU
	9MB/jOPZMbsVXp8VNZdTU5LGwZZedDYqT1GBwkRGoSvPzHQGyjWO8NxxHwmF4ci7
	cuCvBw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbg1c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:19:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ccb129547so22654326d6.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035148; x=1775639948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=;
        b=R8BaDYukvptyd9zNbTGJHx/CqsRHbzgmTPAKFFyUUSV/Zy+mT0s247IfWIDIlKoS9M
         DcyakoNAWbM/sRkAt55Zskxu8DWar2Id/l5tvg6+yG1tYBSTY/tFJ/KdgHquCdnbXtl+
         iOxYZXiKs/z42fnHTKBMEXuXkQCPKiqOGJgBpjHjcwybWqs/p7pobq+xjZw8xme2Geo0
         yBfyKFkY74/31jf2kHUZfp7lnsKXMFg2kYgF+6CTWAra1K+vkNoED/acTlPpVoLheFWi
         34ITVNujJ5q5KmPUlvuTza6kY6XPgvLD6bcKgOxB2zf1q1gsOh21/sboRjMPp9NNTYwg
         is9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035148; x=1775639948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=;
        b=ZZ8vjpKZ5wv8le3+Xzxaz02J1H+4sIjYioDEDEdasOi647NTCimrU414OsqlBVDG9k
         G+pjAmTd9qF8EUTVeiH8NwxBCiM+eSqt4V4Gy6Ox5+U61tdgg70TcVwMMQ3kgQ7vyKwl
         x+SQyf2AR9JLUtPOl2wArpxOl6ceLnxsSY83W/yH1kXxlJlGI8bp0sAMCv9TAYb35roP
         FgZCIE5iTjXxbAti1qbvoa5CUHtyENlk2AJDgKr2a0QD3cUpHaG7+TF/qtu30fPxH9AB
         tkaEDYiAIVbvc5RBIpDmy+RCOEIDCFo15Q790Ks7AszichebvIbdo+iugjjqaA9GcI1k
         qBqA==
X-Forwarded-Encrypted: i=1; AJvYcCU1WAGao+UDWrj//ac0rmyqMBtPkwwWQw+9nW0NG5I4boz9T0e1NNlbB+WsxzHI311qae9PVUAYV9d4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw4cdLHSGX598TFbarYXM2J5vR1oDuOyZRixyeg0yGzBLGGG5D
	u4WWb0reXlH2bLcLskMjvYonTAdKStN36nUvXD3RqAVgPPDk13qYFPNvxRIUKv+hnPfKck3fGeF
	kWNp56LXQD3TXfOhCsAlVNwCNMK7BKUoeXMep26szPLcXeA227Ap8Q7vFc6AQpH04
X-Gm-Gg: ATEYQzyDeR1O+PCLbzETwElNct2GM0VkQBlE/Wka+0DFMxnvJmSVCEIf4qgyGBheyRn
	GWR0Tiwp9I0OGk/mywdBiTVdUodNLp6kPpbrSULqyRik2qM+mXQZURN8cd74yKMeIf5ZjKV0C9r
	jXbp+ePGTJ6nbp4N8hs3CWUnvT/b08ttqPhmxFrA9ULOMfSDQ5zhFSevlKsU2sSuLWPvRy4KHzD
	g+rXERjjwzhFKVTKWJ4OMKAYcIbFcVrrs2aV7elbFFx/38fLwMwMKVj2TEVsyHsbQP5aiAeYU71
	NtW2PrDUr+aQCbZhU48FXNDIzH/nLK8DngTXIaoflSwE2HpqaXuB1pLl/hrrzO+m3m99Tlok4Kr
	+YHMiT6esF72Y6Nt3wXlFmoD8xv4nD6e6ncb5hGP4tDoKnunaIg1iPcPMYufGTIjrzNMRLhRVwC
	wmQqM=
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr29305426d6.1.1775035148289;
        Wed, 01 Apr 2026 02:19:08 -0700 (PDT)
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr29305226d6.1.1775035147829;
        Wed, 01 Apr 2026 02:19:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f31sm30513071fa.3.2026.04.01.02.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:19:06 -0700 (PDT)
Message-ID: <69db89ba-c917-42f7-81c9-180cb40a738e@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:19:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-3-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-3-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfXxn8uvyFi0+9a
 Ph5If+4Fh9N0XF2xlCbe+OvKEgiWhKQyFGnZMv7xk3Biu+K22R5q7bAgMycOYnNC3BdGlhfbJg+
 8HNKrYHILrDbabtQ1UWGYlJubbkcAsGYyq6fr3uFcO4P173Wzn/rMCVIgrSKqzpLqniKtuNpT7r
 dJLQgBLcGhBzIgi6JKV+LX3m6Pi6WVBzoSXRcK6PRy399xyVzESuvy4Uwi3jC0yYoztCKZGKbWX
 2g6JYLdSQB2hGJqDQNqd7NYwigXrcy2+mFeg8JnPBdQIakg3BVSqexYabVgc/RywFZaJpY/bv6x
 esJJD0aEpeR0OmGZGy4p2l8jGdSSGOlIpAxOwWU8w+IEuohImTujmqAWi1cXVAkXtThBw257qm7
 AM7JUWaSV31ICyncJC2MKvc5sjArRD6geHAxZ3+XbnqqBuVGABzZcTst+KhgDZYXbgLfapvP4iQ
 2qcPMIw7yw37oHUyYIg==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69cce30d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=I76Qk8w-AAAA:8 a=QS8LOOcwU1t-5uVszdkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: JCbxvTfPdyPEkOozU93g0iE6HvcgWuir
X-Proofpoint-ORIG-GUID: JCbxvTfPdyPEkOozU93g0iE6HvcgWuir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> index 6a31a0adf8be472badea502a916cdbc9477e9f2b..58c0dd3ccca70bce3424f83bfd5a52b1fef35c2e 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> @@ -218,6 +218,17 @@ pon_resin: resin {
>  			};
>  		};
>  
> +		pmk8550_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x9000>, <0x9100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;
> +			#thermal-sensor-cells = <1>;

You can probably add the DIE_TEMP/XO_THERM channels here directly

Konrad
