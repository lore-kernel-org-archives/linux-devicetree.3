Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98834443318
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672331; cv=none; b=lt8yJEe2AsIU28nBd5d0Rw2fkBSzloiagUaCdb9urbf98e65fA4DnZDprSrZirkm927G2hwfYSE/IyTN88mnI9lTyHtiFVlEcI+3DlwRUokJ09WWveuLXZp2NqGvYWd85vXqcKkrbU/u6ZRAYoS5h1VP90JUhhvW4shmQGYxB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672331; c=relaxed/simple;
	bh=a66Ua33UPzP88o6/qeMlZpu7qW7Az5CZeskQyGfEIo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMvAqLRqlO+NPSWIL1OeCreY6x4nTguZswczpzprsNuIbVnt3mRBXYuoPz5Kf9aUws31eybi6KzceaI6FU5d5Fs5GvzgjKAGMP6A2JdmNohixfmPxXqNc28Ys1WSNXT2uxiayaK6RVYP9Rr4fzMnmTdxTZvm0eR1uECPUlqJA04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ek8B+Z2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+xJfluS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ek8B+Z2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+xJfluS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlP2o2392054
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jr82XK6WaU0lS5Kk3xnadPlA
	C9vcqifqJtyyh8a2t9k=; b=ek8B+Z2dqAmHmh82a7FB2aPcHk4te2WqfM2GgLhz
	P5BtGYuBC0Lb4UtvNtAp9cs8otQP0J9ekIDL/YNS7rENAJF9UZkkWvWeqLHLlKcH
	UCgrXqEFh/v5M8uiV28OghEt/zvYuNBz+UWJgsQAQF9boH9nMxkj7D0Xu9seTKPY
	pyUgtyyhtoVKRjnTA/m93ON4hN5iQI5yloF6at2SQ2jpmTwrSxtbZj+9oj4lyp6v
	kszDJ7/NARJL3WmeS3rkPDP2+0ZY/9HooXopfYPYQ3LQIkwpPECR/vCyKkizwcwA
	oLKj4NpQl+aJHRRaKp2oLV5qpRi5QL9Gl0uaFXLr/17Eaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fs4c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:18:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso137197891cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672328; x=1785277128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jr82XK6WaU0lS5Kk3xnadPlAC9vcqifqJtyyh8a2t9k=;
        b=C+xJfluSuDnHUFa5sxSLBAUlyhMbJskhLygBwR3N4ZvQI0qe4T5DWC4ofihxeV0mID
         su1GO5zgB4f5QdoWfx7hm4+l/7pjfTnioX0sQ4UpzvClnWBW8bvjwUc2kjO8x0XW+9qp
         +ZG8EtxboK3J9B/IoZTpDPVi8d5EcHQN4PW160NITeyv6BCP6XhVlN+wHr7QGy0Du2md
         4QVdI21MSCM/ZlyGBLR83CoYADXlnaBLn+SfKevojsV3+wtvaTW7peZxG9P7jDQ31jSD
         J0FtLk3glAsJ0E6vusGYSy1BvvChsNcrXhtQuHY6BOal0Z93Z/mm+18uH1YycdJCRpBT
         tImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672328; x=1785277128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr82XK6WaU0lS5Kk3xnadPlAC9vcqifqJtyyh8a2t9k=;
        b=ghb/1uRwgBEU/c4Cs8R/muF5b7Oui5GXhFr7UwDvtOkuIKpgyNmJWdY58Et2FRjfx8
         SjUAbAtuF+7dKhS8LfvDt0rMmxMKlCarlL6J89aCJy/LZAxXHYVnfcWUrg8xhqDjrNJz
         dlDnAiaux/Jj1jUWt4U0RNSGKPywjmFb38JR2CLBHUrPziOn32JtGqRbm52R03hXWdkg
         aEwER0wCfuJ+T3QT1ff/cQOkmL4aCp/kaEAAfM7yNm36D93lW59vfJctXZO1OEnmmK3E
         GGOfML3P/yIBb7UTjwgkd6kWb9A0pURxH/nKANj4/vu09ngPJ98mxJNY/KZun8zga9QF
         RiXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr06tB6K59aaT+vPN++4y7NA4trxZV2l9FsG6BjMLOtXtDjH3tbhSQ5gHBkYl+aJUZQcmJCELF+4uOr@vger.kernel.org
X-Gm-Message-State: AOJu0YzH4aPHw4+rQeZFLd7KOq0tv8WhJocUGEhLhiiDPD2GkT2nouaQ
	1DZebFqeoYx4b0kiNMs6bYvsemPUwgXXr6ucgKUDCcn/9gSgvhcSnBs9dKYCXAtyOYlg/AFFxfj
	kzKiLLjgUwWlQSEP3v1p3BjP7byau8+qIeePFdS54yolB32QmwbtTpjx7gKz8dYSq
X-Gm-Gg: AfdE7claqmoT6bd0IVxXIgAtUA4IlmF/ReMTyJxEe9V65n4cATChLZa+rcYwZL3gCGR
	eqIEsEH7b5ypK6GQeRsdkQaUyQAywvj0wSKOqCEpx2OhtXNg6sgWlX0jyKUZzWea8AN+Qqc/Zoh
	Vz5KFkt/2+xr0gotZ++83cprkAuYxI+pz8VRRS3TuCimt5BSC+an3bpeknQnAFoJXjhJDO+FM/g
	6fWKv/sb2JS7JbeZwZSz/VBOlzA7hYg3WdJktDhsPLkKCVRu7b7Q7cIFrLNyrm2PNmmU2KdyxFu
	Y7jwn3cHJ7GsuT3ZcD9xuwCeG9N8IGIOVjSbylM2eBgtlgnq1bGbMHFszDYXpT3xKCwl9vCbIwv
	fhTeWzyLv1kUPj/omp6rDznGSDyfqOZFCBEzFCHIdKdDIQCB4DPVtRWJR1Zr9ZFVo49HLMSwJzE
	NdU+yj5+WUh268xw==
X-Received: by 2002:a05:622a:1b21:b0:516:ed02:c85d with SMTP id d75a77b69052e-5213d2b6a70mr188934301cf.3.1784672327651;
        Tue, 21 Jul 2026 15:18:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1b21:b0:516:ed02:c85d with SMTP id d75a77b69052e-5213d2b6a70mr188933981cf.3.1784672327156;
        Tue, 21 Jul 2026 15:18:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d7e2c1sm1208661fa.36.2026.07.21.15.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:18:44 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:18:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
Message-ID: <2hismhl3epuijc6a3mhvf3sxasqrhrpuzbqsswfastafpjgpev@a6hdawm6oani>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
 <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
X-Proofpoint-GUID: wYkjHrBq0cZeakydwTxx4N5fEhH1RjEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMCBTYWx0ZWRfX4SO59/nH0M3+
 YF+CWfDm6ZC/etqR+K5og1brNCdyJbMyZ4gt7HGvoUyM/x0MOUjJypW31GlZj1bOdM3xmJm0ffn
 0TKxIqIswE7qrTwqcUON06SUv9VujKUJtOrJAOBI5sai3PckSNgmRb1u4WOfyopSbBSuC6mbMOb
 n9wYWIb6eVwTWBMKNfNod2+6lXX93s5JOCNsq6m+lbMnyFPzzs4zKYZoU6WYRaEzzev3pG5TXhp
 pMpVlXA57o4UPddd06dafscx5DLaKenzy9P/RNI8sn47J4u4s4pz2kgOza1oxrPDy7NnWypg7ar
 x9wRRk9/6L04a4EZ5IxgWCLr+A8TyTpPsDX0EyvA33eOBpyASb0Lf+IHwp6Yq+5YLGj0M9+M/bG
 nRLgPeH5h7otMT0mGCjiM9HtTBK5COAh/BuXQmUR9aIVK6rw8sBuwvitFR+hzvQTcoA56388uB0
 vZOoisOIyTSsdJ8vQSQ==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5ff048 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EoqG_mjnOjSkFSP1HQMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: wYkjHrBq0cZeakydwTxx4N5fEhH1RjEz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMCBTYWx0ZWRfX48ypWPbM6ak5
 7E+ntmZGbKclnFR4ZZ47LcynB0G9eKhHHUNsEFe6mZfaAJhLGr+2KSgYmGh1OMIGscT/vAraB7X
 fIF/URY887tyig2WaOMqU+Nt7M2S/HA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210230

On Wed, Jul 15, 2026 at 12:45:48PM +0200, Konrad Dybcio wrote:
> On 7/15/26 12:34 PM, Stephan Gerhold wrote:
> > On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
> >> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> >>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> >>> the latest wake up capable interrupts when the CPU cluster is entering the
> >>> deepest idle state. This is done by sending IPC interrupt to RPM and is
> >>> implemented as .power_off() callback by registering MPM as parent power
> >>> domain to CPU cluster.
> >>
> >> [...]
> >>
> >>> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
> >>> notifications to manage RPM communication when the last CPU goes to power
> >>> collapse.
> >>
> >> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
> >> fallback for platforms which don't have PSCI OSI mode specifically.
> >>
> >> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
> >> all of the arm32 platforms) that don't define any CPU power domains, so
> >> perhaps it's necessary after all..
> >>
> > 
> > I don't think this fallback is relevant for the non-PSCI QC platforms,
> > for the following reasons:
> > 
> >  - They don't define the MPM.
> >  - They don't support cluster idle upstream, so they don't need to
> >    define the MPM. They can't reach the idle state where it would become
> >    relevant.
> >  - The setup for cluster idle without PSCI is essentially equivalent to
> >    OSI, except that the SPM/SAW driver needs to program the idle state
> >    to enter. There is one SPM/SAW for every idle domain (e.g. on
> >    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
> >    SPM/SAW instances as power domains to get the same setup as PSCI OSI
> >    (I had a draft for this at some point). So if someone ever implements
> >    this, we should be able to use the same approach as for PSCI OSI.

For the regerence, MPM existed since MSM8960. I think it was never
_that_ important to implement support for it in the upstream.

> Yeah I said 'necessary' because of the arm32 platforms. This would probably
> be the preferable way forward.
> 
> > I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
> > when this fallback would be used.
> 
> I think it's generally only SC7180 and there's definitely no MPM there.

Yes, it looks like there were no other non-OSI platforms. It was either
normal OSI PSCI or the old SPM idle.

> 
> > We probably do need some fallback for the old sm6375/agatii DTBs though.
> 
> The sleep logic doesn't really matter without the platforms hitting a
> specific power state anyway, so I'm not sure we actually have to (i.e.
> the regressed path can't be exercised today anyway)
> 
> Konrad

-- 
With best wishes
Dmitry
