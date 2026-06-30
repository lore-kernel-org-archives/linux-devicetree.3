Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBDE40B373
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827056; cv=none; b=e6IURE7qI+mH98uQplwxnJHSDyH67rPbvP3qR4HVoNV09DB0QHMebfCdp1dXq/oGm/9LjQEGacD7P2GEV7Pu0RHmg3R/diKIbwRDCdsKguD0PaxZxWhq5WdT72kYUL6Mxju1JTGyBWkMWgly8rX2blHNFDPsxUy5OIlXUYEM1sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827056; c=relaxed/simple;
	bh=bCUXH4SoAmjo/fUNC0EBxscsqnBw8aQx/4F/WK4AVXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPAvT2XeqHG74pRhdHSxuP+4M4VvuxQw86rcgCR7z6hODrAVAWegyrOdyAI9Iad5fC7bVTGP4qTMxdoDBNZLdSNNotKrixOML+LxJjAdB/QO2NhoWGeQdSf71fu42yv0noB084+3z3npKoxO3f4U9q+y2EJa11ZxuqXTGGo7kRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4i55shH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WO5KcgkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4i55shH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WO5KcgkD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n97F1605922
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=; b=n4i55shHAme8fsZV
	f6JiqSMAT2VnkPr1L9+xExOWVIXGKMW5MBAZjbUI9JRTFw1ekg8d8J/6EylyiMx0
	3hHQLbw8GS18tXhIhagG8VXc+62ACN1GmjcoPCrzZMMEcGgjTRI+Bxpr/5RzqW8Y
	GQiCYlDJ5puHks6dFXDmovNyu0OTrlzyXV7ILvkYlwyThN7mXtzf9EdvMXqfJVPy
	KyKQKfL0ayLCwwSULymunW1Q3Hw2qHm01wl3zLZcSxBkRgm6mKpEkPeKV8/Cz8Gi
	LpZnqTaKSQfxSZHBAkV3FtVVGfyhPjtNXxLW+4O/mCkr5rIu5bFFgNBe3F0RLaLK
	5Ps5rw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5tmw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:44:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so2324513a12.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827054; x=1783431854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=;
        b=WO5KcgkDy4oAX4+eEma5lbe87NYk2bXafjmxSK6F+4VAdk3hzvX/eZqc+0nUHsVUPw
         ld2qnNq9/xyhvbylYL18KzaNTS3HL/z1tgitZIiygU+qDE4GMQ+yKJJh20kiabNq/fBw
         fHRG7yeiKjtYwoHukuNTfWYgcsA24XHNSjgJWvSmB0aB5PZD7Em9R+tM9mRfP8cgwPJi
         /E2kcavDHPdG2meiYxf/MiU0FxXIKMyT64k/RunRrNtpBia5DcS0lSCU8CAgDNsbIOPy
         ykLZbp57NBdnJyBrbJYa9k5ntQJM3caz4FccI06o5UNHMJiF18r529xZX52+2xZGWObE
         +iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827054; x=1783431854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=;
        b=jB4XggooB6jJwecU1BCDKSa61uJIihoj1Wx0TtE0GgmSPncbnuvNFwQrobgyXLXokb
         /Hk6AfdvE/g6/rrnuMOPKCmrx7f2oPStASr2R1Bpf9IT+mkevQ/yDSUr1RtjMfScUxEk
         fCy3RK06Gyczw5b23GIKeDupgX1Qn4igMeIgUR2VN2Puo+dfhqdlyVKs0lpkxNtFUJ6f
         GzjQEGSpqDIQPrBKXcrZmKudRLRaJVoV9ZqCqVGT83AYKCvrmoWfW3jVuXvPtbbtKSjT
         69EbOO6axpkchzL8XPl4+Od72Kk/sx2msK/0OmFTiLmYbKW3NBfDrB2JevaGL0rnlmCr
         uO7g==
X-Forwarded-Encrypted: i=1; AFNElJ+ao9Boznh4P6sHODD7d3m5TSZ3GCIvHBPmD/kqc4Ngscu+OTkC2NE82wHOSnO/ccdCELOgayM8C3/W@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxHeqjYYyF/KJ5sxG0hlwK3RatJk67DKToYSCcw56EygHXJDs
	yuB520RPta10LBY65d+6LBZlEccoRlsUeIsyNE9MNdaoB4fCFDhk7GtSqNgWpejfpLioEnmtINA
	17506YHhdbypM0ZI1fCWKwgNWDECaQNihT74tL/dw6W77/M12gSd9Wkoql5HunVp28guwda5wNV
	g=
X-Gm-Gg: AfdE7clXV2yIJ7BFHvM6mdCSfTikpcC5MQONNKJB/vtqwMg4XOt+Y9Xyx6+UwVvgvAn
	vpFwB7fxymMYGxmreaKVYiPKeMAGRowO/iRXCvI6ECoOIG+Hi+C4qYkd3Ic41FhwHkr9BAyznzh
	b5lY4pNVboDv3O8k53umQqiH/RSjr8VQeaVeU6NOJuTf7tAtyvOC5YYLbphfXMyvysINkHjFhWG
	7wtfpvYpTJ7bFHMsGf0ZJwwAe605K1nQBPVsaK+znQh+TCnBVcBKtVLLjS1x+/3fj5DSu4nf0P0
	9reiG3puymrfIVrvIISQvqBwr4AyH+Q13c+CAYyowQT1Kghw2ZzDRI1VOwhh7JSvCYfYJd2D9cr
	UYKz+Zl/Mhp8nRduZC6X+f0Fv5ddxC/0OtUzOJu8vmwSt83e7bOpxbC6zB/tojrKU65FHodK3mp
	E=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3bfc54b0b9amr3319180637.59.1782827053676;
        Tue, 30 Jun 2026 06:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3bfc54b0b9amr3319152637.59.1782827053220;
        Tue, 30 Jun 2026 06:44:13 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bc06e0b43sm1616501a12.30.2026.06.30.06.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:44:12 -0700 (PDT)
Message-ID: <865fcbae-10ad-4f6d-8b57-474626b71e36@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 21:44:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
 <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43c82e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=v4hQ5fjKkRTF_-evxhYA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: VEZ5DK-55Hrqh3YsA96mnRObWHyIN09E
X-Proofpoint-ORIG-GUID: VEZ5DK-55Hrqh3YsA96mnRObWHyIN09E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfXycvoQidw4DXV
 NZ71png4PJj7rOYbkrXPyxJN84kBTbj08eOF9Y++0zCKdLfLY5nQJ6Zu6RrkJ83fkaokPUWW5XZ
 C0YuSR6R73gbLVRAv6aPZ6XvtmUUHvpdd3r+rhjZNI0dLVnjNFNjOi7+TLZ9eGH8EEWC2+zGbsX
 ztJQnqeOLWbl0L4mAP6ce4K8pmAucy0ohI9mMYbfYRX4AIWB7JzuGa1KDFrel4xEXGYZeTu1fmd
 HThmUm8pgLKQo3km700Rdo+8pTf7Z/fkmB2EbtGTe0tzUv2YyviKR8mXK9pcBBf7j2n/l+YDDw3
 ZUaOFuwahDTusq67XBFfPhPVi7EnYJVUOPFkJjQYGeSzF3zrXa76RSWu/vvVY7enSaJiksiuwGZ
 qFITVrHZ8A6U4/jefmFx3NHpwv25ynpIzZ/CWyh+q4jqx7s8nx6LrXb4mIVU5lsQI7JNDMptkd0
 JVIytPo7UNXWDZNVxbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX6LlQXx85oIUl
 iNfN0NOc+QIQXD6E/vMSyof6lApcmXvQDYYdPKCyaV1I3SLfnk9ibgvj0DRORaw74FZ8waQ1wkL
 +dWS20cebDxMZ9r1IivoGwsay6YEZ9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300127



On 6/30/2026 8:53 PM, Konrad Dybcio wrote:
> On 6/30/26 12:36 PM, Jie Gan wrote:
>> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
>> compatible, which places the device on the AMBA bus. The AMBA peripheral
>> ID probing fails on this platform, so the device never probes.
> 
> An interested reader would immediately expect an answer to why that's
> the case
> 
>> Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
>> Dropping "arm,primecell" makes the device probe through the platform
>> driver instead of the AMBA bus, which resolves the probe failure while
>> keeping it an Aggregator TNOC that retains ATID functionality.
> 
> This describes OS behavior. Move your message towards the other
> compatible not depending on reading that ID register.

Thanks for the suggestion, will rephrase the description.

Thanks,
Jie

> 
> Konrad

