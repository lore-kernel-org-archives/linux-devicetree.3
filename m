Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21B82E62A9
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740842; cv=none; b=ZHmmlRUaHx/AbxaWWffyx81R12h827UQh9+bVI1q7S9k2bzLuxLMrBDaRv1sX1lqf62U/ffjbRZzVzUcvMNVSX21TrAFApvwuhl/rh1baAQ/PF4CSJdkCkQdUE8MUEM5SdRUMYMqzyWZ2wn2Ox97eui7TKpVIxezW7AZs/+5Zk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740842; c=relaxed/simple;
	bh=cWLGHl+YEJAm1rNw68MYlvwx1Sqs4J/IHHCWaT05NBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIN7X9GbcXi1VdxheWy+aIYOcCVb6F6/M6LePfS8lplkw9knjoFqD2rAPaSyBJru+U+7CMr/RTaV6PPtq4lhS8uHBBb9u3yq9iPK81XpoDrMclo9hMDOo5F/uRmcstnUk9YI6848sm5vbFChyDbziTDQRLo08bdo6tcwlF2WbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvnZI2In; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZIboC+b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvnZI2In";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZIboC+b"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATSQQ2579625
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ty5H6lwxHqC7d0OKhOvBgcwXdI83azrYSAb+xRBzZow=; b=UvnZI2In3GfAemsY
	O/sVXun6jAWn4X4HHgvgR/KJjR6zloJQip0NU8DhGsrgjBgfLjhqzNEYwW1VpgMY
	gtoJtMvxJauQHRdj9Fi7cqeHO8U2j9AVJuhmG8pwmiGZODliQDZbdYxMmOfhaior
	LJeywYaZy+DvJpleggIyFuJD5jbUBdxgPkCcUVft6Im0ZhVwDBqPovdTVQZhfI6V
	tUp22CO9M/LgWTvDF2lcFMD+3Mp1KiTF4D1z5AudUv+iyiPpxdyhsMXJdnqX2JsH
	w/ByA1iqVeyv4t67aOlfHV65T1R8zNPtaAt76D0n2RI/xb42UA9W3XxhvjSwiCDj
	go3REQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hm63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:47:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so1162851cf.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782740837; x=1783345637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ty5H6lwxHqC7d0OKhOvBgcwXdI83azrYSAb+xRBzZow=;
        b=JZIboC+bW+ZXdU0sKOWJomFPLYyhQH/sOUfYHobbj073cbMsDWApk8Opr4ANwWVgdm
         eFhgyUBYFsdc9hyr9gKCjVqogWzL1b5MRSLEB7mQP4CILBBWkGIHNXzcPz7b6xHWwL5F
         aOz/XgScZar5K6d9qWILXYlcSbG0U5DLEfW10M7cTy/hHcPYJ6Z/ORLqcyWT/2OWrHuE
         yNdQxy/lIicqx8YYR7k1fIezWT5hWcl3FruwRSPafG24QRnM/Sw2s5omB81j7xHhhRG9
         4Apu4Prh8gFAYOKRSVb/6gMiklF+hWBxa3A5fgaVxcdGitpLTS9tAdyKFff0GRgGgUpx
         cSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740837; x=1783345637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ty5H6lwxHqC7d0OKhOvBgcwXdI83azrYSAb+xRBzZow=;
        b=E7Fp4zMSlbJ06AvN0jVpFzh31AwRr6cGo+qpE0cBJb9OUKUxEW+R2yllp8TsbFunZP
         FbjPaKOPaDE+EyjwZPhcPgSirSDjFgUelcMVI4OHWv17DxyqV2iqukAzke7ZWaAO3KoO
         t6Wz2eENRjg+B7tcG7Hmg9Ck1Z5Wt+UhqpGv6ivB2H4kuBqCVSoJoTo1T8v0BQVbDOrU
         xjJDbntk9izdb1dG6iJQ7WxRrGVlGPtaHCPy1+Fy2BV+2tuyNISc4LJZkZgztmxu9qut
         y76AO8QqokyhfVEE8uSrNVr3qSxVe37IswFzyKDOORkQiP3KV7SMtSMMxHdiC2+2eGRA
         ly2w==
X-Forwarded-Encrypted: i=1; AFNElJ8x0mBl41LxllZatJTFsn1CqbCV4JDHjGwXyuqNmq4QUeLB//Hbh0qeNqeCBQu3Ur7EpsRrChAh5JQD@vger.kernel.org
X-Gm-Message-State: AOJu0YyiannF2y3eR4FT6WSyHhVC2Gu+IG/oAg2NaQOqOzkCngCY5Ayf
	Lc58yvOl+myaZvPZ/I5lIrXAeRRxIY6C2CKf8eIDNXDy/7B0Cv4sfgv5Fjh8kH8FepOSr40xRD5
	6anjN7F4OQWk7bFYF8j+nhKXzDX1rFwQeeFZmZVVPDYtsagxanVywkPRTKcwTtMDV
X-Gm-Gg: AfdE7cngF65xZQMpFFUr50Ox4Fj1+i14EFU791i9MH/rvy1H3MihCvufAb9VLkngTil
	UNc/+x0JUxNSTnSzKIIpKaMt/lU4f4zJQQDP2ONWLJXBuYOXWLlq4LCgdOH6po/hI/V3j5LRdIw
	U1vrwkiZ+vC0Mm+ZpZhaH3qtumzgC3uj7gDhII83wsbmihDFBIL/Dbp4o1eYDxz+NXNUxB3Pvz2
	0KcSGxDJoNosgMoU5uEO7z74rgL1gn/s5Sm0rdpvSXBqku1fzg1jpqHDZrRQ7PYLObyzJN93+Ym
	7AnIdAHK8TlcPka7LvoRq+JkjWlqzsUZyP7q0m3n4t63Xr9kVBJH9LBRZIdL5qdd3TpkArHDnLf
	JPyS6Ey54UY2pt9dilVHOdQkMeOawmKqsHLQ=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr97100151cf.9.1782740836912;
        Mon, 29 Jun 2026 06:47:16 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr97099261cf.9.1782740835898;
        Mon, 29 Jun 2026 06:47:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec37dfsm785750166b.56.2026.06.29.06.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:47:14 -0700 (PDT)
Message-ID: <d54dcae1-00de-48ff-b6ec-f57da28c4adb@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:47:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
 <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
 <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
 <akJz2xNeuzIiE3Vc@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJz2xNeuzIiE3Vc@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNCBTYWx0ZWRfXy6Lej0+dDBDx
 bcB4wf+w87oh+U9HAPFvlQAyFVqdql0wR/O69zH9OgoXIHcsrYMjRH3rgZBI/+j+F/nqVOATdJM
 bvHiS+/DGePOXgKV41NT58JbFKVxZg0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNCBTYWx0ZWRfXzGK8tDLN1U8D
 G+5nM3i2NfG79qQx0q2sPg/4F+C7yEdd+uz1RlX5kBshDFjbbayFpPCmf8lj5aqWWXbvB5rA7LR
 j+3C4OO0eoIenSfQYQH+gOoYkJXbXJHYkXbXKb4puc9mAs0mcNYu6iDbF22ZkuRHO2VCSIwLG/B
 BY5zBQOkO5ksFuFLnt6XO521kL5WfbFf7rVNwo45rYfoAKUOuW2nsIXeaQp+V/3a/1/ALAC9FED
 IjooykqB4oEbm6w8rxrnWe7v8rh/jbsi1fO7FwO3JLWYHCFzKpJyAU41WwEg8cxlXD82guNUJOc
 xqCdV0NYHFKnMAHqwHCo5RXGOpQ1P2BQXKK/xDJ9gl87l/81hhHCgxrEWwaB7HkPchLOg+7bmBE
 l9pRR053T4UBIqdrYINLSPOcgTfn2I9yiUc6qqihzSfO7HyBmJHp1WyUajY5jT6t1ZUIaJRyiei
 ujpAgvJBIE/bBbCs+vw==
X-Proofpoint-ORIG-GUID: tOQ67XqwHcNI1BunupidJfsyLspRRk0u
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427765 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ffaXYdf2Q3_1duncg2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tOQ67XqwHcNI1BunupidJfsyLspRRk0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290114

On 6/29/26 3:32 PM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 12:30:37PM +0200, Konrad Dybcio wrote:
>> On 6/26/26 5:53 AM, Qiang Yu wrote:
>>> On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
>>>> On 6/22/26 2:49 PM, Qiang Yu wrote:
>>>>> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
>>>>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>>>>>> Mahua is based on Glymur but uses a different QREF topology, requiring
>>>>>>> distinct regulator lists and clock descriptors for its PCIe clock
>>>>>>> references.
>>>>>>>
>>>>>>> Add mahua-specific regulator arrays and clk descriptor table, and use
>>>>>>> match_data to select the correct descriptor table per compatible string at
>>>>>>> probe time.
>>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
>>>>>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
>>>>>
>>>>> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
>>>>> require QREF. So I didn't provide its structure here.
>>>>
>>>> I don't quite get what you mean. I see that it is there in the graph
>>>
>>> I double-checked with the HW team — QREF is not required for CXO0. In TCSR
>>> HPG, I think the QREF components you are seeing are in an old version
>>> diagram, but it says the QREF for CXO0 will be removed. In the updated
>>> diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
>>> from CXO0.
>>>
>>> In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
>>> instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.
>>>
>>> I also compared the description of the TCSR_CLKREF_EN register between
>>> glymur and mahua on ipcatlog. Unfortunately, only
>>> TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
>>> this is because these registers are not documented well in ipcatlog.
>>>
>>> So I think part of the regulator lists you commented for USB instances is
>>> not required, and their dts node also can to be changed to use CXO as
>>> refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
>>> names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
>>> I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
>>> in the diagram. Can we leave the USB regulator list as NULL or we just
>>> add them as it is harmless?
>>
>> I believe the internal discussions we had indeed point to the TX/RPT
>> elements having been removed somewhere in the chip dev process, so
>> the regulators can go, in my understanding.
>>
>> As for the refclk toggles themselves, my understanding is that they are
>> still meaningful. Although, we should be able to just smoketest that - set
>> all of these registers to 0 and see if the related IPs still work normally
>>
> 
> As internal discussion, the TCSR_USBn_CLKREF_EN to digram instance mapping
> is:
> 
> TCSR_USB2_1_CLKREF_EN -> usb2_hs
> TCSR_USB2_2_CLKREF_EN -> usb2_hs3
> TCSR_USB2_3_CLKREF_EN -> usb2_hs6
> TCSR_USB2_4_CLKREF_EN -> usb2_2
> TCSR_USB3_0_CLKREF_EN -> usb3_ss3
> TCSR_USB3_1_CLKREF_EN -> usb3_ss4
> TCSR_USB4_1_CLKREF_EN -> usb4_1
> TCSR_USB4_2_CLKREF_EN -> usb4_2
> 
> I will remove regulator list for TCSR_USB2_1_CLKREF_EN and
> TCSR_USB4_1_CLKREF_EN. For the registers, we can leave them in the clk
> array, the driver can still vote CXO as parent of tcsr_clkref_en and the
> register setting in enable/disable is just a no-op if they are really not
> required.

sgtm

Konrad
