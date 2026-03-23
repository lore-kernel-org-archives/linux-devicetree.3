Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3A1FE44A
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271153; cv=none; b=M7F6WCT9wXYTxwQN7MCJvfHTsFKb2YOQQDnNnza/Fql8Zmp4cuxsz3V00L3rL341Z8ByeS7DlY5oQdsY5HpiUYJmQSnqyx9Vq+qtr9T6yWgQLGNU04JbCzxfyBwo8BlPcW1PTW5rV6tL8KZamwx92id9sepXtr5cVK8/mMdzjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271153; c=relaxed/simple;
	bh=5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOLpDrEudRod1NjC6pNdxcyhdsZXnVHrOXu0VxbOxaMkhfo2lRqPQDCsytPZGtbyZ7+uRmVZmAe6EfWY9X1VuyjobBVZhaD32SCsf1VQ7328AOxhMQ3OWUY/SkUBTrL86LemGyUbSth+ypO7wtPdEb0bLSIf6kW3MRo/xMfVBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tn/r/259; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjUcV/u6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tn/r/259";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjUcV/u6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tn0N3468094
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=; b=Tn/r/259maIRFrrq
	fmuzi4F5zGM31cE4KEKnViiclPM+MhmYKFLeFuSE+1gspYs2zX/eHgOL3Te6N+GO
	b78KYq/UhFxStsarLkDjTM98z6s0UXPaIAvsXEuK8ZGxXXY8kvCGQVrms4HnqgEW
	ta+cx2fSFDSgiHoAhYurZXozr6rJDaKlQKuM9xp69BVO2tFXZbSD9gyhN6pbeiT6
	0VUvPt9NbyaA8/1ajI+EB5zYCkbIjJAlUybF4PRVahXsnkHHoQJ0P3TcArxD0ltF
	HEDfnv4zom5ZkUu2mdyXHnQhbg7BtIPD5l0DWEleOO2ApXdnJ1FHtrLMj1l9/H8w
	abT0xQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh2v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:05:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-951212cd970so613712241.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271150; x=1774875950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=;
        b=WjUcV/u6yzi7c5u/u7AjUh3FTYrNrADuE5GtzwJrk7Um77bpbZwQfAoILfsKUOo7/k
         PqbzJh8nK/l01CJBgQdTshduTFGpkd4xjD8g9AgAIak+dlMXf6SF9NywTffMY8lb1Crm
         H69zdF4bEY9JHXlnsMUhPfL7+VoZ3QbxD64bLCyPUAyDxwp7hXXLrU3l4fVYolKyEP+R
         ODiyYwKq8wcIhwBX2o4gG47cwcJ7LL6nQFhiz2UxwPtw4WjHbfEyYbWTKFI0aHEdvTEj
         I5qUMtyXhl80M9yoFJp05QCum3Urlo/MK7Ner6lFOYTM3b7lmv9mKtdQfp/KMvsEYevH
         YiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271150; x=1774875950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=;
        b=TURu+hzW7ULxYmxzRuGQwBsrKD5okOXyoStb1nTt2nGN3EJSXKdCQexw+ewSirxanF
         2Iw0YrQty+xA3OM6udGUseLwB/EpEefnaTEsRzoQ5eVI0U1hx9f9se6D21oNxQ5wyIyv
         CIxhnz9PlKX1/154rMiPSnOIP7FNLpKod8KDnJQ/ZDDJ6zt8Iw1yjHf2QygrXmL25ANn
         wdz9OAKco8lETnCbdLHPSzOvh82mma5yaMGyWqGxaykqMaMUL+C/YkLoa8L9MYsJK7Jy
         yD9o5W30aynInxJycPx8x5vfUAxNaL2wEKcjqxMdNmmM8wv3epPrvi6mkqteKwjp8Sqs
         tQuA==
X-Forwarded-Encrypted: i=1; AJvYcCU5rldfJ2UvYTaNPKfffnIpEnPvkvloMIyHRrvlKnCHxxCMohNDNXkh35lW4+F3eohzAMsaWJTcrWPb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl2wX+/VrULYfxOmq0QIhOch4+O0Xk5w/X0LHxLqiBR0def850
	oTE9qwexmZzMxYLKJTyXr7MDsIuyrFAuWz3pj7xLxdDUMqy8UOefAC3CGg7lx3Mn4WrD3UC7IY+
	kwT9YqUugaNxAfpGOlDyR1fkiTLNB52OUohXazWcxUzbR7IfwkF1rnrcC8awo4LBKrzQyt016
X-Gm-Gg: ATEYQzyNKbmnVvnNp5soogP9O4clU/ujD23l2aH29mCbGW1fBFSFN/qLdLuEqNNrxeJ
	8YB+iVh5KkWSEpz5TXjs6uq5AZwXxx97N2DxMR8+GqZxk+JaqgREbqbY2Dh29t5+7eg1mcxZcc4
	n9HFVx8+gi4iznsg2fzZxCFqrXSaM5r5MoUqMIW2q5WvW+WU+H+Hi6kv/dBkuP2X2OXf4va5Anu
	nindajzSjtYoYu3SCAoKCvDN3deQowYEA4uqawmhN6lVZpaTx+9WEy2EeOz17bY8RCoAUM9ylsO
	9B1ZEg6oVTuA5clGGgmMNYUPy4NhNN98ksb64zvZZRy9e6kus++/SYIjeDsA87lpB1+/lWjYmC0
	9zZMscRrMk1v0ZJOrdPTE7xZdCxCp2CVcPcirETvkQZCGia4nFO8zyhNjmOzIReraFgj3AD1HX3
	/JOUY=
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2016507e0c.0.1774271150438;
        Mon, 23 Mar 2026 06:05:50 -0700 (PDT)
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2016481e0c.0.1774271150017;
        Mon, 23 Mar 2026 06:05:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm483058866b.25.2026.03.23.06.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:05:49 -0700 (PDT)
Message-ID: <a1a1ad27-d4a7-432d-9b33-1169e379fba1@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:05:47 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
 <20260314023715.357512-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314023715.357512-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ht-0jdFVlqd1zZkJOqD8e-tdG69IsyUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX2+qBLvFtBlDN
 RFEyqHu8Q4NUemqDXdQikP50EFk3qf1tRYxDJFG4kpueYnD0W7W2DEGww7okyEeGFHCmYwmF+9D
 uszx/tuE4OxBjkj1ZIdtprTxSmQFaCBBIZ4hE6e4lGdnVlnkbZk726jDgt2JOzhXmZxmHLBy9Zs
 sm6TV1S5S2a0pBktNJ1b44IC1DRqiJceEd+FvIc+WQxpISwtRRmH+9VfXbgMR1nqYRxO2MFEFnF
 Xz4X17FoThxRzNsxtT4rxvRVMdnG0Jf0nOH1vv/ouOs+cvY6GNiJUd7IFiMrHTB3LIgVWwDHz6t
 lFxm+Y65zqlIkdoaXIFfxwkI42wO6rxeZchfsH/Ab9Zim3H/ASIYCX9tj7OqtBja+7YaMTiuy2o
 e3pxmch/VUhGNszdhyUQmc1Kb42w2KopTc3eaB/VoDdccOiAJ7qqzTw10pAxnqpZZfRv8hh1crR
 kO/weWK+KpHJKkY43iQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c13aaf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=okWnqFoet6UbQCsWwnsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Ht-0jdFVlqd1zZkJOqD8e-tdG69IsyUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100

On 3/14/26 3:37 AM, Vladimir Zapolskiy wrote:
> The restriction on UHS-I speed modes was added to all SM8550 platforms
> by copying it from SM8450 dtsi file, and due to the overclocking of SD
> cards it was an actually reproducible problem. Since the latter issue
> has been fixed, UHS-I speed modes are working fine on SM8550 boards,
> below is the test performed on SM8550-HDK:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I see a doc saying that DDR50 is not supported instead, and that it
should be reflected by the registers for SDC2 (but not for SDC4)

Konrad
