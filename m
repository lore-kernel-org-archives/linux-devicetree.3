Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA933BCD19
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 20:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356581; cv=none; b=nqDHZOWEJkZ3XoVwq0SEqRUIeNfwIF4Qwzz3a0h6aJ/99tNezwkFkeXv6Qs04Iu1vzLetNg2btO4QVx7bMR9l2U+gr3vmGz4Y5Yt0kkkTUuBPXpWq9RzjaBW5FYA3vpGZX6PgQGlnkyDzZTaFsEKSFWWXlIfq5huGNoMI6aYBfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356581; c=relaxed/simple;
	bh=fnN/8Fl5iw2/VN+2dRuEcwBwGHxWOhSiDNOZmqstUhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH72UMB4W9odfDfAtReX6JLuY21BSY3011PUasYHcYqhG4vrajppGIhxieIWzDrfathvVr/fPNgpRjBZ/y/pWXKfpxieFouecNiIgnJp17G1pQqPnrEks9Y5/FEkGmAkkYx96j1knrYNs0A77KUZBh6D9MLOGZss0CWta+RKZPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIYa+lvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiPuJLZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIYa+lvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiPuJLZm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IKApG1351687
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 20:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rF1/ZI4OEGySchj6s9m7BogB
	ZksKD2n+EkoLKNru8NY=; b=PIYa+lvIbTkIODfZiY4L8W6ZG+UezGxChljquqkr
	tMjcgzv9csT53YZrAXEYba+gwwNYSgRsoo4pgepvBJD/OFFoTl+htQbPKpQYKOby
	CjMtrdEFHqOm/wmnmHSfd52zep6WIFtIIwvG6aU2FQtdSEMQummh9+C+uvJfoE+b
	KwNEv896uvNRdtjKtp6tlhNaiQh7mG8W04SLnExXBlPqDpqdXd12ImVIhbnDgn4x
	CIxTxvFFGxZzjSCdYkUQFSImZkv19StU4fULbHhRVEs4rVZrOOIS3AlWaaUpn5B6
	sMI6+aiCqIsorN1E89nAOzc0wqd5AvAWcKrul6dqoQqR6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgm0sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 20:49:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso241429785a.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 13:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792356579; x=1792961379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rF1/ZI4OEGySchj6s9m7BogBZksKD2n+EkoLKNru8NY=;
        b=aiPuJLZmb8ugWWoNXn6eH8MtEtwyiZlRB1vMIe9jaD6MlOv8m0sPJTeNEZDk6g0kIA
         /XFbAGZaR+MrThbOZBlvxkMhkN6e1Bgu3vUYWWA0vuLRuzE/2kGAXWruIWmff6XrXcpk
         dp1WNn6GsAScfDGT6cSc4tvidxMunRx74iYjglw25fxCcSVDxRYRaJAWMCX5YhgHOooG
         5hG4uG4b/dAg2DIqeN6fcESZzxu4hLrxGqrvt0YrEG9wqopROUyHWBcwgiVSOKqLutXx
         6bQijpfjEdslHpLIbwz41fNytZAzM989iObJf9/8NrToZuTDAV1y9VUMagVDoGlQxsZX
         fIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792356579; x=1792961379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rF1/ZI4OEGySchj6s9m7BogBZksKD2n+EkoLKNru8NY=;
        b=Ld1gea7dlrMeFBZqIIDdBRBTNPJTMTEOcKXn7TfedlJBmxBsdxUr6sALXQ50PvwLXo
         vRVVXo0tAZt1HV5uWCP03Bd5w0cqTgxvPtF4XQ8/LAHfAHoQ1Prp1TIKx6I7lopfdCoT
         SdCHCCbD/b+fwQrcYkLetRZZqre92cdAuUvcDkVeNWSZ47Fz/npDTUjX6OnqRcy24Mvu
         rStiZmvgqsBQQ0YA2Mak0aD96bqYJslUY2eID2Z1FUhuRyqH3fzdRVJAwlQnWXjZAEjH
         vT625+XXo4dyC9Tb7zW7waJhWObcCJdyU6QiAzE/UnBiJNymHsqtHuZDp9ghV6Xd3qKM
         lwPw==
X-Forwarded-Encrypted: i=1; AKwUvBxSN+S4ntiJq/BHVs8HYa9iZe9A9j7uN0kxvZzCH9mafNi5fzNyJT3HMr3FlOnPA4urVimBf0GSXABv@vger.kernel.org
X-Gm-Message-State: AFq9FYIH8mbXz22Q4vYCu6k8gIOVt1cQXYvyF/zTloz1ni6iX7xvy9kI
	pc1XpsyjslKfKwdCpCm2vqpxQJZH2RmUVnVJf70ReEVDZMeAXWnOf8xYiNH1fzqoS8D2tbfLIo0
	vKP0KYlJeQv4ZtAJo7vxoIRQaIh93wjNccvatyj8JU2MfLQAzZ2pru21zjTY79EiG
X-Gm-Gg: AYBFou1FzgfLEU1RBbYc4bg2bFvooi53HysWgGhvDCIF8+4R0scYwAQDRZSwGovP84K
	2IWfjg/6LCm0fGFRcWhCK8/7rc9Mzv8AQPE3OgQzgnsannbFUG6glKHcP+GgJgjgghEdR4rO/lJ
	A73m2tZz4ZlJVv8QJAm9YQYl2CKYrq9AeeZ6pDixBr3nBX7AWoj6ZLuCKmQeLW+BeUvL9L1+sdR
	YqFX6z9s0rkrimm2lIywGxX7IcdQ99r8RfxfXsxP0dOa9DPxuA3LbqU9UXi5Gsvxyuz7bysuulK
	4Zxitq3Kt9l4lNMCD+wgLeNeNlrIgBJiqn1OLdTU3AOP8jXETrUgXWa1QKjy9Xa0PLTKNI2j5wZ
	Kpl7VCULe8M1P4KTTHXiBRstveejyDaFqXFeIa0upONg1MSNl7DwWxCLejj8bRu0ry5I45T+x2M
	HoIaduBPE87XKL
X-Received: by 2002:a05:620a:1d09:b0:93a:2d15:f84 with SMTP id af79cd13be357-93f29ce44b3mr995501085a.33.1792356578668;
        Sun, 18 Oct 2026 13:49:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:2d15:f84 with SMTP id af79cd13be357-93f29ce44b3mr995498485a.33.1792356578025;
        Sun, 18 Oct 2026 13:49:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42aa05sm1566020e87.29.2026.10.18.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:49:35 -0700 (PDT)
Date: Sun, 18 Oct 2026 23:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <yyq4cza5oa35tfdcrm2re4jok7c5nbqy32s5hfceipjvaw52wl@kw4bqvdv6u25>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
 <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
 <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
 <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
 <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
 <CAO9ioeUEQ+kzBLj3KTv+uayaE-5aw-aL49-0pJ-x_Vwq4nu9JA@mail.gmail.com>
 <DLHFUAOHVWN7.1K596C038662Y@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLHFUAOHVWN7.1K596C038662Y@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA4MiBTYWx0ZWRfXyS6ngdDfSnEO
 ChsB9hHccaYd0pz7NSCkiK6WHtnjmkYno6Efxg7t2k0LjNV4EaeOt1L7ODIEDtgxoylrLQ6Dmv9
 sZT27UMtZ90M6a5SPRbTmcuiUmHzZro=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad530e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=wqXmaBnu89AGqwwdg6oA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA4MiBTYWx0ZWRfXyFaoSqeKUvQN
 qbMXUDbI01GMxZ+8Vk6jBQiuovbGQKRquhwd6Wa/1u8ZuCRiBpuMXgN4GogRgMsDBevL+vXgCxA
 tW9hQVRfGJ4ot1zuf0TBI3UvqqjSX2H7HdK5jHzjroE1en5auE0KAu7mRG91HBgaaVicF0LVflq
 48QJNM8Y3OqOsScZ8MvYw3OgboF4aeOsoHlfI2i19C9sMhLxwS8jmK4GPWttW8s2iLtKvfJNt5U
 sfueN6G2GMcHRW57td0SpBzj9bQwGLRPF603wioA2rw3XKWCdwStOzVwclfnIWVvmwOpb4BZmzW
 3c8/dZtMX6SCiigab3N3WsF24lmlgEqfkxsZOsMCinuKB/DMc3haVIhasoJBhcZMlYx17u3f+jk
 TUSmCSKMpdqYKVaFcqUGdNaMHbRm+DuusC3c3dg9kYLck6E1kG1EYPbK5GwysMitzteqrmQRmoJ
 sz6lUpjJdW6olUDUxPg==
X-Proofpoint-ORIG-GUID: PYTbC6mqyXVmEJ-t2-9xi0E19OfmzXKe
X-Proofpoint-GUID: PYTbC6mqyXVmEJ-t2-9xi0E19OfmzXKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180082

On Thu, Sep 17, 2026 at 10:11:27AM +0200, Luca Weiss wrote:
> On Thu Sep 10, 2026 at 4:20 PM CEST, Dmitry Baryshkov wrote:
> > On Thu, 10 Sept 2026 at 13:38, Luca Weiss <luca.weiss@fairphone.com> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
> >> > On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
> >> >> Hi Dmitry,
> >> >>
> >> >> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> >> >> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> >> >> >> Hi Dmitry,
> >> >> >>
> >> >> >> Many thanks for working on this and sending this patch series!
> >> >> >>
> >> >> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> >> >> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> >> >> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> >> >> >> > spec, however they differ from other Qualcomm platforms in the
> >> >> >> > implementation-specific registers and also in interaction with TZ.
> >> >> >> > Venus, MDP and VFE SMMUs are secured and require programming only of
> >> >> >> > CBs, while GPU and JPEG require full programming.
> >> >> >> >
> >> >> >> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> >> >> >> > and adds only MDP, GPU and Venus (although untested, it is required for
> >> >> >> > display to work) SMMU instances.
> >> >> >>
> >> >> >> I do have a patch series (sent years ago to the mailing lists as well)
> >> >> >> for CAMSS so I can definitely test this in the future.
> >> >> >
> >> >> > Ok, let's land these first, unless VFE IOMMU blocks display on your
> >> >> > platform (Venus was blocking display on APQ8074 DragonBoard).
> >> >> >
> >> >> >> > Note, to get display to work properly one fix is necessary, [1]
> >> >> >> >
> >> >> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> >> >> >>
> >> >> >> I've applied this series on v7.2-rc7, with the extra commits between
> >> >> >> that and linux-next for qcom_iommu.c backported so that your series
> >> >> >> applies without conflicts.
> >> >> >>
> >> >> >> So far I'm stuck with the GPU not being able to probe, adding some
> >> >> >> printk's shows that in msm_iommu_new() the call for
> >> >> >> iommu_attach_device() is failing.
> >> >> >>
> >> >> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> >> >> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> >> >> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> >> >> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> >> >> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16
> >> >> >
> >> >> > See the patch [1], it's picked up for 7.3
> >> >>
> >> >> I missed replying to you, with this patch the display lights up again!
> >> >>
> >> >> Unfortunately the GPU still seems to have issues, I don't have a log
> >> >> right now (I think even SSH was dropping then with a bunch of log lines
> >> >> appearing in kernel log on screen). I assume kmscube + more complex
> >> >> workloads worked fine for you?
> >> >
> >> > I was mostly using kmscube, but I can try running the CTS once I get
> >> > back to it, sorry for the delays.
> >>
> >> Yeah, kmscube doesn't even work for me.
> >>
> >> Bootup works to a tty with screen on (mdss doesn't seem to have any
> >> problems for me), but then as soon as I run kmscube the device shows a
> >> few errors on the tty0 on the screen (USB stops working apparently since
> >> my "dmesg -w" doesn't show anything) and a few seconds later the device
> >> reboots.
> >
> > Interesting. I wonder if it's TZ tripping on the VFE IOMMU.
> 
> Do you have any suggestions for me to try?

I don't think the issue is on the SMMU side. I don't see any significant
downstream difference between 8974 and 8974pro in respect to SMMUs.

Try adding GENPD_FLAG_NO_STAY_ON to (both) oxili GDSCs. Also try
manually enforcing the vote on VDDGFX (e.g. add a dummy node with random
compat and power-domain pointing to VDDGFX).

> 
> >
> >>
> >> dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt
> >>
> >> The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).
> >>
> >> I know there are some differences for some bits between MSM8974
> >> (Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
> >> have? Maybe that's relevant, also since downstream splits devicetree
> >> based on 8974 and 8974pro.
> >
> > Mine is APQ8074, not sure if there were revisions.
> 
> Maybe /sys/devices/soc0/* or /sys/kernel/debug/qcom_socinfo/* has info
> about the revision? But maybe it's also not useful. I checked a bit more
> before and all msm8974-v2 downstream seem to have the same IOMMU config,
> just msm8974-v1 (which was barely shipped?) has different configs. So
> hopefully the SoC revisions shouldn't make a difference here.

-- 
With best wishes
Dmitry
