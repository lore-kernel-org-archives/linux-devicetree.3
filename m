Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E0C2C21DD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011480; cv=none; b=kTOEBg4Edx8YsO2M+kXz2skrkLfqdqS3a4d7TzzPvtPRnlh2/eIklZmd5zlMXEsmRPw4MfUy/ambPEW/SzW7raQ1cuB0KVVcXl9dyJbHIeTCZyeTXNgw6kPjT5vpH2Fz0phFtqj1lgg0AXH1dKEZFYsAb3HlSMApYFX+TLC7nsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011480; c=relaxed/simple;
	bh=mNrOaTE0g5btHJAkH9znuBBNh9gkw5ZF+RBUq3Ym20Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8+wf3BHwwJrVnUvAhMG7hEy0hiFkl32Xq5d0xUoV1h4V9GDpjAMrGNm+MnM2CyUkvFJYC8avmlyuFmzRoyPCAbyvNtU+5eKjWjjskhRqxgWx//h4acHMZmSCOMePrzqVIkk2/70OxqPSxOzk6pBBWcWQ2TObunIb4jTrc1/NTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eropqvh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx3FdBXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eropqvh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx3FdBXC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClK8t652197
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSi6mbjLTt4yXQTEdhbGqtJWyZrXV7sPpk0t12kGMmY=; b=Eropqvh7d91kVX8i
	H0Xwow4ZDFnMtPc3V3ihNpeHvOTesHZ+yW/+cJ1gPNWYKixiwzPisOoS0dnhwuB8
	r5mtOPv8wMLEUraieQL5tRe/wqoXsNwxTnCAh3NhzVhFnmGQ5izKn/nKMb8v+md2
	l7/VszIr+EPdQ0abkVocbHpe1rFYTccIcZj8ZQq5mRtMaq+zq8ZkvVbFazcWlf/5
	+qR+PwzcaYG4KX1Pj2nB4k14uRlIJAVOTtyK7CEE7vXWvKynIoIrXm2FvMF7p+p1
	RaLBFYUcpEyumgTCmjSaLC+G8QKZm19o/DI2JQGZf03u706NdaJSm+p8t223ya5Y
	/7ppAA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ssc2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:24:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c4b898e8d8so322755137.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011474; x=1781616274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSi6mbjLTt4yXQTEdhbGqtJWyZrXV7sPpk0t12kGMmY=;
        b=Gx3FdBXCTATAmlT05J7jBW41FEVXYrNarBrZ7nJTeH1MJynaOOmfodzv5s8LYTWNZc
         ZW58rgueltcGPvSvcvv5ZrY/N4feDZTk20LAIbZ+3HKpYR0irn9ccDGNYVj8BgdNMzlQ
         LrJ9MbsFgYliXVWNrHIGXh//hTm8m1qBkYwGBRVgQLR3sTScXth1hQLFRBO6SUvDlsjI
         6fwehMmPZYdiS6rNjblO2BhGvuF4LozAxYAR3fYfP1ymfCEZ7f41Zd+7o2pDFKuErsGk
         vtrAcUMR3q3sXxcwbVKn8aO4hyc26lMO0XQ/hxE0gdxeqCEaMjSMt0OjeEs08lPESwVl
         kODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011474; x=1781616274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSi6mbjLTt4yXQTEdhbGqtJWyZrXV7sPpk0t12kGMmY=;
        b=dUgp6zxBzEpT35hkzSRH9NDITiIcEyR+sNrb3c4JgJZgbBns3Knc0ad7UX/tBLPYhT
         KYN6Vn5oq5KlqwTUJf02oq9p72o98q1e+49YCoGk0oJQqDVVAVbqgIcRkn3RypJyP3Gg
         CFzGTUCugpPPILwgsMCnGCnPsG2b0CQVowplG6TBsb6E3z7Cqf6JWy66Iwq6Bm2IQ4ZN
         lneL1gXvyk+k6ZGNL0Ymvu4lXt4c+lhIgR9jZnjtRkkO7arQKThvOkkIiq6odULJ0jB9
         xpAz6kJhPSb/RnbYI8vtZ9Fi3iB99Vm3tTZIIv4XZTTE/CxrqzPIHuA2IFCpQdE9Nfcv
         c0Sw==
X-Forwarded-Encrypted: i=1; AFNElJ8+5/uArlFP75E9KMLzmXrrRu69qvWuxuSAO6bLYO1JufTI/0lsYzJPnTIugVR018srxDmubikFWWXF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fMG4lKsFwoztFjhhZFT52aRZtoO55SpRqqpMSuPK/gaZIj9J
	kI9N4h/D3SajV8AtzEFVI/sjqvNgqZX1uUf0MmUPInMVC0RYgnmDYuPnzDgGMNgGEY/7vgAqOD8
	3U26CqDDbDlFQVx8tqTh+bO1mRMraohR3wcBLo6vpOyG/eHFzbS8blAxc2qYANatx
X-Gm-Gg: Acq92OEf3zdrg6RlGUcBtTXtQB5mfzAY3yLWuPo2rLdz0P2Zq/RNMtjMS+GW4+qf11F
	PjP1QuZ/3TlkgXgpjhL4h/IUqULzUSOe6I3KdMFjsPz1O1xG8770ILGeUW2jznoBbas2W2qsP2E
	wpXiaWo+n3KU72TTAfFmRmjg50zrShy+zS/AiqiyJL4ERlFYa0cppnUtjNEI1+vpzTjq0bZl9H+
	c9CfFlU5GZP/i8AjtDXemHM4YZTMXX2+vsRiiqAKqslY+mVNXpKZDi0i13VlOz/ZvMV1w8RDBs3
	klE846Ytmg91ucVnbK14Pja5fWL59vwU0U7EG2caZu218/znFM6OKvDlhj/QBWALGPrbwCttDP1
	/ytXiAL9ndV4t4x1Hfz+mEFyh1cAQ7CIN+cOfdSQcMWY9EaheyCm3zj7C
X-Received: by 2002:a05:6102:1487:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-6fef3c04af3mr3212898137.1.1781011474284;
        Tue, 09 Jun 2026 06:24:34 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-6fef3c04af3mr3212894137.1.1781011473857;
        Tue, 09 Jun 2026 06:24:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912faea64dsm4883372a12.19.2026.06.09.06.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:24:33 -0700 (PDT)
Message-ID: <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:24:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX5rQaH6/3It+T
 TqSV2FOU96orm4KShEStYSIaoVqCeVB8FdCy5QAyEtv36n2WoS1upp3Bl/QlttPgK2UHzYorRi3
 GEKSRVUKATSbdT13x6IkmiVobQ2xbG0iwJPnqb6tP6nDS8ASNwMd3G39gIcux+xzTe10QbH2BG2
 Rin3BYtPqTa/OsxybzbXEhZuwNMyfe4v+xTm887/qKqx2ULY7dZUrCsGt+lOHGD7BmuOProsbM5
 j4J+ClRkLek4MX1nL2k1/MQ24ovD+ldAGFhhQIkuadaYFO/9ii8ApNeK76+zGFKHAIQZfPKT0SA
 YPJCFPS2EyF73tdH3sqL6AGTfKyIcuKrqZ8CSd9FSE1La26oVV9H6ueCFZWTyL+DSyycgSMNuit
 R9E7q0VM2+EGgcumqmnA8A0ZNLKurYEo9IEePxmpiYOGIq/ppxNCBcYucIwPXxVw+HTZk+ypD3H
 rdZV6sFJ8uSrZ8ISnqA==
X-Proofpoint-ORIG-GUID: qCTfIaMloPjrtHWsiHdTsXXVO19td9FI
X-Proofpoint-GUID: qCTfIaMloPjrtHWsiHdTsXXVO19td9FI
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a281413 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IMCAxTU7yX7nb3N5cp0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090127

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
> clock divider. The hardware generates a fractional output frequency
> from a fixed input clock (typically TCXO4) using the relation
> Fout = Fin * (M / N), with duty cycle controlled by a separate D
> register. The clock output is routed over a gpio controlled pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    gp_mn: clock-controller@88d3000 {
> +        compatible = "qcom,clk-gp-mnd";

The compatible must be SoC-specific, looking at the table, we could
use these example socs for the versions of this block:

8960 (v1.0.0)
8974 (v1.1.1)
8994 (v2.1.0)
8996 (v2.2.0)

> +        reg = <0x88d3000 0xc>;

Let's map the entire 0x4000 that this block spans

Konrad
