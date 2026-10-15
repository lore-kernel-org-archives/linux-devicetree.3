Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3C6485505
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062524; cv=none; b=C2Kng8Q/xQdNZtwtpytCsevUBFHqVPzy7wlVn6pR7IUltiotse4hX2Msg79q8t4Z0QMmMf9GZActHTvpWFSnNCcZBlUH+2zOhUUrYo/GNIyviBef9gYuF2IyZwEJ9nSOWWww8LKCQbhqKH53+MvHK84H9TR+CNiDFTkP+pOsjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062524; c=relaxed/simple;
	bh=f2ckxXyZQKuh9nsM9vxf6wcauADxi7RuciAXr8hyfjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBA5duZBijv6R6eT/WsrgfBvWYN6qCcahHbFQgEdGJUfqplhbQW1VUI2u+wilKJpuXwrNVhTDvEPTXm+i2yyzdDZP6ok7wD0E2fcoPXfHZrvbLIGVgxy7AD1Q1lz1GI/eNOkVmFpfnxDTLBD0PU160QQjznj0LT3GJ4G4PPA8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spy10IAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqauuPq2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Spy10IAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqauuPq2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jHas4077455
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=; b=Spy10IAYbSeks5Us
	4lnnfmwbiPTw91h/+TO/EPi+I/PJCJAe5BG1dWIM6cnA/hyu8smJ+NN0zg96kj5o
	nbzb5n38ExrM4lkZ6660jMFaZpJKpekrtOD0BWCXiI3wRDLFslXwRppTdMG0MLK9
	u0p4KuKC+5cuVigijTsXVITYrvPXPr8YHWeSmdU98AZXorsjFGR0VaioSfVjl/jf
	UNX3FNNlp1IaQ4ZchQDV64a0VbPqA+MFuVzQ6+ZnSdtSXxyTRQh1sn2aTiKckAhY
	aPsdILygwprRMkeN6yXUvm0jIlUWsTpX8V7odNv1A5f8/RroIxYfCjgrRKB2z/sg
	l8HXzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0cmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc19d8e59so62045085a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062522; x=1792667322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=jqauuPq2jvbRTxYhRYiiM+P0ygq62mnc3KwOdk9wK7/j5+2mIfUmybr495fbtZO8eg
         nagCfBQ5CHWsp5pTbBOus4Pgj1Oze1SvQBpUWtwcqI794x7zT8ByVGPbP8XF2stVvlEO
         d+eA7rRAhbse+dj51VQ7agvzS8EQu26HQhiVcAHnS2yU7BbvF65RFAg1Pq03rzKOqw3A
         RtpS2Y+UFSLu+OqcYPkGxBbrzKltmIkUXcvYcBdhuwWZtCFPuv9+3xygxRVJCWZLYbGq
         mPMOdQAzk7+NZgeF1BNofybmUZMc65hfaBGAlWhrcJtmakdu2d/GQai2eCfnwKhQg3Gc
         LKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062522; x=1792667322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=HXliaUePSnSV3BnwFcvLnx0TsCG7DqzD0SkEShZruHasJNtUfR6abdm5BpiKYnL++7
         z/ksPdpjJyQQ0W7it7I3b0ZjH35GwpQ7xSI4O5x0dlEaeNYJHLVBbv18bGg6+LSaHbIA
         IUDLA3civdPT4Y3xXwpwSJW1AnIOjssjhLBFx4NQJp/TZdFSiolWXzXQUOkkIfY4JhuO
         My38jQJQV0YvfFxaKjf1L7Iaa2ykK9x631qSPVGFqgTUNv6Z9enyszUoCqnrKaONOo94
         4ZxvFMF90r0wIBZ/zn9GPKSMuWAQFpwsTImxDEyUqgKH+SCJdyG7xCc6fQjS8ETHcLk+
         u2dg==
X-Forwarded-Encrypted: i=1; AKwUvBw/UAA9127i+fJ3o3uhPp+VyqGSwbYlZZRySqzwdaKnktaiCXx6XAePKiec3+ST1CFTiWLLGZhqog6U@vger.kernel.org
X-Gm-Message-State: AFq9FYILC8O94cDfljz0wO2cgQkOfEpfo78rP3LI0FbicIVp6UGucGZt
	NuZlP/wREhJth9IPXhaQbdXAN4ovPPaWpjSzpcfRUG8encaYbUyF6rF/siavRH+4TolOGYt1eRO
	o3tsInGHXIG1QJeQCdrntdiVsFRBAcjr+HTEZEZ+sHgqnuqrRAA07/eXzMpx2WC8w
X-Gm-Gg: AYBFou1UQ0vV8sux3s/2nFjHblkAtPPHFiOuZ069InH6P132r0frjg7mXYnFP91te43
	ncewO54FOoHBlCFo0epl3Ux5sHJrt3ud/I2Ydddimn/8kftN1Sq1PCnIRgJdUL0L9Yg+uU1tAMO
	DAA10lcajA5Y8wW7LyIWWBlMnu2KC7qoUxeg5zTlgDHWTb197ILgUusJyJIKkT6fVNWgsc1xJ0T
	W4kuaKE8tD/x5SJsEkDMD83EUu10aKW8pDboUoFhy8LEk0R6nKCnWUMwkHG9VMT5xGOgN75L+eD
	YfdEhJdhklSfepCX1OVDPYHPu2PzaEwBHQ5/ZWdTPzb146mvfl+S9gJ3vV6qGiEHoYVK0XgRki4
	RaTEp3AG09abZz8YkdXNvzw==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254358085a.2.1792062521386;
        Thu, 15 Oct 2026 04:08:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254351785a.2.1792062520818;
        Thu, 15 Oct 2026 04:08:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388545csm2280628a12.22.2026.10.15.04.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:08:39 -0700 (PDT)
Message-ID: <b1570552-958b-4cce-977d-f04e03fdb4bd@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
 <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0b43a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hkRLp1vvXMYqBSLCnVoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX2oZZxt+rUwEN
 lrkw91qNbI4iWFF/6c5OIHgOW9QduWGyFBVNIP5yS5S1RFC/wHNmxQTKD41MAi4bnCuv9rjZLxe
 CIV92wGs1yjbDTDWias5NhI0E67snuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfXzyX6qSciaGiJ
 mbsVrYDrKPZI7iJmmuVsg11WD3bFlhZAbTIy/ZV7aIekjzcOolzllR6M3FrOnONF9B0b5EhakPj
 rk9BbIst8gm7Juo1Vtnlr2nW6OS7FZZXdXFQbPHbRykrnWGSprqnFQ0aXvDlDYwwpSZjdUYAFAF
 Ls3wxbkaXu+E3tRvdesy0wOZd+j4WcfYMfn0M5XSOZfIEwHbg6ZjAw59nMerNwl2oT4hOyXHinx
 HTNQ2WC8tNCRxDEDht39ShZVOKRj/70XB1DFadmGnqEplfGF0wf9O9vV7gjJCuintwY6EQk6a0w
 nYygbh1/TRzhIAyUy7yK1iAws3TVCHkNTtEu+2Ns6imC4f/1pC/tKGJa2yfuHk2/FGZsSMB0LY9
 tn8HPQMRmmZwkWydx9NGBCxjVADn6kNex8/D4uMaa5j6jZfDmYxQIl3SlKLpc2r3IhSS7x97JCz
 BkBprcHzvcUyukFTMBA==
X-Proofpoint-ORIG-GUID: ndDl5Gn4l08N1RCo2Wjc2lH2Apf7gVep
X-Proofpoint-GUID: ndDl5Gn4l08N1RCo2Wjc2lH2Apf7gVep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150044

On 9/25/26 5:28 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones

[...]

> +&swm {
> +	/*
> +	 * Nothing hangs off the codec's SoundWire bus on this board: the
> +	 * speakers are CS35L36 amplifiers on QUAT_TDM. With an empty bus the
> +	 * controller reports port mismatches and frame-generator timeouts on
> +	 * every boot.
> +	 */
> +	status = "disabled";
>  };

Does our driver need fixes?

Konrad
