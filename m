Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779190;
	b=Kn/MKhhWQ4KCOsWMovquboQRND5fHjAbHspF51xkUcD8Ctl+HYY5L3Bh7Qhhrq32Ysnd
	 3kX/Ymvdin3H8X6PqishqX0OYba2urzWEUOgl1axDjTgH8z4aQ5Isu9Sl8HAt/tUL5DWR
	 O9YfX2SWuKfM2CgShURviEQjhRhQZWtWL2t+FRGcCKyV6Oud36Fa03jeJS/jR9zGVeH7l
	 v3huisW2k/PVRuj20/w0e+r9QeveO2WuAHzSWwGRYCpJZVXnItJ2ygD4EKmA6B6eq19WW
	 TOf1x6ypRUACGWYodere3rzJxrDMLpqKmH4UO/PIoExc36RNUDIqXkJ+zH2oCi3AqxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
	b=jCn+4L3H62LBclBsIdLTiTyTW0EMEOELyT7RfDS72Mbgn1GNfEAdP8H0W6TkqNpIAdOl
	 NOt8K3A5aVJtycu5PMA2OaJi39EA9YeEr9jYYhRmKwbRvy7xJ6RLh0Am8LaMxs4puUpWN
	 pujMtcLTuLsKsEyTCd7nv1Il7wFjWdlguogisWmkFoFtWl5O0cZzcA6ER4TuspWts8+8m
	 KyIAuCokV12sgtal7rYOvaoJfHGkz/MAFuPHaeUHcGDTl4Bzrsd/oe8D6ziAYVzmBb78K
	 XnfpBR0ChJ10ApcEcFzuGCIM/u3TdzfGTciP8hyj0SM3BqERiFVHHgPUlonUELP68cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJTaQJ3z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MI6UlBCG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78C606A32C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D78C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJTaQJ3z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MI6UlBCG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46wuaH838256
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 07:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQiyefZwh/K4SuzQ+nT14r/+
	BbPDDTBUa9cvkZOYWWg=; b=JJTaQJ3zlL8QjekIKvg70/vV8Z5AqeTkyn2YDPOr
	J1poufU/uBnFZFg3udEL+xL+3q9Ac7e91+KTVFdv3J49+s67njGSeh6OxHH/Ske1
	WS3LHthv4/lQryuq/aK7//1pWUCySYQGykCyc1WxyNWiygX7ZNOv5YfH6pYBe4Ya
	s8j1aEBNqFnqWHMdtvRnwq3Phqls1yEu8HIHmgxRK+SY2yTpqqPcdtR0FoA9NNGC
	BNTr8zqQoClwQ1rSoU2SrIZmcHfbhYMJbyWeR1/b9NBy4b25IHAZv82P81jd6/yl
	x1xw62UGLVe4UbQuh+y3gX4XiucjBP1w8FODeh+m1K4rRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mtr9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:59:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0589ff620so427856b3a.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779188; x=1794383988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
        b=MI6UlBCGcCNqmhcf3SotAsKjIHBoWpZV/Ld6b/waj1XQLsR00tPyi51AZBxXKmMXA2
         hU+Nb53aRlmDtRnVzWsK/qXBySvcmGcdYlm2LxBwOdKASEBurHwbE1j9rI9k2zV6yh95
         WPRqL6KlHbjYZNJ4z5upyYwQt8VWJoQf+L5vCHl0TeRj9IS6si1fzKx0yg5yZJ4I+8Ii
         jdWUhCqVLkEpK8pwktqLOfH+Zduz5YUl1mUXKVSVoXg0Q1zvevbbuIlHGkSuXILRS1A3
         l5tHebfSixHSVdIsL1+BuyWyfPxNb4idzCS/VavffvcCGfIPjC23rh8N3T/1QTmdbbJW
         XuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779188; x=1794383988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
        b=n2kTCYSeB1Pmmj6fT0YTsS6+8xcsp3olmohEiRVfVPhaJzQV9fzlVBHMJzfXlJcdY3
         bsP3hwyaKnFRU22HcvS1xhBDXZO0E/KDaVcyu/P2SRIS27fXzjdN1bt8jPXvTwtvDlg9
         CpUuPNSELgPQ4DserEB7xjA4C312iNDt9em3qcfAoXxsF5jk89hWiHONUuBXKHMe8coN
         x7AZ/sU0HzF8hpNhVCGpSLbj+VSpjQonx/uuHPp3+/NQPOmny1WvVRPMlAhSBOO0d2+Z
         hhTqPwu39WVhkMveNzM27YUGqG+yAoq4/ynawO6S5i+KM55C4+zexpIKoYGJ7r/eOx7X
         DqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf20SUrHrADnLjotTJ/Q0EDnLXBAjocqI5bwCWXdZQgSPux/Gi20mEuaKWLBdlXojuVb7/RWpIGtSI@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZGAtTTmDR1h9AgX2Nt3sbYcmNIxU8EEwH+oirvJQZu7P5TIRA
	YY9C1MfFGgnkGGXsF5AYy+CEKlzl1y5LDv3c6hZgHGRulwy6m2cKUKJQ4K9+tSfU4jFN+hIvwEB
	JODDla8S7iBv9JL5lIXMf/Zb7nHItwLfSZa6es1u65ECThvfSLlUKnu07BXhRtbZX
X-Gm-Gg: AYBFou31q6p+Vm7YxlvliJKsy3wqrujv5oo0sEWZzcUHRnjH3KsVOlAoPh6v1l5Q7hS
	4J8hGx1A0zQKTFhp5Wf462w2fj0kjYSmPZaZxkYkCxMTW/Noca5ISEqNYpshHa6/9i+8BS6lDWO
	es7u6xffODvRuaA7ZCn/XlCaaP21nJUHLDNzEy52G5+B7Jv6TADGxhRvxkQtU9Y7Q7kVlzOb+K8
	dsM7EdtobWaA293iJBXPGNPyo18e4X8IH005z3moOjKamQMyiazWzeIvej5pde/xRbEaSqYPiKY
	MvG/G4dqp9kG46dxTudPbgA+Ha/RNArl4QT0EFPFf1Q4vnHo/vUCLXoVzmhvQyuUpTfHKwlHNDY
	cIJtPzo6S5FR37EfZCKN6qMc/svsCpo59ji60xlZsWcLhfajDNkTdlx45uecV3QyiUi8nSTS6Od
	1roA8H+DiZe3suVg==
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id d2e1a72fcca58-8a9bf3371bemr13298026b3a.31.1793779188067;
        Tue, 03 Nov 2026 23:59:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id d2e1a72fcca58-8a9bf3371bemr13297996b3a.31.1793779187555;
        Tue, 03 Nov 2026 23:59:47 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af91781sm566203b3a.24.2026.11.03.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:59:47 -0800 (PST)
Date: Wed, 4 Nov 2026 15:59:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
X-Proofpoint-GUID: 3NOEf_V4hTpXJNnFfgkLvoI0no3AxhyS
X-Proofpoint-ORIG-GUID: 3NOEf_V4hTpXJNnFfgkLvoI0no3AxhyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXzZp+toeeewuy
 PuJO295ke8/4ogsm22DkXYlDt4sLuXYZGFxR9FqvffEx3oHhx+kAzUmQIVDH+g4KLkqqbop7uaQ
 yhnICwZy1k+0lR3tQNm4gg7eOiA5iLOYk52oikcLqxcCq71umU9FaH8WMElxMQIznOY8m5gJQNn
 GfoTiKmo/Kq97xWiYrwf1v9WY3o/PsVmwXCqQXDx42e+hmzAFyVYhhm6juxRSwltvUjGXIAgDXk
 oAEfuA+L8HJSfrBjrCRS6Y66nBZfA8oH+7L3HoVXnWrj/piMpdQeLk3tYvysLl6u8RDBF0CVThY
 125L9gGEhdAH02wcs619WQ88gfzYF+C5UdY3k8eOiFj3hiCYnc7AM5j9pnkZc0am0ppDN2vEJkM
 T5KwE+r8Gxc1Ob0RLL/rtwWwg6C8Ozq6Bo3nxZoT1lkPyP2g7vTqbH1Ue8tyeVUO9iUhQ5XSQiX
 N3cCd1uyZJJUNuNwuKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXx7eQ+NnDXGj6
 3Nr+0QLKVsPwg2uAR+JW9SylCZ5rw3eDeYBV3/dn/fGdS3N5pAFcu6mNY0azvCeoLDuXhNuRpru
 lNNea29EcdBPpjyjfNnklmMh0MAFs/g=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeae5f5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SSptHCAamaIDb59YXrMA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> On 11/1/26 9:04 AM, Shawn Guo wrote:
> > From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > 
> > Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> > SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> > and DMA queues.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	phys = <&serdes0>;
> > +	phy-names = "serdes";
> 
> I believe this holds for both GearVM and embedded, so you can move
> it to the common DTSI

No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
PLL/RX/TX programming driven by an SCMI perf domain whose level is
the link speed.

Shawn
