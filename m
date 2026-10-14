Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E753D9D5
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987799; cv=none; b=N0Utef8Swu53bf3sD9AAVs0o/VVAAVzH5nU9UJwCBFg7h9wS3ZZonBMJKME1X/E8vGXLg3QwttwuHQQVdL/s6szeTSeyHa7vOpmktntBWPwIA9w8OhqetUif5l8JLOC4VJrm7tNcxf9OOmbj9rm1OqMhMu1G4C9/yRqef8uKtvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987799; c=relaxed/simple;
	bh=tx9Xx/2ujSCsRzYR5b6KO0ZDOUNlLvzT/wn4ry5q0iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb29FGyAMCwC9scSMaBhd69WQP2WdGgHN6Zd0o7fsuQCbySR09uINkpgSq3kerQRs07kDNdXrJUpckCn1VYEPSidqazsXKkAfkvl93s+YMNc0AXglfMu5yShkNXSAkp5YdCX9xcou7o2Lu9eZPx4SVrMFt2ZWVkBhDmrabHGfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TF1S2lnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbrfGAH9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TF1S2lnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbrfGAH9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ECBcVF2088021
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HxggoZsyGw+wkrlt+cBfpByq
	ki1BnMRvzaCfqLVXJus=; b=TF1S2lnZJFZuQXXKI6RIdo8aRvTUHZAqHZILAp7A
	vJ2B+fI4gARqwq99r+lwNgFGXtMxa93KXML3ETomP5IZuOH5YyJ9gK7/E1fLWQfJ
	Njhz16GL+biCZhSaOBXoGBLhL/5bfaybergcrzyRv0NuEbQRcBAyLPlMXzkhD/DG
	9OycF3LNTiwJaIjlAshxM4dJR6atyZd1AJ9HkeApFQ/JRp7tv4t0zxna/RLE6b8H
	L1HIlqLhhbwbNUZI7Torh5L0QRMvwdjVCChlet1V6h33K1KSTGSJPKmj075LpKce
	AQ7Ywkq6UzDQ7KkM0qmBsK5Fr8fsk5lRYjA4ryHoSkvteQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49k9qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:23:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so811177585a.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987796; x=1792592596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxggoZsyGw+wkrlt+cBfpByqki1BnMRvzaCfqLVXJus=;
        b=cbrfGAH9rzmDWPAfL+lmDcKfacrnNCoWypgH1FU2GuKz0mnHjb6qsuOLP7OYO74nLJ
         ak++vNBXyFpSTSgpzFMSu3597qjTVRvC4owTHKejF/K5U0JaCSxHN64VFO+smXLsYJXE
         eJ+Ee2equMknJhsj8tXnE+SXbWjFLQfV4fDE7LSY1IkVxGQ8oL6kSgAzrUeheHwQve7O
         oyNxVTbljz0iIMMRPlAttPHLlzig9xM71ChArIo3N7Y2EaHfk7M+YzVhGzjPPShM0iLL
         lZdd8OFtYx3V0VWEmgvR5XnjDDRn8GI9VGSuahsgvsMqLIZtPYQIB/7xhwkBQRiT+LGq
         +9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987796; x=1792592596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxggoZsyGw+wkrlt+cBfpByqki1BnMRvzaCfqLVXJus=;
        b=W3PFe0CihdjwG4iOIcyj+gIaW+vCgssnjsgLPNtl//yJuFX3TC8euxl+ADxeJEymw4
         RHZBsCxWbcxfZLENUVKS/8Wh9faHVwzXEs9krChBFu9mpJRHSDQhj6VnluyvaOEWTL22
         MirzuqI6jFJ40MxVAkRQFVGXcr+FYUIbXMZlQ1Jf5T3WC9cF1MKfw0deEdcAnNNZNSZd
         OY+Az0zAbLQYaKisj+W29As2eyjjkAW5zgZ/IynkCqQpvqfj3QidflCJrP5fI0FSN93V
         Ndj/UBCWe4ThXj8SHdDRKUnM9gab8moVzgRPr0vhfioPoaxmg7WT0Iah5ZwwP/y4Wikc
         GMUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMIjZJ3ZLHR9RvYG6/4cV0hSRgVwhRw1AGtcY9XPeiVXa+Yf+JcjUYRK7Sx++xTdP6nbbNvKqG4zgU@vger.kernel.org
X-Gm-Message-State: AFq9FYLOdVwIw+2zujVbNiaAxYATLQiZLphaRL6mKpPURKMmqpjiroZT
	Nck8E9THl1VG3HuiaDsEPa9iE+CS84uh1GSGc29RQvwYGxomJnAtMJdKNscSPgvyI68TyEDl0yP
	IBTO+wXGtb9YWWvv3ivhVHehKy25sJPctaNgVD7RIRkDAU1T1gTTK7nlJdN9s8XZ0
X-Gm-Gg: AYBFou0spltuwf6QS8UVSSeO8O057ESBEXbj84faH2/ApPMxVKNdWkvRVfg92hpQ8r9
	6Diia19Y1/Rx1EhxEZ/NHvX+4i6j6WN591mKwKXaeU09QBndnDFnOMQx2bJJyCvR6L27HyzwFca
	xFF8nruiDAXPFX61FtNi6l3K+/aTAk5kuzNQBQH43CGI/0yNVJpIiJLXq71mEY7dlUHWrjS8YAi
	0eiuBQ8O2Kwzb7tVMLQUzxUTyr+Qtq1zoGVP+w3QIsaO/Z5EqHHraUez/YOh97r5YnfhMU8S6XY
	MF3meiXZU9tl/PFNCmxNOWZFNJUI/DqbY5AA4SXBbs36axlsXPb2oW1tigjAqTrAwbYmuQCtxlS
	Gw84xBVA33sDaHmh9Zt8tckRa8nskV8vixrxzWNtJEpL0P4vs+dwlQm/yaNdIEFQaJAK+uEos63
	vsWi3DIo242d7E
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr2563169485a.58.1791987795951;
        Wed, 14 Oct 2026 07:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr2563163585a.58.1791987795429;
        Wed, 14 Oct 2026 07:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9dcdf4545sm28180021fa.25.2026.10.14.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:23:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:23:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
Message-ID: <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf9055 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ycGoBvuFAn3-dblq1t0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX3j07SRVIMoqt
 nwKzeDSCNHX1bf1d60Wjr9NA/cSeALGVggx3fNkwpLl/XcgPEKEIiBDjEb2b9cxWyGjQCPaXH+M
 r9JuzPuIfMn8mBtb3vJDsq5emeo5plodqJDg22VwV8RsXmZ8BtTbsT2/5/wmL6ifx245df4T8+l
 bbZFgo89Wbaqgh3MR+3+gxQ/ebQTu9+6CHN4QIBzIwnsV2Jy1KrF5QL4nCRJdSqAgZKW/JcB7K+
 KJc901K2I24USY2x01bqRGWcVhpyS1I4A6Htzo90+mwLDEUrRtIDa8PByY67rUm35lWh7hg1nJf
 h8muSMithTAvqwWrJmvlwS08I50Err8oD03SWFdNClYq3UdQ0WD3cCP1Il/tve4jOCC4HIABgXw
 Kg6OuSoR5/D8U889GiJ/Cqf+KySKyJWDM0+JeHwOR+hx8kfIjRVfvAKx9NChpWPzzagzVHvHE1S
 hfoCKzjA7uIo2iAkIkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXx/uagnyB4Ta9
 zHMn+0csxh/nuyXaBZ3fkCQh+OVjLJQEc0i7gD4m3gOrROzXMHZQzgBqExzUEXNxda2zQivJEHt
 3oLvAZXTVTuc3D3yY2SYDm0MN44UXck=
X-Proofpoint-GUID: Ar6_mkCr4BEuYMobrIb6kh8MXcO4R_8V
X-Proofpoint-ORIG-GUID: Ar6_mkCr4BEuYMobrIb6kh8MXcO4R_8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140057

On Wed, Oct 14, 2026 at 02:19:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that the clock controllers take care of their power requirements,
> drop the required-opps that were only there because they previously
> hadn't.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> DFS clocks (for QUPs) are left out for now, as they need some more
> code changes.
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 46 ------------------------------------
>  1 file changed, 46 deletions(-)
> 
> @@ -5057,22 +5039,18 @@ sdhc2_opp_table: opp-table {
>  
>  				opp-19200000 {
>  					opp-hz = /bits/ 64 <19200000>;
> -					required-opps = <&rpmhpd_opp_min_svs>;
>  				};
>  
>  				opp-50000000 {
>  					opp-hz = /bits/ 64 <50000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-100000000 {
>  					opp-hz = /bits/ 64 <100000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-202000000 {
>  					opp-hz = /bits/ 64 <202000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
>  				};
>  			};
>  		};


Can we then drop these OPP tables, which only have a HZ entry?

> @@ -5200,7 +5178,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			iommus = <&apps_smmu 0x40 0>;
>  
>  			power-domains = <&gcc USB30_PRIM_GDSC>;
> -			required-opps = <&rpmhpd_opp_nom>;

How do we ensure that we can access device registers? Is there a clock
(?) which now casts a vote, letting us access USB regs?

>  
>  			snps,hird-threshold = /bits/ 8 <0x0>;
>  			snps,usb2-gadget-lpm-disable;

-- 
With best wishes
Dmitry
