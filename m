Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FE416848
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798073; cv=none; b=b8vf3F0gAlHa6/q9e1r94gnDRalZSAiFwuVNkh3Qy4QhEWJC/KTOL9pnR33EFveZDTxKUgElaUwUwpIjkmgnhg7iCB2G2IWsCENa64ruqOIdScdXyZkUtw1LvvQfcHUBIAHwFhIK/tN2Ax77AbOnTM82KDsP2WCiRYOQdlftWtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798073; c=relaxed/simple;
	bh=rx8AxAOChCv1a1eKaXFa3qJAaLTL/cK5UWcPpj36J7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2TBiWTfBoufuHcnW8eNPGC2P+XD3LxhreDV3cWdu0brHIHybPH9oP97j7LvK895aOXNi3tgi2QiJTCYJSkY82q4oa3qTIUlmXal1J8yk6ZShHdHYMxJo3rFFyljEHH2An2q5/OL/r6Q3tNmQWTDfvagn12b/tjgZiH3csmzxac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lxx7A6dZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xc5n+P7t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lxx7A6dZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xc5n+P7t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qf6q3642620
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=; b=Lxx7A6dZbpy/G+Ob
	s19182Khe73cKtgoJUQNeADtyrlbvKXmE0JHktRlCE/MkmDZZCDI8IvAQJBjjID/
	mEBI0ouAFiEXQJWpbaOdAWdPiXTEEL6vIqqEfFMfSVAmSWUz7E89G1czjcg2jDk3
	XjIHIEzbbU+T2SGvbqiwsoNkab/P/cZEZPc1g9CJHDsVlIayF/QDNowyuMAZ7twJ
	jePCEnrRvKEriaLYPMolUUnunEiWMSU5siODPVtJ+er1x67af3660Qo9gR9V8F2m
	HThWzdXfXtGobE8TGi9jiO6t0rfchxMOjuCdGvlkFdHfiN8W0M4lq7bWG2/NSyUG
	mb5Sqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh98x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:14:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so2043681cf.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784798068; x=1785402868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=;
        b=Xc5n+P7t4rnNHQR/ARqYiBy3vNn4dKiMu4a+UH8UOe0OkSW8jJH7FXfadctfLs+2rF
         oB6jq+FgfNlNyVNo/LiSABBTwKwKRW+BpfIQx54ujMkIw/5J+GaOtYdDWr/9I8Bl6vjV
         hVbhH2kYn4k7bOHwLfG1jrmMQSGpnYkyig/uIaIya+pw4SS8592pGp51oXb+ZlIM+C35
         g+cWDqaITKWpmGI5h1gCNyfPTLpH12ZmMFarN7TSjU504mY3+xTOEL3b8Mfywp/pnJmJ
         vPgAdQ2BJFltM4ziYQEJATfKZ/HBBXG1MLPFyD7l0A4vc+Z2Df8f1FQzqqMiHL6BfsKI
         r/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798068; x=1785402868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=;
        b=mGwCwuiWh+m136FTJF0MbxO+sSzkTcnhrzUw9UKRFE1SALz21YsOmJXrN5HMmPRbSY
         TBtLdvwlwC6ua6qCILiCHacK6cZ8FvTBQTB+hckzRWlwIsYk2Wq9zUhvPgVcGjKaQNwq
         5eB5l8YhkwBXHlA0fxmXDqevvEyW0fm3m27AEugnrdb67Nmz8xEWL8M27G+S/uSAag6A
         FEqfsRqBS7BFeK9b9gl0T28V0kllXiefFRcVEhKKEWFjQpDym7OWkJc5F9UMOrhcxEDI
         Pk0O4GerTOXxg5A34nHSAWdondAAkioRXJWhTy5Aqj/rnSYfZAWRrXqlqgTATckDJKNz
         RiFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZuZ1HUFjkkXF873z02ChqWX5VrzXJ2wQr0c/NOI7ME8YnPvam5mXT0qZziIeLSFQ96ONHfs4w/+xz@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsGhRAFJMHSqoNVognxNhuE1C8PUIcBcqwuZIxvsxo4vltVm0
	MgIbsduzTxWhmAfdObg+tD3WlapbpY4nNIqSzjeHgWkAmkDJZLbzq2mde0zGXbHnpvW2qZLOa6d
	dN8uz/pgQWQvhTggVYzNiYhSSt68W8PX70uU5fZ1TQbhqdZvLCTKfTdT/VHxx7Ivo
X-Gm-Gg: AR+sD13Fw8ORKWsNYJ7gPA1l0x23TsjZoxmNhqDQebOHnPHGvsfS3yBEyd9bAajpLqH
	z2L98XAWixZbYRTU+Qu/WQsrzsN+jaVUQc03WcC8TDu0YEunpm7vUUGMSrpKTgTUuYSo/iVNJ70
	d9EwCwE2iXTLnmE7g8O9UF0jwp1881XuSZ6+iCl5Yz2W7KkqFh82muBSGw0qEhyf93JCI4rtLGV
	wqeklq5gTzPHnsr2/wakdL+TZauTCZtGT3L/9TNNLoLSw6QFcK6SlvwMZ71UG0HxkmGJCH3goCO
	iKzk8ANtzXTNK+dCEu1PK6BHz0WwbzYW/14vKxZnTqhShV1Ok+E1IhBU+Ns7R/Pt1Sc8KzQkeKa
	q4Mo6nWOevUr3UC1zGskXFtul
X-Received: by 2002:ac8:5ad4:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-5283dd95172mr16143581cf.1.1784798067616;
        Thu, 23 Jul 2026 02:14:27 -0700 (PDT)
X-Received: by 2002:ac8:5ad4:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-5283dd95172mr16143371cf.1.1784798067197;
        Thu, 23 Jul 2026 02:14:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c58b8b992sm31670366b.31.2026.07.23.02.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:14:26 -0700 (PDT)
Message-ID: <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:14:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61db74 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gASrDC7fFa5pDp3QmhQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SsJpYBxqzMPbUfOLn4IzpDhdRPVkG7ai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MSBTYWx0ZWRfXycgURnxwFeOe
 PP1npwBfGutAi/LRnGyTvmn32iF6JWhPP+Wno5IrCen+norJbL1/yffDBpc+eb01OGh2/QutrmV
 KfNuwwfamPSWgQJyJ/m6LKQ2ENWZMX4cNjhxxduYTgtJEBND7IAqDTXhH2Z4RVkkLVsr6LKv4Lm
 5NyLCv3qxD1vb1Ly9KSLMiQMdSNtm3zj76lBv/sZPRGxJjC+NKSECx82+j7G4CYXRAjtYjBr9fB
 /toEfBgf0eg+4+ISRRyndSGbbZBoUXIsnYZ7AYgw82OYFruDwlaLC1KEMT5OgdP9zQmtynWCVAz
 fhBF4jb+TKtcYmKHvsce4j7TkFRq0Ie0vvEtn+X0uhtLcR4FLiid2F1E5FcRaDgtI4syCYNcxRA
 9VpgiEnJv87LVwzE07jpFYGVusWYJfZ5ue/awEa/nhs0Qow+RxlXdZq3SY6YLskUZqPB0KmOAgK
 5OPZoGoRlcpkph41xJA==
X-Proofpoint-GUID: SsJpYBxqzMPbUfOLn4IzpDhdRPVkG7ai
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MSBTYWx0ZWRfXzoejn36TDcnD
 YGddlEAJgni1109T1wOA+JY87zyQx5mp1QMEI+HWirwIHl6dWcM9wgPzQPUp6lQlsH9Xd3tLbw3
 u5Rt8jMvTZCzkrKEfG4P3fOCrIAYJLg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230091

On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
> driven by the wcd9378-sdca codec driver for headphone playback, headset
> mic capture and jack detection via the SimpleJack SDCA function type.
> 
> WCD9378 codec can be wired up in 2 different modes.
> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
> each of which has dedicated control and data lines.
> "compute mode" on compute platforms such as Glymur is enumerated as
> single standard MIPI SDCA class device.

Does this require a different hardware wiring, or is that just a
difference for the driver? If the latter, can we choose whichever
mode we want (i.e. use compute mode on the Fairphone or use mobile
mode on a laptop, depending on what the OS supports)?

Konrad
