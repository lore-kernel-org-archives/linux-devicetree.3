Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664608;
	b=lz+8IKaK06225RkAVtHxNkP/umFyPJmmLyn26zXf1CxYn/6FHyz1YdhkvPuZvAzJtvUE
	 9FdQUiaX2AwiDtzKYexCOUac8H3BWvp6c60Dso8inRBEqx+6e0BIaVIRNorE8o5PEIHRI
	 FHIh6xMx6rn/QnLuiJ4ALpOKC3xPfOgB1kCe2r77ShIvFgYRPU9/cEZ/sH27weTzCbQ5o
	 nrXNcteLa//XSbb1Nb2lnajMgUJsKhYPxsOb6EXKQOs6twqAENxnsNiKOcoVj9B0MeNTC
	 Yq3Xn95cZhWMFZ+d1MC/gpyzDOaZAcdx+CojHmzYh+ARyPSC6VRhx5CnvYGTei1d2WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pGYyhXlCEL/PBQH/J17c0m66WKJUFcjV6wWzb2IXuNw=;
	b=XT9kmgBfbUWBl4hqxo1+uKqO6lV0rE9W0CGiWEiMHc698AG5Fw0/g9rMUHvaS3p3RSz8
	 oAGeJKKDmV4qOgaYTCvIR+Z6RHSYLSt7/ONzc6xpzeQNpccE+ts8qJZRm+CukfR3IWUBo
	 ulaSvNnbNRQm9GO0csnFioHSzzDthKOZ3ssoZobkPynG4U3JG0GcXDD3O/6G2LzaGOCpx
	 rqNz5uRGc70oMIFXrHokWbuZDcj2Wne7oGVWI+4YktMaLsPYpK69Gj2RtXNxEoYhAUdYQ
	 UyvSS7K5oIJxDv7cQDU+y4PR7GvNNlMfEYZfEJKThFLIRhpjGcK6gZYOdHCqHm0U6VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XH6n3qga;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ez/CnMcx";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3D606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XH6n3qga;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ez/CnMcx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xqmp3478830
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pGYyhXlCEL/PBQH/J17c0m66
	WKJUFcjV6wWzb2IXuNw=; b=XH6n3qga0xg+T4SdAix78S4uUpN6hQSXVdbepVWk
	L9bspiit0w2wWah/iTmVG6PD50N1zy4ccjnrH8roTwIceDI1+M+D8hZrPMhFTci5
	CmEzWh1C/j1xRqK+f+EOhMfclim4WT5wD0pBZaO/ubHutwPK2hy/wO9uMfuassWz
	z1hCrlN+0JYQdRjqfFphmb1JueLWJ/Lu28QBpft63QEIhMAYOPy9xMNs+YHJE2Y1
	JLux/5iS42fxKV/orkCUAQxpFhS+0sOcezTMABWKyyTkHfGGbhFt0hYymf0Cdmsy
	VEcVQgjL8bK85w4YKHyMh2ZnErbLArDEPJ8eKHQ5Arkfbg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a2014-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:23:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso408513585a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664606; x=1793269406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGYyhXlCEL/PBQH/J17c0m66WKJUFcjV6wWzb2IXuNw=;
        b=ez/CnMcx9kZiHkVs1YM439nOhFPTw2RckIB1NRNOeIX9sRUIJSgHa8kRQobizylCWF
         Lu53Yetu53wAIIMMtDIWShgiCkIIKiNrob8mOWjckx8E7xGHe3INh9xf8oBfrixXWLiw
         tmWvPbJ8GzL4VL7CTQfc0Nzj16UKH9iBZbVmJf9xIhQYyAJUrRLO+O8ygwme0L2EpGi8
         MwiSCBSGF7RD6s6oMnLFD/lf+SdBy7f1KUfH7q7U4YiRq3LU2UeSE+DzmuhjyZ9tIkX9
         hQheNx2F/aUsrQZlBR4bkSgNM/x9JafgkvyVNkWtEu2hYbkvEo+xVbWDL708OH+gI18P
         Eemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664606; x=1793269406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGYyhXlCEL/PBQH/J17c0m66WKJUFcjV6wWzb2IXuNw=;
        b=dlRX46K5yG5AdSW9k+EnoHdHEjP8gOd02AlLV43F2LHccvoEt92xtawrWHmkQBeI+b
         822xq9JB1brHG2Ipb2z8PikrLA0gFRTrjlIPWvfylECHTZbBB5DmFn/y6zLlEL0ZICvg
         BFaNEop8epQP1uJGVcDXtu0xDcoKCOuikcwCMWuET1vUOA6H3mVEMbOAbnqj+1fXlyie
         tEYam5LbhToOthQmf71xCGKH1x3XI2MaghsyVtyIteFOqMP25QioyCdC0+aF/HrcC5RD
         5/lpDy7jm2j8AGdeKisragrN53xbOG0JOI6IN6AulVARftHoXIaKPkYfukAcAiSScGFO
         ciww==
X-Forwarded-Encrypted: i=1; AKwUvBxIBfCM0ycgDiDcEsbrYVG94VuYtFrsy44LdmtH1sLUBvRjmaMcEjLgyuWZJ9y4Fg3jzrbYBYeYsXa+@vger.kernel.org
X-Gm-Message-State: AFq9FYKvBSuFsFrMJI0kdzgp5SGOJUS+4xv8hRmg3jLDE7qjmMUmsEAi
	y4uMDdqWjx/MKCMvg5kxBDPu/odQof4LarJxPqbnzjHmnb57U/Z2gDl36r8fimirvYxWMw7qwXd
	A8m4yCTCP0/jTLuq7abdnQDjnxOdJgKfcYkUcisOHr5IKQt/5ps+UmS3OqaVkWi4n
X-Gm-Gg: AYBFou1U9wBEcnS/HFyyXnHcQNjHwC/243PKT000wOw0yPgLFcxPJj7agiw7noT6c4X
	JC5Ja5X30kcmjTFbwmbtbmJ7YNypfwt2EleA6Yfil4EpGds5ZikHX3JUyS/PXrDluZnj3x4/DEf
	J5oS5m1121+dVnECkkKrtuqIuo/8HLmE//ERwSaDeOXUElEPt9+mXGDP65qDF7wDPZegCK0rQrU
	rmHTo20X9GjTFeCuUqPPxL27nbr/MRPAHTPWiY4w5lwEvCjrPwZUfzFZ3YLmdAS4PQKyzIXAdLR
	CltTU9j6OVvZz88wTxp8aaoV/ihNsoRCg8iIr+BH7JC+idLPijOtvPDG9HNb4zO4stZscP9tUps
	8CZehnL211PsKotvPCEnawOeeXtxLtfGoBTJVwC/vwSF/eX91jXOnHsIu9OiRSWicG2RCNfW+Pj
	ADN2PZ1UnG2yfb
X-Received: by 2002:a05:620a:3704:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-93f57e65970mr877493385a.5.1792664606180;
        Thu, 22 Oct 2026 03:23:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-93f57e65970mr877490085a.5.1792664605646;
        Thu, 22 Oct 2026 03:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa48f1698sm600274e87.7.2026.10.22.03.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:23:23 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Message-ID: <33hfl4oebtpyefi76pidrjvf37gszukkoj6xkgbm5rb764fzwp@3agawgosevoc>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXxKwrvGkyozIZ
 Hfnj1QC6gVZousq63pkjJbly/F67OZ6J5K/Ksw/3ijuXy8ZO1GdByvNeZi6PDxIwEIk8/qzx7kz
 vyLivXFjxFqEpijGkWKzvAeFqCqJ+B7cHApXM85fE2qbL5CorI0hNjoLlYpzF3QtEF12MlZOnTb
 QcX9jfjkcUIcSV0aM/qgYnCxlhFHIAZWLgopr4ATdvwhNcihB4xe3BfviYF1RseTuEkT9vHeHPV
 4Aq36magpH+MJklov51dlsovcOoSJqngZJhJQpot6+2wEBxWVZ1i3jTajMFReYSLlIlKDTCVn25
 1O8xVS72KePC3X1Yugq0dd2FDQHb9IEn6zKRHIPaHXSNMo3OQxmlEjsi4x6q1IEuTGI3qX9zP/R
 qIoqSr2F7mg0mHnAVaGex2+beYPZPNlOPwu4GgMqiSO7FGh/exF+9HvWcLfW06AYK+GgmyI3Kug
 cLcwNtXxzVYd6fzRt7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXyIUAbkPhjwKP
 gRVnMqAlSP+7RrV9wVasNQKB2DFBeODQKapi00d6QZo6Z8xu9LfV2wcYLsDE0tW53dCwaaBoKSA
 Uwp9rJTFfQglr3P1XbvmyjbCC26YEtU=
X-Proofpoint-GUID: q4TrZkhwrIDFwgJpvRSILkZvJtNxedhJ
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9e41f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: q4TrZkhwrIDFwgJpvRSILkZvJtNxedhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 11:16:57AM +0200, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
