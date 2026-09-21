Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C25499F35
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998749; cv=none; b=aqsNHlordKXfzU5mAutos3gb/8+lCKyVx4qM9aK1xHeMUaJct4zoJaoQnZ0mKaWvWX1S+twhFnwrvyN7Xs5s4XzREG0BTA6s/L98cQnP5RYDfpQ4V9XF71ogE9jpeeMJrAMRU/rMu+RVzoGUUi3iqhcMpD4Aelp1LDmL1ifFYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998749; c=relaxed/simple;
	bh=Ts35l+PEnL8VPft81Hlw49XBk5atQ8XQhif/b4F0qak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5bpsn2qApfdMRB0RZWYiIoOUDj/n0CWuOg5M+UlAHENsKHIqYDHK1PeuLYFl+1+j6zobkRfpQz0m5XOwZpEDnmhpaVlsMCheIwXi2gE0CI77+D4y2pIId8szyXo9fcgJLGf0NEycKPx7gP0nmY35o2iMMDQqO3LQpjK7KKq/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB8rkH4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0XCCvhy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB8rkH4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0XCCvhy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LDouhd704231
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=; b=nB8rkH4kSG9Wl+rg
	tRHB+jL0+WSVKo3teO/XzFV37lsCqxpGDRFKaouYCy3SiA51xSNH4pyPBxFQgPZm
	SXvBuPBH7xRJxa1j7bdI6FtpI3NTI9jvx/MB6XgqSUxCX6WS9JOmQQmpJ/z2dfaz
	zdQoYAQkGuOeeFrcMhC0S0kNe0kAgfajvs7VycjmWds2mAYdbN4SbcbdcgGXt0OI
	NzgfSO+L/RKOA0oQXZLQyqPCZs64VPC17M4Biv0/ZzEspG0VU3CQZxoWGvt//JBE
	MA3cUSILm2Qny29yWRjH3BuzV5f5syh0MBjGS3+JAnLnpdqbu/ZdP6LoJ8ZyivWv
	YsgZ1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1caj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:52:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3568607a12.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789998745; x=1790603545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=;
        b=i0XCCvhybcJ4/z+r0vYqS8whqPnWVviF5OGdawz16W40b3JFpjJU/Zux3mP9IGdPgU
         51mDNYtj+2qILFeTdgfVoCX661QMI34IDkOoWujHY9NcPsuGmMS5o7ZskSUF7hC9j/jp
         YFinLfrZRuLCgwFYpBK0ZyMPXdIsNCQtzMkdR9pmqpp7Fc0tne9rbR2Z6LVWV9KdG2oX
         X7usUxb2jQIfALaM8r7GAm8CwdgyVqrzjI6raWAcVwXtHCkJbfal3CDuZhBuFxBsmA6k
         gPO8IUFmYqW2TC4kOsJRQq35VLbrOe04QkrQX4FPj2/cP/ZeCZMq2uizz6QtXMvLyTss
         G/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998745; x=1790603545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=;
        b=fxwVQWlATofhCouls1gY3tqNa6zwlVn3oRGdByhldXffc9X7W2XZlY38P2XhLuDfp1
         XwtLJB6RZl7GfpPoADSexRd7tpaVR9acQOIMLq8NGY3S3RRyZOT3NlqkArHfp7FEplqf
         n8B6t/KGzjP6q3BJx/xB75iz7ePTajtW51edhl+GsZA4vcIkMNWIbS8bL7HjTS1C1JWf
         8Wp7Q6S9NLQ6+6Qn60qnHavq0Ab3rfNexfZBsem0CYeN+fLIFFEGJbXQc7FZ/ymC3tU6
         DiZi5CVkMew98PvfCgULI/xEmJha652fonHWfvuQEIE4toT8WAg+ubwvs5JJnA2tMoZi
         qn1A==
X-Forwarded-Encrypted: i=1; AKwUvBwcGr6dxkvCGaBII0Ah9SgrrreE9heVmqoPKa8GM/6eQZx0ZI4lM7y60iT1tM3a2GND3etYGuhHHIdG@vger.kernel.org
X-Gm-Message-State: AFuF++lVXnkvYQfA4vgodQe3RSblwQvWYv4Z+uG/PQt+xeMxMKwbdvXz
	7nyWJflMQrT0UYUll0E8TLEh+Tm/1Vvwwgx+ZTiTZGzMobvW0+9aWI6yPmG1p+WPjfBjc5SFgwj
	/tqQ+87dJh3bQwZbYXadEcdi632tkZ5yCT2/06kDxLP+fe8561R+///UcArqZLCyl
X-Gm-Gg: AYBFou1ZYUusaGneT38P6zdTFw69qxmsFLDprBQTV1Folt4z5c86VBwTlsvcJkS0s14
	T9pRzWPXfhYWnjDUTwiA+fVr6VNW9prpccDFC7LvvBVq1n43iEhA7uNrb/4Chm83YJNnbTHRmQd
	Rk1sE8jsoJ93vy1FzjGg8FVIMJeBcTOJ2p5HTStNGUTCvRqOjgfEAO7X6iJOQZHREp0hw+6i7vx
	fODPIjbmx0+0XuTYSXxWQ1u0qilUpT+zfbVy02cFN0mMP4oRB+nifxhbRV/khvEAhi2jNAMvTkF
	Fom7j4Mi7F9bQKF0gjgja0Xc/zyyfjauKZi3j83vW7WqPGLI3bavd12Da0yKdGfyNWJfJCPze0N
	MX3DWjvlaP3Eb7XkmlJ7cX8FMHi30f6rM3iA=
X-Received: by 2002:a17:90b:2749:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a025f0ddefmr6072552a91.54.1789998745488;
        Mon, 21 Sep 2026 06:52:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2749:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a025f0ddefmr6072531a91.54.1789998745016;
        Mon, 21 Sep 2026 06:52:25 -0700 (PDT)
Received: from [192.168.29.146] ([49.43.232.81])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm36081162c88.15.2026.09.21.06.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:52:24 -0700 (PDT)
Message-ID: <5c16f588-3ea4-4f37-baca-e5a2807592de@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 19:22:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add PCIe support for Shikra SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
 <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfXwxghfIoweiWs
 gCLXcTXwXSvK12MOAONi6/kryajSy3iWTL68YVAvV3HR8cCe+R5cp5SSD6fsZyOxWOwsmMaru5w
 WT2erMEw/oy9Vlk/TTQ96gQHts9mQhE=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab1369a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=gjxls31er4aXgMEaaoPcOA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xfGM6EskjLEd39232uAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: lgOSNEo4VfEEIuxP5DuzwgIB1Qwavj3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfX9KlbL9Ll+5ti
 KvK5XRHHHh8MyJJZKXr2ZAYQhH9Eunq/MbgSOrJZLbTaiyCOyuwwdazMuOhFFYYmk3xLIfvlR8M
 tgrKbqx41fGIHWC+hbaKr3k5KDyyX1/FPGDH3FKb3h8SFr0YpAab1VKBxUdurHEg7nevUBhem0X
 dh7OcYkZetoO0nd3AjBTLUsCwZUzdFU339ppDKI75FGed9dfqYAjGL9FVNOD5HktkbaeZPhHc/o
 ogm5VfDWayK9FP3NS/XBSSps24HK4z8gXZNZMC2d/krgKYSx4CF+qv8klsFDeJjtroFf/+e1PHU
 pZiU9YIIQd9+qT8CD2jywY+pdj03IRFswtv9KrximK4gmwps9R3jSfL1rdv9aSZBkXHqLQfkwJ0
 /UXlXtcA15RVT2fvIHIux1BespghdeVNR7d3DffkGTh+PWxkS6XCHHSV9bHebnvTNASy16iQBEh
 7wXVmEvmDceuHbbNuyQ==
X-Proofpoint-ORIG-GUID: lgOSNEo4VfEEIuxP5DuzwgIB1Qwavj3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210201


On 9/2/2026 2:16 PM, Konrad Dybcio wrote:
> On 8/31/26 9:26 AM, Sushrut Shree Trivedi wrote:
>> Add PCIe support for Shikra target, by adding dt-bindings for phy,
>> controller and corresponding phy & controller drivers/device-tree
>> changes.
>>
>> Shikra RC is connected to TC9563 PCIe switch on all three
>> EVK variants: CQS, CQM and IQS. The individual downstream ports
>> of TC9563 connect like below:
>>
>> DSP1: M.2 B-Key for 5G Modem
>> DSP2: M.2 M-Key for NVMe
>> DSP3: Embedded ethernet device
>>
>> Power and reset to M.2 B and M.2 M slot are controlled via
>> TC9563 GPIO's. Since TC9563 GPIO driver from Alex is still
>> under active review, current series only contains basic PCIe
>> enablement for the controller / PHY. TC9563 enablement changes
>> would be posted as a separate series once the GPIO driver is
>> ready.
>>
>> [1] https://lore.kernel.org/all/e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf/
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Remove TC9563 specific changes [Mani]
>> - Fix commit descriptions/subjects [Bjorn Helgaas]
>> - Fix PCIe controller dt-binding errors [Krzysztof Kozlowski / Mani]
>> - Document PCIe Gen2 limitation in controller node & commit msg [Konrad Dybcio / Mani]
>> - Add GCC_PCIE_SLEEP_CLK (which is actually PHY AUX CLK) in PCIe PHY
>>    node.
> You also silently adjusted the OPP levels in the DT patch:
My bad;  I did ACK Mani's comment in v1 regarding higher voltage corner 
votes.
Will mention in cover letter next time onwards.
>
> < +                                     required-opps = <&rpmpd_opp_nom>;
> ---
>> +                                     required-opps = <&rpmpd_opp_low_svs>;
>
> is the lower one suitable?
Yes, Gen2 can be supported with low svs corner as per HW team.
>
> Konrad
