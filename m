Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE3D37C90B
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507048; cv=none; b=iqlae0wHVXOJei5nhAxWW8pZHA7u4GYS2SgqWhzdArAqf1tkJC6xUjXEnbcktOQ/J5s6lGL1gJ7KIDqK37r+pMMEzSYQ2TR7wOku2Mx4VnkvtOSqcHJgdk6ReTwI9OZo9uUT0Rye0+Jj1bVpQSCk6X9SAoTb1+Mft8uIfcshT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507048; c=relaxed/simple;
	bh=ZJuNNddE0cO/R8v9f0yf/9VwZLR2weQlqfdpPLjTZjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2AwOEp/INCgi5QUhPtdBrl7fJJ4mObgBCVX97+7dGli+Ok9guPwsCPn5fryeOsUQffN9fj7UOjsWjjwXE+09pcbwe5TBCl5Ye7Zo8elIEhUuCsETfB5QzQYfE7SGi4UcJja1s5NFAak1TnKZJDGThQuccN6M4jSR1Kmaw0wEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhGLCl5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjnztT/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhGLCl5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HjnztT/9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8SUJ1726103
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TqzuJy3wA3ooJWLi2Y6laSdC
	P5+DXXCzodTafqsunHU=; b=DhGLCl5GnYv5MDcA+KGrXrMFBUSLoo5OtPA0YLcv
	KFZ1NWuZvZx0s45MVHFdoN4Yjt802X48f8xMEkOscyuzcY7JuN63XXke2hldzs0j
	guDc+mHRlUcWkX4dTgO66cp+Wb8/ofxovCDzBkVr+v2x+qjF+Kti3XdTs+FPV1tM
	QGnM4rI+VeO0Z/Fh4yMlfpZapUsgBFFb10HPqF1yc0QatLwTytDT4Jf6Lf40KBrr
	RElVsQefYpBUoeAk701ZuKhGtz3JSCL1d5QixR7RwGtmw4oFyiemLARiekM3fEpj
	TW1MITronVL8ZOZf4qsrCyKrFqiZh6kT5mn6PngFW2gHMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1vm2gy23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:50:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9254309dfd4so285407085a.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782507045; x=1783111845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqzuJy3wA3ooJWLi2Y6laSdCP5+DXXCzodTafqsunHU=;
        b=HjnztT/9Nx1e832VLuvREp/o5fZoL7NggaiysJxRP9ErWYQb/NGZd2oFH0xPl29d3/
         oYJpG00i1GTXSBZ0ksdRv2+HfTLCijQvbjSaWK/KNKwL6Xed0cKmD+8JFoPbQ1cKSp69
         YtQci6/B7eRjokyGw4ttHNDFRNrav06SjecnRByFELmxyvqUN9C9UcWW1nu51jw8nGEf
         O1Z8h1+aB6yaw1YMLtbAgWV2APeCvO9rPO8nCredDwsSPDaCURngidzA7TjA35sl3rb1
         EbqLOGK50WzY/lerm67UieMGyudfxNtKGo23o/F66soXQhR+XS1NVFKqHXimWKn0Wv9A
         MPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507045; x=1783111845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqzuJy3wA3ooJWLi2Y6laSdCP5+DXXCzodTafqsunHU=;
        b=BJl2Z0vrMlCjpUoCErjC45WdFlhHLWdMqYkQjDV/e9Kus+Ew4+Dpha9KJT5+oypOFE
         pyBbyHJQupJP85epMwS7iWKepk/H7+O4UJjV6Ao/GBTa7xADFKJ/ybUyszsepu3IsCH/
         4k7qCbB0HE9KU9d6x/i8X4WWAGzue39BSw9QN9crOCnNfq2woA0+iughoxEVBMYM5vY6
         6haBwwn+ep9JI4rrej+TvLdGWy+ltCP0CVFsyv0a2el/1CEGcnsW6fqezhBO7hX0axOv
         ltTdyBR2S7PdU+5UpO2HwqwMPrGkgnAR6B/e7s6xmXYLMaDcAOThLtc9n4R247LLoY7h
         1PMA==
X-Forwarded-Encrypted: i=1; AFNElJ9iaG34sMYkjZJcm+fzoskpdsBow8ovoMZoW7sCeJJRZj5Jit6jvT7oq4mph5wQleSEy5YluVrcGIOg@vger.kernel.org
X-Gm-Message-State: AOJu0YzSOgi8jTihoxBaBi6Ps8Xp1a+CbyQ1HTP6F0dZvhM7ewQdFlgT
	7iSAS8haYVpSqeN01oegze8yJpeOCaZ9/Ns0WJQvsWjf8em1adwT2CksytDB46GVxDviToJxQP4
	TJcKEg0JBO8Xz35NokHtENLdbPdMvvIp8Re5QkR7Oi6+2TVWOspsBxNNqFkbjcI8g
X-Gm-Gg: AfdE7ckilx9h1GWtvCDY6HrhaeqH66Uy5N6X1MDjI2Eol3xyemW5uqK/inV3gtoHurH
	+VBFk8aYVwZx535qDS6H9UNxg+Da0HFOzBnB25gpEB/V+LqwZLyLA54wvPFqk/l+ERURKsnOm16
	B1JeNMX/DpkNzcUOQUNvc68xdzftVZ1o7XyLQeJkocy/iXC1hobjGayejt9dapMLrU6rtMr2tqm
	QPt2Gb8tywO5LNzmNWlJRXPIevXPYhwKvIdEe9I+DduYQVlaTVxiDg7gX1c2HbTPRT4dRHMkQVz
	BuXasXwcrtBCVo6uSgn2qtAoFACd5d9G5bGqeza6oDLp/gRmQIqw1cBE5+OFyWbj6n/eBW+ZoTl
	3aFQ3ernLgZNr/YpEbSvHwNiOXMWAW60e/m984dgmuyLNcl5yyQ/yFB/Kr9Wvs1576zDnr0pqI3
	61GE8Xw9+iZi1i3xWsQs1b+yu4
X-Received: by 2002:a05:620a:469e:b0:915:9229:4223 with SMTP id af79cd13be357-9293d7ae163mr1335512085a.58.1782507045156;
        Fri, 26 Jun 2026 13:50:45 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:915:9229:4223 with SMTP id af79cd13be357-9293d7ae163mr1335505485a.58.1782507044504;
        Fri, 26 Jun 2026 13:50:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551195sm3678350e87.27.2026.06.26.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:50:42 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:50:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kodiak: move dp data-lanes to
 SoC dtsi
Message-ID: <hej6absxu6nsuktv7tsegduyrduv7diq5zx7dt2a4xp3pe6gxl@b2xscorilbvn>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX/EZUtaQr6Xqx
 wDx5SY7OZK86CTZorwEwULxJ30KAFugXpj19DwxaKgrnA0JCazEnmnjuQ1K/gjlAAYbGHoSa4BV
 acmgwNZxcLZGjx0fo+7pPRPEuiuzu31r0kDUvCM2MhgNzYJspnqMJm6glYUBAVxDHwEWd0xwoJ8
 mPhbZiF9PaoiTC6jhebe/tTCpuDEYAycb0z2bIcswf8fSaulfYLrRlbpm7m5NHtYSKgQ9QjTbSh
 Kvz6KjMgt52PKyr72isEuvHR+X3MdP3wRfcCHDd5b9DdcKBcn6ITwt7oR/eJPEZvia6DRgUigsI
 i8SEnas4/rRfytGnFgmdD0l3Wbd2zK3pUsRRCwUcIWpKo0luDVuu0p4/YNl+DnBb7luKsxfcnZd
 Y1srl8KR292Qee7SApeMesv/vyWaaDJ2royFZKqUFXEuuET3zJbJkyqC4VCLJlRc3+JiiK9boKV
 v118LKCjpL3GuvUYLWQ==
X-Proofpoint-GUID: jE5qiBkFlNJ7Nw17xWygMzGWPHZ9wSq5
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a3ee626 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OaWc5GozcG0OEvb212IA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jE5qiBkFlNJ7Nw17xWygMzGWPHZ9wSq5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX7siDQ43tDRqE
 wbn1oSNiSXoXYfp/2pOe4ZmRuwFRzR3x6MPjXagRZxniDEoWI/7Yo8N5IMtSHYE4pSxrb+vCw68
 Yzjqk7hyVzxRFbM5r1MTdvgztAqk8EA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260172

On Wed, Apr 29, 2026 at 12:10:41PM +0530, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> The connection between the QMP Combo PHY and the DisplayPort controller
> is fixed in SoC, so move the data-lanes property to kodiak.dtsi and
> drop the per-board overrides.
> 
> Also remove the redundant remote-endpoint cross-links and
> orientation-switch property from qcs6490-rb3gen2 and
> qcs6490-thundercomm-rubikpi3, which are already defined in kodiak.dtsi.

Separate commit.

> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  1 +
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
>  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
>  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
>  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
>  7 files changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 96ac3656ab5a..0acc6917d7aa 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5704,6 +5704,7 @@ dp_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						mdss_dp_out: endpoint {
> +							data-lanes = <0 1>;

This is not true. The SoC has 4 lanes going from the DP controller to
the QMP PHY.

>  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  						};
>  					};

-- 
With best wishes
Dmitry
