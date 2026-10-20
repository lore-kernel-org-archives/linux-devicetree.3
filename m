Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483812;
	b=k3AoKCfK98DBAlfJF0aKhxpZQrGtBBReQS9g7F8n+AtJXvpGycWHP0DfBUnJ9hM6lULf
	 J2uQY0maV8OWcPM6qUD1NNO9jWAEPwM+IE9RHya9N+vnrtyn8MSxSyxRyqyISuEDx2hTB
	 xv/kLTQXJPI/i+basJgezzKtvxYXrEHu9JwJhxLCmp5/3qRBoqELpJ4+htJ6HToiCxoUn
	 Cxbl3QEqshrHW1jGUPFQrod6DNRca/qyca0WBpdBhTHKJZxqqzWQRpoOUlFPGSVtCghIR
	 WD+FIrjz8OQ7/ZW+LbsYw2sL1AqABFyr4X47j/Vto9SMEVSiHY1efG3FoPybHmz7mkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
	b=YXYpGkGqo7LjODjc9vNe+WXfMKxYEo8A6AjV7NHSXpl+UrihgTQ2/VUEZxaSdwMVeKJ7
	 IrZNRMzZCXcdQN9b02sS4I/+fBztAG4Ce3pNFXtGhOoCwG/gjZjfbk+bac5izPTBwRKaA
	 h4rm1sCCwFbGQQesXz43qmFWO8xDZlnHEnF9G2G/wyPRAamJeHEySvrtw/IH6/26faHnl
	 b2wNzl85aLZWev/xaJGg9ig1AlPWnROxn2G6+7c9ZfSEwAOBZ8vyXpd9bhylZ4xHWfRhA
	 IRdq1yTQ+mALa29zb7Qw5suEJQtHWALBPn2zaNwRzC5D6SYhViQMwU2BjsiCuMR7NiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHPlQmG0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGPudhlY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB21606A32C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB21606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHPlQmG0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGPudhlY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tDAL2877763
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=; b=ZHPlQmG0ZtBE77Qv
	3aS9lp9Fo5BdTSq2vksPzOWAFXGAnnaUC6LNBX2VxnNJy+U82OMsl4+BvegVgVbB
	QD67DB/IvMVaA1g86pxvznFhL+PjgKHujF0svkAahHqfjvkjL4AXYeYCvVq5tgUb
	WPr5Y/sdVWPpAom2lpn6sF0GzWoW6mp2HqkzsCY7qnemqlySU9etrfIaa5NOnXyg
	3Cg5dkfJRdOI8eBo8C2rmJtsEbAYDC8W2w6mr5cwTWuuryqot2bSR5p9vRfI9thD
	7gu3qC2cGY+bu4eix2n3YCX/qsUI8Nn9VHO0kJqD9EYS24YDITGu0oScilezCdqy
	+MrxDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psjmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:10:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso56724285a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483810; x=1793088610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
        b=NGPudhlY05nPwM/io16TH8UnL2/wZUXEyccubxp9TABqvzlnZBaUxkbvE6Hx4DvbE8
         nvqg5AZL8Ap/skwiyvRWPaZSOmEP0TS7Qw6FmewZ94vQefhFYtwxaduyDBRy5HB8iCbt
         73wPaV1VNCTHxCwSe6kcAoDBLWEtRSUuvEag2Qbw5eKzOJEXw4a+jF0rYZ8n9Mr6is55
         CoOt5ffN860rUrrSD62DVy0PS22kGEzrjxOUA7Lc6rS7EeJU14K/RMnoZqCj613uNdsS
         CEOTzkH4qkwE31YyHl3UdGh3GLGPnldwEUMGFKyJWxasbG5JzjDWPG0y5CYMG5cdnpiv
         fBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483810; x=1793088610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
        b=KiZy9GQR0V2RAHQ/xT9dC0+D9yhvNhTfv6svS9o45EA8Htpd2c2fQfk3NGy5GgvTte
         /VRRYiEmCq9BGjy62DX/kvkTiW4OO+B6ruqjshtTOyX+YCAQlg1/N6aSgu8m9Q+7E8vG
         +ZQZBCu8+TgL+pM2uL2NJqvRMFxwOcSKWfIXgHKOk1ts281XN3aQ5tudhwtIb5xYIJTA
         NnInsoYDs5dFqfo1rPVhMC896JMjoke7VFXtHTEjUffEh3rQrryUMveT1FeiSXPpasDL
         7rpYICTtMg6TmodVzmfzKt7XdFxiSPIrUFinje1K8mSmHicfTgbMt30ZPQ57yu7bGlNA
         YRww==
X-Forwarded-Encrypted: i=1; AKwUvBzlJkS9XYfLSbn1kkRa3apUCVLoutzJR47b0eCDM6jzbVowr8IXb7XbhnoUMvcRaojq+3dgqNSR5kWU@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Fh77yB+ApG3VvcjWkd5I3te36uZB+vajv7Q2hXzrFpXllZMC
	IFNIXE3HYC5BMj52C0ZkIDf5VHoMNzyBDWOqbdc7Yy0DXbRxZ2uYweiyCr0tQdOkioVssnjQ9zr
	gugtQsB95xQ2I1blxGeYK34wKtgORJrr2I0f576VVMb6FdqTc3Cj8/0Hz+oEWEDPz
X-Gm-Gg: AYBFou0LhUc3ppnBot9dDxSzCDxoPSOLvJdMWJSNup/FECXntAjW12BgqBbuXZTSP10
	H6l7SkbKuqBAz4DOgPkIdfL/9vTSacH6zt4fyF/7yhNFuDBHxHUfcsMaOgF/waAc4fdGb9d3xh1
	Ib02jgAi3H5+NWeLlF9WDKPn1cGTcUW1awibJS70mfhx1cWhr1t+BXztOS59vaNB0PzQdqqr6/5
	oXRcZoAz+xHhQKVTc0h7tPW9Xwmk7PJ/9GqR5LebOoNHlDS1CYCQ2WTRrVEKf77BH9MR34a5548
	Ms9d3r7Ql0xrTYiJ0WX2/SK/Mu47bN7d5Tn/LdqG5buIucwCmXMyHWF2XV3MGbCOMClEZzu+AUl
	xZ9Vo0S2RNrD5g0o0XxOgcg==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1960109785a.4.1792483810130;
        Tue, 20 Oct 2026 01:10:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1960104385a.4.1792483808910;
        Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10ebsm456527766b.22.2026.10.20.01.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
Message-ID: <398766a2-2abe-4abe-9e25-6a17b15557aa@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:10:05 +0200
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: move GPIO
 haptic vibrator
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-4-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-4-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad721e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=RZ138lra_CrwkBlV0WwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXwz0aTue6VQ8/
 SNWpqGT9K14VIaZMdX7h1EMFwDoSfjfYRTZkkQdL8QqORETswsOu3e+NlMfYGwQMTO5k1DCYvFm
 t/JyqjPXSIuc1ZstCdRyOg+ztz7vVevW5kSI6SI7kUbs5v+2g2zxMGb+HXs1Z/1BBJ7dVCDs51F
 8gp/uEW0BTABrTxMnZyutD289a/7fZz8aHIsssAthsdjBzFH/PGsm5B0JtBWvcRMRAa5O8M/bqS
 1DAmyFmOBTZ7G+sfZI6mdz4Dm3ctNarEFtn9wcXI78JXXn6cCb869UiWsavoL422PLNarAI+yXu
 F/n6GY5dxqoRq/XKea5DdMX6meGEsOUvCCAJk6VG3VC77uawWo2BFClW/xMI68VUrSY+3L0I46r
 aVsfPwt4vsZ9+pNBzHZCH4hcdXIqxDzu5JZhofI/TT3mKBnG0bzV4dOUdctV+boOWD5gYpeW1Zi
 2XiK9Mjk5Gtb2+9QQvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXy9bB+Ntqoi+V
 v1pzRIq5CN0kyAyrXJNSqvCuAnOADC4hoHPyQUthv1/6vf+3ABQwFbSbC9EyEUGcOuzC11Rf7n8
 h/HeNLMJF+/f5ZcTE3fnD+qJhmDMB10=
X-Proofpoint-GUID: OOzr3kYBWj2BO1yJE5cvN91rQOQOCcZw
X-Proofpoint-ORIG-GUID: OOzr3kYBWj2BO1yJE5cvN91rQOQOCcZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Move out vibrator node from Redmi 5A devicetree because
> Redmi 4A and GO are also using the same GPIO haptic vibrator.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
