Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F537418C
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185792; cv=none; b=RgU2sl0IgmFz5LK4mFkNmjJW+A0ZSoWgSVg6ZSXs3H/irJ8suA/QI2p6oofctqDjd/A/pUluUDc9BWet+vZa++TiJhB5Uh1e7PJXE6+yaNjDJQXv2aNNYztcJjNkijejYzVqIj6CYLLTcA1TVVcoTrvcLo3mgEjXwCdvckLDU+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185792; c=relaxed/simple;
	bh=3rr4LwQX+nXpLvqjzfnjc0qC2ZiHpp/e3plWdkVTZCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK7rcN3XWJzfEvZ2jMHf5MbBPW0o/+5ohWOHgB7RMev7whr8a/VnlB6fUlDT1aU3suroYgHG8GyCJuBey3AMgyEensHSDtXsOdeppd9vZfxyzv79RNo///546XQhHkbb9X2AfWftipZNgu3w6jBBWBtEl7tGpX60IdE/ySjlCa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6ZyBoBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXtUCStG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6ZyBoBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXtUCStG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69511Dhi788955
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvE90PLb4SD4ZAizJF3vBu6QMBqFDMhNe9329Pa7vgc=; b=J6ZyBoBdS4qG/SG3
	fLrM9aS1HOXqeVEVUw7J0btHNRL8pQ6PKQ6oneRYPeht8aw29WH8TGBXk7kUaE1p
	oGa9isbudNyrLgvub19f7juWnYFyXX2ZlukGZmD2VNvbqiLC/urxxfMUZdzmjW1Y
	wk8tK5coPRYXmzPDmojyPdhwEf1W0d5i+GRnv7qgwfzS1hOEHB3SrSVodT1lwBbw
	Iz0WCAPUtyvzTsFb16XsZMvGN/mURd07G4NfdAbpxWBeyxUYlL1D6Jpqhg1yeOW0
	O7cEH9yNuIrFU1hT0L89HWACH9wmPM/k6ApIhE7BK7sjcY5kV1bv9F7USnlXdcZk
	0ma1tQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4xw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:36:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88a10162189so2534433b3a.2
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185789; x=1791790589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvE90PLb4SD4ZAizJF3vBu6QMBqFDMhNe9329Pa7vgc=;
        b=YXtUCStGoIFiuzDmiGh7ive+saqpGEjKCzftzyJ6URolC6RTpxJ7UnSfPp6gNPNle/
         kcjNaPB9nkCy02Ku9uuzVflNgPG90+LcTpTOVt7DPHXjfXOZ+r1EsxJpBRdC2Un3m72R
         5RI+/4MQZQGxfmbxUNflDh7L87Pk035la7dljHsVce4Ww4zeC05rfbFzShKnRzQFghgo
         KxjvMrefsN7yTtBW72FT0Z43XyINJnGACcvWb62rGHh8A+YuubVRUdGJppvPFPdCj1GB
         ExP7qNizVkAGiKZGoUcpaEkYAIc5tIj/cQNCgn3hFUS9dV2PcjFoXM7oldyaqcYfcq0x
         WgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185789; x=1791790589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvE90PLb4SD4ZAizJF3vBu6QMBqFDMhNe9329Pa7vgc=;
        b=dO+XyK4rp8xCv7lanCvf5p7qZQt9hx2PHrOj0Hp5kM2wrCZxjjloC5aS8cF4A6LDAf
         CPRDzs3s64K+RaHyB4b8189fzfWwWGkMvt4tqBxipgXZKbJrgJQXTBSeaZmM3iSv6DQM
         DsXdNc6X72RjH10FEih3dETb8Ii4gS+y7g7gk+mC9EoAu9MBlTGvkH3mOfF7+L77/geX
         tnM8qBcEygpIf3C4kvpbgntk5T1i2YDzkq9JzsYjjsTzWRtiR9zsDlzAx1OK7fT6MakR
         +ZvNyj6YO7Rr2e0LBYV14rn8p4vKiuYrFdktNFmd6ZurLDn0rYMOiRwOaGaqIrrctd+i
         0wCA==
X-Forwarded-Encrypted: i=1; AKwUvBxoVx3rlYiV6bBnIhXPAvU4QX4VVENZKuiPVQQPx/4zPlyD/dmiz7JldgAUE+DfaVq/23LbPIe/Ba9z@vger.kernel.org
X-Gm-Message-State: AFuF++mYv3O2eRHhvfdK3nbbXwY4wuYU1CKixX3O++qST6B/RATu//mi
	sXmEi6davTQygM1GktHJTp0k+DZpnFhEBXW1QwEon8reOiMUkNvSe5cXJW9y5Ih3Nx3Zz+E9rUZ
	bXah+1CnCH9TlOFZT5sjGB5mHW/KqmcG4nppaTUJcD/YuH+CU6hhmlMuDMw79UU3r
X-Gm-Gg: AYBFou2bP6wbEqqNRfdiC8UdlAAMJo9TMBwgRPKODKxNHVlvlcAk9LmK8gL98LuS1tn
	+oPZTWLsu8frOZaCnaDUpGdZLd/hY87Buruth/U/+fndb236Gjv9VlW+eWtySBfdKVQA26RY31O
	WTqjcRB4DNywb0pUYLLln74eM7jVGozYiB5Q0Eh31CHZ7nuRuJecVNxRQmC/KL41nSIXpgNtP3e
	/xwvmqYIy+bNTh2ijH/AorWJfRvVNnvzJQ6ZPPr38KHaTQCX8zyYL0oG1H1SnWefwd57YnBQFeT
	XKIlKoAaFzTKbd6bKChCS99ihvlU7OWaPN+CONZjYBevx0IVnf6tkSBNri7pA1O+3fkmTIM1Sf3
	J/YeYOQ4xVP9VzKFaY2sogN1OUuI=
X-Received: by 2002:a05:6a00:1251:b0:880:8fe8:a3ea with SMTP id d2e1a72fcca58-88c6492f52emr5380500b3a.45.1791185789190;
        Mon, 05 Oct 2026 00:36:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1251:b0:880:8fe8:a3ea with SMTP id d2e1a72fcca58-88c6492f52emr5380480b3a.45.1791185788717;
        Mon, 05 Oct 2026 00:36:28 -0700 (PDT)
Received: from [10.92.214.69] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88cb27d93bdsm1759232b3a.30.2026.10.05.00.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 00:36:28 -0700 (PDT)
Message-ID: <53724835-33ff-4746-81a5-7017b84453a1@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 13:05:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com
References: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
 <ar3LTBFtF_qqw7U2@zenbook>
 <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
 <284d1013-5bc7-4732-91c0-87a6c870a349@oss.qualcomm.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <284d1013-5bc7-4732-91c0-87a6c870a349@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX/cYJHCIOOl3J
 QlMOJ9M+Uz8k9U/cmB2uyAvDX8OhIeLQ6iSGCdJIUq6db65amq0quqVGaTTYai/1Bk8wQqsEng9
 jvQ6mmytjdGcQD/naINpst+Gt0GCdnCT9rXjsrt74niCs7vMEswqcpqLNLUSYvnLmCuwx6zAa8y
 8j4JIX9CS+w4nMsyD3YLi9+bXiYzLcol0Vx/4SS8Vf4ki7I7xp2JzsdVYQfl/nGnatAPEBxcnPM
 d4cYjXCsWdFdc5oD4Wn9UqBGErR7zzuhAkB9Y5OWQ0Dp1Cwd2ErRxeYifJd+apZ7zXGOZt1q9ok
 qiIDd5yTXM+0momQhp0EptBXjkKZ8PF86Dn4a+geqCRx3RaGIOkjn/N0UVnQTQAAG9f56KwI9A9
 QsuYwO315hdb2wNf1u19pKgSzJRQ1KRdJGN/R8QF9BDr56oq0uytmZuf8upfUmp3oJtlLMzm2bm
 AW4/+4Jn/m3bkakstCQ==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac3537e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J9omWgiKjRi8sk1810UA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: dtSlYC9rGwdldj0AAW42FXgx5wTJteOY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX2uN0UknbrPKh
 mUACDMLGpoqL6Oz1laDWK9lj6T+61TEnOLQDY75y4VbAanjzsAvZJlLp9v0Tpms8Gx+v4idEtY3
 F36Hjhk1xWINbT1gsJF2h16UC105hWg=
X-Proofpoint-GUID: dtSlYC9rGwdldj0AAW42FXgx5wTJteOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050030



On 10/1/2026 12:59 PM, Konrad Dybcio wrote:
> On 10/1/26 7:12 AM, Yepuri Siddu wrote:
>>
>>
>> On 10/1/2026 8:28 AM, Bjorn Andersson wrote:
>>> On Tue, Sep 29, 2026 at 03:31:29PM +0530, Yepuri Siddu wrote:
>>>> With RPMCC proxy vote removal, the WCN clock must be explicitly declared
>>>> so the wcn3988-pmu driver can vote for it during WCN power on/off.
>>>>
>>>> Place the clock in the wcn3988-pmu node since the PMU driver owns the
>>>> WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
>>>> RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
>>>> variant.
>>>>
>>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>>> ---
>>>
>>> Why do you have one problem description above and a different one below?
>>>
>>> The information after "---" is not merged so the git history only
>>> contains the one above - and there's some interesting details in the
>>> description below. Perhaps this is the b4 "cover letter"?
>>
>> Yes, the detailed description was in the b4 cover letter body which
>> gets placed below "---" in the email automatically and does not make
>> it into git history.
> 
> FWIW you can simply ignore the "cover letter" for single-patch series
> and leave it empty (minus of course, the changelog)
> 
Thanks for the tip. Will drop the cover letter description in v4.

Thanks,
Siddu.

