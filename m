Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13BD47F2D0
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495092; cv=none; b=uIv7PVoNm5JYHeM/XZnxgdAYyVK//SZQ78n/+mJsmV8wgdauMkB84bYjaGaHXGv+Wg0FKIAUUrj6m51T6JhoE5YaCGPVmvxLjilBQn8BKrk+2K60eGPHR+xOZS/iDdph/tk64h3r25C8spUm3G4QyvMVFXP5HKUxzfVYihVaVac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495092; c=relaxed/simple;
	bh=0QQ6xsLG3C1qiiwbSDVAzvYc4d8IJJuDUwtCjU0aaxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gm8tQdBN9xVu8PiOSpY4jojwnCtt86wOr1/thhSStQq4GjX0/PF3VKDR38bnBnmlfK85Eh9oHE7cjKdeGjmCHtQAyl/ACt3yiGp8tgCn6bEVj70boX41i1eezwevFrbqX8/09AfvwDFQE7R9Kt13KdY29ox3HZ7ZVYUk0RgwrDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddtl+jOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0TButD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddtl+jOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0TButD+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CTH17873753
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 13:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=04sBBkvYwcXhq/fsapj/4LEU
	21npBSlWyomjaSXyXqc=; b=ddtl+jOxnmre09fbhB4QhnK/St83ZsU+Zw2ynDbH
	Z1z5QJO/nbElu9Tq+FQ7tQPHnaKQ11gpuBQbsk+8VV+t641dRB2IEQsUu203iA5k
	q/Y2fueONc1y0Vq8l8y244PQjnYjLqYt6wiv2MY0z3sn/20+376hIWsWoavMMUSv
	y5xNW0lUWAqgl8FQmLBbxd57JGwYkGzJ6lc9J3Di+gHdGUVpmDvaE0D9m7PIDNaP
	w1WCwabBcNPNe4YCxWPhfO2vrSh+Gpq3VdLQpU4rTg0vsTOtlZH03dk6fOjzxhyu
	h+IfpKTQRI2nj5tO7m+kY1ubIopy3ImuIc2Jt4aBZTXlfA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9kraf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:58:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c69c788ce7so1884146137.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495085; x=1781099885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=04sBBkvYwcXhq/fsapj/4LEU21npBSlWyomjaSXyXqc=;
        b=e0TButD+VWJY2cbDvaB5jRcaqoOSdl8oBD6gQ1R3T6Cz4YN3T8L0sLnHP76mmGY+5A
         0fER8ODN6qwrBwQ8eZPuLn8+FG42zxmxb7DXe2CbH91zri8iVwND223rIeUO9fVWbtkB
         gtfgaRUOUPK+FQAfwKmrwv+ToVOLE0Q52oWAfboe7yozcA89CWpO0y5BZmZPv2oxFB0M
         7FzewM8dz5nyQwA/AkApWNCfIiExJ75SO3lNnb7gT2GjwsThoJAHv8arKMREn6d+lRAb
         aZIYtXxvByqtpKFxUcl6kc/jHSE2F9RYxliH/KqnxLINCzdtvH2PHFjtxcR/3TP8wLVY
         Z3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495085; x=1781099885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04sBBkvYwcXhq/fsapj/4LEU21npBSlWyomjaSXyXqc=;
        b=C0K6YtILXRY3LDeX6UtxTQg+gF7e5M9XSkm/jV0Mn+JxWIciVJB1PkfcLM6OFoP4un
         wzGRlrheHzGTkaLUBPUcJDW5gvc2NdPYooKZUp01EFG3GkUZQXylBg4Et9AieZn3idZq
         ov93uJl7QGLSVHWBLgUekQnkj6tLvXZYsa3ly+QPILIZ90cKd6tjxR9nFOS4ururnsSj
         ZKNRSMxfU9TrHLe8hDlncfmDTc0d5doBfQDwy3IazS+AS7A/VWe/9Un//uPD1SWCE5aD
         RxOq6V8PZqayEai71EpQHCvWjKdg6SwXdom78ZiFY+bQF09+yESuGZL61VnpLZH52yc7
         NhbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+scxITEc4M9ykBKAT5uyCequG2DOosApzif7+LvTXkdA8Av1XnIOCkxHO/3a370LY5W5Zww8Np+gs9@vger.kernel.org
X-Gm-Message-State: AOJu0YxFvE++CTH3aJEn0qe6UmgXF6nLPmDrQBbE+5SMdEViPKs6CZUC
	8Fjx56gcf5grnCqL6EUXKqc/VY84BDh8oCIS6x7rCHdd/PE/DJZqhZNNt8h6OdXmU41qft992gw
	LyM+wqJrEQkUwMmQRdNH34q0dmeiLLXO50dWtEbQgUl+Do7J7niC0ffq1Jn0fvNRB
X-Gm-Gg: Acq92OGlqwQKHs5ZO7lgrElpdZ/WwGNd6OJ3qzcWvjjm2f/xNl3QL5X1Srtp6FQPULo
	A++k+O7bFEvq8y8++YL7zRTfnz+zlykqzQh6HuUhJgGVk1Ifz/Y9DRrP4TPo4Dkqw+yBJ2qhqo6
	O2qoK+IL4mOx1eLf0P4gvBz/OL80aSVI43gbD8+eFVHma5bsYxjitaEUGJzAekjdSeUskpmimHT
	WxeQPAKQmz6WUnPYUdFUEhEjlD5Gy3eoKTmSfzDZoIUMTMECFoYtK7jO4Tki1qyaE3g6AfKaKat
	/bcxlajhK4YDQIsSieDYx3W+Ncik1aOKoEJzlRP5xIVMC8O/TMuMqexuMONua8pDxVVOx2lZXGZ
	2P81NO3+zPZpTELWjCEZy+2Pdj+leOHqnLqLqDK6r0YDgWjXOx8Hn4wRKowFXeF35Mozv3BJfb4
	QXYW1iTRxLO/NHjoSTwWVuYrJsf6txW+uSzHvFvlVSvN6qMw==
X-Received: by 2002:a05:6102:5129:b0:6dd:405b:26d0 with SMTP id ada2fe7eead31-6ec48fce1d6mr1437498137.23.1780495084620;
        Wed, 03 Jun 2026 06:58:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5129:b0:6dd:405b:26d0 with SMTP id ada2fe7eead31-6ec48fce1d6mr1437482137.23.1780495084168;
        Wed, 03 Jun 2026 06:58:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf674a7sm9436301fa.3.2026.06.03.06.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:58:03 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:58:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 2/2] phy: qcom: usb-hs: honour qcom,vendor-init-seq raw
 ULPI writes
Message-ID: <rmlkstzpfukootrpfh4l5pgtwra4dnwbynvteztvuugl4udtx7@a4xacrg7ealc>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-3-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603054809.565723-3-github.com@herrie.org>
X-Proofpoint-GUID: sbJFb_MseobOcYAdU4BVrQGIL8Of0nLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfX4bVeOZ6UnWH2
 xwGzkGObDYcKWqRFP6fp3P4OQcRUfWS0ejpehUn+oZGwCBsQHL6KX7pn1OgBEwI5MKsHaj0qjj2
 Z9ClIk4OkpU13zNX7Ck2pLWCc+9kaou8cdzfVFtIUb0IW+27wGw6aIRoiHYIUvlFqjSD5xaBg49
 Pn5e68F/nNMHUMcqIMKgjr4xTQSG1ocAVBPY37Df31vtDbBrCkxYJPNcbdG6TUdxrKJpEApDz+N
 Z0IOR7egFm9y7Qf4Sgov/BwpYFOMPMMswQJrAav/vySnMNltk6cP8F7P4g9RNvE0etHQOGR5a2v
 nErb2Lp3+oDey2Ryl1vAWMJ/GhMjXNrMfWeJvFpRiu34xqPEam7pUsQS3YNVhDDPS52+82sPRgw
 ph+/TFe8PJs2FRIAM/IatRh9ipYwNpdfup1/riy9VmRuAz+Y55p4+E+DzL+IHnA0Hal6jFWIREh
 BOrry6cQAQaJ9+CFCIg==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a2032ed cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Bm0pR8FC1pe31243yBgA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: sbJFb_MseobOcYAdU4BVrQGIL8Of0nLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030134

On Wed, Jun 03, 2026 at 07:48:09AM +0200, Herman van Hazendonk wrote:
> Add support for the optional qcom,vendor-init-seq DT property: a
> list of u8 (addr, val) pairs written verbatim to raw ULPI register
> addresses, rather than to ULPI_EXT_VENDOR_SPECIFIC + addr like the
> existing qcom,init-seq sequence reaches. This lets boards reach the
> standard vendor register range 0x30-0x3F where MSM8x60-era hardware
> keeps pre-emphasis level / HS driver slope / CDR auto-reset, etc.

I commented on the bindings. Platform-specific values should be defined
in the driver. Device-specific valeus should use values rather than raw
register data.


-- 
With best wishes
Dmitry
