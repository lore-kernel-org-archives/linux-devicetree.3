Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407344;
	b=F50EQduLy8N+atK/y69tARbWol63Ur+NbnaWl+fGMvXChGPXNkHuWMViWPBPRorMAi5m
	 dSv3Q1hT5IpznvTWqXnSgCKAwqa3zB1tzue3EYblcxzg2KRJSe3hT6b2AhCpld6HGpBDG
	 paA/LcwYdi4UMILgWaD63OMH8PGcMA0Ptaeb+108zobtGhe/9tK5gldFcofw0hSjAXKC+
	 wjK6tWxZvEHHAOhLEwFxPpFxxwzYbW4xRL4qo9Ya3ZtBXCHD9XV61kq4H3+i/tZC8TuA7
	 C1snryiX/jopAR4zO4qw9E7niLjGhjMshZtz4PTmuZAGJ4054Ko5m2en4LiNGmfC0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
	b=jsvcNAF13dvS7M8dZy+1piZdHvYBtkWp+lnF4XiOcLGvqHtyMxcIk/MR70YO+simW1DH
	 jqqLH+GejkmfNFJJJvprlRaK86h2cjJjYSK2mhRo8ek70XJub3Dfo1UzuH4glqMlyFyu4
	 Kn1hP5iLu/YqFnab4nflLH7vsHjtf8lEcBrXvEDIBOTSxIrixKAqJaKe30o+gplfeaopI
	 KJ1+c5/JOCO/qe26rI5XamLOHuNX+oFYVMMuThDu9fyf2j/EdZMf74s1ZWnCljwamHUZP
	 k2AwhONWKChbh1ladKBEFAmdQ8gBMKz2YDQ7pJ3S8kay0bXZ+oNl/+g8ox6bojj3vVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8485606A32D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8485606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJESt2223704
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FvLCFQbdJHdvS8TiMxoEDBC0
	gskgFKfqHEXYuNhy+a0=; b=JhrY4cSQYGOtqDcNJaKvvgLzaupKE1Ku3eDcqwyX
	QDHO1k0bvbgSW/KCwm/VFAc0rVHSknHxz36AL9C0b/BVHI7rPYMG1xi/XXGyGGXT
	PrfN2GlbXn6avqLd70EZi+lIlPlJH/3Fe1iplD+ubpTojdFgCluVGK20X6FIehYg
	GM76rfGBAk1oVVMVzlxUjBiOlRJyvhRd2GvUhw+MaJewvJQpIZK2IUF0G8+CediS
	h3rmQyhiPo63i0sCVwJlnKKIYY8TUo0Jque6Ys584O3MMvhhVpOrGoMtCSeBgpyB
	3cawDBTf/NEhweoavDi5an2wzlyvoOPwLoeASltoopFzFw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh32a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:29:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98a829c43f3so678467241.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407342; x=1795012142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=gYfYXp9OD7PM7oOU70POvyJhUdKhV7sHsZhU5aF2+qVWuiXwcMer4xyFEJTa/saBfL
         xd9QMrKc4X2rF6NFNxR9e50+Jh+dMXKMJQdCjRpRvbwtBvDhYHM3RCfaGZqYC3UXjCOR
         KFKZQaYtREBPRj2PRfqu1UcLa59rNA2izJ6poxC7c1WYiAtD+KRbDNtkEV1htHtcetRu
         LMdCe5C1e8uez0s8FlfrZW/CaSPA4C+I2/owbLLmqbQ9eXA3RDajw1ygWVBkZDDWDg7W
         HnOksA9Vyr0ix5MWUmPyokSBxc8bat7IQ3xwvciYNJqtBhfAGFVONNBQ+Ly1Lq3Vt6eK
         Q8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407342; x=1795012142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=jMx3D/KcEV11qurI/UjUSuExVLv/ROxpT8MtxklM2g3zMdxDGiIoCvn+T2k1/PTYgC
         JycdZTTPKJIA10li0+k/km2rUoMAgoP5wO75Ypt7UZsrMIPpo59BZYqB2TmV2hwPVqcX
         K9swacvDTjLhK5eZ9MWpHoEFxRrlJBUsV4rq4MF6b2OnblDObot4EtoYx/FB+zCjnLCP
         E+BlDlV4R1WWjuwP/++TwlpYuIb1LBb4iGfZ5eknXDFlnAvA9dKeUjj50fPVJvYstJG5
         561no+SdpXMjjgGMJaBhdYzexP+EZubVAE6gqYb86exszlobFoSGKecxl6KF1DD2R/ow
         +Fmg==
X-Forwarded-Encrypted: i=1; AL+hErEJI8DdswomhRoEw2AiDjuFOkTL1oux6Bo5T9I9wGqBO1nES2GYFGq5Mn9s0cmF522rKb9USCPcBOUP@vger.kernel.org
X-Gm-Message-State: APuU4Z/ryybf2W1LSLOZJJjtJxNJhm90hEVXC56xxiw802DiRpLHkPMl
	BybWcbewBJRphlw0AAlUpQiOXCIQA8etrvXesnYsp7ectUKDT1B+TjIcOT44bMOT7CFOotIeovs
	2b9eXoZZyAny2cGKORJNnB4nYioJA9jyDTxdJIj22XGzshBMMkrMFga7xOpPwU/Tr
X-Gm-Gg: AYBFou2zP4XJHAnKvgaFEPVsHvLn3kiMWGP0GAMNTC24QphaPaAhX42MC6pgEtScjrL
	Elh9xJwsyx0q7AIvIC02Z3jysBLyimHuYhyODJpC2pGN5mO5P4q+3tg/fD6XMFeRuN0wOUkpetD
	JlasH0Fsv0AO0P4FSUXvPOd1wuP0UaopvPO2luSFJhULsgqgs5q98aZRiru0roymTLukfiorUqE
	kYUSmgW0zJh2ny6RWfT5JAmELQ6l59ge5mLBWMpimYk+z/LxXi/v9fJHoHxh9coP5tLPKQJktfy
	Qze45KVDXz8d0JTbuvpAEu3TpK37wffwCvA+tkwQHiAh+hsbzxfvBvsix4Jt9+O/3k3t7R+G/N/
	11S17aWobIzzCWz6DyFobCXAPWJraFZcS6kyue5cztQhgvm5Vsz0DXPuANYQEdY1A
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784592137.19.1794407341954;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784569137.19.1794407341298;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm12553846f8f.42.2026.11.11.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:29:00 -0800 (PST)
Date: Wed, 11 Nov 2026 16:28:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock support
Message-ID: <25wbcmrhttoceflek62nu3e53xzb2jnaamawpyd4skiwnmmpjb@252s6ee2f5ol>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
 <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX/4cJiCbRQgJb
 UIMm6vZPkAaqnpmPY6EVGPSZa3UKmPxAlbsFfVQVeL6YL30eMIlDtHThVshCrEpqJRNVO7jPgLZ
 j1kAdLOWOd8eyRH0Vwo3hmTXyqJYTWM=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af47bae cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OnpAFzfR-JcWsVFUPsAA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: CEuF9DwVWCE6h17Vnwzbqr4oGmvfFQPI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXxh03ZGRMQ0cg
 bvleTiIruxLPIJUx/74Z1KkD6uKyfLxwmtBi7LzwKOiI0IRay3/Lfl2aSRL9Akp36UbdNREzmut
 t2x/WF8NRxOGm/eaWR6lTY0ZKw+/3itjMQStCCb2vyzg+EcbOFQdWgILd4JL7naa7GX3uxWXHaF
 2+0k/T8lLcENBvJb+sDih/cEyRuImH8poPPzDH6OofENfZDRsrNNTnqtMZV1CwimhAJYMlw66M1
 fLXRWkh4k3cbQkMFxFbyYCUu+Ad7Nxwy9XyH6xh1x7eOK7n6OZdJxnLzisQk5pMRRYeZXmJzpYO
 ytJWyt2uw7Jxr4n7lZUq4N1tl/qaxP5YtgcFSNE9OwxWw82Z3BkAFrWptCegW/uWQJSxfp1oyqy
 CvDO3P+8NL7dd9QN+GhpNXmsDLL1mh+HWYpaF0b1fHJZz9Otrc9wI7jsrmC8HFBZWCTPqNXhT+K
 g8GwKNy/Ddr6mJsvB6g==
X-Proofpoint-ORIG-GUID: CEuF9DwVWCE6h17Vnwzbqr4oGmvfFQPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110056

On 26-11-07 23:36:37, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
