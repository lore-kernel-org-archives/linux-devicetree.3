Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540DD3C6A2B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871046; cv=none; b=lgosGnfJMWA83DXGNOI5ZWq5AkkTEP2/TNIS07YYNNKrqXBGeAxu3/OS6TMSeopGOsgo1nEwGgLlaihQU0p2Y9GK0t9o7XX6aRdsU57phOWpHQbeCJKrJjEs6RR++4ycj5GvX0+jhxqpZ54vougi1n4Au40kkxxKp3pLMtO3GYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871046; c=relaxed/simple;
	bh=rDDAI35LwY4vdXtKXtWrH9zP1Q0+G4S6xmDfjJPBWzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4PgUTNLKyo7lMwzAFWQms3dKxBNq4D0gt30lypFV0vHanFNLYlhzsFNEMIwL4dN5etjsO+wnPvthD+D7FnUtXjmMeZxXv/cD2mWbyHuvbXFENm2olvHkuv1Pp4kb1ewHR/aDFtex/CJVXbDMzZKzz6OBvCyyKG22Yf0B5HsJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIkJbBz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmoXuNBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIkJbBz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmoXuNBD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBEFtT1402699
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r6RhkK89kHSOIpO38YTi9tc2
	C368dXy4c8JlsfP3zbY=; b=HIkJbBz0ieHVIoGCufLPm64hoN0fXYu20kQJOVtF
	AmId9raNPnNU7EVev2gFirfDlHZ7dKyStwIkMWVuL+Ok8wZdsSr58K/fbwtSIlC7
	AVwi2NFc9CEDBvJ/FxbXXOY6te7RiuTCZZVRLzCsfXVsoNMtPJwFfB5jQU1eRjXP
	3z2FuFl1hJR7b1QkoXPEsym/SR6bdH5uaFcrGuB6eu4e7SjP+12Q3mSLfUsneREE
	8tCi2orf5r3nsjtHPma02fH/VvvOoDjUrYuw8JwZgqDF25BJM+s/9mgLp0EXSzly
	cbB6BFLsMCObTPkS6Kd/iNRIl7e3EKETNWN6UmGGLlgjVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4h835b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:44:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso84489201cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774871044; x=1775475844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r6RhkK89kHSOIpO38YTi9tc2C368dXy4c8JlsfP3zbY=;
        b=kmoXuNBDfbw2rb8k7jhU4mKSHwOnP7XqiF8MsgiMmXVm7xtQf7iFrnHvuOqNwFXzg+
         lguZR9wOEGv15eQlFiMhPEirnCh4FlX+9WWsDOA5ybtLAmIYQ8rXc5wuMlOIvz1URXdE
         NKlCTdEl4bxDONXeoZt+EodFK13tvpiMx/Yu1R7vTY8RwKJ3qyuM8iGmdm84I6SOc4Dz
         y7QrjQZD3o3d0zXS1VU9OI2UE6LbrHt5Zhm34+v6fuCLPes2PFoAfp7ovHQABLsSyEj+
         gQx9MIpnuGD6NAboDGXHL/pMdrGG9/lxmS4oqfP1Tw59PnF0d1kBDaKE6FxUXuogVZUh
         VnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871044; x=1775475844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6RhkK89kHSOIpO38YTi9tc2C368dXy4c8JlsfP3zbY=;
        b=kKb7EW+qQ45Fh/C8YkKh6GqXxm2UpKyGQ9zPmXIVE3ZVXRTI5OdR4rVrzmmKmue6pq
         TlDzGCdsf2L6RmRiggq4Xts9Seqgz8eC5ol3GwIB0SsqGXsQDJNRsWBhYz/h+m+Ut6yU
         UNouF0vq4TFj+YAMXBXesRUuOe8MeI7lFuXz8TemCc6cNV86T0sLDD644NGXbEjc7WdX
         eRTxOZD9G+83KTja2oN4s38Et8H3eeQDrSrmkM5lf9gbnsR8BqnKOjwU8qoXR2nnQHjt
         HrjPLFwo5+2r1O3Gy6tMcOTrBWp2qOI5RfiQddHocuhxxhxLO/GmY3JbBi4phHjvWv6J
         66sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc+r1mLpyJCaCqlsNK8lZGsXDTkcV1lpJY+INYaCNTAR6Gq41d8usyzrXixzeUFp1ZHzo87kn5qXR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+KYsdy1+UCByWmDYNPAuIKGQrD21h1u2918IZAZUVEx0IlsxM
	0/bHQS78V+MyRnmyEcQBuOlZGCi8xZlPlf0H/j+Y/JDeNGAKaSaJ5h/9CQFtFJbT4tnh0nYnwD6
	z2Af09EQb7+/N+k8S2eqFIQuHOvv5V2GngHMeewc03AAjEaDIqf4W2U50deyDMquA
X-Gm-Gg: ATEYQzw1OiHp+OljO4ZF5W4Cd2bloGbPm4dR5E5pbHRO/5+UI754/YnVglDOggrvLos
	UJVumGFGeq/J3RsimZu3c/Bi/v/Th2hWWrWzWLT/cEl//tmMIfnDXZo8QRJO6+bddu+FF/ddMqM
	zs7GNd4mweRfI/EYjFdK9Zetfq2M347w/idTyewKnnryh3YAZy6O2E4Sz3mdBgEtm8icIIdtyCN
	b3OmQ7E+KYixt5HSPK/3TT2M1G7EPnUhr7S+31qLqNN8SbQdIGGox9CX5xiyR7ylu2HTveg8VnC
	GqP8MsxrRZobZduL2F6Y1a8z+yfdSGhQCsMeNhkpZLdRAgNJarf2VNPknPhgktwaPAZ1iQmRjEK
	8F9NNt92ZSbjNOoJ6pqLftazVFCi4WcVGpTw0ggsX8q8VANv6p2/C0WPEj0aFH3q4kUn+mlUDKl
	FKgUlYVjSnNj9mqiGX+1bwLCWyCdJIXuc6Nj0=
X-Received: by 2002:a05:622a:114f:b0:50b:54f5:f769 with SMTP id d75a77b69052e-50ba38098aemr169211731cf.14.1774871043733;
        Mon, 30 Mar 2026 04:44:03 -0700 (PDT)
X-Received: by 2002:a05:622a:114f:b0:50b:54f5:f769 with SMTP id d75a77b69052e-50ba38098aemr169211341cf.14.1774871043306;
        Mon, 30 Mar 2026 04:44:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403e64sm1613119e87.30.2026.03.30.04.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:44:00 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:43:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/4] usb: misc: onboard_usb_hub: Add Genesys Logic
 GL3590 hub support
Message-ID: <yuefg36ebldf3te554fwb6jo5h7gwa5csvubzqhhypbjnyxi22@lhfs2x27mtdg>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318040644.3591478-3-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MSBTYWx0ZWRfX2dM6maNQe0oA
 b/EY7tRHLsQcCCP9jlzpschxyzTI6eCs/DlazUBUWN5d/WMsYAXxQkR1yo733FouhNKvZRhbH+d
 1CGDkl/pl1OdqqsTsvynt/kUI4Ufxwq+q8dOMKliFrmDep0DnY9gnckUdAVStj0VYbl5i48BKwS
 y4Jb00O+m/l79tgus4uF0NIm+AsH/v9hWNWmSHAwPW+zVeKzXrHUqoTZVjWZNwaXoSicCpBJiQT
 1GpSKWya4wM2GROsDhfSfCqOyxHjrppodhFNvTue3lpOnYWE88bfZd1i2lh9cWu2U/Tg08SkNby
 Mc+vvBtp+7Sm24bvIeZhvwXM6mWWlAxUMzXlj245cABPPxIsJ7ZUOfW/YFVzzYCuDowWr0VT75A
 zUSN2Y4UcnnBM6xuavKXNB/14vxJe+ZdZGsLI8yKyXuxz1hM4OvaM+anUHBGm3yS7TJuKs0M+m0
 a5GOFmIVAgMZkThtEAg==
X-Proofpoint-ORIG-GUID: 3XGNdqSy6ECq4PsBcRmcagA6Wq7z42Wl
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69ca6204 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=X_ZM2WFtZuAqk53pdE0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 3XGNdqSy6ECq4PsBcRmcagA6Wq7z42Wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300091

On Wed, Mar 18, 2026 at 09:36:42AM +0530, Swati Agarwal wrote:
> Add support for the GL3590 4 ports USB3.2 hub.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 1 +
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
