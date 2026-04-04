Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE8B381B00
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775319086; cv=none; b=soemkFGxWg+0fo6u5PnHgjAqywWPlI8h1VWMJaHKms36eQdG3mFbaGByTwh+p2/O4lNKUfON4m6qEqDkwfXEsjJcxi2Ff4WAc2SRqHNoYHqg1Zp/OlzDZ5rYRgSV+IxNd6Y5PNdWWAQKFT2SEomiCfvR4G4MDPYrKnnLmZi1HkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775319086; c=relaxed/simple;
	bh=bW9xYgE9SNH6ll+8xaDZvgD4uirPY/Eg0q7gZgq7iNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIG+KgRXIVglp9dfepwC6RtZnfWo5tB1YlBncfu5n60mibl6HELuuNu8vEHwEwrLTwXGhTjhMtx0Chzko4epuDMzfo/pai+6CBZEyD8jD0ddJuf074XPRpMSJm/Tdg2BsMXYlKMYlZv8819EokM5oks+RbpfQWazR9KjU7HiWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr12GIBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4cKB+YU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr12GIBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4cKB+YU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342Xuuk3989899
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K1vmndmn1HUaJpD6ECwraTYIO6B30j5Udur3h3eAZI0=; b=nr12GIBAkl1TPvto
	03hnhUW4oQyMRO193m2dtwo2YlhzQZd5cI9WyBuZ6MvWJmBU0cQDNVesKM1wJxqJ
	hlGwQ3kDMQyvjPFeRoNKjIhJeZ1xlxWzUJcsdhpW5RjRRJmWl9r/GA9uIAJUUltR
	Xu4+I+m/97DsG4cCy3LV4/09hQkHYbvB0KTgpTIBIkKGntmzc2LZWrtnM+ynHyWl
	9qNHwrZ+uyWmYDsYsV3WwFVkNcrmFGG9WtJV6FH46LZDILWHdXg3p1k1ghY9iBS/
	4pE88iLibQe4ZFzdlanF3VhqEnE2F/qpXhDLqaZVPCbCZwHNOl75DhG+yxkwYsoi
	A5kuww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfh6e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 16:11:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so25054765ad.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775319083; x=1775923883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1vmndmn1HUaJpD6ECwraTYIO6B30j5Udur3h3eAZI0=;
        b=J4cKB+YUZXBXiav4jW9zvgsMME2VsrqtkiHJOryzX9O5XQfEgTY9ZRSb0uhr3OYZAL
         1Q0Y9asaMPZQliQm9R3Keq8HiFk38n0X5HDlMETEWTToPwvxUEX7HrK6BbgJrcvZ5dWC
         DgfE02FO5M/HQS3aorSmtN3/uRp6uEiV++7BBVU6eijdZkqtOpDTC+Ztlz+KjhDWszcr
         gBpS+ovMMVgXnciKuAEsucWlhE3Wf932S3TBs6DvpOWoMai06fYGQkMGla18DU2Xlapb
         edmY5oe2d7CS0i8RADuMorGajKV87A5stOQ4l/oI9ltZ/BjK7iKQJ40vCPHsFakWhWe+
         sOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775319083; x=1775923883;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1vmndmn1HUaJpD6ECwraTYIO6B30j5Udur3h3eAZI0=;
        b=hyAVsTw/TO3Nb1YrPbyON8CdAdN6z9UxwkHHONdia7XOVSC6D4znGK+B/MYF0wN/t9
         /j0U1jUUluZvSTbGk/J1RXNxac/CH9SMOYDTvmUKTviqjN+9eJ1nPBhpLoGCdRSmKY2O
         gy4LUSe+lnhbLuKapTAYVPUs6Xo19f2kblnGPxrXHvkhznxALyvOgovbF+jCB1tQ8dyS
         4GWNU3BKrUQeYVJUz3dB4Po9+HkBsjY7VHM99HizdlX2+Fg3mbGAIGSbFceHQu3aoODx
         0qVnMLvdZvJoQr0GDsc0qp9oG/2IuFOuP705wSAutWcFxsSSnChj4eLLg/NYlemZqofs
         GkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzMOHLt8fbq4S5WYWKolAHq/5fVBgto3EkQqJpFvOc6cDO3c9x/13g/2WNaKHh7aHEAGhF9Jr220no@vger.kernel.org
X-Gm-Message-State: AOJu0YxwA4opyS9gXJlGRnh2Xm0cvVvRmKjt6Wctt7y1nbSifIvrZ75q
	r+jGF1fDZ7hn2+CYTnGFCQUCk2IUgL8zmWvPuk5kIUg94j3DvYdDJRnuZWRr7RTg/3hF2sHpKJN
	qzw4I2ml3oJ3qfrX1iC3MbPVTuM34/x89YSBAHO0L+TXFQbCID43bVJcvanBE7Qb7
X-Gm-Gg: AeBDiev0LnFJglB2NsjXRVwi+A3sguFT8rHem3CTxKjQM6pO1oeg/0FMg9kEg4ExoDa
	MJlI0pFtzMl5PsCKLfT6j95XRBGvc8B8QSJFnvJVjQgmyYn5aH2PuxTVfXzWVkDf+WrH07WM3Je
	Ve5/9ng2eeYxFDXoUFgTC5t9rKcPL2fPn5tDm/QpTOjjKJWOb9VG/RIMbMG0ZWeJGJ/fjW8EMwo
	EPo+e+OYdFGMRGQU/dPLu8ufXvOeClQvVyLOu7aN3RAx3I71m12PMTApuqEzxOe2Xo6yVcHNg2w
	i7PRMIJ1AwB7sp9ZZYff9YTA6DQg0vPMThMrgSlkBMvltPfzBERmq2Wvv/mpltB7WaBgvr5meMB
	yiJumB2brN2ly4K3wjmZOYIyX2FKs22CVdVfRgiHKIoQGlg==
X-Received: by 2002:a17:903:3b87:b0:2b2:539b:d2a0 with SMTP id d9443c01a7336-2b2817d7a3dmr72345555ad.45.1775319083493;
        Sat, 04 Apr 2026 09:11:23 -0700 (PDT)
X-Received: by 2002:a17:903:3b87:b0:2b2:539b:d2a0 with SMTP id d9443c01a7336-2b2817d7a3dmr72345235ad.45.1775319082989;
        Sat, 04 Apr 2026 09:11:22 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b658sm96006835ad.31.2026.04.04.09.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 09:11:22 -0700 (PDT)
Message-ID: <09c50a08-e8d8-49a6-9726-d01829ad96ae@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 21:41:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
 <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
 <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE1MiBTYWx0ZWRfX2fQfLViSNLjx
 GS8w9lLRecliIv+EjRPFFtbDWzg4q2xwrO8KYoXGnx9sea32EGOSAyAfhgbwfUP2FM8U8Gfr0gb
 wQOzXFvubg4EN710wDikrHJFtyQiEgSp5Zkk0WAkCHNgulxQbqAAnRArMEmdBIfHg9w1bPEN+Lr
 e2BCPwylPGD0Vw65a9isSZPfRNEmN0qMtNdO5XS1ut7N7WvKCz7xuJ1NJgRo7oyfk46w//Yhxvo
 f7tqwMM/rnn00YEQRQMGX92F+WQ+vNaSzu7s0+EFTsnws8iEEIjUd7hyP0WNp+lXrTMCDF0ikKG
 4enazNmQd6BpOe27YMewP0t/6V9CIwTikPNuaPjqi8NRnSARPnTVjsXqP8BNxrW/dEsmRcnll3q
 FjnsDtmpbUNRE9F0ADFid5keUrzPWxVm3aZsoGNHn2+TCetbfQNdcJGE9VijOwdGTLg9U4Fb8Jp
 QrmqTe0YWzlPB033OqQ==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d1382c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=0mu9dE30S8F/XAQD4H0lhg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d8YLdYc5JhK9K9vzHkMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: wWZxaMAbU0EMF4fBuCHWTQWfxH4YJlHQ
X-Proofpoint-GUID: wWZxaMAbU0EMF4fBuCHWTQWfxH4YJlHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040152

On 4/4/2026 1:50 AM, Dmitry Baryshkov wrote:
> On Sat, Apr 04, 2026 at 01:39:50AM +0530, Akhil P Oommen wrote:
>> On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>
>>> Enable USB support on Kaanapali MTP variant. Enable USB controller in
>>> device mode till glink node is added.
>>>
>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> +
>>> +&usb {
>>> +	dr_mode = "peripheral";
>>
>> I can see that the usb port in the MTP support 'host' mode too. Should
>> this be 'otg'?
> 
> It's stated in the commit message: OTG requires glink, which is not
> available yet.

If the issue is with switching between host vs device mode, isn't it
more useful to use "host" here? 'Host' mode does work on this device and
I use that to connect an ethernet dongle to ssh.

-Akhil.

> 
> 

