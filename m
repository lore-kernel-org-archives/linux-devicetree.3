Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0C486B9B
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672286; cv=none; b=B9w6x7ZBUjpFdE+H6RstMf2TkXu8NGMKTZo+lWXp2dgRQPjOgosv3ovIFon5pCr6bSXgAVVWnE8TVUz+vAFbDzuJYMZaNbMnS6Drv0BOyM9LXLFNdEGDElvHmks54QTdAsDbua4pVCcVK+E84gexXJCCUTtGorF1R4rBETT5feM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672286; c=relaxed/simple;
	bh=tTSV3+j96eWcnntmCZqdwhCn470mgOb4Ngl5o+ipm4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD91O1qiC1xqDI8aWPCWmb2G/LyTs0/MNiNyzveTCuWWM2huTR0FINrElau+oVsMTTlBO31MYkL9qQf9Qzz6sTzi8bFUO8akxuGJvd5E4e9VTVHIQJMbIE5IqsLjpM/rJviAneQpUvvUstruFOQc9EitEbfcmC92v48jdV+UyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrSiNCnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buxjLQwr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrSiNCnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buxjLQwr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEUWjf1153283
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AvkDRJZrCML6+GocQvDS4cvH
	5oLlZjtVzpdID5Tg2qs=; b=NrSiNCnCi7eJfmVs7srS1fnU6xZj48/MDmFrDZS+
	dEAdzRbqA4QDD86VFROWQ7GWNYbluLgke8C7EEVQIE6UV9e23u8YYNwYbG37dVif
	qAX52ktkDiWDpeU3CbyIAhXd4HG2TNeW7+zWGhZ/4CCzuM72OoN8cPYGSs0NdnDT
	1YgqryKdjfit2MZkULnhdfoL3Z4U3EkMULH7f7oa+/jEaq+7GoOnQlGvHzSpjfqs
	CKBhasv/rALmes8ugbABw/TfHk8nhf294Ke3UeOCj7C5lVjx/NBiOowOXZU9dhzr
	kIJ5Ixb9SDWrcbsS9DxDVaJIjC9bYCyHzklf6cjBt3QBnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93xxtqwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:37:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52de40127adso54147971cf.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787672278; x=1788277078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvkDRJZrCML6+GocQvDS4cvH5oLlZjtVzpdID5Tg2qs=;
        b=buxjLQwrLbgz18UwcFaxRFmKtgEJKvUASjzhWHqGdgMVnCDGzKbPwglEMPGaRPXzuu
         4PEq2oDUbhVBeIuv+2pXMVLy+OQYGFdLrjhSYKxsU+i6kb+rLgYLWUfeneseUh8PGcLl
         qa+J5dWS6RT2XONaYvxhqHSiDOy6p8XZ+4EC0ibloXDwGSq/nFwjnFYqyNWusXtn2AAe
         MdWvpmSVxglivHfoui7iYaJS9XJfyyM7Umar4n31SamOuJVfxxn7sjC/h58zgQP+KuP+
         baf3KEdaKmLu1SqRtCSK+8wwv33RTCO8bVO7nMZqC4Ry3CI8q7U0M4UobtS0fdt/T1W9
         59/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672278; x=1788277078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvkDRJZrCML6+GocQvDS4cvH5oLlZjtVzpdID5Tg2qs=;
        b=CIJB1pT01qGKYCWbgG132IBh0K2TSKcirEWu8i7SbIrr6Yh1XiEcX2rSfZNYjMW+ja
         7avb3hqGwXpOILe3ee18XCjl76ahCDWeKSc48+nR6nLtmYEoOXnHALQE9JZ0E0eH4fog
         ccjIx7DfADYmSZU3S7AbPIBrFu2t0rBiUdENUSpXZw85/BuHnOA1EuS++qHiNZSGKn94
         MpqHYR5io2POK2QkZs2kGlJ4weSDO/tCG0FG6vfSMluy4TBuA1rLzKHTkUm/eGz2xr+u
         7De6PIFkznfbdvDRvY/g9jD6gm35J6luRs3IgKXo+pcv/DnuJGCdLCCts5ZlK1t9MNWZ
         roPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5zSBjTowK6V/77oQXma3DFSLm86fcrWF5wTok3lL0Lqkveqp8r4sBtccQeV5RIwE9plUmpX6XRCaL@vger.kernel.org
X-Gm-Message-State: AFuF++kB/SE2VHAij9koUCb18saGFx8YShDhxW/TRJ9rOd6Uz+ujj1BK
	Am3+aHviNNJAjM6tigQPsWnWjP1L9ot2nL5JRybfyuRalgvGEmOQcdsJKZektzNIsUvEe309K7F
	yv03Xft/chbUAl9xYwtjEBNAhUpcDjIpWr6Jm/qKmnQQdPX8bY9rwJ9mTwvjm6GLs
X-Gm-Gg: AR+sD13WNjc2cO4/VOvMbIVrHmmBTU2zDlwZjG2/RUmyNaHV3w4NBIJJtjIPE7ryqE9
	iv2f1XSmzflwSGLbuS5LMYigzR0ELWLjde9xsl1wQcZOIQJaeOs27+ZZt/7E5DwK/+nogTCCbzG
	2cejzn9TfT5yA3guw7CBqzUdTSj+4nQ7zZkcI7HRMVY8bM5jR5h6vv9pifxXxzF1A2Yic6TIS/B
	o6+yp4kJHM3PDIlwgc/U78htEW1WFfDg8G+nwTb/CQzZrl4dTW5idWXIYj/MgZjcqX3qnGmBztr
	9dpsxGJsokF6LNRHdzSIU1fgK4HgsulIH+G13fIuCpvokLYhiNcwhe9LH/yo7D8kWLq2hTLQSK1
	rc6v7TnzZpmu9WQ==
X-Received: by 2002:a05:622a:260d:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e09cbc4e0mr315333591cf.37.1787672277901;
        Tue, 25 Aug 2026 08:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:260d:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e09cbc4e0mr315332471cf.37.1787672277340;
        Tue, 25 Aug 2026 08:37:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9e96bdsm5339066b.55.2026.08.25.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:37:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:37:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMyBTYWx0ZWRfX1ytPNUeYPtqU
 S3CplGX4D+VaNOZJ/w2XTZpqmUME8HFAhOctCqgDXve3VBne+o9+OPyAejF2LB2A7cwZLm2Kv7O
 luoo6qWXAnKKKHrktWQGlE9sbNY5NIo=
X-Authority-Analysis: v=2.4 cv=EOg2FVZC c=1 sm=1 tr=0 ts=6a8db6d7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: OY3WZyePi1IYJz7cQcMrDXMj6QEEcHsx
X-Proofpoint-ORIG-GUID: OY3WZyePi1IYJz7cQcMrDXMj6QEEcHsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMyBTYWx0ZWRfX4lZo3nSFuZZ9
 PbdBXRFl4Ny977sLM3AEkaJZPrJKZKb7SSK54tGR7yE+5l0SID0atTSLXeYacn8g3y/jErYeiEl
 8LrHbt7Zv5glmnLurHyMVOQuWjnra4iCra7VkuL8Le7iUQnbEs/Ad8tNPWzXShPI5N7bjNMaQM7
 G4wpG0yBEnM3lJ6Uyyz2ukOYBXhlekbohVor6qxUUUqt5djHc8Ujr10hBa33PUJprh44F9ZiUs4
 M8WHAjVgvWn2mzjXDbJpQeWsMPj+DlJV7oeUf5z+GZbJWE3a9IxZPQYHb7NMmNHdLDBAq/1vUix
 5aG+gDg93I1xzAYdFInGmVV5CnHrQD4G9vC/OPVBWW75Xc5b3xQa+ndTs5naCK+VE8XTAUlpmiM
 aRWsHqpYsy2Lf3iriythTCETv078jb0EkQfT29y37GNGRmPB7T8ONXMuCx30Ai3Uydkfm+M7wNX
 58GVUeuC6V02Rf04XFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250133

On 26-08-17 12:10:06, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> >> The suggestion of having the CX power domain tied up to the GCC
> >> controller started here:
> >>
> >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> >>
> >> and then, for Glymur, it has been brought up here as well:
> >>
> >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> >>
> >> These plus a discussion off-list led to this patchset being done.
> >>
> > 
> > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online
> 

Actually, what happens is that a sync_state dependency is never met.

GMU doesn't sync state because there is no driver to bind to. No driver,
no sync_state.

Then GPUCC doesn't sync_state because of GMU.

Then GCC doesn't sync_state because of GPUCC.

Forcing sync_state with timeout, allows the GCC to drop the vote on CX.

This is not only a problem for Glymur. I have the same issue on Hamoa
(XPS 13). I'm almost sure this is going to be a problem for all
platforms.

I'm looking into possible ways to get the GMU to sync_state.
