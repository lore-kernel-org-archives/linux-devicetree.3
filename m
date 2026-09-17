Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5600F50EBE1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659371; cv=none; b=fonJvAraw6xYGBAvZn5bqLre3oxo6TcAnWkRJ118scTlYtWMxhvMn9Uf+TM77LrRxBO6IQccMdPz56Q8QGb1FqgqHYk1WoubS9P4idPaE2AAtZFaAuuIT5TlUpSUA9NwUuCKt7iUC3Bn4V+9ax52dtMxHLn9DmjZUOq1BPR9KF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659371; c=relaxed/simple;
	bh=+iHkduZZMvqiS4zbkORDMTsoPplFs+u6nA/atCreelc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLfe/0P+6pcevfZ6yrIcicScgplMaT2yayGkjtIyZ+4WYIg58o9fp3rGMkgcjsRaH12tsg97w7OyBveqxd5mZI/u0uNdR6RngeD9qxiTpkXETj8S0u91M85KXQVTVoeSP+Kv+UPz88p1ThXqxwKXFnPGT4C7Yo7Fsbciq6k2Qyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ786Q5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZG2k37V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ786Q5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZG2k37V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiQYt2086469
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1eUp/uF6ojAgjILcRmjqb2zT
	qv0dimYWlgVlrOGW+6Y=; b=kZ786Q5G695b/pL6vZ7QOnUdC/cWpDY84dzlRK4C
	FUGNKVqiM0lbwsNt9427tCsXZQoR/q5Avr46Al0s10NNEm9tquVT1Y/NioDzbUuO
	g2HKXoVUb/SQ/e/QYsd7fRRlZZ6oiD97RoQcnk6X8cCch/eowjjeC2KzzsnGcIIg
	WoMd0MRsaFDXa9kQWaoptXrmgKiuV3UWqi6C4giuhK0TvZ37g/MoUGIIZw0CPpRL
	Xtj9JfvZgdhleGDN3xIVg25j1ClI4GCb2rYvPiGhOlFnXnrTsd18d/BJvvdljntA
	2MsZiMnm8YKXXzHguEXtqAc243tdqyL07w6z2UTo98qsrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu41292-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:36:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so164211885a.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659359; x=1790264159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1eUp/uF6ojAgjILcRmjqb2zTqv0dimYWlgVlrOGW+6Y=;
        b=IZG2k37Vm6c+y9JD/ofhZkzN1Ea3GamLtMOPvZTYZd55yALWBKtCM5G5CIU13e25OA
         hDKfcEf+lg03RvQoradrRHq0EQSLiKa6/xbxZ2nmRM8uTwe4/INkq0O0LFtQW3JXeKWn
         OWsaAtpEgF8wnLySNeWpsKqdtDZxU9RS5mwjb9YGqCRzkaiJTT7kaspAwjVQbGkVbJCt
         eNocUpnXKypurUj0KV/oAhy2wYRunJFeZdjfsvJKhIKEMrPu3lOS/XFk3qNM7jXEPKnh
         ySBFOp9MacgQ/LlhlDzqb5VgraGpE2WghMAer7aaWcFiM8DSHFCMKrhgIsQH4gDy44Xu
         lduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659359; x=1790264159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eUp/uF6ojAgjILcRmjqb2zTqv0dimYWlgVlrOGW+6Y=;
        b=nVMMrW5ZhpQ9mQh0ES0Y6zaKKwouF+lG/sDojevkQ4K28MKj4qPBbpGyTuMJonFAY7
         SAyz9a4L9LfBpoDVk6oZ8S/WeHcI/wQmcOhW6Aog3LQtEgflQAlh3WwaFFYFGoeFbsLg
         Hm+U8F8USp4fYkziH16lD4KK0gcVHVNISpIqXzJeI/cfq8xI/2KsvNzfNpiRykIB0fSW
         8palckH3Bm6bXoZ1t/+TRllbW/999CeiyGFEB5nUDZeSDWqgw0B2X/dAlw8i8r8CkNSz
         quCaRq2KzYpEnAQvupNnpYRj0+mJk5SayPdOSpQ4C/r4bebn+q2yhMRl1H/xcPniAqGM
         3kkg==
X-Forwarded-Encrypted: i=1; AKwUvBy/evy7mP6qAEn0L/Vn/uurQXT7cOulJbFtB6YY5Q8EaeGUILgLjkBeiP/pLwIxsc38MwICfzMEPlYo@vger.kernel.org
X-Gm-Message-State: AFuF++kOyLAS8linDRju0O9bb280tm5xKlKyIHapks6Qu5fOlrrqXHiG
	+1bAvARKIniCq3xIx/19Rl1PcAmaeDB57Yj84Y9ashGBla1NZGtJyO27Nvsq7OKOS0XTZKXHjBj
	x4Isa3uUN68fWaFZFqkw3GdQq680yRAeSnhDhtUqu/Vy3FDeYo7v2zD0UkijO9zcu6hxvFf9r
X-Gm-Gg: AYBFou3NwSWguuzGpu+JC4l2sVB8TYtYPB4lQeAmUqtde5Rk/8PvC+6hcwsuIZV3v/p
	bhoZ7stdl9GfyvPuTpxcWG/JX8EEZBalAIaxBeoJRmPBp6w8SqgD3tjXP3aFmaByleG2pWUCut+
	5RUTXtuDSvFpB/E57MgbdAA4Gj5k7zDvRdp3nJv9euxujulD4atCbmthsT+u8Fr/WBDodJFIM1t
	2KVGrUtpuL+8JL958xGo4ztoifIJG4HKFC3Sr5sc60HY1uMOw8SsjbBHSvcci8uKZPBrqKAcjKL
	FaAVCOlOZbKwL6r2Dp1QmSim9OglwAt6/3BQQJV7eXXBWFsG0acXNiW5sa2Wrb80psfqBtsa6bN
	U2ZpagpiPjgVpQw==
X-Received: by 2002:a05:620a:4725:b0:93b:d79a:c465 with SMTP id af79cd13be357-93bd85f0415mr78854085a.61.1789659359414;
        Thu, 17 Sep 2026 08:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93b:d79a:c465 with SMTP id af79cd13be357-93bd85f0415mr78847385a.61.1789659358745;
        Thu, 17 Sep 2026 08:35:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm134249535e9.10.2026.09.17.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:35:57 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:35:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
Message-ID: <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
 <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
X-Proofpoint-GUID: S6j03_aRh_VZV0UdeuqdwvUBM7yWPcbc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfX2X8BeEac99Mr
 iyMQ1T+eU3lK8APa/N+RlagkcJupcWsPQ3mu3Q5+iTKucJ2sq/zTOo5GbgiLA6p/BAW3IHMlOTN
 VHKINRqwhcFBIu37zxk4t8u3CBdcbiE=
X-Proofpoint-ORIG-GUID: S6j03_aRh_VZV0UdeuqdwvUBM7yWPcbc
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac08e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=mXbM7gEZnszqHwy1qK4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfXxsAOCJpqGK2K
 Y9i/eaij0dRD49gAFo4qXikXTbV7f19L6Qkzw+ri61TH08AFn4AoI1Jh96T/nYDT7qT9Zp66Y5S
 Zxx0m0j8gaJrteLCQP0d39Tmkyd8U5D83siYOtX7/ohfi0+698tb++mZb6UcLmvf9jugnr641g+
 zbc4rFge+VAN+Gjql77ZWoPT2oEX00gHnn+yWpIUMNtRATYTMxRqzXiAxdPT+/WPTnz3xIC2lEM
 nANhij/vNKe0Z34aGvNF26IWxSA3cwOAZCTJKKbmiOcNEsoPDtksm2q/WweTWLTIO6DPfv/Cb+s
 2boyGw6nIktsDJBfNi3Lj5+VoFz4vKWdsAEKwkyoTvKhcX+fj9iQcucVl7VBw33bay9Mb3X8GTz
 y4LlOnPVymdlzg/pUbIRXqnm303WQulA7FVLjRL2nIJOZYXbqAP7uWVrMAnaHBW3jlhw06u4aH/
 2BSPIMgQaZonFdpX2Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170221

On 26-09-17 10:07:31, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.

Don't mention subsequent patches here, please.

That is not a good enough argument to disable it at SoC level.

