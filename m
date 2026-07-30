Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0269830DEB2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419878; cv=none; b=GyO2qPWmGXbY7Htfjq1noN0HKVr7zZo4ENvesIkOo1RE8DkZr0w5DPFdiBbq6RtUc6hlCPFcsSUVoJZEIFXHvT1Tku3GuCGMzeShlAdStwjIJYYmYTiR3t6z51TwOG+8FMVzRZGnbqs35B3WfmGTTEmy+252e/IVUM5XryXU+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419878; c=relaxed/simple;
	bh=aREbhOlhPVBm0N5/4bSzgK7Z2Ax04Y0zz5z4A7umLTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiESrPEB9oeLhqTP7+cJ2gxIFqGxy4gEn6LIY5Xdow1QuC9Mumc9D/1VwG9MSlaK0mR2AShyLAF+H9HiuplOHlAojMm9UPVe7FDtB/6lBpa6II7V56IUyek4ssSuM1Cr6SWLnXPrGBM68zOnFUoKrhcSHIgf2Vk0n7mj3k6ZYF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGdyxPKW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/SLZiwy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGdyxPKW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/SLZiwy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDtfaM1201874
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4yFe8QN+8MstiUGC8myKv6BZ+huJMrxfxviZINKBXc=; b=LGdyxPKWkVC7pnox
	9Vyx488FBcMARnaDuHTGVeh0RL/DGjBJCy7q8/3cwkkKUP+GqEbFfU1oU6VzTVRA
	RlvaCRdhAlhMLILupJg9xepYNqthq6F8Mn0ZpOMvMFwziuEMzqbpBy7IygskChrK
	4nCpiNfEwfe/Y/8McMMayZgGQ+Wp0H/W1lK1LkdzZfa3EocLPuUnOtuq0ai57s6E
	emu2TM99YvEeSugfI6sD3B0L14vKxrNNngB+ux2nQ1RqnDnYPmBtQp8NMcR445Wv
	/X6c1SpZkD9FA7othk2oexSl9ci7Gn2TTDEyUTY2VOuuz59bhIQRYzmgOO1nK4ll
	mz9dYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7x6809p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:57:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so10254511cf.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785419872; x=1786024672; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4yFe8QN+8MstiUGC8myKv6BZ+huJMrxfxviZINKBXc=;
        b=P/SLZiwy66BCY+eSXmFl+MtbAL4CI01+f5rfCZ4sr+oLyHJd/g14430xhCaUuAV/gv
         Q/tEF8Z2TpfLlEAMXZIXLhrGU6YZwmxqVk3XbUKKhFP/u4q8Z7pSlPrvTY8PyLePA4K1
         sDofj9n9RCy7KbCVHbSv8OVicDup8nFMaGguCtf1Sgp4zR5G1ve8AYpbX/zC6VQt6d5f
         7BM8HOowf+LqbSqtDZ1HIBnrLtTr/V/8jm+wgcaJNxa9TeQI6j4RuPaClKPCDMQdZnjm
         IgyNsUHSkwpFE0dxdXujU59dSij1TL8xuUttq4qgOoAyt9XKbTYa1i5Q3eowFrg7RR3S
         tvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419872; x=1786024672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c4yFe8QN+8MstiUGC8myKv6BZ+huJMrxfxviZINKBXc=;
        b=Q891mutXntBXsNYMbU8awWQicDsma0ylduIuqWzeehAvgpp2921jnWa53Da6ur1BZD
         6Khj5HeB+pIiRY7rWNgzAWByOWvvuDnu/s/zA190tKrngkSjtsgRuxkZ+fu2mEQXOJ0x
         7q8K+AzaK7W/nx1zm9NTXEaZLeT4ZSwSgi0pHpDhhYmzQiykZi6LbKBwVp27e1mFhN4l
         ncg0r5H1xWjaVROJ0JTziOP3Uo91SxKnggHg9+UV7C0EGkSoZgGRBUfFTIx1S0YcRmRH
         Z9A2/5jyzzFEibF0GKKKAlA+Aan4+lx9RnfMPQ7ztzWaVKGYQqazA5IqbQvRyKt8Dg7m
         7oNg==
X-Forwarded-Encrypted: i=1; AHgh+RpvVDs6zhkVlJYkej1SmOy9LSN0/yChdXYvvwxFHek6I3rvRPL6XfP8kX/oj2piLaantf3WVTUZK5sy@vger.kernel.org
X-Gm-Message-State: AOJu0YwNa8QetTCviF/mQikiEO1h5V76XuGyF/KFFntioL9P0ebN++Rv
	YkLRb8cWpOI759xyu4DM1gLO78Cw44GYGCAO6ahW63EBtDJEAY/O0X1mXIpjrJ3u7oYfpSx0WIV
	d+mkHpXCJ2+/3aeHssF6ICA6y52rhz4nbqK98f3CMmolTRW+r42R85h/AdyKQnrru4NMHr9uWBX
	E=
X-Gm-Gg: AR+sD10G+PuyISwLw/dOGSexswywT3XTjgjuFP2mF8ZJY2sYWBGboWe115A4C9+RviA
	ihAm/PL3m9XZMEQdvn2hreu0oqy4jJxqzvRaa0z7W6AI/jHTxL5L4YCbtPbcIsVSJlHTogqe9aS
	3Qf+cb1QAQ2JJETj4QZ1ocm6deFSunZKaDfIqpP3ptrj1mjwt0DshIjlGv0psqS5H7ir7B8Cv1f
	oYZe2wQeElp1T1oCWDj6MoDvg4ZeLPWSSmMHcqPeWDDHb54E58HYdzOLHUF4VVPOhKyB1vke8uj
	+SCLgVRcZYTHO2v+JlHa0bwTnQ9FyZrbURKMWI4yXl3XNGWRHJyrNL4WEzEMV903KSQDAWW/oZp
	eO5NStJv4Xovt797+lSDBzbHPVwNeepC2hSqWCxDQ1y3jupz3RAEO4AVWhHN+oUwagpJG+ttivH
	aM+gTapJ4PzCKK3g==
X-Received: by 2002:a05:622a:2611:b0:527:6d0b:a632 with SMTP id d75a77b69052e-52b425c7d8bmr4910401cf.27.1785419871560;
        Thu, 30 Jul 2026 06:57:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:527:6d0b:a632 with SMTP id d75a77b69052e-52b425c7d8bmr4910011cf.27.1785419870960;
        Thu, 30 Jul 2026 06:57:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6a4cdefasm3553271fa.0.2026.07.30.06.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:57:48 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:57:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: me@dawidwrobel.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jianhua Lu <lujianhua000@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: correct the board
 ID
Message-ID: <xmt3a5242bmkrlwv5hjz5i5x5a7kpqtlyzdr6xzcsg5jw35ljt@sjngnczfzss3>
References: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com>
X-Proofpoint-GUID: 5l0KvrVNDWCviwGXydv4GHV05gINIw73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNSBTYWx0ZWRfXyXC3JUoAlZet
 9gEtgT1JSZCLo2qHO4//MlweLadtZ+/bxd6+vO/Mg3vdwFo4Zn4/ADLg0HioNngMrPxj1S+on0l
 C5Ysw6GqWIu874/VIPoivuaWjcc4cOIo2jyOKUAdTlNHRYQ4d1q3R9bdQZzIPW+j5aeMeNZPNkW
 SCq8buJguqFv2BGeXaE2522MSIV5BK+PetX9bCwM6KEN18VBgKqAZ7uNkkIPd5xK0SUOjQ6L67z
 7hFzfGX+WFi8jB5QTRris1UXIQs8JzmYrBh/vfUnluVs4/ddRme7rPAt91COjaeVIu2ZqaVUiaC
 wEJV4IdoORT3bMl5jUUFwxY7PBK/evRSKpHrtOR/k3ULFqbkruyd+/Mn3HxEPINVBxGi3na26PD
 7CcHMUO3jiAsRGQO1ijO3bdBFunxyU2E4PHOGTb8XGFk9rQX84GqAPMISXTGso2ia75kdDXODTH
 QRCkYcrc6ql0gLexWMA==
X-Authority-Analysis: v=2.4 cv=cK7QdFeN c=1 sm=1 tr=0 ts=6a6b5860 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=OQN141zOAAAA:20
 a=br21HGidAAAA:8 a=EUspDBNiAAAA:8 a=vWphp4XADAiWeTw1PMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=rq5_1Q1BYlbxkLLkNd_B:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNSBTYWx0ZWRfX31n4MiAeCD+x
 bw/cHjO1ggjHVcuDCd8RHfDB53oh3QTom+hlfhiVt0LtxrJdytIDp1S8fDrFoi/SSLFpfe72wkR
 5gIYFMnyp4czV0PpfrQ5IsJ2ghkBr4k=
X-Proofpoint-ORIG-GUID: 5l0KvrVNDWCviwGXydv4GHV05gINIw73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300105

On Thu, Jul 30, 2026 at 03:44:07PM +0200, Dawid Wróbel via B4 Relay wrote:
> From: Dawid Wróbel <me@dawidwrobel.com>
> 
> elish declares the same qcom,msm-id and qcom,board-id pair as
> sm8250-sony-xperia-edo.dtsi, so a bootloader choosing between appended
> device trees cannot tell the two boards apart.
> 
> 0x10008 is Sony's value. The downstream device tree for this board,
> elish-sm8250-overlay.dts, uses qcom,board-id = <47 0>, i.e. platform
> type 0x2f.
> 
> Fixes: a41b617530bf ("arm64: dts: qcom: sm8250: Add device tree for Xiaomi Mi Pad 5 Pro")
> Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
> ---
> Not tested on elish hardware: the corrected value comes from the
> downstream device tree:
> https://github.com/LineageOS/android_kernel_xiaomi_sm8250/blob/a04dba03999b36cc8f472c014063395b41fb1022/arch/arm64/boot/dts/vendor/qcom/elish-sm8250-overlay.dts#L14
> 
> That import commit (bf5acbcaca99) credits Xiaomi's munch-s-oss and
> dagu-s-oss releases; Xiaomi's published kernel repo doesn't contain
> the device trees, so LineageOS seems to be the only public source.

DTs are in a separate repo, I believe.

> 
> No user-visible impact: nothing in the kernel reads qcom,board-id, and it
> is only consulted when a bootloader selects between several appended
> device trees. Not needed for stable.
> ---
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
