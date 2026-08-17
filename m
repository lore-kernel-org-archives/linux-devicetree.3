Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679543711C
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973098; cv=none; b=iHSULjqAR1mVVdwTugrsbnU/LyOlOEha5e9KPPxICrm5Z4/pqWB1tcBY/NVCdzI/W7dSkgM4MhsnHtaWmz/zsoZCPgqg1du3v/AtLyq4c0Pr/zR2M8veV1ohdxDS9LEgHEQ2oUiqaaIImaOGqgj6kuVHvhY6CJcf2HwS1EhE0uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973098; c=relaxed/simple;
	bh=F1GSXwfyenJO1Pubr31ZUbjndWp9oS4SeHv8I9RZGlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o98lWpzWbqm92oPA/tPNDM1McO5bOgufG47rdSeoxXzahdRO0ldbInxGWj66CIZpkQTvKBCOVUtyr1+SfGCaPy9OXp+zXtvQLbTTYu+BLzN28nNhvJHC94/c8KWnOaMwLR/7VZrtAPH5cEv+J7zSmMRlNsIEpi4ao8K3zpoleic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iA87aj+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOb2+AbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iA87aj+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOb2+AbS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6FKs1193821
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=; b=iA87aj+Z9SmKi8be
	luOzuB6NnY9KfUCiUofqNM0EyXl+NG2Tiej+CVCma3IAxAdFwTpVtRxaQJ0c9JF8
	WAQ6SylQLt2BXfX8Z8/avmXtOPgz4WaquOX3tNzvy5yyQ2uj37DsxZip/6TvoiFx
	MgEW7f8sQkPF235TI+A4kG/Fhm5dYEAtfP0ZpP30Y0PKU3OqHOa/u+yK4rnTJOKc
	4tEIMNeykXFVa4tjCGmaT1E/pcbGoMvLsdvFy2OMSeUyFuSq0IJ2aWExG9JiWZsB
	hkXk+l8FOq85mXyGNHAOzsqK/GT0P4sTB+fiAGJ3KoPnyMQN98T6c0UdlSFBw6Px
	dm4TdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1ex9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:24:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so4187681cf.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973095; x=1787577895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=ZOb2+AbSSQ+ctrKgQZ4NUieE0sf7x7lVgGxroo9pAkVyuo7kWrFIHgtYtHMt1ZiTNp
         28xLfhuVIgOPg5o5CQMGySVYlnf45o92h/Kwky9CrMegryHpl/bYR7SJZksn9cSJ5Mrj
         4eBObol0uPBSl1vh2sCLoRbY84VPbopS4gA/Thm+naW17kOB8Che9C5mtu1g95UdcvlR
         YvGV7ar0hwTk4Wo3s8Wo4atd2RgM+sZ8x3YZJkuQmH/49G+Ddu+14Hmi9tioXGhh2uzF
         bzuSRyGl52homB8e4/FsVzBFfFWSj2/gJga2zzd+mJx2KZW1pAl3AvuSgsaSA53FnO5M
         GQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973095; x=1787577895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=BNwIbAnV0ajcfPvjP4x2SmrJ1lIqm81jO1sWP5DIJxDnoHIxP68Iy+tafKHMRB0Wzf
         67u1FB/8TkLfRW5gRPb9FCQ5/fb45DEepwLSIE5WQX1+xrN1bboZbPAtBtMJgVctUqTW
         JTEIXNdqbw5h1rqQ/WVNuHHulyQ2uOVYi0teIwklAo0x7pKjiSyKkoYY9W4jebk1Cj0G
         P+WJd6UXYVGln9wl5N9x9qw/hKb/xtORk3LDgczDTn7LNsVV2q00BCLzg89VkE2ywkKN
         yxr+bysRMxsnwLXl2dFqKy887rMnEBPnare8ykWT+1s4nKVUM2TtZ4LmywsbM7A+2lQ/
         66lA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2DcuodJYOoJoe89YGlSSF5o5CuIYDpjXvn10kkPRgnCI2VBlWZxPm+3WtK9YtrvGMsXaVp5QVMIoA@vger.kernel.org
X-Gm-Message-State: AOJu0YyqxmRAlnEYXzLM1ObR9E102f7SdOFZL52lbC/xa7EH/WJRBhK9
	VjnyEOLYrTaPmdbO2HBZkKWN7FcJ1uhHEufRM+LNDFvFDK7VxkruyGs26TOJ7Af37iJgBA0HwrS
	wWMPwCV7qoqcpoAbsqdCjayFGf7Ou0fQmuf6po/1q6BCM0X9Olz/fbKMW3bnffox/
X-Gm-Gg: AR+sD11UJzbH+0gBfhv3LP419pRZC55A9TDy02WjzLkr9J66npZBPc8tkIMRp6375tM
	pKutyexNfUPMmYT45OMzBtHyaY3xKPFBBlyyVEUuHQXjL4m3qxhG6fzITM/19jhHhQifL90b2Rf
	ph9WGD+1vhUg35hQDEZxVzmkLr/+lAK5ffE07k4aTiFD3plbDKnjBpvgvX9RQcQJ0nYxG7BE9ZN
	l9gg/+N756TnjcU8k0SfUdRgkcl/5jgvWXXNA5Roj7CaL+M8N/O39swxZRPHTzw6Q0dWv4Z6zdj
	+PpzRUWCcdtOj6nNuNwph2dbdIqomvTYfalLaBvp1nrxrpoP8Lxv2Bcx7+UGzU2YV0Z/T9qgRe4
	TB7ipvrkw9I7AA99jFX1sNPO3
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953531cf.1.1786973090891;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953141cf.1.1786973090323;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66a7sm26799466b.59.2026.08.17.06.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:24:49 -0700 (PDT)
Message-ID: <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:24:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
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
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX6D5JIgQ1p7il
 pLX18lYrc2XOwp3qxntkPRF0oe0nadPrxUhHkRZZEmMc42CaFj5XoOqQf3gROby+gKLW+Oik9fV
 2OTwBuLDNJMNtk8A+P3uGVvuYJcRwABPokvN3SUmbaFXhwG+MWYwWRDKgsraqbrPvrOmdwvGdLB
 WPxk8jFpZVo+dxSJtQxdLf+uyoIM8GERtk6o5hfZp7ep3pOB324QQWsKeWV36AIV6SlHJs1hQ7r
 1VnDQP/SrhH3/rasSZLzkKnR0rnifqeA0UP2GB4fIXrf/mvFmvIC7ptNLFUk6YUbfLSfKSs1VLd
 D717cWWyWkG/jGBhb3EZwZSd30AOqUVRqn0bw8dkhQn1hV47dx5Ti82ze5hqRHtcyIqiXVdKJ+X
 ZlcJuP4lT/Z8YxdL0bQqtDeNCLFXqspGz7oa1DtcXYGlnLBWprasBFnOXn4tlIel2KO/gYdb/PG
 NM/5wlIs/BXrPEhZ9mg==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a830ba7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: b1tnbMhYQgx5R6p26t6sxSPL5FinbsF0
X-Proofpoint-GUID: b1tnbMhYQgx5R6p26t6sxSPL5FinbsF0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfXxwQq1XzVaXqA
 v3bhc2qgvsGHnul9OqhZw4REqrjYVacoACNGqkafm10F6NNYx0Cj9Rse2jVyIpDlAqMVy2Ty6en
 Y61Eb40IbQQMMTgyUEdaZC2xLbKdUqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	[65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
> +	[66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),

Function3 can't be selected because of repeating names

In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
Perhaps there was a longer name that got truncated?

Konrad
