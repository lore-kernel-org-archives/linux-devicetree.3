Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE563CC323
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893393; cv=none; b=GZh+B4gNsM3W38OMeCd8m6IJtd7MGV4w0vsE9YdCcZPKfo0/9VZVkJOP4gaDdaZl4dpF1LqjXjwqDI8aeNlnz0n8HWAhDJwTEg9KCMB+Ob2OwuDqSdJH8KU3bkBiQXT6ocCYeoqw+a888zsb8wYIZAEXqUh+tH09LLMx0XlN2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893393; c=relaxed/simple;
	bh=sQ5bP52hJaaSICUm2kfIumA2+NEEEny4Sr1SvkemHFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdMJUDzXlxCnPsbZ1Q+eVigLeZIST6pfsWJaRObC51LJa+0YOPzW0JCrABWllVFNST5IIxkiCjBrUSJ6fmqRLdNtUnOav2Tf3BHkLpUKMFeGwF1trKFObCiZKb0+aDtOSD2Qhyj9FNTDlln5fC2hvpwcPxra/rAgR55YGBEiv0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDBxCCeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JERjd1W/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDBxCCeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JERjd1W/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE11q2917098
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAXxwW20hTaXjkym2BKgDQnKa+6hryAXlCmzmNcVFEA=; b=cDBxCCeNEwLP6kIk
	5odYqr0BAzRDnBmahudUV0Kca4hnMCGgyo7REfltO3+IPq8+Wu1tSXR/28Kw/k37
	RfQNJtynMbVI8i6LNNlr846jPUYKhh98wGXHsVeANFqIJCogFocMB27G+8l3csDc
	kR2eU7/D08FEPszj2aF8HBF12oeFfn12uqtCbhgNdSWgcYM5CB+n5Fa6cv5GSvDV
	Z9fxdKYmOoQUvNAwN6Hz1jI2SlpgRsgzSDFUWaL03ivJUQkaKDRxHyJAP7gavFSC
	JHhOznQLxNoLqCz8gyA2bXgkF3pGQKDh49nuuB16NzOU0sTFJ1XT6FQ6i9kLYapg
	EFjpaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vm0nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:43:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930edae07a7so2648085a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893382; x=1785498182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAXxwW20hTaXjkym2BKgDQnKa+6hryAXlCmzmNcVFEA=;
        b=JERjd1W/Aftio6BAVGPNpe6Rw9xoyfr1XePzhK5DvgTomAXTyVW9IUAY8O4YR6Ngck
         nTdJdKyx2T7dX8vBldMcE4y7rzDDCWdQ3iLooGbbG7QhUaBf3Jvb4zVxdyXAbK24AfHM
         jIGwU8nlDXSKlzCNo2rnnsWq9i0rE/mDX22TZ60pZUDBSKFnpfqCEG67bjB15r60fYOQ
         cmMZ29GCWMkbEOcYHy9j9DKmBXe15kIHa8Y/ZCF4qfwxCWQydIGRSuQS6nrT2qlU5LgV
         97vIwq1ThIw/Mu/DN8LJYoJ7ABKhvIqeeJLg2E6OdblFmlKp+k51LlaCX9Z7yQWlIESK
         coPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893382; x=1785498182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAXxwW20hTaXjkym2BKgDQnKa+6hryAXlCmzmNcVFEA=;
        b=lgQyWgZW2M1kfmnsnQlpKpmdKPZLtzzBnY7dFWYWTYj3ZblYfRQE6/JnMh1kZjwKzG
         Tui2aIiutu3YQgJafKT1syJuL/ayyLF/wOg8Jw39i4RhjQyCJittUONUQbhtPG4XHxiA
         LGmBTXi5QVPDvMeD8AQ2i2vCQU6ACyKEurLXRaiOXPS198bOWSsYLyY1e7jl+0/iT0bE
         SrLGa3Ykw6urBrAq84IJ+2NVSHTFECf5PEuMFJRiuHV7IxemcVvvMWXFgAPZ4oIiyYKh
         lddvNhFDVRZVJggXM0GWQ+MotlRzbt9GkiD3cB1TcKtxOt+xpF+4RuGOCaxsBuOfMCsn
         zmBg==
X-Forwarded-Encrypted: i=1; AHgh+RroOOyHTu77qGKhtbxKaDniSL15hoXdrGdKUY8Y5vDvU7/NKNhpmzlRQrMcbZM83ZP2Fw1AsFORE4bs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1waiyxruiZ+9YG+TGZ+GnYAkaCRLPrilBzF7/KI8OVSfAJoR6
	r5ADMk1jgBX72d4UPW/aoFhuqVeF65KLr60DQA0KOkL/DSzw2UsMhoadBcPnpZMnZjSD7XODuwK
	KuypDpqn72PkACloUSRyRNkBB9s29n784fPILuVPHgdgphqauIpA7rIq74oTWD78f
X-Gm-Gg: AR+sD11C86j89EJ7vMm8aqyiUZ/H20j0FgSFyaL3Dse8aPwiaYcO/MgM7MXt6vzSJzV
	NoUIVKemeuQattqWdteJzC4cRQzJd8ViBzVIDYr0Z6jdiTrQweBNHdG+BxFNJ7gYkwjl+q/5isO
	E2ZOQGNp1nVt53wtutmF3VSSaPdkqnB/NXJvGcr1UXJDbgZzyidoVG7RlKrsBRLeZDLU0mNEKA6
	uWH+E5Qi0h7GRJnIzHJTwfPQV/GRYsdhena6kRF/jL4hgxYBI3DYB/AXc1hFNT476rVawpYS/nO
	iU/k2DQ+vNg3k2IQ25gDDipVfyJKnjZE5jsOK85aCrZYP19rjdTMQe3dCA1QBt/Mklz0Si4kRz7
	pywLOyDHjtsipOECNqjoL7xCr
X-Received: by 2002:a05:620a:8391:b0:930:a08c:cf9c with SMTP id af79cd13be357-9315b4b184dmr311128985a.2.1784893382194;
        Fri, 24 Jul 2026 04:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8391:b0:930:a08c:cf9c with SMTP id af79cd13be357-9315b4b184dmr311126685a.2.1784893381763;
        Fri, 24 Jul 2026 04:43:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13c96sm337903066b.62.2026.07.24.04.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:43:01 -0700 (PDT)
Message-ID: <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:42:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus
 frequency
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNiBTYWx0ZWRfX9bne6VTrPeXu
 Aly005oXTgE+7HuMb1zBXDGvMi+NmVNXA+NerKx233EIBevDyzPJF8gEozFsDhq4hdgsFK4u5l0
 oFgTcKT/4oAVJYugv3B4McAiUUq8yOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNiBTYWx0ZWRfX/lmx9J36lHL+
 cXK2Z79PV8OQU5vukCIyRBLUPBSnXdJFISr1afmfsENq6/eKn0wyfZ+4jxs9gL5UGv5SWmBYF+6
 NkOnBEKlmFoo754VeijdyQmNNI8WwKlPORwBS9OCR9i/bejU5U2APVKSh0XY2oHRmkMR8IcP68o
 pg76aFDrYmpdTjMSHsd+AFmr7CSAd8xTAWZfUL3Wx7S67QAdMNbJA5Xn8shPzWzhZAP7HfKYyAu
 RMso/TT7500LLeVjmt/SCXndY+RjSCxhjM+GkE6WL9ddFg5O8p3aKE6GoYcsIUOICqtTA6O8/hW
 Mnbcn1huBANcIwwNhmnqitag8JixqpAF6aZkdZOcVxnVfUMfx/4XWzNZUhyU58QuGb6UJSOHrLR
 BQv58x1iBymxqTxWlRXD1MsyLreK277S8AMo+A8kDH/Q8rQpo/5ydo1h0mOwOXGgYztYxn09pLe
 61JQ31GTDpZy4b79ySA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a634fc6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ijbrBXpPH2tVBiyNKBIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: N62Hpi7PFV5ft2KlcIModCVDiTKfZA3F
X-Proofpoint-ORIG-GUID: N62Hpi7PFV5ft2KlcIModCVDiTKfZA3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240106

On 7/23/26 1:48 PM, Hans de Goede wrote:
> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
> to 400 KHz which is a more reasonable default.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>


I guess this is a question of what's more common among client
devices. I assume you have some that aren't happy with 1 MHz?

Konrad
