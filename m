Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2EC49480A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433065; cv=none; b=YvFikQQ6STrD/ZdEsvzIJ+ulUbcbxfOSGXHvSuJVL8CEVVhsG1MTHFo3jPwM6AZ5+/gu1f7qRahwoK8Yt1cZ3JP8D83NbPJZtUogcYA+psq2ByU9kJ9bGauOXnS83sGlfbbC5uNwemrJXb1cyFQjeTYs44XFOLNKYU5ztvhXMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433065; c=relaxed/simple;
	bh=QEo9QxrcNRKVWIrskvYI0BS2e9up5gkgj2oc9zsqXFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ff/5n2gJcA+QH1K7h2KfDZz7b3dOtG4iDAmkJMYdVMgVeJ0zBl0cBcbWKI74tIYMU3QRG0SJd5l2ZZvq9KO9cp1CP3u94zkpl7R2QUUODsOmGUzNBcxYkN/VslapM+MUNmNmwceuAfH3ijqhsxHNahp9MUF48d2cFByoaG6P4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRdpJMIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Suwu4xCS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRdpJMIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Suwu4xCS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHE4e327174
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 10:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=; b=SRdpJMIiq9NDmrdv
	UAWcFDzUt9xsWYnKUJBQih4QlR5E/gTEnhcGm3caq99WQZrQfjKC8gIORrj/7c2w
	ef9TqPTSXkvHfFVvSoOValzb/SEQbSiuSWMLO9nwCHOh+mmoooW8F6fO93Ut13JP
	HlA2nXYEACjWPT8HSIzcJu93IHMuDpz+/Vdf5fgnzzOgU/ayi0NinCCNLWYF1ZS+
	5RYtUlNt1eeGFBDEaMLvyCICVJul0NEQb6wz+I+fYqpuNRrUn1dyPuvbV0Gy8FFQ
	w9HXAjqH4pS8y+xB5HlapeQoKl2h+DVezAApTWD/60X2z5vjNv9r6eP4nrYj4FCj
	ppkyZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgvc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:57:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7ef17031so2249691cf.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433057; x=1789037857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=;
        b=Suwu4xCSYsl+5lkXstj9eGrPbkR/nP3Wh47gM4rVLL+XkfC/ofpUXyl2u0S6SWmPya
         g2lfBmYmjyqJdhMiezE+/vN0ec4D3/XVu2PZiV3tc2O96yyRg5/n+UQb99VJXYfOZ7Wg
         arfzmd6yoo+DfVaEo3DnkEyCfrtS9Z1hn7R6v5sCZVowllG0dxj9qT1oT1udBvF5SODE
         xw2TSJxDTln+mabZ2Z/xUGRJaiE+YWScg1CMoWw0s+MVldTscPKoS2tcpTsMqxsKWl6k
         sGKYbl9IATC9or+8jYMMc9ZQFOWLAFlHAEgCxvlpgSLM0kHCM2IgrteFFgh3l1DY0rm4
         68GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433057; x=1789037857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnH4y9oFKK/g7NAxKawFtUfKKGQ9b2LE6XjrMUqzw7I=;
        b=EpGleCcvEWAtJFmXaFGxXc++/8kwyGFZLdMvXLeVACGKgbRYxvTMTB++uoyAUmuODX
         q77llguOXoid5eqtPwSEgPI3/yYDHDa4mqRKwkXNqfjYMzco1BrEd2ftDodprRy/J4CA
         62IpGCL3pObWpeFUfTyV8T20OtskKAIl7FHEkBg7Wc6BbgdwsuughO2SxVRCBYJbwxE9
         zMXCP2J0fN1UQEk7mgB3QyJ7aifHpYHTsWCQomNB+TUaeLF+EPLV8vYlEOBX7SEMPRsX
         oDf82G2atYnGINVNOcx2SKlZ5kPvIJ1+LtGzzpNprni+8lzZ+b/igfRE+6kzDVYAnIfP
         Trcg==
X-Forwarded-Encrypted: i=1; AKwUvBzg6PcLTC9vWiMhY2FwP6zabhY1YXLX9I1NztgLoD1pWuZ0n2cNyfQi4upxJXSTMnymYpsgUAXNglCf@vger.kernel.org
X-Gm-Message-State: AFuF++nUPdOv9vWnbTXLVVeE+X3Ds9BkFjOA/wI+Dp5YdN9LjiGKHiRE
	40SjxLFX/aNq0j9O69TRG+o5m9LHZNgBdYfyg/IxWZ2pAWWxwNoyUctlpFRem+69TCt8zpuzzXp
	LfmUlFIKoG3EQ3AIq48kmgtA19/5KR4w80S4/ybiAfqfKSSzHmD/wZ23UicwIZqrc
X-Gm-Gg: AYBFou1qMywoNjXoboJzLrqgiYCEeOJUwLtuV2De7aLsXKelMy5mtObq2HyavfgWGkb
	UpayX9R4cr6tK/NIIuZZpW/zrPHuENCP7wVXRdnNqLPVj7gXr6yQ4GAS7Qa535zY45MqFwSwQDz
	glZpizxe6Oc2otegMGrZpm6sYvSHz/irjGAM6QfZxdmWMfYPQdVWQQMtpwk2RdTlZ8V0NVqeNwJ
	Qc+pAJqm9qNEuF2rYAkFR7iQqrFsiDPaKdpcVlvXtGqjvizskXoZYqyLbck3mUVoyPJtvqYmKtF
	lKmYWBxD6WYC7yre8FECPwcQiafoCHUawH1Vxn2UrDWfSQQsD5eRsHiPjog4jTsSlOvOqEhE2S+
	5zvhSj1RbrFODG5r5UGBEQg==
X-Received: by 2002:ac8:7d44:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-53036b33098mr86032281cf.1.1788433056663;
        Thu, 03 Sep 2026 03:57:36 -0700 (PDT)
X-Received: by 2002:ac8:7d44:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-53036b33098mr86031871cf.1.1788433056291;
        Thu, 03 Sep 2026 03:57:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8bc496sm2173512a12.11.2026.09.03.03.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:57:35 -0700 (PDT)
Message-ID: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:57:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N2XNaDtTKJqdxt0YIDQdp5GPgyrMhkBH
X-Proofpoint-GUID: N2XNaDtTKJqdxt0YIDQdp5GPgyrMhkBH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NSBTYWx0ZWRfX0vvOUSpAwwGZ
 O9xSy4OwqoCu5ldD0K9V/CpIQIZpzQbHs55/TSXCZx9jadxHE6vgboNm4GgdRInDHFnFbLCLhqw
 zkTXC9crJeYiRrtfZrqkjXUvWrdq+mcK6bBfCxDW3n9rkwty+YlOMn+UsvhKkpb/lImwgYCsJyU
 YHA32jXdL5mafrP0OwjSX1MKcIBlnI5FqUEcAealvDkZardAUhMmVVxUdG4xIZU4ww7ujcVMa34
 yovpj4Hc16raCSwR5mfO4HAk9GxAFfOKqlr44N7CmXwEj0DZENetB+5W1DgxL3KxKac+fT/PLN0
 KlaYeXB6EeqGEgOXXLdcxAGMwmivMJ2VsnCFBiDWUW4CFT6IDHJfm8JGIHJ7xbiZUtW4Xy9H4tt
 wvHY8hm7UbOPdHXIumCQZxhEQDevAFdsmI9NnY4V5Gk0ufWmFczXL9U9KRLcv8JlPVrfIvccL4O
 02T0+7Gbx2V8VGCuG3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NSBTYWx0ZWRfX672m+Xj4evDK
 aiJjNDg/cJwpYIldbmJ8sQG4UHXtzHBvChVvw/UC8jWerb4hquKaDLs0W/xy7ZiztQMywdoDSAA
 GEpEJVZgEY/luOtTH/PxLMMXW9aTmjk=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9952a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030095

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0xffffffff>;

that's just "ranges;"

[...]

> +		qup0: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x009c0000 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;

likewise here, you don't need to precisely limit this.

Konrad
