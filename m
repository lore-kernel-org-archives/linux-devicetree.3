Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAACD4307AB
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954397; cv=none; b=id88xC5r7MTAd2el3yCcYGKNSOt3JW7id2M4VeF/LQaKd3uXSmAehxMua0AU30fSnIMxex9+1akw007B5tVMUFScS8kAbuGENPE1CWFWCn0+vtC8DkK0Or1QWOOps2HS74JmwveoUyRRRB0RiLsLtLL0CCYzfwZkmGAHByVXjBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954397; c=relaxed/simple;
	bh=cQqrPgm5KWN+3lP+JyMufT3CkYgAKEmk+qvMiYd5BaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tI9XnNJjq2cgwhJKrxmY1H/tScWfaU2cL2gZasdU/QAt1hSyep3Yw+6WLTurttbRQ93Y+BUz3eOlCaq7bjSXdxM+zPt8E7wNlwdFuSvD07um+CsX7r1ihvDexXd160f2XvcWU3LBTqdnsgVfFQyxixbWbczYFkdkt1O2QDErdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7z7dP4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZNsV8hn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7z7dP4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZNsV8hn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE6mf1210675
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=; b=e7z7dP4P6kZ+hpy8
	zncf2bbzSinENaM22HojqRVcfDEa6yLFu4UbvOg9zW13JZQeBQcOWTG5mF4mDHwB
	/C0uCB8Glz6oE7/1rq8TeNEoaeua2CIno/sMsSZkUOOGyM1F45lVBmbEkk3Ps7uc
	vWwG1x/0IDHznPKkBH/lqD47NIogvsQALrI8Sjmew4xV0Ld+isbk1VTowEilEN34
	j1GmRQeZ/y+f8IaBu1qxaZ5Hs7+flE3kPl/9E0Td58cKL2kY9Hop5XWkuNZzvGwk
	W3+w8jsS2TEW3baDkBsNROHTs6p6yfNVXQAGDdNM86Ds3UyB+/vkdhZoN34USvMj
	x3TKFg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qsb00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:53:12 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48e2ce64834so4083069b6e.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954391; x=1784559191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
        b=jZNsV8hnwvqrRps5f0qq9wuXtZte68aOHdPGi8asQAvJgIXGh4fDBrbPg2AmQZqG6E
         bpub+KmauKVdZQInYxCRLfaHThWGIW6oC2Y5eGSgU1bvckpoVia+djT7VZKg2v5M/XTY
         fpkZSyA0aYjEWQRdHpPLZ5ad0jt+VuN98mPYWxku/rKVvh7qY2UwfISahE/gdmz4Pps0
         iRtbWrnEowxTxuvIeHVSvpjVFiMI8wxK6mSpHTNBmx96tBV7XATgP+YvWGKqRRClOQfq
         6PlL21600SJbBhajPz5lolj8Y9qJxPerKWYCrRFuyiFHwxBrMW77ihUKKfNgc9j9KCJG
         7zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954391; x=1784559191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
        b=b6sZk1gi4O+df7U59c1ZkouTf+xBFeSUTG+0kF33AHvQIcXg34aPWH9DFA65grk2nU
         m6/pOVgY6cwYzKF39M4/ZPC3caebSAyUiO7tGItMi3X4sS8aLvZRNMGOunEDPKFWzIoR
         v7VVM8zQQbNV6jML/CZvdeCQ4+I/et1jp1k/rcFU2OvLuCkypIsWosRI4Z28IhVRtsl1
         Q/MnaPm5uD2CgfCNQs9AF2qOqtVgaELGhNG8Z2TfhHyvGjMjF/npU7cGgnfGVDMaTSVf
         6Ls21YU3Z6wICG1B5goSrrf+cLlG2IYn5IxhA/El7c8pzpSJiEseCfXp88a7DN5i0XZg
         Ylkw==
X-Forwarded-Encrypted: i=1; AFNElJ+9tc+iaIVqQmOmgQUUsiaBt1XFnVAndFTDJQF/V2VayinziHlLbUd+T5js/xS05Iy700PJ34Ldfvbr@vger.kernel.org
X-Gm-Message-State: AOJu0YzhnD3dZTvBnYxGfuNB51REfYL6urPZSrI8JuBj+67tKVcI7kGX
	zhcUkJNxBMiUB0fz8kPZk6heaTtEB6fFG+CXSZuoaVoxqLRnT/eqEEB9Yg+ewVVkn0dLTW/qsDS
	Lpyn7HWERgYp61+i30o98VTps+Oh1OpuoWugsaCWw55xo55UKv8tAocvOg6KcyUVt
X-Gm-Gg: AfdE7cn+O7DKpSHJcPVzATAG7ZP7VQSwOAxVWcZYKF/bnEBzKPtJKY2OHnXLtvHiWyH
	4/9tOS2GsSdkwoAZxu16SdDzWiTYIL2MYwLRtjQ9okIkbIiTIyB1ADD7KkSk6y3o+Re5NYSS7b8
	tp7QfBBuDAKDjS73H0BSRwq7S+lEqCQish0OvzWUKRhWFucYPISyra0UPojE3ds1qfBoK2y90/w
	xzm+n3/7nQjjsDoSejKDMjV9SEtcdmrKPGrArxo1bQpI3DXOLeN6mOvYDGej16Adahx7sqYgO4Q
	bKFBkv/evtWOWQOYjeY2u6hPKrMkPrPI/WWELw6I7QWx1kdOSDi9JuP8vetgTLy42jYDSV7S7vP
	JP2umdqWjDIsz1cVWDrVbH0UuQOZKhVw8VXK4BSI=
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id 5614622812f47-4a42abc07e5mr7016387b6e.9.1783954391345;
        Mon, 13 Jul 2026 07:53:11 -0700 (PDT)
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id 5614622812f47-4a42abc07e5mr7016378b6e.9.1783954390885;
        Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm11978085b6e.0.2026.07.13.07.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Message-ID: <797cce6f-850a-45f1-81e8-a1cb97c6a9f3@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
 <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXznRj1DJ3Ev7w
 ZebDoUFP2gWB7Ie3hZzT19oEl0ekkpWncsCXqAt7HfGv9O+ned4woGOd2XERN5Dydu78kxCLna9
 64yxLiKpXXkclj2tw0aNajHAtJdNkewMaV1EFO+lamfc5/SxPgW4uF4G/17Xb/CoerSK7MsFhFo
 a8dUMdhmTdKEG6ePQ53vyefevlk5kv9F59LLEJF/eAtEK+InS9uDRqBXRHT5KgxR/OQqsRSMv+K
 fiCE3cvSk7sfEzBvQX1SmbdVMwh6+iCjOo1aM5vcxIUF9Q3yBhJVZyFKc5KGgd+x0h+tdxJc/2H
 4QzNrDusyR7UD6MG3dmaMK9YKBGbSoXyTYTCwuE2QwpVnJWCK4Nd1x5bDTh+XA3hShv7Vd3cBP1
 Xmt2Ijjj0PfWKQZyl+In14LE8xiMUZBCIeY5Vqkeptiy5s7uqA5DZfzslyfCX6lHICCT1OAjRF4
 6wguQU2KfkKUjCAmesg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54fbd8 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Xoi8Q9uR1wpgCRNIeB3xeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qo9p9QJxbvv4IUk4TH8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: eDxVd6Al-jAR8cKi8_jbzMTiDkmqMFKh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX7cFxu5PxoVys
 5F4RW88deOPzhXN5dtfIiMtbC8LfRBKgRNa3D8loH+iS9hlj3RIrZ2j1A8iLV1FjEDZFdsq54xP
 bZCRM4dZL6MAWwUoyjbDYCcFTFAVskI=
X-Proofpoint-ORIG-GUID: eDxVd6Al-jAR8cKi8_jbzMTiDkmqMFKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155



On 7/6/2026 6:36 PM, Konrad Dybcio wrote:
> On 7/6/26 7:28 AM, Taniya Das wrote:
>>
>>
>> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>
>>> Almost all of these nodes lack power-domains, meaning the
>>> aggregated performance state requests will not be translated
>>> into RPMH requests
>>>
>>
>> Konrad, all the clock controllers are on CX, similar to Milos and does
>> not have any special voltage requirement for the clock controller.
>> It is okay to not map the power domains here.
> 
> I don't like repeating this every two weeks, but each consumer core
> may need a specific corner for operating at a given frequency and 
> the way that is conveyed upstream is via a hierarchical structure of
> pmdomains, where the root of the tree is provided by the rpmhpd
> driver
> 
> If the connection here is lacking, every requirement specific in the
> OPP table or in the IP node via required-opps goes to /dev/null and
> RPMH may do something between aggregating to a lower state (because
> there's some other node voting on it by pure coincidence) or shutting
> the rail off (because there's no votes whatshoever)


Sure Konrad, will fix them for Milos and Eliza and will submit the next
patchset.

-- 
Thanks,
Taniya Das

