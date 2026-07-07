Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F8388379
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404651; cv=none; b=BfnEWxY33EUtpbWvH0m59BSnMEEOzVfOJQF2wCUl2gEDXU+JbuOdOdvACkLOlQPugBZB44sEKPPvVdrxs/nfRapIR1sbTrTrateFmhvDAjyClZRydVMb+q/pw5VyaQIj75j0f1muCIu5fYIXvcv3avb3oehS7ll22F+3Rzgvozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404651; c=relaxed/simple;
	bh=aFJ1UhCzxvcgED6g7D339QLHCZxtht43L7Jiq8v6i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhoD+4CNyIyVm3/C/hytKilH591F/6lyXvsNzJUAkrSSaYkUadHL+TQx9ZtwiDC+gyQdn0cFDjD2tSilTdTCjrG22/PGHGUf3BaetAy0UvJc5PdooVLXKPrXF6jgG6lQGR0FdoBRAIiW000sOSU/NxWqoe0GaER+Q+mhtUItzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXrx9nDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkMhRuKY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXrx9nDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkMhRuKY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674970w2498915
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 06:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x0GnpLUCqHMPUSbU33Fj63+j
	1ve44zUEAjqkCUCuqBA=; b=QXrx9nDzXH77Iwur/NPdhfcrpFEtbsyouuKvVmt7
	8emcXKYiXTYs783bF5p81E77gcP4JwlC+AUwCM/w/JKZor+OcY1U32A50s+82XcD
	Kbk1Cq7EfN8lDZ1vs+cBRAKRIB+yKPz/4dGmsF3fPIAMqxl5hf6VnuQipeMNZHFh
	wzIr8jBoXxi+ngYH1QttqgXJACbPkgJFuOKnM6FDxTs8EWjGx0jV0BXYtYQTzbRW
	dOjZFg6MWFQxE6YG8SZbAjVtWceX5NECHg/qDl+qLtCnR8Vxd6XB8DaY3pWV49AI
	odDM02VNiJT3T+UCj4F97S9c5nJ27B3Fob5EXSPUsF6frA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscw6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:10:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso5983285a12.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 23:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404648; x=1784009448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0GnpLUCqHMPUSbU33Fj63+j1ve44zUEAjqkCUCuqBA=;
        b=DkMhRuKY3gj7i9qzM2GGp3MnELMKaI1uSyBvxlqWTcfMkrYv2Tb8uZaEEQqTu0mvJv
         oLTGJtBdLdjn1IDtKwqXtUvUwyglE16iV8BaG8QO6k85Bh8vtisPHHR7tb8UWHjansT5
         5W2ut9mnS7ocFBxshIjZldR6dWYSWj8TW8tpJ40eHCISGA4IhVMNPeTlTw3SpnkRiI65
         +teCzPWb3InBGnx3NYMlCEMnFB7S6jIuu8sMsSN1+ZFu505MgBwiLcFR3zPgfnM37TeW
         gpDG+AF1WyVAA3iNBE1GEaoLuf5eRK6RVvs5xjeNGGpfe483EamIxgJXBki7iDYZXshr
         1eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404648; x=1784009448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0GnpLUCqHMPUSbU33Fj63+j1ve44zUEAjqkCUCuqBA=;
        b=CeDU+j1XERRbcE7dWgl4RYPWKDM+hcvxGj6ApVbcztFhrzTfPFOysmOf+MKnuuE4bM
         VvaCQEibFhBxEXONhSBpfXikzA4LmCiA3owhaitIPu5T2aT3N8UOq6Ko1cWznthXLDFk
         lzuvCI/lfZtNFaGHgnlV09bENuCNsjKdSXCWf9x/LC/CAm9qcAGoaeUBI0PTleUnbYgA
         AGIRI3Y9CIda7k8GdX+9EJoJgS/0njVZX4i0PuPdyTCFNzSrLkl+rBTMizSK6j48xqO9
         vGBrcRmJ2UqKtOyBpCo6ycfd36Qxz4HCiGNc7NC5GRrewiKHvxS/+b/EC407lPuyvIRh
         N/wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1gTFq8EQLpq5YeNp5lGPMMg6cqJ0k3EEEYEtUOIxkyDiCWBWsyM97/WP2AhKdcKMMIfoFekngIimE@vger.kernel.org
X-Gm-Message-State: AOJu0YydZbKTceZEksCrGimUbYK8VIPzkcJYnqcQK+kxKYT3R66EBNur
	8eT+QeMz0QT4d3lNprY/0UKADzjXBN4q+hnhu1PB5o7yXNYLezvMj9nliwd6O3sGc6+Uf0fGbYm
	y6bpLjEHiF1a/FiCMs9EocylAC7o9xQcAUAX6rq2DGfbXnwXFbdeEBFR2VNBBk3oE
X-Gm-Gg: AfdE7cltDp6+F/9Qz947dlsb0M+IaCjY1ARMJynm1viXwaM4BGmlfXJPPvA/v1zuSAB
	6oTw25Ma37D9ShumA9DjBNOPc4oPyuDDmtdYOgYy7Npl3Cwp4GfN24uqKYKx0ZvXPf9wrlazPok
	ZCC4g0GyY/6HQ9LUc1bS8+CZpb1Wywr+7h1nPi4JsBoxdDHstUPKgR+pE4mHtJIXEHVoNkP3Jhq
	Za16aPMXgqGJi8KG/oAMpMFra6VEXqm3HcrQ7FTVcp+wh4QqFDFMvf7I1wfDz+ShD/xMqzc4/8W
	xJgQwcS8dOqgKEqDRU8JVDeK6F6obOE+sS2gEZW108Vot/JPnuLD21mUU9KdhGARe6d5TwDyfOY
	Tx5b/VIz5+2LxqyBO3Oqar+U9YI4HuN5bWRD9PT/uwoJHtbHHndRVXlZLgO0NfbXyJVkIIZl+9j
	dR6KiFZta4LzR0YL/0ZcnF+urccPml1nBDa7KUqxQY
X-Received: by 2002:a05:6a20:db0a:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c08eed69dfmr4615307637.50.1783404648173;
        Mon, 06 Jul 2026 23:10:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0a:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c08eed69dfmr4615271637.50.1783404647686;
        Mon, 06 Jul 2026 23:10:47 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm5151107eec.26.2026.07.06.23.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:10:47 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:40:39 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Message-ID: <akyYX9XsFTOfuzyQ@hu-varada-blr.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TxDU_wr98qOLK189qxuqE-cdaYieRwgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfXzN9THUEaUztX
 lj+Koa8RCHGp7EQAcXlBS/OuWBg6MdbL5sVybWYEE+ZTtXNtMUOqkqFHgWFLUJtCbYtgTcYFzSX
 0HsMbfLJmrQl7Curfvt/WhYQeyZ+fKXwONbB5RMpwyNXnkezEVymW6tYbxikghjDytGy4/Qqgjd
 +BYc+KWjNO6AzolAEjncRFOqIG/4z2wZVCwitvepl5fbtplE4naTAF35/V/h94fFxN7swaCaJD2
 b9HRshiphZ7a+YtoSYnmiPwF2SHnKVHFzYkPpjehrPK9Jg236GKAXFUdC6uCKMv+2UcASlfx32u
 IZh+7Vk2Ntry8a8X6pYxxd8uOQGzZyOawzxDO4Om7wo1F4umIre8E7tKNcrAhQzL2aPgFftcC3r
 70vuZ2Xc3PdGUzIqMf8aZj6rPXQ9hRQ08a5m0LVztawfodBm4k3Xg8cp9OA15+3GmkSOEYKi9fR
 fhVTpKPtS4sIFWfQsTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX7qaCDnaRgPIO
 In8Cy5kaYA4k+YAv5eKbF6jLBmnOujMNnrOtG8m8L/pKuw11EwKSyfEbAsEzAGjk0mqfFLiQoIk
 o8ZEbLG4qAVGeeDCPH7PMbq65Uk0zNc=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c9869 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IW_28pUNWusqPMEbcmYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: TxDU_wr98qOLK189qxuqE-cdaYieRwgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070056

Konrad,

[ . . . ]
> > +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> > +			assigned-clock-rates = <20000000>;
>
> Is this clock supposed to be fixed at that rate, regardless of the link
> speed? And is the default rate incorrect?

Yes. The default rate is at xo, so need this.

Have addressed the other comments and posted DTS update patch enabling
multiple devices. Please review [1].

1 - https://lore.kernel.org/linux-arm-msm/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com/

Thanks
Varada
