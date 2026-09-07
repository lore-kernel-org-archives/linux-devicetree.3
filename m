Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3E442380
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771471; cv=none; b=pt+w3aPblkQ+mG+zobl+LtDB+pwIxL7R0PQ9tZBOnFAVg61k3FYk9vri8ycZ6bzvVoIqBJRI7jPDvamxZuZIAcU8X+etUs30lCMxAlJDXdrUtLeNy/sbaGqQC0QCt9NaUPUN5NsBma3acHwPQDs7AabhhQZM+yINighIodlAI2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771471; c=relaxed/simple;
	bh=4aJo18FHRehxOaJ9Xrz/eMPUjHWI1EAd5TrqCQro/uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPoAgzakYM05nCrIvlpcbkhF7p8ekaEeBlm/9kycxB16kBa+mJnM4TtjDXUb1ADsH27IcSy6vqS+Kf/RR0Q5VmJ8JvrVXlUHyw6FxsbQHNoieouO/N1Gy7RR6ZCym2mKMJKOLax/yhPPnT2mQiMH1zwxH0ZFvpcGz4BWT8+KNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VodQwFKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ss15mC57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VodQwFKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ss15mC57"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777eZl3903344
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=; b=VodQwFKP0QTeSldL
	/q0gfonYuwP0mM5BVL0owLZY48r90M3/qnfaT/q4RQUm/a13DtEYF0PdSjPcT7It
	zz37vtV+WQ6HMYcECE1eIks/8Lje9LG+01UUFr87TPWg/HbwqesGR/u6P1puuWH0
	sMn11nWQoHBrhfZNSDJdV/tvl+taG60Ao3eWx5xodyCME73m0gdw+Qp82iE6WV8H
	0/szOMJTTgP9E3QNUWspU1OhmuQtJsdPoPcWOoxdt4EG/MUmrJ/amcNMokNuXT2H
	4soZcBsfXZ+K11BMSeRhl3bFLO/SYKTu+Qzj7dLvSJjyUIdZrFNgTpRbLlHEW7Pr
	XUYmEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany617h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:57:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso7276946d6.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771466; x=1789376266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=;
        b=Ss15mC57QqhGUF0wLGi88JFttcx9TpFfMkaiveoi6IrVtnuNTROp6IT6Xsv/uOdIaW
         pF8PO+ikKb2qSYtImJJj8BMWqVdV7m55e2+zvAiDpLYJ9qGM30/dlqZUOW2oOQQFY3EE
         dkFXCtErlznlPwEC5gumhocKjeuABvh37KJIO1Aun7JzRJOD4yGSdyI7aLC9TcRFTCRg
         4j2VbUTp978922kHV3sqc9gDQQY5NjJoUPX0VyiKck7rAxRXGMM5vl0C4heppKsofT+d
         zEVMK8gbMrXEq+K6VkARup8tZgjbSNHgYM0kucoe5YXy7rOo4WLdNzuumpkPfxuUBsb9
         ba9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771466; x=1789376266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=;
        b=nlIhHlJQpwIMQzPgAKwuQ8MCltZNpXw64BQKipaU36qHE7dPh01AezEPg6fFtDUqs9
         iwMNOk9BMoE1PJaxpzQIYwJw+nKav5g0cWzcQq6CTtMSoot5G83f0eYKQ23wpqncRR/4
         PwIQwn2tyAAMfkQLckenL83k6so7TRKa4YurpM1rnzaQhJHu4NoH+SOMsw/dAl1K2GTT
         SNMAonaPzAWkA9GI8f38YGGbwKfRDncnvy6HpFtJ67LRqg3BDlw8+WpRHl1a092ZRb2e
         hFZ5OZcMA2O+DArop02JS9MUXiv3U2Zv87LltqKTrsT6AFS0dEBAZkIYa5K/kWctEs4K
         jn8w==
X-Forwarded-Encrypted: i=1; AKwUvBxBdO3PTe5ZTQiDALiaUtYDCBKLSBj7H+lHRSxbOHe/vtg5LhsDPpZ4Mu2Vpaj2FO0GiUsyvfDxRfgb@vger.kernel.org
X-Gm-Message-State: AFuF++naFCTAIlqjh8QtebwGHc2RXs3HQKuU7vZUE9eBACR6k8++LLyn
	zChaDf37N9xVJ3+s5zWcWHlPypwv8pyH1TrHXLD0wLb4Alp657b7xA9//sLZ8K2QXV6v+ddb33n
	Mw6ff8k9wjVVnokGiynRcLdCaakzJU6OGwFYeUJuPZTfaO8u4dMzcLgt3h1jWfG2i
X-Gm-Gg: AYBFou3P+OvQf4d05U1+JKh5OpuXpId51e4NbT6iNB3kG2IDmUsekFox6hV19VcHohK
	2HaFjYUp7hQcoqIqr+VKa/NCCLe8qDMBYWbPDVwERpM66NHKIspm+jP/7fmlFOL/DpFQGpUG23b
	ZKchT+bm8FvQu9K2ThkGaq9M/iKgb9ohzGu0wtECTZUQLxc9kMsZMhX9RA+evFuUFialf+vz4Gx
	AtEYhrqNg3U6F4kj8tYv/mcW1nCKk2VcMTTIHj2KpuDdV1PooH+q2/7hYfst4Hz/fpEYfgXRPSA
	vSMBENzqnlnoX/u7ozBzxRR4jSNZ5MgsOzrK956SY0xQD9Sagu6XP98ivcsZWrf1/zIinGKTu5L
	0DDW3BI3XupBWCR3isqMjMg==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160799385a.2.1788771465888;
        Mon, 07 Sep 2026 01:57:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160797085a.2.1788771465425;
        Mon, 07 Sep 2026 01:57:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8ba1sm428317366b.22.2026.09.07.01.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:57:44 -0700 (PDT)
Message-ID: <a8149216-536a-44c1-a981-54ec169f07c6@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:57:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e7c8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-LXEPugmIqj59De_QcgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: r5o3d61S0u-1hs-Ms6p-UZFWzLLackS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX2HLRFfrR2Z6t
 y/xkpz221bwDetrXHn8NyHEriHLYFAWsL285J8Tlw79UoHyEOCKhqFniaW2ICdtxjnhfndgP9Gl
 PegMbPsA6UeqH/O3Md/8IjLMOBhXMj4sm4qhfHIKIJCWdkLgT+xoIBzsfLcxa2AfWKo5gNAP2N7
 5ct28V3Socqr17eRaKY18FfVkjVhoZN660jQTnietvlMzYJ0GK6I/1LyF6aXj0B72BlwRPqwZgZ
 yVwQe37VxRoWCxSbBLCHDu9ArAPpfElR1u347j5bnK+WUMarBrnmw791g1PztpORVi73bB6gvq7
 BTjwKoDKZ5+2NUo4+vX0UE+HsdaF/ubgsxy4mMofiI7KOC6dwH9snJj2SzRYpeUFWxk2CvdS6Pm
 CA+22l+IBl2aa0o6PShpQ39ZkRVblwEj7yFQN/3l/Sftx0Btg3yaR6sIw6Ney3XqQ8PskZxhQwp
 OmhKW+D7T6dx8hZMlQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX6kU3vkvknJ5l
 xetzDlLUecWihJ4OL8uevDqdpin+/R8laiXI1635laO5oR820rFyTHGNr/PDE3zeXqn9KpbV2VF
 +foNW/bhETwQQqTrw87jWewjYFE6sJU=
X-Proofpoint-GUID: r5o3d61S0u-1hs-Ms6p-UZFWzLLackS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070097

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> chassis, different silicon. Stubble and the DTB loader need distinct
> compatibles.
> 
> This series splits the board description into
> x1-lenovo-ideacentre-mini-01q8x10.dtsi and adds thin leaves. Each SKU
> keeps lenovo,ideacentre-mini-01q8x10 as fallback:
> 
>   lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1e80100
> 
>   lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1p42100
> 
> No qcom_scm change; the fallback is already on the allowlist.
> 
> The remaining patches fix the common DTSI for both boxes:
> 
> - Build the Hamoa EL2 DTB like the other Hamoa boards.
> - Second M.2 3V3 is PMC8380_3 GPIO5, not TLMM18. A 2 s startup delay
>   is required or pcie3 fails to probe. always-on is a hack until there
>   is a real M.2 power sequencer.
> - sound-name-prefix on the three DP ports. Enable lpass_vamacro: no
>   onboard mics, but it provides fsgen for tx_macro and rx_macro.
> - usb_mp port 1 is not populated (no PTN3222 @ 0x4f). USB-C is
>   usb_1_ss0; rear Type-A is usb_mp port 0 behind a Genesys hub.
> 
> The Genesys hub is left undescribed.
> 
> UCM [1] and AudioReach [2] topology for these devices are online, too.
> 
> Tested on:
> - IdeaCentre Mini 01Q8X10, Purwa (X1-26-100), 91B6

+Mostafa - is that the board you previously poked at?

Konrad
