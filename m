Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194471;
	b=T2ZhbdjwcCfgze09YpE95r0n8mvAvkqg7LzqAbW4AvjUcES72Ifyut9k4j6vxTs+Y6pk
	 m2smdtz1ia+YK9RhFi0Y5S+q89AhOBKMOOirolMNM7olnJET1RBG1HpCsJWFTRVOPoZr+
	 j57oBEEz62ImFndOptOWemJATeMp/hixJRUYlLO1DPxqCpqqzFDpd+4FtE7NfSrkSr6DS
	 CETIAlaK0ZfIGAcfCsAJ5ozQWbgB/qQ5UjLN0Z+B/VOa3qTtYI3sp8sZemdUm3ROprVC4
	 FGmQ+FrdvnMEYLXKVexhON6pRHEw5rndEGE7mT4b9EnTJVaommcOLlqFNGfT9WxBIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
	b=mqsOdhogTC4QiqH+oRRalqrrrS9JBHraVeKULVg6g59us+yQ6e+XRE1B0vgH+zkikKPp
	 xVEpQrb4vBCRRj/D96+lu7uGi3rsTNZ7+dab80lpZzZzK6i/HBwIdma9YVFwrKGF8wh7g
	 1QLdFy0h+2kM3/GH3cJtSRllMM+I+WFtLI3h2CnZha6P9ZVA9JbAMn5LirqQ7b5Tf/EiX
	 c0KmeDex2Omc2zSm44d5JvlYZWrQxQikxZmBq1D9WBXP1jc5LoBljR0sa+N9s82X0VZ7T
	 ChMgxDCuJ4OxHGFL6HfmyU7LHkbPHrwJ6eKNG/w9azoHYFuXoMDt14IgRejQD4+Xe+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB+KMeac;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlDkrIVm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823E606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D823E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB+KMeac;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlDkrIVm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6Te137919
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=; b=DB+KMeacyINPVIWQ
	kT5NZdhoct3aIrjpDIznNJexwKqKNxa6q5TIvVYdUTStLB+2vG2KzJvoUjhPaTac
	90zVOeCfKAl+TTdjVPs9BhrD0l+GksHOv6Whwh04f4JrsSH7dElj4dy0wLUCPJ/I
	CLxoWmvNFazPX3JVe6ksWPnrXzs0NwaB1vNv3uhQkz2lTiFwBMAvGPqKe/Y04YnT
	U75G92ssmXv1m75abb/p6gIpLVrunrIDxIi9P1pTzpYr8/VU+VaQeFPMRNF3HkpP
	t2McDg+SPQw3fD3EpzHpurjk0YBYnDPStWUcgSJZxfp+AC4PgobPOIttSpKWG+tn
	TJef9w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92nae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabddbb650so38093e0c.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194469; x=1793799269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
        b=OlDkrIVm2S8cGNksjIHFd1sHDUZgsvgAwaXD3lw1KmyQMPWpE49FFZAbxmrediRnnL
         gNcnzke6dTJDFZEbnbxUVxiWDmpJytI9ya0LR8sU6H7t7UpQWxvuVRSICRQ0/Z+hED2S
         g75GZ7Ax1QBJ3+qURK5aome6HU8az9mIb7AWuDujFmOzkArFt7ALjIcUkdxmMmLGlZu2
         nvJBIFIsqvuvbf80ieSzT9cQue7SVQhnGdHnKKKWlJNYRWTGK530+wtlhWaBKHnRSyMy
         eQflYUknpZj4hGcqXFJroZGyyijKQBNob+oaXaV8d7AJP4mueCD/hRgw3W2swre++VGi
         kCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194469; x=1793799269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
        b=CO0gTsYXjZW5uPdtwoWcoXl2tTlc8zWyCzZUvtmNx1vqttDxiHHPRUfXgtOjxNZGlI
         evdtjAlvw6M/D/SWP7m6dRA4M2cC4TGBeaOp76i5rp0s4rfzDI4y2LGFYFZNgEL239Ks
         HU2fiWzUFvRy4KxndZJvzqg/grxlNphjOUNLC5/ZZHKr94pbzcvAmlAc8pystgy62d0z
         vcyWMTw3+dUtohqUascGGF/mRwF945O+e5kgNJ9mjKR8VgeqF+RWo0L7ZE2Yrw6Uqqjt
         WaI/WEskzsv039GUR8n7efSnZK3l9fryE7u1nCp3VtqiC5MoWD9Gbjy3FOk0bN6JCRMe
         eGLA==
X-Forwarded-Encrypted: i=1; AKwUvByPqsLODQqik2U6U8hjkXZY03vU0qdR5Cc/XOqpIKpqwT3KRSZlnIn4Jx8VChHrdnlURYam3pNdLTzr@vger.kernel.org
X-Gm-Message-State: AFq9FYLiTA8xAernGu5zjblZ0MihW3hnKWXVVoY0rBfqm2ywUi7xPyjS
	114WeipkfclXuI3T9771G4qbDQ7JiWcwbfpA+uYpwFJdQXybxzLcChd3u2jal5+XyJXZP9ZFFPj
	vZvm0N7I0cINB7QCMc4km54wcJYzCwcZM84jMZuv7tpEa1iKHoafJTuUbpa71huq6
X-Gm-Gg: AYBFou1jGe7VBvMKrogrrbTstxnX7cYcolhIzdmSw1GUZJ8wfLLFOD2jxln/Ua2X6Sh
	pvW7FszSTZ/HP+wsc2RTDr34a63383rsb25Gs1yfJ4vDYwJyh9DPRG6QP+2KD0FgLABASKaBG7z
	hQ+NJnha0U0UimgpinslFbDu6SP1S8Og8CY4x9kDb0/blu4IphAbAlI+lcftTbdFTITDo7IKcHL
	v5gVfxkf/9AZTYFptrASUgAjU5bkv/sdRG1Em1frfXMbuhSUE00PNfYDf90NwrGzQE5skECrGUg
	GcJ1zoVfhVYQ4BovxgNAQPZKCIcGVV/1Dkzdp6NT/zg9mkgsBlZr3hdC+4CeTAn5ueplniOO8hG
	7Xf066D5h0nsgYDzHXvqw+CeNVdPbPqn40CIU2SlpIFn2qa9PJwM79JxcsoqnNAiyEAejxSc=
X-Received: by 2002:a05:6122:650b:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec4cad8acdmr895017e0c.2.1793194468998;
        Wed, 28 Oct 2026 06:34:28 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec4cad8acdmr894993e0c.2.1793194468485;
        Wed, 28 Oct 2026 06:34:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a27a03sm31692331fa.29.2026.10.28.06.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:34:27 -0700 (PDT)
Message-ID: <f6727bfe-6e56-4545-b56b-b3cfc181a722@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:34:24 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1f9e6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iauIxC-Z2Ob4T7-dqesA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX5egB1mSyH04+
 12YTEV3kw+iohk9Qrtlu+ZVfVylbnBHCAuev2DhNvNVO1coDrmfQrFb/4A/UVircjktv/sfY6N8
 ph4VX1EUjC2tVmWRWs66HRWXn2wHOrE=
X-Proofpoint-GUID: EahFQgo_J772NydiwRV8Tn3Cf3E9gnaa
X-Proofpoint-ORIG-GUID: EahFQgo_J772NydiwRV8Tn3Cf3E9gnaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX+6LL/+pFWQW4
 pHH1guJ9UorDKzLHpF1yVFq0kq8sP8XpzfFiqk8QvgkmtyvU+E8n4VrVMAXj5KlmuaWsUEaI66o
 pqli8Z+e/dfyVSGd33hf+h0dklV+vtGGE8k26xQrG+rtcPexw7tz2GC4GwEdDeS63EcjyVKiqgX
 ZvNAhcjQ3BWZH1Iark3BHJOEaPQYQSuIXgFHYD5cPgX35arVtlRkpnGa+uzTsiKjiAESWIbyybK
 L/XV1sUXtrEUjDapIiZxzh+zLPqrGpJDrMscHstReXwzqg0tU+o6AoCYW5s4OQZoEt8zjuJr0Jl
 z29gE5JSRVJ0PHyqF5U/pPU0ULzHdFiMnY9uls2wrO0Ab5iGxAKW3Axomi26D/MBhFiKB6B4vpa
 wj/CpbwUShNSZraYop2QDc7lzZFHsloGhHdBboFGi/g7zjYE5Y0dNXuPdIUUOXguOuFuK/Hl7X+
 T36vvJ/6YcAxEv7l7nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 10/21/26 6:56 AM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Make the audio PD remote heap no-map.
> - Link to v1: https://lore.kernel.org/r/20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
