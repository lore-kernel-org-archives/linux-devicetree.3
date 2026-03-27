Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E503890E5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645054; cv=none; b=STMAmKJTV+eGf4I0bJm16zoPH5LxKkKQf7w9lq6bLLYmT+uxyDYHMD7aPgUtBZzfJLefYaWGGge7rbcJSa2MyAt4AYxwaIE9F68QlCVCOfI43lxX1dnppGpNbTJfp3fq7E9fCJAwCdp20h17uvYy0iVk1xZRq0pdIlsUrkgJDyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645054; c=relaxed/simple;
	bh=xkY3sEVUF2rkeLsbj+BFNt9j52OpyLbH5h8LqQDzXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es5gs/sODNiOIGG0nXB0rQlyaxSGZXEXJdg78ji/3Rq8dwOiCb8NifP6fSI8XdSGFfl3lZByTc83r3I8ZmAWXxgoQhGEbrpsQohuO9kvWf7x1bxQcYsN/r4+3V3YxEpVUAIxpZN7911xHTE9K27BiYvVufjJto/Vr6n5az0zOFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdUM0fI0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSFWPkrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdUM0fI0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSFWPkrr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtIpc3503949
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hTL8fv6F5+YUvvE9I81wouOi3oe8icc6uFeLj6rzIg=; b=TdUM0fI09AxvJtGf
	FcjzjcRSYewmqVNJ38IVNdKBO7SlsUqhrtmrpJtlTpUwRRwj79m/AcukyY4HtVXc
	yEFIVR+vK5UCi47JIcnpLBD+PclvfJ3nXvs8w546fAu9ZS9QCiyd/a3m6YlHeTj9
	ShhsKJt7IpPEJzuZwa85WF/YLIdlhHipo7GoC16VSfG5a8FdLkBJz1/zlmu2qCiH
	6bHru+G1jjR4eH1Zk6zfjar6NwZGvcrx/bAwwGLE9hWy40zBuwaUIcxbd5wVIX68
	H8wB4h7T7mwQRG7aN+Hz9U2Eb9n4L8xsEY0+QhdqrUvjSqs5sdZ8T4HJJSff8+r/
	jRgFOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d60fkr4wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:57:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509070bda13so90916271cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774645052; x=1775249852; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9hTL8fv6F5+YUvvE9I81wouOi3oe8icc6uFeLj6rzIg=;
        b=TSFWPkrrWP2Z43yTxRkFF9QRY/3Eq8rBFHNxmisGOx4G5DeChmUu+v7/UHLhbhX787
         87igFV8ur75+wbrRF1EgTYxyE7AKudA/CVFkKvmaXFj812dQRxP6fAgKXKO1ICCRGTJg
         lcHUUdhX93J8S8zffa1tCoYkCk+qaiY2/c3Ng8Pwn80OzVHK5StaTM7nIBYjaFM1r9F8
         QIl8y1lJICMUq4AtRb0MQTRXF9fbNhTqbJDYLKAskoP3bDM5qxbftsHSN935yZVvfoNF
         5QDM3r2G48CBsN/bvMh3qn4tw1VzEQsdFckI/PbGegOxbxdxjlIT0PxBYByLxRWHNL5q
         ZEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645052; x=1775249852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hTL8fv6F5+YUvvE9I81wouOi3oe8icc6uFeLj6rzIg=;
        b=nyc/eDV8PEgp76+/fd7XwPdG0HG96O2G9+Fo002Pt8JB8vjOX5OKyP9aMC88DI1swE
         pZbgltvsyNbDRsNlc7xotMUfaNLYEiAv2YzGau3I3qt9UvZAjmDoXlkK7bxcKPOW3oNu
         +oaZYIbDphySuzOP7Fj7j5ABH6CSaf8GALBrUaM+hE/0eifJbgvvwyHzk23kTOBrW+iO
         EP8JtysY+0NobffKG39tDkTYzwI+nBFdtZCjJQ80tZBZYxWQgc+1qTX00PVr4QLauJyR
         1hBZowQrX/nPtfPkYzDpwaNgxAaOS3j5YCL0BLaEUIMXjzDLJuVjtAKTco2tT8YopgRY
         xf3A==
X-Forwarded-Encrypted: i=1; AJvYcCXCPZYDmwhG9ErUe4ua7/cr/RbTHchLs5nqOxLO3SYDfpKh8oy6NZL70J/O9/qoCsLrRhP6hmGk0f0w@vger.kernel.org
X-Gm-Message-State: AOJu0Yylpad5hD4xu40781krnwfX5A/jI1hhq7ddaG/BnfN72fxWKmjY
	3uos8r/FIp8PryCsN3tv082YzVPlOI2rPoH8HwMkGzsj9Qa6hz87966F95YTZnzbD+xz+ferzEd
	H4t00GAAw4CXRcCpWYBsZE71fJyxYP/zL3Kjbm6oRQ5KL7J4gS+LoMFDIyCOrBWqH
X-Gm-Gg: ATEYQzyiv99KT4rv8vZQCY8TSRDxPhxaZRaS7dwpCHAtwVqnpXA8VUv4F40TWXl7968
	PIooTuZdvT7QVXnWHMw2MtUzQAFpHHE+nYiGoX/9AbcQF9Qr+UNRP9KEupWSQZ+N7wFk++YNGW2
	KjBzCznAciuDAyf37mfNf1CuZNVfrjTQC1TD74O1aATe1Aw6DK6HZ2qtz5iv6HvPEkZdm3lsAm2
	a+8N0vgi8vZRSw+Q04cDMLqmkbAoc0w+pAaZcg/x0JiJb7tgtt0Kust3343VsqjZy6VS9MwWXc7
	big2a/SgPwzvhef3ikw3Gnp5yxuDHYsdfE0VMu0OCCQ6izR16oX4iy0hVxO9+7LwLFzAgqmLKo6
	m5cm/RRLgJhOEq4f6HbNynXl9CTedfQOXKs2XgOLmv2d1O5IPRqfSQ4RQNHcWcQAkEVxEPS90Ip
	Totamb2QFS2c6V5jy/o9hCU7S+hz49Qk95Jr0=
X-Received: by 2002:a05:622a:1b86:b0:509:e46:84ea with SMTP id d75a77b69052e-50b995172e5mr85163351cf.34.1774645051676;
        Fri, 27 Mar 2026 13:57:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1b86:b0:509:e46:84ea with SMTP id d75a77b69052e-50b995172e5mr85163171cf.34.1774645051210;
        Fri, 27 Mar 2026 13:57:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm731601fa.23.2026.03.27.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:57:30 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:57:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <pnoln5mv27yuwirh67x5slhvswy3iv7q6tlzoj7zvaxtrpgtgl@bom6zvjrbkwi>
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
 <bc6abd24-d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com>
 <27adcbd2-0ec3-4a8f-84d6-ba381a66772d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27adcbd2-0ec3-4a8f-84d6-ba381a66772d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=U8CfzOru c=1 sm=1 tr=0 ts=69c6ef3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=dqlpYPTLeaRY0p4CLEMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9IhqQGQ5h2owfyPcnwl-ghgtQblcuYwh
X-Proofpoint-ORIG-GUID: 9IhqQGQ5h2owfyPcnwl-ghgtQblcuYwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NiBTYWx0ZWRfXwxkG0Abc8DHL
 OKLKAK4Cl83nWHLAIkOmiFGN1m4GfDS7IwEyOTEJx0IRHxM9o68BRC39OrIU1tCefndQ6V1KT9O
 PzUN4PpR+QaURhmxjtfazVR8DQX43WG6BDGtq3SH4YsgTN6AYZC/jEJ5pzFwMh39DNG6atiDSRD
 PZL+H/Utwq+kL+P2EVt4D4y7LIt1fvrkYNKG4LhEW+umbHDUoOcneB0Qr2By/jHmEKOCBqW4qtS
 NrD0He7Pft4m10WcPv/bheVR9AZxo5jhV0YL+bbQkEnT1hJXSeFk+OAnrf2hOnT8IFxmETdMDCL
 ro8pGEP+DCtYIk87xCQUDR+ZrslhhGqSSszbXOxmsZ1AK7zwmk+iozD7ULrvB2CcESVYFlOdFGZ
 n4LH/+NzCNbS05xYOa+fuF+j3QMn9TbHelnWKTQgbk/KonshRDPWgkda237mY3UOeUYF9B+gO/A
 hhlfqivifbse9dYSfRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270146

On Fri, Mar 27, 2026 at 11:07:53AM +0100, Konrad Dybcio wrote:
> On 3/27/26 3:23 AM, Hangxiang Ma wrote:
> > On 3/26/2026 9:04 AM, Bryan O'Donoghue wrote:
> >> +#include <linux/delay.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/io.h>
> >> +#include <linux/time64.h>
> >> +
> >> +#include "phy-qcom-mipi-csi2.h"
> >> +
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)    ((offset) + 0x4 * (n))
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET    BIT(0)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE    BIT(7)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B    BIT(0)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD    BIT(0)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)    ((offset) + 0xb0 + 0x4 * (n))
> >>
> > Hi Bryan, one minor observation on the following macro:
> > 
> >     CSIPHY_3PH_CMN_CSI_COMMON_STATUSn
> > 
> > The 0xb0 offset implicitly assumes a fixed distance between the
> > common_ctrl and common_status register blocks. This holds for the PHYs
> > covered by this series, but on some other platforms (e.g. Kaanapali,
> > Pakala) the offset differs.
> > 
> > That said, I think keeping this fixed value is reasonable for the scope
> > of the current PHY series, and it does help keep the macro set simple.
> > It might just be worth documenting this assumption (e.g. via a comment
> > or in the commit message).
> > 
> > Alternatively, if future PHY variants need to support different layouts,
> > this could be made more extensible by moving the status base offset into
> > the per-PHY data (similar to other register layout parameters). But I
> > don’t think that needs to block the current series.
> 
> If the register contents are generally similar but the bit positions
> and/or reg offsets differ, regmap_fields may be useful

Or platform-specific set of macros / reg accessors (as it was done in
QMP).

> 
> Konrad

-- 
With best wishes
Dmitry
