Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B914334B9
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144641; cv=none; b=KyfHzMAnLCSAF7KoULTIBbb8NBT+i+5nHKUX3wk4L9FOCzZCoqtpegKI9EzSWUJl1tpqTgIph3iUfpFRRSSF1wVgLp8Wwvb7yYFr3qiOsjrAgg1a4vJLKxmB6FfqAY6T2DUqcwblBmstaEm++TMVe3XfOz6heMLuZNMdvRwLhiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144641; c=relaxed/simple;
	bh=SoGz1wR1Wyop2Qvinvrnk3+hvBdaIxCKNnO4HMCC00g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gbSi5K3E7AvUsD5MAsJzuIEa9JYRktO8tDAoGOlmDqQ5ukBfBwLhjyfA27PYtn6teo6OrCxv0GDAYZuBusHzpeWYlMd4yl7ojBe9ZLCbETbAJPVV1lPwccfANwjwdAvOZDDmai7c4mpoz6E5pcPQojl3sVgjeFLouq7mih+EySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVdD24u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8bqxDMQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVdD24u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8bqxDMQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lXUK2815502
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=; b=QVdD24u43PumWTel
	YctVLY1o7YRrIGcwJaLWaaWHvTCPzmn5XBlaTC+kEWDuAH6XV/FiOmv/seM8tNDe
	B1Q+FLkykpmmPEGEcOkfyfZoztJt4NviHuj1OYY6w0Kh8NRli6ZAgTuaiDfekdTD
	FJVpXzHokZ0yu5KqUPmKb4SWIfBqOLYmD2tj7xsUXpa8aISTiX3uLXzrVFfMHGaF
	2prxEbQvO0PZ9kHk+4+DYBTduBVuh8T/qeHtafg13xCgHvEnVzbKKR32QuqaHWU7
	2978+hprQFDnDgOVoPC5XS3kvheFbARpp+jRxpkrtjLVYR0kJIzhlMIGWYDVdl3u
	WxWODg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r120rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:57:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso4584585a.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144638; x=1792749438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=e8bqxDMQNq8FYwEDdMI1z56qB+1J0nsuZUZ9/B+uQ15quA8/WanVtk8Mwfrq7mVngj
         j+eu//bmZFwhkolHvQFiU0stGOMhdDBCzBAuHO4H+InS7oUB+a+4cZXx8hLyd3AyOMGb
         J+7blz2kNFSLdsYJP20cksDwYvBZ7ncoDjFcjUce5pxFuHYZvHhR4oFM7NTwkSVT8tcq
         V9NSfvSEqceoICMDAc84j1u/5nA2QJDgVmstpXTuiQH0tVYBq6kTVyGO/GL7lvVpFIYr
         LMPIxem6VK+0vFyOMfUAeVFD5KPvI/AVi4bq+19rnbrNtHEU5A7FRtbUH31jgaYj7lVc
         vPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144638; x=1792749438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=vZhmucyNCWn3KdKuRG0kZpjfan1QgEYK0lXS2xeG9/j/BzAML6VjofFLViNQvDbStN
         7FlO/szmHmp/wW5DxFPYECS/779rHsnhFMC+VP4SEyRzho5zT1SffGoOM/D1wFAMwUEI
         4eOOlxBgK7KDKQQV/sEGyTKrTyApiSP4KrEydytaijQg7YCydrdUhau70EpTePF8zRcr
         prg3amWvTMr6VQz/KFiAjs7JrdUtrfy9k5D1UO2lhC3iLLX7BsrThzBGQnhvil/AZCsn
         YIXqBvRCnJ7p2N5zkZWdlnjVvgKX12MsJ5tJ3o5CAFWGy0bqndzoIVTcfu/t80Y20vUi
         bwYA==
X-Forwarded-Encrypted: i=1; AKwUvBz66DcLp4DWCwHfQxBAVv3z7SM4Bx9PWJKPAZhywjy8288H6ieDzEVjHLLKSRg3y466jQ9ekXFrMAy6@vger.kernel.org
X-Gm-Message-State: AFq9FYJ44o72nQYCHoF3ZPwv221yrgFN8TcHNnhKGG2JAlmOyGCiO7j7
	FIQalz04wSMzQ65yAQ5fOnFx8pjR9BvS3Y1nSoag5JJlNstAdXqHsGLXLpdZPOpHg4cfXM80VJn
	8ZeZLaR9tk+2PZpDG5Dn/Jjhes0XIL2KWZ3/RUNjZbala+GU9TCbOfafbboPDiBkf
X-Gm-Gg: AYBFou0zbKv05gmiDCz5CAgb/VMpzq4Iej8b1aC3VT1qZcRv1/u1elqbUckfVpJ69Pl
	P5lKu0qkty3+FuQ588nksdA0ibGtomIRTcL4XKt3Y/X+pXOSoB+p0iSUNG9cE7WSE8uXZtIfXsP
	gNVBtdD0UxQnvAmuWmhVqC8CkpPmW3Aiylen2M35HC0kJbEXRRuKyRsbjxziWZ5a30/TtE0I9Ho
	pCGu/vuhjxkC4lxNjRbndpMr1+zK0BfMy6zGyY98xM9881A2GS3vcSJp9vbCcajitZgZvz92p/+
	p5TrhjsKVR4ChSb9tO2VaSDEcqoi62Dvp01Zz0N8OUGuNa0uoj3JBteoQ+E4PIox1UBmIcvZK3r
	yJN3kr/lzcuoeDghF9civrg==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687800485a.0.1792144637720;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687797785a.0.1792144637202;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm54523466b.13.2026.10.16.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:57:16 -0700 (PDT)
Message-ID: <2ee02f35-3dc8-4448-aa30-331932a40629@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:57:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZA8B6GWdW0PF0th0yaNQjozUrUAhmW2E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfXyQdFHtWmLt7a
 4JfswaIUY/eWdQ4yD9qhL36WJogM6jDmWlLcxxwI3zWHwkryArwB7wCDjsbRkWpWCDc7k/MiPoG
 iJIKGy04af1YMA/Lx8LFPev9O02YjU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX5xZ+gtCg3JAT
 tK7e6uN09bRV4DHqWbbz5lky38ge0H2NGReQJKL+FpsS8PoD8n06ZPvy+MZwDjxM3Aa2TFNVgu5
 2op733eetHMYkzIkXK40Lm8J3GupCRaqK1WimwAxLi7WEnKjsw3Mv3+dDpIShv8iZXVt9gvmMUI
 jy+NulBdd17BdsVLF6DFrC55bnnCY0F7TV7vkVstreKogVLkBj3fTADnSM+cTOHRX0GFeWzzbV+
 kd0DPZDrDsnt4u56dKZwLGXhj0XBDSP/A3Jo9TPxBuwY5V+ukSPCNZ2I96wzJD9/55I7knFuCKc
 pcqnibJCilwyJ7D9TuWsu8109X5qr/fH3MhKrlii+30phmoXQNm8+74pMPLVYH8jYpdDzQCBPJ1
 PtHj+LX3bEooCkj/4AMoIPEMJ++nTEU3Ba5eWS09gTfJCf1zfzse6rXfgjag9MmG3WfQV89T4js
 PEgCFW3JQ0NbH3CmiLQ==
X-Proofpoint-GUID: ZA8B6GWdW0PF0th0yaNQjozUrUAhmW2E
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1f4fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
