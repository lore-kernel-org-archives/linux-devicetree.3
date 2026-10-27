Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084396;
	b=PKesHoALn4BFgLwftCsSd3Zi4s8WrIw4ABBtast36YHF5Tt0fmqMQjLMgHD9q+zkCF8c
	 JdjJOaufkLU1eFacNnGmka7z+TZsU1D+ZEwIh6tKn4EYaW/+fiCuLsXHq4PcoHCVP3LPJ
	 JyxcLackjlKyBWZFE3xF3quFfK2KhqOICj5ZJU5rfjJal3N6tj+D2WAwq08lGR4ztgiAU
	 feXvi/9onsKCnu1GB3gtl7BTzn4uJihmdKO4q7PdUJ25ECEzmNBvU8C9QW5cUDRuX66UI
	 4Sw+gaJrPFdA0IkfeIZNBD/l17Jm7dMQrg1MPsyrpgm1hOZ5rhlBrlZ5frrr/LeOdHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
	b=cwLKuE8dRsWQmQeZZ4k1/LUR02Cz3I7NqvwTUwzOhq7Ld0Ss1vtWPKFM1NZdzWb4R/Zi
	 pxBARoxyGPGLfyyWs6pbPqd2iF4odHQO8ti0Q/h+LqqrPBldWQBt61esTPgkIPdFkRgfD
	 d5eGVk8rznJaPn09TX0/FUGZ5arKbLBTgpQAziP37OMD+on72m82EDOOj83WyQ3ZN/VLu
	 HQBPNY5n4OEgYi4swU8nPbYiriHrtsCInU87enB8eqk5YLlcFAG8oU+OQXXdDlk6ksw87
	 RQQwzw6t1HdIEzrylfswhtYDbLVyDsXUXKAAlxuBra0uoSkvWELmkt7WyfP4QX/SPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAVRLh4P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4FzZZbs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B431606A32D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B431606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAVRLh4P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4FzZZbs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZPff1851020
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=; b=DAVRLh4PXOFgsY5n
	NOwS1p564NkTFUyqLClL/gsUJR9wNX5qnJvEAmMt/meuWDxin3W026bwuMSDlGhi
	DEYsNqPGlP4l+RtFRwlBt0s6Qa1zjvo6TOkLIZoI9chXqrOg0breRflgS8vHRRbX
	IhssrvHg+ZcjAVcWw6fMnB+zThniQpDauTyBiYFCqg+PHGVjZV2m/B8OXFtwaeP1
	i/dhAWkpoOaJ5YGykdTdAOWwY9onmx5ByNRJapV/HCIRBRKDonJkyHf7fasLii8s
	4I7CHxuXfMPvQak69CmPD57UZpxpu0ldWgHGkvX4pa7Ki/xAQaH+mjDxp85hGiMT
	9UtFXg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf46r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:59:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so5495808a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793084389; x=1793689189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
        b=a4FzZZbse2fbYo2HO+BOk2KVJIdehLeh5UPnmbx+/WyQxqXOJny0RNOup3jIQKEqGr
         YV6OULdNCVz76M0XAD8WJtNAodcfA8FhmY50nyt1IbJvwXEZX8I6ZvpMSa09JOJmME3I
         PvNCYTVBxfpUQRRmcR0UUiNyu8/lN8egY7Teoa3WbiiVRUPNGdtfOBjoLHiIv/G3B83B
         8w9vvZMABVFRE+P1vTOAr3kgoFQb3w0r275RPVXc0223NIhAMh807wo0N9Pgjf62mYXD
         5eummGTkmUuWaVLrCuj4nU2d8kUa6HAHBTpF7lOYg3PYzbBXhdebCnogRkFMAl7mvDiQ
         V9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084389; x=1793689189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
        b=1EEDKCSAh8Pz+w9q8fk7gvmHLdNV44x1k4HpZngHWnyz8kFYqGFvMapzDwEi7+Un+U
         gb6eiOqd5K8xeDnxA+gQwc/fAiEqLu4THri7zG6Gr+yNAyPE0X2NOEXUyPF1VYTycq6Q
         fm40g9j2XGfkyffRdJDOFbjKOkf8go1x74gRaIk9N/aGVUxLKcdGTXXMIfjAWEZK6wB0
         khBjUOdJCOykRHKLdbH4ziuuNgwyI7yGh3sUsDPdNI3B23vT3HUY88Pa6yGMP7teRbor
         hpi3JM/cDh/XalVoszxsbXVA8k4p/u0Cr9DbEgMaKuqV4HdnPAUIZTsYJtFmdHt6fKev
         MMEw==
X-Forwarded-Encrypted: i=1; AKwUvBzDodOCASVdx96Cw8x82T5JeIdCxqHJv27Su7GsQcnqIxgv1g15/9iNAVDOq3uA9xXOHfdL8uMfEyVK@vger.kernel.org
X-Gm-Message-State: AFq9FYIUokhphDTR4DSjf1joRQFo/wlFJjvG8QmUX9Z3nBh5c+JttZT4
	1xzMRpAjv3cnpYa4xmzc2RRqysiJ17GmYu60wYYB0z/fTIe56JzUSCI90jiHuKBP5dKFmldau14
	aSv5NSnE9HUuzXcpo/RUqsj6d0t/ifHBBepSIKbAvVPq2Br/x5gstU0/gKITYzqJk
X-Gm-Gg: AYBFou3QCd7YAx1GcaBHUpXajOwB7b4himxFkl7BzQ3ghCKYoEwr16NIfJN/6HYkvSL
	KpxBaUjeI1NiRE7XxDs6dGYDAR3OEB9kDOlMG9is6CSlXxIOZ2erceiM4Yu6EIVoc2kCycoztXn
	kP1a9oVpS3ZPv83gO6IQjceZb4yQsPIU1iJ3olKXzaxuVUJi4mZs5ZK0CMsjbjeA8WOmfseLcHj
	8whmdYihs3ISddosEP88VLb3KSQpFQRhvsLqUZiCgrGMtLLxJAix2tuTctbzaAFBTVFvOj9c/qT
	HgeYFaQPD6jPVKY0gmRh+tpkkkjBRjxxlYjDLSYzFnIF9ZgNqzhEC/2hwo/3VGuBueeR8Bp2+Fc
	uSO76frOz90zXo4nq282vDr2VMUpj8kcefHA=
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr7647140a91.30.1793084389113;
        Mon, 26 Oct 2026 23:59:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr7647128a91.30.1793084388707;
        Mon, 26 Oct 2026 23:59:48 -0700 (PDT)
Received: from [10.218.35.238] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404730f1sm2350317a91.15.2026.10.26.23.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:59:48 -0700 (PDT)
Message-ID: <8ec30a0f-2c9d-4011-8e26-9ec51c68681d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:29:43 +0530
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
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-1-dcabe94f1074@oss.qualcomm.com>
 <20261020-accelerated-husky-of-whirlwind-ce022c@quoll>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <20261020-accelerated-husky-of-whirlwind-ce022c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNyBTYWx0ZWRfX4c3bXJJXs3NS
 59DRmGHP6IsdZr3rHYKyuefwlGxFqk9N3jkMXiYUxCm+UK+tjP2k99Bx1yttBV+qi37j1ApC8Aa
 jZPSB+iP+S+za0z9NpFVD5rO4Y1ODXc=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae04be6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Y71-Jxx4QiA4W6V5z98A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: F9EcA2NpkCidCQoTs8YsfcouK-bffdZo
X-Proofpoint-ORIG-GUID: F9EcA2NpkCidCQoTs8YsfcouK-bffdZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNyBTYWx0ZWRfX3BAYU2WN4Jwa
 HZAIrXMxWIOnZI2aj7rNWML5QaS35yLb08AjgW0KecDl0ATrEmdCZX2XfAY8nvsOntfKfvsPrpn
 UfpONfecMGWot2vLrYJMOPq1dZJNZAhPlHlaRc9hkqpKAzpbzmRH9hbyVxhbO3PmlihlF8/2e/G
 fUWpbE0a+lznJldWt2lIPM5ai/blNBgjMF/Gk4oVp+ktWAXl8NCXy3LAzGMmZtPHxpeWFan9RCE
 xeA6Bk9Stg/vuMsBG4t/dyTRl8a1GBiP35jzvjq+2aQPBdBwbsbnRPN2aDEjmzVskPA6GcKqxhk
 eZAvfs6B2PNJre/WeWNuCf2s/3FUZ5Gy3WMpxOMY70wwQdV3yanzhHqPB5/9967MGrLozEAT4Yv
 uUh2ZMCZMRJE4O0TWtcma9k4OR85C/hc8JPcup6894mNa5/9Fa/7LW1Pe+tMxsNL8A8lzXrRauh
 mpNKld8adaFwq7UiC1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270027

Hi Krzysztof Kozlowski,

On 10/20/2026 1:21 PM, Krzysztof Kozlowski wrote:
> On Mon, Oct 19, 2026 at 03:57:32PM +0530, Gopikishan Thawre wrote:
>> Add the qcom,lemans-draco-evk compatible string for the LeMans Draco EVK
>> board, which pairs the LeMans Draco EVK SoM with a common carrier board.
> 
> So here you explain any oddities, like why SoM has no dedicated
> compatible and why common carrier board means it is not common but
> SoM specific.
> 

Thanks for review and suggestions.
Agreed. The LeMans Draco SoM is the module itself, while the complete
SoM and Draco carrier board combination is the LeMans Draco EVK. I will 
update the commit message accordingly in v2.

Best Regards,
Gopikishan

