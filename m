Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EDA311C2D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 20:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863067; cv=none; b=UzGAU9qZ7ZZwewxUGwa6MBMQx2KyZkSpJwNB2+5rW0TqafG1HvdWiEanrKHCKpjXmD+HukEiRLNiS4OroM7a5TAJNxl27uFS4TDFg7W1a17IppGkfuUe+PTiBvAYnMvHqKuJEPjf8PhTq0rNgswDJhbX+dydql1Wg0/aaxcGBGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863067; c=relaxed/simple;
	bh=UR2bcIZ9fNj1oDZPGcdtMwxjyHrfZW8APyEZsxwXSV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq/SmPmEmb4p5pnBHxzioVufVq49hgP17lMKC1SvDrUneRkCf2tb84Hp5uR9F7R6FHib2Oc+moUzc3LHJXAq+d7EeQCvhDWds0+xp2jw/ou9HW4V+6z0f5yxLdYtG9NRwJtlSnV9fGl0jsGrA53CJ0oSLT/XFUd/fmStXgE7UUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZA/I6gE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAM2iBS/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZA/I6gE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAM2iBS/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElSrB888442
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 20:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VH3iAh7MAS/nClNrEAXyxrKo
	p1YZ+KC9P64fMnhqna0=; b=ZA/I6gE7l2ZhU6d7hOxQGW+0oB0wTZbJa18oFUd8
	HAMzmuntecG3U3vlojwntYoYsOkCq+aVy1NjshfPgXNVaD2i9VG3pxReQVq/+wKP
	Uo4zfNCExC9nOBkeaslcGN/V87mt8Nz7lOGfI0ldZCaSt0GIyyMDYw7Je5v0qTjj
	0X34LfqHZndK2Wyjjuq2rpK/Zdp3t+pNdM6NTCb0lLALnw8TNcHgImLBhj2k4emf
	KJO202/MDxPCVDaVqMYkvj5LBITFUG6GYYCSryx0uxP90m/YgDDdJbCPl8F12Git
	28npDIAf/TDZL+5KA+5JHxtirWpUXB4xRK433OSjJ7hVCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w0d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:11:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517582695d7so87378911cf.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 13:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780863065; x=1781467865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VH3iAh7MAS/nClNrEAXyxrKop1YZ+KC9P64fMnhqna0=;
        b=DAM2iBS/uXWAF/axkeMLc8mM3tZ80Tymm5ZrDvsnLxzR8025tXv5zaMRcX+hT/c8ZJ
         sEQMxQDyQIHZMBYEdxJPwr3hr3ATfy1sEt82770zI9xAseNOkEKz3uzfzkwv1IXwZH/O
         5LbZQQrQIOAFuC1ayeQdTrZ2vyrskwsCrK+oyHjJDi/rAgBe5M4vtncbNS9yhQ053fQW
         8vtl/JzmuRh2q/aihYZWjnHwkRnAEedYcSyo7XgkPQwwGAZMmJ5HgS+Z0fJjfLbwPGXn
         jPiRv4CBLrws4hHSjiNt4W6/6CyF5dsoTLz49Kaa8ZdVeYGgAbgzFamggsdLQBC55W/R
         xdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863065; x=1781467865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH3iAh7MAS/nClNrEAXyxrKop1YZ+KC9P64fMnhqna0=;
        b=d6r+s98zMqcJ1+rDXDknqS2BnlFSZU1SjTw2OwY6mEPa1hCPBGgERspbxvtBonjmEn
         e8nSmmrlBGTrgtBMF1cFJmA9MelMWedr2/di7TW2XRESMKUuPMwOIqXvodwRLfyCGbmV
         7f+4XV4MQC2U9MIJwBzLMzw7y1lMggWCjq1snjQZ4JqYyBve+3GmPD/8NDW8riYu7OIX
         SHYaZm/XFTa+yDlH0ysjaopjk3ihZYkyLfc6Z6+5JWscH8AKkgocQs1rwxJXR3xaZThN
         qQuw5YwO28aiQn/okeuOr8sRH07LAJz///zDRUCoqRY/ooyHDfadBTUjxfMI/KvSsOyQ
         Z3kA==
X-Forwarded-Encrypted: i=1; AFNElJ+YJI9y4lwBZcWPjJdjk8dyoP8K9WUyZT9j+V+sR72e5zl+soRrU+VJnI5spxvn6oKUxtSgpnKAV5AC@vger.kernel.org
X-Gm-Message-State: AOJu0YxGi4ofX14u9xWgsRPbb/6DpyzhvvoqnPw+mjMESxskCH94hefN
	DZrqLwwwjSziptNC+vLXtmk4yTxlCnorCTLH5onyoBooXY45Lyp6x9GK3C71OIu+/3MqykQN5uM
	gDNqv3P/tKdSLLg+/vto4p2klWaxktjiRkY8w6IK/miwPEa0sgiwQ7e3g5a9E2vrI5kdGf4mm
X-Gm-Gg: Acq92OFkmrmS9Eir4mAg5Br1DaKsTNEl93IkN2MKaszjSx2wmyVW3L5mPz1uy7V434E
	LhIibNgXeXMYSnEmSUwWkVVrVzpw2kKkV3BXkkawtEc86dloOOoWEPt05Z4c11guOGOKTvHEbxn
	U8WW/Ctc4RoWpycahxbXUn4yZvF3YAW+INUM1BZhVyAL+347Tz02ai44Vn0hTxNt5lZkkkBFGTg
	YUyBQqta0Rfo3uTJocyNTXXuJSeSObXqPZsKVc8e74DbbxiWUioZ5m7suNWapNodCnf1DzCbJB3
	U+zm+2FQoUW8QbrgqDtYYtNhILGTCZhtwC2KEBzA0PObMsv+10OeSSr8ErSlNP20WARzMXKXe7t
	396bDxW4JQpnJsQQPbDhbDa4Q17G1MgWSFkC3m1djaXDPHY/379q19Zrpz7vKsXLPNJxKFjyP/e
	6QGeoHvF5OC5VFcQOOgsE3qjee3s/o1v+qFUHOilG+nb32Ig==
X-Received: by 2002:ac8:7d47:0:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-517986c5482mr139898631cf.13.1780863064929;
        Sun, 07 Jun 2026 13:11:04 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-517986c5482mr139898361cf.13.1780863064555;
        Sun, 07 Jun 2026 13:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm41825351fa.28.2026.06.07.13.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:11:01 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:10:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
        robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
Message-ID: <y23cvj7jmfdysybgw7lobud6mlgacvr62iagqimn46i4adsdbq@xkeh6z4qvktz>
References: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
 <20260602164512.9F1CC1F00893@smtp.kernel.org>
 <35f1ff50-74f5-412f-a52b-9906fda0edb7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35f1ff50-74f5-412f-a52b-9906fda0edb7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: l-TCJ7MqzYnVLbn38xJWHeuB26bCnYsh
X-Proofpoint-GUID: l-TCJ7MqzYnVLbn38xJWHeuB26bCnYsh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMiBTYWx0ZWRfXzKzFgy2SiaBZ
 tEhZp/F4nKVfcG4uFna9rzvsE5qTu0zxeZri1cQepLFdjuw8AnxooEhZbfbExpk6849sQLC+7yC
 4m2UuJf7gEIDUfFJTyUkIkFc79JU7H9fuiuyChzpDJHgcL9HWsJYXeHvbfOw/1Be03wmLY1i8ah
 6+9A8+BkLZecLYTGfJHbwMdJ0a3u/fWVMwXAKLkyqMAc5BvglP8+WmJSJq//j0E5x0ZuZl9ClN+
 DZafZmR+Lq3T7qI7HRk4y7O1Z0t3nADihKaA8zjgAfOyXglKb7JXZ8YLoXg6X8Rs5cUm7Pj1yDT
 5MBnFPmM88Eufc9y8pedP5QWusbk8Q4gsoaueGGwUuTtdY5xasbdEtuDoPkyQH3GpzsVIJQKUnT
 N7xx8bnLDe0JhGwPUye5rIsc2J7bWPyDN+jRk383+4BqJCPTlSBQVLsjsdZE09ajDJKoMt0d6fh
 wQvDr4HuAv9jEDibSug==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25d059 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=-9TPMfOEyAajJc7o744A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070202

On Thu, Jun 04, 2026 at 02:28:03PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/2/2026 10:15 PM, sashiko-bot@kernel.org wrote:
> > 
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> > > index 79ec77cfe5527..7fcf632e289f0 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> > > +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> > [ ... ]
> > 
> > > @@ -46,13 +43,15 @@ &pcie0_phy {
> > >   	status = "okay";
> > >   };
> > > +&pcie0_port0 {
> > > +	reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
> > > +	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
> > > +};
> > [Severity: High]
> > This is a pre-existing issue, but does moving these properties to the
> > Root Port node expose a PHY initialization leak on probe deferral?
> > 
> > When the driver processes the port via qcom_pcie_parse_port(), it calls
> > phy_init() and then immediately calls qcom_pcie_parse_perst(). If parsing
> > the PERST# GPIO (now added to the port node here) fails with -EPROBE_DEFER,
> > the function returns early:
> 
> EPROBE_DEFER will be returned when the GPIO device has not yet been
> registered, which I believe should not happen because the GPIO driver is
> enabled by default on the QCOM platforms.

It can still be disabled. Please send a fix, it's not worth keepin an
error in the code.


-- 
With best wishes
Dmitry
