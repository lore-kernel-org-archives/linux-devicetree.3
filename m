Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284842EEC7
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607470; cv=none; b=FTXf8vdQtEWTl9nP15Gkt54EiZDKv4c6PwJl8Jnbl2gLQl01yWDtOS+dFvhnh/2fdhA9HLzmBnFbP+8Gp0GRgH9jcpROwCGgzzu/TqM1omkw8nPjprD090kANckrLOnuOG5YloIR2+kuy7akpOGISGT7j79DiNpAk8YBfXhcvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607470; c=relaxed/simple;
	bh=NS//MCMBdkNN0XJbYUijVfTrNR78IKk61N2pgwwLO3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTtSgyHm9Qw1HXlVY7pRehQicEzCKvlwI9oLKCNPb5FyEB+/qpBwcRb7P0IEFnh38BAwB84b2ZBsYBIxxkipgG6Kb/VSUIa6fMqc6lz3NoXD9bmTq6EsdVlaNg7RlxjAQYaovl38YbEZvHys7UcJZ/pXBGF6h5E/oRfEkUlOc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuKuCI1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbA0PdiD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuKuCI1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbA0PdiD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC81g3455333
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQG2J/5iHeMqzZbJSHFUtPe02y0MfIYhF4AjsSTfAZ0=; b=BuKuCI1eW8AV04Yd
	ocLM0iolj+K5Xd7eYyKJOmrGbgjYJ5o1GkwXPF8DD8Ikf0Asy1iEuHea1i3R3l0J
	751ZZaA+qpsK6YzDcSCQZ+CCDSLqOFkjGqpukoF6P6BLiLDIR6WeucRjW4xt0sSC
	TYZrlC+RDAwJbXeI9QKF8VUf0yCJEt1Tisoaam79fI09s4oDOJIvx6JRqsTDqBXn
	wjl3zeEH0JZmXWBiIB84r2MLaqUJ9qKQldoV0PZ9yGTG/het00VpAfkZLLXDEx2n
	0SsT5PsDTb+glRckqE9sTu3kn4e16gCskD3uwwkq555utD8xBcrhcitZ3xhs28In
	2j1CqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkg5jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:57:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915a547f4b3so42198485a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607467; x=1782212267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQG2J/5iHeMqzZbJSHFUtPe02y0MfIYhF4AjsSTfAZ0=;
        b=QbA0PdiDXSAxnXee/1f2e86h6g/vaaGcUTTXJUqgBfwMDR9GcIwdbTjFaPr9Qf/kQI
         MaQWm129APQ7+UWpHgT3ufMrg+NvQ5vEkmsZEOgk774Y9ZFDLSDI7IupHuLq+7N/UYFO
         Ti9Ip1rHp0HhttXQJ3gCq3HUYAyQBCIwTU7IdlptIyzO27uKzX7bTLIc2waadhS10ifq
         w4AM9kHwdxp5mtyti2uuZWX6nJ1zHM5TijpF8OxbfYdyI5uCLmRdwcIZD87s6I5Kz715
         B+Hx9elBEk2FelMAhELAvriewLDIdIwCKDr6Wi1Chiw/wjPMSIzzCCcf9b3ttzDyV3pK
         LFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607467; x=1782212267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQG2J/5iHeMqzZbJSHFUtPe02y0MfIYhF4AjsSTfAZ0=;
        b=d9niKHclEs9suwXPGSEQlfBRZc8HjB6vEMoDFMUmVZPJhQMmIMUMK16Rl0868x3fVu
         ay8FLsXi825eCLLk+ymPsyF9GvaKT34eFw0QWb4+AjFUheHxId4Odt1oHahWLeN+bf8g
         ajX26t4YGzLIBhcUuMz4yq2AWtU0CXZpDj+/2F1euvgv/+E37TvHs1b5ArbI4UWYVvEH
         3c1N2civ88cEPua6TFMB3tJKmp1ls7OcfiIyF6m2k6sfaVd+a0ENmTZBIAIMvlzZnXwW
         YdP6suAbYn8ZmsWF4MWeim1RU5qS5EKSeZu00LzgHVxLtw6JEHlvgiKl6kKl8OZNumH7
         zHfw==
X-Forwarded-Encrypted: i=1; AFNElJ+TaljI/cKLTRaq5DPGORFle/x5FUexASzp2O41eHJJIMKB4+X8dsT9B45SzKbuArFk5X9SgeIkbJU9@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAApPsmLqYtUewtxZOr2h2DU0jOe2RlP0fMh7QJF3KPtuWxbH
	hgt8lyn07jekPp9xyBpb2ih9EMekkdWl52Kdfnl7LtYLs8rMCjW1wIKsyuDg/BS33Uz3CSU1hxg
	UlK/6vX6zetapxsaK7JecFiXIF1NRCtpZDf/6O/uTLX7vWDBOxe1/9aIlw6aGB2TC
X-Gm-Gg: Acq92OENnBkui1GzdMfvdcpOWl5no1+RTI6I+pfojstnKhfgBYHtxpsRWCwOW6BmZvc
	xB9jB0lnC/YplZlR4uf6UyKDZd72+HtlDrohsU/ttVZlLrQayaQpHJxqOe0AdOPEzb73NpCgBqz
	ua1eBRQObmScv6gM1IMlQG0MNW3IAClGGFt4ZcaTwVbXiMtxjNQP17xYG/+gT+K7YoHpJkR2po0
	iYwt2a/WgYFY6st9dwhj+B8iR0smxV+mTsMGDc55WJTLSqo0TfvG4n8FLVf/3RxB+B75rHhxgl/
	1IlcxbA4pftEKyFrQ6Cc3o+HXLFXX3FBAn9ldM3RHyt3uq8bmExdsrFUyMnnToYZr4DvPjB2woP
	cX3jLN+VtL7loLsaRjY3BgC1Snx/g6OLpJjeUxixHqFaokg==
X-Received: by 2002:a05:620a:7085:b0:914:ea37:6f14 with SMTP id af79cd13be357-9161baa4b36mr1648588885a.1.1781607467425;
        Tue, 16 Jun 2026 03:57:47 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:914:ea37:6f14 with SMTP id af79cd13be357-9161baa4b36mr1648586385a.1.1781607466931;
        Tue, 16 Jun 2026 03:57:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949fb19sm4682243a12.27.2026.06.16.03.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:57:46 -0700 (PDT)
Message-ID: <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:57:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ynEkhfkk5fhjSbUxftv_x-TRbaZvhpMT
X-Proofpoint-ORIG-GUID: ynEkhfkk5fhjSbUxftv_x-TRbaZvhpMT
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a312c2b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9WZ0TxbkuCU3YGxODWMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX4F2v3h/lddSp
 oqE6GiReaWKlBbBDfWo5rtNwndvGbHIuB5I3VmeqDmCRGIdVPbTsCHMjmWrfiT96BLFaMEbhjvm
 IlePcerlGBjGip6uxnRGlwx4zMsCfg2PEdQdtMN9PLnxqX2/8tZRzfNgci0WgV+omHDyCbiKDSW
 hkxPy1sq/uL2AA5j//smiMczadYPbnt1fToesEJmIzvqCrlIr+UqAH5bEVQPHMq070j2Em3sO45
 IO6/F828svU6cZT1l7VOIwExkHNFUJiqp0T4+x0D9AmZYmVjx3YuHAu0Oq1T/8j7EOqyAHjnlY8
 J7lLSee1SpVxf64Q3FH/1euKPQb3FHBB50+UtChjCCnXpfHFdl791aPGw4GYLMke/3K9jqt1dWA
 Sv+NTNWQnOVWYiN00J4ap6brgDU3DMmvHPdhy3bvohwE/jjLSqPExCpEZeqA5bCwXVLiW3J19UW
 rWhjCgMG2p44etVidGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX518wj/MfKQvy
 V8uqTXHUgFWrQNu5WkSPHlP8u80Q4HWj8Pwm+zPpXdR7rmj+sTVxf42lEEmCZDmP8F9IrIQj/Ab
 lJ4pcPfb/VUQqzvdhwcS+HMa5iNy6jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160110

On 5/26/26 7:12 AM, Shawn Guo wrote:
> Add base device tree include (nord.dtsi) for the Nord SoC series
> describing the core hardware components:
> 
>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>    power management and CPU/cluster idle states
>  - ARM GICv3 interrupt controller with ITS
>  - TLMM GPIO/pinctrl controller
>  - 8 TSENS thermal sensors with thermal zones
>  - 3 APPS SMMU-500 instances
>  - 3 QUPv3 GENI SE QUP blocks
>  - PDP SCMI channel and mailbox
>  - Watchdog, TRNG and TCSR
>  - Reserved memory, CMD-DB and firmware SCM
>  - PSCI and architected timers

[...]

> +		dump_mem: mem-dump-region {
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

off-by-1?

[...]

> +		intc: interrupt-controller@17000000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17000000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17080000 0x0 0x480000>;    /* GICR * 18 */

Please drop these comments

Otherwise looks alright

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
