Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC6379EE7
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120025; cv=none; b=XpB7+20ruEJVahS2Lfa/JrB3ZJ7TpEneCyqjrf5SAtGGZBsDvTtL29ccEexOJd95JLb6toSGLcnnJq+ibRrOxmRc8ct/QtXHByryklh3BJh+r9dw701Fn39fZyzm0sH8NCyJLqyhXN0gwm+mxj/wW/efYtYzgJuSP/DNlJU3rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120025; c=relaxed/simple;
	bh=/L/55QsQk5XVTOb0Mmu7Wa+Epr0aB+oMAJaJWmg20+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPQdo5+hJSmf44dWzO+7l/+siG/8XeN/NnOtzLiZfPV1nzQAM4mXykUIf0JO7ocz0uLoiZi+FCS23PCMGxHf8AdxR+9YsvLDf2NCicUGafe5tRXk3xaDw21B6TzCnBfExi9ZBjPLuOtH8VtLIE/O5Sg2IWLcXK4FVaUWNWa1CRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHEtuPpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWQWpcZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHEtuPpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWQWpcZj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328Rtld352289
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOfOsCa/8/cf56UDdjek7yVDNOhEZCTfTTjBxRk+G+Q=; b=kHEtuPpY1/HjnTnr
	D9KQQTMjCHsTBFjMSkV4NBJpLV9Ty6JqD9PlCLy+cHOsd17mJVFMO8ySvd3MFKnP
	B53Am1oW4pbX5zhddDno1YMPrCa8KZrdLWfqs7JnL6aNd/vzf+0Q7BcLJVKFpEXv
	BjzBg3GIbPHpyA+fq9E/ON3YHufzP5Kkt752sZqXYEoa4hIVWE0HRO18S585F9Lc
	HIE8Iopljmb3u6M8neZqIM0qvTLLBlI1ctCwoEhjbP+97iYESe7PnEKaHzAEN+eO
	nds+ZmgmG7JDgGRmXtI3ai2axyEX7t7Rf4Co0lNa1zAjvE11jUZRHqMG/7ooJekZ
	+99enA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8368-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:53:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so2696596d6.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120023; x=1775724823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOfOsCa/8/cf56UDdjek7yVDNOhEZCTfTTjBxRk+G+Q=;
        b=TWQWpcZj+DCLxu0vICQ/SrWDcYl1xf+6LNYnmX4cwUksJ40GEQkBpEetNv6Nxs5lNT
         RPFZEuk5Yle8iJDxYyZRP0xZPIbATl18wGnC1huhV+z9RZ/OyoL4eO5+iXlNVvNyxVhJ
         B/tYib8zd3FmbrLIIzPBrv7VY3NjXj5opeDz/EbQtUjSS722H7JkSIOoUJU/x36zDTVA
         nGKYeH47B8xiNW6ONagKusPaRCL+Ij4PzrN6flJlou2Hgyeq4Qr9aXoGrhHq1z3dWYeL
         72COdrVrmbsmai4RRdPs/QH8zVoAMsjb+uUm3p0o9fbvS+iaxiARSTXePDQo+sJ5ckKc
         RWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120023; x=1775724823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOfOsCa/8/cf56UDdjek7yVDNOhEZCTfTTjBxRk+G+Q=;
        b=lbMliGrZ7FDGbEpx2XO6QeBdqNu5vxgUmyhg6RwWFJnMC/jBYoJdb7JuGSczi8XOnn
         FUGV1FMUFoReoq1DgQKbeNeIB/EhqAvPoe+PEE/jbR8ki6c8DSEnyOlckJF62lerM0II
         kiFdUfRQnUeHVyo68gU0HLoluSYtfXAm6+m1jo2fIEIE8D4rqIQ0x/M+mkWSplqkpvFi
         H4E8agBhzdluOn1Llg71IpjjlovmO6FezWzn3xwDtQ5d9AbTzIkwEbxBm//wulNsS2xA
         J8g9bFE1l/Y/h8oBnU9jyzEPIWDmofBa/esWxappn5zfPlNMbemcul4V10+y99mj2QY7
         aj8A==
X-Forwarded-Encrypted: i=1; AJvYcCW7HXHZjz2f0Z1pGRkCYLqgVa79k99ohRp0XuXhhPzqkfyKqd2MCyDswnKvA//hnPvg+6kNeoT+lTyM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsyd8dKeN+hXBLm1+H7T9aIJIUdaPpueQiYgUJON8ayIMIpt4T
	XET3gABh4H1hRaATbhssqeHNYVeJcdAMbJu9xgGHBA8xMRymcjZRQwHcSyd4JMS7l+brBAKWRW1
	8w5gpq2U+MVz4onTvnkXsdBU6hfUiVUAmXbSB33eJoHSi47V24idq+55ScOepaJLZ
X-Gm-Gg: ATEYQzxxM9lcxxOczh9XPAQmtMNGxKn8StUlUyNBhQD2c2vq3jym7P/WEzrgvQM4x53
	rZSqLUVePimpuBPYb66Iet/JBCTQbeOqFKxZRqPpJy6GIgGAYwOPofTk9LWrnNppMH0IjC2fU4V
	kS1HDS0gvHF3aJkzKKWLe8LFHoXrzTB0dxXsiEFoK1yiA3tROuQtBqi8RSewpxj8yIDQ1ETKja0
	gUk55NRNvowOelYiPyeOfdFRuMeGcRHWY5uT8i+awEa5i8kM0WfSAFsJ4zsLL3jR1QP/TMUv6Nq
	hZucbpcsrd2mg8lMYLqRvcpbfNKDeUs3wRsnxgWlCgYhX1DTs2OMXpZGG0uRzBSO7ZHV3ZI/asr
	X0mDmdPfWol7jgZAf56ZK7b3VI0VqgcB+ibzHHh70SV67RQTGpdWabrxdjkztIDyuOTJ6hus/lo
	t11+I=
X-Received: by 2002:ad4:594f:0:b0:8a0:6b11:68f0 with SMTP id 6a1803df08f44-8a436f14bccmr70245006d6.2.1775120022877;
        Thu, 02 Apr 2026 01:53:42 -0700 (PDT)
X-Received: by 2002:ad4:594f:0:b0:8a0:6b11:68f0 with SMTP id 6a1803df08f44-8a436f14bccmr70244846d6.2.1775120022499;
        Thu, 02 Apr 2026 01:53:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99f80esm68895366b.18.2026.04.02.01.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:53:41 -0700 (PDT)
Message-ID: <b4fe49f2-b820-4049-8533-c6cd8b2127ba@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:53:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] ARM: dts: qcom: msm8960: Flatten I2C pinctrl state
 subnodes
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-2-9674cfc0b5a2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-2-9674cfc0b5a2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: idPW9ps9akCOqFzXJiMBH3-ZGhcrFIAu
X-Proofpoint-ORIG-GUID: idPW9ps9akCOqFzXJiMBH3-ZGhcrFIAu
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce2e97 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BR3Sq3niNDMq044gB-MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfX1Lv3GLYHJ2hT
 9dCpGVrMe0eYlX2E0jAe6eyqbbtVKIo9FKEWCCvcf/isQpDxVcOpmDXxNDRSk+R7C9rnr9iJRGx
 HYZshfjSM+DV0LoLL5v2ZhME3Bb0B8dsi2UM/vlcSPS8GIHUYjtb+m8qoyBzPqWdMq9rt9C+XXJ
 M+VXPZc5dpgtWN0TMzRBQtiICbmS9tr6LdYdcJNibDeoin4wpLRk/8Li8STgJNNN1wN+WHehm1o
 D+PU8MaIf0T/TYoMuw3kkmFFOgZ/O6zlQZFETvup7ZhKcg+nsz6IOatP82LF9SLYvsIxIObZnTZ
 dFB/b/hlQyPlxA2UDd234VhdYozfKvuRQfcdjcTgqiz2qO3hKJgUtbwjjHLiWLGFdYrPpEOety8
 bGjmYAo4KE6UO7AQRH+4Cz4tpkBdq8UABk2xVO+CVha+4JzXrS66Ex1itlIo1BLY8C+jiNqXTHK
 +BnqJE0zKx0dS5dkq3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020079

On 4/1/26 10:32 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Remove unnecessary inner i2c*-pins {} wrapper nodes from the I2C
> pinctrl state definitions. Properties are moved directly under the
> -state {} node, consistent with modern DT style.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


