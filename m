Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC82F2DB7AE
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785098202; cv=none; b=YjEdoFiJdI47lYWyLV/O/E+4nnnAU8eItlOkgVmA1G+8ht9Hskpc3tuyBy5KUBNDLyj55LHGtcWkb3Ip1ijSyEWZQ+PnGUpPJx39LuH7yOGxAaTnMmhe+O+zu54Ahr9PYzJElP+rbSQaZB+KoVppO8qD6dQn83eF3gB/6rzAyjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785098202; c=relaxed/simple;
	bh=y7kjeseCo3jLvRjITiUtdMe7C+PcUuDHkjGiN0ErxF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAff3iqGPKJnLmay/KRE9nBSrhdybypCST9oUvHkY6ZTvt3mQA1WDeLbzurOT4/2WebxDD4Veb2soJhXTXUF0LOGrDQYeZGal4asEHLv75E0gJbXcTBiByUd7hdpFeAtLXFTnkYaxzCfl5g6d3kpvZGbgc+iHsh/FHPh6qj51uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyHhn1pD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sqe5eNeS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyHhn1pD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sqe5eNeS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJutQW1535449
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dYqZc1K9+IkncN1pcxi2sBhw
	OHcVvXQdWRRUI8PWtzQ=; b=QyHhn1pDVumlhl3jbDzaK9pepn+PQ1ZJK0msTPq7
	jhogMnLLNiwiUHMmJdK225j1bjfH/5CgUXO+5w2a/Bd1FOCpd3+2gOyOLsJzlZfa
	EJvH7J6WCPzRHMBK66VBENbE97iZ2pzRxl8ScRTw+yUTp6TXiMk5w8NVQsMKMiLT
	P9/0ZJou9h50DrrQcB+f+5IkieHairxmd5bgZOwmU1/Guvd6QqYD4cvH+oHi0PCH
	xeAVjXMDCz9a8yC1drplSYklrGw1tcYw2bKIQixoWlI3TVtyY10xFtkYh6yu4FVW
	PakUJneNmMsfEPqzyaTtnQPktv82HrnlVHS0OztP4frJLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn41pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:36:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so22527711cf.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785098199; x=1785702999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYqZc1K9+IkncN1pcxi2sBhwOHcVvXQdWRRUI8PWtzQ=;
        b=Sqe5eNeS7//3Ya71yXBqJIVj/3B+01YpwKe/Iu32ib4f7khqmSykSrsIMShm/fSW7Y
         kya80v4smdRt5JQxCQvgJgVz/7Tad0ngTrt0/nvJtAYkDQbzQNiptXjqyfl5wnMf9RXM
         r0k7+ByKn61JAwF3LcpB4rtJKWRHsp7QFDJ199A9nh8iz3j63lVFWWlkHN1yUM0hvzko
         CgxgNKbKE61QjCoedWH1+QEyNCOKsxxMawamjhsb6a2L/NdSwI+jhTZg1W070YN8IaTR
         P45hmRQShVwJ9O4GyJ5nuFvXsHBHDnKVKZF5mtvIWsx1XjJ6UnS/bnKa5z47021Msb5D
         mf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785098199; x=1785702999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYqZc1K9+IkncN1pcxi2sBhwOHcVvXQdWRRUI8PWtzQ=;
        b=ofKtNRLXeqd+DBQ2TvjUm6sQcwPiQFaWSXYJal+DwVejQXyUS5M4yvGoUYjFxousbe
         05uAODezIqRSlkfHRiMzS7TxNbVa4GhvN9pt5od9K7xcr+Q4OfeZvyf1ok0fqJ0WA8gC
         WfO9tje/o7tbgIaWZK1g6txoUrToNz3WKhyOe4obQfAfKuK+QSXWGjr9UBTVx8tFVWno
         hh/CNtWVLEYPiFP292PqD26MWO8QMjN26uKjiSnDPyZuvFSvb3dl5frLtDvTXVrsMdTq
         J6nXeUryUDx/5C6H4mzyVtwVxAZfPeq8nr/dlUoiajYK6Nj7RyCO/paYgKMHQDcxLI6d
         /BaA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz9+LS8cTbcU22mNCtWq9tjbuHI+7HWJe9T1h22sGIWP95H2i+tRmz5UmppROfnqM5rg3f+dh3WGhs@vger.kernel.org
X-Gm-Message-State: AOJu0YzBGdSYQMI+9MmAHxqt8KbMtx9ltLYaPNNkRYJEGjEAoMyg5lwj
	uYbZWF4EUVjd+UjISyZRPC2Sbk2YMP3t+m9Z0DQUjg+NGnZWeZ4cSv1amujPg5USAYuLBKY1Kvv
	RQEpFndtayM7Dh1gMKCs+88GBhWs00zTcpYhsIfULT/VNe7Uppmz6fwwl6nHJ9yAk
X-Gm-Gg: AR+sD11EKZ7TB8CnvDleoy+o9Y86I1NQqXhor/hGEPbEs18RTpz3oaoEj+Wttrpa91J
	qGUCVIDm+Hhn634a8po800LDDxXA5zHgFsmHnWwucXKryiLGKm4PCZ3JPwLh9xt9GMbuc5CqK9H
	D6yZgo858efH/dStR2mhk+ne8tWNgZ2xeursLQTJkCMupkIzN2d4zDB8Yuyaa/eE16AVjBmAkFL
	bjDi/y/2DtzMWYeHQjN90Q/M4s90htCQGMfourMeHHTtB+TI5pQvPuXNI9Y74FJHFnmcnp7EGZt
	fbBGM1JJ87lsB9Y913NawK7SmaNEbXnGhFELxZDqBX6Ce2MjVWiu0A3l5s5jA8h9OtlAJbFOJWh
	t8L4GGYZNMctpk/bKOWQde6tEnF0sloyhfhzAO3LWp86mUMMIkQlGH3ZRhtEjJRibdwVxtKiL+a
	ATcS7hwtmPIcZNbQ==
X-Received: by 2002:a05:622a:1a8d:b0:521:987f:bf34 with SMTP id d75a77b69052e-529a8715146mr65796221cf.61.1785098199143;
        Sun, 26 Jul 2026 13:36:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8d:b0:521:987f:bf34 with SMTP id d75a77b69052e-529a8715146mr65796051cf.61.1785098198753;
        Sun, 26 Jul 2026 13:36:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1ee2afsm1064790e87.64.2026.07.26.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:36:36 -0700 (PDT)
Date: Sun, 26 Jul 2026 23:36:34 +0300
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
Subject: Re: [PATCH v5 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Message-ID: <izw3biesoubceggbg2jg5tvptzqvqcrwmixqyqi32ftznns3p5@74nso23e3bui>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
X-Proofpoint-GUID: HfugX57FYck0qKvr54h-zmYirVZ16dFJ
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a666fd7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5r94vnxKtQZQamoODnYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX68m5ybPDhixU
 cpiJPfY2wTbZWMQSQGAHJUjuN7VW44dAj+1EJR5jyel7sr718cAh4opxpsbvADWm81V0u3FLmlG
 iFPD9e+34ScMe3fSWhoDiXRH4/BjNipJnbRRJKjPKoZjePhMPS5Gu72zi5r8YPcClbKQnm+fXWq
 vYVCHcJMgfWWUIN2BMnga3RLAzhpi99DcjnUZR4SthOJCLvkyfcW0HkZE/tVKa90TJTWBQL8ckn
 9nlAZ1VQq2VkI9/4xgp3ePyPf40YDsBw/aJixYMuPkdfxoPIyrHZIHB2tRjcHRZBjGfnv9Weppx
 0TPJBe26VQSqzdPiohv5+CLf/SMZRc5t27mJDLXSiTAaCXtIPJhE+3J9ti+lRSn4U+uy0JEUhTt
 TNhNqj3H2yZXut5UEJRx1pNMu9bC7ZPEDRVxB79mU7Yj34utA1+0KCVKyY7I+pFwbsj3hDI8kE9
 HqqZhcoLQYjJl3jdlHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX1skZnlq0T9HE
 bDnU2HPJSkEsgJTnhFfw9C21AgCWxfhpG5KHgm+cV03P0seGneDiGelKFNIWuCRAOiDs9jsz/FQ
 /NjxhHbqHkaj+MnjkmBH9DBRtChKIEY=
X-Proofpoint-ORIG-GUID: HfugX57FYck0qKvr54h-zmYirVZ16dFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260209

On Thu, Jul 23, 2026 at 04:09:04PM +0530, Krishna Kurapati wrote:
> Add definition for EUSB2 phy type.

Why?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/dt-bindings/phy/phy.h | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
