Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500282;
	b=G4JKeYMTIqMVG3wlFozA/NFfWZJRdBgHdfg91ZUjP2mcb6xiXK/LXOKrKHQl+ESfgh+z
	 Do7RgWyb9pxfOHT7wLBy4529TYs66/T8b3Pvz368kXa0yD2aaOjEegtT62khMk1yFNCCk
	 wof9wljBPfbWTdtvWYdA2r+cvJIugkM+/FgoAZ5IfnCpwcuS4mt22giRvpgDLfulqNl7Y
	 /ndEZTdP6/vjFQjKd6kputIaEA+wJ6YHoHOAhDx7Ps4T4riK247RT6Cq4ZurYZvznB8OV
	 WMDYzVgIP7cPBIJuwn71PT9hLEw/6/TTOzwa2qoQoBeQlzFUJTPysFpL+ERls7n4QXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
	b=pDCzhoWJnR10ojtqec6vHPY+iYS35xDZN9ADqy8vKVn4DQIbMuZd/KuXwDE7nfNvR8uw
	 tVRc81NZUV+QBB7AAwIZeTFBPrKMWCmln26MhYj9sD8PkkrSyv5ir7Ulop3bepNaYeAey
	 3EShtAjbVKY4K1kB+Zbt9w8rvVOyLpiWdwQWrquHkLPRJNwGS3K9kJwKGB6ZTCdWlXQgs
	 A3G+83MARLIfRVGEaAvxwVSgRt1VtiY25olPC0bdU4Labw6scGOWtnOIgZtQc6bcbz3yC
	 ENrzpKkvKNA0/gG/cry88SdRU1M1GECbgLftwtHA+Ec2MChAQaOWaaL62YKKb41Jnsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPgguQ0w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8l4QBro;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3522606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3522606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPgguQ0w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8l4QBro
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxar5927005
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=; b=KPgguQ0wbKjaowTM
	T2JqPto0HnRXnD2+amMCpJjuNJNdjRdi+dkg2CLG87xqKP0lO8malGNdtS11Q6nu
	MsMUlpsnXJLm4kRK9Sj6IYrAtKqLf/KR09qv+ZsE0b19TTWwBPZ6xvU3V/0rILoN
	AzKmRNsow9hWhZccvM3s26jcZjGgGmbk3bogUwQ7emfqFFzXJvdZ1QPVfeSweFOa
	SkBqpqhIpZXQTxQc68ZYXllq85H5B0q7/3gB0T3oiFZIsq0qIQilpIM23nTne6UL
	phh7/cN5/zTHFbZk71xbvOCVsklIKwLigvo6wNEpHSpwqfXoLgvpkX7nODnsKux0
	NFh16g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pagkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:44:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so678237385a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500280; x=1793105080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
        b=f8l4QBrop16tq2Im7Jv/3cAsni/AHP0KBUFyXRuZwZHTehtWLYkxqLsg+kfV+EaU5A
         YifkD/QP4iuW4JpJiMgNG+F7Eo8oOFN4EnyKBUSnUWHIqEFX8yGrPDBD9Pkp03UjyCC/
         qc7srMSggETT9wxefXDXhU8OzING8pv3TygOoTmTUMQJCGOQGCIwbBgAALpuxQiWwp6X
         edNBisOvhxsMPgXxCd6NBbCcqlEtecPCSOc6NmyS3DO3HDaDEqoswSHXfIxRyyUnfInN
         uG25Dg70xJRK/JhnQyn0J5vbCSu+NgIZ9nR2P8RTnIbUxSOs4CPIOLtIu5w1GVf94/nh
         snhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500280; x=1793105080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
        b=FIa9x/w5T01eoQvFbilDtg6b3d07WUQ+BoBYa41zyRcjU92RoWxNETeZH9thRTwgrV
         bzElU1q5CFjxc8FMmBI070t6CjU2u65QRcQF8x/rjrt6IdRlhG9TfVpbLfLaR3YfIkiX
         bkZtMxK8XKOU9rp6ly98+wGm6IRLUNJ17NRLALnA8LRSCnYMeE3LM2ABw82lUVosLPbw
         sQIOXZumdDE8t38cJmNyEpeYuf8KL2cVX+W2TBgIqB//KyLKggV2Ceptz0PkG0p+/jUU
         2AHHGv1luMuzC90x+LQ1VSxjwZlqTCKwoCbm2aQ6idInHWYAkNimi42P2PT2IBP3LTUS
         OLNg==
X-Forwarded-Encrypted: i=1; AKwUvBx3PcG8u3Jk+g7E/uSoiitsGCXRALuVaOO6t+EFi1KOodS8t2glDiqd0ybxo6dM82MFyDR36L33y5WL@vger.kernel.org
X-Gm-Message-State: AFq9FYJCJRc3zdHst5nVT5dGFASSM01ko6hpg2g+3wW4jIFhpHLjKUkf
	BD1MWTq/bGAMiqUO5u/v2ktgJIK0NoQ3JrcCXo+Oexx8j5aiNcYxF8PCyVAxOdTaTmH+RTZG0qO
	lwDmxGmh9e2ttcDjSE0/btf7QN0o1lKukTuP+01/UGA2/+XUXjtc+joKWExYbNWUJ
X-Gm-Gg: AYBFou3qrllwWMxF2eABV3HMUutAy2M/ff9lLpzmCRIbNHfvfGb+wBpAj5AbKWkgV5K
	2Kk28P5P+dliMXGSh3y8Cetz8n/M412OjN5o+eRSnN3BTNe/0PAu7+YEllMM0YXKM5UgqMpvgkf
	RJ5vZrrlJHTwduFotT6LmCaICIJFY5Zt1vnoTPa5F7IVZi0A9p74q8rqL7WBEWK8YlPQKCvAA8J
	6HviN4c9LMHFgL3etL0AlKRMinsaZTI27hYbMUJnYydl4MAbOi411zErDt0ycXN/j/HAM52ioIH
	s/bSNnmK9ECg7scpr1ddeWYTiH0etqqxE4YRtdE9Y0sLHlBndBR/cU13p0zDy7ua/cU9MEx3Kdp
	w3p9TEWRuDcbBk9Geahz6rsDEWeb6lU8=
X-Received: by 2002:a05:620a:31a7:b0:93a:1048:7d2f with SMTP id af79cd13be357-93f29d307e5mr1871425685a.41.1792500278816;
        Tue, 20 Oct 2026 05:44:38 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:93a:1048:7d2f with SMTP id af79cd13be357-93f29d307e5mr1871420285a.41.1792500278289;
        Tue, 20 Oct 2026 05:44:38 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82dec7sm5868592f8f.46.2026.10.20.05.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:44:37 -0700 (PDT)
Message-ID: <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:44:34 +0300
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N9TO9iOIPOAYqxyitASUXh2pLr_Eoa3c
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad76239 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=YZ1k_EG-GQ4t5jaSdRAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX9I0jAmVzqh/D
 +dS5HgCOzpS7h0OtIRg9HyNr1cXSPQhgxG1PcKm/EleSzc+zKuAhOaCsmRKZZTtNBWI+x2fd76e
 JjuzrTVvWZrweZP/8NlegRKti9Jw9amLtFS+jWMkxaMiFTRlQFZB1uc9FUGwbW1d4mR9aWhi0RG
 k3dNnuz/H8TZ3H6O3DS5xeeh3tBB8aBvlMsGYthf+q8qZF6zjcNwbUl/aHaL8HkvdXK3fw8A+ZR
 qcpDPOWhisl61FZS9BC9y+bfdGLj983RqdjcgCMnbgGYk7v7zKOjgkOAOnFyfwke9XsUtOfTx19
 9yl3YqFmZSC6BNVYJRvU4AHmcQNTzK3kMagw1E9MH2PNLdAYCq52Y7SwfUBFVzsclbXXVbffzkU
 d043pLaRskcXIJfRyAmdv8Qwx2XI0qqh4sNR6pY9o2ivzAo/FyUJH9zqRH9cyPJMGYMLs/C50M1
 6aPsgJJxqbR0cnCvgzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXyAG1N8O1leEr
 2UlGFa8b2uuNJI81IxSSU9VIy/b/egkxmBDPvWPUbIfXSafsVIXc3RMfwC/LXyMUOXsJvGw76iF
 E37faV4ygvoTW6/jkp3Y+n8EH6VjNH0=
X-Proofpoint-ORIG-GUID: N9TO9iOIPOAYqxyitASUXh2pLr_Eoa3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 10/20/2026 10:12 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:06:59PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> 
> Clock is not an interconnect, although AXI suggests this could be
> something with bus, but it seems you solve driver problem with
> interconnect description.
> 
Agreed, the problem is in the drivers. Today each CAMSS VFE calls
clk_set_rate() on camnoc_axi based on its own load only. The last
caller wins, and the rate is never lowered after streaming stops.

> If you only need to solve "last writer" problem, why not fixing the
> clock framework to accept the votes? Otherwise this should have
> description why it is an interconnect.
> 
> Best regards,
> Krzysztof

I checked clk_set_min_rate() and clk_set_rate_range(). The clock core
takes the highest minimum of all users, but when a user drops its
request, the core only clamps the last requested rate to the new
range. The RCG keeps that rate and does not go to the lowest allowed
one, so the clock stays high. Fixing this needs a change in the clock
core.

icc-clk already does this: the interconnect core aggregates the
requests and icc-clk is the only one that sets the clock rate. The
camnoc AXI clock drives the camera NoC, the bus between the camera
blocks and the MMSS NoC, so a bandwidth request matches the hardware.
gcc-ipq9574 uses icc-clk for its NoC clocks in the same way.

Which direction do you prefer? If icc-clk stays, I will add this
explanation to the commit message in v4.

Best regards,
Atanas


