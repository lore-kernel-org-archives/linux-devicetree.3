Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC63B3B42C7
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884636; cv=none; b=qIPOP5gHS7GDX31KMr8MxhqumQBORgaPZO6sgOW9Q6+LrniQqLagFhAIsAs79yQ3huEKehb4Jc5Dr3dtTEf7wHMIbElVjW1EI1tRm11xrfiP38J254Iecst/T7v3L4STPH/8afpHBTv0GYE+NEgnZ7EK+/s4YSzY6EreXkn71B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884636; c=relaxed/simple;
	bh=/as17aOfJMK/3CjhOCiUa8dmZZDXaYvY9L11wwmexNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot6jiv+6yrlgSUPKGZxTrFZLzxiEBuC/o8FBnTH9Jx/ajhbTnp0mRz3ajgbEBVfIWf1HeASMk4GrNxMwlf7VxeK12anpXUU3pmmj3RXsmgu2r7Zd3etsxPyGekhpaqZxgnQZRLznqSdttca3TekLlafoR9Q8haz1K9+lLQLCfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjhTMUYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQV+4OaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjhTMUYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQV+4OaL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7Oacg015549
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=; b=NjhTMUYbZByWDw+z
	ore+1ZLTN3xO05rZ0gROL5ucutY3FqpnLiS0L6Jn6MtalYpfWKn8OReEtJF1L3xt
	wJ/rWIks5WLuHXudygGX2sfCKGMMKZz3+CxVZK0j+Q5M0o/xH4L0CydjZ7+deVBi
	2TNKpPgG8U18tnG0lHrgA+3dwG24706xHBnxH+F2h5zzO4LpSBw5GnfanUyctyD1
	yGU6fjCw0cvAFhEPYQEwv0XM4yzT5WhAYbz/W2acjrFf2MktZJ0oT9uHehDPWL7C
	wKIR20yqQ5bL6aegxMQ4DhUD3gm4TaJabuNEyPBMk1RRbrXgLPORpg9iVuqU2Wcl
	yZ6/uw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugjrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:43:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7295405eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791884633; x=1792489433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=;
        b=ZQV+4OaL4nJdC3m+1O4Q3TO0UCQGtV6Z88QQp4Rutpw2nSXSLC8sTbSKeHXrnR5sJ3
         NiSKw+/fR42W/NZGPXC2xCKlATxiasCcQLbcivAO31MKTBxletn2C2Uaqb5CMZkvsjO6
         +QSyGOS/Gd09EybodK8nQwEHTKVtJ3U8qZAxzF8jAXFiptfTlXHnCyUIbA6na1me8+Rb
         nGst6V++rTDlGs+mK44dpGi5wWpwCeOOy8WQaJ7oeYyVjIx65tHX842RBjG/qyDGcIcw
         JTYD0c4wsYXx+5kQE6aNHLp8ZopVCHU33NkVtzS3LCbKW2AtHR95PYykHc3GulPyv5wS
         yghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884633; x=1792489433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=;
        b=ig4Wib5bJ+B9nhXQX5VKRC7rbNfOg0FrLBFKtPwz+YGzMnJfDdYCxLhWAF/A9TbEA+
         KCsDu8fNA2/qGGVygF6rFdDRpvmTnvZpClsD4s6aGyBk7hnSNneG6gQua0MfIci+L4d9
         5ZWKY7N+53U6z6dWoCv2Qgqdi73rUiCka4sapLWu74hnyFsyvq7b75J6mENnJMGKtz2L
         sKXUQVDSwZPXl+OjhjvK0sGOnGoVu3x2yxkqna60Fw8l5VvzYq3uiwNSo59CD4a3h2XT
         A6ttl6niXRC2Jw82PmLzdMVhJjfRRBeBBqkmeF915TGWfPCMbS0xJN89Gln+WM4fyiIH
         UY9A==
X-Forwarded-Encrypted: i=1; AKwUvBwp1GhEkysnNExv1nfgKxngoEfxI98v1WDY+spNP9e+D60T6hqKuy10kyCKYjVawJ1skbC3cv3LX93H@vger.kernel.org
X-Gm-Message-State: AFq9FYJyin5YGifBVeIOXiaWJ5+pEQKy8FFSJvTN457V4p02pPTA39Ow
	fvnX8e4zTnHb646Ckp6+106yklatiDBkljmwq4G7qVJWP/tH9oAJAZAOnFC5LnGGMWM3w3Iq3Mu
	mnbmeUpUsOzmMFBJGBmUxOZ6kKkOhoHxArwCETXO2TnsoSbji4cNXgImdtemEvmQS
X-Gm-Gg: AYBFou13n+ACfbZP/locxAWgyTTUXkvL0LrhS3zto/p9MxQ91nMN3f9m7aAaV/VguSR
	9Ogd6TjBhaW9HfHK9V7rea5lnO1DksEP6GdoWVxledLEoFQsN0e9PDTMM0hPPuMnPw0aA/Ug2//
	quBNvCfyW4a0FoF4J3ubKrHmwPcKcmPyTD6M0AHBMg60++b53zmtdy7X/aHBVp67lCglvgWE+WO
	EZIEvaB6uJgzpW5t/BNDgA0I6BZq2L6l7yPHi2ki4SsLs1pNOq+SZqDuy2ENH4QmaBIS47QG4DV
	+JhtUwnTgJOcAjaunHixP+OSDuSf3tqfDMv9390eHyO6nbVp6TWLhFK8CPFieWx84lkwRbqGS9r
	p+Yo7lPc8Qs41w50teVr+6jkfMH18
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr8604309eec.1.1791884633317;
        Tue, 13 Oct 2026 02:43:53 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr8604268eec.1.1791884632686;
        Tue, 13 Oct 2026 02:43:52 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm39101861eec.6.2026.10.13.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:43:52 -0700 (PDT)
Message-ID: <d6aa17d9-828b-45ea-b2bf-940f855a00cf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:13:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-2-258ba9612da8@oss.qualcomm.com>
 <asZvhvK5kB9DyemI@sirena.org.uk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <asZvhvK5kB9DyemI@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX/mKcovWLh1O3
 oLGhqceqMuIkARIU98wyGwwuxbz/Oge0s8Kuewnm2Mwq1PGpLw8FcNKijxOhTohGo1anX2XNAoi
 CwX2EMUIZx3a/BeMAhyKT6fc6caF3IhnwRCri990JZCsiBnqJk6ANe28pCNGUDD/Sv+ZKnBlUmE
 NlE/z8yN9eQa+BPaAgg2IUj81ZWdNaBpLEFOiuiL0+fCcuGge1hqpMx/ZeywJW92rG2qnrU60WV
 d/WfwiIaUFm+rYuNp2bxCB4lOjLGxaTHi8scEGnLrs2iga2mswpML67uvSkP/12fCXI7owy1+Bk
 9kqcusyvqK4f9eivg9UL2n9SoaKz0cPY+a8RSBQROQJYAMavPEvkJBHPTcfBESxUfJtbPtMP3zF
 hZRYpoG2/jODDrFCsBJqiplixYJG4kZXsh31oFUl+KMyBV1v/g/u7EMvNl8QSwt2RpvIO7lMpP4
 uPUFUgJUXfV5mT5yyWA==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdfd5a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7UbeVSx6ShU6YajrLr4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: bJro0PISYP7xa5gFNl1NMrBUnUa1iZ5r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX0ifp7sbuK6XT
 4Gr73/paL8PnTRBCEteAYWcJPnn6KWB/zg1UzfCBeo944AtS6cy2xlyKW5T2cqUqROBSDbqxdJi
 ir5MuW4tr2Z3+tjzxbWZuVR5KQsJGy4=
X-Proofpoint-GUID: bJro0PISYP7xa5gFNl1NMrBUnUa1iZ5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130038

Hi Mark,

On 10/7/2026 9:42 PM, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 06:16:29PM +0530, Jishnu Prakash wrote:
> 
>> Add support for parsing the 'regulator-off-on-delay-us' property from
>> the device tree to enforce this physical constraint.
>>
>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/regulator/qcom-rpmh-regulator.c | 3 +++
> 
> Since this is a generic property I would expect it to be parsed by the
> regulator core, is there some reason for making it driver specific?

No, there is no such reason for now, we'll make this change in the
regulator core as you suggest.

Thanks,
Jishnu

