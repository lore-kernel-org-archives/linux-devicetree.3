Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206883;
	b=GCRfp8xmh04h27CRjFCEwVBuSDHYLOaJoO/3NvZriFeqxeYcj6nlg8f2oKONz3mTzvxQ
	 QLtMu2qGmZDXN/UVE4Klmyxf6EgpFnA26xoAIDo4JuvZ5wgM4h1NJyfx+yp7OMenG4f6Y
	 cR+OfimYNLpwmO8148iUW/5JCIWG4yJMnarltFPW1Bvlp5PWP3RZF8yNcmpSLY/RSoTFK
	 U8w1MMWvyc2NIE1WZPi4l/fcq58beQe+zkTlDXDaseVBJOxvXNSfsiKOlKIS7VUpk4Zsm
	 PTVO1+dio1HCrv0zfuPpsT2wkMICHYOv6RW3Ti0Ufwlmqf8i0MWrn69SgsmQcUO79Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
	b=RQJDDkeG5XmBAdB4/QgsCG5beBsOl1BvEh8ItBIwl0UtLLqcDdhvw0DasQCNSlyQQbWO
	 XXZkZ0+eq/5przaaZ9BJlONHTWtygxivM7YemEnAgveavADK0SFmU8mhA4mHwlM76BEJu
	 gixn7jDjEaENvjyrl+VsyUs4cKkGHbg22MVzv+RwVEgxf3/QhxOTK70k3Nzn0dR7GN9NP
	 S5pIdixHyw3gdouaanGvpxW4UlvTnGYU5DlaqNaNx0B0JQD0HknRJozTZNYSOVCJMCYgx
	 RzEYNEymVCC5K1Ma9dSMSvAbMoef3OLwnL5fV3pFLrhaNhnN0g2Zo2KOUl6SwQM4f5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzx7GOMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agKUjk6f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A350606A32E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A350606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzx7GOMm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agKUjk6f
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAl8d1517256
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=; b=Jzx7GOMmJNrKSDzA
	SZIMJVlTbepskOEAE+Hb7V9tnUdIkpaeibzz8kRu9nK/Ja0bsNO03bdB2n1rL+id
	CNAQSR9q8hfJAcfTbZ+pqoZirypDfFGYRwbn4qq6AoEZPPd+PX5sio6C7OPWkqyA
	YgPZEBeLYOA/GS3k2BuuoqC6BSqOwnmeOIrRpwXTQH3kGBTrF0XauvBjdC5fzHc3
	wE9FkXD6nsah7wag+mlQTghvc4L/b27AoP6AV2WPPXaVsGf/yS15B5fn3ewdcbmy
	rP/IJ5fnciCrt0w/AbStjPti4UpR6C2Bj4Wi2WxOplP/oWax2/3P3EmBjRGqmYGj
	Un3qbQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwaj5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:01:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd6969473a4so743726a12.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793206881; x=1793811681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
        b=agKUjk6f3Sy/lmN5tj3bgKBIs141dvlcU3EcvCKxtsgd8wlgDWdRhpaV10Tz04X+rX
         3oAWjlgDPitbhOOZlUI3PWJelbjdPvZijKSHHagAaV9renCJnyf49PuuEczfPoKYKDH+
         5rNbgrETQRNPXJg+MLqb7YF5AcLbSg/SEYWdjJsmcJCAq7ABFEPFd5lybAHueLTv+Uzp
         Rex3emZF0BmL2PZ5yOLo3PcH043lDxgDgxAbADAZF+2SjJw0QYHkBEVhTKaDfcgTByAM
         eqDXClpeRf/+L27ke9/V96FdsqbWljl58pTNdQ+igpLyi90SO5NqOCl120sT40PF9cSq
         8eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206881; x=1793811681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
        b=seQC1Uk/ZGSj7Q2S/SvRO/35+Yh01kI9GfyJZmPAWleEUtYsW/1SGX+iClpRk+IEB7
         WARZQpTSuDVXG5Vkq5cU/wAPPbBNG2PKV+pF2GK2UEVzCIs9/ZNSb6/l2v8Mwi9aD+TN
         ztG2igixMg+t0XBvmliD20fkqGtuA4adOuYDBtol1x6H1wdkLdvk7c0UVcKjOwARyyHz
         fJwSlKbx0NOvjgKcjBCZbWJp6U2RRM0hSJcEv7/IKfN9j91KuWzEs2Wgg28lH9oB5vdT
         P9c+zXcCN7Cw2cRtWy2m4mPlrqQOlet/U5jd2Yjz3HHAecmI8TkCDtw/6R1m9qy08ifH
         jWQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7ydev8su0JUiepxDm5xxn3sAJxWO5qqiTcY9Fy+bdNWJnBUDIhTJ5x/DY+i57s4Jqnwy1/kWJRS/J@vger.kernel.org
X-Gm-Message-State: AFq9FYKB57t2dHqPvWxh1Mb9Hix/9qBAAY0xzZuwMBzbwohfdHSjQPDW
	bBFV9HZgg7jm2v+SoDITj50k6BfIr85Z6fx7UK+5DiHZgmYSnWHgU2kzakBQ1GLrzB/m7tyUpw+
	0AmUvKe2eTF/gzHumcMGuSNQenYix08neVggzNliSIZ1pieXgxX6griLM+79DcFEi
X-Gm-Gg: AYBFou2e/d5HtzMVoYBSikEcMCMnZy4w7rb5/wIeQpVSLGVZWR0GHOhWtzOpx5Atvh5
	+HxFhKCRH3zg6rjR2PvudJ2sSLmHLXTpsurqjMo/St4nntE6tXCZEGd3L3KAgEGJTLvQMKVbVcf
	yxGcGKgDvAmCevGgxgHPsiqygG1f2Kaue9zQj3g7rZ61UEbmOUBBVQEE9k17+e8pBE07oK/s5SG
	L0tYJ+MBYhWn1vebyVHuK4CgG1ubjpmVXBcAnGiXyDQUtIiJIB9qahWzyqHeTIs03BO6eWGASYO
	DjrBFMBurJ7y0Ax7UBNZH/2gP540ScPhh4DlZRgsHIBEMo/MIcQKZdwwOQ06EJaYE4hHz16gedl
	kyf336AiB8zmqHPJmhY9B/3rK7X/98hU1S+axXMenXp1z40M6TtgAmZg0tivxm3QKTbZriHuiwq
	CKosUPhsDbT1Zf8ZepztdNMepU7cWzeoCh7IRZcgAq
X-Received: by 2002:a05:6a20:4327:b0:3e2:89c3:2fb0 with SMTP id adf61e73a8af0-3e902107ceamr2367980637.7.1793206881003;
        Wed, 28 Oct 2026 10:01:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3e2:89c3:2fb0 with SMTP id adf61e73a8af0-3e902107ceamr2367961637.7.1793206880510;
        Wed, 28 Oct 2026 10:01:20 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.241.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm1097859b3a.20.2026.10.28.10.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:01:19 -0700 (PDT)
Message-ID: <fdacbf99-6d6b-4eab-a914-ce629b7c738f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:31:14 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
 <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J0woCbjxbs-qRxGFzRG-Fxmi-H_Qxx60
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX/FbVQR7SMEyE
 dq85KZxb/CA7Lqytt6sM1yNw5uGTMFNhdgpHzq9pFRXF+4pFnSqhoosXEqeAtP+QsbUpXNyR4p2
 qWgs2PMU4EwHhjs+PEN/jD2bRNltO7s=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae22a61 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=VANyJ50yWUE6IziFVoGcxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tH_81DuvWQRpzCUb49oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: J0woCbjxbs-qRxGFzRG-Fxmi-H_Qxx60
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX2due6q3ebBjI
 wanZuwSCMrFzLiyvp/6BDLKfMXvA0vD9giLqafiZKP2OnLXw0xVS9ZkpD8wcuW3L4DEkoobYPX9
 xbyaQ2yKRb2RG7uUNRhN8g0K1XWfwHcNyITk9qOggyZtZW8i5kn2lb3R2lnIRGDEOJdhVPKqwCQ
 cVym4xMpvN+9l0dMGOqAiesEjZAKGp9jS36ozwx0rt0jbsUYMoIAm0dRdBVrSyOoJgZeuEwenPn
 YHXJPHCZhxTt0l90njrWPSZbdlElT/+rsE91UdbywjV4BFpii1SwITdO3nie5OhxZS0Y9VVOOOM
 3bDSb62jOeEQu5im1vMnTBxAK0MmQrCKXy2NBZriJs9n0vB7J4bPfq4Qln6KbuJ6JAx75l0zHzm
 f3+aCRMrYO7Sf3E63KUAZSRfa8P3YU/yhbqGy4xyGHX+Gfy2g6egsDvqTcinKENXfpG55tMdBPl
 DFX+XrstnYO8wR0H6YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067



On 10/22/2026 1:51 PM, Konrad Dybcio wrote:
> On 10/21/26 7:28 PM, Krishna Kurapati wrote:
>> Both USB controllers on Talos are DMA coherent. Add property indicating
>> the same.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:
> 
> - kodiak
> - lemans
> - monaco
> - qdu1000
> - sc7180
> - sc8180x
> - sc8280xp
> - sdm670
> - sdm845
> - sdx75
> - sm6350
> - sm8150
> - sm8250
> - sm8350
> - sm8450
> - talos (fixed by this patch)
> - qcom-sdx55
> - qcom-sdx65
> 
I am sure for the following:

sdx65
sdx75
lemans
sm8450
qdu1000
kodiak
sm8350

I can send a series for these patches if that is fine.
But the others I need to confirm.

Regards,
Krishna,
