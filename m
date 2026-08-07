Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFE405845
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096880; cv=none; b=M91xZnKPu8V7lCq/FQAbGAOf4De9ebpKy85RhmHrPiAKUMjJr9EJtxe/Hmp0z0KveLIl54/xuzuXxZrkVrI/Hy6ckFWUdxfm6fxN1gXcBxgpQaXE3i5g7e/dBrfMsPjqmXiKRwQVUkSQ9yD7P74Lq96j5iwl4wS0xjY9vtaSLWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096880; c=relaxed/simple;
	bh=0tJGvVapPDH5Nal231I+7KBjXQvB/GceZikfxU7tGcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SO1g++Fk3bBPAWyucI7N+UhPE3ubwTsMfTP+wd/AiR0AF+JtXEEEzCeEz8syGrMBD+SB/G6vdMp9Hqtb8a3xR3XPVn0Ll2REz1NYbxVGKz/e2Z6HdyAKDuz8JkaNH8hhATP7v1vQOtQvoHrOv/516UKYA1pMprhTZrIjNpysGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2ZpCNOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zi2ZnoeQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2ZpCNOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zi2ZnoeQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778AinT3822259
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 10:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KdXWq5xF8X5iiJ3H8uE5KF8G
	7SztQgd0eGxu61PbiuQ=; b=C2ZpCNOEW5glMOex57Is57KqSxMkBksEYYW/bhUk
	aKHpnncQtO5P5fGgxClZmCLrPY2xLZwxcnj7VH7+VIoVrb3CDGEz2LGIXHbACQBb
	kmnNpFXSgFRdJZRmvjkhR1Y4JACliJkYQCveiS0TziRHyrjeHuVpxJYmpkLNYHo7
	Q2oDKqha/5Z6hilSERslumHjkS8d9MzViiwVVaojPlbk4pzKgQEJwH4rFuez5Oq1
	JiTG44XTSNGePv4FlMGNmDKEExwO5rJ7feHe9Q2s8VipgkA7UUgVKRs3Q4097Rci
	ROtCtojf6eQDx5Ft/s0Ex8d2kzCR+DbuS0KNmwnI5eoyAA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gudq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:01:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so32589841cf.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096877; x=1786701677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KdXWq5xF8X5iiJ3H8uE5KF8G7SztQgd0eGxu61PbiuQ=;
        b=Zi2ZnoeQhv9dund1Nf3EQVfAdjcvTe/nn8/vv3wOzSWwMF069Xc9G+hPOmgYXCO+/r
         ByZaXn8m4O/CNLn3t6dnhkgkgGExHpvBXLNnB64c7vRWaiSwGk1HA8byTRgIZ3n44KY0
         UaNDICjHWk+5BNGj7hfB7Af//ootDTnB7YKbVxc8NNidlbanKuyoNbhoA4gzoVelJP5S
         TSyMjxA4pA+AbbnWEXXFaM3/vYpc4gAImOZYuGnB1erxGtUst8Hf9oUHLlkDxLALCF9d
         OWWMSnvFA13yJ1T5lY7VLDkGzQb5ROCt9haH6nupbBhVDF/QVwGy2zXJ5OAp4wIGNIb8
         l8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096877; x=1786701677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdXWq5xF8X5iiJ3H8uE5KF8G7SztQgd0eGxu61PbiuQ=;
        b=PJfz+wDLGEhgncZnJmzsr6BEAIaWw/GZtt5Co47VCarSB2i9GZh5YWY8seTKMSqqYT
         X5WIz92lEdhLIkJwUj+N5QoRCZ476CZ6QqY2E56MlbRK0cEwfuG30i4MXmDxvgholtZp
         C3OpUDIVBELIut2hCeWw2vdrNoDr17+g7zx9gXCK9BG0TfcCgRkf2UhDme8Me8+MpzpG
         fwzN8/E4adieHxIwMfZVQ7jhNbppoqiG/UjwI0KgFAg2CYQ6VcrQM21liVhTBLeC6Z9J
         Pz2ra5SavHMh2smfDN0+DmncKMnfnejE07xwLVMGTrwqg6x2r3taxyaUswG4NRVOkAPs
         rD9g==
X-Forwarded-Encrypted: i=1; AHgh+RrtNu3oJxJR/AiId8aBMybq777UC1aVKn9n9mzZvD7q1OxvKkbi7hvAZtmQeAURwMV1PYEXdAGgyO4r@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqz7zKo9uca/3H8FVe/DI5vDQTZVpQJ715zWwdNc1ZF4oqqYQ
	D7MIKV60D4a3StWIZy6tlYBc5LmFk1VaumXcfV31ISaA+0SIKk3Z++gsJbZXU6po7bcHwWJbBGU
	be78JfMSggyc7vgop9+r4GQNI8TQ516GBqbY3xXBTYs1LVuPfKPmHpmd34cZheQR9
X-Gm-Gg: AR+sD12X7TMyU4UQPDpMDi3Du4NGgMMQmQJePmb7pOqn2Gp7VKzzoWosauzX+r76eRl
	+9GTVrdlwtL0jmCyCwx12mnq33g2feJbRAlQkmwKGNej51mB8ZCzvfJlaGWKJupyngPOUcm/cYc
	vNTvf3hnIbjzL2y9YuiSBRwA9qSudHCyEE9Ffpq4E2U3J9vyKRvIHbMHhegLeJYVdWHmGXqm+GI
	D8oPogz70VbjCjK13l8w6mkh7wQeEaI+AcCeJojmbNQzOz3S9MulNTIV+Q+3tUf5zH5Zt39dyVd
	C4BZ7ZdDSyGXUnzRGP33+Tm2Dh9Jc0YeLwv8ESCz1n6SnBiavjGrqnipw3GlgtJXFbdDaU578l4
	wfWfdGWZpWnWu56t6scQLHt/Xm6xF7ZA2fIsvsqU11oVdSABX0lbcFPPseL6YxQdPh9+wDmDO98
	gG7WxcrulIF6zQPw==
X-Received: by 2002:ac8:5710:0:b0:528:f72:a986 with SMTP id d75a77b69052e-52ce6200bc0mr203803111cf.44.1786096876641;
        Fri, 07 Aug 2026 03:01:16 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:528:f72:a986 with SMTP id d75a77b69052e-52ce6200bc0mr203802041cf.44.1786096876200;
        Fri, 07 Aug 2026 03:01:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055ebbe4sm367835e87.61.2026.08.07.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:01:15 -0700 (PDT)
Date: Fri, 7 Aug 2026 13:01:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH 00/22] media: iris: Restrict lower IOVA range for Venus
 and Iris VPUs
Message-ID: <ppnk26bp54mv6wkllnqp2eirapp6phzmmwelhmok4dputz2sgi@4wvm5wri5447>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <5pnnu5nc6tpptw2wriq7r7mxcjvn3kvi5auz4vqffdent5bxiu@k5pbypgpgexl>
 <a3856ad7-f522-44af-828d-eaa1cc91484f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3856ad7-f522-44af-828d-eaa1cc91484f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a75aced cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Xd7xoAJqzLBm0uOpb4sA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UCaLoh6qhE8U5ELz7niSSrl2L-WF0LJR
X-Proofpoint-GUID: UCaLoh6qhE8U5ELz7niSSrl2L-WF0LJR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfX+X17+eZ9RodV
 75rt5L0T2WMJIcFjvjYP9oZkJRpsO47Qx0muIJPpsiuy0yZ6RN6iNKOx5UIRwB2IwfCIM6UwWe6
 WfJHD74C131mVKAjZDcgXNCLaT8ToRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfX216ieiJUsvSI
 TGzc+gghpQkvZChjhu522CvWTF6A+Pafw93ILty4+VnY1kPZDFU58Zh4yja/v5FCb3wlzklZVd2
 ROmhNaQYoAWLXU4VChBjBb7W0DM8wshp0rQ2DFkjO65vk4CkVomwSpguOqSnPjNR1wKx8kN1/jO
 Kg4wOHcM2Gc6X1zzyfzVc1hVAo6K8yer9K0L1sYB4o25J3DRYzAdgA+rT9FWxzEW+h7JDPgV1kd
 a8SV6eZ9A+Xc9/XtWpMQYNogIIe13JaHrvTHG/cppAQK3jUH7pDlsd0PedbR0EjAmEeehOHpd3I
 JlodY1Tv1Ys5s2QNrqcIN2e3SMqo1fW2R+pUMnon5uDIlXpG8X/pZrgrc7CbFu/DfH8dk6lCY2U
 4GfViadjbXU2GpmwYoAPs1LijOAyPUdiW5guUeGaH7iB2MpEY9w7NmyLyTAFuWkA3UIhV7WnbDh
 Ix59cqd6EAuKxNGB6xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070075

On Fri, Aug 07, 2026 at 02:35:29PM +0530, Vikash Garodia wrote:
> 
> On 8/7/2026 2:29 PM, Dmitry Baryshkov wrote:
> > On Fri, Aug 07, 2026 at 01:54:44PM +0530, Vikash Garodia wrote:
> > > Qualcomm venus and iris VPUs reserve IOVA addresses below 0x25800000
> > > (600MB) for non-pixel stream ID in secure mode. When the kernel
> > > allocates DMA mappings from this restricted range, the VPU generate
> > > unhandled SMMU page faults, leading to video failures and, in some
> > > cases, spontaneous system reboots.
> > > The issue is readily reproducible on affected platforms by running
> > > multiple concurrent video decode workloads, such as opening several
> > > browser tabs containing video streams.
> > > 
> > > To prevent allocations in the restricted region, this series introduces
> > > support for an IOMMU IOVA reserve memory-region in the Venus and Iris
> > > bindings and updates all affected device trees to reserve the low IOVA
> > > range [0, 0x25800000]. The memory-region is referenced by the video codec
> > > node, allowing the IOMMU layer to keep DMA allocations above the reserved
> > > boundary.
> > > The series consists of:
> > >    * Binding updates for Venus and Iris schemas to permit an additional
> > >      memory-region phandle describing the IOVA reservation.
> > >    * DTS updates for all affected Venus platforms.
> > >    * DTS updates for all affected Iris platforms.
> > > This ensures that DMA allocations do not overlap restricted IOVA
> > > mappings for non-pixel stream IDs and prevents the resulting SMMU
> > > faults.
> > Some of these patches have been sent already. Why is it again at v1?
> 
> By some, i assume you are referring to the 2 patches from Daniel. Kept it as
> part of this series to maintain the continuity with patches across other
> socs, other option would be to bring them as dependency and drop them from
> here.

So, your series should have been v2 at least. V1 has already sailed.

-- 
With best wishes
Dmitry
