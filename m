Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A052DB7B4
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487147; cv=none; b=OVD2loEidbIkAypaC3nVy0t+5xcRWQWSrYogYuWes1oeFAIOaJtwaoF4aoCf/xy+qQDLDfqJRFthUF35Sbdv1wJOuxF3txJubeVfu9x1Yom+rERLYbqTm0P/h4zhDXU5NWPWLcTI7uwKrpgJCA0jJXahNObLn+vJ+2guFvfqdD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487147; c=relaxed/simple;
	bh=PVjOWE3ztFfvhgUWvdwb84pqrQluu+dxKE9uDVpMudY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVVkffL3DAP5YMc4zppOpuB3yTTg9DLPoF1ITDCKfcQZaYqEf0gUGPKU45ijkFxIs1L23kMKkB5Ro7BtWvJJHLNDMGC/rnLAUALzgKmN8eg35+twhZp5GZFXuE7S42cDWHmaCcTP2lT6PZMNS69Msi9M5WtHFgc3d5OMhMsr5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zj6DN3qf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyhPVIr4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zj6DN3qf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyhPVIr4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6368xRNg381376
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWB7f+ysHFhW3JFSyeMor/4RPE8msxyS3ZYoCMonU/M=; b=Zj6DN3qf7QMPlWce
	oteTNM0uvOFOlLsoLvVTImj/ynodasxbAEmRBtp8gLnoD6ortTu9t1sti9EA4/QR
	Wbw0c227sB6AO5+Iyf65XnWJE9ofgUqRbAzTAiEj8MJo+gQpisH6fGYQJEAUytZ1
	BSrYCf6VbyF/dXSkVFInrQ5x+ZldCRvOH6wZN9q3cemsduj+N0IKPJaRqdyZpXhb
	D8aruZtMB9pJv8mqZNTvXSp9ZgCMwdR8itPKUKG0MRDX56jckGbwFwF/IkJt3fEE
	hBZgey1OHCdMkV3bk8LZJ5UIeOmX23F3IcN6oaE35KxDfWYu6MfpSr+XusWJP/nI
	Grq/OA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd5fwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 14:52:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c192b3fso42361191cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775487145; x=1776091945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BWB7f+ysHFhW3JFSyeMor/4RPE8msxyS3ZYoCMonU/M=;
        b=MyhPVIr4Qa+2dgviNG9vWpmgJ/CSRQRdTWoUg8TQ699haJMNVwz+F7v3Ww0VcqDGBK
         MB9WfzdEtDgAi1AIZyOv2lWQnqwTINHkDnoYPpQvPy+NwBguejhvRNrpOvdzfyRrrJPP
         MlywPsWfHiIaPtuq005Jx9Kvww2Q4uXuGYuodgoYHmoUY4UObmzBd1b8v0LInIMD3XWX
         LDx0efy710N/IniNfgCRBMRbHTwVhIi7V0lG6EfOUMIbdpeAfk4QXkteOwammVFd+Ljv
         eQe0tjrSJ2RtFIrEc8TgpgGoYQy1PVG8F0AMiKtWnmKyZAssaBlrklhEGAah3SKPr5CT
         3Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775487145; x=1776091945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWB7f+ysHFhW3JFSyeMor/4RPE8msxyS3ZYoCMonU/M=;
        b=RjUJxG7FhROqzb8amI2GPA+o/FJaifLP6fHTt+/rbcWcPIB1tpIBG3VPAH9fSeFAEk
         xw5M7ixh8Mz5fzQBCTyCIkdbCAuHXUzrxvT2G9nLw9dKu88cgo5R47SPc7piLdaSMKqR
         hpX8JU8TK9VreJV5c6rwnk89AWnomhu0GpvfNr/FyyVfOwehe2J4RhqalyxRE20yKvw7
         G80GZZiOfx0HtsWnbrrGMMVnkYQK2hCyYI77e/tRkx7dDpTR0LI29JEDGQ4oWspkTIkC
         Xd/ne/dMRuzSCG6IqnPQ3YsoTr15SkwmIBwgpD0QMXgnIFBPquDSjjgKOAG68jIGmVQN
         ziDg==
X-Forwarded-Encrypted: i=1; AJvYcCUoWsj7GUefjKzWhOMhutG73lVZf6kppn+vrMCBRPM0LWO2/Hu7dE5Kou4RyjWxYZfi/MBk8+k3d+8+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd/+JCpSLl4nvezHYYfSp3pot9FTi+NNQ8GHkYcY+TBmGUi2rz
	NLjrc8Qn0tlYLrIcSIsvr9BP+Ei+8sFPH5FQwvuaEGxFZLQ6ijNot407LQYh23EF+GrRF1njiA9
	0C8YdFVcorjciNwvC1uN4r/7sXOeqQj7B7+6+SFqZAdH6cL2KIqf9wCJKthKU1X3C
X-Gm-Gg: AeBDiesrKeZcC4w7X2fOgyJtpmrmVoqq2FcI8loqheNQ+NV7Usebsb/bVBUBv09wg1R
	W2ZeTTrbObr77KpJIUaUbr7MUoK0yFtcwLDZLQyH3h14/zSgt5qBl7UnbEfbcBaY6kxW8izK0F4
	3xKwvfLBMqsfBCHkhBbf/a70pOGg5Tc5qyxp9Sd51CN+KKWRAXSFrm2G9m7AOq0cqz8C/hAsJAx
	Q+Z+TGgVhtDqDsGVi5koVuQ7ODyfcHIV/Mbl0cYR8AwZG7L6dfoKBCEGh1ea2LwdDvtdS25EeyW
	apoHfV1D8JBSxTjRyL3Zr2fer7mGZYiUNOaasBjMrT06ydmlkKhApsGoEgfhoz/NKbVROLBZHgd
	NFTWN01au5btYHPHbhKF0F6Jx/KtiQDCYyhkJK5TXDG/QetuK
X-Received: by 2002:ac8:4711:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50d6273fdacmr145909941cf.18.1775487144771;
        Mon, 06 Apr 2026 07:52:24 -0700 (PDT)
X-Received: by 2002:ac8:4711:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50d6273fdacmr145909621cf.18.1775487144336;
        Mon, 06 Apr 2026 07:52:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm636312785e9.3.2026.04.06.07.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 07:52:23 -0700 (PDT)
Message-ID: <cb2b4cdd-4306-4314-a0c5-81894915d68a@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 16:52:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: Kconfig: Add ARCH_HPE platform
To: nick.hawkins@hpe.com, catalin.marinas@arm.com, will@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
 <20260406143821.1843621-3-nick.hawkins@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260406143821.1843621-3-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jy6qmI3SzIiHq2eKH2mC7493iPeHw8dI
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d3c8a9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8 a=2osGKKFTDaXw6M3hofYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NyBTYWx0ZWRfX3dJtEBYear7Z
 7zrCNAtBwwlbgtYWTshu1ZWTIcZJmZ2ETvJMz8Sj+0HYmgFQnsuT3q8cBhwKDghROunB1HU0+yv
 8ETkmg+XcZY3zcasLFWF42fdIUR6D44MBIrbO0sB0GDki06z02IG5pXu+L2UqEf9yZpgWc4pbNK
 0130CtmCHw4wI0uiANyrc2Z3GWGA+bMCZzmDZHj1ZreNrXNLH7uQpgZO0X9yHl8s7r5hJLCm3GA
 UNPftuFJkdzPGQgruL/rDX6bdZ2htK/KnbBkwU6kUXabB4xWjbhxDPgz0rGibOBqr0ThJFxI9qZ
 kaQLq4Lx3Toau42SR1O+ZzZ5HIhUUXWD1x1j0Qd3qkHIvKW9qQR8oQ6FGKyCaI8F98RvPso7A9L
 QoOK7jQBDXCXAWasx54uvPa3tEPuL4IpjFVpIMnGf2v1LEA5t2jkmUniMub3DW0kvzP3o1bKnEM
 859znGkKnd0zOW9BnLg==
X-Proofpoint-GUID: Jy6qmI3SzIiHq2eKH2mC7493iPeHw8dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060147

On 06/04/2026 16:38, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> From: Nick Hawkins <nick.hawkins@hpe.com>

You have duplicated From fields. Not sure if this will apply correctly.
> 
> Add the ARCH_HPE config for HPE ARM64 BMC SoCs to Kconfig.platforms.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof
