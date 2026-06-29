Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74E632B10F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741390; cv=none; b=QTKUr8FUa5X+olYhZzVrlqlg8qOUamWblP3YRwfIDTE6M3y+sCunnHbT+47g4xMdZLLnEDOXDDAjg8ZnKpeYl/nRy1ybBQLza0QRNst56LAwMQFXQuh4pWYq2RgIfAMyvVN5tXX98HzoXO9GwpQwlRbxf1eLgAE3WxSf2PFQb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741390; c=relaxed/simple;
	bh=zL8AnQy/XAgYIIOv6IcRxAfWemq3VM6dbgmjawO8bBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PA9cPwZBEM//1j2g0SiyZbL7ZVw6Y13JsdbEpXoTRT8hU5JxJ8qAH11K+K9eW0asZGlUJB5j8Jy2KgpexNoy9mFHlgC5jWdv11cnpmuCNbXflOJJhY1KboC4GQ7T8VieEm6gaN/536yWo1uxM+B90jTmr6erd9K138WiUzZTmCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSymgFTU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGflzi6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSymgFTU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGflzi6T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEtL2579129
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJU8RBSQ48CXmS3SVpdgm4U7F9GUedvWW32hNLXYisY=; b=gSymgFTUiSa8ObHS
	PKHSjTyI2Ui/xNrxFxtXT9eZeubNA26sdRDTT00qOQOYBhLOghmzpAnsje8HnabZ
	gEVpuIiNJ+9frktuTS19JqtvFbZxvmOLteGuQE7hrzObNraVyMYWaHwULWG4S1+M
	H69Sn+Mf1JVUV/RNlVWK437oqcbr8Pvc8KfQ8ZL4TkAe3iOX9k/mHNhSnNJteoKk
	uZ8+nd9Wvwp81pwPIHnnLlK58XattzsAJ25WlBp3FyIX0hYA9JDdOIaznoL0lGEG
	x61mabU1WaoP+pUiYG6SIKSyXR9BioEKeLAST/r0YxgaTLtsr+3C3o3Ch3h2uHGe
	I+PvpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hn9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:56:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8ee253caso2176571cf.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782741387; x=1783346187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJU8RBSQ48CXmS3SVpdgm4U7F9GUedvWW32hNLXYisY=;
        b=UGflzi6TK5ujYrzoICxYF6vAcaQqQMhEaZ/lf/Tf+2cPdZUt2vuZJ2xT6hfd2Zdlc6
         +dLYbzSYM6py0CwLakF0jb/RD4FagOPeKafZrJSFBZciOHme+dntbdl1rkclq8ub7vVb
         7XhMZY9+40iYnEMzLR+W33qNfn9eNpAxIGiLvealGWiPd7sOhPvW84UUN5xxvR/6rM6j
         EtrTm0XtuRc7i2SEQT5D/Evgcxg/9p+2AVZ3/VR1AzUNA7t+HLd3PabljHCnULAQjaLc
         ibBImvyBBcF/7vXPRGdMpKkk3J2WHeletj2WIaF9Dlc+tHDTkKxP6E40I79hTURgsdmF
         uWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741387; x=1783346187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJU8RBSQ48CXmS3SVpdgm4U7F9GUedvWW32hNLXYisY=;
        b=oTb5CK1gvqKrzj/VTe2LpP/DLDkaU8Wq1/YRjlgItJZjV20dkivy2wih0gwBwqfNfG
         UFKhNwPnNJKiRTdgYZGjRbNaCVkhHtK7Xm5fZr2oSDLYIX0IP76zOc/XgHjbv5bpUj5f
         m9otwrXuy6Bqyh3i8ifDS7CYhYnorS4wUSYHxk3N6PlNBR6dN4UtV6SIoDX5JB2IMGzb
         gtmD25Zv+J8CW0HuLKPlMM0mjx00wDCjGv4yyWgcRFGga50MVp8460PmuENOUBB2r77n
         1v/fHWbrh2SewHjY+aQrwwd3pOTEK7zoT3naqBCYTOs5pLxGmMQyGdpV/zhPE/MRGIUl
         i8FA==
X-Forwarded-Encrypted: i=1; AFNElJ9woB469Q7KOlyNsyETbZ/G+aiFYFhQYDUBNlQwGWx7MSfGEo/bAvlbYcxZ9vU+0CI30tGl/2H+ANz3@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYOcEm5NKD+C+D8a5ypmLpBd6URIiEIyfQL6f+JKW1RXUzW8n
	aB0tM2yn9rcrliKon70SEUQPh/s4Zp+1bbVXDOO2RKpo1bJEHalWeQlNCkCHDA32b2ffYVAmx0T
	jGeIQDjtRzNpxvyb/7augSFLo7lFN8YTopA4G5GlXdncC5kxZJ/JFJ16p8xixzBbO
X-Gm-Gg: AfdE7cl7RtFPK4hUMaRU9SsMp1FXuWwTm6Hy/sMozk4q02XBmJ/0+pViuEwd23bxBVa
	noJDjLypVzvjCAim/8qxWlxq5KfeJ8rvcjoIyPaMbUiMLFZWDBRleVCAwF4PnOh/y8LQXmK45JH
	ongbppzaSbLVSkgoEXLS0B5wNcKtHP3mf+ENXqCT24vRxse0G6xpafRw74jqNOEcjpfM0nboUvj
	rYdt2Nkpn40TOV6oiGyxosN7M89KVB+QLDacbsRU9WwGuJtwzxjSp0kaG1p0/HkG0LbHDjsJU6t
	7mN6K3EvL09ty1dqdG45+/wYeMNnNVhtCbPKROxD62cHPfv+gatMiS7dM+I3E6KuCbYX9t4wyDC
	JAOMgbkbzy+4BCXRooBNiXlmtEeWBbcVt9iI=
X-Received: by 2002:a05:622a:1aa3:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51bff78f4a3mr26922381cf.5.1782741386979;
        Mon, 29 Jun 2026 06:56:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa3:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51bff78f4a3mr26922051cf.5.1782741386549;
        Mon, 29 Jun 2026 06:56:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1256c8c643sm253823866b.52.2026.06.29.06.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:56:25 -0700 (PDT)
Message-ID: <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:56:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNSBTYWx0ZWRfX5glP033NepK4
 GbvwM1t/nEM9iFEjJ1+GdKg8mXQcum4j9Rzy3UbITUo7ovhuvWLxIUUaNMZnZ2lEzS/u5F1c7SO
 H0sVXrnBakkokyv7J/r+SxPkTJmRYks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNSBTYWx0ZWRfX5wU6iDAkMFPD
 CIHzGEY8NFxmXOxn98CF7rcAYb/cqYPJ5eEyMiUY/ykwvL+Glx8+EBREvFR915dVSxA6Zxu+ySr
 a12jp8mq2LoWgem5BCDU5aqRyxrdLGXuqR4Jy8yZl4lNLHKHfaKcwlC4Gtw2KSyB1pQbU+42cQf
 Qi+F/TW3irQDezX9Yy6yjyg4Q2CQH5NDUEJNHudTCbr4cUz6QqL1O65pmOm0KORe0n7XnjARSlQ
 nc8aV5MJGkTocVdK48tzkWY494GLJGSR3DUD0gOvprc6j3TlQDo6qYJN+RC9LJBhW5Wdqik/sUd
 0ZgpG5K40w6n+bcqY4J2vrvcg80IpZbQTSZNc8oIXgi51bPbXK72QbVaAjptonaBU7PHJXO7dKC
 rjdQtwwM/v46htzVQmZKOuyNtBkPedciq2+Abp9boAslro8stXqyrXgZWzUDEY9ta5IGmptQKoy
 HFEtdbRmpkCj/NzQq8A==
X-Proofpoint-ORIG-GUID: ZwRtyhxo2wCSCeljIBJkZLdQVm21qVzz
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42798c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=JHnfRRq-H4B07R_KW4EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ZwRtyhxo2wCSCeljIBJkZLdQVm21qVzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290115

On 6/29/26 2:32 PM, Kuldeep Singh wrote:
> On 29-06-2026 17:24, Konrad Dybcio wrote:
>> On 6/29/26 9:35 AM, Kuldeep Singh wrote:
>>> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>
>>> Add the dedicated ICE node for kodiak and reference it from the SDHC
>>> controller via qcom,ice.
>>>
>>> Keep the ICE node disabled by default in kodiak.dtsi and enable it in
>>> board DTS files where the corresponding SDHC node is enabled.
>>
>> Is there a reason to disable it in the first place?
>>
>> Keeping it enabled it would ensure that the core is parked
>> if it was left on by the bootloader
> Yes, observed an issue on kodiak Soc which supports both ufs-ice and
> sdhc-ice.
> 
> CRYPTO_INLINE_ENGINE flag can be set to m via 2 configs MMC_CRYPTO and
> SCSI_UFS_CRYPTO. In default defconfig, SCSI_UFS_CRYPTO is enabled
> default and hence, CRYPTO_INLINE_ENGINE is enabled irrespective of
> MMC_CRYPTO state.
> https://elixir.bootlin.com/linux/v7.1.2/source/arch/arm64/configs/defconfig#L1325
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/mmc/host/Kconfig#L614
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/ufs/host/Kconfig#L62
> 
> Kodiak Soc supporting both ufs/sdhc results in initiating both ice
> instances which in turn votes the clock in driver. In general, ice clock
> suspend/resume sequence is later controller by ufs/sdhc controller once
> the corresponding ice instance is initialised.
> 
> Since, qcs6490-rb3gen2(having only ufs storage) doesn't have emmc
> storage but sdhc-ice DT node still probes the driver, later sdhci-msm
> never takes ice instance(as sdhc_1 is disabled) but ice-clocks are
> remained voted on.
> 
> This results in an issue and hence, trying to fix it by enabling ice
> only when corresponding storage controller is enabled be it ufs or sdhc.
> ufs/sdhc are default disabled and enabled per DTS, hence following same
> convention with ice DT nodes too.
> 
> I am planning to update other DTs too with same change.
> Suggestions are welcome!

qcom_ice_probe()
  -> qcom_ice_create()
    -> devm_clk_get_optional_enabled()

If we remove the _enabled suffix and put a ice_resume() in ice_get(),
I believe this is no longer an issue

Konrad
