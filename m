Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8642F713
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373298; cv=none; b=W7sooNldpmSmJKds8almtsBtXHNaoZr1i4wdY8gsP6bmduYTCti6f8jr+4ztsNWx8V8F9L/yARMMZIAJqziIkFNHytvAH2fufJSzzPwtKRMhVI3PHxU3M3SylF/dm6buVd+8nnKH0q3LdY+nU1qErpIVXCwFIzbGT4V+IfSwjvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373298; c=relaxed/simple;
	bh=xBAP7/h4Xm6qU6HLtUx5hvQdnXDTTiKJcKcvQQsAeJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzV3lWzRppD3qb40aQyxcpEOA6gSgGrY4nh0kQKdTRjaIEr/DwQb7qlLF4rv80wtwN28qdYYUf4Ork5jpWiXlXfbzJp/IuTKu5XXAaTEL1trnIFXat9S4Nsn+GHeK9udaUFxOtUVO/K2vjKEosn+Y61uKAqthDL9hLC+w9LxBcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6vUTsF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKPNNUJ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6vUTsF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKPNNUJ3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEAIT1504913
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=; b=B6vUTsF+PZo2s8op
	k91yrrH8BFLXGcc1v+dH/Y87y48/xr52B74MZi5C5tje3zjT50YWFG9LgR5OFtoj
	uZrN7jvmayh/z0oeFDCqXT95ZjU7vAfo76FtEQpevDbYtyoExwqDWadJCmmPwgTc
	X+VB1dDee4x4WOaXZ1LWivrvuBv7hagIygLM4VZwgi+L+Zc8stvPbySIbh++poei
	UNgwUeZDOlZ1IgxfltcCPkwhSNd6fQYwfEhuzWUHmZhj//qsu3VpZbg+YQdRF0/v
	XQgqErqLYI0rzGYUWqLwQ8gYh0IDHmtYvPATrhY3u2NOpORD50A8YO+sRN7Z5QAU
	RtbGIw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jv16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:28:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-969208e497eso3360257241.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373295; x=1783978095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=;
        b=CKPNNUJ3VCCUx7nU+hqnyDcylhkUyPoJMTAUdbgiKhdJh/7uKQr1dwFr1288p2Rp6F
         dLOnyt6VCTIrtLfvjXJ+5jSC7DlnMjE5u01u0eX93oyOrQjTJkbQCi1YPccb1vmqEaPD
         8x5D5Kd6bkhawnaopOZHTjQs7zyhHbfSlVw98nkbfOQniiBu2WMGX8WpMTcCo8nHskvB
         iqKPKZitZvgvXezOZRgCirjZINF4jRj/+vcIA6oxFLz8wOQtJfLm2FvRE7izOXZx9F+P
         VMT5k2z/bZ6VG3ohoj0yOQBR02705XTqWr2IWY154QlYoQaMdUubGgg4bYF1nzmhW3FP
         64RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373295; x=1783978095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=;
        b=ctxXNdJJ1Q0qgasP6q2ssMQHLIYOApQP5377NrZd9T+jRqvC9D/yK6m0ojiiQ9+PD4
         7GA1uoahdnhTByUqOe0f0xLTao5xv6upzo6sflOqtBe/XK0OHON1qaQ7y3hSLQ5dGY/d
         JG/YUtmbBMMbLRTP8srSTDK5PURyNr7DXuicHQ9QRI2avRD4FhC/awrZT6NM3HBlmkcb
         FlWmOlT9sI5UPMT411kTstSK3+49ekP5nMbOyHqpCN1J7aNmj09YoLi/gAp5mOszmeOV
         XhdQrB+89Nv4rphWsMNUly72N2KGA55xe+aIgyKOk2U81WrtXUdz5RwxCZUIsryu9tpa
         gY/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqDVcUrYd8/tduBxnrPw6Kx+pwKWbvQRmLV+TXSCJgXtKK/nFsGGO05AZPaOXHTZ7acl5Ax5nSCRiuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vLecHDOeK2LuVivWYJDbXI4V76sRLiawSxvqdff0t6qwFSzK
	X0i6MmycUVybtoKY+RR0k6wlaT35ZAFyMpKIDfDTwekY2epXpeAFeRsfdHML7zeov18Y9YNN0MN
	I7xwn3wKtnh1EdGyAOGoCGP+XCx9Vpg4RgC0xvX5z9sA/2TzsegmDuhvnvgLiUTD7
X-Gm-Gg: AfdE7cne2+w/XXdWTReXhTIH0qbRAjgr5QPzoHaXvJ9tSqW0071SJDO0FQNa827BrOT
	fSUduvelzhdJPflV8hsIpub6dLvNBFLlg9f53ABoWO0Qnl2Og/7P9DrQ8DuUSBuQ6FHTceDlnoD
	21bHhQX/kxSRq2NDLEslphKy7nwL8YmC9qQItqbf82Ye64aPeuJB/8wE8boZOqKnziSfl7rGvZW
	p8kF54LN0kGULV1i1SN8W0Hw2MZvtyJIKHiulekyrSOVTYcRMsCntJkXPHbadqNktUbwGWkkAzL
	t7bgmgQhm1u542uI0xHxjhFx+M3Rw1SKvS8SARNLtESXY7yK+DGT/lCAauDQUD3Py1WkN7S+FN6
	nXf40l+0HEyBKNNhx/liq1EzMOEMZmAROPUaE1mrsgyolQ5o6yUTZev4w1O93FllLvy22exLewt
	nt73eujdkXSZ/VpLn2qDTgI9JB
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1160578137.14.1783373295361;
        Mon, 06 Jul 2026 14:28:15 -0700 (PDT)
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1160536137.14.1783373294919;
        Mon, 06 Jul 2026 14:28:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839bbsm3150167e87.35.2026.07.06.14.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:28:11 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:28:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
 <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c1df0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wZTYHpkevF83xUmX0v8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX311uuyRT5YIf
 cy1+XUgMvai4QlAWPBXjMBp87Bxh03trHQ3Vt/lNAkp+Wlie5/bf4o1LheLoDiNSNUTU0byeCDs
 tGlYdOZcVWqWN6RX5EJ17p14bbIlHZSm1SEV0x3XDjrANWpGbiptB4f6yN4iCLSX0FKYdjAEDAQ
 dNDljxTbOHLSv0fNSjUXTVYOw9XU0x6iUtnx0YQwKtVcJq/IZKOE0xNtjCcwuDqEIq5OzYtt3zD
 ns4ubBWjQpCZwBZ2szU8BbCsQrYv06Y3QhGhT4ADnDU7X8OCarbYCnrVk5lGJZyy74llxETVFHm
 Jl1kgfTa5WtC3sKAQmqn7EMCd+2N7Jy8dBGt1LULfaNHuVB5qhk0QZmvpKfRlH6bVQLlvT8wiF5
 sS77v9iA5pCkm8Dw+heQqkCo6HC0d1uNF1p1YTVw0AoGlpdLg0d+yz1oteHmNfPoXS2YEisYevM
 OeIlincEjLWgqJjO4nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfXx9WJv3R9Pqhg
 Xqn+tBdA8AVWx733KNmJkikX+6vvjg6WSd98b+Ly1AkhgN77qwNzVP5i+eP0x4U+RqWXDOFSDWZ
 6sPPn7a0lH+G7fyhrCy38SEOrRzDT98=
X-Proofpoint-GUID: RO0Zdv-WS3jLIdbnuDpuxcA0hBple1GM
X-Proofpoint-ORIG-GUID: RO0Zdv-WS3jLIdbnuDpuxcA0hBple1GM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060217

On Tue, Jul 07, 2026 at 02:34:38AM +0530, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
> use a passive polling delay to ensure more than one "passive" thermal
> point is considered when throttling the GPU thermal zones.

I'm not sure I can parse this sentence. How does polling delay affect
number of thermal points to be considered?

> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
