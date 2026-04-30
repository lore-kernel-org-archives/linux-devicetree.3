Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611A72E401
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528306; cv=none; b=IKz+Nd3rNY+YfDubSZ1UrSJ6ThNCIoTA30UZoGoli1GStzdgqHVAvwIeDaftwdtNmmiAxUPatHjwFPsCO7HkmvhAU2ho/Sefuhf5Oi5vR3mLOWeUc/0FD1wY4ZzkDfByijzqF93xWJlUyWgRvHuWo+U3k+fkCQrad7wqdY/SepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528306; c=relaxed/simple;
	bh=CgsL9lPVU9qlSBepqHiQxE4D3Owbkt5paVOqB8gMMOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVvXpgWCFGiBOwE4pc9nNpQJ+NKw2Qi28FAZf51cKTRpnrGqHirAQkEC0OREzIrE45jz0SaX2I9RhXPsWz9QBn3aQ9Idxv9ZQo/YxUp6OuOksuSz2sPzmm57OuRQoLrI/Kz52r1LKV+b77NkBd59fq7VoO0W/g99c0YUWMAXqrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIoFDF00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STjD+HeI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIoFDF00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STjD+HeI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TKbHG6255343
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBo8ysA1qyB2SNrMg3M4cw+4GiEHzW7353RLYSNaXxk=; b=SIoFDF00jacDCQNv
	i3fu10f9ds0/OtMoHPEFVd/6Qx39sk0UphPrlu07uST1WAn7xgnhza6bHQIxF8wA
	Okq2HyKddErlj0Xj/6dcN1RJi8Y6CjgImTd49bB7GbR7/qiksoB6G3C0xvJ3cR9X
	y76UzzksFCsIXLCXYAm48Ui1GELWl0NyictWSXXP71am1DKRt/QMWJkP976JgwzB
	5ekHsdoajKWjMOHtNlpkEHblVHwH0g2d6KhfdRupL2agjCUJlNR7HAILigz1CrTe
	tiBX91nNXxzT7PdtdSYvPteLEYR5COA01DCvM/mgC4W3OfIiJCkikmuTCrO9zJAf
	NtIPJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71jg35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:51:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so676644a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 22:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777528303; x=1778133103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBo8ysA1qyB2SNrMg3M4cw+4GiEHzW7353RLYSNaXxk=;
        b=STjD+HeIJUgtNq+hBQVDZgpi4Gb6iHMXiqIeT8mLVNcJP2TJPhCy5o5LLX67JsBAMZ
         Ud2GAsYqeLqpjlG/gr6Oif9SSikPJMQduZwaXdK73r1lgWtHR7KH7ox482+d9oPl/kcN
         XmIDKAArHsn1S3zfkGWRV27t2LEA2/oRec2PvCn17q0xEef4rvaKDp7OsfA77fbMEvIg
         OgaVqOrpUiqX409SbWG9uzmtCsldunEKTkHCEgfgX1meMTiC/fSneVWN+v0960mT6y1m
         qxmv9bq6rG/pwmELu7I0Hh+mrosqepauQZdSBCWTJKzGInda156X07pCeJBiNL1CCVaB
         AHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777528303; x=1778133103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBo8ysA1qyB2SNrMg3M4cw+4GiEHzW7353RLYSNaXxk=;
        b=krX2ldclga3RArjce0+WLbZnZSWfVmYxNr7WcL7X6KdsNN7lhajm1dD6hBpCUjTqpA
         slU+zhaDEoHHsjIZmYmj6UrW0AyCXoPhSQxorWtNIyYfVat7ISWKwvHdL0BujRXU4Lde
         1lINEcC1yEielj2d1suVIvOPPNfVg2PZz82vDyWjp5KA28z4QHuhakhxaEAB47Lez0e9
         8dm+Wnwv1InFgaMdiRjGzZkNN2S9vo3qpP56dN+6saIbejl/f83kTzMhIkx07GJbwq5q
         eyzjUgK/Qprv9+AXyx8clEwNaKK0uXj3027f3EGBtR7NlKqFD1FANEmQvmZZls8kpPBZ
         kXcg==
X-Forwarded-Encrypted: i=1; AFNElJ9CHJvdJnghVibKSLGBW3YhGukIfdLcyR+6V8RqGOBepKtXU633dFOvLJr11dPOwGh3OOqTeqkA1yor@vger.kernel.org
X-Gm-Message-State: AOJu0YxnLeU2epMKGWOHmdH9UxW0NEWmfZQ96NFcg9a2dpCz4SkQaNbw
	TUpmV3VyUM4sLV9a285MjV4WAxRykWnf0J8W6SCd5lX7wlMr+rV14kJ4X9/FtgMZBalvAlkbuTh
	S2+ajtvHlpB9nzokvYnFg8+oEqMBYCq1TrILCy8DS2l+cWgvT9C2NFFafXhoESxgF
X-Gm-Gg: AeBDiet9HST2NbGIZk4Ujw9liyIRXZzR2rP9ON7hTOKFbfHis+fsIzm159WtfDbBmZU
	BYMK3BTqlGHRXlKkDZKWdlJW5BZubiPNWdNu6RPyWeUJdTtu57ZhKTC4rubZroosJ/7t+N1VC82
	Zl1LhcYBuOsLJ1BUNbIniBHrUjSMH/mTbJolCk72BmLtsdjW+O1vgiXvgNpm56xaAzajYKT308o
	laoZyt9GLY7xX8Phc5F0+W7D+7hYmwMNOLJkaa9inejJfjVjd5UPC0Pl+e0y4cWBO5NzU67V1Rp
	WgBEhaDh4AVGBHYaKYIWjiMXh/xgT0Ezg4wDZ3XkiEwom4OlKnmvZzKHBkeVy51MOIkmxtYhiFo
	rGPY6ciWleJem7yScasyqjTGrik/E7joA+i7ZiCykcu7PNDzeq7Jq0T9G3hWmNKDt
X-Received: by 2002:a17:90b:2ecd:b0:35b:e550:e68a with SMTP id 98e67ed59e1d1-364c2f8cf70mr1346440a91.3.1777528302975;
        Wed, 29 Apr 2026 22:51:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:35b:e550:e68a with SMTP id 98e67ed59e1d1-364c2f8cf70mr1346420a91.3.1777528302532;
        Wed, 29 Apr 2026 22:51:42 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm361576a91.5.2026.04.29.22.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 22:51:41 -0700 (PDT)
Message-ID: <a4825fa6-bdeb-4d2f-b7d3-050bb37ff7ad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 11:21:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
 <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
 <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
 <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
 <mgsigotfsu7xbquwgsrrm2rctx2e5xjmaijg6b7nzaedqerefi@oxvufd72novr>
 <c8425943-850e-4665-8d23-f5257473b793@ixit.cz>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <c8425943-850e-4665-8d23-f5257473b793@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JSEAcSlC9MfzbGFui5Zkn2-m3h1OE4ab
X-Proofpoint-ORIG-GUID: JSEAcSlC9MfzbGFui5Zkn2-m3h1OE4ab
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f2edef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=MnzUK-aiO01mxYzieDsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1NSBTYWx0ZWRfXzLffWm6lP27z
 /A0DPdT+C9iVYQay7yCMjFfDbBKE3TeJ3gSwkKw+XaEG0gLzXlx72qnW6r0GwGadWLI6HhzpRMr
 QBakp2ZoUrV70zuN6+BMaedi1G8f831j++CmXP9KJGGcO3/uflRliKR3VckGOKAWq8qGviaG7ZG
 rMcI8vtKtnUEEy9OV8fzhgEbWSvJ4bvQLsVMA7YqECZnNDU+qgWIvJQxFPuhydUr/MO9cdHa/lf
 SX0t+lMCcUJfoYBGGpMnzofxIGBHrDU1Txq4Ezb4aj8YEpUMMQUjnlh+7rAmkd9AllrguV4ydXE
 tdGenZ1jUmi+9OvfPXjy0oo0tx42tPIk2GUO6yMVUJpJDQv54DVc04xAqz7edQuQkD2nwuXj2cX
 bajYMI7ci6O23pSsmrSuGO2SkjVg0DbnWMDCAdyFhNkqQ/hVeExogu4IWY9SMsQVqLizAAxerK0
 pp4urQz2KrbcFxJy5LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300055



On 4/29/2026 8:52 PM, David Heidelberg wrote:
> On 23/02/2026 02:27, Dmitry Baryshkov wrote:
>> On Thu, Feb 19, 2026 at 11:41:06PM +0530, Jagadeesh Kona wrote:
>>>
>>>
>>> On 2/18/2026 9:28 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Feb 18, 2026 at 08:49:34AM -0600, Bjorn Andersson wrote:
>>>>> On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
>>>>>> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
>>>>>> on until late_initcall_sync") setting of the display clocks is partially
>>>>>> broken. For example, when on SDM845-HDK the bootloader leaves display
>>>>>> enabled, later the kernel can't set up DSI clocks, ending up with the
>>>>>> broken display, blinking blue.
>>>>>
>>>>> This describes how the problem manifest itself. Can you please document
>>>>> why clocks are partially broken and how that relate to the GDSC state,
>>>>> and why setting GENPD_FLAG_NO_STAY_ON solves this?
>>>>
>>>> Probably the best answer (for the second part of the question): I don't
>>>> know (yet).
>>>>
>>>
>>> RCG update typically gets stuck if the new/old source is OFF while the RCG is ON; but
>>> if the RCG is already OFF, the update proceeds safely even if new/old source is OFF.
>>>
>>> A possible theory is that if the GDSC is in OFF state, the branch clocks will be OFF,
>>> due to this RCG also will be in OFF state, preventing the update stuck issue even if
>>> the new/old source is OFF. But, if the GDSC remains on until sync_state, the branches
>>> and RCG likely stays ON, leading to update stuck issue if the new/old source is OFF.
>>>
>>> Ideally, if both old and new RCG sources are ON during the update configuration, the
>>> update should succeed regardless of the GDSC status.
>>
>> Both pclkN_clk_src clocks have CLK_OPS_PARENT_ENABLE set, so the parents
>> must be on.
> 
> Should this patch go in as is then?

Yes, this change keeps the display GDSC behavior similar to earlier code(i.e prior to
commit 13a4b7fb6260), so can be mainlined.

Thanks,
Jagadeesh
