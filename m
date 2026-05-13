Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA760421885
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683226; cv=none; b=u6lYbiocJS8mQbYh4sa2yEGojFh/yH61JueRvy6RRrYYxsrZ46TVENz98bzup8A+O68VUjbpVYTEKfXevBRhdrH7jeelqAj765JvGKCE4uIXXdWfkE08Ofijc67dwPIuodkRCnQZxH2sZHhpwVQKql4lEkDyCLRELHGhRFUoX+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683226; c=relaxed/simple;
	bh=z04beeOBkjbo+NXNq8ILTisFhx8QXe/In8jN3CAH4FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdCc4rY9s8ja6CGQ4FEVgFhkOa7r0I/7acoITVVnGUOePeVt4aDbLiCRCvyZly1etN4bioS7viBqAyU+nMxyvliqqgfqw5FX5yqoQBOxzek/RGYiG5rXvUdAmoU3PJ9hgZi3Dc7Fp0fDh8zAcpu7zTLRlP3oO3KJ2s87QDCX0I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5Zq0Lpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJww5eYu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5Zq0Lpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJww5eYu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mBxQ3474744
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LBKKTtR6QoH/FPl/5VoMxUYmXrWkDhruEl8adQTp30c=; b=B5Zq0Lpm+w7Vrq/h
	C7vU0zySFGtlaA9c0oKN3U+A+p0GBJQgdxvRtbBP3fyOXDeGypSp7S3/mGwq2eft
	D1UmgQs1XH2GnoEbyxib29kNcEqE3Zhu/Hv81I21l/2r6oQ5kCElvPm5bPeMrSeU
	iE/TrsHXeCipDqUkXJ+JfOxhjxgstnsvSs5quXka7rMo8Q+bakjDqaAuC/tNSABq
	XsUqTj/xSx7SfgrrZwG+Jgto049B+nccQfKtDsh5ED+P1Jw3A5IH3FbxpSyDZy6k
	yBXVxUmOHfGHEqgPYCQUGsj+4YbKglHANUBJevdSr3lDqW6zPouMrn47DrFZTRlI
	VolViQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419ber-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:40:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-633dcda64cdso258737137.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683224; x=1779288024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBKKTtR6QoH/FPl/5VoMxUYmXrWkDhruEl8adQTp30c=;
        b=BJww5eYuu43w11+UFmZ/8UQmO58mgoUdoQLmo2PtbaQcniAH+1s5eA9tlu17JuTxqw
         sj1woxnlAxjoPpB+olzvo/lz71ieS2nD8IGRFaCYWXU3Of5Be6+5wQEFjM3c3Xf1UWfL
         0/I8h6q5gS0TwbcbruIUYio0Vvmkmsp39zIYeEngRrh+N+xctSUrc58Br5rr+0ibcpGL
         dP3uKnJdeqrS6Vyj3bYbXkFMIepmxvZyRMwT1YDU5dVe+ofEG/9zC8AryOA2kEFUSOVl
         djEUysrrky9q3/2X8QQzFuLy9xEM7q+2pXhRdUZi1zhajR1fghR59BtFYz5kIN95MHQB
         IGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683224; x=1779288024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBKKTtR6QoH/FPl/5VoMxUYmXrWkDhruEl8adQTp30c=;
        b=qdNyrjYl3M2rpbzl68rGPb6nl0aPu3QxyCRQSc0vb6fCzFhaqcfP7+mvRZd1jXHXJH
         081/gpZPQiCGMxosvZ2864zwhlnhAPqWDRgPl4H1Ptj57jHEcbviVGcEvRVgoEJXBN3e
         fORB+iH0X3l6CWecqkjEyjLTK/gt7eFT+5mxpai92sh1XKYgf3Qkqyx4pyds7/b0SFd8
         B+dG7ClZi/WKk+M+nV6hK3l2gJ+WbGnW/3NAlUdM5J0k5bgJw5FdPrXvcp36mi1wPgrX
         iSXNr6I6MZ99vCYl3HGlDClTLUQxZqjDg0cPzywgfCGsyPVpi9HiAr3L7VMih4oQUGwn
         Yolg==
X-Forwarded-Encrypted: i=1; AFNElJ+8xycePvGeHnkOW4OFJJxD9nv+iC+sK/q5Ayy9hwNgPnj3edoDR6L0Gu9/KQe5RQt70lNnAc/m3M8w@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzARt+sXZNT0ocICXpc2Fbmk8r4FxSrEK3RKbkgy88gVdqOPV
	vqodZGkT845HM0SR2+UDwaoYGcUmZeO8V+P68Swfh6B+X4f34/7D0pAIh5YSBMBVmLQGiOQEV2t
	fR8sLAah2Dzpg7G3JGG9C7/3ndOIyK9egbSk45jTRCVl0WV7LPHli9xjKruP2ptar
X-Gm-Gg: Acq92OHjtYtENa8L+53bi6/W3b7f2LZ2it4WtnUhIgw+jFQhRb8j7dvjzwy9bF9X3Ou
	xMTdR9qHtha4Lg5fQd1V/3RPWTHUx/6lURnpj15ChplW/OEZ4f3PRD5KWqpy2p20Xt+4+I+p7+T
	zOJJh+Vyqnz6KIkBZ2xQ/mWqH/Wv4Snn6pXnBbB7s+/5hHrVZS/hNQMWttXlTk2OKB5G0wdQYWS
	m1f14ftKo22K+jMGbvnvyZfBB0tvFWhF9KNU4uthGv7ym3QHlY2+t9JcCYkH0kezaBjFBzT89EO
	xmDJjKEgN032NlWTd0FGMG+SZwFjeeAMf1fUeFWcFbc/xnWAfW+obdc7sPsW042MTG6PnhLG2XT
	/D66w6LADknj7kK/pk6RIbRSSjs07qQQQ/KFmS2GrCMOns0zWuIKydXsID54kGwv6HmSJL7Kax9
	/7WtM=
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr519292137.3.1778683224182;
        Wed, 13 May 2026 07:40:24 -0700 (PDT)
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr519282137.3.1778683223691;
        Wed, 13 May 2026 07:40:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bccffbac588sm639743466b.6.2026.05.13.07.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:40:22 -0700 (PDT)
Message-ID: <c703ff93-3361-4a7a-a183-6679ee3d7530@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:40:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a048d58 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nO9I6zzPj4eGOE0Wvx0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MCBTYWx0ZWRfX9bLkuthUcya9
 xTtA/GfWRv3ip5F0IMQO3FkphdYZ1+QOj1KfcBB7KzdeDkwToMSUKMy6dIRaob/6201X9t4Dkyo
 P1m1dSAfytO4tCw/qI5FDHjK2u3AkaUWP6hicUy1cQxAeS2FA7DbPrWkS4BnhAGT/SVHjAT+bWF
 DNUMnLnkHnINHbm+10DGfHhP5VpiOeodYqNfDgQWH13Zjzz+Ds2Spkk46DoUtYyXfWPc57qrHcU
 zkUKrbigKEz+KTjvYeaty3rrV3cpKtKvLjVlER96ccqAI2C5pye3irDmL2sh9zJ6786D/ANVBBI
 L78nPdjCOrvY5MKz3I6Esj3qnuhmYb0XWkU4QpH9SRHgTtZiugLh+k93csaaGhKHL7R9d8IMrN8
 vjoAfVAGuTMIywPZlotPPn+nzyKndU3Yoxq2ikla5ew2U+iaBEA0hi39bOmq1OFD5fc1STJugJP
 1tEVVbo/42EaBWqiJsw==
X-Proofpoint-GUID: IPV4zQ5wnp5MUaDLujXNXB5vp7i8u3Cp
X-Proofpoint-ORIG-GUID: IPV4zQ5wnp5MUaDLujXNXB5vp7i8u3Cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130150

On 5/13/26 12:55 PM, Viken Dadhaniya wrote:
> Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
> is connected via SPI18 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
