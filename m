Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6443C054
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610756; cv=none; b=WmLMi14BxYzJDN0YzchO86ReMfPw978oc5Z39MBzHub8Xjtkc51oZ1NxmRzeGMbSHndOjv/alRLOvtNA7f98L+SozwbFYCEAQjwXyC4zzCupB9y+meWfXsC7NWOL4SHFB/c3ip+wtwdl1oh1ngP3fLx62SOiB5jArTgASNiiik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610756; c=relaxed/simple;
	bh=IQKIBUWJRljbzFuRZD5swT7UNFw7zs05w6Zor98regM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r27f2Cyz8sWASzpwVc9Lk1IYxO+SOobdCMNTcNK5TrnE+rkaKMLOtLbcdlAFdfO9HWtDLsHKsWDRPGpKkN8UYsMNHuY1pwFG8F1OUjYyY3nAFeQdi/2XR0QVhYOl2QCkaBPnrrCVxCOJw6jg9hUp1NhKToPMSV5ytT9OclDCwkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sbwks8Lx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+zCz2nU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sbwks8Lx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+zCz2nU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Sv22846268
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=; b=Sbwks8LxAPsLwcU/
	ur697lpgyRLak84Bd9T3zTc2Qj/W1qcUyEU0M3WqP2SvcjQcvUyiq29571Tn9kwe
	cuWUKg7hAby5j3Ms3IJgu3ZCXJ3zu+EW6RxKIMtVdpqvHsieQzS6sehjYgq56N0h
	rwQB4fTgaxcqn9R4lysGh42Ll5CPscbr7pvLZbFbojjH2SIXNGLIai9KJyu3pnL9
	n+ROH3FB5PooXV0SS1Hp1x8f9O78EOn3nmmfVazJyBZ2LkydY8phmuQtFMwZJjTt
	Ff+uyHcMMtT9gR5OXGdb853PY5AZLlj2JXx1sfYyLjBxHxFzVGoNxmOiDtQF6TV8
	YujduA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8ka615-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:52:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccdd99d20dso13344816d6.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610754; x=1782215554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=;
        b=V+zCz2nUlnq6poAKio+MLQTt5zHsvkbH3teR+p50DXCbT6uwCOkvLTqfBUX/1P2Td5
         faf1s2f7lBq7IL9EGTi6OC7Gw+MJKv5BZUYT/dTUKmqWGvkHtz4p7osYmEXoGQxhq3VA
         MOwpKO/1SdEzhyY+LRcqgWkXuNo29rnRS3+1MdVTnfJQnniqv7/QY+XunvWz75+1cLO8
         /iWiTUf56n01ax8/PdnKQnjGujEgmwIP0Ssu4debEYgQ97/nQ8ym/YQLVrMB5dE+hFwC
         9gEGZrpOnjKEcEph1Z8RfHCL3EaV/YEddHsPwT8BRH6rSykKZQvbRvAgW7n6SemZZSoy
         Hz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610754; x=1782215554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=;
        b=qfN9Sski6dQ9vjaiAXNRVpbKHLnBscJSSsvZgL8bjv8GFL8vjVUqG8tRzgb888umaM
         nFxDKRqugDADKXcl0mDG89WqPi8gDQjlygWrRuaTI0dYQNpSSdigcN73Fe0A1N07CWIu
         A06dG//IE2QXIWVRXYs6vbvpxt1TLzo4XE27So11zu+KSYYIfPapF//DIZfmZC8NF7hB
         NaGBLRSREtapUBd+ZpJmMDOj7rsBHVIL7l9DL2TYT04zFFOlIlNdw/aI/KCR+u0g605n
         k2p92dXV07X6ZIsbfUvDkBFJf6sNgMFyI1FjPdyIkKDJ0Xi7lADE3K1Hm9jGCyx0kFsF
         oXrg==
X-Forwarded-Encrypted: i=1; AFNElJ80PGVCs8Pn3D0nENFL0Uk7D41J2Ylod4O026agNjbGOOGYOCUDPkcI+UavFktxyX57jF0zFSYHeRrr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97442US1BCqJEv+FknMOX8zhU6kOYrVomyGrFf6F0I4F97vKm
	maQosDoi9pU92ZexwRMyAh+CEAA+d4b/FB4nmVIZ632j+hv2ByRA1Q/cukJRhwTJfufV5ZnSG5m
	EYVmuRIJrxMLTjqP22Z2ZdfQuhZxmLBhOhcJvJKHa6EsgRfvi+MJm1b++h8h7i9lj
X-Gm-Gg: Acq92OFPZlsn1PSWJzfNMDpqm4d/HS2wJkrrk1mHpPftm/PqLrVUEvz7ihvVdTfDj3Q
	AGYpWkb5Cdzwnv6B76kSoB566jkBcBNhXCPgN8QX6+ZaM/Yv8z4k3gj59jMpQqvKmEAE+03WqrT
	EcydK88QgXqQAI1eFfcsEE8nVq+tCEcRRwJFfF62ud33OcVIw1OtWeJFskHqRa9w6V9Xehwze0U
	uLqc5IF8HbH8RRBaDK3DwaQESti12mGN/ZglJfJDLi79qSN2XPC9pKmdsa8aHsqo89AzdnAC1p5
	0/FA0jqWzCsUCDbLxcppG/z9W0XRQLD9xGB91TNabggFLGT/T1QjvyZgN/6KPFgOoteU27XOXS7
	djIw5V6+bFQlKGKJXI7juyDHG3dOStbg/87U4DN7DWpFaYw==
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1644855985a.0.1781610753647;
        Tue, 16 Jun 2026 04:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1644851085a.0.1781610753209;
        Tue, 16 Jun 2026 04:52:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm627583166b.27.2026.06.16.04.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:52:32 -0700 (PDT)
Message-ID: <1e6eac45-bf28-4ffd-81ec-b3a2a24ecaf0@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:52:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
 <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
 <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
 <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX7NUVRDkq2Ffn
 t5MtZw4uiVPBPi7npFY8dpQc+4igif7g8yUpGCrq4xouoLz3dA53DDmeCy4aItnlK6mW1ijFOUg
 1dD0JuuJ1c5cVq+MEVGnEdaLrqoLfaKa5w6m8onM/rAvQk1fy9RFnm5fjXv/1NLU0c77y8qC5q3
 OE0UI12MmKChOKv1+UIfHcUVMgZzpWojhh0o+5uHPesc3oi40ZM0/IUCHeXR/0Xr8E+LYi0TGbU
 fk6LzyZ6n655L6gMn53ZhZ5xJ28HhlC+U3SdxwdOkkAXPKVvlKNLi7AfK9jysogh7ulzOJ6mJ9k
 Nw7QOKFTg431UCYgnR1APadLnDUfsue5gWHclXOp183/fNjm5gW+OelxHIIoDdfZz+A4cjgA7pY
 4ln+q6jcvpdCAwu/6cm2ORdExNxVnG/B/6xQXTue2JVhDIvvc0KAdMgWM6mFapBUYPiMI9BEWOg
 1ZDzG3v7/YABk0x9DFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfXyW47mXAhxcEA
 oovCU9QzKaAeZFtMXkybIGyfszx2orxAiBgUd/60GuNmKl+zWfBgRsOMbVJfkxTqw/TbIK3aG8i
 yRVySIK3rZBwDu0bzFQatpNM4PswMuw=
X-Proofpoint-ORIG-GUID: z4ZErWplb79-S4v_Z3B7Fj9ie63wQ2Ku
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a313902 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-aIog7HT_t0rU9SwYjUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: z4ZErWplb79-S4v_Z3B7Fj9ie63wQ2Ku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160120

On 6/12/26 9:55 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 03:52:09PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 3:34 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
>>>> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
>>>>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>>>>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>>>>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>>>>> MMCX voltage levels.
>>>>>
>>>>> Add MMCX domain to the Iris device node.
>>>>>
>>>>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>>>>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>  				opp-720000000 {
>>>>>  					opp-hz = /bits/ 64 <720000000>;
>>>>> -					required-opps = <&rpmhpd_opp_low_svs>;
>>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>>> +							<&rpmhpd_opp_low_svs>;
>>>>
>>>> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
>>>>
>>>> Is there some transient dependency that bumps this to svs?
>>>>
>>>> Your changelog mentions you altered this in v6, but I don't see any related
>>>> discussion
>>>
>>> There are two sources of information. The "clocks plan" and the "pll
>>> info". For some reason, the clock plan doesn't reflect actual PLL
>>> requirements. See the info on the corresponding PLL type.
>>
>> OK thanks, now I think I asked this already in the past..
>>
>> still, both point to LOWSVS @ 720 for sm8250
> 
> Not really, PLL type points to 615. I've posted you the screenshots
> privately (sorry).

Alright then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
