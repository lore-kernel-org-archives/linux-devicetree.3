Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4BB46EF95
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656654; cv=none; b=eCZzt0VPOkwsqBTwjhE7u3fQvXQWKs+vyrudqixFzyNa0OGz3uGw7JuyemnELA1zxPNRcLI6VmswuyMZX7NbjL0ccPGPPMXcStAwsAj7bf0ok2dpNFy975+UydLL1uOpYMdOlPwL0OUieJt50lz5CnTpyYZkFZ+FHygyDoTDs6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656654; c=relaxed/simple;
	bh=ojDG5A3aFReUmVTmFESylooTByZGHDf4YEWxXzujdgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTRp303KiCYV3HRCc6nHw0PuUX1ntTkrIh0t4/3Zj2upcOmnA+UFXyBEnTmjRuSnuS2sXO4yXzzMOilqovcEEoNEwAYwGeNJK3/e3F0u4n6ma9JgPMGCnZ+nQnanad5OrA50syjOTLgvlSNuuR1lYKiue9jm0YS2Yd+X8mNoyas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drAymWl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+zI38V0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drAymWl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+zI38V0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2dwX2160329
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WLI8exdLgFmHsc6o2HEnEZMx
	prx403KO+VO00Ykrbc8=; b=drAymWl4tn8n2kngCUXL90iJ7B498h39PAKLInd3
	59Jl43XGg9gsbGefPmV30T+FSFo6KfaUf6tuMzf4qaO6Ud7A9i1pAWHNlecGru58
	XDM4CW2Futwj56tecdqgrtwuzkl/P1rIpy12cjuEflFTdHLBHgnw6LNm9mYKixqx
	73x/IYH+rxEYHBiRxE2adhNJpF2e6d1FeahSUyfhKXD2V8Dcv6Ty4EZDrVsydPyR
	jF+u5pS3HZVoGwDGrJGUhRmecdXoqcQbvEKeqdPNVfBaNb1OiOd/Ue+KpUAXPlpA
	Db0ZSvQJLzlPpzSKwHBGKPPnLuaPoPU/xMtVU5B6pV19jA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41e0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:57:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c0fc9b4f43so11002986e0c.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656649; x=1785261449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLI8exdLgFmHsc6o2HEnEZMxprx403KO+VO00Ykrbc8=;
        b=B+zI38V0vE4pMAFz/qSEWSaGVw8SDTcGHcO/0JAaiLvVgWERJC2MR8sF8dk8NomlCn
         31Z40xqvOauU7LoHYS3q926hQbAgIWDgdLUTiSE/EkdSarqxPctolXQU2Jg650RQzi6X
         5kO1rB9eimloJcT65VjE4eT0QdbPjm67NcA59UeNGZNFb5hb4IV/asDZIUtnHcxlmDnX
         cqdjWzEUPfuCntLuVgK5xQQalDZbe7Jvx02mC7i9ZQn8f5cYW6yiBmSLb2PZic2T50CD
         9ERjQlG+O4Ec18KPSfwqTImg1t94FjKxCr9r2+Erv1TN5De3zZYruPOc642TUKUexQP6
         1RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656649; x=1785261449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLI8exdLgFmHsc6o2HEnEZMxprx403KO+VO00Ykrbc8=;
        b=rEEDKqPYbQpQ/RCsEMXFGD5RdPILQN9zCO+0H2uHVWBvdXsMCF7o8wCPhceudqt1ry
         R/4CwFZA+ho79ZQH/KAv2J1VfO772ZOr76Ep8MWeNYY4Ahdws0xt4QQ3BYIoazFwSYYm
         ZVB9LKBE6mZsGdO2dsSxapCLvghir/iH/2YivnLxpzlEvPPwlVlPxr/qJhJWYw6hzBg/
         Kek+yMUMd2Ev9aY4dzQVeKo7eOkYEYceY90zceuGixsE5sayoCZvFZ+56BFS6r4yX7Mf
         4SRW2NAQjCYULLgEuCbNzSkEseSfrqOzpDlqm9M1zJFUPYGrSRu3PAb0ZdKQDVZm45XC
         javQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKnj8wiqv05NqikgNFB4dkJH6+YIe/6MNskwhIZ/2DsIbG2nhiQ3tdjmboe3Ey7MJSrlsbS8JCrzkV@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYhDVp8IxVYIbG2wJ6sdKrCTpYDt7xCDcfA4in/oMNCPiQIoi
	qutIPe0DhT2RaR3Yp13Hyo0XL9FgDhf98B7INwrmL9x3t5v6EhyPgjVgg2gDeGqhoL6jXMTeJTO
	+ZlqA6WoXa80/wpALIkn82Mj/0bqJMYmL8i5sHpwQ7xbBok/W1gn8LW+wHgd7Y2nk
X-Gm-Gg: AR+sD10PrtSCxpZLeIsCGvl9IdVIHyMt6rjySGKxlyWL/FuJndI+WMTYqRQasUmtivz
	XK9Nb1eMpfxCCnvc/qQQKyHJi81VNmLZfNXs1jl2YTN90L/K7NHQTvMa+n3Miy5PBky1g+ea6O+
	5tXuCvu8KJaWwutmnVOh87EOozgtj9gCkvixy9tvKbQFPuxE+LvOg+flKTY6kx0bfZYkPQMh47O
	zig8xxgmKdgjOWXQyrdbeTsz4OSVxqPe2QSshKpEpuJbMaLgPWji1+5rkGO6hnfj6FXitEdEBsS
	eTL9VaDA/f/+TMjyPoKrs2JoqwTLF5jSJB4XqyAXHpcWGWy+d5w19Lnrku0aywcXcxM8mWKOMQA
	eXysrQsa5X87BmJaPh6Fu5rk4tPLL+gJPtkls1UXB6QhfSJhHBlOzB5OKDyu9WepZUZiR+4GOIa
	xj+rCi/HDhUlggrw==
X-Received: by 2002:a05:6102:5e83:b0:722:826e:1423 with SMTP id ada2fe7eead31-747536fa410mr6545683137.20.1784656649245;
        Tue, 21 Jul 2026 10:57:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5e83:b0:722:826e:1423 with SMTP id ada2fe7eead31-747536fa410mr6545666137.20.1784656648869;
        Tue, 21 Jul 2026 10:57:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c5e37esm526821fa.28.2026.07.21.10.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:57:26 -0700 (PDT)
Date: Tue, 21 Jul 2026 20:57:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 2/5] usb: typec: ps883x: Return -EOPNOTSUPP for USB4 when
 parade,disable-usb4 is set
Message-ID: <6vg2kezxu6jguqassp2l6rsx3cg7ja3rxffitzmzhtbc765pnt@m4lalzge22td>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-2-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-2-cec86d0b909e@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fb30b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gxl3bz0cAAAA:8
 a=0lkDo64xaFGs7FDVTQYA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: dAhA7ALdUfADkhQkvuuCYe1VViM1Fn5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4OSBTYWx0ZWRfXxXW7gRiiu2p5
 A47zNeOJzczbR4u7t1k5IWO28huN+4u+ErA7zZ8XTUjG853HDVWPWVvoGwBO8jvonjS+/qwqFuc
 ljAq9McGkMBgzPiSH1I/MYYrzSh20Ph4JDSAd83sDOHsljM5MLFKcA8j11xUoRPtGAMqFdAygBN
 YxzGjFS1u9nlBsO3whjZkIAyqXK2TKvgGYG9Bm+VPCFmjWPcEJTszH55YD0qr3TzF4N0hhXC7vr
 U3INM3SRSNrtjP8B7tz0dgFwOAy3PmuCHU57QG5sWDc0xQ17B9JF0e8Na7o5AgAu4Vd/LcAjWjI
 BpT0xggmykmw7yy6nIWHRRkBJK2wymD19v+M/VWfSBxbQdiisZTtIJJDEaby6yLUj9Yl2grjAVb
 ost5Iq7cJT/HiE8lmuHvzprQL3dJS+VP35ZVQWKlt7b5U2PVmZiYR6ZhU5T1gP0Uqc/0SzmSzw/
 sG0M+ZKhQbzr6DcXXVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4OSBTYWx0ZWRfX93E0uQ4Garde
 PwemB/3LUl5jTvb3C6MbCIzhS9X/ldUXVaPHXUHGqQJJoYtL2Bp1z7pixKEnMt6wk1JaMk1Hs+J
 vFsagTxmtSekrSVeiPV8zF1lfg/LUNc=
X-Proofpoint-GUID: dAhA7ALdUfADkhQkvuuCYe1VViM1Fn5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210189

On Sat, Jul 18, 2026 at 07:06:30PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> On Qualcomm X1E80100 platforms using the Parade PS883x retimer (like
> Lenovo ThinkPad T14s Gen6), hotplugging USB4-capable docks such as the
> Lenovo 40B0 results in working USB but no DisplayPort output on the
> dock's HDMI/DP ports.
> 
> When the dock negotiates USB4, the retimer receives TYPEC_MODE_USB4
> and forwards it via typec_mux_set(). The qmp_combo PHY then selects
> QMPPHY_MODE_USB3_ONLY because no classic DP altmode SVID is present in
> the state, leaving the DP transmitter and AUX channel disabled.

Would it be enough to make QMP combo PHY to treat USB4 as USB3+DP for
the sake of this issue?

> 
> Add a DT property "parade,disable-usb4" that, when present, makes the
> PS883x driver reject USB4 modes as not supported. DP altmode
> configuration is still applied if negotiated, so both USB and
> DisplayPort continue to work.
> 
> This is a temporary workaround until proper USB4 DP tunneling support
> is available in the X1E USB4 controller and qmp_combo PHY stack.
> 

-- 
With best wishes
Dmitry
