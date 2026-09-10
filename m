Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337A4A0F04
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050037; cv=pass; b=ltaXEoY0OQxJ7X1d4REZap46kCSWBdQb6FKRy5TqMlTndNreSCBvwzte04uf/Z+8AuTEtCOagqwIGDE4Y6OMgH1ildnuUTO73C3PP7Y9wyJUl9bK4Dr2+hXg6aZnNcdp7AF26bhq6TCKumm1WsVS2M1zjFc5z4PMN5kSJgwURMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050037; c=relaxed/simple;
	bh=9QJteI92RwPPdOMUgnNnI7QviKfuZP58/utp5AmqgiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8sOyZuXQuN/wZDKA5cvdkGYy29251QmSuZmW/cvu2CtGcVUMmJVrnuwj6rcmzerVksAAaYRnVZz3wToNAjD0AQp6N2F2XPwbCAX5SPzDY2IrBJP/tD4GMXOAtcu+keGJ0YF3w9Q+FpwNvlFho7o1teBBQRLVNik1oSwVhh6f9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEl+QYBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCXcLmVA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEl+QYBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCXcLmVA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ZoJ216022
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LzPgv+JUw7blI/3j2Lv9Lk9a
	WSnQjmSVlk9jgF9EUWw=; b=TEl+QYBjvKr7HpD3M/E1C0inzzxT3wPzMBXyaxhQ
	JS/k2+jCEgSrZI5BXgXVlsRw8NSb9S6vwE+BV6TNPQgVtJ1i/VGUYRW8xvArJpBb
	/FExhwovNJjR603crm8ThBG4bbHouAHtaZpkFVtj6BKT+ii/rzl6nGDYwhdmj4Ps
	/vIW9HOv7ifG3YpVyTiyfvPIMG12n812GMt2C72XhR4SfIJeR1BK0QjC2mRH9q8H
	CX8pRnTA46axH3If96TmEpgPN2r7k4NWxWdZR3TEf1+tKv/S3/XwAl62V2FMl6ZU
	XGM1IaoqCeU7iFyUzmBIrAeE5yMqXRYPbUS/inILFhZTrw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn9jf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:20:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso98777955ad.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050035; cv=none;
        d=google.com; s=arc-20260327;
        b=Gde2mBWuMsGcK5dKwgM5IWAodmWkQSx5zFp0hDtsYM6zBn0cMyMAVrHUaw6+SNw/16
         iePtxHMo5WVqq3aDMptr7kpZJ98ZUcWyLrGqbrn6MMyntj96jhLtwdnnONq0LOLIpxng
         CekJ6GsA3FMH7XcnVqXxWe1g8NktHn4Im7EIlbmnrO/q4OLlLnamI2FwAcjDVS203smD
         RiRg1L0G7o/Fh6U/BOYxKte+vGT/g3Ahwd1rW/jSE9K9E1Djx2MDQSJNVUklR7hs/kHX
         2WZTVY1/HuYXw1xxx8FxfYHEEQteo4XIlGHWTjejojwk5ApWnbwMryLZ528q7/5ReGcT
         BTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        fh=+4HgWHEvYdRGQ+/Tj8VPAvcdNDuG2FNKensyR65j6e0=;
        b=Hnv0OZoXB4/qFC1IIdee7mqT3XSYoWzKHDXVfuQlGMM2dhQfuUIwT7/Vnpe/Hw7kYK
         /jF6/nxHScpxrVNfRmBJb0TQtsUR1msCoWULAsEcu0jKrmNAKnti5b2IU1rg7YQ7oCUA
         FKbtHPk9G9yEL5coykg+p0CGp8tJshpJd9lxIYbOSxyXT9tbrYV4coPzpteDxrre9LYh
         49i5UIfw4DIXflDqiryFxlsKd9GB0sRVrKpFGYp6THdrP+XKcqUIxZ0XNlJTXrRsTV46
         887+MMEv/0hxNlwx1eAe2I/ZEfIII/KcyDRMs9qlqV2+JYeeeSf7EsaUTTWLLweulWuU
         hheA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050035; x=1789654835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=eCXcLmVA6j04xFdI/xApaq8ds7plzjZ9cNI/ZyFOjvUvSOcb8nW9j+BeNx6GYPsPH2
         aT4bHXCohcOyEY3VZ5e7tZIiTTByNjdokg1DpsCeQoKTCQ/KKM/iE46bkgAyhgw1HhIp
         hMlgiysbmXNv8W6Tu/HLTyUaD1dKHWOkGG36mb9XhyokkrY6OLMzbp7icBU8kJDT4TbB
         55K/QYUOHewbKSgXi9BYNRYj5kxho2+DwWz+PALzATdBtx2sDwVdK9viy6CkU76uXg3W
         BkGwacOGDliO7bq3aw16PKsUn9iHqvCfGegv/NZcJFaABwoLuTxqwV5MifFxrvgqsxjH
         HARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050035; x=1789654835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=GRn3OzRbXWAupVt1iilpV+Bxe2PgKWindLa5aTN4vdDN64+ApNIykoN5Ms8WqZYB5G
         2LK8aqr6I/EArILGn/L1T6oCmrYrws9eNUk3mMSsycJbUpXYA8o+LqWFqL/9EM7JgBIH
         NwaMMXRDD6hPFFaSnb9QqGAN1i2Y8tRXS5hikEBqD9Aarkr+VOVDeqR/Er0LvOYaDdRs
         ivoGLvjDerTvV1NmzOa1s7LYSszsj+Wa6ODsTLaUGgur+dELo2IKck7vgW2/5gdBzQPc
         tPqM66bUaM28SXZt5MEje137nniLwqg0iX6FVChvvko0NzIRk+9pAPNPNyslcVpW/7jv
         HDnw==
X-Forwarded-Encrypted: i=1; AKwUvBwrImWmgXnLt6lR2pTAbjfyTZIGmQurUcF8p9xuwBXxvvQNjpdhMjG+MTk6c2UWebNOG5WLyRY+1Nni@vger.kernel.org
X-Gm-Message-State: AFuF++mMD4ODoaS+13jpil918zn9XetyRLxosAZJjONFnUtEl4GVD1Id
	0B5QC9ZUa5B3rid4PdgpV4aIAuk/kniyZScthaX3w8gcqXpFFWHTR0lGtvEQRdnJP97Tes1B3Eu
	OQTuIC1EX6BeyfcZ6nNv3/JH/uhXEDVx7iX+u2f6twWxEpzfWy4MK8BN1ozXDv/024hWo0JbLrb
	aoejy1cMbnpQJXIV+F3wQu0BTWpQ2h60PxifRv+5o=
X-Gm-Gg: AYBFou2y9W+hnVFpfxf+B7jDQJSJgK2kjs+XMBSw20OsQ/uUBY4HFMa7dlVjAXE7GXt
	+x4PMjTJUW2MHT56YKh/rjiU43J9fBj/jULYwQXDJeN17hrhT5ZH6nmoyTYQAOtTgoLetodDxLC
	AZqKMEQRxORJxmU/Pw5pvLIJ1oEPQusbDN167DNFxVDbOGJ9TWBCJ6HNM2hpcmuN18j72fwxE=
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db8dc82407mr200797815ad.12.1789050032694;
        Thu, 10 Sep 2026 07:20:32 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id
 d9443c01a7336-2db8dc82407mr200793205ad.12.1789050030094; Thu, 10 Sep 2026
 07:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
 <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com> <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
 <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
In-Reply-To: <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 17:20:18 +0300
X-Gm-Features: AcwNN1VVA4SntoL5ZvQXqShw0ZuVR288fdr4bQQ_lWLwdYYaNA3KoOK8hgJ80N8
Message-ID: <CAO9ioeUEQ+kzBLj3KTv+uayaE-5aw-aL49-0pJ-x_Vwq4nu9JA@mail.gmail.com>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX2mRKIgOSfZb1
 D5YAFJdl2Z6rCRVJ/Y7S+8sQFbS6T1AB7kUJNoyS0HDfBP0NRy9rNvhh3xPKXjNAzkigax+wgxt
 85USbwf9KqpRBnpN6sMrzJ3vM2/nME0mKkFo4dWpxy7r0+A7SJQCT+jsYJeHODqVMtLbaOGfb6J
 wieZu5noWWv6HlLFHlwKN6jzMD+wR/az6KPXpmPOESv4rKmI+SQxVQtp55VR1xIdcckkMvCMpd0
 SjOJQku/mcStJtmKfKi4h2eeHP6/cqukIwSb9lkm419cfhK4BkKPWBrYGcwfpbZrB5v95+GJj7/
 ZWJ4C69z5exLI+K1T+9qCNbSK2Rj0dZHNLasNpPozXKBbFAIGhX8rn+XMcNk0H7tGeYQVdJaW/2
 j3BVpRfCD8qiJ3ZUOpj+X3SBADsIIOnVYpKflvqG2V3zbCAuGxbtBiqhaQuLpm4K7j2CuUHjdFg
 NuV8ozI7kq/+PAqZiLw==
X-Proofpoint-GUID: J5EsRSn1YCpDNx-wMSrxhuH8dq6oH9H0
X-Proofpoint-ORIG-GUID: J5EsRSn1YCpDNx-wMSrxhuH8dq6oH9H0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX1mNv3ERIe++8
 dOkzkQ08CH0rVKkOcuXKEFtENDHXo6lUKpcQoZRlPrA3bb8Hlg4TgrfkuTMXrKUi8Klrrp4NOju
 eFg5j+DVbBJbF5JjbQtMUWVeHOI7hOo=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2bcb3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dlmhaOwlAAAA:8
 a=6H0WHjuAAAAA:8 a=YxQatw1j_ZWosVD_vr4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100172

On Thu, 10 Sept 2026 at 13:38, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Hi Dmitry,
>
> On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
> > On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
> >> Hi Dmitry,
> >>
> >> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> >> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> >> >> Hi Dmitry,
> >> >>
> >> >> Many thanks for working on this and sending this patch series!
> >> >>
> >> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> >> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> >> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> >> >> > spec, however they differ from other Qualcomm platforms in the
> >> >> > implementation-specific registers and also in interaction with TZ.
> >> >> > Venus, MDP and VFE SMMUs are secured and require programming only of
> >> >> > CBs, while GPU and JPEG require full programming.
> >> >> >
> >> >> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> >> >> > and adds only MDP, GPU and Venus (although untested, it is required for
> >> >> > display to work) SMMU instances.
> >> >>
> >> >> I do have a patch series (sent years ago to the mailing lists as well)
> >> >> for CAMSS so I can definitely test this in the future.
> >> >
> >> > Ok, let's land these first, unless VFE IOMMU blocks display on your
> >> > platform (Venus was blocking display on APQ8074 DragonBoard).
> >> >
> >> >> > Note, to get display to work properly one fix is necessary, [1]
> >> >> >
> >> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> >> >>
> >> >> I've applied this series on v7.2-rc7, with the extra commits between
> >> >> that and linux-next for qcom_iommu.c backported so that your series
> >> >> applies without conflicts.
> >> >>
> >> >> So far I'm stuck with the GPU not being able to probe, adding some
> >> >> printk's shows that in msm_iommu_new() the call for
> >> >> iommu_attach_device() is failing.
> >> >>
> >> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> >> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> >> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> >> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> >> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16
> >> >
> >> > See the patch [1], it's picked up for 7.3
> >>
> >> I missed replying to you, with this patch the display lights up again!
> >>
> >> Unfortunately the GPU still seems to have issues, I don't have a log
> >> right now (I think even SSH was dropping then with a bunch of log lines
> >> appearing in kernel log on screen). I assume kmscube + more complex
> >> workloads worked fine for you?
> >
> > I was mostly using kmscube, but I can try running the CTS once I get
> > back to it, sorry for the delays.
>
> Yeah, kmscube doesn't even work for me.
>
> Bootup works to a tty with screen on (mdss doesn't seem to have any
> problems for me), but then as soon as I run kmscube the device shows a
> few errors on the tty0 on the screen (USB stops working apparently since
> my "dmesg -w" doesn't show anything) and a few seconds later the device
> reboots.

Interesting. I wonder if it's TZ tripping on the VFE IOMMU.

>
> dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt
>
> The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).
>
> I know there are some differences for some bits between MSM8974
> (Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
> have? Maybe that's relevant, also since downstream splits devicetree
> based on 8974 and 8974pro.

Mine is APQ8074, not sure if there were revisions.

-- 
With best wishes
Dmitry
