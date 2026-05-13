Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0F3D34A4
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652912; cv=none; b=VO2ilRwvbmnxx8MfAgiz1/sqClwjx35zCxjp0S/PVwAyeqLAGp2+cqhmp9irVmKVRnVNQtFH88rgik3Dq3PSUPMSf+EjSdUnGcuOrNcYwdryTz42zSc+HGpMkiXeFhpbTjUJgDGgKvkXw2cfGDB+PR/swoY0ifcOK0Gwq/3qnwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652912; c=relaxed/simple;
	bh=XYYv/jyfCNRw0Yxt6HrCV21jlWPEDp1OnnUNZCOz+Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inSlaRu92l9wZbspZD2W8H5wyMLMixRoKVKYqwEH348syPnNwHtmuy+tLYvhpN/PtJ5LSU04HmRLlGjUUYWxNtDMDMhGlb+LuxdSv1jO4+wntAD/pGTzlUL8nbo+F+V0dRuyexhWFeDaJv6+NNG7zGah4Qn403cIcFlMrFMZqxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsVQVTIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJHiULT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsVQVTIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJHiULT5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D5JPto1393047
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3U7oh91k2OAdqpWQXQtlpoZT
	jr8XjIfRrTRr1I78JqQ=; b=gsVQVTIJdFHQB6KuKCXaSo7YTbQlllNHO/qAlzdn
	N2zows5AuW8v84I0VuAf+9xk47GYu0I6p5RP1UiOFSbAmlZqh1U/9mmCIav3ZzKu
	T4G/7takQExYe9/uEVlbMF6+xgx1O2tlRrf6eqjR1TxgGOZImvHyS0Vo6MVw6J4Q
	jQ7LSjQ8LS09twdq3EWmoFwbDqoIMPfAIu2x+6uOn2BM1oT/v7R+kRub5Ms0HqC1
	OCQs/RKZizjD/cyeAmhAhqf4zQCpSOnQAwhE735oBAZzBC7exs4EIkyXNv3RZbL1
	1WTnwRSXwRm3ms6+Y2xaN6G3BIMnoQOzvklPB0jYNY1zHg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k2606rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:15:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5147078691fso148334451cf.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778652908; x=1779257708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3U7oh91k2OAdqpWQXQtlpoZTjr8XjIfRrTRr1I78JqQ=;
        b=fJHiULT5KrFqnVnSNWQtdpVLCwjW3MajppT88Imw7c+moDdxgC8y24FVpe8xnmk7Xh
         jvZ2igu+59NEpjbzka9+iGjnXXXkyhXAvEY0YRZ99AjvR61GwaEVoeUdzeD6UMWgPpx5
         Tt/gvoJuKujEB0LkyBK1IgwtVgPTYGuzYIB5RIXm7NoS6GTV0Hfdl6lmbz0O9cdjtPtO
         XjggDb3YO/+R0bidc3IVHJbw0g8U3/ahzrZ6jteL4fgJn7+qYUsD6XZxn7FLG/L1h8ND
         8PLeRJMIEslM0jBxprtN967rV6DqPg9G63HDatjkoAAUNmfF+EBJx82liXRZQZRN+7BU
         ulBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652908; x=1779257708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3U7oh91k2OAdqpWQXQtlpoZTjr8XjIfRrTRr1I78JqQ=;
        b=GaeyJdFrYEBwoB6FYlP1Hue1VMBzecvpJpeuFabBMdw5j12uMMKCUi7Urnl2kzeJv8
         5V0+XeByG5Hi07jYxJLtF7axM9EJ/gdNIqraSQEkN6ueNxNHySIc35saiMscJLB128PA
         xsa5kd63ogg/IhrhnrH1Uct0sWWo2H6deN1C/on4eVe9NN9++cYrpaySPAjEB0rmH7dX
         qktqOiJthP7Q3zwx0hOt31Ag941TTrA2wBRGizO77Waozjmah7CjQDyfz9QoDRL55rQ3
         klNy6KkqpSmxeIlsU4znoSQelPVcc1XO2bxy/Sv8EBJAfNUVImS2cFiyOxh40hQbFBAb
         2/9g==
X-Forwarded-Encrypted: i=1; AFNElJ92ooxYhENhWLijOOkI+wiuputhINSB/vvEXFQEYX/Q0NuT9u2hK3H+OT2LjiGU9YG8WRs1i/Bt1VPX@vger.kernel.org
X-Gm-Message-State: AOJu0YzRe/XWsC4BIH3SB0hSbJPrJW1/fKXpdC5MMojbcYCLg+KRCPUB
	ahzLqwj9g1l+8vYbzQ9nnR9fxa0uWJI27jYgevICo4BqXNgQLX1enPXWnyrThR1b2Al43fPbBwH
	HY3t8tRgmt+gPdd1dkjkyIDm2DLggbXsTRDiSeOu9MiUVpHetzf+TyrPHklN4F9kP
X-Gm-Gg: Acq92OGpcK/PL/3VDMqbTtPSxwDhe5hy5g63pgRhJn5rrDV6fOO9gMPV73bNuwYH+Dc
	a9ceRi+C3NcEkU1jGfzApVVFh2dXVI5X1grj/Ctc/9rLappXI4WtBRmfxWsmxKs7HVUyF5NhoOk
	NuyVNw+p9hM3zvAwOz3iGE6Omops/SAel5ZimhcQ+rnYQMUejXG7wMeEYa/sCvpRT2BWJ4OoG5Y
	zR6I5sd0MsQ5V0EDUzcmTZuV/Gwf47ucMITvOCAIucmFruMbRPqHFwkOlkkjrHoLfmFSteqO5ou
	7+YALZ7sxVFiJPawdoRgLGQl/Ei36hTcU2r7LmmJJ2EAA49B9hRbIVukweFbAkbZEndn9QqWpKF
	I0p8of+Y+wcmPbPbKMatyBy3d0oM2AeSKOlnM
X-Received: by 2002:ac8:57ce:0:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-5162ff0791cmr21396751cf.30.1778652908375;
        Tue, 12 May 2026 23:15:08 -0700 (PDT)
X-Received: by 2002:ac8:57ce:0:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-5162ff0791cmr21396321cf.30.1778652907881;
        Tue, 12 May 2026 23:15:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm36420187f8f.1.2026.05.12.23.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:15:06 -0700 (PDT)
Date: Wed, 13 May 2026 09:15:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Message-ID: <eqypjd2my5onkmszqbdadwerhuhz4a2pgwijgquvr7cjsoojm2@bg2sfa75uiza>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
 <q2P-fl0-Y-qp3p1j6PRmUd5xM92-IslEfMGk9rFS_n82-beFGjS3MfZ8J8frpp17AVDYuOiJ8IzInsAE7cAotKSF4JP0LwgCXC6ET4eI_dU=@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2P-fl0-Y-qp3p1j6PRmUd5xM92-IslEfMGk9rFS_n82-beFGjS3MfZ8J8frpp17AVDYuOiJ8IzInsAE7cAotKSF4JP0LwgCXC6ET4eI_dU=@pm.me>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a0416ed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qlGBwchHFJG7FVo9ngoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA2MCBTYWx0ZWRfXz/gZ9x3VV6kL
 cFQ8urEGc9TSxVRPTqf9wIkX5+g4fM9bMTw7LLpWA0kMozJ/BjO61ki9fIZggQGMwq/Mbno7ZQv
 jUsArFhHLiWLLIvStvrBcRmJTY/aCOAIiXD+tdqulToDBkV0kNXcQIuuVAVPLTYjS5niqBG5eIn
 Iy7zZDDGtCmXWilF4PE3Pq0AKfjop/6rek0CZaWbh49jsQ/k/oY1leUA4AcoCxARZg51l8NoRxu
 WsOSAQTniPHxeS0jAkBMMbD2PP5GOmQo+UEF9PgZQ+AU9s9llq++wS8eQRRocc4w4bIdJiBTUlG
 ZzGqKUhxEUHDwCYxkdkemewczPqsfNvmh7KyShydIsA2Av+j3mGeFfz1YpWb7CVbjCZnRHCcPgQ
 OTuBMXOg11e+V2lzCvr3pjYvbrCMatrQTY4qIfgNDr1BGgaZqq7gft0at85SN0LUGxFdyhSEyTk
 B9JrCIoWn3WpchPZq6w==
X-Proofpoint-ORIG-GUID: EXL-_P9kXOwlAH7j6d7nyI3TZyhR-_k_
X-Proofpoint-GUID: EXL-_P9kXOwlAH7j6d7nyI3TZyhR-_k_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130060

On 26-05-13 01:33:27, Alexander Koskovich wrote:
> On Tuesday, May 12th, 2026 at 8:32 AM, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> 
> > On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> > explicit selection of the master for each PMIC.
> > 
> > The existing PM7750BA dtsi does not provide a way to describe this,
> > so introduce an Eliza-specific variant with the appropriate bus
> > configuration.
> > 
> > This duplication is required due to hardware differences in how the
> > SPMI bus is exposed on this platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Was wondering if it might be easier to do something like this instead?
> 
> eliza-mtp.dts:
> ```
> #define PM7550BA_SPMI_BUS &spmi_bus0
> ```
> 
> pm7550ba.dtsi:
> ```
> PM7550BA_SPMI_BUS {
>     pm7550ba: pmic@7 {
> ...
>     };
> };
> ```
> 
> That way you wouldn't have to duplicate entire file, but don't know if this has
> already been discussed previously.

The suggestion for duplication came from here:

https://lore.kernel.org/all/b784387b-5744-422e-92f5-3d575a24d01c@kernel.org/
