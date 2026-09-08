Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E913839A9
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861461; cv=none; b=HBOXkmGKSfR/oT8mZHMsmc1BuCf7tUFdWUP4BLdcJw1UqX6+XL4K+wmN0/8F3eCdSQmGrs4Gnd1gR+dlnQpiav/ScZmRL4dy53oOUlj1B3/FuAUfENscZmKQGErIYKnk8V1PSn5Tk1AUxxv0svogmO89ApwnPz1zpKa26zDx7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861461; c=relaxed/simple;
	bh=bUB5yJ7aQ+oD0OEtatKSAP+MZmjX/d3fiGJdZw4rV6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DP7Ze1WUcZ5+CK03sP2t8ppNGwObkxZYvTwwz04Rg3Ci8k/74wE6DPVKCV1VrKAhy3kMd63iBaAz4wcLkzjFtZJWIAzxHhjq6c2QeSm8Yr3MyDbt7TqBq/8Dco/YrC4mlhv/Rc+zdo1jv9TZ06XwMG0xF2cf6HBCsNhcoSX95CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnnIkPnn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwzfknOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnnIkPnn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwzfknOO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LjPp1645928
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 09:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=; b=dnnIkPnnQTVV0+JW
	+9edF8QTI7D840X9Ldr6a9teOCePvCBBoSPMtiG+NtsiTE8zEJUuFmXA72Msfzt8
	I+VgixVeB6gctxPtB3hy2rpk9lN5VfLnWr84ojvQCiyLfjkpsHOD3MJSY+fZfjkj
	mKW2A948itWVVt+Am9HdZsIHpZ2oF5bhmvS/X8Iulf8ViQLfXix/KE0J4ZFBbJ8D
	pj1FkyoBIn2gYu1yVF7mO+vp+4nKzsOiGg1FdrPNfqlKdRJkp3nJoXubpE5rgWpu
	FQ3fL6rYkgLkSjpTHy2GtTHipEKM//X5SY0nWE+WVsZeB/j6gmxcQhZelgbvrOJy
	QDh6sw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugwx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:57:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e921f84a2so4193336d6.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861458; x=1789466258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=;
        b=GwzfknOOWk3VGtN2a/pHMuw76QcYt8zBnQ/Hp6c9syvQZUxFOURcm6kbGqWCcHIWQh
         yvoBjBSknQxPYgfmhG0dCF/qUXzk7uBw5KE/lDy5LLLdtT5yRiHTP1/ifZFSW3/TPHdX
         Uxd/WiK/ONszeRqZl5LDQ1dTSTEyDb2rK+0e22TjpxQs3budV/4qFEpYKbimfT0Z3uDO
         KFGHzO7QmstcJslXCYFZJaqFUupZxKnAzs5HQxi4QkPIcumB/G1b3FvnUrPzKtPxSY1l
         spzqdinPoIYHTTA7U8O55zyYs+HLJ2rOfNGPnEp+8uLjLA75Wj+cd7rxzIgVNBiL3jQm
         KZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861458; x=1789466258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=;
        b=ktrTzG2W4etKn686SkHYTop4NhqK7r1WkgJyFO2xhG0mTa47gyv6SXywN1xMvJO46z
         GtW2KlwHffeDdSrSP1brIV8LrDvzuoNLNgz2DFFCvillg1iCtdpUypwwOq6QohrMS9t0
         S9RZJb+FELtbH2o7C9wLkhC4rQDIzYFYVBMnbKOCT4WUAKlv/fzmm0aJ9kqajNvyQmSg
         4yfETzDVK+A9HYBN5g0naqYLODaPhqkhnRIZcp+c6t4115MXbyrNrLSQSjHWCgLYw+pg
         EuNiiOI7OcQWWDAeK08GDoDbiywCc3M1VkKoY/JRctHha+0QD4gFMTexq05ZJxnMRdlO
         a/wg==
X-Forwarded-Encrypted: i=1; AKwUvBwV87VYsM0u2kYD+jW62RYkCOIXGTxf+ntQSmk+Sex/TVfL+fZIsa+6QJDpu6OasOtwfyZESFrM+8MU@vger.kernel.org
X-Gm-Message-State: AFuF++k3odbQsX/2dIgUPqPbUYA8Z1g2HvE+x9rRSgnOD05n+0qj2b5h
	YEmUr8Clcp1aehAJWw1ZveCSmXMUWIdWMkHegpLU8X/Iz4Gk+xco6aV6hOm0SuPSBxWFdeym1aT
	qprZuAGWD7dDSOPmSiPRRhp//0wP6ZniD/ehIs8poz53uCyuqI/EgZmnUskpyvzqf
X-Gm-Gg: AYBFou0jrdnurlvs+UDle/c/MdpIA8JijeUdRCd2zzRs6F5zuHjgVvaZUy4SzRXlBYf
	+rzN8PkXYsyHZe273c/C9+lTvdvqFYMb2G1KY8qUcljUGYY5S7gRRwlo8V5PJR4n6H8xVWBUXaU
	ZHv0vv6E1+Ipg8opKv5XXO4j9L+2GVdxBCOfBObmfE8HLXqchli3PcxxAyooQ9unMP2GvJurMRm
	dC/Zx+adyabiPgWGm1rsarVw4cEW/N6FS5lEJtO2h8QDYU0KahaFLOvOx39nL99rB39aUtdPmy7
	a519ISEzWyW1iOxGo6mUqeKctdWLGMLHhv95607aYC6E+nCxCH9Le4fKV0cvp0u+kI427wmaCoY
	FoMQ/fctqS9KC/CXvflvWtw==
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr230021061cf.1.1788861458549;
        Tue, 08 Sep 2026 02:57:38 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr230020281cf.1.1788861456867;
        Tue, 08 Sep 2026 02:57:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm5164740a12.7.2026.09.08.02.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:57:35 -0700 (PDT)
Message-ID: <4d2c00e1-8331-4a08-93f9-6564d0c46aa6@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:57:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
 <ap_RKfCbXAVBRtSY@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ap_RKfCbXAVBRtSY@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fdc13 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=MhUYJUi1OxyXR2b_k0QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 1Ge4JDpZH3qXz9YX7lzNsjTmr1-Rv9G1
X-Proofpoint-ORIG-GUID: 1Ge4JDpZH3qXz9YX7lzNsjTmr1-Rv9G1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNSBTYWx0ZWRfX1/k44xFrk2lz
 gukmWUhBgQ7YiP+JuPgY1FTs92Gt+hJ+Z2AEFH9a8pvVfj5GPKkc+oCfokYltNhae0NaBXbPLfw
 j9XxZcy5q2T6aZYwFl70YZpHLhsgparY1EE4LpFZUC+P6n4IEKfBffaNmZnrEcIZiv0En7+5x4N
 Knw30HPy7eUeAu6T8rdgWYyICz60KcHFVp8wOA1JwSAHB93J+geeOAP9FxJ8//W7nQZidhCTGC9
 mb8MJHRFrxAKK8AO4Qh71Qa90JT7mYMPXhLLlKUFoA/AhILhLuodwrF2Ov7bfbB6eFAVeDXWPM3
 UegAoYrH2jB48QCl4HldZ0RVVKhgQjV8juXRv7t21gTtVd4EfEOkGm82qupnYip8lokfQiL798K
 tDNnNrBzXxYBZaEJY8W7gukGJ0jJvLvBJeWvXke0XfnWN42xNs5E5PF+oP4seALuwm7jTmTz7uH
 uDvX9MwKG4bQ5Kud1DQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNSBTYWx0ZWRfXwCoiRwsJ5DVk
 FW6obKesOswrM4ovDIzqYsUCR5E4CEcbZ9glmictBWK38vcHT17s/67KeHglUKm52uCChX37p3D
 hQvzhRXFxvBLDianzTs8HrASA22pHAg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080105

On 9/8/26 11:11 AM, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 11:05:34AM +0200, Krzysztof Kozlowski wrote:
>> On 08/09/2026 11:03, Mostafa Saleh wrote:
>>> Hi Jens,
>>>
>>> On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
>>>> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
>>>> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
>>>> chassis, different silicon. Stubble and the DTB loader need distinct
>>>> compatibles.

[...]

>>>> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
>>>
>>> This series does not apply to ToT nor I can find this base-commit
>>> in it.
>>
>> It's a public/standard commit, next.
>>
>> What is ToT in upstream development?
> 
> I am using Linus's Tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/

This tree contains the latest release/rc tags, linux-next is an
aggreagation of each submaintainers' branches, effectively "what is
the next release going to look like" so essentially that's where the
development happens

Konrad
