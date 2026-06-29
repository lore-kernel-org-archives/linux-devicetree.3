Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436A73BB673
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735937; cv=none; b=W8hRZSAkC0d4EtU4eiHgnA5I0OA1nkE3Pbjz2rFaTSr3sR8sjfnqRHJGXz4o1CDkAKLpjn61PSiW/zKsrWL4zTI0VkGo+7d/HbZNxGiPrI2yYXXdFeOzixt74gsVcucJ0oawo+ipu60/jbn7MM1wUoINBU7CC7sfS3K+li9l0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735937; c=relaxed/simple;
	bh=uajltYhiMvusyvh+KCcSZfqXGw6iS9PcZKLJJkUndEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erzjQCoJhLEcSq5CaayitEpEHrjuzSO27GBECpW4VkaE7//aZI81f83hFNbI7r0JCczq/uNOKPjELi172QPOawoF0RTw6jOB9S6k3mfgRmqElIAdCQ+5xY40XA92xbjabAUoGQBJxsIcBUq4cDBGECjATF/5LIENS4fZGjM228g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wo+z5gOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H46L2LRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wo+z5gOY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H46L2LRp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT35J2604346
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/gDFeWX25oeLKFNlAnH1g6BTev6I4bSVAzgfKi7gk4=; b=Wo+z5gOYrS0vd62c
	zTV/FZNjbV4MKJE690kAo6uKKQAOcZv9NmX0GbBaXuwAqFb/5HIdzljlpZhbMicZ
	qe+muqU7FUOQx5fQKXtRJ018+laghoGdIRD3qD/tYmzkuEgvs1MvPlydlu525DXG
	hutBvy0EJQ8Xhwp1HdMbnnvXHAaJAidRrMC5QjarNmlyguGpduTGdr/CnP5e379J
	1nw+KyD6et14B1j/YyLkubLmMIhFqKYRheHLchnfMImdyYKI5gYieYXET+47tQgV
	Uu19J6fgarmjK66cVGj4SkRVbVTBWAO2WRkPETkW9crDWnIt68JMusM2wECjOFGp
	2UhnDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88rq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:25:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so1803671cf.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735934; x=1783340734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/gDFeWX25oeLKFNlAnH1g6BTev6I4bSVAzgfKi7gk4=;
        b=H46L2LRpPNKkv/6oAPN6xgp94w+L8RlGH1k579larV17ihmBWL8fiEuhXFha1+zZbJ
         GZ1Djw8a/j6q27lzXiUv6o4634ML0kaiCSTMM6C+AzmDDW50WWbX3pQNq3pKeMn47tsZ
         WM9QqThTmLlIIDs823SLIYU+GUcZJMbGFSCG5F0OpkEb6GQVqmsz64gai/ykAROSSbUd
         tErQy9KXwBB3b5tvhE4TjqSYz2IKNoRUeYu7j48GSVZlIwGbvfst0wB36037BQIs8h8D
         oduorUJz1b+WdQWPgJEVQaQKJLvo6LQlxqIqCVDcL8YmZuPvwO25jL158t0Cxzffnbns
         vzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735934; x=1783340734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/gDFeWX25oeLKFNlAnH1g6BTev6I4bSVAzgfKi7gk4=;
        b=o3CU2nAtZJuq2Ny4+JGbpBRzCChLzV/Ly8DopiC5o/rmqUgtzvjiy+P7MBYz6XcK0o
         HfD3dqaXbLz3eAHqIgPQpgR4mZiF/KPRBgmBituNqfxNBG28Bk8UdFUFESXeWCiw9oRU
         JadWvQpMHRMIRHS4pbWtDM8lDv83rwxxOh9308A2w28+nMxUCpcyqoJnJ15NeZDrRJ0x
         KZPqlw9rbIhEAs7+krY5xC8OZ5kzQ8u8iZJGBf7RPPZXXK+3j+ne2rmrlphE/sY5wmiR
         Q03s1RKmpeGAC2pW0tJ+AxPplX/97qpqyIFy18NoJe2r7fL1NWNRmLtGzx1I1F5452ta
         doew==
X-Forwarded-Encrypted: i=1; AFNElJ8jAdCQCwYeVbbi1opRcK9bqicI+pmCBvXxNK1nSdg1xK79B+y+w9z2z2U4H8C7mPn5tB8l3xJJLib8@vger.kernel.org
X-Gm-Message-State: AOJu0YxCsDz3uU1gffP0CdJzNa+k1e4+pnh3+76X/sB+tOG/lFuqCBfi
	iOwvVwGcLJGGFdxbTlg8ZXns9DMliKb57hTn5lxgav0Z/3yY9K5hJ5NprBHg+U8PtXso+jJD98n
	MgZOd6i/2tikfcvzF/qTx0g/MKaFsq55Jkxts8d+0zWZJNITEvhdKd/Pd/ivQmPyx
X-Gm-Gg: AfdE7ckQkNDuc8p92ap+p7UE8vOD/S/EGksQf2/YJ2Qxjak0fXn32hjkI3fuJKbweXB
	Kad7agHAE/QTbJg85AwVHLAtfT8Sc91iyGk0xNzwnl4mioL8aYfpznoHHht1k6JGd56o1MOi7Je
	giAwlJFtvR081x6qjHkkUyatgCqdxSWsA14k+Xd5K8JHNGJ1CYKVGnKDmqDfN3S7l9HjDiyM3dB
	XE/qJDr1ZT6dMxasw6g5neN2dCr/NMJk8QDxsSwIAH7oJwVECsK+RGdGPB+ivDGATBEh91dN6Hh
	VoLQpMZtWM7GmLXc/VEiRmeNHRUZv8fNQmYZrPXJgP+nt0I/VeYSEPvxZk6Bjujya5PjL/d9Tps
	QrynGCGzydhjHLV/wtfbs5ol3+WZTZRPropg=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51a8c9b95eemr96932681cf.9.1782735934330;
        Mon, 29 Jun 2026 05:25:34 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51a8c9b95eemr96932421cf.9.1782735933791;
        Mon, 29 Jun 2026 05:25:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8118sm768760066b.24.2026.06.29.05.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:25:32 -0700 (PDT)
Message-ID: <103bb3bd-7099-46d0-b0ad-baec1493d742@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:25:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
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
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
 <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
 <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
 <akJjrh5z+IVvdRVp@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJjrh5z+IVvdRVp@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJBsvLn7g5B3VlxpwLKVYrn-Ep0zIa_M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfX8j95s3z6Lu9z
 cYuLOr7wRj10kly7Czb5USDxo7CrEnvDyHgI+5ljTPMK420h1ZG2HQAv89VFEB5O3Xy7T2I7N2Q
 eXjKomrDu6niIV4Ur4QPQvfOLRfSzJQ=
X-Proofpoint-ORIG-GUID: UJBsvLn7g5B3VlxpwLKVYrn-Ep0zIa_M
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a42643f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sBmxciXZafjqAzqtsYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfX6QcxqtkjBWLy
 5KCIrPiGOKC+USjOKpKgmoElu3Ygg/iPuVYsW1ZeMSpf5M5VPfP+Pj6CXmeVCte7SUs1GfeEuBF
 tCa6pOF3uNNA9iI1NjIIikUpC1UYmnOpx7gfJ1LDjKXOZoAOdrIvmq3BKO+/RR3suj/8eDnxzYu
 Xw4xrNWahj8uQhUi3oU2c75lcWltPnZuEQCDG67de+b/c+o0UYF2Fy1kmf6YXjOZmHqn+mWgFa0
 dm3ZnT8HSzBOpwN5OXSrF9mKXTryaDRtKvDTgyVRCND4Ii2qfqFvt7mKs2rc3WNfwHe8BuiEBen
 24A9myRV49ShN1GVU5H13LakcC6WMycEL0RnhLHYmxQZs70jBYZYENsNKxuAg7at1HqFzqpKBsT
 ucIyUS3Zf2f6mX8SpJBbakQbktNiK90R0w1Yw2fj/FSJkbq9lg3NHmUqE1paeu1Ka0L8fhACigM
 vu5Wvx6bWIjjBSYfMCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290102

On 6/29/26 2:23 PM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 12:34:10PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 3:31 PM, Qiang Yu wrote:
>>> On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
>>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>>>> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
>>>>> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
>>>>> LDO supplies for the PCIe clkref paths on the CRD board.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
>>>>>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
>>>>>  2 files changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>>>> index 9c8244e892dd..8b42f5174b31 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>>>> @@ -19,3 +19,18 @@ / {
>>>>>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
>>>>>  	compatible = "qcom,mahua-crd", "qcom,mahua";
>>>>>  };
>>>>> +
>>>>> +&tcsr {
>>>>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>>>> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
>>>>> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
>>>>> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>>>> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
>>>>> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
>>>>> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>>>> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
>>>>
>>>> The supplies are correct, but QREF uses refgen4 on Mahua
>>>>
>>>
>>> The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
>>> think rename the supplies as vdda-refgen4-0p9-supply is better?
>>
>> Ah, I overlooked this. Maybe 4 could be better here, since the supplies
>> that end up being assigned there match what we call refgen4 on Glymur.
>>
>> But there's no good answer, both options are terrible. Let's add a
>> comment somewhere (in bindings?) describing this mess, perhaps like:
>>
>> # On Mahua, the REFGEN4 block is supplied through pads named REFGEN3
> 
> Okay, it's better to metion this in commit msg.

Doing so in both is good too!

Konrad
