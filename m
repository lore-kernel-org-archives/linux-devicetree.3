Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8B2ECE91
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143258; cv=none; b=VbqjtURjnB99U69Wh1/O1E/HzCFJgmxWjE0yGxnfdq0rx0TzpDTShckaOrLkY7Atx3fFSvg8S3Z7MXCzJGWqNKf3FnLgtnVcvZsOfLHJ2yRvbkewf9a0B6NC6sC/2p/kniSjspT4RBRBaSfi+d3JbchBg7+m4afOAnvP9KliR84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143258; c=relaxed/simple;
	bh=BJ88p+IzCzNha1tDwG417+NNpmi0uZF4T41FRXvpNg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blqMsXXTKsPw2iFr6SY2FmQyKL1VlC7l8jXopy7OtTHsaf3qKa6lFVnjoMU+W1wLs3GgXtNFsdwe9IAVrzBqSOpEvJ0zWKnDtyFRUYczbOetV4bSPWzf2X9ky+gRFcmi8P8lQSyaRGxcuyrWBFCN7NTzqU4Y5rB4xwKEutfNf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgI5ZNv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVxMv2Ro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgI5ZNv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVxMv2Ro"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8MNx4182059
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPfhenjr0jTe4gVrj9RX3CWfcmAE+aHeWczXIIi0tHY=; b=lgI5ZNv9g0mN+rhH
	cnvqx3aC7V9lT4LqLwBdHXeQRYsaRNR+N4cOmW+CwyjH9ZAdw5S54RfygymGMi4d
	62EhGchTj3i5j+erEmIPxGug+RdZi3k0B7tAHMJruRXsuwXMuxRXi3X2otmLvFCg
	186qpmXiVQeaCGsFlFk7euU98jOxMmH6w5ow+zF0ZMJSnbJLyyLovQVvyojUoIbE
	hcVZkC4+r6t1e8B81xPLrspEz+BsXeizFUvVWLDjjb3OSiuiUT7GoMWEBrgIjYY/
	+gWrzLboz6CNm0l0H9AyTvbLH8ccRde4EJzwCOLHGBybUkQkP/oe5R0OYD/a9shv
	ySb7Cw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb73n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:40:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so3290661cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143254; x=1787748054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPfhenjr0jTe4gVrj9RX3CWfcmAE+aHeWczXIIi0tHY=;
        b=TVxMv2Ro0MWJ/kcRtyi/r29T4ONgxct4in7f+lCUHaEYFWh5wxpZetdwL7ct+AQbfb
         kPPnFjr22NpdPdysdxQVE/Ahux1JVUbS6GhENklM9/Z02HwKmZslkItekrPZf26hAi1D
         BoAcPuFH/rdiCSkjFI/6WB4Tr5xpIJrGekEAxrD0Q/NEutiSxwEjODHAsXKSH8TvxL16
         3Wgc25lM+G+5gJpU1aSjNtUxV3CnJkPrWpvMAnvAguDevbA64/xnsT4OMyGNs/Xv8rFL
         XK6lqZ48esaTNW2z1faAyNLMhSjPeqraLpeGIJHKe4MBeK3NrauAQOV5P0ZM08RgyhbV
         DPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143254; x=1787748054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPfhenjr0jTe4gVrj9RX3CWfcmAE+aHeWczXIIi0tHY=;
        b=V+GitwZMuoAnzsV/b1mM16vhH6pzeNgZsFiOn5BK6hi30R5/Y1DvEWuJ6OLKoUlqh0
         DBPM0UEkOq+WrNjgedowvCDSwsHePtc+weSGaopsOtZN3jR6i9IuluNsHhgj/QP8dNWp
         GWl8ieuO/71nTvkqd4KnCoFomIFINXnMLCh9lVE5AIdZibUusmdDOv/AJsRLMTDJGFcV
         Z+WkptJ3gjfD4YXaS4OHBo4gmqx35icYuGFGUksDgpz27IKgjNQ9AWgUxbA15p0Xdlib
         EqaDs0eCnAhqZcQDiScoe1CqHzdQ6OZJrLqo6qEL09YbRqUBt0BydZNB5wiP7n2N++d+
         bPSg==
X-Forwarded-Encrypted: i=1; AHgh+RqYlhyxwrbSJ/meGk48QUDqYrLeVftsAIA1S1rcNJBToDSbMv95AOxpvHrrCHMxijaFbdhqlOE7JUrr@vger.kernel.org
X-Gm-Message-State: AOJu0YyVByEwy6R7dlaY3jojFyt/0z/ZNkwkNKGCI4NOu7Lf9iJ+npYk
	N570PkZb6u2YDb1TtwP6IKJzV0ln+DF1rp0h6DJues/s5bj/TdIyKSna4oXNDPNbVXxPB/wr9uX
	iFCLmsMWiwBIPU2MxIqFWoP0SKD3Ayu1bJzSOK5D/oLMiQeibeMLkXM9t9IiJBmwZ
X-Gm-Gg: AR+sD12FaIV1lGDBV4rCbs5Du3TNGV95tT6bGrrndDy1nPu2tC0SY7foqyzKXxDJuCm
	p/oPEX9zPTEwhJUJfgsvn+LTJxwZUf/ltGAYPflRKOo9THq9mqAC1ifr7m9+yYk8RAUBDCOYOMJ
	ZEhPJPzAa9zn/9cqyVK4DgpKoYgusHn2BWDJKEJAw8z4h5t11wPACd8g+3+dymJ8avsZfH7RMxT
	T8lu78Lv7Kbvb0NZ9erYpNgQp8xBbSGyFFlREYNjjfRVNr2gMIOYp+cFLSugkN7m8BDVvm8G/ss
	2mEmu7wEPvvQNpFmd0N1gyrQ2Csjqo+vbBJxBxfp2qQ8bRFe9DLh62phM3T4LZ4EGxwwFMeGRCE
	fxLQIanXmx8jtno33GpQu4t5c
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr28334211cf.4.1787143254517;
        Wed, 19 Aug 2026 05:40:54 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr28333821cf.4.1787143254023;
        Wed, 19 Aug 2026 05:40:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7abd4esm69233566b.18.2026.08.19.05.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:40:53 -0700 (PDT)
Message-ID: <c499cb65-aa3f-4843-b47d-5a7e7dd38911@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:40:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO
 bus
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
 <20260814-qcom_ipq5018_mdio_pinctrl-v2-1-ff90d6605d61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-1-ff90d6605d61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rj0fXVrZ62p_cZwax5kdXGx5AHS1e3dv
X-Proofpoint-ORIG-GUID: rj0fXVrZ62p_cZwax5kdXGx5AHS1e3dv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX3YvM+KnVdftw
 xjrzwSiNK/O3hxKOeVkPmM84C8Pb02QU4pZvf1kGre25eK52Crmcwmkfr/3CIqxbWl9OMGxBMZT
 b45YmkUsmQ5k/oUXyyVO5xWkpPh/m+nFkkB5m6b+53wsnLoFdiawrUbIX1280hn1GRI2nTeP7FD
 pAh7bXNwx1z9lKouW9AHfzqq7GRBcAZ78QW3P1D5AZorU2RwLt/Oh6mzfAQpD3JKTdyS1orUOC2
 WCvmgWqNOx5RSFXLmMGELKPa7hj32A7iIkDiNc9YtAFxB3UsbPPxaCRQKNkpIBsONOAukMhPKgI
 r54w5LmA1cTt0rWJqWQaiA8WdEBZ7h+LCzcILXE+lFjnENZB9Yi9QHpAt2ZT/+9KoOA7wt4QcYC
 jmD8qfeS6TI5sPMpBDIZST3kmaWkq2ze3p/YUIFqtBih9Dac+OkJ2AkNEk480gxjYiIQ+2rguTn
 voiHlt9ABtzy0JVvyyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX+Lz/I8e1yJ3y
 JJnRuX0Y2tEmhPyCiBHscyu/8rEUuC/4+Mm370zy2m2+lldzImp8q11cxEj8TGDPQ5mfyP1SL6Q
 Bn3dgF+YAZiO6ro6BGf3LZF3JHuoutM=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85a457 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4FRrygT47P656_Zvv6IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190098

On 8/14/26 4:22 PM, Luo Jie wrote:
> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> TLMM pinctrl; without this the pins are left in their default state and
> the bus does not function on boards that enable it.
> 
> The MDIO pin configuration is identical across all IPQ5018 RDP boards,
> so add it to the shared SoC dtsi.
> 
> Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
> 8mA drive strength and pull-up, and reference it from the mdio1 node
> via pinctrl-0/pinctrl-names.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
