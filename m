Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8C1E7C2E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535313; cv=none; b=O4HVXKbEdKRhXoAXy1+ssplIbQ91i7n8MYC7OwyAW6Jyp+XXpDuN8/bPtlaBH2a5ncLpJGs7FuSirtfSr0YmoEm9loEHlygUIJIqfWFpN7LTAiBRnBkzCOUEY+Hi9yksBlTaInTnZFcHWca1YEOf+CaPjAGfm1BssAVosO2QwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535313; c=relaxed/simple;
	bh=qt4NROSh+/Rj7ta/4J1JCt/wwRJVXnXOqe5ksJfpco8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX4wrW209I5dihN0oqeYo0xiIGSYNGkD/U5L3L5AjEaJ2iyRS0xLveXQIFghPyy3i5F4JC6fRjspZxdnPMQ8y+v69jaWWbEedqkqEC7Xj43x46OXQN/ht5znbFNNQhLMQxfAA2CxEdlHCKZJ5BEGL3H0N8MkfQXZzCyOnpr7bn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nvi/+Bh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ6EJJ7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nvi/+Bh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ6EJJ7c"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KM0X1223195
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CfN7f1pufqYbZZVQo+rvWY8E
	+8qMr4fBv7KyLGvbv9U=; b=Nvi/+Bh3YltzaPxX5L3au2Ca5kiPUufb2lUIehwL
	XmfCUhwgRs5kuvSwXHHim/tl2QyJ+Jj1sp9md6HSMuRweTo+NkU7qjSaSny/G7wT
	Ma2BtTIvKrlx0Os5l6XCiLgTdKMhK6T42OAPKE4WRUBeEvdPUBHUkNgnT8xRW8Os
	+b7jB7iRY7ANWEVCmxO49n3RwcLqIZScvkKaq7LxR2QuVsyc55BXK+lhbPhCVrqq
	teTHcMOZX3rTbuMSMo9TK5lkZinC8dG6msSx12POt1+RH33xu06KzbBzeEA6ITP9
	jaAcX2gWH6VM5nqZ1+/ebSiXEO7fX+M/lfpjUivhb0B+Xw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkamwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:41:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso102494776d6.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535310; x=1792140110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfN7f1pufqYbZZVQo+rvWY8E+8qMr4fBv7KyLGvbv9U=;
        b=OJ6EJJ7cyBHWPCMcpw0QET2yAX3jB6okGj07dt4/BYl2Ue7tPEKLbeFiZaddJTRiN3
         GDyiY7W4wd5DdGUpHlSGShpjb7gWYzmOGffeZDoqyBhcBTQiAW5kdJac+//V9HD1CwBc
         i05VJ1CaDEVIVia4cJQ+H4ifd9U8N/olA1/KQjtwHh2I4PjzU5uYmYaNdcGBVunVZ6Ko
         ILqJsqDNA3Zd2kGxhfAtAbiUpFBRo7IGG/WAcenmUgxe+qKdvijetf1xYTG+S3I7na/t
         KTBHfSwNsyQaK65tDIP6QZjb+H+9fUv0SEfMC0HlYCYa5SGTCks0laLiYPXIJk8Z606J
         T0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535310; x=1792140110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfN7f1pufqYbZZVQo+rvWY8E+8qMr4fBv7KyLGvbv9U=;
        b=E9JGqQ/AEcmUgqcfCIpXTBM6mODr05CTp6rGf3+EY+j1E+sZwQxxhN9HquSH9lU68a
         +q+4PIl6lCIRg0xf+JbXFP338ND9cL7LVyAwrdEKMr44oL7hHMY51vn1mPnnSlJNCm0C
         iRntU01DJywhaTr6pAROGx4EZ4mul8wpFAdnTen4d82OBum8u8ulFUURFwKpQODBk+Lx
         9jKUWsiQJmqk1j3hTzPe1udHfJMoSApiDLeTNteIOqt/vJy6iyAnZR9+WqVxB1JK0iqb
         w8Z71fVh63fMjziHT24LNsKjKgjxsOYDKjdKpCdRIFeGmmsvau4lIa8NVDWntqKbIZ5O
         m0tg==
X-Forwarded-Encrypted: i=1; AKwUvBxuBqspzuZDTPcG7nxSLbpB48KXGc5qu6LKGH/zjo7zF+jXmddxrxFKkh73usdsnxrViaZll1/mIbEE@vger.kernel.org
X-Gm-Message-State: AFuF++kliHI1SKvP4onCJ47nS09Mqdk8BOcPoXrqLhHXDmz4vVCUpdSC
	v4nrvfr0Hn6HuQsZzp57d3SBWgP9lgVK3cklrqlv4tYJqC3kfWwzr0OSe49f5QJpxFGACvB3CNs
	tHzWPu+KzLNP7r//duz7IBvYQahz24QDRy9mYTejpTzGsmMApHDGI2GMlSrA5fdEp
X-Gm-Gg: AYBFou1LvSWeY6LPUw4mbb9FUTleSH9yeffnzs4bD1+P5ENJIF01W8CcXCTtvAmRYYu
	Z6mS9Ano+E9ys3ZrzN6xs+MvAuE6xDp1Nuwl5KYQ/5oHPwaC595tbeVfInpCgF2jrQB0eSFkYoQ
	WIcfvoLh7YDdvVMQja8gv8RYvqTnhgPfaalbnjg0DiCxn34MZuOCUHvxSlggrtiU71fNA70GTQS
	BskqAYbnR90pJ0Ba1iqTqZRDVqmW46H9sVp4rWgAMd8LZUkwXVHquKxQGajmyrRbJxWk14o8JYc
	7ND7CrnuqPWyRxe9r7AzLUETdiOVImUBGbYUZ7gA0Z5lrKC6dmfGyvP29+nPfNaU8CtYchp1gnJ
	8XgbFvhx0gq37O3aYlZkpzXoNAr99C62vc2JB+Z20LbanA/tkCGZE5xup7ZFxUad7I0zFqp5IVv
	bLtCFKZD80FVo/
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr189346585a.23.1791535310355;
        Fri, 09 Oct 2026 01:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr189343185a.23.1791535309780;
        Fri, 09 Oct 2026 01:41:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cf7ffesm4278611fa.41.2026.10.09.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:41:48 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:41:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [PATCH v2 06/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Message-ID: <7brlveujfarxtixe3g4yusb6sov52jzxlno4cpjjzghon3ijpm@ef2u2oplwsmr>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-7-mailingradian@gmail.com>
X-Proofpoint-GUID: rfurqpG8bohNB19OMdJJSJsfyWx_Z4Vi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX8vY6JubSGhuE
 QE70d4us9kuV62+x40vh/OnLprbpBAv8uNFqngklPvH6ISKnmRQRoQ8jCrRgNDnvxperF9zw+7B
 ElZ9IHfC1EZRmL3qs1uLQiEeSU6xzYs=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a8cf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=vbmOaEBQJOqfsUEg3iQA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX+U3HqPL0NJ05
 Uyd59Tc9gNCZFx9seHeJyRq53IpXPvZQ/51Dh65dIg/d4NbJgnTADANn6xYMOirg+M5DGHUf2pg
 EgDqsesJ5yPMm5Sy8xlpXOTAD5+h5nfrnjbtLtqfHz8Aiae+A6d/my7tDnJCMcog4RO0S7nDnGq
 9Rd9qhNCbuLpivtodRX0UEWv9ngB8/iq3iUnv8ztww8D7AQtIYF7NbGXiEy6g0WpzoyDaGyDTUx
 PEsFb0fzSdSSDswRXleQXM3oaE2v5aEbNPUH5ebHnO7NfDXCI0/37FcviL11ZBYRoebjI4Pj1Gi
 bs+zS5DUClFfcHJjI03yrOJngofiR+3Nw8Ar0kBWz82ZlFO+8FNAHkcGzSM9Os1N6BAwSPmXIkU
 Pqg714TUOsPYOxpPDSdxjMSnlm5A/A4HMnbcOCw81sLEImFkweNDcUpKcIpIMLXIpILX6aASP7N
 RCGBEWNR55+wWR56Tgw==
X-Proofpoint-ORIG-GUID: rfurqpG8bohNB19OMdJJSJsfyWx_Z4Vi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090034

On Sat, Oct 03, 2026 at 01:56:54PM -0400, Richard Acayan wrote:
> The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
> compatible for it, with the same data as SDM845 since the driver
> requires the load_state.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
