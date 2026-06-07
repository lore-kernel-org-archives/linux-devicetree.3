Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6A2475E3
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868988; cv=none; b=IjGhk2QDM+mQ1eqooIj5Pj4aGvaM+EdCcDvUa8PnAHBkIf/HhIAIIEVvYamK8eCLveKnWgXm/B7nbFWq07UztmgxMVjROj1Ff5aUid1d33zfkOsZfIqBj5z/AjM9wnDZ/vhKVsum8nV0D+Lu5hU+kIpaJc6Ww+Vd7jgiERt1wSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868988; c=relaxed/simple;
	bh=pXEj32bnaEuxuRPrXJze1vNWEsA8Azc+N3fhn1syoWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuxAZ6Dt4m/jdGbIDtplH7ZpbV3IyiHyzIo0VlnzzvlkrSJ7iDfn3lEensoYzrWDE/fkI97QZEUjiozwxN4VZhdHf9wGewFPMRTAb8z4Mi8lxGwlNiUkhB0jSPV6m2DxTgI2VxqasYjyWmGfVwLfWfUY0lkFc9v0TapPdMLudtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Getk11YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuVaR7Uc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Getk11YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuVaR7Uc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkPmv441919
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DXaTqNY2M+Ko03CtW9NBM5EV
	LlM8nxl7MyFTV+TpHHY=; b=Getk11YKZm/doRTM+2tdazuapP57I6wcDT6SXi+d
	Dh0MTS9id86Zb8GrbXJs4y8Qy9jmq73wGMBP5N/8ikJs3DBWJ0dukV1VIfK2UKBB
	aeJMGqxAxNPvRqEoMDG0Yxb70CUE8/AqGZYrUiBtnZEqy+C1G03VwBncqURUdtf/
	FcrwNgxxwzDkIszVTL+FqMn55C8Qy942MplHzIC1OLOBGN6JNfPex/1YuSvgv47o
	9ahf2E1E/s9NtJALNTBlzJMRISJ6TR+iPQYcdGfYRS82TDaVWigyQwfjN3r56QnH
	fxocFsj54qDWf0cKWxHSmH7gr2sRoAOm5oSildqySyDj2g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1cqxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:49:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so2504307e0c.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868985; x=1781473785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXaTqNY2M+Ko03CtW9NBM5EVLlM8nxl7MyFTV+TpHHY=;
        b=MuVaR7UcvcoxeNgbJ4hVVvmx+//2M4qfQ1GUjQz+JxtgjrKzaFHTL5EFA2AKsVZ/iA
         ojddcZAgdwzyHb2v8Z+DM+fYAqiGzJ6/N6a8uKjUggAVBa/UD4IrFHOknJ9eV4KfQ1i1
         G/1jRzXHtS7A1T8CnxxVEnALX7m8EKX0kkfC+CSBJum0D7VQXelJbFKXpwLtTc6vq/sY
         VssXiNgB6Yu4pu0wvo5OAovS1IIW4yb57ngtf32BIjrrmqkzSR8ldKjHxTufcOJI5n2K
         NvI7iOAv1daSPQZLc57X0wNW/i4mQBJi8qNidzNooYxkWlgXZ+uf2DWf3/0ualuI7LQY
         ijcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868985; x=1781473785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXaTqNY2M+Ko03CtW9NBM5EVLlM8nxl7MyFTV+TpHHY=;
        b=T83kMny4KOYK0rblTuWNwgNuyYY4O/zMu9Qer4Jku7iewCxwjBHb0p3tDfs7uipu+E
         GuVm6l7huzqjGaQC3YVRhYpTNSe0Gn43qQ5PK0scDyqR6M1bS6nXq5D2zbY5VqhAcfkC
         KfyxbAvBrPkc8kBuuzQKl8Q0lKSkdojIpuByjbCAEBQRSEYKj1vcaHcYtFm2P+X0HrNn
         eTT4VO6lquNFCC8fM4NlFHuirFUA8WnY9Uo052jV5X9iEAB/NTrpMdTNNKUMaepna6/E
         TU2kGN2B8YxTOwwrT5fabZZOBwOdx51yOvnw+Xfo9fKPZVY7RpddME579KVXpr6ZTBPS
         cEiQ==
X-Forwarded-Encrypted: i=1; AFNElJ92W06fFGcsy6+WVe2GxnqrEwdUKR1jMxGEHTPLsyTtwRAO5Cj2WTEe3W05iuMuJ6gb/tqvui5UyvP5@vger.kernel.org
X-Gm-Message-State: AOJu0YyhAAw/PRa2RqaicXJ6EfShfNNpAzEkrKmEbZD3m28VbrNlOXMv
	jBnvhYJzLXpszHsG+4f3xhFAN1XO+hA83QVFNlb6EzCm7uRVu54YNfmLez+WuL4ZWunYEa0DfkW
	4P5Ry9stYeP6e4IDvg2Xw7fzf1MPY95KUTTCQc0rSTDeHZV2MbmEjENPl9hvKdaPkFPo59RXe
X-Gm-Gg: Acq92OFRtPihJnvm9ObHiQ/xCtnQ3pLLiAl4LhMFvL/2XzWxAiEXZmjJZ8MqBo7ZMBn
	nsQhKXH3qY7pu2L87Y/2EDI2zo+vZKeJqAYv/t3NwiqTg+BdJTqlFxkVk7UIrqnUBMvRbWxp4wb
	mJldiHw6JtD+KOjwfEVXywDXSQ4gpiy/3QoouIPnnsOFJ1/48l6ASGxRwynNVvrcZRdPRXuEemK
	SrrHMUZWkqDsTMHybafPKdtzAKkPeDHeVLTRjdvmebYnyMZtjB5HU6p2ZYA7ekeh9jjjuOhAslT
	F9BfYj3mDyl8YKiz36L+nd08KE6hLv5as+NtO4PwXGZmTMbKZKX3h+R9j7gQ2/qyw06J2hfy4oL
	nk4Kvu3esVEG4TMNqHwSxmbMAhrhdaow/HsC/Mxv48GTS352SMYQ2oL4pkmrCPQQ0/MjkpUylfD
	5C27AieFm+vXXa6lDptSBKbOWflqS4y8N5YABnYiQ27OTUsA==
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr5781908137.3.1780868985421;
        Sun, 07 Jun 2026 14:49:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr5781894137.3.1780868984978;
        Sun, 07 Jun 2026 14:49:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed8f6sm3317851e87.6.2026.06.07.14.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:49:43 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, robh@kernel.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 09/12] media: iris: Add support to select core for
 dual core platforms
Message-ID: <n3sltwjzpp4cl5b53w7sfxvdrsnjus7vmydqzyfa5d7rao2sro@72ac4cxxydoz>
References: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
 <20260603144434.928EF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603144434.928EF1F00898@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX1W1zII0dQFsO
 5UibG7T4dm4jwvwLeImCHcuvFLEb3O3j19Yg2imMydxjVvCl3LP/wFjl5m508nqCVCqWAvxuojB
 OnsdDj2/GHBnVp95rwuuu1E3Iby+iWAqKopZM9DxdAGtYcZ8cmYMzKogF7c2CBujTjjCd6wMXUr
 zFNFZvboNGP/HzTjzJhFDd1AaXNvYbGvVmXZdlsHIlh7/uMjU+S8HoIJ+/dmptbYV3BqVWTGZ8V
 LtmQT2UuDaqjH84htPM7dsLe5GRcc3xT+Q9tE27R74TBtM95PsdgmnfwlPKhhOeMz0ddrINqCfQ
 mhzEOPgKg0Rccia/fDDnQh9rIaNq0xoN2ttBNo2GgxQ3WYWz70Q7rsCxNmJwxm2t325fOx8p3YQ
 Hl2FAHKidf9zxt17Qlv6Tya2qLLrV6J/uqxLNIMx3DyqWGxXPQ3qtGssehhlj1dLT6VOG4/RIc6
 NvbJUN9464JDgLtyMGg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25e77a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9tgJAH-OFjpxVSOFymEA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 7tHgwEADbw_BK2DfnnsksPtepOPnhBM-
X-Proofpoint-GUID: 7tHgwEADbw_BK2DfnnsksPtepOPnhBM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219

On Wed, Jun 03, 2026 at 02:44:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dynamic core assignment logic mutates `inst->core_id` during streaming without firmware notification and without holding `inst->lock`.
> - [Medium] Initial core assignment bypasses MBPS constraints.
> --

Vishnu, I'd expect at least some reaction to the reviews. It doesn't
matter if it was performed by the person or by the AI.

> 
> commit 2b81abf719d22ec30cd3764b2bba16be2af15168
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> media: iris: Add support to select core for dual core platforms
> 
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> 

-- 
With best wishes
Dmitry
