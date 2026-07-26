Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A0372049
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785098187; cv=none; b=CnVVgwylU851NTIyY9p8WACPcRW1YIO1laBdA7muXDEv1M9534G0LmYtUJXTp0BeF5GM1EonYTqvV6TL57lVvfAXn6adYuVE+0VvWBo1WfCfe3zJL7lAG5KrKe1Mgp7CCkw4DmFWZjQlsxwf73ih2qOCwUUXOw0gCRtoq7YOIKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785098187; c=relaxed/simple;
	bh=7rv6R5YJcatIW2SWDqFSRa3NtOGxg+0Vw7PYaTlA61o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II/s1dFmlEc6r1ohQ2NNYWetNrvLbAHEbX2+wH0TQKO9sNb4LN9PRLypVAuvqa4xggDeyIhFUoSdM+0SvmCixHs3UTsTsG8A/poloVLV/u71qmWVI1TzspMWPz3PeNaKS5w21Kaa0KCuKS+r36okpmJXSIK71qIakBskM4UM0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9ptAdUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDd7heKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9ptAdUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDd7heKB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJvWKW1679609
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SqkFlTAif5bgt5ylvluZMohK
	o/S/Ct196CfCN2FqXGM=; b=R9ptAdUxCT12Agi9X7rhDpAzfW15zvVnvGLyC3dG
	rO9wfllvlgyoUm82DAU2xUdM9q4xOy9mjkeZBw1IRgWj9ouHq7WbcEE2oE5qbPE4
	6KoQNY6cXiFWsHDhphiJzB8lwIJnqlKWUg29/MPttIxxm/RyGYS+XNiNqMb9U/1J
	Ce2O26fnvAgpXjp9sCn6UBnXgDu7v/QIl+7dvaz07hOmRNGRj+HdAryouiwOi4Lc
	pMHA60BKR2oMimNwsxoudByvlzfrDYhpuC2/yq4Nhhh9ed9A/8j+puvi3DHWED3a
	SDIUC6Sp1PucNgZlisLEfg99bv3TNN463cCd6VAmgDjeXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbmmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:36:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so22767611cf.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785098183; x=1785702983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SqkFlTAif5bgt5ylvluZMohKo/S/Ct196CfCN2FqXGM=;
        b=TDd7heKB4IODYGkMhckKAsm4mYLJNUeY0lsuGCW6DSapNdAGz6xr42JCetAR9kTzjT
         DuBWoHqYv2aZ1i3O+oHIfQKEcPZJMzeNSG6PXM4pnFCTshhjP7i2d3ZSzkc7YXbgLWNW
         ajXv01JdNUYOVOmP53vHcdTFugJyxgvaW37skprpyIR/HrH1ep1+WgVMrylN4leetXWr
         8gFlCUuefKK/NwlWLQMW2T76JTC8Tk7YpveJoKhV7brF4CVe37wDmwLioJ4NCqEnOLJE
         KSfRrfcZ1QYaDSIfuoRXiSpb0cVAKSrCjjW1m4oKd97AQYvEpcXT2VpQlfYHTeHiFcd7
         snhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785098183; x=1785702983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqkFlTAif5bgt5ylvluZMohKo/S/Ct196CfCN2FqXGM=;
        b=VqDZ03zFFeZHQsCThSh7dfXds1Ti+ISWG9DBJRz5j1OkpihCXMibXoobcePkdKC8p+
         UJYlX9gKMK387J8niryav94fRAZydE5+yCfJG9+W8Y7tgHTEdMxTYrN1/2rycxULsXdA
         A0vL+Xe8T7zB28+uS0Vix5zPCp7mzNuuD5UpwHbLfNTQEw5XPO4/5ZF0lbK8UK+ZJPk4
         plUe601gZ1+PONrSlS4PfjSkjugENxUlIdgXgwQauUfNO7Tim1ZtgwOtomtNdaPZA0sr
         5+uv6vZAlgP8HUfLifjLMLNApVHG+VbSqQ37GABlrtpkDiKXuEb9qqEuEjDTzOCcrx0A
         Gp5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqwodrajXJxhLwvSrH5DnBvfbcydjyzLhivEecXZOmgYtS6Z0QYASON35nnUNcfXKVU2vFvaLoF16er@vger.kernel.org
X-Gm-Message-State: AOJu0YzzzqfjFQylAr+s5vQQl0e3pANqjdb3RdmATJY5wp94jLHWeCuU
	btmyH49bP1QWbwpx1CidknNuYDOEl4pPZrnq3SgEOzI8JzMPmIW4i/zyOeAkJtxUCKMvIC4Jmip
	IUXXDprKWXFg0858YM6PVY3WZjPAIhumLVZccqCznUMWbBJNrZWAaYj4MNYfkKEuf
X-Gm-Gg: AR+sD13lcsftqFCffIr74YYHk3RYb/Vlo3Z61yniEOZG21TGCT2SCeg1oxrOFkqmMHB
	43sthPIyL/b+1kaR4Q8h1HcLfgsxJ3Sje49diy0F7Gn3C2CCEI9rPmJzQc0uyzAZOpjPvwNObrn
	g+YM78wn6AeKfpuxxOVQXGIfAvXRfpqjqzRBJKLCYKG5mnGUGWIc6ueD1gnrUZHvrpWBzS9Cjxm
	tPMcRXW7L68IPz0bsQGtR3aYQnmek00cgYtNl/ccmpmDuTMowMpmx/MsOtJs1lA4AVTaCpbjAee
	UJBkhjJZOeW8Vj/yi9Btrw8E9CiJt8yvR9kOZmcw03VuLJvwg0iUs+L7+yyeDNq9upq/2mYtD4J
	JjyIbbCmhI+XkKZmqVbhWCVfNYuP+POCYASM8WTljcnGd5fFoZdy+hOHYQGwloOw+eLTsyScJ9G
	dWrLafyOORs0pM7Q==
X-Received: by 2002:a05:622a:1aa0:b0:51c:25da:903f with SMTP id d75a77b69052e-529a8712686mr69277121cf.59.1785098183247;
        Sun, 26 Jul 2026 13:36:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51c:25da:903f with SMTP id d75a77b69052e-529a8712686mr69276851cf.59.1785098182768;
        Sun, 26 Jul 2026 13:36:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f221873c9sm9690911fa.11.2026.07.26.13.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:36:20 -0700 (PDT)
Date: Sun, 26 Jul 2026 23:36:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Message-ID: <5zgabwyhxu65hacpr53cwktwe4npu2ndzgvt3uulja5lejnmi4@bj4uxp5wlb7l>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a666fc7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6jJYoImRxmWk4JxjxYMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: FddzKhFJ30ghLl9fSfFViF1kHU99Y7QH
X-Proofpoint-ORIG-GUID: FddzKhFJ30ghLl9fSfFViF1kHU99Y7QH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX/OX9OAMJ0ruh
 Jsk9awNuA63eKzssjaKb8M+qb3zoWS4r8pvffyqdya9EgSQ64+zFWQrk9YmgcVV4OnDttfQZT3P
 k5jzav65j1jwoY5uvWT5ss4IGf3xEQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfXz4lObCd2CMxa
 7UFV1kfbjKdg5FfdmbG4r/O3jFcpwNrHm9fAdKZuuSjw5qMaTnQ48dijy60IvYVtK9mYQ1YnUw3
 uxn+2EA9D6Cl5xEArrKVb5BdHHz0M64BZO2jvuXCtDiplodGf+63JQIN7YZZq+Fff4+tsSY4ilt
 jj9v2X4m4kS3RMKU2zGae+kUyU/kYKzHEAP/dlwZZYwchXNaOoRnC42FAMbMyBGMN2tb+e1iK9u
 09zlsE1wD6dkILW24+ZzrVUcKXbUfXE9lRPvVAB76+Lq4FYKv5ntuNO4sL2h/GSwUzoN32RwVk2
 96nrz8sfHpcg46myuGY4/Hbz5/Afgc2RW3vkVnEv6iU7jrcDmMQdf1gXM4UnbTD5RPOhrzMG5Jm
 6+RY5uNOLnbdfaEY/cS5xwPzp2HAp+SK5VKmh1Vnam+ATCB7OXQ5SGLR2cpm8UUxa/+TGHdZFHQ
 gF0aqeir8pV4ihkXG5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260209

On Thu, Jul 23, 2026 at 04:09:05PM +0530, Krishna Kurapati wrote:
> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
> required to know the type of phy (rather than the operating mode).

Why?

> Add
> support to cache the PHY_TYPE and add the following helpers:
> 
> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

PHY type is usually coveyed through the PHY cells in DT. Why do you need
to set it from the driver?

> 
> - phy_get_type() for the consumers (like USB controllers) to query the
> type of phy connected to them.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

-- 
With best wishes
Dmitry
