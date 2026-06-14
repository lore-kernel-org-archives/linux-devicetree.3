Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D005B2E228D
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781471937; cv=none; b=PVhUuPpYrdHEBrmx3aeeGMoB7bn3M9Y/Iz2bThMbVAST5fhpRFIf3nQhv3o/cia+DtL6SshLXzsX252YyQci1W+cs+PgxgCB+OrNyDrdxu98KvL9sUIUuHUX2TV48fFHeuqBGfeqXUSD56plQm1ENk/zULKquH250lWgntOkLBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781471937; c=relaxed/simple;
	bh=0miKinNiBWvUoPN9BaGwPuXb4iIJkY74GJPYKVpbCws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0R4AZyx+7zIEix2BAsChD4wSNBG/mZm+qaNXeaFYMSY1WU8i1uHbRbO8EN6XmFyg0pl/SICTjLPge7LEfL1E5uX8VmJ5Gi9Rj9MNy6Je8/gE6grI8Hp2yTJd7GoNyWTxtrUhmIiXEAxFFQ+417RM3u8RqdXzSOqnHKYNzoxSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRoyeQE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZLBdipS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRoyeQE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZLBdipS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELF2gC2695503
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MCsu8KfWh71txzBAaRtP4I1n
	CwGiB4nR9paTIiDThd8=; b=XRoyeQE2h9Aa67gjKufT3yr6h4UUkS6q72vh2qR+
	6rRKrW+I0AY9RMoyFHoQBsg8q8qvyj2zBat1G5YjkcBB5z92a1x3nc3Y7aTUFO6N
	MGduQ0zNpy3hQrHiiOqNGLcOEfM8SIWPNKOaD9HY7kOlEKe4geeRxbNRj2x5KqMN
	A2aTklMiucdvUrBHkKwvKf62Oku+ntATzTeFhqgGuAeW4QbBL/fggHkKfv4w1l4m
	qsMXKHSp+yqyJvdqOaIfoT/k3J0RH/LY7pNn18eUqj1nPe5a1q+2l+yDJLblXJt0
	NBt4ld+90jJ02kui4DKnS8gmPJqU39HyWFCjcloJ9uZ09Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gvksd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:18:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915b3587972so251515485a.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781471934; x=1782076734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCsu8KfWh71txzBAaRtP4I1nCwGiB4nR9paTIiDThd8=;
        b=WZLBdipS9bu+r5x8cVeeOmbpSsfNBoDDBVkUr/gGHi6TF7dqBe8h+mkead2Xn9vWv7
         yMA5x0oX38M/dzUgIG0LJXGeVtEViJ4h0p0optc+D/vEYZqFEw2vpS5tHVpcieFvN5Hq
         PFcBRKAXLnE3RTdunRca1pAYcSSwMYRF1K7TJ6HF0TWbNU6yywhioTH0zE8AYaAyjYbR
         6DHEadGrioBr8aM2Xcgnkwl6H0LZpgel6nM6fo/+EPIvIg28ABh1t/ZeonzAUHSYfdF9
         nZm0xLHw6fkb8IFtXFICFMcWghi44L7cHaCrobcpHPcLyMInpIspnTOzMsdNvsIYoqUg
         +bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781471934; x=1782076734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCsu8KfWh71txzBAaRtP4I1nCwGiB4nR9paTIiDThd8=;
        b=SOJcrfuzYKfGtq4sAF/eX/mx7B3j+jO1gORs+N6nsMK7D52Esckk1/zhGw5P5ETtrY
         4qtAoxDI5rn6PQqCY6p9RzP/B/EaTW8vYzjOeq31q7luWhmygz1kj/i6ksTHeZYziBdU
         hNlHKElTk2OG5BAbbOHO8Y00iogcYGekWLx4wEtsGFVVzbdCT7kdPoho2hYPIX9FSas5
         iPOIgEXHlK6Zll5R2rq0+CxCND2LRctiwbTrBctjRVBSKxUIwoeCdr64w+gJ00cOL9/9
         gu3q8MRdZUxbiQKvYl0kYYIgYjieCriV09ifQCiZtypdp/zck8o9+AdaX0F2nBGuZulp
         bIZA==
X-Forwarded-Encrypted: i=1; AFNElJ97s0Pxah1IXAyyDhSZKHne4q97ebKmRybT/ibSpp0ssl3EJTqv+CaiG1D88jslZRvPjszatR6HUATY@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjAoPSs0scURuTDW73wJEJoS2+NDLRwNUCQURAsqa5221X4gE
	qvgCSEoDk8GJL58KbFPGaYimrX0NSJbUmzXgyBILQe/Sx9P4PVw0B6CelKD4ywa5EDA/zNqA/xI
	ymfvVr1Pli2Q67UXiZ5yQJMyGd+WY7yekKUIAzQ3/2M/hlOPiswfNm4E5eRg3sOHO
X-Gm-Gg: Acq92OHaM0+luEFK9kawihU5aLDiF0p6Jel5To9rRh8BSHyHpQFCXoKA6UgeioJmbfC
	z75HvQD/cFT5AU+h2sIKkdc9348O+JZhoR7cqV/ZFxoo54fCwfXtiEaoCdtwDGFdK4/6MG41pmN
	eoMSuBjyyujwewlJ0G88nA8CF+Lk5Vi2W/tvnjRiiZ1u1DatG3J8VkITmNPthmWo4PYk+43E73p
	texaGZDrO7zIVoZpkR8Th9biZ3UO7KVTTdNbkMlcAumEl7Qt0UUTzJ7+0gTBgf1KYVK7UUy3AQe
	KBPmU8w9P2L6rH6N7bavMkx4JdCC1xB/V84E8QbbGKa+8HKaqrRSVLt6ieKQ/rI1MyDqX5gC+pE
	NRzWEBld6hapYyV8t/Mo1wdUA2cSeyNKY4EI35mazEiopXkvlJWBiaCBXmgYVPOiDd8OSE3oSA5
	oOuThbRh4Kt5eQgmJktlldPEYd/yR6MGp43Xo=
X-Received: by 2002:a05:620a:6f0a:b0:914:bb8e:915c with SMTP id af79cd13be357-9161bc576e1mr1799151485a.22.1781471934095;
        Sun, 14 Jun 2026 14:18:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0a:b0:914:bb8e:915c with SMTP id af79cd13be357-9161bc576e1mr1799148885a.22.1781471933635;
        Sun, 14 Jun 2026 14:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aea92sm2187663e87.63.2026.06.14.14.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:18:51 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:18:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
Message-ID: <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614083424.464132-2-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyNiBTYWx0ZWRfX/388XPYdXMYS
 /jOt4jbMDxmwZxwZJTEVVB8zlZaDH6GYUyPODL29FwyRtX77upIufbuUlpbeSwU3kK00uZqK1AR
 Cj44R/rnIIYeKFjyKzoVin/UqT8RY5A=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f1abe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=cGGWfqFj7ohIeHota6cA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyNiBTYWx0ZWRfX0exQWUziaXuK
 Jo/Mwg9UfdDMjmJw1suxfdMU1h+UISdDE2m+cMjUrZ2vkUaiHu6qr0doeRreIAgaoNBDnxbc8Lo
 Oz6tL8gfERR+pE98A0/ztKu2ARjC3y9vOpT3iS/Ho+dGjB+0I8GL8R0P+B3xsaSs1sWjVMsI3tH
 tiga3soh2vMKHMVIG/Kkqz5aLagkhpH2cLMFRAVSlQMDhlIKU1Evk2oJgdLszd4T77pRKUtJ5Di
 5RyO1IbJjuux+c4/b5deNLQzKbgBvCS4l4dAhQ5CszeXMvnoR54T4uz5sinvpg5qYHjAqMjTtos
 WWvkeyGejxVZUEQI+pHEnoEeqPwu+GmV6nMtBt6BbPvtlyINTan0TOBUKDePPH0WOcLtfKt42pW
 w9AP5xJuEqGamQ5KeUjC3oESqtSafYv0QweekkVmi74CeznNNAy/T/alifYr+eN6kRZgkES85Tc
 /Q2O8Unx+W0N6vU2a3Q==
X-Proofpoint-GUID: 00ttpqr8k2bV_Zq87R4vQHyJHmv4uT4-
X-Proofpoint-ORIG-GUID: 00ttpqr8k2bV_Zq87R4vQHyJHmv4uT4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140226

On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> Some devices (such as gaokun3) do not disable FIFO mode, causing the
> driver to fallback to FIFO mode by default. However, these platforms
> also support GSI mode, which is highly preferred for certain
> peripherals like SPI touchscreens to improve performance.
> 
> Introduce the "qcom,force-gsi-mode" device property to hint and force
> the controller into GSI mode during initialization.

Ideally, this should be decided by the SPI controller based on the
requirements. Another option would be to prefer GSI for all transfers if
it is available, ignoring the FIFO even if it is not disabled.

> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

-- 
With best wishes
Dmitry
