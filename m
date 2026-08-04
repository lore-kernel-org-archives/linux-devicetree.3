Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23F40D562
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868250; cv=none; b=rZO/Jhd6gcFTk58TP+ztoxN4FSKBEJNy33ZZiK4ynvYqEPsTXYAQWR/zIPLdtQ9dIYMeqCkn3JT/cLtC3ikKoceu93x+e2JcAGtpwjVpju4ft/UiASiBwOuSHORrXVCbZXYUhrdPDFSH66oEE1pLuyu4gODvvxcRtp/x/tXIrj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868250; c=relaxed/simple;
	bh=D4Qny+SNB++brDPpEvfKvsrGnVhLNcnYa8NDK/rHLRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdgQBC6/toV3e4Kr97syNmxc1nYa92F0ZdMMp/lEa7mde3ekoKyi8FBW5nuBxsbCKtYz6ipUW62TwMgWj8kk7+oGSgS1QeVeiWZ4+/mX/udQ0O/IaT9BI+sLvoCi2RrJ11E7hkaNCKvjefZ6Ta8Yf69cfFfFGGBBVvVyjo7DBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvhpaFTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1rmr7kK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvhpaFTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1rmr7kK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfcUq369191
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 18:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JfC9ELx4BpTN5CFmL3R6Bb9J
	ryzEWW2TxPGog2BUjdw=; b=kvhpaFTFxP1RHthnXhX0i+WvH2QrqW/+6uAuZmEX
	9li2N2NO+GBgk+WRuwblBBlCC+j5d8E2pEl7xG32VKgBCYxGeWhu0ynRt7O9S6hD
	Hgfy7MgcFSZhnXVH6dYqBoL3LyILCsHhKkjpdUAs9my6DMxmG5AlU4ckFKkNVi5G
	a8Dz4nSOhHqLdY8C1/iMBW71P5Zoo85Bb5/mQf7tHK5anRc7weJcZQJG7Qa8Hky2
	nQHd+LvHDGw0bCIdPXf22qmbJ/c23A7B5u/BQjQN69xQh6RUjocQffrZn/KE9GAs
	T3nY6p9CLIbLD/xt4+JcHeTwL3KXHVfWx4+zw36i1Ogp/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug659pvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 18:30:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso110787a91.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785868247; x=1786473047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JfC9ELx4BpTN5CFmL3R6Bb9JryzEWW2TxPGog2BUjdw=;
        b=Z1rmr7kKRtfqEtR2cFmBCL3xYHikxCWJNmFZWvr9gBMUVAAsnFSsPYaVFDcLF/zIPu
         j5noqVbSxCNNRcetGpfoxSXS+E9d64+A5qFDc8EH8I1CFH0JQWWIRE3XG6c2dGwd16is
         kwcPl89RfrWcTds5us/8dCzo1s5bRlQr8oDZhsToFxm/W4vNfKFXnmoaB2SECpgYURAV
         grnp3Ke2ypvro3KsgWxc6o3XoInXM0fb9H+qeEDN9hUF2fPXVBK38ff5oUN+Pmku1N63
         YQqLgTMl4ebrpqPhSxgL3/a2QIGSvZ1IGpacNwl/tCQRQgfC7JnZHSoAOzDGZmkJDdUA
         Pm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868247; x=1786473047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfC9ELx4BpTN5CFmL3R6Bb9JryzEWW2TxPGog2BUjdw=;
        b=dSh42Zu5JiqpCTlxYWft0nEJiNYOtnfVACAMmP1ceEaWx4ef/L4NJA5JlNsRZKc3Bo
         d76e81fmkIEcZ2i+DIVFHf1IN1Bnz4BUPDj5z4T66txKnDPXjx5n5foavg/Sco4jwJLa
         qRoZQKQ8wnkB39hbmUVIbiW3lGcgyj9tc/Af2wNfFfGhj7PigQr7e9kg5/4C3Gw29bwU
         kZIqQcec4OeWvWUwMVyhoWBaGdU5XlLb4d76e0nQKHFD4eq4mBsxRW0PplDo4qVZRU4F
         KuyYWi4kWzPxyjxR7twltXQ2MwTczItPUW/S9WfNPFpMeUkKQxZMWBp3qKBc+3581ZpF
         fRjw==
X-Forwarded-Encrypted: i=1; AHgh+RpeBpgP4BfpwY+I6FWcCGmQFkuplDXS8Q4YWXG7nMyqDmGDHjvFWuUMdioyBZBGGqyvYLiZDdgwt4MO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HBj9ajrjAsg7mD2ATOpM917BJfzvkSxtKTBDqomDH+dLQjpI
	rwI6ti8KQRWDOFabo7ISu6FzlsqIeSWEHh6tnmy9sPEfrtEcLSmdfoxS4PQw0LrXGUKjJOf47zB
	BMa7ZwEwjHbzQMGG+j+ys/nVqh1Uf7m5m8KbPnstN6VRQY1BvZhOt/0xXQ1Zp53Eq
X-Gm-Gg: AR+sD13/K6y98otMMe9rq3vJ/yrAXmDX9hy6W6/RwxL5G4oDf8Srl2GcTC9TDI+Ga4F
	FsZvieJBExJteskDBbEoMf51cDFnAtBFqoJaCrFBmqXUojUXUhZDijc6lefW1HFyuxUuYkbt1k/
	Pbcpc66TEqnyAnxOmYPCcu3ZL62wHX8V5JE50sgbYw0BA/l15IAA8B1bVoJCsDZdYaq/kckMA26
	2w8yYvxxM15ulw2OOKFsxvAFAEqr5MTZm4TMYO3VQxZsKO1aPgwrQunM6QzCKEnIi2F0bwQ0JWz
	yeFrRIz6LxqvBGKWgI5T6mx9kftM73Y9IuVQbMaMvAbEXbfpUl6rV03mxb9lJxM+tPPieBMD52b
	ikQGinx3YbeYgvT+N4XGc9ePaquE=
X-Received: by 2002:a17:90b:4c89:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-3903c5aefe9mr718453a91.15.1785868246352;
        Tue, 04 Aug 2026 11:30:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4c89:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-3903c5aefe9mr718378a91.15.1785868245784;
        Tue, 04 Aug 2026 11:30:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca52d329sm5693013c88.4.2026.08.04.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:30:45 -0700 (PDT)
Date: Wed, 5 Aug 2026 00:00:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Message-ID: <20260804183038.blrgjcslwyzj67qg@hu-mojha-hyd.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
 <anIM8yN-r1wrTErT@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anIM8yN-r1wrTErT@baldur>
X-Proofpoint-ORIG-GUID: UWkdtHGuhB5fsCsRGR4iJVkJ3l5aeX7S
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a722fd7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lxZvx7qKqtVTtBd41IoA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0OSBTYWx0ZWRfX0CRx3H9UU935
 uFPHu5ijdQSMqYo0KwRM2UrhKBT8DWlRza1SntPYpcYr89aFmrItkDEiHtWtQH+cg6N8M0a4iEZ
 qYFMTavwNBZ7EAQJxfNwuvYFnTwmF3k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0OSBTYWx0ZWRfX2y/TL1D/KYB4
 oRsHVNtbe/fZmVBXcp0ZwIzd/xa3Z6NZVc5ZjMinufz1svYb/oECbScHRf4ZRqJ63pMSWl8R0wU
 HLXzLJI7lsSvyu403++X8KE7dW/CTryVFZMYUeymgdyDlUyHWEkrqxKfV1i7goUjB4JcJeupG38
 P6Px2om+VvpGJj79QJrd44s4MEwz7ebvAdtlteJUzYBLxpZCVqIGCCntP1qHw637FZzS0vwjkV1
 QUOuKDG3NysP0qB+ACHvQAWGgIDqZpBAZfHAtOyObqII4/PPl2ME0Dy8L54I6020FZoR4Qt4WjV
 oGlpXH1vgZA/0hGaKrOLah4rtv2/vb/fnxxy81UjyA20A0L7PcbCcXgPySZi89BH2ZJxGA3EK+x
 7FdZCGYLyY+lg8pxhjPqmzoZdiegqMxpQhyLBbUhJRR1P0fMZ86QU8c2QaTtQHg5C4lUpvPz3Uz
 7W6vx53wsvyK2+XZAng==
X-Proofpoint-GUID: UWkdtHGuhB5fsCsRGR4iJVkJ3l5aeX7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040149

On Tue, Aug 04, 2026 at 11:11:29AM -0500, Bjorn Andersson wrote:
> On Mon, Aug 03, 2026 at 11:30:20PM +0530, Mukesh Ojha wrote:
> > SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
> > they share the same set of interrupts, memory regions and power domains.
> > Rather than describing them as standalone compatibles, model them as
> > fallbacks to qcom,sm8650-mpss-pas.
> > 
> 
> This will introduce a dt-validation error in
> arch/arm64/boot/dts/qcom/sdx75.dtsi, which you fix in patch 2.

Right, but it will come at some point if we want to fix this.

> 
> But while the binding says qcom,sdx75-mpss-pas alone isn't a valid
> compatible, we support that in the driver, so we're maintaining
> backwards compatibility with current DT - until someone cleans up the
> driver to match the contract defined by the binding.
> 
> It might be reasonable to accept both of these hiccups, but you need to
> document the upside of it.
>

Thanks.

> 
> But if I read this correctly, it seems I merged qcom,hawi-mpss-pas and
> qcom,maili-mpss-pas prematurely. Based on the commit message in [1] I
> thought they would fall back to sm8650, but this patch says that was
> wrong of me - meaning that [1] should have contained a driver change as
> well. I.e. you didn't test [1], right?

Yes, it was wrong of me. I should have acknowledged Yijie's comments
publicly, saying it along with the sdx75 fix, and I did that internally with
him. I did test it against Hawi, but not for Maili, which is what Yijie
commented to take care of Maili along with Hawi.

> 
> As I said in the reply to Krzysztof, I have dropped [1] again from my
> queue.

Sure, will rebase this series accordingly with some documentation updates
as per your comment on this one.

> 
> [1] https://lore.kernel.org/all/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/
>

-Mukesh
