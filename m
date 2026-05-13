Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626874BCAA9
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687660; cv=none; b=pOgiLbNYuICtJgNlvbwleQfACeX+ck1rPwrs/FBogNDN5zXcFSBDAaPM9eN8DXK9alYwUjy4PG3oGscIE5NBz7w70YL5e6lKpv2y+GVI09vcvQbRKujcYMEZ5c1HBVr+sv2rcHHV+eX9BG6S6EGRV7s6r3cKydX4iaWmNSifEME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687660; c=relaxed/simple;
	bh=MRJ8g0F28i7tTvB5DB7EwkSRP7fsko+i5Quya/vT4pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5KsOgZuVkFxXI6oG945krRwIBVGdezsKDZDeakDGu+fOIt0GPsD+56A073F2dZCY62rUlY/h8wLTICVNNeAM7jFoSzEVnlAYrkkO7lsBNWc5ie3POSsp+3NeYb16mKshUL4tOuFBqdEq/eHHVSWWUrg58THIWbqM367HnbnQzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7gAsYvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JU4zQMxB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7gAsYvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JU4zQMxB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCU66V2965303
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=; b=X7gAsYvApGS+z9Rt
	TnNMVm0256GHawyhFMcb4BlFUWowrdmntRtghlTVq2XHEXyqGxohcRd94gaTu+zO
	ANiNkee5FveAgHngmge6BzaPYk4EyDdsvuhxgiW5hFOHon5yp/i8nTKZdQKQhMR6
	1UgurvO/6lKvZUvacPCmPZ7dYSZKWFDraErEOpJ63eoRbo4k/y1o58kSRKIb6pyQ
	X1/9weGGlIdborSDO5AfPCqkBCTdbdU6mN0a3H7WgXY527YJNlAOOcnozSEB5MJQ
	Q10IAuW2yV/fMEf09o5NZXSShfnrfNpmQzQjzm6hArQaOunQ4H6iD3K2AwskH8ET
	QKWPHg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5a5xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:54:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95862466f3cso2128919241.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778687658; x=1779292458; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=;
        b=JU4zQMxBdwptT3LNERPFypK8a7RFnB4HnDdr+dtrrjoNzFXjhCmgompFtfbJIKm9/U
         OBlD03GKsTj45E/WQmup9xhPAa6ZGsX/DTmkvknbZ/IN5GVYthcO9uk7yYBBkaWUXNnC
         PNDx1h5YV/GAOxDID5SVxo2yGvsGvc690lh9ZLqWAhZGaHBXDzNU87jkx3SoCY2XN9qL
         R6MlQR8UvuzJujIpaMfVNOqG7iftnaxhLR3MDKmXmy2EIETR5spAWmatAhwm9t1hlg0d
         0TJfIGl1P9xr6Ke/7oUcqXfpgTLhu/NEwbEpZH84ugVXZYOMUeWYVjP4SbrZl/rBQo+f
         /GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687658; x=1779292458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=;
        b=DMZdfx4Kke/S+N1Prre9NGCLa9WAVp3n+fltLaMmgU42lzZCUF7xBqfc08B0teI2EW
         yvFjFwI39SoKW3nyM+sJOMTd3fA8Iaz51WzozrK411BRfVeccTkES1QngZaC4h/mdRJL
         Sldo+59g+qOISMvn/pAKApoQMBtQE43i/Ae8Did2zv9KHj7E4eHW3ciX22CmTQjuItrc
         9OrirHSau0fxkr+wlA/qSkZCnHMCMhOAaCcKWZ/t8fdMM6UJCGRI6v4P/NKAaWtu36bF
         C/zIXgm3PjKQFcp3i+uUFqZlja0xLdolRXYBtEHOjbd876IAM7Y2keZQzXMryiZdaMRx
         HDSA==
X-Forwarded-Encrypted: i=1; AFNElJ9K9M8zd8/nqvP8x//8PObKBSyZuhNTgq0egN+jMpUZgxUzh4iE8IPkMalzQrN9XzTgopIJpf8JXGrE@vger.kernel.org
X-Gm-Message-State: AOJu0YxUD+zjMyoTVVwv/9UuK8UP2IeqzSXu2YWyIPGLgKxBaQdD4d/u
	u18oMtkS3A9IdukduKygpvG4NMEFx6/xaNcAnRt4MmVFnvOmsR5R4CONcp0Zt3sMIP8KerBFSQr
	wbyvXbnOctWO4B9hin+55jwLh+mwRdUIuL3McW6MaZlgWQi/EyUUWNqUn+IIIPxxT
X-Gm-Gg: Acq92OGmk7srzeHV7Vi6KUNwALcXF28mYpfG2Wdk8IuKzezGzWPgKaTw3Gw/4CXdZ7W
	R6xViiMfH/kQ5zTvUMEPS+Qalpu74OrL+SBE2W2VVx5RQls36W9s9gIq7mAvz1EfK8EvfMK3hw3
	o5k6r6RQM5Ws+NT7ysRBMT+oUNTb+G1EPtBgKM9dPYxYDsA/ydY+MyDuh17Xu2LXlBLS8Y+2Vxk
	G3z2qXg7vBY3L/+qyFhcKBRbyq3YAD5/InlDFKnVQ2RqJFWtCj0ohyYlNDuS8Mei2LsCTqAplfr
	IiL8qSgquMje08Ld1Gu/fcEPcGYtKBmhrKV26RMuytiLADgtUAxIDE3FcAscgzsk/tlPa8o9eCf
	BB7hC++oZtnlHFw5tJkJQRHuShx1b+cOl4QUUG5exEjfN2SF413oV6uAHR9FFZG+Hk/erwLhCk3
	16KOhklClNTOq/KQxldqA2XP4BNuaKn6iz0xs=
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2051097137.5.1778687652718;
        Wed, 13 May 2026 08:54:12 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2051076137.5.1778687652271;
        Wed, 13 May 2026 08:54:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b325sm4032979e87.79.2026.05.13.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:54:11 -0700 (PDT)
Date: Wed, 13 May 2026 18:54:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linusw@kernel.org, alexandre.torgue@st.com, andersson@kernel.org,
        andre.przywara@arm.com, andrew@lunn.ch, baruch@tkos.co.il,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        gregory.clement@bootlin.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, krzk@kernel.org, lee@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        paul.barker@sancloud.com, pavel@kernel.org, pavel@ucw.cz,
        peda@axentia.se, robert.marko@sartura.hr, robh@kernel.org,
        romain.perier@gmail.com, sebastian.hesselbarth@gmail.com,
        vincent.knecht@mailoo.org, von81@163.com, xuwei5@hisilicon.com
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state
 and remove redundant startup pulse
Message-ID: <pvwvewdkqjh267qwven6gs6tptbrmj4et5ab23urfx3jqiqlgp@wl7khtx5go3j>
References: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
 <20260513144414.244968-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513144414.244968-1-jerrysteve1101@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MiBTYWx0ZWRfX+N0/CiKiIGRq
 /AfXByYdhTxSCZfdxa5l9GhvMzLbiKqdh9/zPB2N80X/HAq0xgcZ8oBhXHD+1CB7OIpU9hQL+LY
 Rdlo+RQOBaQVbdIy+q0lD26ggCTJoa5puyDS+X4UrJBs8mLSZwn0LGlMgoqfFvadDdznfIC2Osr
 866vOY0ocPX5s37G25PCmG3oW3LoONDB63XQ9YoL66Ar1kkuta3nkbrc6/PoT/J+gzMbWlyy2AN
 U8n/oBn7uk6mQRmDGeWD9m9neHylUkzQ+YKID9r1dsdjj+QmlnUNHYwqMeTr2kwBTGzW4tXtdus
 YZiS7g8EfSkUMFZIMnT7oFfNYZjd/SojbvP4luAU6p3xsSx3tg7HMAlwUCBZSXFwi6g5y5r0dHA
 68WMrikBkpJNsn0Nol7TbEx06Ku70uSsAkyCvmnIkNKGU34z3DsbQzAcg5xZIaSs393VDiO/haj
 CpoDMiUCoxKUQjCSb+g==
X-Proofpoint-ORIG-GUID: 3WnYkmCvWIvhJ9s9ULZhbUqXPuDPpCLL
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a049eaa cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=-Ea0i9WH77qr097UAlAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 3WnYkmCvWIvhJ9s9ULZhbUqXPuDPpCLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130162

On Wed, May 13, 2026 at 10:44:10PM +0800, Jun Yan wrote:
> > On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
> > rote:
> > 
> > Have you checked any existing device trees so you don't
> > break something here?
> 
> I have modified the problematic device trees and CC'd 
> the relevant platform mailing lists as well as the device‑tree mailing list [1].

The biggest problem is that the DT is supposed to be an ABI. Older DTs
must continue to work with the newer kernels.

> 
> [1] https://lore.kernel.org/linux-devicetree/20260508152435.21389-1-jerrysteve1101@gmail.com/

-- 
With best wishes
Dmitry
