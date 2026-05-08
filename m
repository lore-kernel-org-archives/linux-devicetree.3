Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A762F616B
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267805; cv=none; b=H4xAAVwIE5xlN2V2avClfKpNKn+q06qHapgJSMCugQt5nkm6BRb0PbcszwgWwvK5A/84SHr6eCxl0afQroTxuOfMG/0rXaRC+mYThJsvkv4hzVkERD2PFSNaG6KNRGpb6M1zxUPiPZd3uY8k46c7TBw50YEuzreUstnNuCGXb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267805; c=relaxed/simple;
	bh=GqrSSFG+g75ZfR09SPDvsyRCtlFsE5haXopDyurtwfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvKoWgOUg4hrJ/Ct683lh2RLMWKem72ypPXLSAhB7/X9SpdgSan+QtlQPI7Ny+7wAn5DP6KsU4KPeEeKVcbzAgBU018Rm24u+cMqTrPJNRbRtVwgcZWIGDv6dobSEKviBbWdS65YR4bC7e/xAY38f7tc7vgnJweROcW+QXqUNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiWGhKT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAgfwcTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiWGhKT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAgfwcTx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648E4Hd0317769
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0S/MaBMiXgPLIl8xMXZreOhp
	tTdxir8IQpeWuhySA38=; b=FiWGhKT316va8LDXkb4dzlF+N1sHDUFf2/kUE5pu
	ORAY3pIpzA9b/swU83iCS8Tn47OwEGnuz4J3PiM5VEJgn/PsqR537zjWMiWtAN3Q
	PAW+IvJ6H9IRAmMPxm0hzPddoHC6wHteJDnKesYGOIc2/nxs2Uw9lMchBNr28HDJ
	7NCxHDgIndXeTW5KYX1++n/jOtxdAilkH2qK747cq/Fms5FmRM+ZtFm4CMJsJF3n
	D028s57sh5cDECU3NoWOHP01b4nSnHvE7eHD4EXcMIDob/7chcrZEax3/oUjKJg9
	FXPii95Z/XKIayq6AU0ozH8cFd8h5IjxcErddyqEPkeJMw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc02v44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:16:42 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-42342b79ae4so4552215fac.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267801; x=1778872601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0S/MaBMiXgPLIl8xMXZreOhptTdxir8IQpeWuhySA38=;
        b=BAgfwcTxFSzzMxePDyCcyLFUy7rAkWTeav5MqdxsFK1LlicdkFB+owmTRz7c3md0X+
         3vz1SeGKroNFQfiabhBI2g9ap5o86BQ1mwzEzhJna1znbREYZKC5cNUxVF0JkTU7awwk
         jp76i9Di/j5rxRDg8kvwAeMUZAKT1YHxOnFdNrLMBniaAj90LNaM35n8eNKr81Etdv8M
         2sxLyAEXwZ9/Ncvi7xtm/UkrdzbxL/Sh6bkXbl9g86Qk/Ve/BNtkflG++5321wWjOi17
         vnL3VogR3SICBRzrLQHV0RQdkWVMByz9ssHSmTsEr0zmUNZkZS3freOWm0I7qOiQDiPU
         fGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267801; x=1778872601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S/MaBMiXgPLIl8xMXZreOhptTdxir8IQpeWuhySA38=;
        b=LLW/67+Vo9uq8w3p4qHwbJNMRCsQ4MHafdM24TAC+YtuPD23TsupKiB5czwTqd95U0
         PfwqXx2WussHj8g/0SbTBAsS81O6tyJT0kFZfUNzduovquwrw0XPLbbJjgph8xwxeWaF
         nEd2WJgSZGzEKBnj+5ntP16cduHonpsJMUw4UzueYXc+rPg2iQNoVRu9OgnhbP/9OvPE
         da9olayHolz/eRAvm8N/I+e4QGeBf6fGojqiD957N3SgwmdnLpW7e1sU4fcjjb1O+Z20
         rSjL+HXCElbA5vx+5glLwWS2oXZnc8TQGbDeWZYztA4FY60K1D2JpzBHx42jeqfmh0vi
         zkaA==
X-Forwarded-Encrypted: i=1; AFNElJ85NfWX6JYn2m72nZR0HRK6Kgd3dxxdzMmSsBCpisQ7nT/UKKJAY7RKUTfclkmXdOOqIvno1zH1gLtU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Dxp9ztJs1JVvVrjfTmcBFHzQrjTVRHbjMVBRSZmZvxp2YhT8
	DJCPc2Eli+7UGCyVX24FLrMHL0zuHn/EijfOZlvG0IYqvXziTgwXMD3WndcnPyt6NBOBL68Bcsi
	OmocZtazcCsf0nZ1IKBkF1FlGQhSEUEPB3+5W11Fy0jNqZjtZnX+eft5JAZQgDF4p
X-Gm-Gg: AeBDieuwSK1TcGHYoviq0KqY/+aRRe0IP1EZqis71wUnHsuzM4hkz5yLyNMR6ha85ah
	TMGtm3mcWeTc8gQSIGxxOnm5+oNSwcx6vEej9RJEqZebxSd1s4fJCCHFwgcdlymvyt4cV2r/vsM
	2mRM1H9JChTMW6/JwKKnxc75gan0/Ep7y4lG+XthGS6K5Vc5OtUTfssn6UgjZtOgTN3RoKAs+3/
	85vDkgJ46qlQQ6azBSSorEsXt8Wx0lcxfJlczGlfY8WgFwKIrHulhcHnAA7lAUevN5wCtHINxgR
	bRyUEEwTYbAbEruuOy4cxFZ/VYWrNQWBHYkbD2zcgmtGTqkdZZf43NIFYG9NH+KuT7t3NwKESYP
	R5bX8nmDmdTkpub/S5AzEBLkc/RUYadw1rC5G+WeL2YzPuLnDp9bFA9mg79WECY2lTonc/iLLai
	wUF8UUougpMKLjTNvzNSHTBjwO9BLk5pOBnp8=
X-Received: by 2002:a4a:e914:0:b0:696:1291:fb29 with SMTP id 006d021491bc7-69998cbe145mr7809100eaf.24.1778267801578;
        Fri, 08 May 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a4a:e914:0:b0:696:1291:fb29 with SMTP id 006d021491bc7-69998cbe145mr7809069eaf.24.1778267801163;
        Fri, 08 May 2026 12:16:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951552dsm727066e87.6.2026.05.08.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:16:39 -0700 (PDT)
Date: Fri, 8 May 2026 22:16:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
Message-ID: <ewu4nbig32tl67xwghulsnyotlxezkkbx4uystuky4xe74rpud@xblm7twcvhxf>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MiBTYWx0ZWRfX25AMx+Lk/TCN
 cm5q8njIsiGoNs0GZl2XQNIcIuMk4ouFO9OruJz8D2qdwZA6vOBUGyO3//yhDeFTW5gTC3ywJIY
 n2YZjVF9urqKjXf2VCb7BRFv4L2ly8FoSGIDw1OaT0wY4IKNLJ8c2kKplUde3Bs3smxWUWznQhN
 rwvKED0yE8zhKL1zTOb4NAFtym2LraRt4LfGegC3OLH7BSAFXMvt3A1O1vKG3tD7rB4XD2gbgBV
 iMvzuqdHWHUvi/pyGyq6XHfIxnrZWuGrOLKbVEwdu5Bk31GcZEZjjpKJfbkuB9pDrAeT00c6e1W
 hRgGdZcuPdTbtJJ8ALWHoWXA+60wOEc1R4ah61mchx95FFvqtyC0yBxlEyaM56TihqbOBN4s7Ml
 tRlciABAc5u2MmqzsY5jj6RnxEu2K/wNagM+mJhmxzn2ZdvFAPRJG2H7c5XSLE/fmqnS/zKOO3U
 OfDWqboVZEywLZDkXNw==
X-Proofpoint-GUID: DKrEEYdueUvthAUps_L9A0TI5H5XOwp5
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fe369a cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0ofZ2ib08pOWvdXbZkUA:9 a=CjuIK1q_8ugA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: DKrEEYdueUvthAUps_L9A0TI5H5XOwp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080192

On Sat, May 09, 2026 at 12:29:51AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
> for device add and removal events. This ensures that when a device is
> registered on iris-vpu-bus, the notifier triggers dma_configure(),
> which sets up the IOMMU context for that device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
