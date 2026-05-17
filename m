Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7353CA4B6
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039082; cv=none; b=TeiLVZV48QZk2w5xrnYcSqvSAJDf+WizXwJbEIvWx5xwRqQqaaAI/aufEmGvZFPQFC7QcDXP/YgNJLvug/Hu6FyXKP4ISuXXsMp8WXQf2sIpdjhYgEqbHmOiafswfXB7g8s7FJiOyK5m1xWURxGWNlAB6nubECCrQ4f7WhsW3g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039082; c=relaxed/simple;
	bh=ddpK/1fQ1/ofrCYfSocIFVjNulkretdPKH0F1topeuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Omf0mEnDehoRfap5RoDaOCVJ2BSvPrg14kDXaG7zJ3VI73LTpl/TbbVFOTHhotnyyIkDwCfTJ0bjrGDJasNv0KK1X+pNtliD0NMtYzIUWskeLuWSq3DyUzHRH4HIy6uW7Wz4zPLkQWOBMsV7ZAX/IPyGH20zut87cJW6PUIhItM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AF9oZJxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dec8j6hT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AF9oZJxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dec8j6hT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HD0g013595369
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KbfQWTa4JGz2bP3xz67UN369
	baMaSiTTAvAd+IsVkZc=; b=AF9oZJxha6L/fXzvJoYafBp2qJZybWVLfVy3/Ief
	Alzi+ZUt+mYo8hKNWfyOamZ70IvvKBJoegHSxV5n2FmZcMB+ORPHumXogHV5KKQ5
	gpwXQ9k1OFaJkQYXpeJqf+rhV06Ec8B1EpIbVvgPV65XQhGXBGp+EmYyBx8JMOoI
	IYuX+RMACQCwIvWtpv1cxDnZdLbXwRwCY3PKCXVodKbWKrwTZlWJe3Aq3Gx8pU4J
	80Xoep0rqA6NjJxj7Mx1aIFc6jMLDBZwtIGe7EtdGwFR63SBkZfRj2HE9GZz8NUt
	OYEYHh75aKt0vr94gplsDeyppvrzm69du2WSQJL1DpyjsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw3973-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:31:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5162ee45a77so43622911cf.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039079; x=1779643879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KbfQWTa4JGz2bP3xz67UN369baMaSiTTAvAd+IsVkZc=;
        b=Dec8j6hTTjAOjV7iUQDQa0mP7OTdRejM058NAZMfwyBNveTBm2K/fiHivC2kSUla68
         0+1aSq87Yf/3+MEm49ArMGXcthLZbPI70KW1+3EKwwwR6dcRDa5FTPA6FakUkoOEqbtl
         JQwTOTBa50q7QDmSsUpnXKz6BQdI1S9rr+BMmu87AZVeZ+3RC1yBeoY0y1pF38aOz6iR
         fJmhuxOPiagNYZJX8ZwDJK98PeygF+Y+nj6hqAUydx0seFr0KbkMsIwNUCqCgoa6SbPS
         HjcXcMXzh+ShJWebRWWluA6Z1WsKV9gcgKRc+JxAjLQNnXkS73RobAD2LBPH1L9dTzok
         4+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039079; x=1779643879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbfQWTa4JGz2bP3xz67UN369baMaSiTTAvAd+IsVkZc=;
        b=pqRMHOnr1SqJDDLuRktnl6nG7+vJbFOAijYO5q9CaoAv1dWtV+/ZkfxJ0EyfsAdB3o
         tqIwIzzPfKmv1vi2BViyaSjSdvt+AC0e/cjEMuztocOShJabSpMUGdW/443Iq0XlawtE
         vDOicM/fVHD8S0Z6I+hC4XN1ZgXi4G1b50FMTtkP9jABZ/s5B1YEsY/U/p7P06GUUmQZ
         bLYSgspgc8234AalrYRjQxZmyKk0En30Vq9KfR4dLKt27inLxs7EetgwxFCI+YYF/ynz
         PAOcY0VAPbOiRQiGfPQVkQWDJvVS3ZvwNRRYdfEaVHFE2bpLRw87mrJpcCj4225nc12X
         APRg==
X-Forwarded-Encrypted: i=1; AFNElJ94AoYrsHtgCupXnlJAijmWvYSsdwuUiIgv0PBppxe4+FoZzSxR9+ZixxaNPUVIY+E7+Kqi5jnjhxXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzPyUQxcycEjlwJ2zdtch41LWTGGRhDrOc4x86SBvfr/p7LfFR9
	sUsYg3Jw/r+Q4LJb/4EcteVQEPbtXD2eGdFPhpqWA8eW3y0z1ykFDMX207TqVHyzWvK8S7ubmAp
	DpbJppZEUge3bYk9t+KviCV/6rucErJG5CH+KqiqakqzWGsfgLfqWPDZZRqpm8c8C
X-Gm-Gg: Acq92OGv43ZS4jT35clGaO2jLqpNSGss9O9E4DsjosbmeIyIwlgDXBONJC3bDgJTcqO
	nBqHN8mvy7qhVEWZmOs0ftxHCdj/GsEpbPy2tsXzFP4lJXfW9wEXo3WfD967iW4mp97ig6/5kOm
	NeNtJ5Ua5kVtVPg4McCZUrW5kuTJIgUehORDIVN2mnzeZBvuVvIn9AbDCcdqlg+FAPbSyrdeMcL
	B933/Ybaxob5rPSb8PcXORtjFSYCxudevbRDBBxoJX7dNroACZRAIUQH8X/pKYzkiYhqTwUgE9b
	KjNI1b+vfSf4mF4yKpem9Qy6traVgbO9vjdljZp89h6bA5d2V7UYeUdkxYlYYBj7X+bjWdug7Zb
	NVZ1PDGdh2kahLkTt3U0nHAnGdU8Y1tYOgtLwFwbgYOxBYIYnJirsaugLyDLGWqKx6Wi26zHGZc
	8Y7XeLZCL9VGl4GtyJ/hILK01sNaOWHYjq8UFr1Wf501vrvQ==
X-Received: by 2002:ac8:7dc6:0:b0:515:875a:ec22 with SMTP id d75a77b69052e-5165a0022cbmr183435491cf.10.1779039079338;
        Sun, 17 May 2026 10:31:19 -0700 (PDT)
X-Received: by 2002:ac8:7dc6:0:b0:515:875a:ec22 with SMTP id d75a77b69052e-5165a0022cbmr183434871cf.10.1779039078744;
        Sun, 17 May 2026 10:31:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b6cb8sm6534341fa.37.2026.05.17.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:31:17 -0700 (PDT)
Date: Sun, 17 May 2026 20:31:15 +0300
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v6 03/14] media: iris: Fix VM count passed to firmware
Message-ID: <gabnkc3nmsat7bdevnpgpba2fwvv3juzwut2n6emmyudrntht3@poynzfrdwjmm>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-3-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-3-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OCBTYWx0ZWRfX6VpwWkCF7khY
 L9fOnU91iZsSjrAGnnwNFlpV5K0BJcA0B+4lKY5q00L+XubSwjBiymVOcPSsP9tMla9wP40FJh3
 9jsiYXccGdTmeFlwInlBWX/yFox6Rb1QXdBZMKqDHmKn+kLKmzyHaRAKmmhUwbG81xpoIA7RQLr
 FAhoHM/1qCPwKLOUWORyr4MKSKV53eJftBqMHslb4zC9bGhUy7+BzXj/wKB3lmmTnvj7A0ZWku7
 VbKIcYMkfRszFNC4VxjoYRzQCvoSX4aczLYRF4wvsiil5YAq86KD5TWbJUffW006adOa7g71tD7
 KJxpHHdQfo5YlVaYvIjwzK39c56wcoKLVnFfxFSbC0aU+MfgtcHDts+9MhVvTaY3RNX8FhRvOHu
 bn231gnCzPacz+TqBvzVrz7ZkSEtfDpKqEGvskqCinSH4iSLw1aOy1CpwoLwOu9TPx23w1b6R7m
 0OSk2TdAch2TlqzzibQ==
X-Proofpoint-GUID: ptaFdKwQdLeDXRoRc95sTVpMuqbGBl2q
X-Proofpoint-ORIG-GUID: ptaFdKwQdLeDXRoRc95sTVpMuqbGBl2q
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a09fb67 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NngpiPSqF1r_w6X9nHoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170188

On Fri, May 15, 2026 at 04:51:18PM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 --
>  1 file changed, 2 deletions(-)

Please settle the discussions before posting new iterations. Just
providing a response is not enough. Get an agreement of the other person
(or a timeout).

Until the discussion at v5 is settled, NAK

Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 7bba3b6209c2..df76530be809 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -26,7 +26,6 @@
>  #define QTBL_ENABLE				BIT(0)
>  
>  #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
> -#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
>  #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
>  #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
>  #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
> @@ -78,7 +77,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	iris_vpu_setup_ucregion_memory_map(core);
>  
>  	writel(ctrl_init, core->reg_base + CTRL_INIT);
> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>  
>  	while (!ctrl_status && count < max_tries) {
>  		ctrl_status = readl(core->reg_base + CTRL_STATUS);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
