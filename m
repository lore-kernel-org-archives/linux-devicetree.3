Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60D3BD63D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008793; cv=none; b=CiQOuKDUWTp4OZ3UmTUBoZYWIKsLgTJvLSnUj70vvf/9SipgFbce5TQ17MkhSaLQvGT83vDzZzuUvtPtpspbkV+v7JYGS7X/ONT1JmbxK40sYbFOWvN6rYdgDZjm6yXrHzrgum9mRv3veUVDCgM0aglGrFU8RJjOtEkkXoy8VMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008793; c=relaxed/simple;
	bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDvS4LDBIQSgmVbtMSdUbZsqggGJn3JyRKWDAsX8bwInEXAnK6TaAT6zOSuc7KryuPwDkei2tD79qSIg7JFwqUnBskY2oMoXKpL37YaAIkPGNI0+h6vQ/l8M15XcGyELnd+0yFI9Z71n/pAUGQJh+V6vXShOhaVhSG65rB053BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXPJ/Tp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3EbI5LI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXPJ/Tp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3EbI5LI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E37sjc3276599
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HkumCUVbEM+FuIoAvK4ol7ds
	lBReB0TDdKD9LW/ntog=; b=oXPJ/Tp6/ShKP6DS62y1kTOGHUouVgAVjVGD5hn4
	9g03HuRAI6hfN8orHUmyR0/c1rI2FB5c47KqTa+FFgsdaqgqZ6yWOd2hpNUJEPgL
	okz4XnbsJlzS/SOLui5Gs0cfXwUMkdu4mfbJBrH9G3UGvyq2896EnqeZ9KixhAIa
	+jOGDMUUTsLqw7b6e6ijxJZA5CqwXSYXA0MAToK8Y/ortUy+XxlZKuVBGU3xwADT
	4ddTeQ07Nb4wvZY6ufkfe8ZIG8APD7xzR8kEopPEeJu+LIVkzSMKI24pF1OjsGgq
	cAHEItiZ3DjB0+eG5m9oOiyFvZgIa/INTc0slxAhFzms9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvhe29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e095fd889so1251076a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784008791; x=1784613591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
        b=Q3EbI5LI5VuUerzTNQrrnuUFmiyPDnyPFFQ7oPMqEADtReowueI3mqM2o/6/9S9xAU
         sa1O0h8KS6hyp1i40um1/BZ22MTcP3zf1JYMP7uaTi4kEj/u2Z1Y2oLnF9nJYEenT6dP
         ANqgPXZthmZsLPYrzEBdVayLnw8GAqopfDWvFTORTyuv0h95yGfhKFicsFem/mHJCB7R
         FLH1DL4ZZJfUDkWzfLe7WFTTg9fBp0471BzYTfVJhdir7VHrQWgeQYXnFgtGbmMRo32+
         exapHfrTKl+jH4fe3hu4B4KWpZzfGDYYGheyPwx9TQzGro8uB8JdkG/aYAqKphaHUcZ5
         Y0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008791; x=1784613591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
        b=en5Tcx8Uvcrag1OwAx8LQy/FQWz+3u+UaEcppIOpbT9TIQIi9Wddy7ycGklv6Y8GDT
         nSO2IXVCn2kPGUJSo6kUMxKvakmmjcemEukn6HQ4twg2/od+XuI5o1y0Sbw7iS9vcQAp
         wWp874Lz4NMJkNk7ClG2+7wPv7kTmBr4pSKjzfKL/J/KyWe+ehKrR24AaX2DvW/HrABW
         azK+I2Vb1ZmrZk9jHJx9KBZvoOZ8n4w5mn7BH6RyYV/Nk2ayCIStpBimuqdJL2PgvttH
         8NTmTRzSpF65wo28/G+7q85zZ6Kc3vhaDOMRRPo0vl3J3fLB0GPufvXyLaJbhrKmzuqR
         y1Fw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6fvWiUDXKZld3PIV+tgF+Wr8uOoPnZMyKEcqHOXLH5NsxF0pKQr8b7jRDEoT/LOk+5Hq7XPCfNtPk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpdm4XqiuaIx2caACojV69vhVgMEj21bYfvW+i9Uwe3Ed7KzpV
	q6971XdWDhqz9W0qYGjQt5GySYT/etp8uW9seSmKy60byUfTg5YVCrBZSdTqb4jBzq4RHKzTB7I
	kHxWemTC/1xrRnQtritDYfGmDiNDNn+hSyLee8HAt1wu4cQTuwQKV+SNpMnB+Zcpj
X-Gm-Gg: AfdE7cldf2aa9i87dTA0Q8mNRBHvoAzphzUU6OyZrqMxG9pcskBw+0+sJapTryxx+fL
	kQLgNK8LbeOqU3ZixoZj1WrGU8oiCkGT8V53HfblgUB791BvSeJR4f0quCUexGn94USxKSDEwMB
	V5+SuvpibNcLzSfb3h2WU+q1RSL2FKDMTfs0dsStdRXaZnol/O4HZg74osL69wX4QP5Gq9+lCN2
	tcnMKk+YLXWKECRDe1Fzj+TgJv+YjAj6qU9AI78wTOwZD5+ngEfSdKHHNGwuFf3EMKiqJ0dJt+P
	q2u+/lY2+xthBmtkcWKmY1cHeFVVgw/daJypEO6owqrqMkfv82SL+EPigkPv6UyMWkGF9nGrlqb
	gKArEQtlVlaz4aa5rfzdxvWZNdhToZ1lziz356M7WmqcTPYzEBM8Y1GuMhsfPGYID6/e81ZsUsZ
	fvwchBnJlOKJ2xZBRHdAXSQVKvrHzfvaccIAOA+Poe
X-Received: by 2002:a17:90b:180d:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e120de0a5mr3507992a91.25.1784008790660;
        Mon, 13 Jul 2026 22:59:50 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e120de0a5mr3507957a91.25.1784008790175;
        Mon, 13 Jul 2026 22:59:50 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm42435539eec.15.2026.07.13.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:59:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:29:42 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Message-ID: <alXQTswtedKG8FOR@hu-varada-blr.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
 <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
 <alAEKQzBXqjESAbo@baldur>
 <alSIffOraVCzfboW@hu-varada-blr.qualcomm.com>
 <2ddadbc0-0d67-4b1d-bb49-87c08172b442@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ddadbc0-0d67-4b1d-bb49-87c08172b442@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX0C8g6qTqeSzk
 6yR8r+TG1zQeaCJeLLUl0ychrPADTvIDILXpCFnNR6KUPfU7dUgwhcakpWnWtmWeVe9zuMdp0XE
 eJSVqJkVPAprPJKsggkZ7ENuqjLj3OBgRPk7oKoBdLyIcbOFJoKKIrHSrNog7Kc/xZVC4iYg2g7
 wOzP/Jo2cS4nAC5hu64mJfhodpIyuBOY3G8FZnH+rkNaqFX3AWECKyhwO7UluaiQTd36czFSa+q
 C7b/kqGy88Tkm+WDiXO/qCwtlYvVq9i4RYWiJYF0/bm3Hpv8/qUBArrh0sOsRhpCTPVFoPLjgHR
 llAyhBZ9hIPESpMEuiks4JWipruntN2ECiZKDEVZ3npc33jvnhMA6GZAt7SKgXSz+nf5t6IwSoC
 5ZzuvA3hGzxMGR//pXhULacapJ0cXBnhhEi7rZ36Txertsi0d/bMJiMd3rmgSNOypQDzoaYSZyH
 De6bXcL1/EFVjcIapEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfXwAsSn3fCRLOI
 40I7GWKNexqYF3xU5LppkMvVDS/HdZS++8bhLGhZmRkIi2Yvs6w9hGiRIsmFr2kHvoV8SbhcW4F
 yjntAWPEgiLMbUTErF5doycrufRtxr0=
X-Proofpoint-GUID: lNPAtEmJdmbxGge-R5yUMcDEuQV8hMCz
X-Proofpoint-ORIG-GUID: lNPAtEmJdmbxGge-R5yUMcDEuQV8hMCz
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a55d057 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LGtRe-3Fl8CQACRa6QgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140060

On Mon, Jul 13, 2026 at 09:57:16AM +0200, Krzysztof Kozlowski wrote:
> On 13/07/2026 08:41, Varadarajan Narayanan wrote:
> > On Thu, Jul 09, 2026 at 03:31:15PM -0500, Bjorn Andersson wrote:
> >> On Thu, Jul 09, 2026 at 11:25:17AM +0530, Vignesh Viswanathan wrote:
> >>> Hi Bjorn,
> >>>
> >>> Could you please help review and pick this series if it looks okay to you.
> >>>
> >>
> >> Sorry for not keeping up with this corner of my inbox.
> >>
> >> Series looks good, please rebase on the PAS changes that should show up
> >> in the next linux-next.
> >
> > Have posted v13 - https://lore.kernel.org/linux-arm-msm/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com/.
> > Please review.
>
> And v13 caries fake test tag and FAILS the test actually. What does such
> test tag mean if it was not actually tested?

v13 was tested to ensure the rproc functionality is working. Missed the
dt-bindings check as that file hadn't changed. In future will check
bindings for every post.

Thanks
Varada

