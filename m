Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50E3B3BE6
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894582; cv=none; b=hNEJWKsX22FUSlKQUbxGnsG3wuJnsKiy/kBhTFXwDUxyhgHkHCd9AwsnmGm6GythUZUWsvG9+//NakIsG8kqLvtyGrfr4b2p0dFF0VxqXdjMbbfqmy4PnYpT83vdSSOCKqCUMKC6Qxdb6asWqo3DBRyOvtMq5jqeLIrRx0bQtGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894582; c=relaxed/simple;
	bh=xBT86zGvncxYuJOgwSvBQD6ugGny046lVMDOyZKRiVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGrWOB6qp2cDbx0IYNr4wgepoo2aG8IEBWmrMLH67WMpKEVIhwxA1+YL2/KftN4bXgRnRPIszqS+arZ/QsPUiT0OlHm4nRaHzg/ke+Ilwwm71AB1ek9olRBZQLyjCkmEuz6XcpKh8/EyGkkohmBPR48gxX3DE0NAVp7oJ1KuxsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZzygxqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcewmHdY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZzygxqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcewmHdY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618Fr7I495701
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7XZsN+xHgHJAq3PtY1yFAC8D12BW0pun+BLD8eUhwI=; b=pZzygxqY6hE+MJNd
	CuBOSeqsXfQdy607ME6FQI8bLy7mSEEBYxZc4MAKZYaCccGX3beWx0GiU64FyQ0P
	ZKDsu/uuRHPo5dVlWwjJbZVaQWpXlXjcKbXd5r5WmJEFx8Ysdnoiq7nUqGGRc0JX
	MAdm+HFUenhp8WLRGC5yRSeOjAFX2HYCT/BZI2hQWPeputKJzySuwNASw/19EYEZ
	AUYjVmH2qKm7wczvd3HruHlPWPomWKKeMzIJ3WSUJXrBno8FcSmNN7NxjbHoDcq4
	O67ZwkIcb9OEZHylQLRMj19qPB/LzRNCJbFPZ+yANS26h7J8prPcfeZLwnvHP1TJ
	zvAa9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99kecm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:29:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847902a694cso617537b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782894579; x=1783499379; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7XZsN+xHgHJAq3PtY1yFAC8D12BW0pun+BLD8eUhwI=;
        b=QcewmHdYSK53uPrPa/Ok4jQebNepDkH56AkGb12KJUOR8/NfA6BiRyMTnKho6epG9E
         GTKfROiLtrNlvbBHu8SlLcEwFguDxJ5flDd7fsyX/5MsSDEOhbCSozTmLOf9GslmF4l2
         42ZMsWf0WDtjYEMEIl9jNyeQiu2gERVd4ztVz7uxXcfdy6h9DNqsgcLhwAgX3ePH2dEJ
         6vieiqaBmj//Gyid2+rdGwjrnGzqDh4vyqBIocB1KwXSG2gMbv65z4nZJ4b9Suso9oug
         /y4WdVzCNm58ASGJP7yb9SEXjNECEkhdhgEjWxfsYPGr5z9CvIVKSD2BYBzIpPF628ck
         8/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894579; x=1783499379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7XZsN+xHgHJAq3PtY1yFAC8D12BW0pun+BLD8eUhwI=;
        b=L1X0aqQHOWqCXfFLQWiauzIBFMoCFWHPFV3hSSyGOVnoDQ5YiMgIIEZmh3IamkxXgE
         td7H56gW9meGEVYoqq/2/TmJr4PEfCRuijlHEyHh4YDRfTYwQEv+6blI29QCjeqW3R6E
         SGEkLCrGGUEIRVOHP1rwwxnCPeuIQhRhGfAwfpCvsvu4nm0f7xs/Dtdra0yTnvlrh7ud
         0Ys22uKfwYlGc4GpRn2zkPNBTcDe4gT0ljgRgmepoPbY4SVDOotfTsDbyNLpGqOVwxhN
         CLsekOOpfm5AbaNSQpnKrtPBkOoRT/O7HKXsG5hpR9UbGuS6lWIpQ2FEkW3kjje4Oh7+
         czGg==
X-Forwarded-Encrypted: i=1; AHgh+RrPKV8NTY+1XS5L6rZnkk8heRCHsvcWZPcsUK4WAdelKPnPuBM4EDeJRkyEdSwfa72QFOCSSJKF72jF@vger.kernel.org
X-Gm-Message-State: AOJu0YxtcXqbT+qK+ZZZq0pUYiHIVbqhD/7RQU5INdW+LL/pCVUFS/mP
	SF6D0K5ad10apq9FudL+mbBDyVPxEPpQo35uHG4/fqdJMvacfQ4qqO5IazWFTXO+6AKXGkSVr2d
	Qvw/vQDSpJBX/ocyZh75oohJyjnqmOhe5l8rjmXYmm0nPp4FIV5fiK99khcxzBw3j
X-Gm-Gg: AfdE7cnJoZbOXSw14rurZCMs0244hqR5jQyzQkDaFVcmIxI9Pfra7FSe20/HWbDP9nV
	fI9ffULd0QoTfISWO1iT2PdAihtf1W5Kqq/HOn5cqKavm7H+3wIAMfC+FVCmp83RUhxXDI4XV5X
	RikpE2lKCCBgUnkb5lArdlGTszrCsJ3LZi4CbW9xFq6iO2Tlo+5VinUYSxudwKXKUjPvV8ryW81
	kVxFor57ptNvOc0VZNZnyDgwxhl4hqn4q1h1jS7nLdMq7JXLzegtdO3prEIH0c2WCWLHCRe10SF
	scWCB7yEjxG2Bjpnc0NcygrkwrycltLhswtoWLl/lf1kldmJL3xd+GK83u9SBORuW0CzsbGhy7Q
	h09Up4MxLxM7nYIi3XngKYT73fzMqxJmJ7XLFWHcBkWgBaQ==
X-Received: by 2002:a05:6a00:4c0d:b0:847:968c:a0f1 with SMTP id d2e1a72fcca58-847c08806bdmr634747b3a.43.1782894579217;
        Wed, 01 Jul 2026 01:29:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0d:b0:847:968c:a0f1 with SMTP id d2e1a72fcca58-847c08806bdmr634725b3a.43.1782894578723;
        Wed, 01 Jul 2026 01:29:38 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3602813b3a.19.2026.07.01.01.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:29:38 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:59:34 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
Message-ID: <akTP7jU94kwdFL/O@hu-mchunara-hyd.qualcomm.com>
References: <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
 <20260616131405.448371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616131405.448371F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4NiBTYWx0ZWRfX/Mgmwo+qGlnk
 aL90ox+OD4tRGys+ScvlNlY5UYgK5FSCm9uesOHVT1OPwAL8le39oorjzwCoqkEuEzQGtKpjtsv
 KU7C8XMgH+5RKqENPWx1/fe/o4HmuwI=
X-Proofpoint-ORIG-GUID: 8Cv3T7ZY9d2CBP32kg9n4krDFSJSthfJ
X-Proofpoint-GUID: 8Cv3T7ZY9d2CBP32kg9n4krDFSJSthfJ
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a44cff3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=DFnpr0ky8UtvjzgDlIUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoOABgeZipijB_acs4fv:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4NiBTYWx0ZWRfXzs2GR60QP3Ku
 PPF5Ixqzknfu3lkJTkOBzFjdXfNpQW/mA6GKQb3scMJyfGk2jEgxRwYG9y3JgixsOAygdmqYZVN
 fcGvb5TLEkAZBeQBGif1riQEo1WoZt7m58xbqnYLQ8/lp8GLKnL4vlltZxHWVniUXQjS5FFPyD5
 h1uSfT8V1huCt+a38ralZomzQ2PNHnWXHnN939hbqbW2DqmaDG+U3uB2nqggOv+XLvGL7PLDcHN
 c9DCReDr/T8cKuxAOCEA2XVvQfMgLvyuftESRie+cK7OaPoJBce0NwhZskJrF+8BaEf33BIWUp6
 8y5Y7FH4N8e4QTHUW1Go0FERP0DTziH2NNp/e8ZtZX6PBEFnoaP7qZFmV8LJggtuT8yHk4g7r/a
 php7hU+4ZrNDdmQsMxIl5F96Bbulu+xNDu6+b2verI2xtV86s21km62x5j9KuQ2riGy32pz7N4U
 rX51XRrznFcDLzg3H7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010086

On Tue, Jun 16, 2026 at 01:14:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incomplete genericization of `sdhc_1` leaves conflicting eMMC-specific properties in the SoC DT, breaking SD card compatibility.
> - [Medium] Removing the `supports-cqe` property from the SoC-level `monaco.dtsi` without explicitly adding it back to all eMMC-based boards causes a silent performance regression by disabling Command Queue Engine (CQE) support.
> --
> 
> commit 05fd7920ab031fea94cd493a589a30892353cf08
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> 
> This commit removes the supports-cqe property from the generic Monaco SoC
> device tree and moves it to the qcs8300-ride board device tree. The stated
> goal is to allow SD card compatibility in the base SoC definition, since the
> Command Queue Engine conflicts with SD card operation.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > index 7b1d57460f1e6..e5f316897706b 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >  			qcom,dll-config = <0x000f64ee>;
> >  			qcom,ddr-config = <0x80040868>;
> >  			bus-width = <8>;
> > -			supports-cqe;
> 
> [Severity: Medium]
> Removing supports-cqe from the SoC DT without adding it back to all
> eMMC-based boards appears to cause a performance regression by disabling the
> Command Queue Engine for those boards.
> 
> For example, arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi and
> arch/arm64/boot/dts/qcom/monaco-evk.dts both configure sdhc_1 as an eMMC
> device (using no-sd and non-removable). Since they rely on the SoC DT for
> the supports-cqe property, won't omitting it from this patch silently degrade
> their performance?
> 

Update for monaco-monza-som in v3 series - https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

For monaco-evk, it is handled via the overlay monaco-evk-emmc.dtso added as part
of the same patchset.

> [Severity: High]
> The commit message states the goal is to ensure the SoC definition remains
> generic for SD card compatibility by removing supports-cqe. However, does
> leaving the other eMMC-specific properties in the SoC DT defeat this purpose?
> 
> Properties like bus-width = <8>, mmc-hs400-1_8v, mmc-hs400-enhanced-strobe,
> qcom,dll-config, and qcom,ddr-config remain in the base monaco.dtsi. Since
> device tree overlays do not automatically delete base boolean properties or
> override tuning parameters unless explicitly redefined, won't these
> incorrectly inherit to SD card configurations and cause the MMC core to
> misconfigure the interface?
> 
> Should these properties be moved to the eMMC-specific board files as well?
> 

These speed modes are handled in the eMMC driver and won't affect the SD card
functionality. bus-width is overridden in the platform file to match the SD card
requirements.

> >  			dma-coherent;
> >  
> >  			mmc-ddr-1_8v;
> > diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > index e9a8553a8d821..3090eba0317ac 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > @@ -719,6 +719,7 @@ &sdhc_1 {
> >  	vmmc-supply = <&vreg_l8a>;
> >  	vqmmc-supply = <&vreg_s4a>;
> >  
> > +	supports-cqe;
> >  	non-removable;
> >  	no-sd;
> >  	no-sdio;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com?part=1
