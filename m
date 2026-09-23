Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341604519A5
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148896; cv=none; b=G3abpyUAB6PRgyFs05SCWNj86gK9RCAucmQw29CCLZEjZ7Pdv8gezJ2zKSrjP1ckQu9k4Ek9Wn0mYKzI+U8zk1oTx/POHCTR9kzNbAIr3tPYkB7WBkXGwxxaXcoKDnCdIm3jJO8x+oHyr1UIfolREQF4CIsykr5DnFywVOSBL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148896; c=relaxed/simple;
	bh=DHPnTomGvBdfQzAyHeXJiSgXT5Y6MYJ7Gp5GPnjGoqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpHCoJ1tMmvwJGhI+j1FzRcyILQMH6atkAZU68qaLRbP0TECIUfCeD1slio1PFBOGuE/RDLHgStqBihNlYYV7j+VDiauXnbeXYIoepDf9E+ZeKKyGDE93gTh65RQZmQpC52rJukKFSB1rlZfwR1/pRSEVoiIsvzKXpwKPtazxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuGroLs4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sb07en59; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuGroLs4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sb07en59"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79xTw1874575
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6TsNrtQp0RRb33NkVheFzMS2e0BGHevfdWgITB9L3o=; b=OuGroLs4fsknkszW
	lmc9L7UM5kw6JVtS8/Rj1ar7aaYyu9TbE7WVfUMDfQSrs1/ZOw1z3/o7V7JlLAKf
	Fx7ZMGM4UX5lMiq7Uif0W8qI/nlpTS08YRKaSK8XHpeTjUKUVUXcJ47HpUs23oTv
	GU3FBXqpzRKfQ9nEznuiOFrWEQN6Qi/b9ZkPgf9LLv9a7UAI2Zf0Q4hzPtjGa3op
	jXM8zAcIgwRxWNIXKpN3+foErkkYBHo7dxZ8X2rNg3KNplD1HsapFus3Z8B3ZgvQ
	9GWZdqu7ROicdhEKthe3BgqbNRCP7zrCA+30/lc3smadx0iDcGuNFn++V3vaxutX
	gOE2QA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c2tse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:34:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f8e7ff71so19906285a.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790148893; x=1790753693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6TsNrtQp0RRb33NkVheFzMS2e0BGHevfdWgITB9L3o=;
        b=Sb07en59GDLuaqEQj21snzYQv5m3KSykkILJzG0Jbf2ThJLwF9tkEu3mbrnBaLPNlW
         MXJzlBs60LAzaLPmu+FDxv7NbBKCvUjnR8Djy8pMhXoz+Ac6++ptgb+HYMsFMsEA5lL/
         GbR09EF1O8fs+xNcbKvt/HAWxs7+tAKX5r8lJxBwGRuOURlg8hB2KVUQ7GjeVqGp89Zr
         39xs0twbykeUNpk6GpWAzf2MwzYJ22DoZMxDjNFJFvnggA+oaiIq8urbMtJDM0STViGY
         26QC3cRu8vX6H/c6U8kncTzgyeO7q8LiRYJcbiBOVI6ghEUI5oQUod8xkXxjFtZI61Uw
         CSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148893; x=1790753693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6TsNrtQp0RRb33NkVheFzMS2e0BGHevfdWgITB9L3o=;
        b=AThZMbZqCgIITSlGJ2go6z+LunA4nwcevRT61fM0SzRdwO11n9Iwte9ggYkTdCUK5U
         0NwL8Tp8y0EuZRz/xMpFLAGdMLHIKX+Xx3BB9gH13+6J9ZY5OztYckMXjl0Ytye2aBdJ
         wZ754Umu91XYhP5JhpmaSTrn4e2X7hlz4x6VLQgXjJrsMfki8ARsqUbdP1p14gdDWwCK
         KmhZ2KmOEM/1Nl7duUBpNmzI5lLXnYMvuOv00u+dNEe8thmVtWwREmYzVMvJqtg7DAkw
         7VYuq7p0hFk8qTxOMbweoTQr6JRiJEMn+qneoRkJuQexEYbQMNBWR+xX3BZOUMO/CYOA
         YwKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+SHbY+XjDMRxR78vD36gqnYowAOoOvZ079Q35w8YIfmeD5Gd8xGFfYnA3PMd72jhVq16zX9CIwIN7@vger.kernel.org
X-Gm-Message-State: AFuF++l7L6XnGVYXn8HCEp+zQvoZIGEoJ4AISyv5YzGRFEHrLGCbLldK
	PoEek9jpm/0V5jOBS2iOD6rIOUU78DXmX/X2Tib/883sk8YedBHpXDhvtZWYA8jhEqHZImjDPWn
	hJoA2uBAPViNTkapMAqC56T1gnG6ZHNBSHdYVqyjGiF+VdAPB4rZ1qxary2eNcanN
X-Gm-Gg: AYBFou003aZEN3MNzyi5qywBat8nBS7fIIYudvZUydb163G8wzhOtG7+DdsM52C65fE
	SpFM4HLqrPTQ0JrIgkMmMNQjeI0+fbj9ZDN0kGDOBwgjPVhB13cNlXbs3obrVyMWyxIYE2IpLaS
	WiOM4lb3CvSrgDLQ4QNlkvhg4ednfHa7Jmzku2JchiiQ5cS4X94RXkraXBWwUPzxquxoMKlNUqk
	TqdN3AK9RBFycRJd1RE94zYxNK7Ep8kMCBaP797gtut3z6y8z7U1MTJEUcA3y/WuBWvRqL2mbrq
	QlSjCJqk2OqzLFa1iV7mlBF1MUMCZ46syM1z+Nk3gHz/ZkXSsLzC9VKE5zo+ceJSo7V3D7XgTYU
	9dqwsj0IQIJN6qS69WuvzF+zAmJnlAGzs
X-Received: by 2002:a05:620a:1a16:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c2525e934mr301687385a.5.1790148892903;
        Wed, 23 Sep 2026 00:34:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1a16:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c2525e934mr301685385a.5.1790148892561;
        Wed, 23 Sep 2026 00:34:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c6csm60665966b.16.2026.09.23.00.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:34:51 -0700 (PDT)
Message-ID: <49c27654-e573-4026-815f-a49838389a07@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:34:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
 <20260923-hawi-socinfo-v1-1-f0d1aaee9323@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-1-f0d1aaee9323@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BiHFuqfd5rugGF9C3Kt6BlZUbtGF_NmF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMCBTYWx0ZWRfX64Jv4CH1jid5
 O3OO7aU19soWvk5zgjJeX+UscKi7PZ5CXS2wslL+LwyNb40I2GtVCnixEKz5EudaaspT3NiSv/f
 Y1vx7LUSCvaVLM0/h16lB4dbauBOhYg=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3811d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ni0NwuYlWlgHZDj13WsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BiHFuqfd5rugGF9C3Kt6BlZUbtGF_NmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMCBTYWx0ZWRfXw/KOgfxU1drL
 5m5x7aA7F26evlKTyrQq81ST4gib4PzTdskAYK8q5S3S42ttvTpAkDAbnwxUj+U3Id6X/lsYPrl
 QYygCtltuJR9Dx8o+3zd31orMFP4ic33jgxrUbwkbJ9L/Twgw9DbJ651DqNuMRnDIdv8yaBjBM1
 U2zKIvjD8sNau/FW92qEJMGQc96iSkfBDDKeZUzkwA3a6WBeQtqhPOJkqBEqPafW2bj0OE0Pq+s
 nMLg2t7dZAAWUxNZpSxsW9Xpupa7888/sjBwvx+5+g5fXDvg1DioxCEDAjcuamBBhgp726rGTDi
 YhMhoYvQnTup3UBtEII0zj55JaVuVFfOzLRqG9CmqmRFzh+b5ODgv8BMFPBoTWRXQ833kfPgQdP
 7EeVxjVjeejoeLl+eZiAK2ueM5HpX5/khx4OECDxVgGWgTUig6eAbZz3DzxKNOow+lQSzt7STB0
 3iaJI3c3r0ow1bPOp0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230030

On 9/22/26 11:07 PM, Mukesh Ojha wrote:
> Add the ID for the Qualcomm SM8975 SoC which represents the Hawi
> platform.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
