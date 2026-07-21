Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E8445AC2
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675604; cv=none; b=pNbQ2BEEDd1FlJB/T4M+JG438qNFpMum63I9SU9VSphxwlF+jbnhn1alK/lBPaVw2xPqcJlk8mEu9iv6xasyTq8+HqZB//uroIOZOwhaZ5a/cecE6Ds25EWV+poIoKmdJxUCZUHkmVKhsVkociWZAoaHsoM/z/fD1fE5dRiJvGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675604; c=relaxed/simple;
	bh=DhHpn1dG9h+QAznsjBCgS7U6iCDto2DAUPjhpFCQdkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oewMoBFSLQOa8KRC7Pu7tpELUwbhV4uhkboPvXqbomjMi1bBDed84BtjUK6o34ECmCLBohGg4n1Ux8AER8TFKMnCJaraWPqdBGABiu0J55P7mMOHgq1xwthHBcSFmrImtd2vDP8QUf4rO+vr8jHF1LssVOxRXCeAf0hJAvhB1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GteNjTA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpgN+J8i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GteNjTA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpgN+J8i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZRg52910895
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AIcAbhd/wTobiEPktqGtOTKTTR1SSJ5H2T2pJNnaoGE=; b=GteNjTA+gWdA9P7R
	w332AUsjtosaLwSa2KjDB0t4pN4hBI0w2+DRnnW1y56mh87hIkQM+gGo68SMfsrD
	XMsOzKGNnTT0P1jwSp04YvKMCcxQUCej2PfH3shWRuFJL4j1GMRIJJGe5uizhxOH
	06ck79BRZnJsoz24Nip1EzW4Pvk8lNuvpow/ns/UUMU/+/AwZK3ikC1EPfXH820Q
	BV4gICQ0ockJ4zMSjdKW3jX92NxzLVi1T23aUxpmBPG8V6MUbbCyCyworCKscjZO
	yQDYRf0gC3tJ9mi0+n2+HYZO1S15Kv6+xpHOWt3F6NaZgaFX1pNnQvfqQ9PXGUlI
	P8Ku+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c42gmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:13:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso95823741cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675596; x=1785280396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AIcAbhd/wTobiEPktqGtOTKTTR1SSJ5H2T2pJNnaoGE=;
        b=KpgN+J8i1dd8Ai2xI36Fgfg7TNqK4hjVbWumbwoPIbzcy/AGrbgmhD5Ivdujn9MVYF
         sqPq682wPFrGWpxImP/1HcEKwtn06iNqir9YS7eC5J2kdYEkdcSLWUZKMQTe0WAxcmlb
         3JhbRvovr9Y4eC78u5wPGoP/sabzjixRRKOD0podnJ3AtTxx/yjxH2R1cGGUSbGn175U
         Atr1g3ATh6JNZ+3YdG+OITncg3BwxHRd14maPjP2jQA1AaUYxPWL45JrnWFgkJ67zVyP
         +kgwXTaxDbBukHc4BLNgnuz1CqFLRV3TGshXIDXKYC8h1y4onwTm2icEHQm/pciE0RYo
         GF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675596; x=1785280396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AIcAbhd/wTobiEPktqGtOTKTTR1SSJ5H2T2pJNnaoGE=;
        b=G/9qYMqAQytIhhMMs7vRifUiEggNAw7fIbrYUzIaXCKgnUuutUuDGj+R0DYcA20s+1
         LMEM2UXj2AmhoJiCvnwwjQCwja6KunNnXLHLa1ncGk7K2MOu84ykHOoL+kM1quFuqW7A
         9ML3MyhgVa/lCsQWT2mH9iANEgERpGVExdgIxBtdSmlJmMEc+qFCItGFpTelDH+tilDs
         Maei3yD5Lfe4OmuJVzVlf/4q1X/1Q4qjkBSU+85Oo+TmsVMqZk0jh5C7RJnFJ1YOz0q3
         udMuP4K5RQY0EAX/5qCZz3AFh2zD0wh/Lsgz+mYasFVbr8OQvUdoFSv2Q5qTsgCwSOOS
         8dDw==
X-Forwarded-Encrypted: i=1; AHgh+RqZQ7pGUdxxoky344NwlT7DiRMwhbV0BL0/Grs3wdHxkq1lTmp12M8VkR9uWzYALMXLFtL9mjJX1rTy@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXkPGPS0tcSMdCwGZdwmEkdaPrJKNdxqBqKZbEvFG7rGC0PWh
	xMJGYrmfP8GeTDnWun7f0QQx/VUbgFLbr+9b+MqPFnwHoru+YGAls0FY+wD9VC1DP7H28NntrNf
	BjYV19WANxGp1ulNNfxBr5DLB5IdRBoYSILpk3PS2KZb3WewCTC0DlnsoG/ac/i3+
X-Gm-Gg: AR+sD1276H6LUyeY1ZY/+WGyJaSsHNXS0wLf430Ai7n5wVwx3lGGsbSL7hR+eQm+b5H
	1VF8hrDwqKrWBDlf0+P3CLoJ/yXpIUTViDQ3PK73HhvMa1c6D0+MJYTBg+crhMkjZq3TEZJ805q
	ZmRBV4DLSINAUSGlAFjYDeLQMwidaRCWXJ4dJN3oenqSWsKsi4H/UTdaBzExWbP+MhR6BqKIF6q
	oJLkesthuSizAz0U6McYspvPb8m9OKWHuNjbkH/Stf6ZjtHG7p07A8aZ0yQXfrreBl5gwLaT+dr
	FVhzWbI6KZE9V+3RvwwSq/qqXsSSd6CaXz4syh9cTz5OvwU2p8RL15M7PUx8vgd1xWZKlccPzZO
	SfEty4MgEOt50OVZ1r+lxIuPjn5UoaB5wEc5MNacg0MUl4seei3nUmcbBv6JAHEDYyYIDtsCnWs
	weavjfb9zNxb+4lg==
X-Received: by 2002:a05:622a:a13:b0:527:f19c:734d with SMTP id d75a77b69052e-527f19c876cmr6418641cf.7.1784675596404;
        Tue, 21 Jul 2026 16:13:16 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:527:f19c:734d with SMTP id d75a77b69052e-527f19c876cmr6418361cf.7.1784675595889;
        Tue, 21 Jul 2026 16:13:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f4d42esm148526e87.79.2026.07.21.16.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:13:14 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:13:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Message-ID: <ymw5womsjuri3okfwmrhlqp42kgio6t7btikarfiolm74fkmjc@brekx7lckr5v>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-9-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-9-99620e07f505@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5ffd0d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Ma1kd_n6a6QrSrUqt-3CuEm4nUM1r6ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX3yCAgooOHFRC
 HzfWX18Oe0ikaZyyum3Nd80XufP3TNLjdZSS99G+vWsN8aKkF+PTxYMM7KwlhRwv15WRJ2tQsqC
 bb3l3xll4nEVfGKGoTqzONPeXtrMKfvOgtqLK1wlK/OYSj0zyjBRCkGEyU/Y/Vlsi5zMRINitYE
 LDWDBD2mD9/LAbiSfN4YSb6b+zGGd5TNcaz15LjiF0HDrrTx91qdiIC1w0teSeMbtV5Di4wf66A
 dX3TKJAUK2Yo1Hm6/c+nRSGZkuhzLqHplMY7ItIbp0wQaKNUWjj5Xq6LgosJtFt5AP15vgsrb55
 SM1CnkyMWxkQuV0/86u2DbVzjjCLXnsu0a9v4avazUf0pep4ucayy3x3qcQktc7qVJyNoQLwqcX
 4CAL29pfxxQXCr+I8P2KWrAuCrPurWgAmHwxBYOE+isxh3ySteXC5/wAipWu6AAuwABdaLo/uuS
 rLMh3ulwKriZ1RUrZDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXyiorGf9d5nID
 XVYzXfrUfydcGd73TlP82z1pqC0ByKQ+gBt893ZBkFua/HZzUpwvde11N9xghxAB5/FS/7mhFQg
 AO0dejmMzxPxVv12Br/p/I/xF+WzIn4=
X-Proofpoint-GUID: Ma1kd_n6a6QrSrUqt-3CuEm4nUM1r6ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:06AM +0530, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
