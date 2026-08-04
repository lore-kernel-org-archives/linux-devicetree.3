Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBEF4746C1
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860371; cv=none; b=l+h4nxP/bWLJVLCs9LitmFQRnlnWR+6sUnKViVuRxCOgLhnle/rVknQ50EYO2iPIKRCcIAAZ7t0xP28dIhxXyD6Bkwp0nd6xhRzmAv8bVLt7LpfIpHH05RT1gmdjnuiU2MFlh7Z8dHIhMHFLcqqRCrb/0EuuVSrBQvWwkoI+7v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860371; c=relaxed/simple;
	bh=s9KGN+Npj+/jt/XeT4APQ/Xfb0isvyz2svaPnFg8CME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ri+4/NZh0EPjSgg5wWAORwybXRgg38Zs3YGrbAzn3a08GoYfO3tVvBEGOCZBbJJdXbiYvRQ6D4ebvgA2V2CvwS+zCtbx70tWCkFuOjFw9yFDnZ2GHt9+xBLpQBDvqMD1w8rbtGQyVN7FLe+x435IymNsxP+q3BLuOvTUznQ7b90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AISk3eFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foIkWkFD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AISk3eFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foIkWkFD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfeK43643768
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 16:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cy9NLrazGLWbthP/NwNd2SO8Fs1LZZi9kIca2k/Uvg0=; b=AISk3eFRz2n+s20Z
	f5d+waNlYStCZrGEdORMPxB3wOghe9C48RLqHlrbjY7n1UtxXOkhWXnlbyVQ0hx/
	Zf6tBJJgtek2KNVFKVS91pRW5bsm0WasosdRSaMlwHKKSzoXB81pwFyagc+/f0r/
	k3+04yao7MULZMy1Zk/IG1yjxFEmjqrRTrqKuPVPj4ifUFKcMdRaWcJCmbnxCV0J
	jmeZQjqAkXTklWi2pL1NpR+mN6Mzxd1KEOhjjNw+/Q57fzKJQu+dNoIDmWKi7S8a
	KLDMmgWU+rEliU7OZLgPR7JECmxdpmMlJduro1oBzcnFIqEIhV8uthPCUg7UmAKB
	+5wgDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23hwf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 16:19:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so208155ad.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785860364; x=1786465164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cy9NLrazGLWbthP/NwNd2SO8Fs1LZZi9kIca2k/Uvg0=;
        b=foIkWkFDRhDbLOYHD5aWGkrAADTCidP3PNhK6JWD5HYTX5eTrdLjItTI36N+0rn+YQ
         CWRT2/7PdtlY1e2mKWrrArMCrns1QMXcMZm5YvcMOhgb+4h21XODj4kAzmEws48OT3ly
         LKhiiKIb7amgQ8U2EGXp40d9NBhEyJB2oDahuUQzet98a+HFeSB1VqpCg8br0KzsRXCH
         mxuJx9QXIoW09wZlg3V+/TURaj2yYUGu0xQbgij+fE/Smr14pdUjrf/zkUghkw1RVdsE
         9tuq3uYbGXBY8lVhjN5mNrUl9l3vEVCYkV8+SgPGhr1FfNcTVpaL2R55zs6d17vKgvRu
         gPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785860364; x=1786465164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cy9NLrazGLWbthP/NwNd2SO8Fs1LZZi9kIca2k/Uvg0=;
        b=OWu3FqMCZO0b3OKb+xRf7HU9dsDl7UUO1DYLMBIOSBR7Qdju+Kq7pLRJiR04VFMjg5
         2taF7eyepzidl8dn3AeyywU70l6aHLmzMH3c0UrjTEKCqaok/JGu+6BuFyf24w08tE/2
         MInWuiRtj90Kd9CBx30AM/bK4vgZqpWr8c+fLCoh3VEFoD6s+VhQ0xxniNORgsMyx13E
         ao8SkiGjLjE5c2VcXHX2Kva0idtCu1tsMaa4mkBi3xzPM0rVbn8b6f9LdHv3FNUCrpnD
         5LjWDFQBaPLorucumzVvYPSnVE719QDMR+dkG+KjmqTlzpKqdpi3U5GweFSWA4iOHhfd
         8fQA==
X-Forwarded-Encrypted: i=1; AHgh+RpT+ATl8WTOBlfTbIc1M8eelcoGXkkCzUQzse6FLeGtqkksAHFhy+XZlNoH9UefERFT++W5W+3xhGny@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24zNR0ClYy5qv6fqfYnB+DpZKtiRBBb0HDqdST5epAAcJEAO2
	YLg3D+F/Kgq7DqrV3qRtLFi8wAU+fjbDIJ7TwZAnQWzXege7dtlTIqnH7WTRbGvFpIbb8R5dD3n
	KUJ0CNxkUWAsQVDzwoHulE8wEOLpEEoGoLMDcW9boDlB0XfpqPSQYqEE2wNA3XBPm
X-Gm-Gg: AR+sD10UKxif7pFgjNNc0VMXUf57CtKMKuCijg3+VeVNev3gQCHhc3SsQxNpFdLNgSC
	f+Rj79nbMdO2at693VEvq9jdXHt8ipWxNjCvbzt5wpeJT9NwC8FVE4A9H+An8o8aEnNEWK8eTSC
	97KKG1TXFAgnV/J9sf0G8gugRiZpWz2GjLjB5ZW+OpNi1TRB4Z4cPDArxX2U1PynxfJCCttI3If
	HmWPclDg7fVMFG4fURDZIJ6QZKiU43JVUbE/bwnBgKCBNf/8+ZnP+ihhplI78ItBkbDFIOfA9Mm
	jBiaopvyg4VizT9g8m9vVbwePa8nJrZDAQbGymSWf12QQ7UtBhvE0XkPm1l7BrqPUiA/zjful7g
	PFzDmTTuRKLYJe9yyRSKxSGG+CZdiEM+Lgormpw==
X-Received: by 2002:a17:903:3d0d:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2d0523be798mr164365575ad.35.1785860364543;
        Tue, 04 Aug 2026 09:19:24 -0700 (PDT)
X-Received: by 2002:a17:903:3d0d:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2d0523be798mr164364755ad.35.1785860364006;
        Tue, 04 Aug 2026 09:19:24 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm10228148eec.25.2026.08.04.09.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 09:19:23 -0700 (PDT)
Message-ID: <a8862b6a-28fb-492b-83c9-a02730fc366b@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 21:49:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add qcom,vmid to BAM-DMA node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com>
 <amu9hfJQ3VhRZ6PR@baldur>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <amu9hfJQ3VhRZ6PR@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E45RHvNnUS6IwitNS0a8UhjFeHl4YE7w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEzMSBTYWx0ZWRfX31rayA1WT2Pd
 AQowLQVcClHeslBHd6DMVdHrXD6u/8YlNd1/jMkVGwamaNvU2093qdmEpvz4WMmRifGaSuO7zWn
 02pyiVquB+82ArIBdMe8cx1Sd+iohi4=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a721110 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Df_5af0DindZ04If37sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: E45RHvNnUS6IwitNS0a8UhjFeHl4YE7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEzMSBTYWx0ZWRfX427xDO1uH8kL
 quLLuojDh1eNhfn13fqejgeAXmgquQmTn/sIZT4aw7y/v7GxZ6b3PAMkx7Q8ywUQZB1HjmFa0xS
 zHgVOC6g0LAFmbEAv3+P5MJ9geqOeJ2hd5CCDUjPfW7YgLdCk8RbX5tYHeIzTf0gCsdc1hHhjcK
 pFWaOdbXoUXli+5Ljsbe0D7+hDAMw95GaB1PqkGoQbpIvQko624Ow5jm4iQPiemKeC/G42em1eX
 xhHRKSaDl6sJ/U9F/Dl76oLAEFaxQKIfMcshqN3+AW05/KMH7oOgmjxTXilYOUDE6GnZ286w6Iq
 cCCvHBHOxb2K+MnP8jPRyZeoNNRBmLlPUUEnE0w1B9kO8rHOdRXq1GKj3xgswzxQUIUgzDg47+W
 kV+oGH9OPk0LY66XMfCjAbjDZ5uPo9LKP3q9R4jZXJCXWPouzSpXoHOxMnjaKAXlNyfj3ILoYg9
 M/kUFFwQWEF07qrUI+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040131


On 31-07-2026 02:49 am, Bjorn Andersson wrote:
> On Tue, Jul 14, 2026 at 02:01:53PM +0530, Vishnu Santhosh wrote:
>> On the Qualcomm Shikra SoC the mDSP (VMID 43 / QCOM_SCM_VMID_NAV) is
>> the AXI master for BAM descriptor FIFO accesses. The XPU enforces
>> per-region access control; without an SCM assignment granting NAV
>> access, the first DMA transfer triggers an XPU violation.
>>
> I'm a bit puzzled about your plan here.
>
> You posted this on July 14th, that's 3 days after I asked you to rebase
> patch [1]. This patch literally says that [1] is broken and untested.

The XPU violation itself wasn't visible against the base bam-dmux
enablement alone. It only showed up once the access-control policy was
enabled, which happened to land close to when [1] was posted upstream.
That's why this series followed so soon after.

>> Add qcom,vmid = <QCOM_SCM_VMID_NAV> to the bam_dmux_dma controller
>> node so bam_dma SCM-assigns each channel descriptor FIFO at
>> allocation. BAM-DMUX itself is a singleton and no longer needs a DT
>> property for its destination VMID: the driver now selects
>> QCOM_SCM_VMID_NAV internally via the qcom,shikra-bam-dmux compatible's
>> match data.
>>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>> This depends on three separate series:
>>
>> - "arm64: dts: qcom: shikra: Add BAM-DMUX support" [1], which adds
>>    the bam_dmux and bam_dmux_dma nodes this series modifies.
>> - "arm64: dts: qcom: Extend Shikra device tree with CDSP, LPAICP,
>>    MPSS remoteproc PAS and peripherals" [2], which is still under
>>    review and adds the "remoteproc_mpss" node that [1] attaches
>>    bam_dmux to.
>> - "dt-bindings: dma: qcom,bam-dma: Add optional qcom,vmid property" [3]
>>    and "dt-bindings: net: qcom,bam-dmux: Add qcom,shikra-bam-dmux
>>    compatible" [4], which introduce the qcom,shikra-bam-dma and
>>    qcom,shikra-bam-dmux compatibles this series relies on for the
>>    qcom,vmid property to validate under dt-schema.
>>
>> [1] https://lore.kernel.org/all/20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com/
> Changes was requested on July 11th
>
>> [2] https://lore.kernel.org/all/20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com/
> Changes was requested on July 13th
>
>> [3] https://lore.kernel.org/all/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com/
>> [4] https://lore.kernel.org/all/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com/
> Might be wrong on the timezones, but I think you had change requests in
> your inbox by the time you posted this series.
>
>
> What do you want me to do with this patch?

Understood the mistake. I should have waited for [1]'s dependencies to land, then folded this vmid
change into [1] itself.  I will do that and post these changes as [1]'s next revision.

Please drop this patch.

>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 246ea74d1fb1e293f0428d342301886dc52cb179..cb824da1757921edf0befe5480bf489ee1d8c727 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -5,6 +5,7 @@
>>   
>>   #include <dt-bindings/clock/qcom,rpmcc.h>
>>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>> +#include <dt-bindings/firmware/qcom,scm.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>   #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -1888,7 +1889,7 @@ glink-edge {
>>   			};
>>   
>>   			bam_dmux: bam-dmux {
>> -				compatible = "qcom,bam-dmux";
>> +				compatible = "qcom,shikra-bam-dmux", "qcom,bam-dmux";
>>   
>>   				interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>>   						      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
>> @@ -2030,7 +2031,7 @@ glink-edge {
>>   		};
>>   
>>   		bam_dmux_dma: dma-controller@6044000 {
>> -			compatible = "qcom,bam-v1.7.0";
>> +			compatible = "qcom,shikra-bam-dma", "qcom,bam-v1.7.0";
>>   			reg = <0x0 0x06044000 0x0 0x19000>;
>>   			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>>   			#dma-cells = <1>;
>> @@ -2039,6 +2040,7 @@ bam_dmux_dma: dma-controller@6044000 {
>>   			num-channels = <6>;
>>   			qcom,num-ees = <1>;
>>   			qcom,powered-remotely;
>> +			qcom,vmid = <QCOM_SCM_VMID_NAV>;
>>   		};
>>   
>>   		sram@c11e000 {
>>
>> ---
>> base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
>> change-id: 20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-1b4f793e035c
>> prerequisite-change-id: 20260525-shikra-dt-m1-082dec382e7f:v6
>> prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
>> prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
>> prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
>> prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
>> prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
>> prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
>> prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
>> prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
>> prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
>> prerequisite-patch-id: e13435365cba0b6ecfcea6d9e5ab72838fba23a7
>> prerequisite-patch-id: 90f78668eb969c16ed8c2485d75a60a183fc4b8e
>> prerequisite-change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662:v2
>> prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
>> prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
>> prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
>> prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
>> prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
>> prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
>> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
>> prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
>> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
>> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
>> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
>> prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
>> prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
>> prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
>> prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
>> prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
>> prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
>> prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
>> prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
>> prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
>> prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
>> prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd
>> prerequisite-patch-id: 65b485474126f4a2ab3f69a0b8e146b3b04c2c1a
>> prerequisite-change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e:v1
>> prerequisite-patch-id: b61d337d6c8fc4b20bff5a057b3f3335d89c57c3
>> prerequisite-patch-id: 91d3d344ec3e35ef7a3cec0a2ef90fefaf10a039
>> prerequisite-patch-id: 9e23abde2db60a3ad3a00d060bfb91f68c0aa798
>> prerequisite-patch-id: 4fa3350725e5b9d442247756d2b51d03f99b86bc
> So this patch has almost been tested upstream, only 38 patches delta?
>
> Regards,
> Bjorn

Understood. That's a lot of unlanded prerequisites to stack a patch on.
I'll be mindful next time.


Thanks,
Vishnu

>
>> Best regards,
>> -- 
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
