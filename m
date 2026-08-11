Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD04347520
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432844; cv=none; b=U4OG58C7bvDNI1qSYx+ltEFIMq44GZeQKAozsAmdiMJBmeeHNdu5Gpw2pZVI9RWAAKDVf+42bagEKVSQy1jzFSwiD6Lg1mxE3bQmGPzZQ/2HkhNNx2LzRlvpt8jzlAWxfv7pvZ+EqZn4HeTmzgrYiM61AtC3uZFFvqpn4iejz+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432844; c=relaxed/simple;
	bh=ELSWP/LCmlAJ6V8Ixl4FbFa1dksuv4fk3KIB6F4Xp8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUQn0YcqH1V4pZRgwL2ViTtDwA32sRofzJM+ozy2kwI6w1j5YhDa2zo16ny6IvUIwEY+SPmQowmVgyUrN802OBsXsvjplT7mSnNBxTsTvVRFgHBPDQcqNAsLooYQfDsU7rU5T9/XHwyttnouHRqG935BPPKSFp7G0LFEoqgbyOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BROfoEkF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rotc/W/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BROfoEkF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rotc/W/5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6uQxr2812342
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bFzyB6VISH0tii/qYJ6Oxsgbw5NSvam1B9Xihdt4yjo=; b=BROfoEkF4/NnP1tY
	s+bqslzXNAebJkvTSZot3aOoYdT4C1lX986TvcF7nOG44Dr3Trml3ctOHPLXXlnz
	H2Yi5EbMEatY6E+3/IHLT6JuCnT5UTshYrzE8X8EZ13u/EF2FXyx5+hup3rjX6i1
	ATprHoiXpyiDJbr0x6I6pdx/bPil6p/C41Qr+kq0eaKmc5g1EUTuV0pl8Cs5oCOq
	6ihU+HjC8DBdbuLlszqbRUk6ajn1d7Re8fIqeedogmrMA1KsPqJXBsAfpYFRSZVe
	Kjrr1AjsigLKNBsS01R1hcAFyXD2FybStFhl3sIYrjirs/IOv31adBpe/vWOP6/A
	ONK3dg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwer2v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:20:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so10047135ad.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786432840; x=1787037640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFzyB6VISH0tii/qYJ6Oxsgbw5NSvam1B9Xihdt4yjo=;
        b=Rotc/W/5XwlJlWY7TG5R7Zy3ijfWgISgMVffqw6jzYFGWX1X90ss/8noUCzaZh3LEk
         /5f2R7DPt6dD5uG4nXe4p0cF70/+InlQc0H91Mz0QNNGC3G0Fyg4lVC4DGUNILoCnbHh
         RFFktrtWxi+R8G/jwh6ZeyWRQSD4oxdCSKUyzw7H/a2thGSmAy1UFBB570/r2bwKXS3b
         FiV58S8njaNp5Nk8rY3PeYITeRSdTewthEwevcaGgeNFIs73Kl4+UZSgZAg+V88o89S6
         KPIKW3/ir3wPiob11QVd3deL1j4IAZGCwpCA/99TUw4XO6h275J3Cw86sWeiU0AYcJ6G
         yYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786432840; x=1787037640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFzyB6VISH0tii/qYJ6Oxsgbw5NSvam1B9Xihdt4yjo=;
        b=Z7upMJBRe/QBGUpYnb/T04apHGJTFqQFVrFLk4JNaW85BlFbruXqmw01KWcRf8WqH1
         8rQazMGO2cIw1wf2p1u8l15pOvkoiOCNglnmyO22wOD+m78fK52uZQYe5kXDXZsqXFcA
         UPxPkt29sc8SbLQi+JjgdCh2gdAtjMnLUudfqbiAWeIN52vOV0EpWB7TMQDTui+Y9iTm
         QJ0z/3yxCz0ePbAm47ORbR55G8IxZW3vydy1hJ+vQAwOs6lVPXewuWNcUBu7+03m7Nyc
         GicaLAuGlhegdURRiYnPkVivQzqW8lGrtVF7165ARjlA+Ig1cMWnEeWtS7OtOK/2KQ36
         07Hw==
X-Forwarded-Encrypted: i=1; AHgh+RrDlPRhibZz3VwsUZ9g5/i8+vP9pa4vH2hbS47rXz2HoO5s0B8BJgxAt/xtWAhJCzfoNaF4LAeiODYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuTgkEAgGWkVHaS4GNG4YrBrM4LPPpGLKit1lYhaAo+G2vBib
	UHPTxQuFZLDuBlo+YHpqhM/B3GZ9kIYQZhy1yLMdRPDjAcd4uTwJ5F1xf9x0+jHZPg1qKY4k+jY
	HfEsxRJXtYqMqA1qfKwuz8s4AlwHcrFDvethWbLtqBmYsgLd9ly9RBd8f6INnPVgec9VmKYFy
X-Gm-Gg: AR+sD132RIm+mye3PCbfVz72rjLOIZVouXQ5Bppnkifn1CgEJtLylFk+0kG6OlE6+8B
	m6+Vq6fDdKyaJNnWu80y54OyRBOh+6noQ4xnPRTAmLa2bQ2AeI1N+70RzU/bc9+WLKAguDAkW7/
	BSSyxyk8uebtHg5hju0KgJm1muCnXBYXi727pb70HZwWXl0gTOGMFuqrA4udYCXCGm6FpKEKJNL
	yVKQ7FrkyuQPNzb11AkCc8d7rLrtikYANR6Y1vbhU6Vs4kiulD4rwEZx6+XQCRfghaGDlUTl4lO
	eMsHlzPqyIGzn0kCMpaMFcFt54DQuweY2pfWO6tAmqVjtydSA+Mw4JPMEuYROeMBthPcpTjArQu
	5867nMLMfX/jt2IXti/by5pIMJrzocQuxLQ==
X-Received: by 2002:a17:903:390f:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d31760dc41mr19356185ad.0.1786432840224;
        Tue, 11 Aug 2026 00:20:40 -0700 (PDT)
X-Received: by 2002:a17:903:390f:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d31760dc41mr19355685ad.0.1786432839710;
        Tue, 11 Aug 2026 00:20:39 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160d3f3dsm2984455ad.54.2026.08.11.00.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:20:38 -0700 (PDT)
Message-ID: <add2ce94-14e1-43e1-8307-33770435b392@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 12:50:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZS_-KWI3RdJhnV9pFHx7ESrn5J8EhIL3
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7acd49 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ax5LA6XsPdTS7ErXUsIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ZS_-KWI3RdJhnV9pFHx7ESrn5J8EhIL3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1OSBTYWx0ZWRfX3Yft/rHQV7+x
 S5GscZLb0Wa270oSSzj/TDDlww7C5FwSjKgg342ZiM0yl328zEFqIbKye7KYT4EO/lxUdkwOhvk
 /WZVD8nwGUuQHhbrtzuOxn9a25AmGDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1OSBTYWx0ZWRfX7c76FYU5Px69
 DHyxrhufZGfl9LDhh832Ur8FiUD1F8uju82OvlFE3QeLP0AeQbrLlOUTrggna1gG06rMbt+ISoO
 2jr7Zsj4VsfPGpHMbrAaGHFcD7UaQctJgT5KBjIrobHxZdKtOx7hlUjmo1vk80MrQ093OSc+JAG
 Bn6SyMb6KmLwvtMl5QQQ8n6XuUw2+n3O8a9f39LFExbSgpVEsMj9CPC7xL6FvCN3VW9eg+Id9WW
 SuS0S8XDAs4dDTmkbRxP6hQYV3NJz6Jj2EpHeoyOQxogdlenfFWyaxld5vKtRupWXhSg7Krkn1Y
 McbCOGYnlpH1qrHRRlSzS+apVFUOIYC+7N6H1MzAGqWB7SBtCEImnCtlMY2mCZSvoSjL/nKfP/d
 68W8plBK43Wp3V92QLl99WbOXJzKZ0kBAYC+QI12mJuv6Xb9v/ULP20MG2GJEZYArsr1XRCaU+G
 y0kcnnBVXXsn1yXAcBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110059



On 8/9/2026 12:57 PM, Hardeep Sharma wrote:
> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> hardware.
> 
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART, so this assumption no longer holds.
> 
> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Acked-by : Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
