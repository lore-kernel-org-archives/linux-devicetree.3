Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5A825A359
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360773; cv=none; b=Q+/kDALJcHaXoiJkLbh8vJLCXpwkM/2HKxNMT2ExPa1U+Aou3ZppQQyt5PZF78fuWD9rjGYpyLKEx/gFf6o5VxJR0QOV1IIAw/EChxKJY/Au2YfxF8Y5u0Wsjyx2DULMqGcE9VfCCzOqooQVDI76AL7Ocp13vfc4g9NqjydahsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360773; c=relaxed/simple;
	bh=1BMUV/FqlKP+QxJTzwQJ/cTH6qBIyeyWrsY9na59lS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eeJT3M/pMhFUvvhl4W0qMdPwxH0fOWzEGd/dw2XTuY9DBA5eautcP5YQHZdJsGC1RwEQklMpYBfmIS3bKFCcaUg9nSa6gtS6pffg4QZTTmEB6bCqox6vlC6jehuHxVy/Ew8qNyL/9Xu68+JisSGnya11xz+G33B9Bm+tMTpe+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9dS6Ztg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLaskPur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9dS6Ztg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLaskPur"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsWho1049987
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 17:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iq2547hWkLyPSn5vKecOMarotbQZRKymJ/MEe/TR2/0=; b=D9dS6ZtggisbxqVw
	VXNH20ZxC6/PiGXHw90REEh6dwZDMS/8Jps1l/TWXPucoikMfgj6/7kXVq/NKlNl
	vJS6Q0k+mxlZuBPzq9yJYF3aNmV/jEWJTFacqRhoMZWDgMY567uc3dRVdSsfe0X9
	zW2U7ywrsTYVhbudEW1+hSMxaMQ3ynWaUvrj29AwT6OdeXJx39z984puadx2X8LL
	uROqcqcMF2JbosjruZSiUG/4pYiTo3vkztm09jTeaeQsjHUR06VnXyhoEkdXVfkf
	O/eI2ovfqvxDE019fdtnxBb6v8DHB40rJ8lpwmcD3rJbRtBa2qrKvEtsd3K7ycM9
	j9S81Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0k7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 17:59:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so13609285a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360770; x=1783965570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iq2547hWkLyPSn5vKecOMarotbQZRKymJ/MEe/TR2/0=;
        b=SLaskPurdGdDpCTcuGJVBGsX22vNgkWliKWoyIQtYsvSSlDXNIYErBRnOusF8QI8WU
         nfUsNwNYQu74exqSj5ipdlwz0QDLkf8bs8Io8ojncEngL7Tk3cbHH39325HgmVx8rzT+
         BN6Fr7VM0DQBeS5eL14ld+IJ63VBLvtFVjzF5AWYm3XyjfdilYAAqQCO/rwHS7NuW2SI
         LVBM3ofMAANkwiiURJ+oguCVtZMJ5HCxvphMVFOr0Txi1LLzPkIlkxa01RMGmQMlgY0v
         XlbjZ+/m4z+sef5JuIcIrXlox2AlzedqQitMUS43lPPhSjs1P3MoycPJSbq+ZelQ2Hx3
         I3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360770; x=1783965570;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iq2547hWkLyPSn5vKecOMarotbQZRKymJ/MEe/TR2/0=;
        b=R0GO/OqRaQzGBIBbmirnxq/CozWkz9kPYWzfFpX0Qd8W66JFQLT2TkuvVmh/bZPklq
         TSSgCH+X5t/6xLe/DY3Di9rvy1WgC6pXUmZ/QfyOCSKDWAbV+1iIMEUfi0EMByK/pv1a
         ig+mlJhxyf8uc+urlDrvBN3XUdvxXeyXHhHbTym+1fbhwFkgH0y/bLtLrcupnz1isfih
         kY42u/Xx9r9dmEy74BkjVKRkW5nvPxxe5S8tl41OS9PY/CmKYMGuIV0zzkzdsodT09F0
         QWrb+Nw5w7h+nM7tTPJk/g4uJObG/v6j3JzTMY9wYxjLFJD+iqwT219CPhBGZSe1RWcy
         wmHg==
X-Forwarded-Encrypted: i=1; AHgh+Rqm9oGIpoAAar4hSTiyew2jJygo65cTMpLMwGzVISpzv7hafMUBG/Ox45PGUbFDUeAhZFAAaa7j8HSI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3U21KdiYlwTgHEzfZVFsyI9FR1LJEePV+ttsMb8Jh+jToetl
	/X1Z9izojmUsfdz/pQrlp/MSa/8ioQSHokBtM0vptEmEnxXMsxmi3zf96b22t4Stv8/TGJfv2H9
	GORjOYOTcqhqscNxkgwNB/okzwshXbemL+2YiiaD+dUYs2kdNhYCPxrvBw3O4RiBY
X-Gm-Gg: AfdE7ckmjlWTppcTAzMjUokvB5Bp0ZWB+JxSGD6MDdQGXnGsKzu8649E2i1f7GdkjOP
	VCdkhDlarqxZKCHPJB3Hhx5cDJHRL8qNg3gVEt9N9SX45/ckKAdP4FZ09AhPQNCw1Gmc0Xa9WyI
	MGCOOoGlsRj9mW05kd6Tg9tJSeOu4x4gEvowqJd2+P9nHzstK21xBoT1o6bV99BE/HHOUonD0x2
	67Y8XZY2i6GVm0gaOVQwkc21AYAZy8fZj0FXFU4qDUUxDFq3YNY5CukROfoGeD49qISbgryQiUe
	iByLbQ1cIYXOIM6uVvo1bXJOvgf2ZANUtkAv4U3pg37ymLfKSPA4TS5xl9gkSptHCeEPtMDbpOf
	L1Nw7UfjK4rDQcHpJcCaaTc+ND8kh+3gtAXbnVJWV
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2099262185a.11.1783360770239;
        Mon, 06 Jul 2026 10:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2099257485a.11.1783360769800;
        Mon, 06 Jul 2026 10:59:29 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01c00c0sm727595e9.5.2026.07.06.10.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:59:29 -0700 (PDT)
Message-ID: <0c6ddedf-df46-48a3-8810-8ac36c06d507@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:59:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Correct indentation
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260706101930.341635-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706101930.341635-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX/fW2RrX4lILe
 fLsfXlOyC44Ruo/fwEPFia/doAd8K6yc6yVfj4LeRVrsUrywT6TKxPBPMnZRpATh2z0EFXn3Zgj
 e1nBuQDXhd7QqOMVVNQPgOE9UIZOfzk=
X-Proofpoint-ORIG-GUID: B2v3SE_BDqOHLIeU3AzXNwluvx3B6LYy
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bed03 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LetsCp1wghxSMK_TJDwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfXxh4cWfGg4wai
 jvVFo9e0DAUCiYZGeGCZ+mgODfGGW4XewDUcMbFIl72yJSqoxwSe5Ou8G/X1F81sE24Q+d5fZxp
 Rt9S28X2mSD4rj8x4+4rXnLYhO3aqBWLIcgGLAJ+xNsNqbR8Lrj8wCf3KdIKqmuY5Cmn7yuKkom
 XgwKg/PUYNfvjaEqMDaWSpwHcZHrxGnhIMr/TIQKWaexSQ5cGlE42CD6yoRMi91bQvk8iBSXxrP
 RBQaDnZ5C/NAzejy/eoxk3hltxI2YXLnJW60LgCx8UbrHEqz0G/y4og+kQ4uKiWZO6Ypy4+SxbY
 8f/dF8k432zIwSVZVTuycPMC/u3yn5Bjy9bSCGEANSva1Vb0OTsxljzK/pzjReTR+lEty73+mf3
 giJdWmKiNx+YurLmEwcdJHF0wJVzi8RQWvUNBwfiRVeEhkQsaI7h6o8+NYfPz3Ry6hZhLifm/9D
 ERa9n36IqD2Ec56kd7Q==
X-Proofpoint-GUID: B2v3SE_BDqOHLIeU3AzXNwluvx3B6LYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060181

On 06/07/2026 12:19, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---


I will have v2.

Best regards,
Krzysztof
