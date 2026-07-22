Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DDB353A75
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708983; cv=none; b=bw2biSPHV1MQzWS2O68CYV12Au00n9QzqQFHj0RGO1khZiGC0dwYnzOgpCO2jKyfJJ0OJbZK/EuunG3YtO/rkndd9D70y/8TT0MNUA459mjNf44DrnufnH1w8fkSz6TMEoA7DNhYybWh8aEGv0oLIONy7papw9+9A8ECdTcSEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708983; c=relaxed/simple;
	bh=qgJ+HOYUuqPeugzRAIEOt1gGKvL3O+KyraYVWv2Zz3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ly0gksDrIYsJdhS1L41WNu6f8GQ8q6gFHOTt9i5A9DfNal65X5MAxb03vswsqScs2lvoc/0oP9gLtxAr3NVk9NFrhquwuUNwzUfV3CZ0s3w73CrPj+7mCqqFJBYyVwVPwBxVTpV1aEyuE46s+fR5GQEGUtyBjm+PO2LgQ/6fy8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMVzgQvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gdsw/dCB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMVzgQvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gdsw/dCB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53X5K3767502
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1I+4pKolVtATJdTVWC9W0xRncrQRqV5DkOduyU6ezs=; b=FMVzgQvIYJmZEe55
	0FpgH0dFtDiWHR2cQ+LIEpwPPBKI//sXk0qP6osC0a22030IH+LJ9l2tP8pVwE1V
	SFT/sCgTRqREL0UlmMkVs0T1S/QB5xPsoUyCt6+Xb4/T8kDIoKJshKsiEB9wjHF/
	34/R5JMoHId/QA4qOBNUzjNgDSCNZN0hW8BL9x1VQkwBMXSRt5/7mRKvb/4PUNha
	W3zvKhuJod8M4pV5kC6bojLkkTmGJZMxeSWkNKlQXjYlviOGldz0f73yGpH5W2y/
	gutfu+hVPyDP7eYf23y1bChuNP9Mtbj8XeflG01yzvJB5vo7MQTLk7Sgt472AoGO
	HmozaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4s4aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:29:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so25538441cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708980; x=1785313780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1I+4pKolVtATJdTVWC9W0xRncrQRqV5DkOduyU6ezs=;
        b=Gdsw/dCBboy7JgWRpN8y626VSuc+ZK/yugYoyMbMgX/4Adh1cWhm8Vkw36UL5f0wdf
         Vh8G9mZq+0f0Dguq89bV+E2pUowNOQiJHIgc7Lc732kSE2spAY3v5tvQMwb3rMhR6Amf
         jZah4zMhhAZPplE4W+GB9zNF0UHKUZqfyDV6QkiV7XqO/3lz/X39eg74bVcgFVFtQHFM
         NO9NEQi/pB9tp9yyP2rcQxENirKnEwoQ+h4CPTZABGVX9nLaO0vaYSdqa1OuI9sch/wB
         lqQUspyL4yDzyDIF4ufA/cNdyAARoXHQQEQoraATac8JDqsq5HCDsXuqOGqf9uk/j+IT
         5Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708980; x=1785313780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1I+4pKolVtATJdTVWC9W0xRncrQRqV5DkOduyU6ezs=;
        b=tFGpSwAD2mZ8KuKb9OyAfe18LL1Udwus+cgba9Tkh7najSIeaQWdLVkgnA4k04jISb
         s7aoEsEfytFNHgBGU0jjCfhDyyHfpe49m1QauXhVD33kiVgs7fegHdiqRO8uTDN6GWp5
         vm3VJ4yyHPASxLsagdadcqIeiAmpwqnbSxoUGhdbD49uk9khhhJA2vRMrr5F6ESuB6H8
         XC/Bh4nlbAuCg57c6T+61+Zt+N4j2mxTV0C62VDDVBPGxD+nd4TGhhcqyEl1PGMmOfhx
         Yj6rGsjUjZuMuBwwB0Ewa0umj95stq0SpWYySxYvGzAjMCTAvXnPCJ7Lj+tCkJ15JMDG
         R06g==
X-Forwarded-Encrypted: i=1; AHgh+RoxuZGe5IyTczcrT9rmtHcBScooWAvdMnHz7TDJp5uYTKavOaC0HpYbJ8GeCRulQJgkyDwTQvf950Fp@vger.kernel.org
X-Gm-Message-State: AOJu0YyInJxOIroyVuJ2SQq9hY7tJuzKCTTPgxQFwYkytH8o9GyFlHAQ
	qF7Nu/Iv21vVM3XXt06qwvMx2J60imTYan/2NrMJOIC/hX9xIf/FBdYDh57Qtq2mrmIvMBftsdv
	jH6ElfGfYWvJZhJZQrPPy28tCUuBipEXrF8PbKlEZreVat7m4PKob/EwZCSpa2Qi2
X-Gm-Gg: AR+sD1369nzTrgxfAQ3CUp0Uv4bLqVLjaf+7ciO331xgaFJHsgqqgpptuvcl1f5PyAd
	WPDY6SRkj6vwbloPyk1f5TISeHlvOmJh5zSZqDF3gnTrRXTIK6IRC9z/H5yHmO9dhuo6q4YZF5w
	SJF25Yhk7lerUC6FRRDOOE0DzKYAwx9Sqc4dFW3aqW68eFuU9JMO/NJvnaTCuuP/Z/dSrNrEKzk
	iGEWCUwZzP/B4wif98ewxODZJ7AWAdJrcL/nFdwoy7zq5K2djHGp/SYkY+8eCd6n6h3Lht2iPm3
	DnQutHiSuXILa0Cx0TwwqMTZEH7Hfjt5HgPBqnYotb8p186uRnGaNCv+g5MyPzVFIAp9lQNLXZN
	fMqOecQumj+qUpbPw7AKgErH4
X-Received: by 2002:a05:620a:390f:b0:92e:d1e1:8300 with SMTP id af79cd13be357-930e7052364mr587514885a.3.1784708980526;
        Wed, 22 Jul 2026 01:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:390f:b0:92e:d1e1:8300 with SMTP id af79cd13be357-930e7052364mr587513685a.3.1784708980102;
        Wed, 22 Jul 2026 01:29:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm663768a12.11.2026.07.22.01.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:29:39 -0700 (PDT)
Message-ID: <e4d19851-169b-44c8-9f96-c9076147507f@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:29:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
 <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
 <2hismhl3epuijc6a3mhvf3sxasqrhrpuzbqsswfastafpjgpev@a6hdawm6oani>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2hismhl3epuijc6a3mhvf3sxasqrhrpuzbqsswfastafpjgpev@a6hdawm6oani>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rh_gNefQLVSLSA9FpT0MraYHt6ujEBe9
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a607f75 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=egg3YLX_vkcQzZ7oZRkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX8JTfV+4vhvxI
 c76DutLdBZk+nry9oakLAZdFpNshQxo55AdQkwyS77EjpM8D6QUWZBYCsudu3wQqM4pAp/j7Qnw
 Px6NASfOdrBjWZHxYPdXJNpiWfBdOXx62Us873+g+CffQQ6Xlsrts2hxPF3nqfnlZV+6bGCzEOQ
 z/uHZ7cvBe64bzz1kmty7UHqp+vLG6hU4ASkpGBC7m46ZOeukWTPHCK1P+mtW8xGhPtBqHYR0X9
 qSI7/jw1AIlzi9ceJd1BMsDOAXyb88gTW27jMgfIPz6U/BtfLHf0pORSnSZQMuRbeVa9JAeC0kG
 iUxkJsyczkFb2tGnx4ZhCnlazDD9peuAJTGgtD+lNHLFdxxUO5bcvHZYrUkouGwduXfLGbtcVL4
 iBPXh0RCl5cYDr/UHfcCD4efOHSmsOtI94fe/ra+lXyXy/+G+Rzm09gJTQdpYoFaJGwtjpMy2cd
 ox88+drxWxD8JO/FMcQ==
X-Proofpoint-ORIG-GUID: Rh_gNefQLVSLSA9FpT0MraYHt6ujEBe9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfXxiPpHWlKZOwB
 5sqS1ZNnYu317j8XbyjZSIZYIzV+1aOTk68+voAsxjuqIisElyHANcxT0ZtX64WRfSFszyzPruS
 gJWDH/yeWZNeZFLrxXYpkd62KoTKwEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220078

On 7/22/26 12:18 AM, Dmitry Baryshkov wrote:
> On Wed, Jul 15, 2026 at 12:45:48PM +0200, Konrad Dybcio wrote:
>> On 7/15/26 12:34 PM, Stephan Gerhold wrote:
>>> On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
>>>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>>>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>>>>> the latest wake up capable interrupts when the CPU cluster is entering the
>>>>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>>>>> implemented as .power_off() callback by registering MPM as parent power
>>>>> domain to CPU cluster.
>>>>
>>>> [...]
>>>>
>>>>> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
>>>>> notifications to manage RPM communication when the last CPU goes to power
>>>>> collapse.
>>>>
>>>> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
>>>> fallback for platforms which don't have PSCI OSI mode specifically.
>>>>
>>>> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
>>>> all of the arm32 platforms) that don't define any CPU power domains, so
>>>> perhaps it's necessary after all..
>>>>
>>>
>>> I don't think this fallback is relevant for the non-PSCI QC platforms,
>>> for the following reasons:
>>>
>>>  - They don't define the MPM.
>>>  - They don't support cluster idle upstream, so they don't need to
>>>    define the MPM. They can't reach the idle state where it would become
>>>    relevant.
>>>  - The setup for cluster idle without PSCI is essentially equivalent to
>>>    OSI, except that the SPM/SAW driver needs to program the idle state
>>>    to enter. There is one SPM/SAW for every idle domain (e.g. on
>>>    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
>>>    SPM/SAW instances as power domains to get the same setup as PSCI OSI
>>>    (I had a draft for this at some point). So if someone ever implements
>>>    this, we should be able to use the same approach as for PSCI OSI.
> 
> For the regerence, MPM existed since MSM8960. I think it was never
> _that_ important to implement support for it in the upstream.

For a long time time, MSM8960 didn't have much more than basic
UART, USB and always-on, always-max-power peripherals. So..

Konrad
