Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6A36C59E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511303; cv=none; b=YVdBA44B5kM1OdJo6igAuPacOW5VKZTlbpNTyYk+Rfgyb8x8A+rLa7tjWWBko/m4f4VAwd+Zq7fKu9WwxP8mzTP4Jhp/zDPt+6mTYzliOXxu/V11G1r9RwLxkSCEKVwpgbNtOd7Ocq25PaDKHQ8+jcjueH4TeUsdm2TPytaGHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511303; c=relaxed/simple;
	bh=DKaMiz51hJSN5aBtvjZDxlx4cjM4O3lcKCLkFqBCN9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjMDBOV5xvvB2uPKg+2bK35TlyejlJ5aCCABiwQv4mv2MgoC1ZNX5dwD8j+oP21yLH7jCzIMc4SGGv7C4WA1RlLl3dCoh5CzC3sgS8BbJQ2zXuRRripvjQd2UUBHYDy4eMC6jcOghiqgxkPxBMe+TD8lVEEzHdF0DubBRQUDiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jChbQOBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cw7bdkml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jChbQOBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cw7bdkml"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSjxi2659204
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pa/U1NVCyyJ+akFY8ZxD/81CpAOw6SBbllI/G7eXaPQ=; b=jChbQOBbdMTp/Bf1
	IuoT71KEAZhHLAl9mJl51NoL2KA+RY6JZSDSzA1GB+TqP0w7MVKrGOJ4uhlHqYh7
	6ipvijxd3p5LDZBOtTkpiVyNK2mz6/ETfe9F9u+TGWzGzx+yXmIeDJYze98p4UHe
	NwdaA2EqNOkOfhhXzzMZlODLWKUm544cogaeZnVLTXwmMJWhjdfDomPVpMk+TdF7
	0Z6BxExPhq6SbgalQez/Uccd/YMAo63wCsVqPMkljuOrIoOODn9bIQXJ/k6eVDJH
	Q46Ih40TxKeg7W+9IPtEo0Pt1aCXdhooa4qUfjrJF+w3RonrrUJn+ZU8FfGNWMYA
	Hz7QZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv146q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:48:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f27f49bso60132085a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783511297; x=1784116097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa/U1NVCyyJ+akFY8ZxD/81CpAOw6SBbllI/G7eXaPQ=;
        b=Cw7bdkmlw+6vrghffY1Gfs7UB9M56xfPqETL+Sr41/xaEBAmYElhE6UVZn/RHNgI5H
         ++y/FUz9wDubyuK50RzXuXlMcW2lLbW6eu7VYddKsGXXr7EcPu0kLQLRtNnfvYjOTRQ2
         RyzgZDQ77GU0/PEcUwx1kbMVGUxDUMKWkreEAOi3BzR1Ghc4YSJfzluMnZk+WuLpGcp3
         tDD9a+vvwh3CevaF1sPtH5bsvLI4SOLrHyPftD0Bns8PI29ju72M+UIJUG9lYF7QBq3o
         CqkEmPS9sFAuNyJhEwvvQPCz9BeLLyxovt0T9UUv/GTxWfa9sJMV+Ju9dtvMUJytE1O0
         ivmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511297; x=1784116097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pa/U1NVCyyJ+akFY8ZxD/81CpAOw6SBbllI/G7eXaPQ=;
        b=OT8d45DhRSY4Zg/MnB9PQP+ozfzQQHIA9FvpU9CX/8N4mID1qVJwufQ1wbbzGogQCx
         sIzdJ7vtwFoRADUNaOsgjaM2OqXJQboA20RM+0gg5hfrysrSRWBMacSvBzrhNgGSKpa6
         ApoXVPc0FrFIPkHfE36QvRLa572fQEzHox8zmQiJht3c6Av8q/we3l0rLYMYal8IsUll
         gzqbT/u/qGi0NTRcP4ngbTFT+dLIhmplyf0F7gJirAhn6XPOWzgE2i7m3AMVZij6xG6b
         5GOzdBdr83FCDTD7tpDgF65npEGT1g0WwLaA7baUCapavMK/o8RHTGewK61bYBUiP+vs
         0ejg==
X-Forwarded-Encrypted: i=1; AHgh+RparsZUHouzg7Af0yAUYJM4Z0jtH4zD0D78dsfUkBHuAtTv//cMm9T4th7DYnK+Z5q/1ol+zWMD9hxM@vger.kernel.org
X-Gm-Message-State: AOJu0YyNs9xY+igN6P3M8c/CQpewWFZky5eg0pUGMlqPvw7/ME22gGdJ
	j4agwp+8mRUf41yMitnzloMyI0vMP5nNea7YUOkCrosSyMoo7E2mFINDcjgS1iJIfDbxn6mlFfX
	2wM5YHzsM4nu3OWnYXtZs9dADh/Nw1YaJ2pBdv8OtOT37GUUd0HrQcrbhfXoFLXIv
X-Gm-Gg: AfdE7cksYS++5jrU/1+0PDwMwr/52R+6uoWdenmXuH8TmLAshFJPJhsHZZ+yqPlDGnX
	WA4NURw+DIuyrKkB2fspXqT1pAxAO3LTEiZwqiHV5WNbSEaBoUS2pcLzJozPwxeG2UYxzaSzK6n
	2NF4+9qeI77x7jSwzDiEvwmCGl7nbt6VqoY/1ATFlpBwXUgyk/mM0HKLlp1VPLD4eb2G09pO2yw
	oFMWPdhspuYVnJ73WhnpVOb2gSOTW0GTHI2d0zzmnBaH8GEZ6bgP/BYpPHThvbsZFyHuRspaGAg
	D9Ru5swU2VVOSq3qP6xPzCDgnNcK2UE8oLwb4KWSoS01oZ9nHGGWqGbsWlfjBnsacaT/ILcvyZl
	p2bA2SZO9usCj8Ur0nNQr7VjT6XECv/I5s083Hw==
X-Received: by 2002:a05:622a:1312:b0:51c:7b13:62f9 with SMTP id d75a77b69052e-51c8b439112mr23122081cf.79.1783511297085;
        Wed, 08 Jul 2026 04:48:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1312:b0:51c:7b13:62f9 with SMTP id d75a77b69052e-51c8b439112mr23121741cf.79.1783511296654;
        Wed, 08 Jul 2026 04:48:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6d02:5f1c:554:8e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm43390968f8f.25.2026.07.08.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:48:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: (subset) [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle state
Date: Wed,  8 Jul 2026 13:48:14 +0200
Message-ID: <178351128411.15863.15352829199730625357.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e3902 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3rgbGgh808wYF3KoWbcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX8kQFhStZkFEA
 AIM2791d3KyRw/DCsSwfFODTWIxG86J8I43aNhFRIDImOsFtjMCQ1A2OxQlF1QooWcPD/oLAA9f
 X62UPzl0Jc6c3xIfptzrs1LHtzTbyG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfXwEgBajiMEp3f
 GZkn4r+B6u+kjhcYZynxVA/q5xhRASxaW/uQZUniOCZFNEm2CjygNB5gnzSNgIf4gRpsHjwDX+u
 WMLAg8qWF78ZBaLQ0Uo+wWacJBkwQYNbPa8wl1uGv34Qwv+wpQ0OANfK4USiA3uhoogMkvuKdMV
 UNhoRFoFhMu3AIHr9XYivE7tDMpkLd3kmTFrmCUxP9qdDrXffC94GeEdHbTk2JwnNCt2+AJi0JT
 N9d+c70owYEshNBxHUnMC4Lk1J0wB5noH5boPD4cdRzvDDVXgBDD7z5aD1mU82GCD7dSblTsmAS
 qlWDneW6UgE9r4S8sZbEA5B8d0KzAtDw5K5Kmv+cwRf0TA6XHPdiqGS/cWHeCN9L/0uFFqWrVmx
 ZXbL74pRKKPV4Q+Mg3RYbB1VKycZ/EWWfLzifSpK6JXIKBx3GC6Oj2SOEPTb0WAEUgHc5K3ErmZ
 sbKVGRRNkjQX+Io+ALw==
X-Proofpoint-ORIG-GUID: 6crT1HxTzUpHmS-Er1oUmlHJEYEYSSIV
X-Proofpoint-GUID: 6crT1HxTzUpHmS-Er1oUmlHJEYEYSSIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115


On Tue, 07 Jul 2026 14:51:32 +0530, Maulik Shah wrote:
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
> 
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
> 
> [...]

Applied, thanks!

[5/7] pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
      https://git.kernel.org/brgl/c/f790ea0b699d95d18572979b1bc1673d8f31eb3c
[6/7] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      https://git.kernel.org/brgl/c/77fbc756d9cbe53a9496cb2c53ae209d37d5af2d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
