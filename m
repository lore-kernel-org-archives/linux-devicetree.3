Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E554963B8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190075; cv=none; b=NWekHNPjVv6xfLNGG37zisuAprfOU+tC0ALsyFjpuWvFpSEZj6q0nm+eMlbipaRhblBgiN1OXIMC2OPlDxBBxRx2RWFgXW5uhVao2Zqv2GAyDw5ArM7rNrpu/uaGtchnRzHIXDTxp9oe5t4IDT5LeBHSuKoxeX0RpHB5XWE/xbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190075; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5jtNuydK+hyqXZiMm0Zke4S47fFPjqbYaT1M9k+F1uofU5oHP3nTivrSiBaKnqaiIMOSkB1e79p8k19Gli71gEg5l2KZ6DNJikA7jHGbanUOX98Wr7XXzxPHkt6YoJm4w8xD9oQWN3eFnThDX5W5wlVIVwTY3mg4PQPyDujtvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlPDoPfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhqdoxWS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlPDoPfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhqdoxWS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAeJdr4131492
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=jlPDoPfXjw/yjVIa
	Eqkxkk808s1uvIHPltfS5L3uRkmudsdFOUfDvhgcs4bv3ZmmkOg7HYEmKNap5CNZ
	qsOmNgAP9n7cNy6LAAqDg3LoSmGSoO9EP/P9byTTv+gp2/7qP8pnh0Mz5uqxK+7h
	SC7/jjXBva+u6rpfH8gNcOmK7VPNwBLDFXV2p/G866t3z6N4MGELwVkGpKzIp4cn
	EWgvy7SB9JMRA3ApXKRUHn0SU4CmyX5+gzien6OVbmsfTdKyYR/mcmo8DmYmR/Qv
	jsyPLyLeGbgRblL/kH1iYW6OcaK7FqFW4GS21V2aXy/lzGqS1OBMVh/B3AxWmiNn
	da5yng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hfx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so11819051cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190073; x=1779794873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=YhqdoxWSJMnrfLk8AQyDjUh0ld1g8oFq9PqSLaD5LUObUmFqXlg2AUyjFuFzHaFq5K
         zHtFT6C1E+d0eXcEN1ANKRXVqJvLHISgni9I6q0TFDJGa6uxxWfFwS2YNaYbDHEoBHlJ
         TtH4f61WO8Zgx57nJWPIgPVfrJ430awJ66A7ktdlMUgFALVDrex6TG3GCiNRGonWaQsK
         J4HlhdqzyDmlTZCwIPFOfZ/rlVxfLx58kDdXf9Yenzs/9sbK3jvZDFv8ULAKLYV6eTTx
         KXvs/rtCZJlMcDU6UFnlIvfiUvQDoi8am7lf/JBnJGXYDCXh8widmvdhP9LJelpgb9ly
         2wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190073; x=1779794873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=N2Rx7Lli45eoP8izwo1Lwsd2u1oVdLjh5aKW41ZQfsfuwfCIKS/5xq7F7/YdligE3i
         /DJO55+lxuvwaDbOx0dF/CU5yZcfJkzwdUxA0DZ7o2yOLwmmTab4zkVusZNB8IMI+za1
         5ggxQbza74gW7kslpmeE9cdnpKayEnaViT4Zn504JBrQFozUP0VeWMtnOT76yXI+9ORH
         snUGlO85KAMbBxVkL0u0AaxdrN8xzom3eYW2OGoPous/EElwHB1FIcyS0Fds9QXhk1j7
         lzkIZcrX7+YiJ9rl9o7EQDrP2tge2XqmuWzrqIz3f0ihnzOM+1xlFB/jjNArlkXn1SjV
         fSzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P+h9R4Tx8pue4YvQJnWJbh8om5EuD8trbknkBDhMAmKO+csmQMifUMZPgUG/ru1Ea7wXkZH8m7TaS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6BJWgyByu22R1NlRHGF+L+yw3QgU/ymc6Lfwe+qFCxCoIEu1
	fuF49VCwYiC06Xv22Ga9xEGXoXh/2pxRLKoSByTc+ky7xa1BfqnSj9OK9HQl2KyOf0h46Y3dSL2
	+mAgcdssu9qgvitCJdKSRGe8lvN5iUwpNHeZN/YOoVPEeDZYrTIAuptnRPmIEEbqz
X-Gm-Gg: Acq92OFCYkkTDqrSS6MlzFjW/F4N//obTr3cN1AkLX6pm5x405vJ4/ktup1qxM2ueJP
	ERKS/Z9O/KLBNb9pPBnXVkXS+bl3peYRVgyh8kxn+HTvBlKbRfFsMF8/tF1Wf1LvTlFfVlkHDaD
	j8zeyEBEK9bgAVivue+cmZk93RyNdy+L3QDKcoL3h2J+PxlBHThS9WBEZ7PWmH7UPWef2iwWl+j
	RBhZ8FKqyEEoTldcr6JhF/CMQyMgrPwgUzqTK66bsdYtQDn0tB2H3ZjbHW8GlY/mUsvHUfDpcDT
	oX5Z5/qoPaMWiPR8tn07wFLNoj56BME1f7hqVCE1v5JQUO/iZabkeTGTMIhUOyZmmPkI4FU6TbK
	Dp46J4sDFnJGsV4Jr7gTVExUYxNzAiBKk1MzhuEyowqouUbBgTzk6ZsR8UopG/x99WmhVUlkdzH
	10kks=
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197561501cf.8.1779190072864;
        Tue, 19 May 2026 04:27:52 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197561211cf.8.1779190072396;
        Tue, 19 May 2026 04:27:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm680570966b.28.2026.05.19.04.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:51 -0700 (PDT)
Message-ID: <d0fda636-b755-4ea8-ae1a-f57a4ce23566@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:27:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: pmi632: move vdd-vbus-supply to
 connector nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-6-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-6-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c4939 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 2RnhJINMDOX22Ly8a3XOZgLiBN6aUTbp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfX3POtrTRsCSal
 U8Rqx7DsYhf3cFb/dxv0MrdazarVHnzs+dKks+MhLYPa3ktMC6RWOum9zzMeSPKjHxi+DDe94UT
 voDD2o/LXDpagc/62NlExkk11g84Epuc+bjykLRRL4AOXQL/c+66UtC3HStJUvm338RhbTMnsyk
 sLvA/x6eNzi4p9L2zRMAzUKbnlt4vkj9UsXzoXalaG/ltCg7hCpRofibqe1Blucl2pz4LkQGnqc
 g81bn4kEOzLKeXtFBlFlns5GMNCC8tEMAt0D+O39VtFpLg93m+6SrxOgXrRdiDDSqEIN9p7yapO
 qGYl0RMPgivhogzyhI8I+DIR5dOivhFbGtLxxC+5GZOE+vguzyENqVpF68leJzGdQBt/8Z/iE6b
 sdrWc6qtYUWo42dtK3hVI1Y186nVQ8TeXQxPbz840BkjKc0+Sbgn3zxNVcNOjs7Z6vhFDoo6e5h
 tOk1mCthcdJifIScarA==
X-Proofpoint-ORIG-GUID: 2RnhJINMDOX22Ly8a3XOZgLiBN6aUTbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190113

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
