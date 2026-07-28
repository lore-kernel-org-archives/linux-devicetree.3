Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9AC41A515
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231524; cv=none; b=rcZ2Wcor5SM/O+UivBJxYsDSd3Q8bpWlwKCR0txzi7ueMgO6epFBP41+XrOWPrLSjfUcpZ0YRrab1pS/hliKiSIX1e7PrkJeoc6cwL3owpEChbt3xihdrIQdCLte4huZIe6d+XRiIazu6MPW/oDjY3mCNmbgBElrxdl5VOf7qf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231524; c=relaxed/simple;
	bh=7a0iVTRGF6tta4qp8zGJhIF49sI6kiJeJaLuzEvpJYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCfvh3pHWYF/R7wZNsm4MJ+vLAvQFEKQuXmaWz/NJJ+qrdCVtg8YElIJ6JIBFOJZ/gzOUTS6WdrE72OeW7FE63rMKu7uKqKpP1LaoJa5uikEsD9PPHk+u7/2WRE5/87mAXKMAN+On0fGv017ORyTiHbVqAEMHVfVRP8SeT1vyZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDwA3HZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQpq+BAI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDwA3HZM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQpq+BAI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82FQl1908785
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o2fXXWs5o/xUnPXLsVww3EMR
	s7qxBFpy3fCvpyBqnfI=; b=EDwA3HZMMi3BAKRAa0AyFBXlmde7CAVp91Wawq+X
	QaZcJsS2q9HYeKwyKSFDtiYUJ6Sb4tddSUUOTTh1zzhVg4QVocwNnNuV/UbiAFX9
	GxfBOnvfrDx9kkeOvdoGCu5fG822H/NENhHS+s1tUTsTdK//m82q0Jl3Fcrgaql7
	E4ASsLywua09Rw0Csds/1WibF05M83bmlNvLet5C8m2drD9TX4ol0NC3m+X3ArJt
	pbvFKIEXrG1qfhGlmRu56vGvMFF1SBJuouXP98SGsMKsotnESEjCHFgr8xOqOOkD
	Fipe12JK8D5CAB4Y6P4H0AAwD89oK/+3C+UghohFbZz9RA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8bmb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:38:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2010970a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231522; x=1785836322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2fXXWs5o/xUnPXLsVww3EMRs7qxBFpy3fCvpyBqnfI=;
        b=BQpq+BAIdE+iFLrM3+9yoU0t5tnqDSQ56VqGhlRUW+GJnIHlw9RST3gvNRruz1wqTf
         snuNCkhwFWIB/dA1Lo1P2C39n/xAriMlX4CgbIxYH0e8vbz2c38KB4wJCfdkquiEal+3
         SHIuC7lzaVcRT+pd3ZqIx4hUfSP96oqNCaVc3TJh8uQUWtZE8gwc6/CAAhrVBMdLDpEd
         Ke9rA8L1KOyOM6eiTvdxA9Oo6c5QiGeFsqa2/nbLoVmsiZrmC+TFxFsMRXv3mUVPoxIP
         3NDmbLdF/vQs0ddPF7FLGpTnFskzmxQxCxL0oRTpZ1CVIkasc7y2aVDQCyigcg7iSY9s
         W0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231522; x=1785836322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2fXXWs5o/xUnPXLsVww3EMRs7qxBFpy3fCvpyBqnfI=;
        b=np4j2X9YF5fDGoIVev2pe/bRX9JinjYhjshb3MZbeSWJ37eQkCfC7P9pxnFA5Hzf4a
         gH03jm4DwhRvxSxfZG8fWqhuD+h0ZVFK8X6riKBGC7eli2UPje4Rp6xtcfBA0MYqeSQu
         Uv3wddS4XgvCjW4kMVPeGfElVP5jCxp2iJHQTgsMPWTehOQzINzaYOgRpJaSlo5qAlkA
         x7R0W+QWL5RiAm5AVU1ebgfGk05pTLa+U/cDfZEG1k2iROtiXQCieCaqTwaqgpv2EkbH
         KiNwpLYBxUAEPPHJ+1DQ55cZXoUZTPT0NNIK3F24huoWHVaybfAB9x3pTwlEGpdlbEXs
         sTqA==
X-Forwarded-Encrypted: i=1; AHgh+RrfjPzDT5UWd8B3MXqt8NxTDXfDuhkOEb3pL5C+g/3RXbVUH4rqiMTH+7NXiHgofXLhinWy5HmS71pu@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWlqoHQ1ztV3GaE7Ii9Mpy/ji5q8jcNeTaJn1H3Hb4uuU/Fs7
	F+p/vk8q6oUjMuJtoieok8THDfco7Fyn+Fy59lHE+IQj+OUrrTDnMLGCeZhBqQkb2kdz/QQV8ae
	ix+dI8vOrP52Qj6PnbmXxq4o0kzMk/JYttjLQX9aqWjNgx83W9wptuO0e0jtWqzAP
X-Gm-Gg: AR+sD13fPBolI3S/3nXy/XZD9w3FqL0fgdGEGZ9mGyGnRnXD8tKAOYXZGxxUvRgZ2M3
	0/9y8NcruPGM2LWn6fcA/v2+P7Ub5ZXkIToHd6zo2K/hxabqBl1Snylx3tTRJxFKyRUPTyFVZTw
	52As7T8u3vPqO5Ixv+G14JUF+CFV/fDyj/qe0Ezl2nSG+1J9/5kOjopaFxXvy2UZReS1mhHU0Gy
	+BGrZEt8R3SMKcA4iTqivC+27LmMLuVg+rRvHVK74nzbGgvaJN2y85otH5Xy4mur50K38mLx1e/
	m3HNSO8OFRRzk6TTH4n5Ww6PpbgGX4OfrMLZdR7/M2rq1qmMEBFAd4/L7qrHXjkZUMW3+484E0n
	NzdlLoIG3aRJiokqMoQmjN2LYNvBy1CFySpaUCcOw5do=
X-Received: by 2002:a17:90b:4ad0:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38f6a544ac8mr1474644a91.35.1785231522246;
        Tue, 28 Jul 2026 02:38:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad0:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38f6a544ac8mr1474616a91.35.1785231521809;
        Tue, 28 Jul 2026 02:38:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f08e14762sm4074858a91.3.2026.07.28.02.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:38:41 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:38:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Message-ID: <amh4m9rupzbTpoPv@QCOM-aGQu4IUr3Y>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
 <20260728092749.bb32hwpaokxxw32s@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728092749.bb32hwpaokxxw32s@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MyBTYWx0ZWRfXwNO20GwfMlr7
 uvp9kq/mULOjm1dpmnuoIVGggCCVdwEhzM2v0eRuq0TlS9wedfHeOtoHnIqWPSh2tLxP4g0kPnv
 sBxjdrC6NiflCgPzAIILcETElZz+aPI=
X-Proofpoint-GUID: tIRalVdaYyz9H5zkdM5rJRNZoJA2bkkt
X-Proofpoint-ORIG-GUID: tIRalVdaYyz9H5zkdM5rJRNZoJA2bkkt
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a6878a2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ReI_smAkPlKsL6naA8cA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MyBTYWx0ZWRfXw/dg3oVZG70G
 L+WL86he8+4FjzjEGtTMrq/NzL5s5ufaW/vdj61JmSPlifLHEt0B4Vgx6W2tby+zZGaGy3UB+KD
 10Dob9xEFxONPDbzCQ0bAykarO931UF4i5RFtnOYCb90bTXtkCM9+1tdM+9hLP+APn+0TAqGC20
 77vcdNeA+6kqUkKiHYvFPWAVEESN8WhjK6Y1OutNjhK5tWFvr9cZPET/mB4ip83Q7U5xNoDshaM
 1upQ54DDPMvBQPyTSGq/6H8faB9Tr8xl62/nhI36ynXcBsD1Ft8mi6ebUqHno8PKk5dE1mgkjGH
 WWoTWZGwgehTbqwYc1GJkYITCjVTySl8+uXUUl6z3SxY+CGCO5jd2p7c/OPeXcFsqY9U+oyaBSd
 Ek31CHtHtMNdR5psXSmEyVYsSQRaHF4Mc45slX6sDJYEYx/6SRGQq01yzuNeG7m8j6GpUlGen4Q
 ZAxSAf8rrzqTOhkucsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280083

On Tue, Jul 28, 2026 at 02:57:49PM +0530, Mukesh Ojha wrote:
> On Tue, Jul 28, 2026 at 04:40:12PM +0800, Shawn Guo wrote:
> > Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> > is pre-booted by XBL before Linux starts, so set early_boot flag for
> > attach path rather than a cold boot sequence.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
> >  1 file changed, 110 insertions(+)
...
> > +static const struct qcom_pas_data nord_cdsp0_resource = {
> > +	.crash_reason_smem = 601,
> > +	.firmware_name = "cdsp.mdt",
> > +	.dtb_firmware_name = "cdsp_dtb.mbn",
> > +	.pas_id = 18,
> > +	.dtb_pas_id = 37,
> > +	.minidump_id = 7,
> > +	.auto_boot = true,
> > +	.proxy_pd_names = (char*[]){
> > +		"cx",
> > +		"mx",
> > +		"nsp",
> > +		NULL
> > +	},
> > +	.load_state = "cdsp",
> 
> is this a miss or a known thing to not use cdsp0 here but use X it at other
> cdspX instances ?

This is what I found from downstream pil-rm code.

Shawn

> 
> > +	.ssr_name = "cdsp0",
> > +	.sysmon_name = "cdsp0",
> > +	.ssctl_id = 0x17,
> > +	.smem_host_id = 5,
> > +};
