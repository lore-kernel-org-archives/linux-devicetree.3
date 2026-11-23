Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419007;
	b=Pwi4AaI4xRvZWY84dMn9PvMqhGt6snKMfV9M6a/DoyB+M5t9s++WqI4o8faQkXwcBliy
	 YS2izyNqOblstjbqDEp2yB0y+W+TYGS/5eaxanfOOFjFhlsWmT560SmyKTmaj7ldwx3Zg
	 /2C1dssg14BOPx/mgMdPGrZ88FAMpXQTKg+0MvK1SDzaXsLuGAK3X3xXb3rN8FO9ay1A0
	 cJ4L3yh/vB/QTGxjPUC4HOQNlN4Jo+IG0o1N/pNHdbiLamT8+PtxzWd/17/dMsVWJode6
	 f+y1YAZPSP/pnv8h0orWbrY6/xCR+60YmihSAPAk58QOqbnbGqRlDxV5sIalVfsiIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=;
	b=qf59lqenjU7ucj0LDCbr+9BbHITW5mRPfYDxZQJTStIGlr4dgRGK/wGPHJJ4YHJAQ1Yv
	 3u1P938twmt59tbxVLe0qtjK02ckppKJzpd1RWUqL1P1AjWc+Po53EUEXdUSo2EsX/s/q
	 +iEDyllcvrRhs1E99RPwjJ65UXJkammmGQBndEduZy59zxgKithoAq659lWtlFqA1HNQf
	 AE3ORkAWnJzJ3ctFt+8agROZ6RLVR81Ymz6mrO95RM5RifC8rAhd4Mk04DoMIz7pKcjdc
	 H2S59Ys/l0alBk0Obu1ZsHNLR5vOtxFiig/I4w6AlGTrQCTSeA+T8KKHbHBrm1AfpdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a7h4/pJF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LT3vQOTs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875C606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1875C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a7h4/pJF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LT3vQOTs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Rmw2924436
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=; b=a7h4/pJF8LvXYqPV
	TQ4uTvPsUORRjlBKTJBmgio1fmW4wvH+wzCUlfEmt8m5p8ZY/3GcNpupyxrEeqiN
	6OnuMVymQy/SL+IkJcSQWDVbq3JW6kmTnPF6xCmF6oB/rU3h9z3az0BfqFI0nFWa
	XPDwm5NwDKIAmSJqaxjzq345aSN3EOwV4h6jWTCBcVkadqrjdGzV89XL5WyI7Bs5
	BYPCvMT1Vq8LlYvJOrpzzrZZpIxOmyiGIPHhZI61Xznsp7/JhNzaHK9oC/jq7Nm9
	ud4Bk6SpYJ2lI/3ay5ko/MNeTZRrMsCrWb1TKhxK2bbNF1pdd55/93PLNYrZT4fI
	AEb38w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsgfhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:30:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f040056fd0so16879865ad.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 23:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795419005; x=1796023805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=;
        b=LT3vQOTsXVne/0Knk7GBE+t4W2BMegIMwmZ+eceSyJpWTfEDFRxVjOensMrNTRfcFq
         t10t9AGquyjNpVt74Lot/hfKT6tz4QLYYxUPix7vkKwyvoQkdznlhbF1JkrDlj7V03Q1
         rZA1m38tSnWhYNSMj3EVge2ydGycoNdb8dshtRcMXMV1MTLVjyxRDkaruTd8jWNHbSCz
         R2CEllOxcGrcLNW4+0Z1zpbAAzi+ZtWDl2PW3vbHfMzvB3tpvjwR+HTv/4q/v6WypLxG
         QjbKYu6MxUBHGWVOy4tdagmvumM/AAsC6Z9ziBHh16bdzXClGuYu8gByaEHWtmv+i8MQ
         YO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419005; x=1796023805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=;
        b=nN9SwcbjVAGrC13uyv/oJV/PO4E16sYiI3L4X/KPKVgz4WVtXEjbeVGxF6STvCFPUu
         MTdcrG5pZy4pLo5aDfgwa0+eYQbVwLWxNVDmpjTVNMAbn+c3SS6zQy4+gaUT0qEmnXoT
         T2yrzCSide53+fw2OzSzkZKWWrV1DnzKN2bTw5n6Ufid/T+rkgddyqxmatdXO4S4rnld
         58UiREhb3WS8zWmdjP6mKm40Nm3T0t08KwVI/NdhAI9f+Fvl91jVKqBpNlx+YBhtzDUv
         GSR4Pw7pmH+BupEeaLc4FOPw6Y3h8NKwNuDnnYJK/ZrzXBg84PUYhJL44chhyWQVgWOx
         bOyw==
X-Forwarded-Encrypted: i=1; AL+hErEbKFZ+ZVXnKq9Wjmc5xip5fJSTsqJ2yE4ALJGosNyTQVLa0J2SvrAlKlfItZt428i+ZVI6yf442UeT@vger.kernel.org
X-Gm-Message-State: APuU4Z9S2Fs9Nd+cQAkAvq6HODeMEL1Dt6nVL47GT09cRUUUPmHX4hUI
	V84QZnlH/UQ3RYyXJQMyiXMqVnjVPWQ51Ws5pzJsRfudfip1N99Wh90lY0HwUoc6bzexdCTVsUW
	A8DSYb4jDt3S6lSYkWX+eLbtNSoV8SEGk+Kv3gy0+spRzSPLEPAZJky9EAf+0lREj
X-Gm-Gg: AZFdTZfCMY3AL39TLbVxRl34FWi/Sz2vcm58WZv9UnZ5pE7GF3O4vv2GTD3EkpdQNbt
	sY5IT6LiMAVybZMvOudyw3WgvTCjfQ07th/FdkJOb2hWAYTqM8JL0xl7WVahH/w7JLWnQfZeUdg
	R5+QEVA84HIuxNvezeWTKT3uhFCVRau3cV7eTpOz7IOSHl1MIztON2xFfertBPzh1mBvLb4j1S5
	m1rPPgHg+rGyZBvPkEGX0hR1vYqT88LWHC7GMX1vi/tS7gXLb1/WWy7Zgo0f9J/TQ7nwHts9nk8
	UgnSXDR34yLDwhwK08uaad8wH/vS0ZtpW8ySZVtivlWzCDoMWiWzVerPD4FVzBapbN1dkw8Gudi
	snVS4hCObF7BV4SMV5k7zKOBuuN7xQi5ijP2DMcWhDjXQvCLao7T7zah7ckU/DKFP76qt28v6Ps
	2dD4s=
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr25401895ad.36.1795419004558;
        Sun, 22 Nov 2026 23:30:04 -0800 (PST)
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr25401665ad.36.1795419004002;
        Sun, 22 Nov 2026 23:30:04 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ea6a8sm47354925ad.36.2026.11.22.23.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:30:03 -0800 (PST)
Message-ID: <01e967c7-3c0a-4262-b911-5987d6fb877e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:59:58 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03eb7d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=u-a0JlRQecB2z73C0TQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: C4QgSV05lWtdUXhwi6espdOiABtD6xBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX5r37hCHdpd8V
 Czp46Yx3AA7j1CLP0qs8KcQI+CBf0tTBZLXFaabI7UEsllJWixfIUQwH81iMtbvdHKf3zG47Itq
 zGjFCWuQSXpmX2ynTpGPTqu0N86+Jo+5E7yF2Yx3tNGp4MjtadvW1W7LQUYqR0UrQdj7J5GwqfT
 fUZ5JoB3DobUHTOxH2ykkmvuBq20uH9JuUW5QTGq7/1sUsmokEPHkRtduiDZbP570UaPLApOqCM
 1vm1ljuL6AynVe4gJoS4NzMIo45D4T6WRimYzKAt+ASaCF7d/vQx69vUvpBW2TYufpTnhzhDMDJ
 UZDR/PpXmB5JbpgPhG1KzNkkCmcEbe1q6sMyVqGPIpUJxmJcakaKXY7IFoYN8auSokLRtMJexwW
 WrlQ56Lb2lBgssJ73+FVH2XluspT9dY3OOKJHWIuxcG2aXEiza/dtVkAjigapAr46OdscM41N7B
 RQu6ZNkacLF4OMLkFwQ==
X-Proofpoint-GUID: C4QgSV05lWtdUXhwi6espdOiABtD6xBR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX4PFVe9nDO53X
 G5ULgKl/6FYpG4U5vUko89fAmF0G1MZCOZAW4q+mtKUjJvMgDBmnhxTojWdn9eCBtmhKD5oO1uc
 t99BtFy9QlCQ8Jr1GN8zkebaKKWFGf0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029

On 23-11-2026 11:13, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/maili.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
