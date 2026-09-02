Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6014AA004
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374486; cv=none; b=aETrjT/Guua09QCr9mfU4vp1YONUSxHxcq4SS8eAbPyJ4A3lR4Sb9+heK6CZ1UgwfjmvoqA9mQJysU86jP0akpeqe4pqqN6UN7UIg45+cSzgL4vgwAzJx7cTpuK/ZPIZ/XZuboGYfp6NtT7XftBF9CaWb4Im1X3dXd7UsPglmiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374486; c=relaxed/simple;
	bh=bZzkYVOxPb/HDFkEYsrP2nDsHO6DSn3nXC+vPFlkU4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X55gQdavGRVhNHcbzMizCQ/nKPvi5VxDqW/xEAP39hJnlq40/3GAMGXSUjHCbLkaQ1LPOER+syuzNq8WCdo2q6plZvRRzpMkjnnUIBJf1a5dHXUl4UDP0o5VGiQEgCPmUReMUflwDXGGTgjCVY3ijh32jHhhiRlDVvagfQQa6l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcs8whjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNFKlEy4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcs8whjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNFKlEy4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqwB62104779
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 18:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COk6vE2ve/I1mCw550knzyWX0nlFehDWi8Gm0jd9uVY=; b=bcs8whjzqR8+fxr3
	eGcVtbdu1rEc5uC3cCOJlNz2CeOo5VoDsWp9cmmFTwl2okzLeXniccQslCt9DErP
	qi/tQ86A4+XYLTfURbmgeuTQ30cQPRg3VHG/oAZjwQRVPniXRTzGcxVg+wA4Kf6Q
	t0wMKD2q7ZcVM8R0cSn9XnaxH+eJgReFWcJBYW9tzshni+d/d+uC2ZvAuvXWcGpl
	fNkdYV0bErSXtuNO/KGSxncOjxETQN1PgM+lnl5OTyCf/X91WKSQ0fwy21zBUweB
	R8cjN3FSgEbSol0Zldxhg26RIFMIW0hQylnQFquD5BTzQ1hTmxYHiK9Xy+HjExVd
	orhZPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrds2sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 18:41:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so2858917a91.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788374483; x=1788979283; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=COk6vE2ve/I1mCw550knzyWX0nlFehDWi8Gm0jd9uVY=;
        b=SNFKlEy4Yj2Pofpsc8JMTohxPyjbnCTN/4RlFE4JY1qNHLsYfJeQi6/uh/PYwpHEtU
         nUl+7GDH5oxaXjVt3WPun2FmODs2ZE9svifX3hNxjibC9/jF+p9zi54epHSrIXuzfvA2
         IYpEINn8BsPW2y558hIJzL892GYb+b4/t+iDMwMMZKJ3a+h3HtbNFHW4/CL2KLU4paEb
         zCa2cl3WVZhJkHQYJf9/Ogr7YT3g/zeg6sVMan1tHjGfJReOC48JNEFHtbFTPRCtRAuG
         9NUYsA3ZEbuvQLMpTg/SQ/W4EBho6pWPjvYSA3CCjCj+EhKjpHEJBMhusGYBAAK2dZI7
         brTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374483; x=1788979283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=COk6vE2ve/I1mCw550knzyWX0nlFehDWi8Gm0jd9uVY=;
        b=HiUFeKnCoUzzWGE9f7VlXAZaSW0cUPJrSqKHxbX5K9eBlYgg5HuE8GiuVgZkGddO9a
         NZctbHPnNn9abN7aAwG+iq0fMqpCXwnpkk4TbeE5zGFZiGD7u+4nKFfsLtzUfK6wScvH
         80NMwjAqT9n4cqsD8tbmCIZOYLto4YgnmIzEINWqOH4XL1H7JQE7JtCp6yX65ObTz5Tf
         aWQTo/prn0BHKXn1dUJ47alUVPggeBr/FWn/MFtMLXtbc4Y/cBsrAg0b4ZQLh3sx8Ngf
         I8gisI7xnALDSg4egh/WyLcapEioFjWBo4UYqIrBwG6NgCSmIVqqd5YUULaE21hSPn2L
         Z3Kg==
X-Forwarded-Encrypted: i=1; AKwUvBw7H/csvkZQgxXjPLmH7tKV5bvsNe1rvYJyY5Z5kMGEtTOmi1Hl1KL3sZ+9dgGZtnKMahdVCy42Y4od@vger.kernel.org
X-Gm-Message-State: AFuF++mb2OlzlcKvZotBqCBrFlNeC2IpwpH9XuHu0i+pqPiCc0X1NlSH
	JMRotaTpqaMaZR8xYsj91L6/hTt88edBVpdWupTg3u63YCP2tDsGQI/weDsY7GDGPZ7KmNoqiKA
	UVW6lJbO/1a2aOg56DGPpeyWsgBO1cWfML6AmvfrWCPeltIapUIsO/d1tMI+5FNCv
X-Gm-Gg: AYBFou0zwkuDxnP340qFq4zoKcrVwNm2PIBZNTY3wa4tWsVdSIqJng1O+nIj0vngqwc
	DYC66SPs6JwAbUo1t71K2nszYibJx4zTsGpPspgssKBclGv69Duf/YgeYOEjin4ZyG1tuINP9Vj
	ld8GnQpOoA3PBUL8wd/ZE+vVS+ytCAS8E503d7KTxgFRsqC/bahhaUWfwskXYBqTro1IocHXiYE
	kKP06bXSvX5flN48KpWrIkGd9btufD/l+w6fJ1UfKVK6mLygIHMq4AADN72HIP1XRQXEHr8OaVd
	JVkIj0ErFY0sJc8iR7O7t3RM+kzTBQS3mniH225U61OOf2cf3T8+nBdhQ5C8nqdztdYo+bAXhVh
	fQO7WuXltcMgYjQnG/BKCLwcR3Q==
X-Received: by 2002:a17:90b:2d0b:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-39aee1b7937mr10712303a91.19.1788374483124;
        Wed, 02 Sep 2026 11:41:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-39aee1b7937mr10712225a91.19.1788374482632;
        Wed, 02 Sep 2026 11:41:22 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2c1bcsm12059eec.20.2026.09.02.11.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:41:22 -0700 (PDT)
Date: Thu, 3 Sep 2026 00:11:12 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aphtyJuQHQKRqv9l@hu-mdsor-hyd.qualcomm.com>
References: <20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com>
 <20260824-lt9611c-v7-v11-2-eb4a79cb597c@oss.qualcomm.com>
 <178766696083.117435.16339828039068931624.b4-review@b4>
 <apXKES8WQzVDbQG8@hu-mdsor-hyd.qualcomm.com>
 <DL3SHWGWGJRM.8EBXAKKNSVB5@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DL3SHWGWGJRM.8EBXAKKNSVB5@bootlin.com>
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a986dd4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=I0NX2EReon8agFAEoCIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 5kbJT6YW6Tz8eI2Qs5ksrEdWCmRCHlWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2NCBTYWx0ZWRfX4Rn8FBAObuvL
 mE+72t5eWArmu+eEfUPRL9866Hb6TQ7RpVSho2QoYlw5YDoEN+txChjkYaWYEpJzUqHK9utWIBu
 uJn5Q9OfleErocZ87lDvTTNqKWlpyISz+/GIow3jvWs7v86nbXAztAoTxkoaqwERhD4k/tSndEa
 lSfVi6oaXaNwfRIdcwslLXjYYfcIZ+g+vvjSqIAZxvpDktZZa3RF9CQLgXC3g1wvD7hrDD3owoj
 Ba3bN8DzLytTVuf2hBwAKq7te647Ubrw6XLyK+CSTC/M47b8jlZQ4dXq382VSrPgObZieLAQ1/s
 WomZGoSiEiO+OxAPWDZ3aoZz4SeOeL78FpHlG0HlnYl4fqbRVjklU0+0AEuNBYlQFEeIVfHHTHa
 QvaOo0G8HJvBBW8c0bXvWXqid6qzlV/vVOljMuV+xh59o6+K9NRhKbeLrAejTcNpYtedqOnvPjh
 +tZ/MEoQZEqYjoxn2mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2NCBTYWx0ZWRfX0nX6ftXY0Vd3
 VHqGedPk1Tjbjd7Lo2y+M5b/xkmCBQhw932oHhLdXZG3wKfWdtRS2RPWGXaS78qPkcRp1dBNyvU
 BVpcKTz7LcBx+qCiYmxDp6U3NvgbCX8=
X-Proofpoint-ORIG-GUID: 5kbJT6YW6Tz8eI2Qs5ksrEdWCmRCHlWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020164

On Tue, Sep 01, 2026 at 09:09:11AM +0200, Luca Ceresoli wrote:
> Hello Mohit,
> 
> On Mon Aug 31, 2026 at 8:38 PM CEST, Mohit Dsor wrote:
> 
> [...]
> 
> >> > +#include <drm/drm_of.h>
> >>
> >> Unused include?
> > Using this header for of_drm_get_bridge_by_endpoint
> 
> of_drm_get_bridge_by_endpoint() is declared in drm_bridge.h.
Thanks, will remove this header as well.
> 
> >> > +static enum drm_mode_status
> >> > +lt9611c_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> >>                      ^^^^
> >> Out of curiosity, what does "char" means here?
> > "char" = character — TMDS (Transition Minimized Differential Signaling) transmits data using 8b/10b encoding, where each
> >   encoded 10-bit symbol is called a "character". The TMDS character rate is the number of these symbols transmitted per second
> >   per lane, which equals the TMDS clock frequency.
> 
> Ah, OK, thanks for the explanation.
> 
> >> Also, I _think_ lt9611c_regulator_init() could just
> >> devm_regulator_bulk_get_enable() to do both things at once, but I'm not
> >> sure that would be compatible with PM. If it's safe it would simplify the
> >> code quite a lot, and also allow using devm_drm_bridge_add() below, making
> >> the remove function almost empty.
> > regulator_bulk_disable/enable are called in suspend/resume and in remove — so devm_regulator_bulk_get_enable is not suitable
> >   here
> 
> OK, I was not sure about that, thanks for checking.
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
