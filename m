Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81B38838A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300363; cv=none; b=B20L58srJ/mVsER3s8e3zbp1HaFRoEOPyqpeQ2zMDdwRrLpHqfdsSjlLcFC/9uYsZd1plvaI7/HS1TF6ABVUdOWIkRj/63JjIIUSHbuCMeUn+uZXdNhO/6cepX7MKUUE7fwHgfQNC+b8/Pj9PHU0aecg5q2w5FIYY0jk9LsD1XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300363; c=relaxed/simple;
	bh=DdHQWcGkWTZQsq+tx4owO1SCoJ8vL53+Lw7JFIQisUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2VIZP3WMkw3d5nyPCK7VBQDEeVTPVWmpEvSoUjnJwfRXZL1w+M5t0GdrxbRSf2Ls2UAsfqqKXhl9DTk4cvqCPBWhlVpNUP1ti6IzKtxOUmAPEgXTPVPxmbzsMC34iNRm1t6by28qb9FIRSiDDcDuQk21Ax/3V7qa3PEZ4Y4AHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9SjkBQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAH7PrEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9SjkBQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAH7PrEA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6515p0oX3223903
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 07:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+YEpzlsDuhZpuFokwgbow4nr
	FcwBt8AvwHBDugGozCg=; b=d9SjkBQ00TphNyTkMSzYBKAF+zrlYrgbw3uZmPJ4
	7uzJVOufc1t0UF0P33P7pRCHhlMkOKCzxc3VvMCY0Y6m/QnANmKVTIj6/YWzvvLD
	wk1J7JZR7KYE2B9f8rGA7BNt2Irv3Q49Co38pRaX0YzyZTdUDH4xnONchGCZVpGt
	KZRUNYpwpBQ3ZK+JwZe/Ot0wRVz2mD4WhG4sXe01kVMZGvPRnz6XPmmR1hhPwfmF
	pCQ4QVOZ/RMlfAwNKUVXYPO4rgruRhp2EUKL+xJvGl7/csRV9U9aD6bXU65uSTrr
	g/kIGe1jZv3S6XozZtObynveaAzeYgyeIWE53H5Rq7iO0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuxf33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:52:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a0e93eeso34903871cf.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780300359; x=1780905159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YEpzlsDuhZpuFokwgbow4nrFcwBt8AvwHBDugGozCg=;
        b=EAH7PrEA6fGdDdcd1tadMpoJApC2aPDfea+YnQZgc4iEKXs/pkg5mRBU2CC12VOtXT
         +H7cfSAV0krw7eMQEmCwllZBS0IKK2QzbktDNhknbDMHvaIDNRh+Y1L3Qw3Wy11Xxrnl
         YqfPlw2T7d3ZS9aZQPmN8fTM1UN1LiYTa70YEnAkr7kGWECWD2+izA2EE38P8dkxGFqP
         A4JtfCml/hxreGizZERPzqK1cqkextuarhf309gvJGWo6QdVcrs+dp8VUImyz0FZ+0Ay
         gX9bzPAmPuSuqmbbUFHojto5wCAFNWpzzC5XEvaV92LADeggH3dth2l10Owd/ZM7ma1P
         M3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780300359; x=1780905159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YEpzlsDuhZpuFokwgbow4nrFcwBt8AvwHBDugGozCg=;
        b=ZYGk1RYLM08Pqk+JOxkiJna2JPYViMmU0AcPA05MxV7YIAuiuCm/YtJWLjq/RW0zGJ
         u5ODbYScowdFAVSzDx/FvWSiI4//Iyl1IczzVaDsNVgnLGM0G1y2xjJ3ZTfCS/4rAmRi
         hJDD95m1MFmDDgHQvSORxN+AjEf2gNsO4KjtphnhEgxUDEdXUInJ9QVIpWSDvFzCpFqg
         1ZVJVUG1xqVeJwefN/EUaKGQLIyFgaUmFixMIwaaHw1/ez0o3Ibzn7sU+LQXmJdeMpKq
         p2GnG7I3ioBnH4mWYeknyM2b9QrkoA6ECJ6OSmdxRJg8yI77B30Law/zCFdcqjRNbm6r
         actw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZZ8ZUFUSRz6hoZ70wG1nAarAHQfWheyCpd6Uwk3yZcu/KHDbDXYyZ8prF3RoTRxdPCRl5zShpbZMK@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFkPLmUGkvf4s/wa+ake6VNjZAxdwaMF/knO8gOn2ckuhSlwU
	kmA2zeeZYbdeHWtnIGSypZV5jGdeXYc4m/7Cets/159QMp6qEiU1GjApR8XnwpuiaKB66caF5VY
	YoAYvAHNuEXEYXZynmrGOb+GonkB8FAh54hBzWhkj6wntmRyYGEVkyk/iiVSKNzIR
X-Gm-Gg: Acq92OGRpPT/6WO0mC60kTg6MnnqMB5O6eyNZzEVqGeg4Y6nrKMuFsu8OeFXeELG0yc
	2kWqCREKhlZp+sh561IwFqLRA9n4byqE/CoOC47BiYe4MX2rpVX4NpxSaXwKNcS85fkJuuk06OH
	sktXT0aIjl1qAO06nGEI7NnHgzjKcVRrvV9e+KDet909hSDkKx/rSMLZcoKqZgjWIkMWhZ9y5KK
	Qksuuuk1/xbA804moOQWfL1GX+1xKvPbOuhnegeGC+Cbu2bXkS1GETz3e3yjtoIeB3ILAa9JE4B
	DD78TFHXp3o2aYSaxFCab515vRQwIzaupq2UxhrYr4QtQcD4I8+HBbXPlcQ/boqP5Njb5UDRS+1
	8VhVsz71U4P3XL3vleuINVjOzvj2JSgV3zt3M2Rxr8u0soWx3lFHcURarrN/J9KbSlZVAyQnP58
	Vf5CgjobUX52cKK02QMUw9Ln5RyM2zxZa7sEfauZQw6Ff3iA==
X-Received: by 2002:a05:622a:8586:b0:516:f4ef:5c8 with SMTP id d75a77b69052e-5173a70df62mr121771691cf.21.1780300359053;
        Mon, 01 Jun 2026 00:52:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8586:b0:516:f4ef:5c8 with SMTP id d75a77b69052e-5173a70df62mr121771531cf.21.1780300358615;
        Mon, 01 Jun 2026 00:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39661e708ddsm19120501fa.22.2026.06.01.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 00:52:37 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:52:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add
 bindings for QCC2072
Message-ID: <mcn4ysrxrfqo36tr7khsxnjase3priskimkgxuacgma7jcpa46@bgla2znqhyfl>
References: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
 <20260530-funky-mackerel-of-current-878e2a@quoll>
 <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3OCBTYWx0ZWRfX4MAolCopZjrb
 TscOADS96tcNhS8MDQ9tHePewJ6F7pcTlZU2sVN49I0AH9260//b8jEsGGcEbhW6ipahGIG7XMK
 TXO0An3V+i3p1PJNLrJeRHY9wtRs0a9PyZ05H4qjdt4k5YSmWyaPOlSwMsVbGDCHguJFTCVOU0N
 OpGtC4GCmUDo9GoLnSYPXF+7ca84jsm0Gn+xiWIPSF+Po1vBxUAn1NkD2XPN0a5ILMGpjeOZYRr
 VDEe+CYMc0O+CuKLo7PTO6ARSmFadhRSJBEBgTXo3i7zMy8XBJBfMxbXWLcyJFvSronWlWogJrC
 o6mx004ZhlsY6/YklCLCaqGdRXIGis+uiTJN2o8n07A3AHO7kLpIfAXtvMTUAIjlUAKgfuokd68
 bRLVp5ltvmee+mbkHrDN2B6jRq0dWGxWK8ZBK/RzUoVOtVafkfvx5gqOLCZwwBccrjl86cJh5PJ
 ZYowK9bdnFhratwTf5Q==
X-Proofpoint-ORIG-GUID: 6IytClXRpY77aIBSNHbqGGrTRSHliEv_
X-Proofpoint-GUID: 6IytClXRpY77aIBSNHbqGGrTRSHliEv_
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1d3a47 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=mlDIMNG6S_g-ndTHxx4A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010078

On Mon, Jun 01, 2026 at 12:50:00PM +0530, Yepuri Siddu wrote:
> 
> 
> On 5/30/2026 6:04 PM, Krzysztof Kozlowski wrote:
> > On Fri, May 29, 2026 at 11:23:42PM +0530, Yepuri Siddu wrote:
> > > Document the YAML binding schema for the Qualcomm QCC2072 UART-based
> > > Bluetooth controller.
> > 
> > Where is the rest?
> > 
> > Also:
> > A nit, subject: drop second/last, redundant "bindings for". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > 
> Thanks,  I will update this accordingly and send a v2 with the fixes.
> > > 
> > > Unlike other Qualcomm Bluetooth chips, QCC2072 requires no external
> > > voltage regulators. The schema inherits common Qualcomm Bluetooth
> > > properties via qcom,bluetooth-common.yaml and serial peripheral
> > > interface properties for the UART link.
> > > 
> > > Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> > > ---
> > >   .../net/bluetooth/qcom,qcc2072-bt.yaml        | 38 +++++++++++++++++++
> > >   1 file changed, 38 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> > > new file mode 100644
> > > index 000000000000..8e2f15a75d62
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> > > @@ -0,0 +1,38 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm QCC2072 Bluetooth
> > > +
> > > +maintainers:
> > > +  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
> > > +  - Rocky Liao <quic_rjliao@quicinc.com>
> > > +
> > > +description:
> > > +  Qualcomm QCC2072 is a UART-based Bluetooth controller.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,qcc2072-bt
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > 
> > Looks heavily incomplete. Devices do not work without power for example.
> 
> The module receives power through the M.2 edge connector and manages its
> own power sequencing internally. Unlike bare Qualcomm Bluetooth SoCs, it
> requires no external voltage regulators, enable GPIOs, or clock supply
> from the host, so no power-related properties are needed in the binding.

If this is a purely M.2 device, then it should not be a part of DT.

-- 
With best wishes
Dmitry
