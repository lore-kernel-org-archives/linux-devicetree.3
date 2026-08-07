Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897D3EEAEB
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096810; cv=none; b=Bfb4PCGojrFRpnldpfZNo+TrHIzWHAts/zSyPd0Ic6qOM2WjLGGy9Ut7fhunDE/YluTzQ2zrSgBpfrP0E1/GXFYIHOO8RqwE5zX1dmJ9lYTxrPWLAmJQXzxiZ/KK9k42oLDWKRuuNjsXyDWq2UZieaKQ/UPE2j0j3pbpyIDpGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096810; c=relaxed/simple;
	bh=bejA4m9X7TrPk5Ku8VNd30bLzjTI0lzjs+PV4SUKZh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EslcxJxADxG44TkUgqcmKjU3mDJSFNU/UfAL7HISwlnJK13PmFenz4hGDJ8F2Bt0LRsEWGOzukcOci0f/SNWXTHCeNNXbGfjBfLAXO46hQ4ABUzb2Cn8DiZ1QD2Fj/jEW/e7AuKmx5/znq/gMe9GlkHteeaeNYYW/7iwgLHMrgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQFvXMPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAOrVz2x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQFvXMPC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAOrVz2x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777ltd9493134
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 10:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CY89P/qUVdBMxzcfpk6p/rcw
	KcaqK7iX8KqqclJKhzE=; b=fQFvXMPCa2VcW/Pau+UobyLCSzydGy/hveM0hBpU
	ITw7J+syUPXMrLLzJWIR4SgFv5ZA6HqDHZPHf//a6lob3yatvsjR1gZnLi5MTlsw
	RzOEnxqCo96CTCY3noku9RXdtJzd8tsfkU4q60eDHvXzo1KczMw7mmWaozVXD3ig
	0Ml9CuACgYqzh8iFRLp4mi03MsqQE83pu/q6fsqj5HOz15AUmAeY7A/UCd9pINNb
	wV0CmEDNr8BqeU5/GUsG9+JBMyvXwpMocPigAIn7WmMIGoA91w18+CPHdgX9FnpF
	PzagatCss8b8D5Eima+XSTbVYEAoR6Qb3VyeWX6ADbU/wA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rb9xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:00:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f113592bf3so59731226d6.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 03:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096807; x=1786701607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CY89P/qUVdBMxzcfpk6p/rcwKcaqK7iX8KqqclJKhzE=;
        b=AAOrVz2xW+jLUmAQVQJrQszlodDnFfpbZ3/zBW1yCSs9fWWFt+32VlPJq0hd3KuNO6
         6OaVXz56QtMCJnOxeKZo4gjd8CFPpk21cwKsxmJI4hd7B1m6LiMTaBkuxvv9nAWWSjfo
         ZqPggQlBUWtxkSB9jP9o2SfImLxvSC8aLofnoRQFePLNPg1txp0C0+vQ1YKhBt9bsyYy
         2nKoBy+YjktC+9+Ze7T8ZNxP/szIf2MgSdWCbJYMimtfzEBKZejdXx9L5frSEDrYzBrv
         VZzJQ8KZgoNPCrao081pu8x5nL7X+UGw7C9v1DH6qyAfJnFgz5svAzBH3UCiNrpZTv8h
         hIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096807; x=1786701607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CY89P/qUVdBMxzcfpk6p/rcwKcaqK7iX8KqqclJKhzE=;
        b=d1NcBVC0syFEIrvGKoIIuY8ukOPLF5IyaVY1YhJG1q8ocOku5VNudXCVmLWGnA1gKb
         FiRSIBT16N3P/ZvqU2CVuXSqQ/3y9MWjOzE4xDtQXSpT/OkhgIRv/WEL/f6tq8wXj/+0
         8cfA3LK7Q2J/1lwdGHPkrbxxdYKGPWuIZc4Es4tuNN8+/tQQaNwDXuiyYNT6kqCvnkVR
         qrjhu5AAo2AjYURSUvmtjDLS0taChdv3B+zrspewVnGMr3GxI/v7WsCUMHn7fX9rxVM0
         mAc+9TPVfRCmEvUs0H0/u7Ec/XlLtJAjpG2Qdll1U/+xhpqHSOP7Lrkc040FNF9od00R
         K0gw==
X-Forwarded-Encrypted: i=1; AHgh+Rpc0iLk/mxGxzlz1Ef0/2PTOUrrSUcpWtBmftUc1QGc52cWsETBZKpOE1/X2QaJjhoXJqVkgB+drtjA@vger.kernel.org
X-Gm-Message-State: AOJu0YzON7gxe2yQqjViSXR2KMiyWjZLuvbdrlR6BNvXErFjlsZLek6q
	v4tRxyXVfrWW/Y3gyTFrcOlHc5HRUu+h8An+9qz+IMSmU+LOu1iuoacjWQjAwQLaxWvK8ldeFb8
	aj4KblA+FnLT+n2WREXeFzKZZ3LOLvmZaWMJuZ4z/w9KiD1rOBk0IVf0T9kfRMmDz
X-Gm-Gg: AR+sD13ps8mmbBA2W1zdumFGU9rX9NTb6wbdVD7QgJqz8O6RY3sMaXziRXvGJNXYaak
	JemHggEXk44SsjX5qKCI2hIZ6YEbTg3/shE9fA6DCboL/v4zKthcgveGMtp/ss3oPazyo0HDpd/
	1fQpaK/7qGfO0PpEYA9FIzetoltf4kDHIVx6nu4i9hdk1diKh74qY06Ydas0AWuusjH03u7rE6n
	IzHiJP/70rHzFScJJ5JpMlG9rTJdqEj6v3POEiWZC9Sg2J5TuDYhhdoDTEFSi8CISk8DfxPtBrL
	zJUCl3QK6cdSzKHRHJV4QvXupCqh554u8yI6uXH8dZlqD2KEe2B4zAImCioXn5UQowfMm+jjyXR
	G14ujA+t5a5OHMWRE/TMUWTgrGB8WG/kjwbyabqHKPmTiZa8YD+GSIwaC/Wro78byWpiUIgMMi3
	gjcSCyptj5EhxlKA==
X-Received: by 2002:a05:6214:1315:b0:8f0:b50f:dcf with SMTP id 6a1803df08f44-9089b521f13mr83529016d6.7.1786096806982;
        Fri, 07 Aug 2026 03:00:06 -0700 (PDT)
X-Received: by 2002:a05:6214:1315:b0:8f0:b50f:dcf with SMTP id 6a1803df08f44-9089b521f13mr83527686d6.7.1786096806507;
        Fri, 07 Aug 2026 03:00:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050cff93sm370911e87.23.2026.08.07.03.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:00:05 -0700 (PDT)
Date: Fri, 7 Aug 2026 13:00:01 +0300
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
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Message-ID: <tdgbfewnlj3xypfnyckivnd2b6667laapkcfs2vpnk74bh22aa@obasatns3jfr>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
 <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
 <27f0b033-e940-4369-aaa0-f08426aac73f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f0b033-e940-4369-aaa0-f08426aac73f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfX9ZNTp9P9b3qc
 tOiZf4Vn5gr8d0TIXl41q5K+voPWUaLefoBpqWJ8h39K+Q8Fg0U5XpJHijbDF0ODVkWXh67w5Qe
 +JGuwGmR4PgSTfl2rHoLKSz8T3xnvHVT/oRVtuE3hjaHAbB/R1vxBC4qt9QrUEprVaFA2AumWva
 J4dD5oqujCU9H5i5n06UjDleBIJbWT4paPsCPzX4HnwZA0WRzNVdLgJWjD1W0qqzZQsXzgPZBrV
 WJ31Aoc09I8qW/v7ro/XSdnVT7FiKbF8wq9yeLYRqucZSiDLiLyBU1n6uQucFENb5hKm6SNSrq8
 qxSUjuZDbwlJkQZMn7/6yWRbxwRVOJYbPxVdzzpuOVGGdFC6q4il1rCq/DKNDjHwD8gRJFoMmDd
 tdcynz29y3TLndPQJJW8kGAJse1feXXf2CU62HC6qqBKk+MvWDeYmkDolXkOWuu6gKwMDTEJlau
 xDSNrsCMj8nPaSQPz5A==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a75aca8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=F-FAosHBmvl3iYwk7X0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: FGWoPG0fVWK4qBICG4gLYHoHMdklSmvB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfX+CrvLF6O5TnT
 7hSU3oqvPM6dSGQW054nqMx1ru1pMTK/2zni+I+bqLscDukpADsDHd9vzu/sC83bDG4wxduAxpm
 JvJfu+ybwHxQiVSffLsEzeb22+PwOFI=
X-Proofpoint-GUID: FGWoPG0fVWK4qBICG4gLYHoHMdklSmvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070075

On Fri, Aug 07, 2026 at 02:56:27PM +0530, Vikash Garodia wrote:
> 
> On 8/7/2026 2:33 PM, Dmitry Baryshkov wrote:
> > On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
> > > From: Daniel J Blueman <daniel@quora.org>
> > > 
> > > On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
> > > below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
> > > into that range, from any other stream id would triggers unhandled SMMU
> > > page faults that cause spontaneous device reboots. This is readily
> > > reproduced with one or more browser tabs driving multiple concurrent
> > > video decode streams.
> > > 
> > > Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
> > > and reference it from the Iris node so the IOMMU layer keeps DMA
> > > allocations above that boundary.
> > > 
> > > Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
> > > Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Daniel J Blueman <daniel@quora.org>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
> > >   			hwlocks = <&tcsr_mutex 3>;
> > >   			no-map;
> > >   		};
> > > +
> > > +		/*
> > > +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
> > > +		 * primarily for non-pixel buffers using different Stream IDs.
> > > +		 * DMA into that range triggers unhandled SMMU faults and
> > > +		 * spontaneous reboots, so reserve it to keep IOMMU
> > > +		 * allocations above this boundary.
> > > +		 */
> > > +		iris_iova: iris-iova {
> > > +			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
> > > +		};
> > >   	};
> > >   	qup_opp_table_100mhz: opp-table-qup100mhz {
> > > @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			interconnect-names = "cpu-cfg",
> > >   					     "video-mem";
> > > -			memory-region = <&video_mem>;
> > > +			memory-region = <&video_mem>, <&iris_iova>;
> > 
> > I don't like the idea of this series, because it _again_ doesn't tell us
> > the truth about the hardware. This typicall ends up with bigger problems
> 
> honestly...thats all the info i have about the vpu hardware that it
> restricts non pixel to DMA from the 0-600MB range. The same i have been
> trying for a year now

You are not honest here. You also know that there are secure streams,
which have to use their own IOMMU SIDs. And some of them, as far as I
remember, also have memory range restrictions.

So, if we land these patches, how do extend it later to account for all
of that?

> 
> https://lore.kernel.org/all/20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com/
> 
> > later on, when it starts to affect other bits and pieces.
> > 
> > I don't want to NAK it, but I'd strongly ask to reconsider it.
> > 
> > >   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > >   			reset-names = "bus";
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
