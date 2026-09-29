Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7436438F658
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665318; cv=none; b=Rs5jwRh9PMLCLStw/aO8PolZ8UwWQHr0gVTKw6Ns5TfYJDSDKcF7oZ8Z1Xq2+wDfDPmxTVlEjCKUBuNErN+V1B9to1lbsrrpsKXhgeUoNqpR2SVoNIU+e0IIHb9T/nX7xg6UlpA90fkXnrg0oPpvbPtDfIGPAHZiXzpqQgRdV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665318; c=relaxed/simple;
	bh=ug6onJikPynoPb1/wMm1p7ik/T9fv6Wx/1wYkf2VHzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGGG9+BodnqhWjP4CSkLVft2PnFB7Y4oIRZ/pXszlw/X5z4LSsLXRhkFBU3L9yvvh93XpQRSm4n789s3eYRxAghxlLE3FOK6m8QhZ22NDkqbqpBg8kxTbQYS9nt2pcMXkY7gXuxCFafcqI4pPifJwxhpkOruW/U6v7VTly1H0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irY5eqh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiVKQ6Wl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irY5eqh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiVKQ6Wl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T5j4gY527030
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=; b=irY5eqh8LFds3Wrn
	LL7dGqkqTzzsHl2HervKA/a8JLkEb0VPNMlnc7eUuIuk4w4O1Q1cezHOM3cyBZD1
	qyfkiJT05aunzs3UNulukqZfg7QYbjZJ9e0MdcWidmqrdWLbk7R+EWvLgOv3TLIY
	0ofVs73zKfZhLJjDQST2GqWiTP3g5SwO9K/v8dllOkgq6XP3BmjeEON+RN4az/Gn
	n9hfy9SZd2cQZ9950ILuVsWrpoAN2IyRYYjzp76vg3eHJZmXWMt9jGMGjo6jdNO+
	9TU/b+LW38jcOf8x8TAY2lpcK1xA/rgPDkVETvxrI2y76vgm70Y0cVuuO/jY/3Dl
	uBkZKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03jp3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:01:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso140547a91.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665316; x=1791270116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=TiVKQ6WlLm05Hr5WoUT4k/jfY5pi/dKNHoOlDG1Np6rsaVn+inmBvckCaVLUK7ka5E
         Bx5qVQA5IJ0rPMNE98/wBrdIib5JETVU3S//uJgWmkD8re7iSfFD7Q9zLS+zr61TBhED
         PgUM7zKi3mYPcVDyxcl+qlMwfjONbuS5TTjmWkG28jhdNf/uEcMDX+Zz4dfpfgTqfAQw
         4Yq28uG0eaDT42iTDFOVG8gSTZqFmIwwjdV098W15GCE2ytgi82CWZ4la8H5BHxOHVYt
         gtfbR6e8rcFebMgCOfdouVp7Cgd56SiQqrN9DkuPx6jxbJiKAxOvl1nmLNjL7rAX11d7
         LBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665316; x=1791270116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=DsHEx+h2/8ZCfPR/4bF2mpD2Mf16XYzCYQsP2eFWcfeUle+1Nfygj6bCa+PUAbodJt
         dN7iY/FtpDWh+F3Q1wq+gvOMR8K2U+dLxO+j++MsWc0J5Rr1g5lUggSPswzr30Q6muf2
         kJH/GpWiVQuzNvkkDkl7RkZhdLnU55hgA9FWZMGjK0nkKKjGBFTo/h8kAl7WMQntgF0f
         24ePjyMoVDV6bv4YJJ/sZt0kvCWt5rqBo9DyjengiUAk8egW2eWX32roOeuhWSU/BRDY
         tmGule5b6OsHL3SpVkRhnEFvI6TaNqwt9PvnB9qIVtS4MmnIPoUzViBsjHLcnoq7Eoz0
         /NWw==
X-Forwarded-Encrypted: i=1; AKwUvBy07IMvqgSuApyl1vuLowicn7IOKQCQkQ/Ic7jvWL4wW3mLQs7+RLQkCuzQoW80oIFkykxIBzscj13L@vger.kernel.org
X-Gm-Message-State: AFq9FYJkYfSmj5ngPA6BN+i+vrXp449dmzddC7yozbm50aJ8Vq5VN8Jm
	e2Yp4mxGCq12gnha9Jpg9Q84O4ylMSN63/EvOhFjsColZodE65Tyx8BF/UGVuAZWPT9/2VeqHQF
	b5FyCEA/mhEcG48Aus58xDaC/LQVZViSUJegyp3U4j17IdWNdgke2vVDx8aQaRtGE
X-Gm-Gg: AYBFou38abQnYjAED/acHYBKR8Xm11bhgRMfRe8vnoN64kqgwlWvrH97/xRYwFNaXsu
	BMlQUDMINNbErfLhRzrK8SBz0P89BeX5cQkHl0zWeLGnthEoGIKjWKsj/SsKJ8UlRTPD3u+OpEb
	sH67eVsfNU+9dyp42/V92w/9We5Mzzujkhn2ASNlKVPvK2BDLVwT5+RHHCb90Lsp7ikbmAy/Dvx
	lVo0OIxCYDa8bcL61+OWcOQaa1UJmXWXhb0GYi2xDvMOIQ5qycaceh5KoiAvaKQFi/GzCxnmE4v
	kggR1S9TX23gx1h2bLIjaKm6HTNhDfDzPjHN1cGmWJiHUhwcI2fchoDV6UxYJV2fs7f2rldWMWW
	UN/YhViXN9A3EdzX+Gj53Qqy33otKzW01ObKToXiFlNbfDwxwaYXaRIbny2CCT0IqEqgYsUChZt
	zsBhcDrymXoAVwBGBfgZEW
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031255a91.47.1790665315763;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031218a91.47.1790665315274;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497d9b117sm3763219a91.3.2026.09.29.00.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 00:01:54 -0700 (PDT)
Message-ID: <c29c1bd6-77b1-49e5-94b4-d8ec14346ce8@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:31:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX/13VhVAeyUqN
 V46jJwfP4zi2YrSksjAscg7kDfWQxtx/A4AhqhjRcfWinOUmWBJWu8FyDuQ92dGgb9df0xKOKbr
 vw+d8+Z2egjJrK2amjSh2IC29lcYoPk=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb6264 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX6JfEPzal3a8q
 BlGjcf1dR2UQu+/kvys7KGGMKH9Am2kgrfJqVFgWHFM3rt+Np73DdnxidRBvvPkZpwYo6EYMG5B
 6juwvVrpAb35jjfVf4/8cFxXVP8kpU2cwTiCKU78HPXBSiy13DVOnE70ZXpJdaTEv20ohKNiPQV
 ZD0kjA4cUtqYGK7W26gbPnXPaaM6ogvQWvhb0sN4d+45Wk21+b0DMHziuTKQRttYKjMTl3jHaTL
 Ny4xvZ02MovUOChkCFWviDmBf4VysDq0JKQbzFaqGOct5G6BjpLMQSUWs6nic2i8QOLb8Vnqtmc
 tzsmesgJ3tnsBZ/b7WTJZETeE8Gjg6ea2aH3cwyZs5uHAHqB1wYqBbmVcZz8R5U+UMwKpauLZGH
 9UI/Pq4QTG7Ut+zpXhI0aFuW13jqztr+nDePahkDb67GIhQHgQRwCQ10s4xPcmhto6Rd0OZfmJp
 XUSfKnHFPTrfo/rcj6g==
X-Proofpoint-GUID: IhwhXPqDlOeXgm1W0Ml1-iPNlORF4uoy
X-Proofpoint-ORIG-GUID: IhwhXPqDlOeXgm1W0Ml1-iPNlORF4uoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290027


On 9/3/2026 4:37 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
> GPT found the following:
>
>> +		tlmm: pinctrl@f000000 {
>> +			compatible = "qcom,kuno-tlmm";
>> +			reg = <0x0f000000 0x400000>;
>> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&tlmm 0 0 110>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
> This needs wakeup-parent = <&pdc>;
>
> Konrad

Thanks Konrad for review.

fixed in v6 :
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

