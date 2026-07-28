Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E123B3AA1B6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221201; cv=none; b=b8uU8rB77yL+1HaDI13JtK896NDuiTQ3rYb2Dw4DgERwQPT5IWHBP1K0dLW1tTIAjsiofR1uiIAVum9IVXG810nVBWWJquzcUppqys5ihhlvTOliJe//+f08LUUSvNzR0Kicb4t+pwo86rMBzon+RPCR4t0x4qZ3LuEQEkv73Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221201; c=relaxed/simple;
	bh=LnZIFP4KRs1Bkg+3+5TO+CUppho/ZxHsRv1im3UpGBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLmKXWTF0CPB8q+C8OjB2PFnTA/ema+0vciHXax3hEyV8wxnR1lBhU0VzG670aKSZhDVX02OBeHXwHJICksBoe7jHymaPuaIyVz00ifFtKoxzKOlnF8bpg9LiA0SyYulxks+N+8+bcrM6HjO+O0wgtLxwIfRHKKOD9lequmzJsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXmtjz6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uu3nMiwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXmtjz6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uu3nMiwR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3ac4c1527532
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUntKH//WDpyjjrkxEP54wDXZNI11wiNR5M6Q/uu5vQ=; b=bXmtjz6yXol3ZYix
	9lU/GxjtwWs/azO3uoFZpp2t9+kzE2VmlvKoW3PhmeNiyIMHJpzPtM0EGibFNhml
	4PlAN09eJU1tdFBaPs5PugRgGJpyOUK7WAx5H+drWnn8wekh6HaSe92nC0GQ7Hbn
	Mf2cH0J4ynLE4uxUbuFjG2F1NAttQ2z0halZ/XDKpFi0E1EmKrVTgnDugH9Ja2kC
	p92JtcE/8H8ICjcxv+FAipJH/BBuuYyuCYkWpa5TX3JG6/UigrTJ0MFC7nxqqf79
	0TLXfQ+GizE48oyAojUoCm64kWyPBkacuFg4glGSMVpzMvLUXa+LtxRkuO8tv9zY
	PB2/IQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8atst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:46:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4765625a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785221198; x=1785825998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUntKH//WDpyjjrkxEP54wDXZNI11wiNR5M6Q/uu5vQ=;
        b=Uu3nMiwREUxzupsbHlpFyV2leotWnk2eZAO7bqd/wcE6LcDU9oIY9LXiRJnb676H0h
         YOguqEQg6pf/F9CrP7Y54HqgOkN9s7mV2+DnJDgG8L/SYy/4O9FcEVjTS0hppUAQb7Nk
         HQ770sUZWrHmhs8JR2+3mxsEL09Nu/jjtlnJ9tL6A5WPmJ5OWCJo3LP+audcZpH9wSiG
         mkqeUF9y8xg26t4ppnbJV0sLm5fdXvr5vuYOTEjTGb/0es7ENUAawQKTYQbhC3nqkVCB
         P1qbbobTxIAplx+U84dAzU0OJrOUrDYmqptAaM75qIN3ZBDJwheDgtrtk/emO5CHM7s+
         mjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221198; x=1785825998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUntKH//WDpyjjrkxEP54wDXZNI11wiNR5M6Q/uu5vQ=;
        b=FVAs3XWErztQakSKzpaC2GlkentxS08aiQbN5H5xgrc3+PpF1lLZSDRChrrGYY8LaQ
         k3JlbYqfBz6vAmdd0u0UV58DBIz+kZ0trQk6vYgKBg85KNc8BBcP6ddS8ynno4PfuNqM
         jwwuJB+9w0gxrET9MxsSbuJZXqTBnKk3MtGkUxB23bKu18vnHEEDDb7CGAtfMFwjkefZ
         SejyQbH9m6C0L17zzkgbOBWhfappokFToIX0QDLOLca6n1lL+tqACrOO2B0ZEHhWPak8
         bw/fdldJip4uHn4OTfptxcNGvx2yX23NmUfPCc+Bxj9tMYzfBm2Q2xW851gm1pMrX2yu
         46/A==
X-Forwarded-Encrypted: i=1; AHgh+RrPcgJj0yL4/EbizqyDxuzry3PYXb6MuukIJ6ok7ny1Sefsh9J+W2KYhdPSktSrC2M0mYJegzsdYoc9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtiq6/UtoTfPkMsDtxghprPTZ+BBmyWoU/ALjZY9pfEZ+iDmsK
	X68bbtt6riFivkbDuEFXKaYR1n5q8fEF4nNCcjy27GwLvOpuS7YdzPsn3BBWKmhNxj3cUsqsTG3
	WKQ2j5sGezEglRFlv/bS1Vqs0ShSGAtzu3b3nXRAbASqQ7WGK9IZ2noSXJvBHToES
X-Gm-Gg: AR+sD13QfQhuHH2Jja2wsvs4bfmG8rJkX8smt/hWTzor1psPcQU+eoNb3A/IBQzofTb
	O6ZSmcr0kxUG6UtwtqAK3FWOvxTvg+CY9Bi686atYuFZtZ89yJLp7r/SH5ZYL/5WA2w45ONt5GE
	ny0yeY0+niCOfZkGrdkI+JfA3ji062GlpRhivYjgp2n36z9VR043RnaZnmiga7ffIu3YJR6wLni
	GOlp6OtAk+reJoVuFXgN+2xt+wkkhIExzoLi0Sj7mqPtSgvGomo/98Kv4gjHuAauCBeheoz0v9x
	sxXvbl2dd9cN03QyXF0Ih0gvKvrvcjPS4PnzC4TeVho4YoFIVmY8HYtaMSovmu5tSTlsZh0FRh2
	wcbtqtvpLNufx4I2RaQnME4Su302s
X-Received: by 2002:a05:6a20:6a2c:b0:3c3:853a:8d15 with SMTP id adf61e73a8af0-3c8ba5f539bmr1590958637.72.1785221197791;
        Mon, 27 Jul 2026 23:46:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a2c:b0:3c3:853a:8d15 with SMTP id adf61e73a8af0-3c8ba5f539bmr1590911637.72.1785221197224;
        Mon, 27 Jul 2026 23:46:37 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66c848asm4165498a12.22.2026.07.27.23.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:46:36 -0700 (PDT)
Message-ID: <d8ac3c2a-d9b5-46d9-b33d-d65010933361@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:16:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for camera clock controller on
 Maili
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
 <20260727-maili_camcc-v1-2-01dbd7ddb276@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260727-maili_camcc-v1-2-01dbd7ddb276@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1OSBTYWx0ZWRfX53j5vD18IqNm
 J0oBPryQJPSQxDFeHREltxT2HLPVXTQCpYeEoxiHoHB/U+tHz7wzTyiiwcyHzJUm7884//4yDrE
 UlaFLGQyoe69glflMQqlhBRDIuR4iU5zRncMKnwb39JfmSZLCdB0NUvIuMYLJmuW/iW0X/YU+Z8
 r/2Ee4rEua8YJK9Ayuwt57BjmO6hHSES7yF6I9SLeuGYSXS/qsE80yugNpS1sU7EnO4HztXGkyy
 TjozRBWeyr9/+DEZ1+rankLsi3ZXFt1Uxn/S7Bi0tXYl3SuoobIlgzK+w7wdTJB1SH8A8lMw36H
 QzJoXYNwV+IdhwzGeOe+HF562QvZtiNEp744Wtx/pTdiCCLbhKW72iyLiLDJDqOmMqdKUhukh4o
 BO+wL8j1KVjXxK709pjqMgdX0SxpPfVI/zlsAF1EfaqhkvtPRcw7EMg56qtrcMtnbaToO37oyGM
 HQBJjlBJi5D1wKNwRmA==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a68504e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0XqRBWWcr7USVrq_zZ0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ZjSc60qoiXfFMmCZGp6lqRbhVqddpNHb
X-Proofpoint-GUID: ZjSc60qoiXfFMmCZGp6lqRbhVqddpNHb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1OSBTYWx0ZWRfX/gsA7+tZElcF
 pqX/RPYd0dSo6AzuYwBRJoEjUJH2c/2S2ZBn/Wv8+8jhZv8n/ggS9KGB2jFEcBvFBf+CCaGIXTZ
 l370jP135Dr0dydEQfLSjsqQLEaQW7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280059



On 7/27/2026 11:59 PM, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-hawi.c | 158 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

