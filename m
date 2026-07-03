Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5881C01
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062964; cv=none; b=gP0X3PANdkw8mw1vylYTFYI5IIxFHjAOHdECXDm2S6fMW7UM2ZgGfai6JsZylgWHc0RaFZ26QYHm0gWXh8xaXbSEH2wrVpyQxYhC97MoXpsC7frK1Wp9oKgl/+8inH+eTfUSb6LQdhuIM3LsbZigx7+6lacHPbqp8+8tdcCKbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062964; c=relaxed/simple;
	bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylr49EN6tMgKplxdC5u84mdjLBb40MahFzRnvY6mL/NCME08AI3EpXb+IMMWWMCHhSsxeiQvtgFEUiYvzKHcR6ti6k2C96HaMhki5thzTvrj9LdEKbrY5Oyi7dTEfb66rCa3TPknfaWr59jPMw+IbWtDtQiYzMatiu7PTfCpSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spmt+m5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6O0Bg7V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Spmt+m5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6O0Bg7V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rjEe3108906
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=; b=Spmt+m5ktSNHvBKI
	eJ0P4rvCFfucl6MpwY/vWvwUaREHxZhLd7UCu7We24vFtAfIdiZIthIKB04oHAAN
	EsNHTlqrRTXOMsx7WiYTzJ6dDrjx7wnOImXJd3x0JiGkIi5FwtHXtJs8hhWDiolt
	NCSsSlMq7BxlK+zga+pgTXOnlhcln/Klx5EfW52Jjq3fqqkvkNThWif8MEAeXTVL
	KyKoCasRF0KKCCqZdpR7GQ8z5Z63mLB6zLmIGOD0x9TboJhXkcCMOVLmMIVEmL2f
	KpZeoUnk/TV2EzIcK0hWH5l61EKjPObnRUZppIIKMkqvMx7BDbIJ8f/6o+pRa/0u
	ZSseYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey9u68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:15:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5110c89eso7060085a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062959; x=1783667759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
        b=b6O0Bg7VatTNQnCWxGKNd+Lp2atwYEeE4Md+x6Bvab8jr2ZX8xukbm1dxem/ocgYOn
         PJ4HP6fx7QwFxZJSse81KLHe5jitbMxCK0giVt8KY+haRuPkDIk+PRQsUKGWfxyOotah
         pZv1AKMjpaZA4ju9lPPTiz+2KV9iOL9dG43rrdaidiAkXkpCo8UVa9Y3V2Lrmz2YSJQy
         5gXSg948GdPlvn3B/bQO6s1853jDeZzc6b+GsiJx5MFQtUExG2DSU/pEGuhlEfnYBWz9
         2TdfMnWjtS39Dcd++L18obpyF0pJ16KbKgJv/wanuV5Y9zz+dDiLy0OLdKikCCjPD+x5
         Jsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062959; x=1783667759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
        b=FFdjuvlqyM5ScSJESr+oR1lSWZfDniqlnT7wOzMI/YH3eVCZBmsKy+t8APvpjvCH0k
         E69bRWjnaRpA/K1YAQGc+cVboimgyKaQc1SSLxBWumLW4FI4ka3WwU3MBo//jThpwrUN
         kTEL0HNtiqgq3CZqcZDYywc+VAf5fIFDKnQobV1eNF7VpJADJyq/2yRiYM3H/ZP/Gd+s
         1WqQeUSPKvtENiv4+ds7rHdFLiQAmy+P/3QkqlxnYp3hNGBiULhYj4OyEfSFxWVD6TRI
         6GsTsfqxmOSwyD8Oy997K37nOIZ+vrSZ5ZH/4mUNSN3TtJbDasBm2McMO25e88vVsCJk
         Reew==
X-Forwarded-Encrypted: i=1; AFNElJ9YO8bzRKy7X5ydHQAm7ZmoWRnKHg5YlCfuhyqWA8IEWdWT5s5L+I4LN8TwDCgn2gbxn3MOAjZy2/kd@vger.kernel.org
X-Gm-Message-State: AOJu0YyKzLFbq/WYaAE72fQKV+Xs8MTqSGLDDus6wAO7QLXlhpT36I9p
	IFPrpGzFrXxLOGMQil67VAeOvYCsSqjGkM3Hd/HwHE3US9beMOwIALAhVzxX/51FiUyu2d3R00d
	XKTVcvxSjjX0rHDM7mcYO4VOtTe/0i/UHZf2N7xlEd7FVm38OfSvaAwTODHsbH9A6
X-Gm-Gg: AfdE7cmXsRXQh/mRO5Ez/6tWzI8Q0uKl9aA0MWH+NKgX95d+hJknlRt7CILxuVlW2CP
	hBPLfRmSlI51CH50gt4oeBkzMD+WNQQix7OJc4aOVRlmmh5SpPtCpburjyCSTpG/fS6pCk+i4jM
	nrHg5WgTlrSgmHKP98zBlPEITODwwCtNYeqiUlI41p06aBe/LaNd/WGC16aA6/M5J7wKKN4ADvl
	UsUaKy7c7Qh9Ljgleg+YBKiJHc0nKAQwNbu1BQ9wDJn2Kc3+KZZTXvod4oUPkw9gdTPY/CWll17
	opwsW343uvD4um35/Na3fn1yjZhQGMOW9q3oz3msV+XN7qpMgjIAfHl4uXKZHbnmQMxjSC9Zio2
	sdnHDR9m5tjJSut/1BUZzRhZvJJNdRTPQ4jM=
X-Received: by 2002:a05:620a:4724:b0:92e:7662:8f19 with SMTP id af79cd13be357-92e784f3766mr810629085a.5.1783062959474;
        Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4724:b0:92e:7662:8f19 with SMTP id af79cd13be357-92e784f3766mr810627685a.5.1783062959105;
        Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60550desm244113466b.7.2026.07.03.00.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:15:58 -0700 (PDT)
Message-ID: <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:15:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX32gYbGU1GKOA
 S0Pmen27IVH+MJBGXKh7nVSU9rDHj1mFxMEU3KgstBDnlssldkTU8NQAZVLYNfePaJAJ4Bqex86
 kbLIQStCjSnnjzC9rKZf6ZqASw/U/xWyl4/loSjJY2PFaNACSrSxAL+3uFWtcVHahqNu1AX9ISH
 llJ6pzDrkUVdklxp5WsSgFCW2kJ2KUvDG07DUQ61J60P8K8RaMDoIeAUF1cLNSCWuQTJmNmkPDJ
 15uR1cuIJR9Xq9ktchLu5UBVjH6/0aBx1ch8vnMEVy/B+KxNzkVdnB9qH63QnzH3qf0WV/LmrBG
 jFrWY0LaV2nfdO8+Fy+W08VWNg9UGzE/GgdfhKRFXBeRzf1SStnmuu94Lsqis5RauYHpnSOvQYo
 UDU2I4RzFX0I6NKObTulW14pD8E81AEaAcBAJBAK/nx14x6JGe2Sz19seBTaAo37cpkgIN+/lv7
 kwUNqxiSTSYhqBskhoA==
X-Proofpoint-GUID: gTryFB0XYp4Qtck_3My-KH3Y811HdJHR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX2N8+IwveQiHo
 TiH94W/GWCt7ge9ppQbOcmp4g3hxIFcbNRkBpHjmFEAgOs3SdFNwpl2ecN9/P8jtvgHMc6NFFLz
 L82EKrml06LXWK1DK0U5DWKZ/CJXYWk=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4761af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IhUa5yoPuCKIE7YosB0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gTryFB0XYp4Qtck_3My-KH3Y811HdJHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030067

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the DT index based parent clock
> lookup to align with the latest convention. While updating the parent data,
> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
> frequency tables, but should be corrected to match the hardware clock plan.

That change is invalid according to the agatti clock docs -
DISP_CC_MDSS_MDP_CLK_SRC RCG leg 4 takes GPLL0_OUT_MAIN as
an input

Konrad
