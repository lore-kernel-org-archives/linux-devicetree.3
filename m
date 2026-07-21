Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B637C91E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632998; cv=pass; b=BDJ3fDT6QJzsRX4vCgUn7agcBhEO5u1uOGfoGcRhI48bsjA7vAxtd684Pp1rvyo30rQgReRZLLSuKDPi92wt1adFTUjbRkIMmVGOVNbbxhWmQ6ZMp0jhVmF7PpiFA3DkQkxtF6rTou/83aZpgPhNoct1l9bDX6ejSQiqrE7C9kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632998; c=relaxed/simple;
	bh=6VAx8MsHSsRET9XGAU5UE8st8JXI01ci1xclZOqmkpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZhzfo3kIVi8QzCiQmts4E//4huLaFGDST2xjhs6IHmJtIQjVWayXaThjoa3jD0fkAqoKR7WEpcmbyZp8upuT4/HelzN15hmBgVd8WHaHs6DPEKb11kGuZaTfHK/vYT9D8DQ23GSrVKyuB5Mu8mwnKg1KKQ7HWU1sBzIogvdbm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuMVsVRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1IBx0r4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuMVsVRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1IBx0r4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARvql1252159
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=; b=YuMVsVRbqqYIYTEy
	K43JAyPcUpP2ZBhjvrxmqVL5YHJXPWcWT3PPAlQR7aU5WDpGtzPCSuIsXmQrPFOb
	2zV238aBlMC4e6+GA32SMD9roGsFSNS+5DcekUa+Yl9wk3lfjpw8XwLXcODuphBx
	Ta9wD1xmBJXQYXVTZdSpVFXqlZya+WmSiu+OL5NyrzLFTG75kh3DN8yi/ncfP44D
	/MU8Rq0R7cQMesfzSCgqfii3Byiv9B0poEEjNO+IIkUqALJn2K1O1S6hNkGkUd+e
	4gzBHaLAPlbh/w1abtH8i7q00W+EWkrrIVY6cgJB3VD7KB0SRc0EG7yZQ+K8KRvg
	820hlQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcc5e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:23:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e7cb9f24so2735624137.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784632995; cv=none;
        d=google.com; s=arc-20260327;
        b=AdJ1HmRcTebusY5AGKNa9/QJsstVQsqlWWnsLl1vWOIlZyaaNWFbfEVg95o0r8FhyT
         DjVFTaLY+SVm/0PDxvQ4hIUBiSprBCOcHVkwJ6P3I9DXVyR3mzBXEcblkzhTn+0cj/g5
         16Xcaplm5mx+jv1QQCoJipMVUm9DOMyNeAWJAHC6Dl5e8QvYa+YVdF1Go8ZcoDCqnAwH
         BeltL0tVHyqNIiNF1ZbFPQ1tZlWcPraEVwxCqq2FjZsBhlbWSiMekjCWdMagFyj+RHu4
         zgvwAGYlE7oSbIu+FTju6VFzkpkKsn89YJCaZg05T0oTlzI6Mc/80OzaNx1uQGdFwsqo
         iuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        fh=PST+aelOtIQUi2gqhtBh89K+ppr4j9ARseHlH8rS0LM=;
        b=DrXudj3+MddB7neo0Uly7Tzyrc7QchmsWUVAhogcy0gQZHP9XPelPSgTPb0q+DLaNv
         16jGIudvLP/WK+ihDZvsIJ7ZU73p2WTiVGHMOubsWolHv7mNfDcppumtYAENwz9c/ma8
         RlI1WTR58XHyMns03qTtGTMy+7yFsxQXtuoxLcYEUiCNgPqMsYTW3lg8PCa8NYnTVzpH
         JjcHML8xqS4m8r+3/MvleKaFAYnOHe5v098593BPTVQNAf9PC+k3pQ7+DblSBYMcgFXP
         0upNnyOExCS2BzlwhTCpdAEBNN6V6Vj8UFNRRyjpq31tvJf8p+oPGfSymymfxRuDHxtv
         5Eng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632995; x=1785237795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        b=W1IBx0r4PMMUidhjaLR58s8+GL9YwdFRXMm7I1OJXgMhqyd8bqEiuHgq8AH8KjsTjm
         fKpkaPsJJzF9dDJfJ/P9HmNvvRpZTqQCOAyx7nAph87uSZXQxuku8zeeiVMHG+pCIoZ4
         ckjb3pGVJC7sZfxJ6jngs44dV9gaOBk0xE+DnZhzPMzYY57zaH8hpF79hCr68MuLhiQa
         82D3WXC3bTBvM+Y0uE/diECaPJ9bAlheLQxrSmfOBRV4BgIklfc/y7cP9Aj6OoFvr92t
         hQsOv8DtDlAsiINkzD2pmkKmJEa8jrKm7zmDTy/c+uwljcsqW8PKeMUCJ4a3JU1RqDjS
         9BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632995; x=1785237795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p6ZhkeIpwRwxNxnvxv1dr5EF7tYs7sjw5Pv6BQNvWU=;
        b=UqFsFq17s9jcReV9Q0wLYQdAqbJzQN+PiEFQOAeSeLMv44nwc32RD2uo1Tw3B28CvK
         u/tWVmehxdkaJ/GgphxA8LUz0kuawnkPgSz9ieE5UxvI7lJAeYUZyu+PbuZ6w0BLNNjZ
         cW4JRzon3qdMWGgtvP0bg4p/b580aZLpyz0CdrC7jrfwCusdMpcEtQQyWu1JWoIdQI1F
         p1LQRLHASmLRLZSs5UY3n+Ed4w27lkl0W7GltIoLloeVF9GEZDHDrXW704TxvfPJmGFJ
         SPxEjJU0yQP7KRlNWa8JfhhYl1xbR9VQZTS+rr/rpbcw2rZnvZkOo2UaSldS8G/BEDdH
         CZiA==
X-Forwarded-Encrypted: i=1; AHgh+RplMjDq8hvBKq2Q2wvmcejKxnL0LbeO+FEVZph9y/VfhyBXCI4yB2l0AFafoXbxfaR7z9q+D/Bnk97w@vger.kernel.org
X-Gm-Message-State: AOJu0YyDesNaVXf2HsGDqOoRHnGtHcdKq7Dz9IY0h1rkketrHl+6SjWF
	5J7xyLaLFV1eCMkYlVpu7DVO3qnd6wME14K5LZrSu5v0rAjB0Aqr1kQIxwirm/2XMihrOBsCdrw
	e7WQq3GvmE3tMFkerYmT7h+EPMl/mWyepnSHF3j+EDHYyML2WWZen9a/myKgxfgR0e/TfEZkJn5
	f6m0l9LwXDD0bi5ajh2P6W3Ff32Dok5NFtMsSJF/w=
X-Gm-Gg: AR+sD13Fm6Crv29L+s2/xFJF14jGkcCQ+zcv7hNpdYd5V+Hh9G2befWvvbCqt/PJClw
	Fl5HGU5183OxGm9CByOJOllCCjBe0WJJchqbhUSuf8xV5pA4O3K2pCewyRNktGxDbSRdgY4Tbxw
	VEnjLR+CAIjn4u5ldtp4za2fkMT+VeYR8K/St4lZLLFIho5bJ57y2y+s6XRw==
X-Received: by 2002:a05:6102:1487:b0:631:28c1:154c with SMTP id ada2fe7eead31-747534b507cmr4933456137.9.1784632994739;
        Tue, 21 Jul 2026 04:23:14 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-747534b507cmr4933436137.9.1784632994275; Tue, 21 Jul 2026
 04:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com> <20260720-romantic-radical-avocet-bccad4@quoll>
In-Reply-To: <20260720-romantic-radical-avocet-bccad4@quoll>
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:53:01 +0530
X-Gm-Features: AUfX_mzG90RYGLzUHLgWXGQR4FxlL_eJoPUeDxHiT30MTK5iRyNxHLT3Jr0zP9A
Message-ID: <CAB3tGMOSo3rmxby3dK+UgW8FSkxkaWh6mmTEbe331J__-7AHRA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML offload
 memory and SMMU mappings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfX1Jtay6oZCYow
 UL2yqgCRZ1vlZA4SDKRwxT8fINDKB9hyEd8e3F21MKO6lauKB9loxXq83KijI/fhR+HnmlrKUiu
 uW2RxjUX/j2SIWASm3J7R4qeUPsM/b0=
X-Proofpoint-GUID: FJg7u0EJjgrMvo-L0NAmiF6VCRxuopr_
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f56a3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Eckrb6PB2g-3wKSLlsIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: FJg7u0EJjgrMvo-L0NAmiF6VCRxuopr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfX45MGmJMqeh/K
 oGmBMD9k4+Bzko9FG3jVS9epYn7sUnBEu4JdRYU+4LO90lPg1yPspSwMyrg4qpjmtajB/Wvnm50
 Tv6NSdXqsO+jpIXMz19upJoaHMbZcF20dbNVvo/qlh2dywldQA6B2VilEfEOnvCcseVnTmn8qTE
 XStp6a1YC6ooxLLACLfJcTyetOT8YH6dVi99ajqCxJ72RyrTFmuhA0s8mYeu2+6FFsVBSuB6Qzc
 VYhmdeHlv9EdO01jQnpC3EYhh39rVCP6hYZUiIUt1A3uFrcktxFx5/VOZXczBCsPs5HG72sU1x8
 n55sF3ldMImJ9PtSH7+s7ZfBRVqtRwuVQgr24qrgCOPDTyEG3cxh+OeT7/AdX3u5JTN8SwMuxta
 KEH/grXHUhDJgC2AO152l6+hjYwmJLiitgtobvGNvFe8pbj7jVAaoCdXegksPwGuMShZEmwNJs+
 A9AlQ8Lt+yk7QBMXyvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210120

On Mon, Jul 20, 2026 at 11:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Jul 17, 2026 at 03:28:25PM +0530, Pratyush Meduri wrote:
> > The audio ML (machine-learning) offload use case requires a contiguous,
> > physically addressable buffer shared with the audio DSP/SPF, and issues
> > DMA transactions through additional SMMU stream IDs that are not
> > covered by the existing ADSP mapping.
> >
> > Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
> > aligned) and wire it to the q6apm DAIs node via memory-region. A
> > dedicated pool guarantees the alignment and contiguity the DSP expects
> > and isolates these allocations from the default CMA region.
> >
> > Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
> > enforcing, so the ML transactions are otherwise blocked and faulted:
> >
> >  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
> >  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062
> >
> > Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
> > remoteproc_adsp iommus property in the EL2 overlay so these buffers are
> > translated by the SMMU instead of being rejected.
> >
> > Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
> >  arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
>
> NAK, you keep ignoring us.

Sorry for sending a v2 before addressing all review comments.
I will make sure this does not happen again.
Thank you for the review. I will respond to all comments from both v1
and v2 and address them in the next revision.

Thanks,
Pratyush.
>
> Best regards,
> Krzysztof
>
