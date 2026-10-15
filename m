Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95B50EBF3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059660; cv=none; b=CoVEJVG0mEJ5kzC1Dv9/h+N7MQdUbhYBrTcFtO/Cwv+7aH64f63Z3MlVnu6pHjbVkHecYS9kY7haoc2WNIJJ2P+BcFUkYUiQ6ptTEkXfDIGeWu0z9s0U4tCQuQDqxzzYaADKnUI7/yeBIauHEeUpGpn7y5J+krIbCO7BadVJc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059660; c=relaxed/simple;
	bh=AfazupRWWtICoUAGH1bBSGvypUPJoxkkS6rNv9KiWsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvCoMHCDgzOiZHUm3Et9j3FnXewSHDFWNMkVWOOWqy+ddcwjDJ1EqFYluUqc0DGiFSAtzLZtq4QT3U28N4LNYYOQL5w2FZLkR73FAqyqu8yWIjFb3f4vnFEMH1ifXTnI6XoqCzUinkzEo2NFwPY3fPSUSUH5KfmP2XCa9g0HYJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBIfJRno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRO1Rpsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBIfJRno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRO1Rpsu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jned3408842
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=; b=oBIfJRno+sYg/ngg
	B8usJs5xu7nde6QQPE+thF8mZWDZEY2amZdl06EpXXXfedfLPFu1SimGzLbU19q/
	Epel+YfyPso27KT1Pu1BXlFWuvpLI3fbiLNOX8rLYd388DOG3aejxkJdtb68xtEr
	ZHxz/vbZl0No0lv1h5wX72IFjp1Fhr16mDE+sYSb9OvLdIPkUY+2pQhxdfKWGFKa
	/OpBuGu5FwkDGb8pcARX0IU19m4mAm/z7TE8j5RdbCZgPaPE/C8CpisaHu51wcI8
	9nLYA3bHVjlIcSm1iY6/PYUz3+T23DV+a5I3XUgurR62v/oLwR5oix7sFavB/Yuy
	SlLWmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn28hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so89229385a.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059658; x=1792664458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=PRO1Rpsu/7GJxiSdQZ+ZuU3C7xC39jYdGmY113iG60Hs7s/VJ0cUr06VXZ8HDOZGN2
         gyfR0PL2EaMgSnKZvEOZTgFEgCEnKyrg4KbrUnBtS4qC/rts3dBBWBz0CDTDF3qvwv0C
         DMrbRqC9hQx/mKQKUfCrdmkaFEf4Xn2zb85i16kf38D84Y2CFYLZrClicFQegeHkUmt4
         M+EYIGOP1+vLA37UPGPduSMKeAlgFO2gQYWD4NzNUcANsPXPCOCLFhjRmW8ybvQM9seL
         Tjgz1owknrHku7IJmL1dFtKwq2TTmSu84X7LFbpeMUoY8SR5OwDdkMIAputWvzMUJXCv
         u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059658; x=1792664458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=A/RpghbMLuYBBa9NwSC5qxf+5u/0Fk6TNusA+juVw3SPLk+sL8ellh+QYchQVTyTD2
         W3G2ldJkXtG8nxVfsneJRgLnQw0QWcFr0qzfka+Bq98kkv+Krne6pxfpUcaSjzBoK1K8
         gPEblzzFwp6FkCwPM939YiOp3QG4kzZEvwDBE2FnbJtDcxrEEzAJjCb32PENGfe3vJF4
         EJ+Z4Xah4J9Inq1ai3QD4kpjixDBg+SQ4f0zd1+KW62tS3oV9j4vnDqff7lztpEWBWXx
         Cj/2y9Cm0MzL4ruG5ho6vDyuGnzrq6p/UyrQnVcAOEpEPriRRru4rF8Josx+KM/SPEtR
         B4cA==
X-Forwarded-Encrypted: i=1; AKwUvBwChjEi81jDqLR3KvTwdB3esqDwAuqRsMBVxxcpuBek+E3fF34VyDCvF6H7wDXHsThrHKlXAhcv0ubd@vger.kernel.org
X-Gm-Message-State: AFq9FYIdC1B4EFiXox6S2mIEg+2YO4YiOqQ7pcBGA3s85AImnztJdNri
	JC73YHZ6Tq3uJbi7yDcg6yCFj7X8FVum0qYYojEWw4oMYWJ7nPxCP0r9TPpoEjzkSOnuQNofETN
	7mS5DTsNIt3WCZimaV1aJCA1+yCYx0VZLO20928wb1bHEAGbqCootz/48psejpFa6
X-Gm-Gg: AYBFou3nX6MPv5DGk/2b1WUhcH8zxh2lHokl4KBmY1glNcUYhRaGt3Cf0K2VgpK2pya
	8tojsjquk/BvTw9GE7k+pi9LRGwshGt+SRLyffjhgrvKgig05Na5YP4W/2TPzqFbocS3n9cLZwO
	ZFniH5u5lt3kQLfE+d5CsUBF8A6DNUpJB3KtOnZaPwX8Ivkw4d4J6PmSjD4qlWU9eowun+iijfd
	07EvtG7VFYFuQwu4t+cHjidDcc0UK0+qHyyUXsRcyNWj/Dr2Fj6P6BMsE0ZkxuGgkKeOmS3JMpy
	Zlj5djmd+pMZYaxEZtYep+N03wokWVMNy5X7xEnDdaTHxrJcK02sczXj/tARZ2w0ruKQopKSWeV
	dUIiQGqsYefNHXaFVHS90rw==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599360085a.6.1792059657841;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599356685a.6.1792059657298;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:20:54 -0700 (PDT)
Message-ID: <d8c2a208-1ce0-48b9-b850-2561bd37d3f1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXzmF+tzrW7sE7
 7FNJQ5VynH3gh3cOPLR7L0Vc0DyMNaWnAH+r9A7OmmrGahHjy0nJKldQcAlLMDKldx8FGsnf0D1
 OZ80aTtLRnfusdd046fspRABlUDEooaoFNp1OJv+PgdROC5Vbkkt3I9/0lgCcSeVxeuRkkgzvKG
 VvLcgGPcWY2O9vIxvf55T2lHV32oY1kKubokcnVjwxiumFcTCPE7yfyM3ORUt3FrHIkUE7hTCsp
 wOYTyR/3jLO6C/soOfugz6+aSP2NRgNupLe+GpBE/D6LKQ4XOjwfVupsirZ0xf+rCOza0FQo8Ft
 y/E15HDVhOCMSZbjKlNQiHF24kWyOawY49fDosWh7BAiXPdQM9ODH/b9a67ILNSglhq7HpUqzQd
 HSEI+utCX+txGiikFZ25Ozd328LV05fSC2Be5OYTZ5ODyjq/q7wv6gVzSua6EYMudT8Z2pX+Ghl
 O5XrL0PpujD1dRqwUsw==
X-Proofpoint-GUID: MB6sz14qUWS7q6_pNCXZslvCtGOKQpMT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXw9pTX5MaJc5B
 QZRw0JaCoN4uuz6hO9S87vE9EJmNEkyqrEJ2kCruZgjm7UG+aIOPHAgh0GRWnC9IzFSdLnftr3W
 dRQm32AhRPSNS3VMlpqNA5oqTctjGbA=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a90a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: MB6sz14qUWS7q6_pNCXZslvCtGOKQpMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node passes only the first two.
> 
> Pass the board sleep clock as the third input. No functional change,
> the video sleep clock keeps the rate left by the bootloader and has no
> rate consumer.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
