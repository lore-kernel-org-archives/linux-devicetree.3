Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704772;
	b=5hJM/ImttnucdlVdhoSoGZMup3Z9yKmzz2z2B/LKtV0llJy9Vp6zY8ZXMEdqKP6IwmBG
	 47gnCw6Q3+h9G6/y8pWt9vuxI9oTx2JA4wKQbSbtsed6eB3KjVhMoMFMmpg4B3weAf65d
	 X44ghar+GNm6SrX0R2qfG6RYnfAjvpCtuPVBUFu4JXggtZZKMnLBq4vuxQmKJPLMekIQt
	 jWQOjtHHvCTMQ0zRb64s6NVD2WAcN4tJrUlG5DN/2pevnL2fqBZcizzU4goV6FPp023dB
	 mpOv+4R0ULOo21eUpwojNKCQ8E6koiE64bY5jVLGVJSqHaVUeEtS7FHrwvqhycqKW7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
	b=N4nTGGotGqqWY3Mfowd/w6thkB7/FqytSqOn3qmSQtW7KbuovthqhqanN+RD8Q2iyDV5
	 soxM/+6b5DZdS9UTa18n6hoRyeeNX+eKG1+qQOpCtU5VD+dApugJ5R7Jjm4a9cCq63jOU
	 U/9xqvaElF7Q0pyPwCIFRoqHSCi98OBzv8yPAyUf/NrKj7gRzIzlR5r1vWkcNwHyRUbfb
	 7qQ+kYMQiHj5Q+TsrWXD12lUtlEj84Ne9IFo14wueJbThi5APyCnliAl+K6/KrHnqv5lM
	 66KPqX69GskgtNn/rZkxcFT0bf0GRIqeOdFmnWyZioafzWT3TK8YEwA8k+EZ/cdF8+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JjbJMrJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6iM0LX+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228C606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C228C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JjbJMrJT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6iM0LX+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV6vU3863657
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=; b=JjbJMrJT5aeDGri8
	zG33fdZozbqBvxfkvfhHBByNX8MMIU3wGoacY49uLACB423vT4lSKXvy+w+XXtxB
	fDxbo0bHVlsuByp5tr/09jjso6SPoksizMONP6xMkkowQPfQNRTNQH/eAaOaxtis
	veycPeN3CyyG5uGnQ03k3rhSk0xM2BenEZB0KRVUwyYTP51ey/Iaerbz8dTodDUK
	aYxPf7758708J+/bXrhkyb7/Z9IC1xuGFh4BmK9YfM1MLHBUFaZ6OlCOCs3SALOn
	TS6DrRLU01/EPGVHj8m4d49xLDTcdV7Tg3Z7fgS9VEWzazrkLdr7YGY0sLiYlBXu
	bjIK8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhv48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945e8a244bfso79370285a.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704769; x=1796309569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
        b=F6iM0LX+/A1pLjMl/zTVtqNcxBkgRdcl6jqELl6Z5vP8pLOsRvk3X5zBEBABa2wizz
         Xlb17lGvvaIiHkGEbSpENUFPVkySyKKSxVHX9ERKj3tuUKXtk4ZncRKHjShv9ZaRMDBq
         crYNWnXAEv4qULtR6ya+eulufk3qfhnp4cqRyIwodKyyloMi8fxBGKVFisoHgT8CdpGQ
         aH7i+iJSUR1avbST6iBipQSzr8/h7Cec+V2AI3oa2oOoTDMR/8qM88U+VWnaRyg25Bz3
         p/jC07bph5lgkLM3bZXd5aV1A++8E8+9Ku5T/3QV7nY82rStIoeyym2DldFtngGLoAX8
         t/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704769; x=1796309569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
        b=bJVy2AhvGkrIzR0gmaSAuk8fLwq3tQQV2BUP+TEhWe5do1z7WcjuC93OtBSfJX0gwt
         L2Gki4vn34R2D4pMm7pJONqlC6Dhf5QvyRh1EGQCXrGiG8oxzlRccaEAtrMmLEdq+6cP
         WMqHaM3c0HMFubOxz4tFcPtxGdZYqti973cL4c0P/AcooNU830USvQD/61v7mx8Ocp4Q
         sT0z9/8WjwcqDCYcUDbpIoLcxoLokV+ysSbqn6RkUcg8QxINfEFZ9AI9NzdH9X6R5j0e
         iWdC+04IuYUGdMdZrNmq9rDoEdiydeFNDrkXDaOxTo/1bYL1H30nEvAVBbPqBF9zhKfX
         7oQw==
X-Forwarded-Encrypted: i=1; AL+hErH6jzNJSgbVdt+aoClHVwPoIdYqxJ5RB4srRPunxzDCx1kT+n1y/xF8RFTqpIx04rWNpjH1M9Z6qalb@vger.kernel.org
X-Gm-Message-State: APuU4Z/PxIqfm/1vtqlsRlmHU1x0ZPNhPlS+veyuyikrCeArn1HkJ68C
	3wVjtaUf0Cj1sr+2Dy6xyVGoUhTr445VKmW2Dzl7CIemJq4ckj/cKJpAh2qXRD153btDNfD3aIU
	hCPyMsTl5SGPZSWYG+xPUzBd+cD6rr4FHY+8+d6yEuwML0wtwivL7ZGMiwK0ymIRz
X-Gm-Gg: AZFdTZdG+lSrphw8P5v2nWbVAQqQ4QgaBl6dqz7sLMUTf9Op0hBsHMyU5nR5ugbdBOa
	yPntVxYHbwThGjWieq9jM/6KTepxWW+Jju7vu51AKYmHtf23I6vdvRPmg/vATrytMGh5Y+5FlXT
	woHkjWO+8IrebW3iYD+FUYLx9BipoYtuIck9PQVALAfcefNr7NFu4l2isAjcFPBqE9zAZOMYmgA
	3mcOvgee6AS626zEUo0A4kzoY0c+ltyc3+xYjWGQJ/EnZCGWmsBJ7lSdkx/BIioFSbXL26V5cOG
	qiQQNvLaCJEASFN6cQp+MyxHYDcYinC+Bx7rfmxlD7ToCyMvqVV9UuFKMoi1GMKIcLIEtiPHamr
	Kh4z3qc0BzxUuwCJk6CK5ee8+K+xkVxBcrTvaG+G8lEZldbxvsJOeDf3JrMh9rQdZ4aG4kzQ=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3715305285a.6.1795704769183;
        Thu, 26 Nov 2026 06:52:49 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3715302185a.6.1795704768733;
        Thu, 26 Nov 2026 06:52:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370faeeasm10019939a12.22.2026.11.26.06.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:48 -0800 (PST)
Message-ID: <8b7a834c-4e59-4f87-a83b-5d30aabf5269@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:44 +0100
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable
 PM8550VS-C
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-5-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-5-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXwIqt0zho7ljP
 Psm2nIRC5JGkmz7YvB8Vu3G+spRWjlLQWmR3u21e0S0pu/qbVwHBFiav11RQeJkuttnbs//AuOc
 zQK9lRaDIfjdxhxW1DUev8BxG2ryA8ycKvqAqmK5XTqUfAH3Ba5H8nzPDEWjTcfGzV2jvljvjrQ
 RcVP6t9cZrbTsTKZjVnmVGKQhBOiLQIYleUfPocswpAKkmj+EKl2mkG4+te9YQajwuC18RCkU7S
 82JpKSnvg7H1qDrWRm1ULpOWjWY1MqI2kmiHxeADuODn5OXAVM8qNUamSWEl97cYd7XZs6cbEnp
 tIBpDulSpI5/kFiaI+5Ekeff7bVcBBthKLZsxqWViOq39H9nCDCohS8cXCcqJWLmsAA5Jr5z8jp
 w0glXc7ImCAdhRvuonBHLc5q6eu851rsjSBt7WIwUaW4mKAQ7h12iu46vhgkO2rrj0RrxgDMTZR
 82ZL9oRVwjFvy/XgzLQ==
X-Proofpoint-GUID: XL7p8BOL06TcqnnfVU_tAyLhOJXIdFcZ
X-Proofpoint-ORIG-GUID: XL7p8BOL06TcqnnfVU_tAyLhOJXIdFcZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX3v4kPrAetw0t
 Om7UcX3G2W6CRZd6W9Xpzm6d8MG5gwc0SfYlka1aDIhKIMGnZEYd+0aOP7vXcCklHqmwEWD2DNX
 9pC+JfFOkVuOSUiCiWJmpGQqSWstgAE=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0847c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The board has a fourth PM8550VS, at SID 2. Enable it like the other
> three.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
