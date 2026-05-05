Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF148B388
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999152; cv=none; b=hJXVM35BudU9bwyaz2mtt1SSXe9Q+qR/Tmt2JM3/kaUkDz/m4egD5PvUiDLIujIVD5TnTe8VBikRJ3J6YSbsg8qGpXAhCyzQLqqdTNtdkAT+JqOpUvybeiT6HugxLmHu3AX0mg9q/ja2GEDVD/CNdx7DaiDz1UvcY9YKGpAnoLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999152; c=relaxed/simple;
	bh=xyEx4G2wKir++EItxT2osj5+hfVEdh42Mr6R7Zl3tOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6y5ST/JzdhYYXgDHObiNHXz88xhTRLFhgSsF/xpx4sM7meKrUFeVbjxJikud9xo8lhBZmZ4qtEepUdoxv6fDMDTOcC8XJXm12ZpKKFPOF1S3TzXpcLq8Iwuz04sBrL4h9qO2dwlC7acafr/I1Ac0Od3bEDl5erhiv7iFW7lpCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+F8y2Fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuMFEPFL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+F8y2Fs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuMFEPFL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645EJx77912015
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 16:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcvBYxHAlvNI6sLP0AoxikyR
	e9LehpKzs6txgD8Qv9A=; b=M+F8y2Fs4/hg36XqYjUZ2aG/CZNEeOdd7UKhLo9j
	8Y0UqL088LknMkhUQRRyzARuoO+oNdGh9YxrOOAxY/U7s1HsLB3jq8q8b572Tqb5
	2J2XraWuZBz9LdfA9uEUNIDzVwbtTmdX/TNaSRaMM6PHAW6gsR0T2etdCqgyjR9W
	OtKYqNDll3aDE4gWGrusBKXkSTVYtXtVbLt7Z4gD7cN8n6QH/CpYQCimZn7DQWrF
	m3GQg+lAgKMKOaKN63Lthabq8F8NRozdfQsqR4fdsT1/DalMjesfDByXRSWYZ8Ws
	d0ZxdzHiQipQdq+w9AFeL3epabsWRpQeHSAmWpEXG/tBww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jgkrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 16:39:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso93836025ad.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999148; x=1778603948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=VuMFEPFLEnWQfKlZNxTOy21MJ4cTuCEYI+jFFeGNEuyLcV61JFa2+/bg5tns4qzngr
         +V438+52M4/+U12YdSyhzaytn22IZ3Ca5TNE089SIsSAMs4YicVY1RGxrW5ki5xmbdMZ
         P5BHwB+e3rXSdElDvbIYTJtmC5ixF6zRKor+UYDFWgBRY951cUmuDXnSEAGHZbdNVOSk
         y0fOQY39aHi3gpRKiC0JWq271Ps1eER2XrDly2dZ60B79naNbPkMJ0QdOndwIY4I8CjS
         EDA2SliByOW6fQpnoY6tBsUSjmS1kSa+xcu9JPyrpzsG0QCWT/modDBSGCppXq2yKveV
         S1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999148; x=1778603948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=Dk4jr1iGFB607B07xzaw8VOLgX9qAqB5poYnqnE7t43p6H1EcHLZt9OzaDuf9jg2TC
         MBZFqiux6oyhyR9Es3m2y2uxA2b4TPac40YAgUgKB8YJlYUAwO56vs1OttEzldRHv7yA
         CscxaRBQp/n54GfwOJOjjIBdGJ1e5+MRd4lHdkF0/8H9fGmOjThTA3GzLBXtXREu3DV4
         VZe8BmVEBuOzc1NkxUFUYo/K0bK8tVa4zgMtTI9sjvrqclZGZQEG+K/xCmoH99aOMcrr
         4JnbhLJms1mJjIQtwZdJligjc7v2x4AqPUEyXo7R3uAG9tyX0nxSyOLePyHoc+LONS7J
         i//A==
X-Forwarded-Encrypted: i=1; AFNElJ9l/PepFv1UPRQNYBh2i2wQ4Bb+/Pgy33isDVU8QheaiTo6CRacCjUgoNgACpRHGZFG5BvhIdBeEsEP@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxjPKDDZpOzmh1s59xcP88lHL6olEps+6xnYsMska4r2vXTkC
	dhrySVWYbCVC/YzZVfs2lshHWYwieupS79XlDqhKeNNm4bnEc7ZS/yXQRPOCTmIzEbp4fR5ppOG
	sdhFubdK/r5KgVHm8HuxxbWXXiupF/ohA21qCPXcywW0TMKp6i2qskTd8pW9VIlxy
X-Gm-Gg: AeBDiesNbxX5hmenG35hnz3wp7Yu7IPnhHM5BuO/UqBVc2zeOrV3HLElF6Pr6QEedOg
	ctvM+59aocU+2Wpwfoeq3+sMSWCU3WLnezDte1LE0NEZ0V+UZSR4FOBg0Czf6pxBqqWqCTiRg8J
	HSXBFW5MRE6EP2NJ855bnmMWsHBKCtYMjYmsiUybZceq9d/7fuxkM6AhQPUuRLF0BBKxsWP/WSt
	iXu/t3Dk6rTvzKGK6VA5fok3krKrwPw5wGS4CBHWrCfMwrINTo86BXtFMkuPjMCv8AREgdHrCTS
	xWQDZ7g9oYZSmBOBKPbL+GWFCdhe24Ip99NNl5zEZhIzOzYpmfj5GdJX3sEZhlZuke5a4ANmgiL
	s916YguaZXfRXBzFAW1iBJyqvbJVpvVn7wRS+EaDjgM1vug==
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149463405ad.38.1777999147947;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149462845ad.38.1777999147261;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae15fb6sm148392135ad.43.2026.05.05.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:39:06 -0700 (PDT)
Date: Tue, 5 May 2026 22:08:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <afodG9uuopgfvSmu@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfXy/eEDgZB9uyF
 Uxt5AFTDFesZt1xuaYcxPT9ld3VGWKvd+q7KeG7OZ2GJ5I11SLhAVBZodmff2xx3wpRMi8QGGP4
 pVCUJKz5miqfEpTUiSaovOeVym/Egjqv0yxUP0/K9v5rGz/E7kqJjhGwL5pe46gU3I92HnWFgz3
 LbH+j3WYT3GlfQlPoSoaH4iUKMaR7FSsgjxxNJr1riOfcoggpN08B7R2nlM8rGJ4Epa0VG3fBJD
 UeW8HkyAfB9H3OdiJMtLwSMEV0VoZe5rk5IdgPnGP6tEvt/2p0TrOjjev8GZHHwqNRB0sBnlD0m
 Febbb4fsmaHom+tVUXWavdTm2MSEkFFzDFRPl1COqsdjI3XSKLLMXnRePzSmSPkCTMTvak++UF9
 8o3K49rYrRNoYd/9vfRQYL9JdgJBzDFKE0gJXzH1KJyJxHVXxYuUeDs1zQBGHz5DWJkKfSq6kMH
 nFDV8kibZiTVfqJKUhQ==
X-Proofpoint-GUID: cSOEodZowtNh34FF2ul7fqsNzoZCjCBy
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fa1d2c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=YOnX06L-6IeA1UCcW-kA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: cSOEodZowtNh34FF2ul7fqsNzoZCjCBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050160

Hi Alex,
On Fri, May 01, 2026 at 10:54:18AM -0500, Alex Elder wrote:

> +	/*
> +	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.

Minor typo in the comment: I think you meant TC956X instead of TX956X?

> +
> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
> +		if (!res->tx_irq[i])

Typo: res->rx_irq instead of res->tx_irq.

PS: I was able to successfully test this series out on a Rb3Gen2 board.

	Ayaan
