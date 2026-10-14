Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B614A92E9
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021606; cv=none; b=an2rwo7SX2tH2bPMwnxs2Y/TxLZAURgXxfVdGufi/dn4xceIaRGRfOHstF7qygEskK6FszB531q79e2/QDT2DwGKoUBdoBSX7dBq1N85wo5btQuD6LRr59kYv5hvq7NzlzUcjWoedPoLvsYIbmck1mY0jKOgeAeKQvILlOIZU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021606; c=relaxed/simple;
	bh=PD4O8NeXrpVFSdk6A1M/yZB7EiBrEVY5GZoYdPfOTBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktl0OPRO8TchqgnzD9rnsAMJGImZD+u603yaEyHFeZOgn8XvdSim9l2w1+T1k8BZkY0PnAemU/tNEKMZSWF/iWxTriITSTtL5rGcI/iG+DvlKvGJmc02SHn11lA3YQYWkMlyBGQxWE5Vm1G9NJe0z27Th4qny8bMH2FGXKlOa28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxiEO0Cr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8Qo3Ien; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxiEO0Cr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8Qo3Ien"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELosm1301164
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGsSHjvhagPRXiAvKSbTu3/S
	aEhQGd0uTphQRGhmwdI=; b=JxiEO0CryCiXsww03jKFnqlfHqxReTyDdp5kUXLv
	QULPpT3bTqj+lWLIHihri1ovAEzk4GyRNwUyYc/O1WY/L399eRXvkjwpN9Ee8tVu
	nhgkYjZjLiTdRDYUVYMLrSBTFDhmOGT3/Y28aeetbLENcyaTTlVKEuXjH7X/WcEj
	K2IOA8BZL0305lUDw7JTpuHTaDg91pAaoVRygueHQaxER3u2nvoE/fUO4GW53Gss
	j6cJAhqRwH7uSPC6qXxRXstO7FEHXCa34JNB7E20gEeMmSBsyrG7ZttvWpI2iU49
	/nvUSTC4mSVM0y+b4hcbwVhZsv2IkP0fgS2FvCf5K0Xh6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4623y31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so812753185a.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021603; x=1792626403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=L8Qo3IentWa3J7h0S5kyDB7gScSm+sRcrPvMJLHG2OgJyE2R/5lDfqYWzeoIAWYFJG
         K1kbpeOSYdAfUJ0Verj5BY3LQbbREHLdRJW5qHrcFaUAx5nqjkJtlnqZ+2DRn4mYpK5N
         UOnG618yOnVOvYNIZSMwEM7tlqxfXL0NHg4z+QAzkGp9sqv+BGsQ25TS/0iaumUcaZOA
         Md7bDvvguuEWrW7lKslNFiQ1Lo6hLTTn5EfSIBVsm5B6lZCcm/UA7G0nrL65RT8rC7sD
         GSR8h0k6lqjYrArBfmyrWWK3sUunG0FMXBf/TS+qDDWv6NPBZZbS8eJgMAsTInqq5Gty
         hfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021603; x=1792626403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=NgU8ik/TGAtMlW5+kZ/ejumACZPBbBLK0qDltHNfueT5TNDSjUOnULgkC9OJ9eqnl8
         W2rHVJAH2K7Nr4wKrPUEgDJfL9vppdWjN2XMNSS6PW05XYMuoKg45Ye5tdwdB2mxvqZM
         B9jD6svQm+GD6pNYqrRJ3cVc2vj9a/XX3f6CqYdlX2jyzsCjzxF2RWGAuXpeoxLrllPW
         Zk5qxXg5PDjHdRu663/RCPOeREMcGXfYatX7eneQaVXtnqnkkpDrMK2SDiqCI8AeKo2l
         72tt+YWIyoShVJPnQgOGOhKf58lasmwZYvprHowW2oQHTUbqmmeF94o/27jc+dkxYCZz
         6zUw==
X-Forwarded-Encrypted: i=1; AKwUvBycyZobE/llpPOms9oUDSA0e3DggbezvLNIu+5q9lQLFQwyYzGmgCp9Sj7cpmYnLjUthH3DtpRVvzdw@vger.kernel.org
X-Gm-Message-State: AFq9FYKksy8GovntApX3GV6wsObBcI7iwFyt3czyj44uDS+Z9fh13kGJ
	iyDLn/dydjG0cAUIMd/EsoBFyHHbD48VWOR7OlbrrMq3yqQrDhcd0z12UnfURioEmvKfc3bv+N7
	GXhctlKBr0NGltdVX8UWYD0gwgkS7hi2vb8xdR7jMCy5atMifJrCwdIZRT9pu/cqq
X-Gm-Gg: AYBFou0fqa2uxFQpA2i1NIft4ksr3z1sZ9V/Jl9AiS8dWX5cis59VJEIBXKicgy+Oe7
	nTaZpUbs0rszC3qIu72ogVULND4ZvL16GdelMmp3++/k+xLQiN49aq1NMgJAQbf9eEDEcEGdS5G
	NcOGLTWWxV3A10WpAFHrQjxifnWme5qsx2gO2vACbMyqsBy3xOAep0T1xcznBO5VSSg+CjEB3ny
	E+OGMrfu/kMmKHb1jj5+3Qm/SKrl6Rq7riSoNtJ0wO9U9se1jHpO+EOzSjB++cte4H2EW0e8tqt
	GR98+hIzurVU+97OZzhtB7yI3SiPUqmtLuQY3F+eBVVo9+OYZ+/L5y4U1LKFnYhzma1sot5D1fb
	69MVfBhk1+K1uUvsv5b851ZWZ83LpZ9l9qzSPzeP78xD93qJgi2PYgbhMixjnZkaKpPFxYOlOU5
	xyn47F+UE29BDU
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871710485a.2.1792021602913;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871707385a.2.1792021602398;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm939809e87.66.2026.10.14.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
Message-ID: <qgkw2qvqwmchclsdf3k5omanjd7qvm6wyxfjy7bb66w4koarnz@6s5k35dmqvai>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
X-Proofpoint-ORIG-GUID: HL3hiKDY0z-wK47EMMw0DfZHlI8S800n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX7Fv7ybHe59eJ
 SDS2lWU0M21ctqQqmR/iOxbXrLhOZIaWTR03oBVpi+bg0PjyXOA0AhRFh4bmAorxPsRosueaPbo
 zoGPXHqfGXd5b0uPb5fhe3LUK2r6igJKPmGm6aeOujAWXfe7tdhCajWGdQ1IhqOExCfOi/dVjK2
 HC6jcbWrhWSUuz1Ah5dbK3u7uh2NgMDIkLD/0dVL0z9/Se2xhC1vRnvLGaqemCbr9bDbbyAsaJC
 iGXu/Pa3xhEdu6Ftc8bdtVIvQCKJ5Wcz1ypUuHcLyLVPAHxtcFAz96+Fvmc0d43T4FEAFaGHXoc
 IcJHM6OsF59q8vjDPv3WvvfeINCi4wKtYMo3iwe4Dfn86CN1r3d7wlgaeTwIirzwORIZ3KMOoPW
 q7WWf4JDEOnE272YWRn8JWj3QmT7dJ1bSOpTtOy0ARXdC64PjUwkiwdFCH+ZzzFwkTTnOanEPwo
 r4jGyYNotzD8Zbrpc8A==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6ad01463 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oov9_tbh0Q946gG9V5gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX5EgOjU+mDN3b
 aaPbDfP1tH1+NAyRl0kS/Jr6/To+pIm8ZdNe+OKz+B6NvyccauVMGfIX6i0i8+S4mGyssXpztJd
 Eik/Bp9x4c16Xze5xOaFm3vGnAKy7dg=
X-Proofpoint-GUID: HL3hiKDY0z-wK47EMMw0DfZHlI8S800n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:50PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
