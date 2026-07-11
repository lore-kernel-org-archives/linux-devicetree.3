Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DBF1EEE6
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792310; cv=none; b=QX41Xvg4sUssia1+sf7Y95TPwfR46WdqGopS3uvPawAL6xuXe6oZn2CvS2vYT08DLr1iMU9Pmr4GvuO5mb3Upy4fKU0LCm2qhNj7v6i6zp1Wu+IYUux67fZz83HUw7jZWakppNycSCDQWPiriBJjPxZ5sRbqxD7zv4vv/4dV1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792310; c=relaxed/simple;
	bh=5CN0Zj625ZIH3LeM3lHnSoz5+f1rVL6W6reb9JHdtYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsBCt5AJ5hXrbtV3KIwuNkEFpdZwKfplpudkgCAnqeSWThr/IvmOKFGF9b3PmLluMry4c1rDpGjK5IoGv1/b4lTetakylGyPJyxaIgIAEtx1Dnn8pl7wmZOa25/Qi6hqC6mRIKWoJakVLEpLxcAphb5BuXGuiI5ucOEXlayASCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjL3IZxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egS1gVAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjL3IZxV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egS1gVAL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHn4p7393271
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O92GE7cXDqJy6Gvk0FuHsmfU
	ufq3xepTjiD2tsLB/7o=; b=mjL3IZxVOwZ3DAPb3n0hmtb8FNIVgZhKJbDxT3+Y
	It1SREmU63RCsbfsBXOTD92vt6Z2EnaetW1NqvkuZVYkSSf+XU1XmH/l6TN6tme/
	V0qQUp835YEDe94+z3Y/bxgwc3l2Ey5aV6fMoIGGA4GPxZz+lyQiop7vGCC2A/Cu
	bcB2hxBld9oOaZr5fnrlSTKLiP0vpepVvv6jNRenBesm3wvb2wOjBayPlIzq9nrv
	nWdx8fAzYCw9kOjsxDZO10pyfV5m1LgIMO7Q8k05QP58xE4APRnGKPtTLlSgn+Q2
	tBzyFOMqu6RHPERBLoFuWNoLYHWlunDBhcYTRYvPba3I8Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeaf9aeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:51:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737d352d3b0so1554850137.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783792308; x=1784397108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O92GE7cXDqJy6Gvk0FuHsmfUufq3xepTjiD2tsLB/7o=;
        b=egS1gVALEPEeZiCPhr3C2vUo2qpNq5Qb+b2AFIxNIP5v9URun31sFk3Sdg0JIP5+Hp
         DP89x6V2m1TrVwBbIcy1EN35sswc/mOeJtw/lfzPsKCYCdjoSG/cv4zxOFM9Z699ySon
         +GPfm6qcLgffMPSyVqc4qQo6TVfz2vtsHoH9QjzMZfbN8JwgwwaMcIsI8QPu24JG0zW2
         z7VlmsOAIULlGEt9HIe4jVsfyodl3p3yUwDd7V1TPSj1fTCN7LKJcYEHoKEYRJvLXr+/
         7MSseOoXsS7aE9p7boTepdD3AMscgMVNKzdImhYjuMi8PK+mlvImrKBE8kcD9ABjjmpq
         oQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783792308; x=1784397108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O92GE7cXDqJy6Gvk0FuHsmfUufq3xepTjiD2tsLB/7o=;
        b=g9Io2ZPimEKON0gwEoy4Me2CwGPrTQ5oyAQDipQU94e2yvHi1+VuEwx44N2Aps/zjD
         PX0TVh/WQLhy/b9OgS8EV21I/H+Cc/haQxORDE1QS2fhetEmBFNuq2reRoMiAQLTzV+q
         nI1/CnWEObBsxWDuk27Q2D1apsGHZ5NzILsje6+7waJMMBsyt989Vvr6rdnf2xr8X01/
         wQeC8YxAhdeYqC75w6owu59kIUiauDJOe5dpYNmdCKmev7xM+QS2J8V2SDLa7Yrn37w+
         DLxIWL09GIbBk7MaA7yHyLuID7HFHPLi7F9VRi/HhANMQfKRwnunrmyp3rX1k+Xkq9m4
         kVxg==
X-Forwarded-Encrypted: i=1; AHgh+Roo1J5waV8csHmLlw0s7kkwgtTTUBVAq6DTEbaYvAyylr1jVuDEQ/o0tCLbFCj1CtdF7fxr7EhpKuyQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3fTHIVs3HuKxbkPhuErbs7UnW1XRh/3HFCevkF6bVkA8hPmIl
	Aokj8LlBIoFnLfXaoYTFkceqF6OtvAAlTk51zoIrBqBvovJ4M872RJcYHqwlQnCJzWIEUozcXcf
	NmZmDYWxfg6F9Pj9oam9GFX7XzChLYfCbz2/Nl2Hj2cNvIYl9vit08jOhk0kPGKOd
X-Gm-Gg: AfdE7ck1gU0e8gBUxuVFMU9arrPSed/ZF+BxQ52dN+H+5JijycmB5P7xWtezfpTj7CQ
	W3YHIKFKL+KbXGkQEp1Fv8aBbjpq+V2XSpnJmjc2F0tOTwf4N0UcKzm1AKE8MFnkmzM5L1/qEXn
	s1Wl8y1xUiICwNR+EqmHjWu9aDwwcza6Yw+YDwwemgxCThUvgQhCy1SAvQ47cq9dOCxOmOBiCVm
	avZF9mlHh0mRSict1W7E6P2R2uJ4Pes8cV7E98nNje8tAIx8DgMaI/z8tj30uHNUwmUPqXuszu4
	d1EkVcn+yuieB91dLYwk33bu0mZ4wZJgZpnWRqiKv3qy8+8G2wExKLNyVv/mAmpgdvnkNWk5y6G
	9pbMz6l+pJLhIcjI6JrzvYdgtn3ezHC9CJKTX6a4lLScv3MwGXswo0BFBPONE4oA8GtUm51Buk0
	q2RRd8ix9eH09LumgK1mX3aHnu
X-Received: by 2002:a05:6102:508a:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-74533b8430bmr2476147137.1.1783792307768;
        Sat, 11 Jul 2026 10:51:47 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-74533b8430bmr2476126137.1.1783792307346;
        Sat, 11 Jul 2026 10:51:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b13542sm15908361fa.11.2026.07.11.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:51:44 -0700 (PDT)
Date: Sat, 11 Jul 2026 20:51:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] phy: qcom-qusb2: Add support for Shikra
Message-ID: <3xakwbmomubsf4ofztpzc5ckf6ftj6f7rssq6k4cywzldith6q@xhhj2rla4jg2>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
 <20260711-shikra-usbphy-v5-v5-3-229ba3602737@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-shikra-usbphy-v5-v5-3-229ba3602737@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: adF0Kxn2FUXtanOGvctXEwvvzADzsZtR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MCBTYWx0ZWRfX7/BZ+En0iwIA
 czw4R5IkGN0MlnuvdFDicileabmj7AMRDMWi9LBmGERW+lFKSXD3NzrJ71aSizghfYx2n62TBr3
 jb7iYwGut0O0RrxxcgKeYEaDV2ugMHK3zWtdSgE8UOyJQ9Y9syziCyRMQNCg+9CPnORJVAUK+Yc
 rjh1/IhPdLjgrHb27aqcabp39SV6mxHrLZpCdsJl41tMeZV2nexEwEiage/HtMRr/P6/tAjebeN
 K0WBCz+2tXgLMney3kcFk9AC3OxJ0d8xFUpdHkkVMTb6ZctaaKUKZ2sAq6CgNUe3NrOiyKl5R5x
 4H0LThR8ahqrgNavXSt+PDTz2beSDPVB707AE9tqZgNT7+RD62tVEDBMBvUrxvu0KHSZFGOaLp4
 2dQF126FMYfWdbgOn4Yh3s3XHn/NUpr4ULwWxlLUGbMXn6XAdCe8C2IIz7wdWZTE3akVSi4bJ7b
 S5B+ImECP+donlfw8mw==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a5282b4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=F9wK58hNblNa3jbkQ1AA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: adF0Kxn2FUXtanOGvctXEwvvzADzsZtR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MCBTYWx0ZWRfX+rU4K5M5VToL
 2AagWLfgZZRsjZJsnLAVqFvInj1/9aYdBX/eL0vj2P8fmwh/F+sQJBd/evRxaLYlru5rr1CLR9i
 XpnteeSza2stRhr0EFMgoy2I/8FHyPY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110180

On Sat, Jul 11, 2026 at 10:39:52PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for Shikra. Since the init
> sequence is same as that of QCS615, reuse the existing init table in
> Shikra.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
