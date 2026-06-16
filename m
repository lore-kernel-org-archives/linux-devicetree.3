Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3323EAB2
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569342; cv=none; b=CFl38Fr1N8L7eUhLBfLzEGPi7dmKstu/R3j4cmVtLDTDoaLo0RZnKW5p4+WBYlrtPW1kkUVtWXwop0DDg4ZE/Iw1u9s5dMtPCqe8T29QnMDmpIJoPvOoKdldWqstjr5GO3KVDMkliDqADfKajf3EYFxNxEWmHn4MFQma8365Mns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569342; c=relaxed/simple;
	bh=P7MxXITSax+WF+IrLjY99CIeQHXpiEgCBwVoBlGs5SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii77tK5a/J9SSU7rAwNK2uuuLOe8/N+6XuFfUqGpARBUNIbAuI0tMVGMf+RyJ6571PkrZWUHPKKYtmFC7vLgbRUrkcLDcTugtX7GBO9MqRePHMijzpKZLIW9GGs1tW5R0Tfsqr+7sClSbeToxCh48nhXGOtQiLdHNHK2jL1ccF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exV7vkjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUTFt9qu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exV7vkjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUTFt9qu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ0owK1453755
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+I5JPJ28+2C5Ptq2qq3gPPxE
	l8sJtso7kvE/1GSrC98=; b=exV7vkjmYRiBrHACB1F964JIl6zOi5w5Ae7TN+Eo
	O9OsDnvYllYprf0DquCfhY0PjaFyJOxlUA8qaF4NcwghLLEP/aO2CMrilizZBr+s
	lkUGeGBQEeKQOvAD1ZvHqDH7VHfR15M+4nTzc6e+ZinGV06a63H7si0stkWmqrFT
	3oWyTSwPv8NSvretIH8b/KGkVzl37PY+TuishGsPKk9eTvBaxDsF6FVoY/W1kusK
	kYPsV5YAv0RjAEzlLR5CzouvhkDN1/GLRjZ8mbOr8+KynNv4u5dZKm2DdSpN27Q/
	SLptKqfW7BR870293tgLOP7YCR2lzfz8LJrqke8a9kYZng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cc9n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:22:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158f07f5eeso648095985a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569339; x=1782174139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I5JPJ28+2C5Ptq2qq3gPPxEl8sJtso7kvE/1GSrC98=;
        b=hUTFt9quyjVl+cnn/DYb9XPT4J1lNbyLD4JUTrdbmWM/BWO09V49l+uTtej7iDe1ii
         U6Iqfb/VClEkVCceRyLSluvManpb72cG8mM+aegOUQrcPLDBhg08TKtdk6irU2T7AOSc
         7DdUc0JTnPt767m3XsFUe1NUQCP+xZhvvyckfE6zYQgnxeWpE1W0nIfdwCz7fcKY66bK
         DlbeyyIfrQHJWEVDCS8FgPU5qvPbFgR95vaLpJXiUMVeMoEIavSrVXy/52U1AOBRpiUF
         8VCozxfmbfarJ+J0PxwYjVRIJ85wHQYgeTqvrrFlEa0QUwvjFD67nWtBobtN2yK48h+x
         WKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569339; x=1782174139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I5JPJ28+2C5Ptq2qq3gPPxEl8sJtso7kvE/1GSrC98=;
        b=ZfyEeLxG/xFkuovbGQz7JXAaNYFynFcnCF4m+sEvtqIc2X/WDiOYMc8nnv5A/6+TUM
         Q52v27me2LyCHcbzrFVUcqU7GXGdeoEpNJdXxT9UiRyQUsyjB+Ujgzc1vx2Rdnb9mCm1
         60J+jx8Ob8yebkDCvGXEVnbhnS/6J0ucl8yfuRskfWCVZKsYJic0effj5Wk97G3qRxAv
         XGcJUw9rrBkHLG4CH5H/MusW4c+YNqhkJ8P0BN75pJhosp4irFTvKnYc2jU8ar5Qfeee
         ZqfUE560kE59GWUhxEHtGek5sr2h8gSpPK6TisFNQA0RDxpOkVKcmE3tcgTji+bMT+CF
         yqAw==
X-Forwarded-Encrypted: i=1; AFNElJ+XpNT5srWrMQ3F3HgAr6d1jBQ+C1T8z4dnNqkQCbzPJaKSGW2LQ37KFbOnxr7ONDVLBZ4wFG++a6RC@vger.kernel.org
X-Gm-Message-State: AOJu0YyujtYflwP9WSRmoD6nIaLkqZ4OOx1ll58DzXfWF/xCRAPWKLWa
	EIxEJgRqN6pRQSqV4Jx0mdNIxW+IndtFl4rwrA9RSfM4m1y+v4q4SgYiAf0lGduUfm4O/UipQS0
	EsMAKP90YHSTclqaEg0gEAGD4wqRt2vprdVqRyd7fNrIxrL6LcAP/MiFizBUGNbZn
X-Gm-Gg: Acq92OFrlRbNciXWVxAEXd5FUbSB0IqbfIDJY5g6A8zh45DVzhfW4ee5wSp26+EHzsR
	dohUkmm5pjICDbHypgpQYEL6T7kvJfzRdzbksabWW10pSkCR6wRLn6VRjeD3n8eg8qtC3gAPIs9
	9NIbCUyU2R+3Pt3bvluSBdpSxAJ9fWt+bKMnpAWwe389lkgJVa6Nq/P5vmHVXQzWdmERugr6Koo
	WgMk/6qTda+QtpQwsMSHO4DkqS2JmB7jvGYCbtkhSlxsNxPUYg0E/VATxiPmjHIgmpCiBiW4Qe1
	xJ+vu9FbzlqRs7ESle/Dm2ikyW0iTlLcX+snrml5uf4DxAiyKEm5ZQ5bjzza+SnaOnBh9+yYc4k
	185K5cpuKkzYqwlXgQPOKsDYRtZttodqZo7qP0EMKTIkpikvxO+gDUTgIDYEW5K39lx6rlA1eIx
	LQuVuoKUbLwfwPnkdJK7HfXtCWa+4uI8kmq8c=
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1782860885a.19.1781569339077;
        Mon, 15 Jun 2026 17:22:19 -0700 (PDT)
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1782857885a.19.1781569338549;
        Mon, 15 Jun 2026 17:22:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16fee3sm3056234e87.31.2026.06.15.17.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:22:15 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:22:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX+ZgYor2p6Vq9
 qE5aKdak3ltpt8JVLiELhihUh5PgtDYYxP9lq/8M5ozzdMXhdszGTPWvtfv1SaZb0LYahieJTyD
 Rgr/sUcGGDFO5hRy+ikVVg/0gW2jYowHgOFjiNRRP+KMU08X0kdhI5VnMma+FSaQwTR6bhn30MU
 8491TQj0s9KtA6RqQsjdBb60FkZIYORUQqTbYYEgYpJPWccvOKbud6o0SZPkwgbPVsLtvZpYDlq
 vN46ILBXvvPyCopsvIWOPCPLuSu58/pMNcHmEPxkJh0DOTXDmZ4qbL/DWnISuiDPeT+7XXfZJuP
 EbqV2NbBEA7UxKQfUJKIWUi3C4SN6g6D1XaN56p4odVo0aWyNuWsjJ3YAFL/2HJM69O0fnOg4c/
 avGt5EuW007ZWIfOfn+lXo8RgH4NNrkSn+dUIdyKFYDJ0YsVfL9LLdyhwiDF6AePC1JyHVUYm28
 OwYbwkomTjI33S8SsSw==
X-Proofpoint-ORIG-GUID: FVpxGUrdyLm1BXaBt55oSsOgpeL6_lwi
X-Proofpoint-GUID: FVpxGUrdyLm1BXaBt55oSsOgpeL6_lwi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX2OOKNc6RFBzJ
 glMAjZ5NqdFdxmA6f974eRZZHCo5Gm1z5DbcNLpHPy1UW+fJaIK1sDtquy3lYu9yWa+yCBvsEge
 mcbVUsdA08xEc+pDMDIZ1bn0Ew10Wxc=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a30973b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ak52lZM5eA1PxQ1fx0cA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160001

On Mon, Jun 15, 2026 at 06:55:45PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> > > On some SoCs the SMMU registers require an active interconnect
> > > bandwidth vote to be accessible. While other clients typically
> > > satisfy this requirement implicitly, certain corner cases (e.g.
> > > during sleep/wakeup transitions) can leave the SMMU without a
> > > vote, causing intermittent register access failures.
> > > 
> > > Add support for an optional interconnect path to the arm-smmu
> > > driver and vote for bandwidth while the SMMU is active. The path
> > > is acquired from DT if present and ignored otherwise.
> > > 
> > > The bandwidth vote is enabled before accessing SMMU registers
> > > during probe and runtime resume, and released during runtime
> > > suspend and on error paths.
> > > 
> > > Generally, from an architectural perspective, GEM_NOC and DDR are
> > > expected to have an active vote whenever the adreno_smmu block is
> > > powered on. In most common use cases, this requirement is implicitly
> > > satisfied because other GPU-related clients (for example, the GMU
> > > device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> > > 
> > > However, there are certain corner cases, such as during sleep/wakeup
> > > transitions, where the GEM_NOC vote can be removed before adreno_smmu
> > > is powered down. If adreno_smmu is then accessed while the interconnect
> > > vote is missing, it can lead to the observed failures. Because of the
> > > precise ordering involved, this scenario is difficult to reproduce
> > > consistently.
> > > (also GDSC is involved in adreno usecases can have an independent vote)
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> > >   2 files changed, 57 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -53,6 +53,11 @@
> > >   #define MSI_IOVA_BASE			0x8000000
> > >   #define MSI_IOVA_LENGTH			0x100000
> > > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > > +#define ARM_SMMU_ICC_AVG_BW		0
> > > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > 
> > totally random numbers, which might be different for non-Qualcomm platform.
> > 
> > > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > > +
> > >   static int force_stage;
> > >   module_param(force_stage, int, S_IRUGO);
> > >   MODULE_PARM_DESC(force_stage,
> > > @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> > >   	}
> > >   }
> > > +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> > > +{
> > > +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> > 
> > Is there always only one bus / path in question?
> > 
> 
> <Apologies, missed to respond to this query>
> Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
> while accessing the DDR in downstream path (client->TCU->DDR), which we are
> addressing here.
> Hence it's only one icc path in question here.

Again, you are describing Qualcomm platform, while the code part is
generic.


-- 
With best wishes
Dmitry
