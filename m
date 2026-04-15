Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC552282F1D
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244428; cv=none; b=L2LH1On/ar0uUb3KhHvEcwiXfKay233i+qXtCKABVipfjakXDpa+hcIlmc/yEDFcYpy8f4IhJk06I1ol79rsNn1bI0Gb9pEJDORV2Fq++Wg+Swgst+2wxd6/wKrT+x4GSym7bSUO/DH4msbugZtrXdTrYDYgpgDYtmlDIsdQ8o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244428; c=relaxed/simple;
	bh=r/O7WDHu+7Hjf4sfTvFsqvfbkW2FkvzsSfUMz87BE/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aoPcnBpDxiSg81kbhobiqg3YtXhaTXt1f9cOvQOExBjuEEG233KhXpMcygxkWYnuI+JLbQ4bkoY54OAqQPWapaESw2Sq0/3H23+qGCS+yB6ix/v8jVfuyI719VF6PJROVZc5ph8DHa8hWgFej+TmIKxzodKiJIuM5Fo9HrmCTDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+HsW7PF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/hQEGCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+HsW7PF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/hQEGCe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8XsWK2005529
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXOiB3jPp8yfWi2Yu2+DIylubqDPeEVQgwNRd85/Fmg=; b=T+HsW7PFSf31P7Kd
	7H5FxAZ4roJcrVTXuQQQUqR6gjGsS29xGNHjJWorGoVxRBF08JlAlWeoxkOhOSu0
	xw1XL28uBeyld5SNmo+YLwhgPCp1OnJkwmpHTrpuOrpHStXMkq9Re1z4V8LtiiUK
	epTLLTM3+FBi49ZNKGfU0wvNHfLiv5Srg90+RfV0vtE7xGM75hBvdiMdpa6UsY5a
	71WJRuw4eovFxOrugjQwzFESL2NwDG4ExeadCQ8ZwcZ1XOOJVoHkfj80onTQw22z
	R/1eAqRCDSfgDJ6HU4Wzi75h54sEnsGnGeUVQBu444uV9uNkq/5BZT4mOCRplW0g
	aoHuqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsju24q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:13:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso17243321cf.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244425; x=1776849225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXOiB3jPp8yfWi2Yu2+DIylubqDPeEVQgwNRd85/Fmg=;
        b=R/hQEGCeVAh88YplBBi+9mQtSakBGnHDW/AMiUkGJlLO1zhkat8FMasDmMtsTGsawn
         nIYsT0tnJfItzTB6vFIRZA6wdwMBU+olHXsc0rprS99sgNxJZD9Pm1fpEOLhdI8wRWvJ
         zoRWE+GXjjklqomNnauZy2/4SCQc+al39Jgtgvaoao2svrSIAzMdzPD0MTmtMz0DUXGX
         j6wwFZmBreOiiZXp2jjJ1JsWbY9irB4L5+spdCBFUFAqBArfkhIP2KhgwMArWuIFAu3v
         p3HrAyMaE8RFyZQMu3MHFX1TbHUByxrEAMP1qMjgx6KvGVEBY/wcgCanSOW/wkiS7rrh
         DlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244425; x=1776849225;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXOiB3jPp8yfWi2Yu2+DIylubqDPeEVQgwNRd85/Fmg=;
        b=reOWSf9YcVJFIZ2EnTfiyX5xOwVyBTe1QoFXvDpfh5U7fSHY6/wNG0aIZhn6f4utst
         eJmFv0EkEHbDLkW1u1YD5VaQiOMtabF2XELE1y0UnHay/YtEkCtESzfcyqCV4J3b0DCD
         jPq8a7e7LJ/1ze0JJe96RI4Bxq/H6XQ8T51W+7Rl4EFZiBxJLJ1qzBegLlxB0YYIVLkB
         TSWoagt9vnKsq0h3zXR4RYCqE/qhvfjG3l/8rdzk2UmrCS7RxlHgf512AHjnJlKwAZMA
         RXEvZrdUBod87CETsRF0l2iHjukwat888Z8/SilemPzdJGU0ZTHej1aKPDpuntFri+jK
         YdXw==
X-Forwarded-Encrypted: i=1; AFNElJ/zeIEyRkn2EzVmgXRX9JKNEplyU7hLe+2G79SXJHsMX/hnoRgeTComKKUiIgiklwkVf197LCDfHZi3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1GYHjlbgxgdhO4FlsCUNJrt+B3rfsOsSmQTwQ3cAq4s4vOsvi
	Pi14vKTE9hHLTyPn9+zX/+SM2VXklOWO+xxtOo4ZRWdVXuF6ahwQ4Qc0lzOdzIvcBx9WbGy4Q4T
	GV58AGNJKDIVOlNpqt6UUi5n7fc75WB85/GfqDNutbAz5ZRMEXnMEYWA69aaJzHxg
X-Gm-Gg: AeBDievc94F7fbWrPatoZOQZlgLfUFvJDWXC7MR9qG07suBSseNehcyjb+yajglg+qH
	fCuAuB+eD14ehbdx8W1BT6O6xzxa+KItwdwWWeePn+G23CBYSffZ9bhUQ7r6DVFAiPmnVDwRrpi
	2IFJhZZSXuiQrHFBT6w9OvRdwpG8xX7HrwKZFfaO8uO3iQ9NX3lhKQAQKRGv4A9TCGE8ywD+ZS2
	NGNBRMBNo7OEXOUDqLRJFwfYAnIeJDArBhQMh2FMcYZ03y7cor8okHoXaAs8RUxExdTiBYEmKLn
	0SefB0DDX/TkNdfSSbTSc6v/Oubl7pA9cEqZEEg47fijUB9oEfcZiBhOJCVlf+Fz7BuzcAIQNxj
	xGZUcluFf8PuJUq/bU8TST6ANeysKvFEsEDgzLjxJy8aMeKSL
X-Received: by 2002:ac8:5f51:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-50dd5b9aacdmr314899661cf.35.1776244424986;
        Wed, 15 Apr 2026 02:13:44 -0700 (PDT)
X-Received: by 2002:ac8:5f51:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-50dd5b9aacdmr314899341cf.35.1776244424483;
        Wed, 15 Apr 2026 02:13:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6e9sm3707325f8f.1.2026.04.15.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:13:43 -0700 (PDT)
Message-ID: <3edbf879-a202-4145-b1fc-1e34a5841839@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:13:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP
 PHYs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df56c9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GxPRKtRK2lFiV6y-FhkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: YkEIbnr-_j37mJYzD2wTuWdHsC7HorD2
X-Proofpoint-GUID: YkEIbnr-_j37mJYzD2wTuWdHsC7HorD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MyBTYWx0ZWRfX3lNI534LJbQa
 qm9u4O5kIHNxZCCS+PnOlUU29RrvYgIzk9SwBIIN0Nr/XcUhC008fLvn/TjceJVnCfylSxg8GMW
 7nvgL1+lgRvszZDlVWU7nM/ZkbljdRbjbocr6vpigoJ0mS/gT3hj5pUeGaOm9Za7YS7t62o7Ldw
 afZ5u2Nl/vSApnDTYYdsBbn1aUJGKzsZQ/XvsSnYUJuFF3bmXgnHQ2T9LhyGHTAK4oWWUeAT53a
 ZIdCKM19EaDoRA8jEw5+yr3Zm7EKj3okJrl6CPEgC2oH5QvQXCcBRWRxJF8EZzd7p5lN1QX9rNt
 R2WW+tszg0cR0LmENEPOXGczcf4NuvMSItWvT1g7tt3B3nIhB2YvzmoTYIALz9UldfjzFEODIUn
 qmyImPSxvU2nU9lS1BH96FdwIEwxVQBhPMM49SiOZwHFB1Bt4uM9swJcO0ABH2oFYrQiDxmo/Pu
 MzU93+ljueZCWmSjAEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150083

On 14/04/2026 19:05, Abel Vesa wrote:
> On Glymur, all QMP PHYs except the one used by USB SS0 take their
> reference clock from the TCSR clock controller. Since these TCSR clocks
> already derive from RPMH_CXO_CLK as their sole parent, there is no need
> to provide an extra `clkref` clock to the PHY nodes.
> 
> Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
> reference clocks instead.
> 
> This also fixes the devicetree schema validation, as the bindings do not
> allow a separate `clkref` clock.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/r/20260410145205.GA554754-robh@kernel.org/

Thanks for fixing this, appreciated.

Bjorn,
That's a fix for v7.1-rcX, so please consider it for the fixes for
current (v7.1) release.

Best regards,
Krzysztof
