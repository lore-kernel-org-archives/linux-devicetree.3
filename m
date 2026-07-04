Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A013B5B3
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124391; cv=none; b=kIGid98e5msTufhQMkKrVgVoWyFs6sU/bfHrm84fdyAhR6dtdIfl2OfLbKu+kXSwyucqxwtIz3h5X9zbwNdFqXYGx01htl2v1mS3uuMbKG4p+V4iuKG7xl65a95LIRxqyhiceETmIua+EXzgrVjt52sGyvTraVYHL1e3rnhSH5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124391; c=relaxed/simple;
	bh=FkkpdWAUNraBzi5dASDQ+g+cQTyV0v51VYQVWLrqPPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rX+1NqPjC3hqnG8ePQ7ki7moktRjaWdM/77ClC3/07yaZ3PBgLejW3J+jopxE2JmBtVRrD9FISVlT8CphAXQQxcbeErnLsQQMqdEhO4f9N4vvFdCww9RG+z+vUAKfJ5bfIhwu6x/nDvrCUfHdmkB0GaMo8yX8yXykcYJBpdXC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu3uGO+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrnWi+mZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu3uGO+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrnWi+mZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPbUp871895
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jsHH6Scg4UFpqoXTrp/Kx37w
	2IUpCuCyL6VPotB9fko=; b=pu3uGO+jEWzmn8T02xYDZ9lWq6CTktfPa0RpjlEN
	9ST71WrcrXSofMs7IXSquKebgHfa3vHcimoClhdO1I0bwLN9uVyVeOT0gs8jeS3O
	dOugmxHL436/wAlExJLqcOSG1imLSk5rL8C+jnloxbRdhk4+D9X9vsH68M5DEJWI
	lS5iI5FP2v3Jy6Ln1pCvJIW6m72UwfinyfhUMPRFMaBDIe1uphV+GOaeKvoX52Dc
	kuFADmgSav9oHGLUqLk3w+iwyJWwIxPAXdX+44YBtGV+rf9/r24VTscdlTHZ3lYG
	7vC0ebtF6x8+8aWa1FhyjlqE9OKaHwz6H8GgAWUbKHHOyw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n4c5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:19:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so11740956d6.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124386; x=1783729186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsHH6Scg4UFpqoXTrp/Kx37w2IUpCuCyL6VPotB9fko=;
        b=UrnWi+mZh4y8nr5RGq1l9hvuNxDWbW31++/hzhYlSW+C/GuaXsImrefXS6ek45UfkT
         CLTHqeBIVt/ao0uWa/y5nW7ZLwdPwYPYqMhGY1uTzMTDLzDlCsaFbBYcXpNvMn/xsjPw
         aT731EYBmQPoeR7fALo9BF43rG0odIbQdcpjfxXpty4ljx81wgc6nzEUNvmzSdnzcGm6
         gEtmSN7SRMdoeiJJA/tfrtnwpVi3aNdTAgR/ogvhNGzEh3mzAipwy7qooasICVtEnZsy
         MjFiVNcrWygfvgEAkGJX0Rbg3ZBiX5G6c1n2EIv9FlKF95qL7cmb8GtScrBHY3fqbjdK
         xfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124386; x=1783729186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsHH6Scg4UFpqoXTrp/Kx37w2IUpCuCyL6VPotB9fko=;
        b=ExXFeqTpLbQ2HVsPsvqcR0RrbBBmG8jpMER62oXOVcVvJP1SPuViOar6R3bbNtjSUG
         K8aKzNucZKH07yYVuiafEjCZOlASWVI9PFPtNjxnpnVxd+WvwfXJ3lrExNmp0j7OIizw
         2gI1JKSJurzo6Ab6Iffy3dj21uoYzlOpM5rdT7vD+rQWT5W8FKxeuwgG3hj8q08+jTuo
         V+G7DnUAZ6eWW0xIQxd6+pkj5FXBfpbwqXLNw79IDKlWE5vDRkoR7wJHrdvHAuL2Bfje
         iEHtlY0D78seeu6Ka2j2Bays80sYmN0w71O6SolXBa9NfjfYX8y05qOB6MPp9ms167hv
         LNSg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0vQEDdQMzuok4FuaGK0gjsd/jGjT8a7CV3zeVPNfPrpTj6sVz+IGl8muwCaai1K+SfMjdl8Ro/ipd@vger.kernel.org
X-Gm-Message-State: AOJu0YyQC+8mnyEjBJ1ErAuyp5Qde8mr8jp8YZPSed3B8DsEu9nEWI0L
	U5ID5whwBn9b/2DcuoDUyJhEQllocXrT/nO32g4BscZnL1gSQDR/xyb0+nPUEfuOuC653T8im7a
	I4ubdKiw+jK32wipFZKSo1LfIJ3W3iv5CUIc0UBUs4oaMxLSbUx6TouYTmV7kP6vS
X-Gm-Gg: AfdE7cmqhhtf7CrCBp7HG2LIHeJqlTKVaFvCJl0T+jsWLjWzPR03jgz9eu6l5urnqQs
	n8nzQtkEEctqmGbFvgkCzDpEu+EB/zLDvr1yJuwvUkR48Ez0nKiXUOo0t65f2UK/qIm+BKNMH3t
	IjuFTYy6OENmpLjFQBftty+lMXFjtuWl0OHizgzRfVX07culakiZMalXRS+YthTAC/WhlE1p33T
	PARGdsQFzYaCm9ysuhnoxgArZTiBHUr5gFX47bsem4CEn2gsIHpQ+nqc+LCTlhH0qJcNh4HvtS7
	21ZgGLoqzHLuGSKNOzKBk7Ych6u+B9D4LgFZiH4GEX3illl7YMbCZlH1nZqpjG7XWS9eauT5dDi
	xqC3IDJ93KDX0Uq3t+N+JiqKodfZO5m3O1kuNBW5Zc/JqxPXZL1T7rfIgLK1cqCUv9FfnLloxHH
	wgcje3wsoHpwRusryAAvRKQapu
X-Received: by 2002:a05:6214:459d:b0:8f0:9d9c:52c2 with SMTP id 6a1803df08f44-8f74997c5f1mr21234136d6.5.1783124385654;
        Fri, 03 Jul 2026 17:19:45 -0700 (PDT)
X-Received: by 2002:a05:6214:459d:b0:8f0:9d9c:52c2 with SMTP id 6a1803df08f44-8f74997c5f1mr21233776d6.5.1783124385251;
        Fri, 03 Jul 2026 17:19:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb7dbsm864403e87.45.2026.07.03.17.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:19:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:19:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Message-ID: <yetssi6x6buxvjeanwqiigtclvr26djkm5j7kw4cdqsa5k7iol@ygnl5723bjvb>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXx5k6gEj3uQsa
 Q1nxxam6+Aq2BarhNsKmRCPQEszRwA85RxeF7e+KtU/h6kvQHKG8x0G4SAraaPo8jLKbq0N+V9p
 j5JHrThz3ss9UuW6waKNZ8iJW1phHV0=
X-Proofpoint-ORIG-GUID: a1sM92WVaflPHSKHrvg3hrtsrJHJqvSc
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4851a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=slVkNxoZvn7uzNb-wxkA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: a1sM92WVaflPHSKHrvg3hrtsrJHJqvSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX0GLoiGNMoOuQ
 kAUPYLZgCUNnEtgPGzHDJ3TK/NTfWoqCWkW21sXlgNcXITnk/yFSrV6v9Gmy4e/flu1L5rc41x1
 x0mZ+c1Fzd+l0PkZbKFgruCT4WrUfXinhsRxyWOBGfmyWHpMeIxNclmMrZgu9Hb97xxhkggc8fg
 CBAgKEkkUXQz340CVhJO9Mth80cvg6kjEr7ClFqAVL1chOcePqqWxw8iUeKFvmb9Ge/Ltc2mDAZ
 ENCxXXfQsBCDzxHTIgiQMPQk4Ibl3WQzZOQM1NU+EEzdiVSX4t7AnlK70H3Hut61sazaC/I2InR
 DtL/NJKIrq7rIWK5cHMF2q+2UfpjNXUDEDzL0aFwazj9+zT0ZT2IVSYvBDSE4oMqUpubclgHfgY
 SD1xi2bncpde+4cF7f9OJzK+FtsDAV1zTevQv4YNHMiYV5Qj2Jk+sLx7IWhEwhpumKa8SQEO0d0
 Fae2fnzy39Ga6YR3vdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:34AM +0530, Imran Shaik wrote:
> Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
> clocks are kept always enabled by the GCC driver during probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
