Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3BA35DA42
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721708; cv=none; b=eKRNXRDSXSufE3wi87A0kaghAqFJvm0xyNMBozJUNTOJnT3c3wouS4H5bJI5IhQjy9iJHcLCaEDLP1jo57hiO9Sb3S4FCXV4yP0pWihCgO/AdHtBahzgL3zWj/nCMPm2IDjJKDjNNFI9paribf+io1DZ8hnaY1wBV5wTWFxC1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721708; c=relaxed/simple;
	bh=ABD2/Uem12rjFzZ+N1wA8Uzr0Vbc7D9ujFyssZ7bl7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx9l+3cXAHy2L48GQ/4mnYQAmlGX2PJvLeoqMrBxSjq/+Z8gzVauYl2oTwa8DXHPAuI97G6g7OyJ2khieOleSjMcbK/PDJbBBQJznIj9/QH03zwwxJmgBq8sNvYfq2mkaJ2OQRIiuxLdCQcyjuRNqs4oNULmYvpeXhqSFPAgrxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKWXg6vM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrt4pOwl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKWXg6vM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrt4pOwl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HNeq3897761
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dH+aZhaN8+2l2qJbM00g6UXX
	bFecrdPsnX67x3WzUlQ=; b=TKWXg6vMgoByvPeUkNJTD5Fhgaj0coBm+xojWVVm
	tSBL8znXo7s/sjvGxOuxbCZgaDAeC9CNZbbOMD6SpPtIAYPTj8YaMhFvM0xRl5eT
	rJAtj2Dq/MlRKi6wOHbpgoc5D9lBm4nvRbh1E5H2klMPAS0LJ2PjaSUL+mOtoBKd
	/GpBVYgoAJxA8utBpfkQyvvGr2NwL9hufPY0/sBKwK319CORbAnnphsG9NrSzQN3
	isEu+CD6nkbNeJV/AOU5f/8lwF90/1pVxr6FY00IBPE7HxT4Pevmt3LHah+aRoJQ
	iBwgCfnNPYwBVL7LSEOwQ4V17z71d9DtD7W9m5tfj5eSTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4msxsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:21:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so6312661cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721705; x=1788326505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dH+aZhaN8+2l2qJbM00g6UXXbFecrdPsnX67x3WzUlQ=;
        b=jrt4pOwlRUR4UAKz4xpciANF1ucoFuzKpKjPwsj8mQxNmigKX8C4T2/K6zCPUVF2co
         xW10dZC6SDe3qnpopBEcUzX6hm7GmjH5F6x3xb/Dep0n7bgau4BAki9njbBVK8nETXAI
         jEYCzTTs4A8Po2ZXqibT/YanM6BKbyxRsHKYmBlHUZZApDIA906YtGJ2uWh0scmTUjrj
         VILMIhhCGlJ9lBxPFevClx8G1sKygTEO/Aus3NK7T1o+t3t0CPrgZygruGTKgVE+Ek07
         BxPu314EKJyXmQwgFq5yA3/ywG829r9OGwBV5yaDThoiYCF1ZPORAj16msXNmSDoFnfF
         aiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721705; x=1788326505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dH+aZhaN8+2l2qJbM00g6UXXbFecrdPsnX67x3WzUlQ=;
        b=VvixhW/J8+lUF0bXCLsNwB7ufteH2IZeGJrhQ00G147jBDDIfrLwkulQ7kaKKXpiMY
         IHWiOaaGHXJtH7RIpJPS3ii39kFvrLFtVC2oOdlsqmMvc9xYQi9cCFK8bK2zYi85Fr4L
         AYKlzhX9NNRZLk8MtA+TVPi457OsCKbUWYi/gUn5sYFUjql/WOkaNfTHGaxjUzF9WmZ/
         96klhqNwXglCZa8+197Xg1fpUshHuupyBTFU2Z7Om3YRDO/d6n/0gBzrnOUDR/ruTUmX
         qk6nQbHpiPsn6VeBBTFoQQ84vJQscUomKdGxROlnEUh243a26/Y6imoLkkXFDBaT/MLZ
         laLA==
X-Forwarded-Encrypted: i=1; AHgh+RqowNTLs5iEW0FEGKWvp7Js+Gn2tqC70RumHOx1dc6wgtgXJATxv5p7bYUrmfcCjS6G5N24hNmcYGFs@vger.kernel.org
X-Gm-Message-State: AFuF++k+Z9SOV3H+N3twS+kgQGuYh5JrVYVcB7qYGHLcIFJ5Br0k861c
	gQk1hN1EVB5MXLmbt/geL0r8XcGUHe+Om4ME9MiBB0oKi7F4Z1jRlOtD2L+aDpRdRew80lR6WZK
	MA+kX0fC9+bXNZ2jujGjEcOUeHm5EaMg5LGyV2BlF0Vd4vUmaVEWNTNsVgtuTKyga
X-Gm-Gg: AR+sD12TAsF9pkDoHg8rLZ1N9TKbPEuL/ewdTdR5kKXuu3dibcKN5rBPaGcFQgJhrx/
	HmtTbMu/cxc0k9GadrJCFXrrsfv3vd/+E5G29gCJDiYR0OFoyAQq08QofS2Us42MrSFwwkY4Dax
	7AoMYtUEZIDHA1ZusYSTdIt5IRQugpiuyewk55u72sGfmb4ajiSuF/PDx/cxvsNdGV753WWDQHA
	t/KvC63k/5MKR/Y2uUXYc12Y2cUhnaGs3bF9xcEhqP18Yk6IU7qFpPFossOtftX0EpZlpx7l45Q
	DoFun/A2T/9J621CUwtJCG5whMSNV5juine7dVvEdfRe5XhLO90CsuOGOq57EO92i1Uj+ZMD7IS
	I672UxNC2KrRjdw==
X-Received: by 2002:a05:622a:58c7:b0:52e:119c:e82b with SMTP id d75a77b69052e-52e4228d40bmr44170071cf.13.1787721705240;
        Tue, 25 Aug 2026 22:21:45 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:52e:119c:e82b with SMTP id d75a77b69052e-52e4228d40bmr44169841cf.13.1787721704692;
        Tue, 25 Aug 2026 22:21:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1afcsm3720943a12.8.2026.08.25.22.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:21:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:21:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Message-ID: <yhnkj6mtv6tdjignuey2dmhssihtoznisklpofrauwv6iblrmr@rmnrr2bjvfm6>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
 <20260826041200.528588-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826041200.528588-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfX9pXpaoiJ0STs
 czuKSg1atFndAE178rqXStAwtcRo4mHXEOMMcJEfUev4FA8d9fMXemok9ACQ6aYxhQH2nGcrcsl
 K2b/8wHqo7IUGz6rwu84p/M4MhktD88=
X-Proofpoint-ORIG-GUID: DOepsfHE3XqHp_qY950AZHOudlHdkZRE
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8e77e9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tDYwhEyV-ROJ_5m0-t4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfX/vL78O3ljWDl
 +XXRdjzPPCuoQERdvz5PtuQB4Lyj/Hq50Z8/gEsnnxmz54UO11nC2jIwGQCh41P0PqOZuIP1lUT
 JPvi9r8NonO5Dd2PDbpkTAYwj0CBiE27eLK/Ue7r45k7ta3Jj9ofXlTVw7zQ9ojm8sM3gJ4bf0A
 eDbPLOjdHoz+aSqVmEp8ra3a/Nu4Pbm3v0UcTC8DwAtOAt4T/FW0ceG3rdKMtxIquGvXeO/Gepd
 pGi/N0qRUWxr/gc0cLM88EZh9nZdqH5J4CbxTSIxqfhbmJorEKWGUccOERpCWxGk7lQsxD41FYy
 h5JowUjvCwvW2baRPBvhRgUKRhMrSnp6Gtljk42421q3347eNtfHmgqJRSJpjST6SxmhFt/EYef
 Xu3MyW15FWcjP/GBcoRR/BN0icZmcB7E7seg778WuZtOPLvOyqVAg7qvrbPENBddNKU5Il4xQWl
 pyNt5KAf589o82blB5Q==
X-Proofpoint-GUID: DOepsfHE3XqHp_qY950AZHOudlHdkZRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260043

On 26-08-26 12:11:55, Shawn Guo wrote:
> Add base device tree include (nord.dtsi) for the Nord SoC series
> describing the core hardware components:
> 
>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>    power management and CPU/cluster idle states
>  - ARM GICv3 interrupt controller with ITS
>  - TLMM GPIO/pinctrl controller
>  - 8 TSENS thermal sensors with thermal zones
>  - 3 APPS SMMU-500 instances
>  - 3 QUPv3 GENI SE QUP blocks
>  - PDP SCMI channel and mailbox
>  - Watchdog, Crypto, TRNG and TCSR
>  - Reserved memory, CMD-DB and firmware SCM
>  - PSCI and architected timers
> 
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
