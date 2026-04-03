Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44068303A0D
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252879; cv=none; b=VibusoIpOzfNG8H3Ll2W1+quBrUncAhS1CE8NPvSoRVzIXt3Xke1w3QKVAC1snMuSKuQ6jpk6604GJQeGMG23WTKkGVXlZi2MaSG9IHPybUGJBxx2oSlrD+kiQdlc/LhbSF6+LlH8YAAPEAPASUc9DBEymOkzDLKzBvyqxpNlR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252879; c=relaxed/simple;
	bh=obSRFqphICqgwu5mGB5dOzzmoDIay7Ygz+pA+RIw0tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7nhMxYXEHqlYyyxnLCyhHEaAaoNNOwrm3bihTCejqXQSGGqOb5lCPp62K+ln9bedZQ02nqC90kwMT0QIFgHuZ16MS3KTFXAVfcUzLmjhn8w0rvuywBT5ymPbmllYI2keDX7IOC22084K8n1pnB5PBBygE08ZD8BYxjTtf2OVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNkJiBdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYcI7FYR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNkJiBdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYcI7FYR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Fv4W7259185
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 21:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EmZwj5MaWSd913J5s1DiIbj1
	ZJYGAjg3Ytgz19+VIvo=; b=NNkJiBdUr9k04CqPptP+mgzxkXXxEYBFuZS2c751
	dZ3gHcMzXVdD5udjq/jQbvVgNtwBpDUiUaFZt/zvIdGerjdIz64aoK0GJS5NprEd
	+Q8TJXY4ZWrpIrOIFgDtGMOecVP/0pEdo/oSbpT0FouqdWZp8nGQa/E7Xoipapw3
	MRMeLbbiFr/SnQVbJcPE0NaQmZnHh0SZGKQAJssRtMPBxp7J6sBSElGXMaDSFCgL
	GfGPcJ+KZIzvX1hs2rrAIQwCyb5z490yo6W0H+4bQ4Kim4lQp7TowmPAwd95BRSl
	aIsPDO8kxE9djO49WzfmbgG0mWuVkx0JUz1sIfg3BnbqoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20uqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 21:47:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so107218701cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775252877; x=1775857677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EmZwj5MaWSd913J5s1DiIbj1ZJYGAjg3Ytgz19+VIvo=;
        b=EYcI7FYRVnJJMY74rEZB14rWAg3gip3DhiJb6U/BJV1a8s7lvAHdtrQYGfMc7WpeS8
         qVpOkn8xsG4Q+QpRbm9bYOIB1gWayJJenclAZ78cqmzgH6lCWCiaoqOZ7Wfi1Co2yxoA
         hlfOttKM44kwIM8T0H14hOqPwrWT09+WDdNLNBKdx+QE6w5NUDBAfYLkUAo7a1O3cDHh
         dYUh/syEpiRKnjduh4QLoKmzsTyvNFymdFXQ28YU0x50kgfGQ7b3qzmNiXMXcPuAuA4D
         a7EX2dkg8gg3Us+T+2lQuyJFwzff894zTuhPNNfkUX+nZcOmLN4iEAGIG0iyDa2uiQFd
         lkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252877; x=1775857677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmZwj5MaWSd913J5s1DiIbj1ZJYGAjg3Ytgz19+VIvo=;
        b=h8BvI4iZs1GX21jaVG08KBqtS6ZU6dVCq8WUGuVMsJ9KxQhVDgPAOK29b1XNeDvPSs
         cxzO8bERFjlCC3jcdsPA/LtOc+kF18QcBxZZbIbLh2CleRYCn5NezQn5ic89h1qd6gEZ
         2dNGPs1sbjVphcZzdXsahRhqw0z1wrhrZck9PqaKkSGdEWiPVFnB5k4J2+u9uXecA9M9
         0kTnc1LBouSuyvjmuokGZApoq+gH2Ro+WO+/MnMXRL+x5+KJLkuBflGatjsuyZ1Cf/Er
         cht9nWt+G1HvOPqqXzEUysNkrDOyhnP+CFr7lVZWhnveTLwy9GrVUA/fkJBrYJtfXQil
         HDRg==
X-Forwarded-Encrypted: i=1; AJvYcCV/rQkGEEnW3XMLyyJh3PRFJCBWvIEyBRWxMJ99vMnhuzqtwwOdADV70rpddBc1GcQgPRFTF6vDpTKy@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9weexuY8yReQwIW+AuU7MlsR6QESxe94WpaQrianATBBVG/N
	w9qmVOKHRPFDXY1F3ggjKEy4T7pRvGUBjHY6+jJufSPdrLNdczYsZd95h/9B53gWHVxXGTGZMnZ
	3FmxWzbw0v2S73rRfI+Dopy5poz1Qqnn922XwsYdbnpGJD8yk00gu32fQpNd55sN+
X-Gm-Gg: ATEYQzxwAkM/v/dMU1HCulnyEofvhSJm3BIxD92MoO4kIPE3X5XPJWrn5puRWqdDziE
	JGDkYmcx2IYYGxyyRSySkJ0FhxJeaZ/g1En+sViWd1bHfxCqRa8XYg8azuU5+0JVTJ5Yks8B9QX
	dkOf4OMg6fZcUOPPkcHbEp9X4gMEkwX9Kn91F4OQsjoeOd18Z2CQ5xYVIjXcqnSKdob8pTIFLDy
	bcJtp5PoyGosx9CVXTqNR3Al0C7WK8jBSi7alD1Lbj6jqTWHmQFCShftWRTUmtYYM+IFT0SXwRk
	3lkvi0CeXT6uhgc6RSq5YU2sXDZrO0xmTnFVetRuxEpKUzD7gFiqRwFnFjUjyWuMPBNfCkiz+Rn
	bEi7orzXZkioEzXv4vZU1djaK+1JOIs8Ihqp772J2+mSEVoDbsybRjxQA9QDBWaMzQGvmDwN0Lz
	xE7X8ft3RbJj82BhCMmYI9wvuvGcomIphCO2U=
X-Received: by 2002:a05:622a:11c4:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50d62a7f2bamr66782691cf.40.1775252876676;
        Fri, 03 Apr 2026 14:47:56 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50d62a7f2bamr66782381cf.40.1775252876146;
        Fri, 03 Apr 2026 14:47:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2187070sm14998261fa.42.2026.04.03.14.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:47:55 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:47:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: pm8921: add labels for ADC
 channels
Message-ID: <43agfdcud77ifh5oxkrzkxb5dcybja6bw5f4bxd3ebdjjrni4v@xc7rhornw4fh>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-1-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-1-29b50bf821e6@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NSBTYWx0ZWRfXyto+rUxWaXHZ
 cBLKgvlsyWzORCSLnwC1qhzs1LpoW+QQpoK2sKj69mt4Ghps8lqWANTLlWV5oBjySRfxzU1GKXF
 zW7OOjqmc0iVZlaqGtZqdwFofLyr50BQBvBXTss5a0DsQHedXO75FrjiGL4Trg5WeTMKVxxrpHJ
 qnSqeVWFkzoChRvvkYUlwNJGb9AIzxjfiNmZ04/OO1KrhmJOyXVvcfL/P64Ys7mmwOQQ7Iqm2sO
 2cI0iv75MTywk1pHG6jeu0VG2nVIDaRaCWaQTKfoglkH8dJfC7+mfh4I+2APCy08fSpAcz1+yJh
 WirmUe/p1Sz9u2mQLgHwN9iRp8MI1rhMdA7z5jpz0BNJf4aG0F9VPdpLiIDRH3Opp+XT0gBA0Jo
 6N5hcCKB65TH6fJ/FG8JXdMq11oYsQl/5MFF05sI0rGjinxPAhP/eshq3J3A7+uw6GN78aWE9z7
 2f+moFLna2dQ8CCM5kg==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d0358d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wxLWbCv9AAAA:8 a=Ke7W15zrM9QGlUBYRRsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: fO5QUTwSCHDP8fE9vYheH3k--qJIpyjm
X-Proofpoint-ORIG-GUID: fO5QUTwSCHDP8fE9vYheH3k--qJIpyjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030195

On Fri, Apr 03, 2026 at 09:23:14AM +0000, Antony Kurniawan Soemardi wrote:
> Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
> device tree. This allows userspace and drivers to identify channels by
> name rather than relying on datasheet name.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/pm8921.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
