Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2D03A784A
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883368; cv=none; b=t3k3CJpqUJrK9UiOsxvS1j0t74M4esWTi3fPZtQrA2hhb+ol4LxQriYONVPNL0iBNBgShfX6gb/eawMiBxPKfp0oyhR5jUaNAlm86qXpaFXiZkQliKO7s0Vg9ZYO1tsPBPNWS3MvDLAbXUVRyqjE8v2xifM5SdJCNJisK9QRpOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883368; c=relaxed/simple;
	bh=WWMgmc3pWDFzNjHpALplyGUoNQyFXAmFTY+nCYZD5pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsmgwH5hTO/dQZUyZZz7bkqZvrOmDiehguuh9hLNouuzGtRrB+BqN+PcNGTdMzIHHkUax/tVZpBYo1a7l+pCxBJUNb9mPW7NPb2kNQmZw0L6COzSvHU6DF444bM8JHDFloFetLXc1CR9meKNXIV1kppbqtK6GdU1VrsfqZsyRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqKKo+OZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzPi9fjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqKKo+OZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzPi9fjE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDAYxr175068
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSw8pxMBxC+u2l6NL9V+vstZrPiyUBzd9HC1eXyWNYY=; b=nqKKo+OZzUp56ecg
	B2EaiUda8xPEGteFnjLjQ3XhQ7MQYLe71yHd5c/3ZbVCDbHLe5sco0c0uNtIU0PW
	LdN6+sftHG5rNyynZUSjmSsZEx/57ucdB6hel8XocLUNfn5qwhS+SUjQpk+f3M4d
	vjf6Bc09tQaKh8p+F+UIIszmvZsLQyYSfHlkffiHK+53lO492zYlGJECyVEeQ60p
	XWcFIdySIEAJ4NHlmn9RtXLf1xxtyqTD5vr+zxPb1fCL/9hRpPFymoFxriesxmMI
	lZcTenuaE95TwZ+kxb//uHgyoMDxh90aAub68Zvz64Ik/MWH5HMUvEUmGvCMsodc
	IIGiAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evkvf4ceu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:36:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915732517cdso25176785a.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883366; x=1782488166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSw8pxMBxC+u2l6NL9V+vstZrPiyUBzd9HC1eXyWNYY=;
        b=ZzPi9fjEVjHbt/d70ZSgSFNKmbss2MKMm5L2bMoc+x4pjm4chT3jryvNmNLupo+utZ
         FGATyfnl2ghxRLAlrg4gdMoTEQeTzF/g48U7pBoPQN4RCt506ihY/7mOIxZjJZtvK5K5
         vkx7KrsHeJ5xmm4t/ErSzUiCkDTzbTKpFFIch/jos1u9zmGdn/rRN1P8ldhsTAnW8UoZ
         sU8myvjBEFYaezD+EviVZNRW860bYNxb/FwUhOzy5SC6FY1wiG5cgHK8hsc918esGuyy
         nDM1dDLlxWBDLj6eStbgjSWHbJ7EarDas52b9VyMJxgBrYzKnpUgv94Dj/32M7pQF02I
         ynHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883366; x=1782488166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSw8pxMBxC+u2l6NL9V+vstZrPiyUBzd9HC1eXyWNYY=;
        b=eTFJCdOFFebIXET5cAEnM1599UQ+R4RZDNy1S8STJuDc4I72GKrrTq+vMYlrYOU0zF
         lejMeJb8mZQGa3wsUAONT8lh3hGQ3zJKGzgcX6ElCS2w5VNZXzUnx1E3nFwUMsIX2n+Q
         tF7MJlYbXWy9URYEa3PcfqRbqwj9hTfsjGVagi9BQovW87zMFXJQXCqnf5vd9zAQEdHE
         AHL/mrzZvGYKic6kIxxgWbPeSaUbft+vIhlhPotg6w8MUhj8Pn2UjTZ4FzeDWWyys/4p
         e0gSpRC4R1sgxH6R39qmM4ol10zmSVHGvPiFFilq9jmQ2XoZv34M7w8rxHJ1J9tTLNBH
         8kTw==
X-Forwarded-Encrypted: i=1; AFNElJ/K9ZCRBZuxNawB/JCf0ajnurkALqqBQhHb17KG1kjX/4H04WZCDgh5e/+WmBO14vFHRna2Nb92lGwE@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0hpHF/AZuLYq9TGsQw+uJepUFW6aatLk0hbw4IjiKYze76wW
	5n0uZbq4boPnf6tcBpJbdWCg7lyyAdmEKSU7yVoSr6fjdj6fq0NOXyYC4pBnc6O67z0wte6UUGn
	wlFisb+1EUYkO3NfB4SbTVwIxu9IZK2IhyGq6DkQ9sU6lVKRXfSWLT5Km35wgjlUp
X-Gm-Gg: AfdE7cmHnk94+pVJwIqFRYR2bmZ7/f8gEjeDFoOVD9EA2kZNDJkdzqjPXem4spB8+fM
	g7TkYk1vST9X5EPeUIWC5v1GX/xj7bA/jKfsF6W4QKr1skLQaBhAxBwr0RzeslB9IXcbysr++KK
	zelkWFJtAodvXi/WLGAtRqhzaUQSVd35xJORyY7ZCm9hGVaQ4eJXsvpnmhZ35le2ENg0Z0Epipo
	5OyO5L7+sJmV5xnHdbyFswBFufhD8DkfOTb2mGFRfwuk9c1cYYRdX6s4yUSevGc9fct7Rr9YHh5
	WQqjHxsKXLHxhPg9XKCPrhJtORXw1pUCvK4w3PKz6bgPfBuvLhBZtI0NXxpkv0gruXqJ62btR1B
	MSePyvvUBkA6oLeQ0Em7sAb3UqUjs/8/3nkU=
X-Received: by 2002:a05:620a:2608:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9218389098amr123174585a.2.1781883365817;
        Fri, 19 Jun 2026 08:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9218389098amr123169585a.2.1781883365370;
        Fri, 19 Jun 2026 08:36:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9aa2712esm98621466b.58.2026.06.19.08.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:36:04 -0700 (PDT)
Message-ID: <90cc4922-857c-433d-b5d3-27eebe3e4b9b@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:36:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX1epQJTSu4Cfm
 Bx5vHXIRfQkIFlrm5e4zrfmitGEtzKTf61Zv96JqCH7XgfTIDa91HDTgaRwTKaPmUerURQB1IbD
 CJoaNpFRP2rmbyW/AFjSbNCNOBG4Inw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX9VicqXdUbCyF
 YZKXhpJwIKT8jmaGW7KmCyz5L4xuJsJIQB03G3nC0UGWiKPQiyhllajR1m28+vGWBQK9EzakZlb
 swe0rb7WtBnnii7R8WBNMRkzhANUAqIX6Nt5NXPMVFKdyWxbDgVBtPMR7KcLYl0tUWJORdzHfT7
 yPRj8c0h7p5sJliCXHe9W+b2PfmiBn+6+KYALMSbsrN1ZHsg1dwk4fNP2SPVnoDbnNefy6q+Nto
 VVM6TcP6d43o0RboCKkJVkg0vsPN5ZspVi7svKVTsxfPN3wwYXdDXEtzDVFO5Z7ThkAcKyQO2YF
 IGPKSfA09vlGk9yS8rczGxZakmemF3gZAGMy/UpS41KX6VcBRyZz38oFnhqTJIDzBvfR+0qtuOG
 gHa+j0LEWP3Lq8ANcdYRQuCoO9xq/Ed51mCZ5PB7blj0KJUdVIxhUtzL7FGVQjosGChJUbVa/bT
 4h69uDyusMX2wMfvRCg==
X-Authority-Analysis: v=2.4 cv=H/3rBeYi c=1 sm=1 tr=0 ts=6a3561e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Am5VatSTG-OmdDoZGaQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: JtL-X-918Nhe0M4O_L1btb2MMSdBlgCe
X-Proofpoint-GUID: JtL-X-918Nhe0M4O_L1btb2MMSdBlgCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147

On 5/8/26 10:36 AM, Hangxiang Ma wrote:
> Define pinctrl definitions to enable camera master clocks on Kaanapali.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
