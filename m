Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01BA3EAC75
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071686; cv=none; b=Pf54NvkLpdFLZBYYmQwzKxywTTq99W34EvluJDBJwtw3K40HT2645i4ovaS5aTF+jXtPG6P8DKp9noqvq8SS1GbxutVm3l76T38YgLmyZDUkEVjpJQyu5SPVDld8yx6QeIX/EjyIdw+kWfUllmSIteBBJrQMbvG+n2c93A+Rluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071686; c=relaxed/simple;
	bh=lMC7kxURybpSjdFzTK6cOaCS5kL5BeKCo+5fKJoCl+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ad+unblCbo3FCLMQYGAhpydl8nnBgSZKWcTXmXtxJ33NLuAqEnNBW/DMf87pAbViTIRQTlq75JOv2aE1j1M5j7wUx8gPsIyFer6hV350KZc37UGysDoLsDRsg5YuBAnRftYUtO3Ppf/g0VI51vQEXwHLX78GQd4pqGsp7fAQybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yd7ryF6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3A+Ijgt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yd7ryF6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3A+Ijgt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdeV4100196
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hQ6+eENRuBrsEE0ZzvJU9MCl5hk/NK0q37BB4XSGvQ=; b=Yd7ryF6ARwEaJppk
	GoAc3xiz4CZf/OJppB4KKcYsdBC+TXu7p5VE3YroWBJR60sL6wxTtEFLOYOgfHu5
	a2rPy10u8EmTWF00ljWOLu7NiE5GsGgXZ344IhTh5nVMIQyndmmN/59XbqRUkXgk
	/0SiVSgYNZTuwOXVL7As/E9dE3+fJ3dCjhtedNxdeZU6kgMd/lLzLSs+lITESruk
	ZRHFQ0KkuYrBeXBcyM43yTLJftIj6kEpaEPpvxIFboTsB00pAqqR2T4iFTzwpRoK
	ZR4WTeKkxc1gQ96dGD57gfrGAm1qvIUQGnVxoHHefsw/4ABXGLA429NrBHD14bEU
	o0Tkgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8pya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:41:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so2638685a.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071684; x=1792676484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hQ6+eENRuBrsEE0ZzvJU9MCl5hk/NK0q37BB4XSGvQ=;
        b=f3A+Ijgt3szM34Gh4/P+GHW0C5GCOTGTV0AsZcsydmxZqKp44GhgM+qa84oRXa4c3m
         VrOT43IeJKrvsvpTFEOCzkP8Wn8eXHLNFUo7WvOq45JIgxSOdfU/oLrRjamXELHpAbL8
         72AbhrhCZZIG+FiS4uG32FTF38xXU7ZHMQMJ+wup+ZOoE1OGlOq0BTDUnKxpqrBlzqrQ
         0sEbZyQB0mPqDazPXXINjsO6+GDefYtvc4FZIUdoVt8qJU9wsUfhHk8jatYBxvT2oxg0
         kv/1fH5DS5MVayw3NTd1YmW2+Yq3tlIXySkypeA/wT2rjeGu+eVkpW1twuAq2KNqLuV7
         uXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071684; x=1792676484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hQ6+eENRuBrsEE0ZzvJU9MCl5hk/NK0q37BB4XSGvQ=;
        b=iCYWsVs7EFMxKzEGT628DzilmwVFmjnfXD85InWnoyPOo1/QVYWPkGM1cfviZaTkmY
         J4Tuk2/cuiFNdvdUEcGWBAAhURtq6iTmCsWYthp9vEb3CAMhs+iMK8ovTNyNhjScNZM3
         CdXnyk1Kk45tyV2IFjJl6DpcZ82sFrxGJxU4Lf06Yn1KnCWJlvf7PWRs2GkErtHE9DkE
         dTxZsktyR39fbu6y5m4/DmKMk7oPy6HcXU4w5w2A3LTZXoUp+vOuNqw+lbZ4qu6US6ra
         UFvj9FA7dGrnIdFfawluiuw6ssBV7Sqyli+6sQwjIPhH92meyb1HdTghVZF8QpkVP/Sb
         XaMA==
X-Forwarded-Encrypted: i=1; AKwUvBw18tl7xy4dFPLMI9/x5yivcB5ryO+5WlscHPoC69GnMpc3CQ85amgZyiCtFCNO+icrprI2t/ZQ17mi@vger.kernel.org
X-Gm-Message-State: AFq9FYLj1iI0uZAIxnRm+pD3Tn8L7WaJfLHy/wpvcsYhgONHUfdTlilC
	PxSAnOZrDHkYTvmCDcYKbz5Anwoq+sKDDGj5WpwfyQijqbRnJAtjaPYMs7g4YuPrUJF9KwuYXWj
	nLRxbGGY3/QLQ4OOg8x0Zik/HS7aSmdLEeggEyU/zgEUj+ku6G817nvIPN+4878cU
X-Gm-Gg: AYBFou09Il+CoJF+/dEcD8kU4F0Lnj/WNNTXuyiQCzeLRr86xZQ9xGG25oX0dbrh8LN
	joltCuFOTiatZDan6imDmoHenKiNZo4dxupPS1+WDf0xz+KTdj4Ql5nkfxN1teHEvO/8C4lrQIi
	S/XLZFcDRGZObGOzHYHb/oPBBTWwFHU/K86Xb5+b39mkYaY5/SZQgUX6vNhTnNNPxFVUAShrIw3
	YyqX9ZBz9Fxk55Htzsrg9ohM4T493rBoWuKXZoYpOeAPy9UxRdVLCwl5ZG6Jt7+7CkIBacrfGUd
	6CY/XB5XzJJcefPSR2H3GSQFoeR7CwTaIrmqZvKkPi/wsN+8qNBfDIFVf0S92WgTRbb1BdMG4eO
	5cjFxrcmORDhv7rm2pOUEMA==
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr739123785a.0.1792071683732;
        Thu, 15 Oct 2026 06:41:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr739118285a.0.1792071683216;
        Thu, 15 Oct 2026 06:41:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda6276a5sm123620566b.71.2026.10.15.06.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:41:21 -0700 (PDT)
Message-ID: <1be0ad8d-cf9d-4d54-9c16-e9e3213717ed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:41:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: Fix the CPU retention idle
 state parameter
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-2-3181d488dc0f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-sdm630-idle-states-v1-2-3181d488dc0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX9PvQJfvT0Nj7
 tw1m543/Vs4bwX5LXEfMeP3A5/f33qCFtP+zbvkOFF7D7mX4LkHNLIOoWuJEqKMQxCL90oBmykS
 XFY5YZ+288/J70SEWJFbr6mS+Hi1Etw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX3xrjbXTrtaRh
 SxCLAW3l37V3uDXH07fHZqIxitK9mV6fCPNiuLQ0KXGQVAEDHzGBKa380bCuExrqhiroPbeQudX
 qgLbBbPt4ZGw0PF7PdKoURfg+tEGsXaxjdAYeoY+dBL1Ps4Lb+4Esathzd5P0aZiiFUXe3PUavt
 jLgNlgSsFKrxx+ABZtyhVHVkCZojy0TkHhlzXzYEIRp0clYmGoQBTxivokSYy38ERs673eMuZ8x
 goasxEEkLZtTAAGkJMI6br6htZMYLrB9Qq+BAY6QsPG/pL/M58yrcjjqlr2E1sSXx4qKW9URebX
 +/44HjR+mgYYYTxY9eoeFf2j4lT68lWmuStHRnWdyPDqZWeN6H/T2Ti5eNxYzGo+m4+EyG++lSN
 /+DWcwm5v9Jb54pvIsrHOLHX8NKndy4Ex0+dy9N7LW1hpBQSDmbCMgMWWVnQEn7ED1XKlNjVvJx
 YpllVUI5eyLt78WnWPQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0d805 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BdOeh9TuWhobGdjKrbcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fIzoAKlcNVYkJnr4vNJn-SECY9nsgoqf
X-Proofpoint-ORIG-GUID: fIzoAKlcNVYkJnr4vNJn-SECY9nsgoqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

On 10/12/26 4:18 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The CPU retention states set bit 30 of their PSCI power_state, which
> marks a state that loses context. Retention keeps it, and the vendor
> kernel requests it as 0x00000002.
> 
> With bit 30 set, no entry into these states succeeds on a Motorola Moto
> X4 (SDM630). With it clear they are entered about 50 times per second
> across the CPUs, and the failed idle entries across all states drop
> from about 30 to about 9 per second.
> 
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
