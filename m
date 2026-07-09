Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E23FC5CD
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592927; cv=none; b=A5ilRaS6IzCffGn9vs1Uent4NwV8KErLI9Ddf5dEtR18geNZu1MFJqVDCBL3MeonG3P0Fee5d1zNVoGQtJAoJ1+/EOHnnmBIGp5P2iNzqB4Tb05Ayg7VWJJmfCOLBhA+BkPtJuUet7enmOV1aUn5wb7X8yag0cFmunLPACFNt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592927; c=relaxed/simple;
	bh=mtrAGO7mzZ2k7NrAqzt8XhUVSlLeHFbE9hM1FDtniM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtYMhdp4IWu8QTykX9pFlncg56CUY0dAPx9uXouLkpISD7gpp1VXTmrGmYae3FXQNNIgflo2utvRhC05ESrGKwCucH6hxv589XzUIgRKgulvcIdmdQA0Eimw0/1UnfumtrrhVdgIiDF7pINhbbZhhTF/hT3yU2zmgXpTuU+AQlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlMtUsUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuXhdTnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlMtUsUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuXhdTnw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANSCB1533634
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 10:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N+Mu4FsQBWM5HoD7rwag4nRk
	lNeKKvXIE29VJ8JvlH8=; b=VlMtUsUy99usAcVIQQl+wLN47VrYTf/g7pxK0RxZ
	ak+N/6ud9eEgb5TONdb0MYyN7MtwBLy9Ta0x5pC/6jA6JYJ+xnIepiL7KosESB/X
	LsqGVWzIXKuXNmBQD2cjXnubc83vKw00wOuIv94n4oRxSpCvmgRPhVQBos01WAqJ
	sGd1k9520cfcXQM/j2HErMELKglzqa28dWNVuwPcDDXTcd6jIWRw/cR3PFfnGkdJ
	MhABZ1KUw6KBibVQzUI/BOokWwPwX7asLVZ34z9aMqrU+5qAmxEId4rDgUo933WV
	RAuB4XY2ZurpzClGuzq4qIOGv5z1DWWx0tEWc8LBuDEoyQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418hk28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:28:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7890eceso421307137.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592925; x=1784197725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+Mu4FsQBWM5HoD7rwag4nRklNeKKvXIE29VJ8JvlH8=;
        b=cuXhdTnwQp0kJu3+qHmEPEUV3Vaj1mSwHFGeLV7owBb7ReoNeXwthwT9lMpC8m8XkS
         HtdsJKhWZ7qc1mglyhk4fPDBnJ5BsifpPvVP4wiFX4PwoUykgfCuS0OKVB6IHOLyQzUJ
         e42kmyzKaDso4YTq63MAyVmiEcSX/UtyjsfJan4rf3BfRFW+rsGBpaBin9xrFSG3vyBt
         mxzkxWl3liL+6HdImW2ekMzZVNWF0YosQUxdKFyyInkxjM5lmL9IycNdvZF2W5tsRhPG
         udbgz4BaVXijUFRFuMTKeByI7cNmQhbSZRnwGwWjNGcChmNBfJuVl5uzbaSd7KS617L8
         96vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592925; x=1784197725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+Mu4FsQBWM5HoD7rwag4nRklNeKKvXIE29VJ8JvlH8=;
        b=M3hzFSUuR0cTrZb4GwwekjfxuFOjqqt3c86qpgxwxfW4U4CSIinpS2ynx1opXmow83
         ODzmqYwAVlo4qBF+aRaixkClOVCGDc+1c6Yj/za5twY+P0W79saJ3yJge+UKvGw4KrnZ
         CJn5Zq+xGC30f0grW7e6Sh/SuBnFHMBjrpJ1j2mcrQPgOvhgkk1EC5Oc7BcxjJvBv1v4
         aMknG67UogAut29mXcF72CZeya3QNTOsvWJtk9esh66aFk/vAizNVf6WD5f241+a8gGm
         EoGY+mu7Y5toq5dY5afYbbZqEQPaj436rjg7unbgpLHV0HlPSLVstPo1Zr3V/+fHdAxk
         AFFA==
X-Forwarded-Encrypted: i=1; AHgh+RpOpMeHwazdXTIwStzFJc6DDA+hBJJHa7kUmavT9w/8kInFrrt5tPN/udiYpLjyt6zWX6jEkkGDk3i5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2GF4O++6w67Wqz99tSwatX5biZX1mT+oQILXw5MYMsMof60tQ
	RgrHqJAcVrsNf6X36KwT3Q7zQ3EwhOm2jv73dpYzH4WI9QBe4mnylp9DqMvfdOwxf69bxN5yZEX
	+46PkiuJQeRlVTiRE9rfmtGhthtmHi/Gf9t38hZaq17J/teKwhLX32Dsfa7zbbl1X
X-Gm-Gg: AfdE7cl0LmDytgc0mgTvywYke0xGDZzRZ9MuwWAaev/0bttmQH5eLbyzUYDLgtuQVQy
	qd1+NrjNDxGv+vIpsOoCr5N6E5UlQq/wr06CFAn9j1Bso1bZ6Al6v2CfbXJzOpNUm8FlsxAD75S
	pZvkpfX+iJuVLUhApwyyDmgYdxlR73nbXEXqGGhbrduu+mPATXPTC5BiNvLYq18n+tCbLd+qIC1
	IJ9Lko8w/jw4ZT6TO7lKV1Gq6wxUOteVHyWkF97XH516zbP7y+m268aEh4SBLz17TOmO0Ls00qh
	B637sb3oUvK+Q18S6EmBmZOWen0JsAyJ3zTR8/dOxgJvbdVE2osvarmrmw4DZVYizsPoM5gYEtX
	278kFu7jYvdKEWyTN3wQfAsP9pZDfoIRal/HczUaeeX6/scQf4Y0v8ad3zWeURixPKMCZkQz609
	dXiCLjpjF/XjgM7cwhkscB4R3+
X-Received: by 2002:a05:6102:1607:b0:631:28c1:154c with SMTP id ada2fe7eead31-744dff3ab04mr4551349137.9.1783592924070;
        Thu, 09 Jul 2026 03:28:44 -0700 (PDT)
X-Received: by 2002:a05:6102:1607:b0:631:28c1:154c with SMTP id ada2fe7eead31-744dff3ab04mr4551307137.9.1783592923132;
        Thu, 09 Jul 2026 03:28:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b00c76dcf8sm1613638e87.39.2026.07.09.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:28:41 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:28:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Message-ID: <6m6oifeecvv77xsbbstkkgz7k5qse4azj3rbbvi47n2wbasgt4@7z4zgsiatg62>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f77de cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=TegkrtGQps0JBSonG1sA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX+ncoUa7j9qF+
 0nRw37kdhva7Rj9ywRCnlAksqtsN1LLaIVsg7qGOPZJ+dUmtm+kJmiUuAySM3jhsiM/0DK2HLct
 sw3t7AyeT/O1fD9NnFVMbiafQG3ax0EqfwVNugg1E1dGf1CitsRI/EWoY80FHh4bcFrgUS8dtX0
 Ewg9B91PrsHZ13eMOHjWnUU1BVOG5UoeOB45C4XVAxkL+v8vGH12JSfr4Egafx2PUccSkwQgj7E
 hT6NHj/PlTYp+oEjBSXzYMGB2hXfQEHp0asWBiC9vXQO/oco9SMI5zZoz33hqrmSBYhDwNd6eaI
 WJnOMLFQeyETjs5S5j/mSnWrKVJ4IRtcDfCEhKxouyu2m2p1wb0lqBI/7zSzHfLH3MMNGlG75D2
 +ijhwde7fwvGqf3l/HImlsoTVvTcAtf1s+5hn1vYzIGGFcj7Ia6AxkLEXiFJ3nM7fHxJgypGjGM
 lzh/iXXO2LaCxwMkUEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX7JjS9srqLQG7
 1UprnlHLBsgl+RS44/oMH6vbIKcCx3rIdc1I/5fKd/Q/WDriK5a/b1UCmyk+kB3BKPG8NcCxFTZ
 +tBoI/CxyXWczKtyvWvIE15XSt6vPZk=
X-Proofpoint-GUID: RH4wrkQwmn1qbWmtC06H1ykYCb6_yole
X-Proofpoint-ORIG-GUID: RH4wrkQwmn1qbWmtC06H1ykYCb6_yole
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090101

On Wed, Jul 08, 2026 at 11:55:07PM +0530, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
> CSR resets on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |  10 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/audiocorecc-shikra.c | 809 ++++++++++++++++++++++++++++++++++
>  3 files changed, 820 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
