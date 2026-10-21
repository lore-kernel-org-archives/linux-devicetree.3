Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559792;
	b=vRslnEE47ZzIuRXm58vXL1QjBIkSdyF2KBYfcRpGDb9POSGviBuSP9P+iBH1bhLNRRLT
	 Is0FFQSxjLGe/sMDdwauxFGJouevUk25hcikHXDbURXHrctAhVdWCkToGw9pHYP/jmoRx
	 xW/K8B+EZWYkP8oN8HtP11dJocanduQodjD2xKmeg1q3y8rWPSeVIaLjQjdqGUmjWhi6e
	 h06X2UgjlSzbYx1K6n6jrZxqObErR/4rU3+8G9nY/RQX8cA1U+6QN4wJPc1OV1Ar5XHAo
	 yxdK+N5a0xfJ0C5ndLwEnKD/2f+vd0FrU4xkh4pmwlgN72egXTJs8SPUmTBVdwjGuOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6W4o9HuSepi4pcL7QzYNL0bR+2k92NeA3WUop+0PiPo=;
	b=xfpg3urbHBqHiP3cexQv19iueLw/iylVS2sFhlg8RCFrNJixbXS+yVfHHg+Qc9E/8xNb
	 mayQNRxtzLD57lc12ekoKyfTaXPFxnf+iQAOuD2l8zzGb8FbVsVw4rgexaUawX7I9AS0p
	 MaFe3mzEsUwO5b7DZHdbkPuU9m1Z/xjq+YQ0H32boB6JvXQTz4m1n19/Oh2KguaXYQ8Xt
	 0LAg6N4lx/TJm3tS0cHGQMgNPI3/IO1oYKn7G6pWqB42E1WOTnTSfARESsqWe4m2flJv6
	 zlSKLJmlii148QJuixwuTwY+4qE8A9vHpzJ9PuZdgQu2GrBTFhIrDfJkMdxAprlAL3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KzFED4FB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2VEB4VX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E9A606A329
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E9A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KzFED4FB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2VEB4VX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FUpw1957080
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6W4o9HuSepi4pcL7QzYNL0bR+2k92NeA3WUop+0PiPo=; b=KzFED4FBWqzC9eUB
	slfpGCkF2yMDCZ1e1ZfWOu3aCSEDiUHdZH2czBMVND7RwgGkaKe3AhlfTkl1gSRJ
	bvwAzfcebKGiiq/2TdHzWUnEKa/VNyRmoeSzB92kJAEilQMIrX2s3mEkPrRfV7Xl
	l3KhDaBSjAU6TV6bBpN7xnlmRGwb+qf4lky9o4QVq58BCBMrmeq2xbCNxzntsfCX
	1Yicju56zYc78zLKDagoQkmqm8tLl9YbYjlZaJ5j+KLKZjWwq46mhEaQs72dkQCf
	i2rb6Jy7E+C4fiBhPhOo6CngIDOT2pJoPhnjwwlkUsjUKfU90DsiBZQp/DVemREH
	731NSA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbj7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:16:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-366c279b454so671704eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792559790; x=1793164590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6W4o9HuSepi4pcL7QzYNL0bR+2k92NeA3WUop+0PiPo=;
        b=W2VEB4VX+ytI95AIqy2JeRnjmuouTuVuQenmNvLZ7z8Go1yWgvd7iHgnis3k/j4DBU
         3gynEyOmxTbdWS+NcqmTycngF17gwmmGVbDBxsoLr5I5D6szXJhJS7hWvNrN06miqO52
         9WZRmI1PRUgkNGvtJvlVxlFJGK0GDlDK/E1oHAajW84QL47viPWif0u3EfKFf+VLPah8
         4pDAk93NJTfXHZaJGXxqUdwAFzrJRoLHwWr+e4rzcyf/ieIo+vwmULH4TOw+06Dc5j8s
         e1DMEVViq5UkitR7xo4lio1ypgGzFMl+q12hwusJWhcU13wSNKdiioXtXO0VRmldVPkw
         O/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792559790; x=1793164590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6W4o9HuSepi4pcL7QzYNL0bR+2k92NeA3WUop+0PiPo=;
        b=GR1Iwlln4T9WpYUK0+0oDvKRDuzFW+g3x4FZVd+cRaVEYUWUgh6+AmUH8xun5iurrQ
         e/riVwf9DLKlNeWVOrnWMSiyx9vkCm7nA0/fWXkqGn0VSamJ6UyC/buSBHh9B3zvrG4O
         rOJF6VDWWcm9/ywylnhiliHnVLNtZMq8+nVp1QiQ/D+TJFyeCtKxsHqxzsJJUdMVaEkJ
         8f/4FlE3brLgeu+dxNnMy6hJIlu3fuyrevWUt5Zi19zclen3RpHFv/Mcu63sZ29SLYAh
         nBnyZand0hlxuiEWH1g+3fOak2pkW9xYE0mfOrPhimLvCnIq5F3r4KQE0llKfJfcINl9
         y3Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzFuSf+lyjnBZHfT7C7+OxkB3fe7a+aPhIe/oW7msZrkqHEkq+ijHjwfRYt/3Y1JqNGazowK0P0G4uL@vger.kernel.org
X-Gm-Message-State: AFq9FYLNEKvIU+FRpexs6PKw67mBMUrNgvYhzix4SH73ulu36W8eWoCG
	PSMg7Mi3vgxql0iIJ6/XiVJ6Qv5nbxeV/teAV6ENF2ilNfqdrG6OtphpLCjbt+hs7YQjpmMiY5d
	GG3cb8p/ze0pQSBGwI2jcRkWhwdt8xKMXwkcFuDniMf9pkTDJXp8rC/QzDO/iFR0R
X-Gm-Gg: AYBFou0/BqheM/qjGQbyBsm/gtyzbOZcp4FMaYqvXKMEz5IMn3GbbII0f+JMiR5LPgp
	Y+4FRT+y1RErSomq6oj2bx7epWPI4h0uoAffbr2pvYHGdXlMV9kkEjyDVTD20ujzDd94d5s+Z41
	fBeEocmHxE7rCm6CATEXdZdakJz0bbXN0Z4TTfsU8aQfB2v/ptdcbHCBO0hmnESRB/iXA+yhIia
	hoKMwlvXQ/gHHUDUgNW188P5uPeHQ3ytYdpIdL1Ikp5Ks2/TZqAExerKEXtiKYYjLlvtEQWcbEB
	XJg0S7Zf6gESnqgiCLuBr0LBwzWqLB5yPuH/I1QLlwxqnw6mu6myOzQLicj1bNpqUVIP8rHZUPH
	J2eQjtZguB9bswf6Ca5SBVp/g2s3nlRMR
X-Received: by 2002:a05:701b:420c:20b0:17d:7b45:f91f with SMTP id a92af1059eb24-19140a1dcdbmr457457c88.32.1792559790203;
        Tue, 20 Oct 2026 22:16:30 -0700 (PDT)
X-Received: by 2002:a05:701b:420c:20b0:17d:7b45:f91f with SMTP id a92af1059eb24-19140a1dcdbmr457398c88.32.1792559789442;
        Tue, 20 Oct 2026 22:16:29 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm4812622c88.12.2026.10.20.22.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:16:28 -0700 (PDT)
Message-ID: <6890be00-889f-4dc8-b532-bbbc1f55c844@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:46:23 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
 <40657da7-b823-403b-a5d1-ae384db7f3a8@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <40657da7-b823-403b-a5d1-ae384db7f3a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMCBTYWx0ZWRfXzzCnUsYicB4H
 6I2EdnEgWPXKGUPU7pqG8toakQ5hM31vZqI0S03vNC/HSTkBCYSx3ic8c7zPRO9E5iZH7M5kmFE
 DDfZUVRsSZs9RKd4YVrkEmh+z0+ydi7dlIWRdJo5gYj2w7i/lSwWue3tseW6XcOnD+N59o9OHun
 vIfMhWWrW7eJ70rbbIQgQKFrsoc0JzECg9Rk0zH0YmaMuHhX/v6ZlNpJyXFobL4h+T6mVyrkSW7
 JlSyb+V51fumi8lDw/Lpwuj0byM1RlJXcxnVA9Y5xA+XOA+I/0LXoAE+MbJswPtFC0tck26ihIk
 aLyawch2fdMNNoQpDdDnQbABJmlQsC4T3P5538X93ocBnp0JiPvclTEDu4jDQsDCyImKpNQ0ToY
 mnDZiM6d/HCFh6pNVs/yOGn+Xx25Sa4Y0eKfcqJxP9UUsQjfp5EdiycBE0vMw+LemdiKAlErnoS
 WJAWlvyuJjOWEL5ftjg==
X-Proofpoint-ORIG-GUID: 4et5sBytD0EyMtizKZNzj7u4uH3oRF1Q
X-Proofpoint-GUID: 4et5sBytD0EyMtizKZNzj7u4uH3oRF1Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMCBTYWx0ZWRfXz4GnDFhdn53M
 bcqmvSCTWqsg0PYeuefTMCNAV6H4cF+YoQ3OvWAmv4edqI7CerH+K6yRJ7PjNpGOa1OnSfLVrvJ
 sqdD8s1B8eCjT/wqkGqWyzDltiVKhCg=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad84aaf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9kQE3MI3eT2Opoapha8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210020


On 15-10-2026 02:52 pm, Konrad Dybcio wrote:
> On 9/20/26 5:28 AM, Vishnu Santhosh wrote:
>> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
>> to provide modem data channels on Shikra.
>>
>> Reserve a 256 KiB restricted DMA pool and reference it from both the
>> BAM-DMUX and BAM DMA nodes. Set qcom,vmid to NAV so the BAM-DMUX driver
>> can grant the modem access to the complete pool before requesting the DMA
>> channels.
> [...]
>
>> +	smsm {
>> +		compatible = "qcom,smsm";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		mboxes = <0>, <&apcs_glb 13>;
> Why is there a "null" reference?

Each mboxes entry is the outgoing doorbell for the SMSM host with the
same index. Index 0 is the apps processor itself (apps@0), which has no
doorbell, so <0> keeps the modem doorbell at index 1. msm8916.dtsi uses
the same layout.

>
>> +		apps_smsm: apps@0 {
>> +			reg = <0>;
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +		modem_smsm: modem@1 {
>> +			reg = <1>;
>> +			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
> Please retain a newline between each subnode and between the last property
> and the first subnode

ok. I will fix in next revision.

>
>> +	};
>> +
>>   	soc: soc@0 {
>>   		compatible = "simple-bus";
>>   
>> @@ -1866,6 +1891,20 @@ glink-edge {
>>   				qcom,remote-pid = <1>;
>>   				label = "mpss";
>>   			};
>> +
>> +			bam_dmux: bam-dmux {
> Nodes should be sorted within their scope

ok. I will fix in next revision.

>
>> +				compatible = "qcom,bam-dmux";
>> +				interrupt-parent = <&modem_smsm>;
>> +				interrupts = <1 IRQ_TYPE_EDGE_BOTH>,
>> +					     <11 IRQ_TYPE_EDGE_BOTH>;
> interrupts-extended = <&foo bar baz>

ok. I will fix in next revision.

>> +				interrupt-names = "pc", "pc-ack";
>> +				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
>> +				qcom,smem-state-names = "pc", "pc-ack";
> 1 entry a line, please
>
> [...]

ok. I will fix in next revision.

>
>> base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
>> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
>> prerequisite-message-id: 20260908-shikra-pas-bam-dmux-binding-v4-1-6044889e7e3d@oss.qualcomm.com
>> prerequisite-patch-id: c3d19e8dbf9451f9f8155c86c21a4e6b5dc796d0
>> prerequisite-message-id: 20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com
>> prerequisite-patch-id: 30840b157a197cc896556c0152b26a00abba0010
>> prerequisite-message-id: 20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com
>> prerequisite-patch-id: a9c2ce26fabf293f94f384409991f8a9b3afaafa
>> prerequisite-patch-id: c4d2876bea87e825468eb3bd116bfdf5a203f7c1
> This list screams ""can't merge this patch"". Please either send changes
> in a series or hold off until the dependencies are met.
>
> Konrad

Understood.

Vishnu

