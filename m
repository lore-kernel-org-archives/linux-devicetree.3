Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3E22B8DF
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237498; cv=none; b=GmBKW8fhEHLTNvN1eDXwZQgN6QSBDuCyhxJENLKhq/8LIBO2UPApYxSO7jR4x4YFH+/Ea7M+FTiDfs1ZBS9AeL4gFiL04iWSW5U6gSBUf3zKpWjN56rn5qUG1FYmLPI7r/7Yy9h0uH9mywgdDJ9NU81EZEz3Z6GRv2pkijzarnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237498; c=relaxed/simple;
	bh=WvxBejKx3XnfT8ZIK2R39VomPVUil3oBoPn/ofmMZsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqg+Lrl5canYgzd6YpExIp/YgvLSV//s2yJc1ze8dXhhf6pdcaNFxQ1pPVDZtV5n6P/2fAasHYwBO5L0zoUFsIgbLT8khQvdwmuJq2z3LRoJ1MvCBJKn6mIo0O05UHN7cJAK9lW1hNJIMyyC7SUeNyaqYZV0/fxaO6nUCqFJoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfId1Zr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlDSE8Hc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfId1Zr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlDSE8Hc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NHodiJ3744716
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xwxz0y1QgynK3CxOjDot+ZHz
	k3QiRVKHLygIBMPihZs=; b=hfId1Zr+i3JPaXe/aJ0YPJOtm7vlt9YmQIkEEPAC
	scwENPBBd3QdWYCM4L7+urNIETyFCmtPUiP+a+kAbiuD4VK7lHYjvZBaR40xPMlm
	7UyWhl7b7cNzOnbZHCW2Tc0l9UdBkYvQJuLrx04Q4m2EIyU1gIbVGnEx3dOfY8fq
	4SXTlYl4qS4Y2RqK5RMBHAYnUWo1DcLRJK8v86aU+vet289GnoPQDe5GNCrXFXXv
	tWQvwlpbh1H+v8vanwWYd+CT4WYBC0QoWdCqOjqJjrCc/ugGzAt6Pq1ol0se+FGi
	J5hnmmShN/cw6iYf0mnIrbwVfHDqoQgA/3QJSNFiCnNtzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx3aexe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:58:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8de3b53cba9so3157696d6.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782237496; x=1782842296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwxz0y1QgynK3CxOjDot+ZHzk3QiRVKHLygIBMPihZs=;
        b=XlDSE8Hc+1SuYwJHATyMwX8z1ome2Yl1uhiIr9xIhUc8u1fbt8t1MzQglBzgaVXbCt
         Jh8veZzeZxae7X7BVmURS9U4oRNM57Ozyrs9Z9vPm7LLB2DJYtZyGGoRuQW3CiSKayn0
         rdElL15RdviqJbStrqr8zJvk0ll39hqt7OQu0pW5hiQVuMc7V575lmykoWHtFFYtfm0o
         3n0/pNZ888MJJkObYkrW58phxKD8VwUyzGCboVqNvGeeBFtqGTlOjQPYZOoPepIGuJO5
         IjQz82xLxx2/CYvs0iJvcFDgNCEhruG6XloAhbNm331r0s30qJ+Rg9mgnRDpem6OI8Tz
         zoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782237496; x=1782842296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xwxz0y1QgynK3CxOjDot+ZHzk3QiRVKHLygIBMPihZs=;
        b=strAASvji5WdTwkbd5Y16+DcUlzWcs0giqmRHvaFPQ5l3FtNeoTiVcgGQ4YIXBWNGm
         xsHVWZKDu7uFei6T6TbfDJ7Io9Vcv6WTV9RZFlVIwpSDTbkKKM8NAvoll1jrrbA5qJhS
         xnEbqDSiQ63FoowFH9Gv+FhDILd7qv7H9BePJ+c/LK7aJfckMDXmvZF1SZdHJBZ6URX2
         ttg/Om6WOAMJwmZb2rm+8V92xJX6zWPVBPJJdC4LKdHHwfbc5x3KHwoIzH4wBpjRrLLQ
         fd8HW10TN3X4ZvMURcSyP7ENbUNdDMQM4mNQhg9lRzJQp6vAACrhBB95rE+J6oviqHiD
         nrMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sfWCgE+njZKrOKSl7ttci3EYZgmZPe8ZqTFdFu5404cAZ2MAulNiNpHCfep6hQ8YuIFxprLB+Wjvx@vger.kernel.org
X-Gm-Message-State: AOJu0YxmA9YVtHN0RKuUtQ8ImUyI0BCy2AMvh2C2GI68ur9PTP2BRiXQ
	CHd2UXnPlWlcHgJAfirLhlDEBOSspIpiZXovG44ZYoyOx4m8jvrzhWye4XJmed5GUqpcaHXBUMB
	JkVyEho8/xmGT4MwBFzF3kvK31fRbDLohyLg5lMtR1OibcmtXw8HRP45LpzzWEd+G
X-Gm-Gg: AfdE7ckmwR1VNjbiz03GarB2h8pT/xD6cz1OXEyF8X0aSvvo4JpebHpV5wHjG06gGb5
	DIrorTonp0Kf0XylSVMGrBMUHBqU5ehklFIpkBl/nIYjo6y5z3FM2ACuGVHOoVMcN15AGxemTlo
	n9QFQ1QR/Q4ciTshP6XPiUV7pdmbQkwFQ1oqqHuQ4u+HtEf+ZtWYzTWf09oIFc2aF3EU+xhBryG
	uO/k/fkBelGKXs//Vc8z/r1kXQru/2nE2VKq+xZ2W8TRVBK7i+JIh/1pS0s65mdYF3t0Yb/vzKi
	6kTebEBU2+7CqXcw21WzaQyyPnwQd2K6LQSFbUg7vZlQ5YLTkW8K8BJgLQ83prMG5XN+S99xYJV
	Zw40TQ4KMy4Jh2KCQG0clLpXD5MeSEV1JODi/6Aao0b7MHoILdDV2SyylIc21cQCXc36e2PC2d3
	xDKMey8PxXCVSgIYRKjWSiFzzo
X-Received: by 2002:a05:620a:1b95:b0:915:8988:4e55 with SMTP id af79cd13be357-92783f2c83fmr10770585a.40.1782237495567;
        Tue, 23 Jun 2026 10:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:915:8988:4e55 with SMTP id af79cd13be357-92783f2c83fmr10711085a.40.1782237490337;
        Tue, 23 Jun 2026 10:58:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580f08sm992714e87.66.2026.06.23.10.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:58:09 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:58:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Message-ID: <r6eyzzflushayh35wjqn4ubuxffnac6asf2knfh2erocaefmhp@mchrnzhjxjni>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-4-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-4-71d827c49dca@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3ac938 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=q7KAvXTRkkGcKGliRn4A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: sgKoDI_XipuBeL5h8jM6l6R11iFpD1Ll
X-Proofpoint-GUID: sgKoDI_XipuBeL5h8jM6l6R11iFpD1Ll
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0OCBTYWx0ZWRfX9hyOdNTylUao
 fJeHvnhpNmMGPzDsBg54fLeScVTm0dIUjxkoAcN4IVKEhH6povggdk8kSgdTt72Ly0f6O+wr5QN
 JJ3S4L1y9J2a03wku01yDWLXAVkHtFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0OCBTYWx0ZWRfX6jaPwZnsaHDD
 L9OEwcLVdvedk3qXgIfRSPJHRY6XU3UUHRKIf0rvfs7nQ+hZqUWVodJu+ZZ5yrI8efD3jX4cpDJ
 kqR5RVnzppAKB099cA2P24tZ8OJR2czHiepOyj/kuzrkiotQ+MOXtQfxS2uWy/mRfMnfCObc9PM
 b7FggvkIuEBSnVi0YgThJw7o/4Lo0AkhUFlGreo3cg/3uJJXgvtjIC/P3wmS/HaU/wfiIOHAZ6y
 1t0HphSa9ESWar3HL+k0qxJpdeMzROWqNt/N7xSESHK7xiZlR3uLH5fiEkTlroRyOBol6/bBJmA
 URs+3hWXARo4N//Z3WGYekfeEF3RJyk5OH84uNAN3qk2OvkVjkSIVH9+IPuXXBhrTAqUnvEY4wY
 Qg6xKZ5KiY7KKYUotdwmo1ZXRe7J5jSqc8XVtDelcFtHxZM9EQ3qZjyBi16iPVWnH7NcsWY6dPL
 f2ojClDGQo5JPY/yf+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230148

On Mon, May 18, 2026 at 12:29:51PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the offsets and configuration tables to support USB4 and
> Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 200 ++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |   2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h     |  15 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h |  45 +++++
>  4 files changed, 256 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
