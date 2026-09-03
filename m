Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D244BCBE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424542; cv=none; b=N/zuotzYwV0FtHSJIXau+DClYfYQJP82Z/nBOKchL+gZUsomhsNtakxrBg169uqo6C2NLLmJurxkttrITm/nK03d4WLUhHUIJsPNZVzEo8LyQ7NlKztA/yYQ/DCakH1LX+PSJaYXF8KVSX/tyaU4F9bQd7/0zSowPZVcjsusvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424542; c=relaxed/simple;
	bh=CKeQ0kGfmW9zgzc3O5aZOERbMGkC8XLbolmlz6fWCxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4fFSq1/splkya07Kjcab4MY+EOmIFgX9xT5gp5D7HdZ0cLAl8Gb3IpzvBp3Pv1rIJugWDnMXMj3HixU0jHc3Sjbmxj8bTsg6zhG2gZC72OiuwbvuuCvIDV1XNAAmJBURJ1wkH2aoepzNqNcZD5UKH7BLzwTRZq8gcXmbSu6Cb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBjU6b+k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGoAlIiM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBjU6b+k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGoAlIiM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837Ls3f4124090
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p8CUNZLHDse0n7ZcxKsMrOcZ
	UU0tfBhIxTsMSoRuXhI=; b=JBjU6b+kC8mIoG/zc9pR1N2DQWOsEEsyekSbFAjV
	gVsEm/jrDbjgCJtUxdrpacEmwO0aT1kJZknJzLlr9vKPoW3u/69xNxsOjf3fnMXD
	8mWlQFMUooURnlOgKrFlbN7lSoV1jLNGPDkB4kJ8e56jJsv3cA+g324iPbvDke6P
	XyQIDYaMu8iyehc+kf4KenwkdZLbVoCoox41J6SN4APsD9fKTs7qbcpadNOR5koh
	yTDDlQpEbr6AfjnlGBTcWncABg+FOaCQAsXBmk5dO3uy8FuUHgyQq9031PZaOpl2
	biMypX0enO8XQW3mJ+XkwvYeW3TVHpCG8ZoIdH1iwevTyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg9dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:35:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93915f50a5cso159897285a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788424539; x=1789029339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8CUNZLHDse0n7ZcxKsMrOcZUU0tfBhIxTsMSoRuXhI=;
        b=PGoAlIiM5DSxSWwQ8rOro0zjZXrDv5BoeQvIYal4wO1LKSOUu5reIdQgqXKsM+z1L2
         B4Ojg7J01bGjM50zsg7vUAF0O2Oyi9D3yrsVvRpkm2xyg+BLHR/5Lqb1YC7XJrysgx0q
         rLBNEk6o5dN2ScICuKY7kTyXURUE+h5wrYZzuJoyzFtRkpZ121d8RTVN0Ge1Ae9tR0Pg
         ZfkksEleByVO1jz5RaIVmReCfTA1x9tkNCNJxIMQqbhuQADQpgcVGFF7wudFAHgkxK1R
         2sTc3H8maug0fVcl7lD3o9SvRKzyXl3l7gN+sH2MkZp6+e1ZsjuXxcZBC6mF2vK0yxk6
         zn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424539; x=1789029339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8CUNZLHDse0n7ZcxKsMrOcZUU0tfBhIxTsMSoRuXhI=;
        b=YRLwn7ueIJoClRIzDxBG2A3WSbtGPafFG/iD0SrwRyXe10lXH6JdzLIO1Z9xbaZB40
         AfQ1ktwHhXHNWlcGxhuJ71qFTDF7u/NjNAskQXFyxPfk5np6asBD5lKGkWwTRHc7GgBE
         rrkNoQYWS7aavVwmK9VIPW2tUQMHQCvN1EvzvWgsQouhOdTqMVmB5HLD61PBADvvkpJj
         2sfGJWJzGUbnESOy6hjlmcNWoeT+YyinDO8W0tFqA2IT8Hk/YifeUmJfIIaFpj5vB2DM
         gSo722w4cTsIilMQBjTFpjgVEJ3CA7ubW15Gq7mKtNxHwIklf3/5PMPw/fNCqD/9sW+N
         nEOg==
X-Forwarded-Encrypted: i=1; AKwUvByldTTW5l5eWoAwy/xVec6S4Nvu9VRkmX1xUAX/o9eiRuUfQX3MBm+Jk+LvmVUX/2/bs/8VQT+WpUeS@vger.kernel.org
X-Gm-Message-State: AFuF++ldaeQGVftiCq3RbijvHlUxPXXEklQsn85ovul1eqYWS09qa6QB
	qb6tatNCpOAkSjH4sWK1Mze6yUoRHleCB1zKJ0CpNoVxH9MpnyoLMNMx1wpMhT/Kaa3YTptcnsv
	aEzmZHuN1nb+KBmGcIdHwbhfKzVV/HwtMQs9yiYIdp7VexJIOlgLT6Kk4hTllW0WD
X-Gm-Gg: AYBFou1mwdQpmXMGzkF/ZAbtxEW5HJl+JNivk38/nl+2MjU/5bHOiQhLk3YuYiu2tQW
	u9hrFpq3UpuIhyYsb0Mt/k9usa9+bxRjlEqWANd68cAJpIEOcv1HYmL71YxrGXJm9yrChqP+YQD
	CnGdXZcS2XXrtuV70lvZjg2Q5RHsD4JHPjRIHtqXMF3Ls2TSVqPRgpB0Wr3p6vDlkAtBepV2CS7
	db53nVxILfq5udKQUHgE/cG9DLrqnaz11eldwo2L1dH8C5lCatbWQoBbism4HOclA0JZOz649Bk
	+a5dKYd6s3ylw6DJfL44GkG99rKt1u1SLdj/zTGjk3YQgskAyQdZj2zjPThP6e6/txWhlsBHERH
	gpEqJcnzEDT3w+w==
X-Received: by 2002:a05:620a:454f:b0:939:72cb:bae1 with SMTP id af79cd13be357-93972cbbc1bmr158791885a.24.1788424534024;
        Thu, 03 Sep 2026 01:35:34 -0700 (PDT)
X-Received: by 2002:a05:620a:454f:b0:939:72cb:bae1 with SMTP id af79cd13be357-93972cbbc1bmr158787385a.24.1788424533381;
        Thu, 03 Sep 2026 01:35:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm11510386f8f.8.2026.09.03.01.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:35:32 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:35:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 08/16] arm64: dts: qcom: microsoft-romulus: Mark the
 EC reset gpio as reserved
Message-ID: <jfqprtif3hwazydbfj5kr5advyjvtijgb4alznj6437oyc45tg@wlaxslatpwgf>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
 <762f2294-27ff-44ab-b4b2-ffd415639928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <762f2294-27ff-44ab-b4b2-ffd415639928@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: c-zhtCyiZugl6JOSnKcnVR_cndvMdgaZ
X-Proofpoint-GUID: c-zhtCyiZugl6JOSnKcnVR_cndvMdgaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX5OhAWjBM8hwB
 M1BmDwvS8vqiuTKnABiFJnKjNDvEvO1+iRsJ06HCW9HEblCBeaAgiVYyTTYDnZOEScFk0AkBRsJ
 X0idCgi4+aFPVHCKw+GTYab2VRIWawRJNtvkVJbPGfEVi+C31eWsCLbCFfd5b3iqUi8k78iPjgc
 bqYFwJ8ZOVK0Pl3A2Yl3C8dNRcQAwC46Vfy5dxcHRvTYEHPN3dRPCP0lYv4Sy8uvogrBSWYuHre
 tI+J8oBore8VWw82cZD8+1BswqEIodHBtnNaqGvjRbk4zyLUUftyKfWRonCpd0EoRsuDSZy+Bds
 ir/GxBts08f7Jh3MDVk1ZTk7sr6H4cgLpJ/CJn9dbB2nwYGwO+K76yMSI1U0LvaLt0Lu7iMHPIq
 92+rP+KhWS1t+a7jWH/jDFI+5TIlJSyQJ0cfr7yKSOMmDQ28O8lPVp7vYFYYlYcptmgvRQQ5OyZ
 DOO5XbNk1e53BobiBJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX7/5r3M1z93oU
 BdvM0hn5DAKvn85CZ53ehYnvFqRSmq9khdKelFKqXmj24sxhAj2PKCzR64hiKGgHg1pgfD2MREy
 kcgwcQFs8v5MUbubV/w1i50hYTyNRdI=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99315b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mp5OKAHwAQw1bhdd19QA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073

On 26-09-02 17:50:07, Konrad Dybcio wrote:
> On 9/1/26 10:07 AM, Abel Vesa wrote:
> > GPIO 65 from TLMM is used by the embedded controller as its reset line.
> > 
> > On some devices, toggling the embedded controller reset line makes the
> > device not power up at all, unless the battery is unplugged.
> > 
> > So reserve it in order to prevent Linux from requesting or
> > reconfiguring it.
> > 
> > Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> > index 13d0f09e0c2a..bc684c295b89 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> > @@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
> >  
> >  &tlmm {
> >  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> > +			       <65 1>, /* EC reset */
> >  			       <238 1>; /* UFS Reset */
> 
> On this device, GPIO_65 is an enable pin for the touchpad regulator
> (or something else that is a pre-requisite of the touchpad working)

OK, so I'll drop all changes for Microsoft devices then.
