Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793249009;
	b=KRDik+fsAPfyPwQGJqTyBCDcE4z9GuYt4syFMwTnOr3dCDoAPsQnuPZ/oCrS1lhDgPcW
	 YzMxBxm92bCuuztUrsOAC5d2GAz/ptW2b1rwsCWnCoYdRMTJt6d4VgsGUW1BD67anxoAi
	 wT47RHMrut9GBeJ/AJk0sm+E9W2E06xGv80HeCeVB6BDhNOps1UEcSLxbfJKJIxRXhgok
	 +MVi12EcyaDY5sJgO2O9VocANdVnxX3wv3ft3LlcR2zBxDfT9XZqq7loPwzhxNqC4z6ZP
	 OrclDvs3ECrFMDKY9rpZmMHrx85dUcEq3RAAnKyMbQN463PBkesb/ma54AE9wwi9AMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793249009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
	b=wirUNaHAOQkqb6xY0wBi6octUkC6FlhHRtGObvkSOGIoIcQYDwqeLtWYLyaTS6SkvUw3
	 YOEuqZnE5bx+8OApfKb2BcARDuC14zLYnyGjNQowQAMSe4vqWGgI4OYysse67ef4xNYbj
	 kAyEy0bzL8DJkckDiLUrHQFt+4f8A849yDg9Zgmz1GPyxfrx5u6j4k3pD1rpcfyH+/07X
	 0Fr2fJagj8Xql9WmK8ZR+Cb6mHF70Gr/OvqDgTN5ZZ02xnP+3PR/aqYco4OwLvOB8VUCd
	 fQAhYQuJDbEUe7d4TRkT21DfRI6zcImKpvV/p9zRBjASTLwFnu7OOkmCdJnObbhz9fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1QNesmO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5IRYPwf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B10606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 04:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B10606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1QNesmO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5IRYPwf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jTaS2337845
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 04:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5uHNMI+mYwqaa6AkEWaTgDK6
	tIel6I/W1KNWIPq9vxA=; b=L1QNesmOMfxm4HJEsyioci1+1ty8vabSyp63YJc6
	Y0pm/BVQ/U3WktR+OmxynvrRZ5nseI1131WcCB4gQkJaF96caniWT2odYjmk7ApB
	8Q7V/PBVzGsbuvxswjKaVvmd/UpzxV32KFcf8cnr+grakLQgMiilhj9XrWHhnJRu
	D84aIsGpIJetIyhzEOKYA0GbL7/EUW3Hv5bNRymyOOfN+v8OUBA6jecrcV4hxV6U
	9zQu5Dzyo1IYUjx3cTYK+YLa6cRVcRlC7uoy8hHlfxKEzXZ2qtcUBrErXpNdSPgp
	OVfxm5VRg5jcz1IR9Cg56PHx745tEoxNBwB4P0k1CP2fGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3n9a2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 04:43:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso1534116a91.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793249007; x=1793853807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
        b=U5IRYPwfyOuGTQIRf2U+4vvD0FDb2PNkaf5zse/xHRdpM8SuqIWcd/9e71zhEIHcbV
         A0SLfHpIDsXs1/zBmbexZktGhuT6WKtxrKXfwc26OtOpVrU+Sh2/rP1oxuoMBD7dL7QD
         tQ839aC5MV1K1Q8syJvyYnvyXSf68a0KWPvFKtnX5HCkY7s99A8xKx6uA4qp+lFQEFvH
         F7E9M7LFj+FcleB+MjQfxIv6ZcVSBECLdc4njTWSU1xPONV6H1BxRxBim8yTzVw4aebB
         HL/R0Tc12aWIXNHKURYapGqmcS/kzYcvyvrjXWnzi0uHTNYH4ktHjauAV4XvGJ/SGD2V
         n1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793249007; x=1793853807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
        b=bLaA5Ms6FrriR5LwbVTGLzfi9gWuAEHTRoUefzL24lD5pWhMOH6SmMJKDADblledOj
         KAZle4yf0sKX6+F1oof70LmiISegHeP2EjxszX59aUcRJmmBMYi/8nCIKa2cyovWRpOD
         FER3noDn/5Tne57DvDOWjYA9N3Ru6Qkavvh12Fc+14nRVWD1laTvrNv3J3O3Bfvhex7F
         ZCR8j0vA8OBD3YDlOqX7SzksrObztB6R0ICGU5dUsdu9UYV+Q1HYIpt+Ne5JM+wy48XY
         ZwNulrbllmBQwezryF65ltlieXV8kRHsBEFRdGMYxbGAQyjjeBkTjOUDEzbozrDPODTd
         xS4g==
X-Forwarded-Encrypted: i=1; AKwUvBzyTpC0KvUAagWn3J1Jag3/vEZUHhTvvagvkg1r18YA2gtwDJDjB8j4o49k3TD4te3kBQwlQlf6PMDa@vger.kernel.org
X-Gm-Message-State: AFq9FYL2SdviDNSft/kktA56lAp9kxCkqPPzBpggR2uNBCYdHop4Vjhs
	dNFFCcckDnF+qn49u+xw4+kyGxpfkpoi8MMXxlEsHu+2tvGXxTjr7okbtauhBWMPSxcwKuncs9A
	v4h6oBmwzI8y/fSR8YooDdeCh9gtNJ3oCZq4OnHu6QwiUnWrSFu4z7bpMLXIkU1CO
X-Gm-Gg: AYBFou2lj6Y/x5qXGQARDCKVkXcqYoTTioUXDoD7Y+wTab9CiAE8hMAV9Zp9rs7lq9r
	KGrvnP4AcEJvjOE52CGznsIlq56VBuWprDatOxMW+HOs71BtBxSRObBco+SebZZz+xeHWIxRRZN
	MFpDmAkkR6OHQVTaKBzO8wqS8KzoZLVhMWLsWl3ie+d0EFURaOqVcP38VUmkpoh56R0Q+Y1RCzx
	6qxN/Em2arLjDLN0vVZgNf0sEWPMlk0ZfxEolz0uLzKxXvYST4Nz+8dfm0KKhxKPjO+/0QvhPFh
	t7EdnLaKb8mhh4UwmOOSqfbRFCFVBKVSEF/bfRkXXHuoMpsVjWzDDQHKhdIXdPjhOlkAATDBe1y
	sZfVFDqsPMOa4vovDEklEo5E8TNVV9hOU8s2am6CFIECvdnbNuJlryveTDvB86g==
X-Received: by 2002:a17:90a:e7cd:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ae580a0206mr3341881a91.36.1793249006551;
        Wed, 28 Oct 2026 21:43:26 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ae580a0206mr3341852a91.36.1793249005981;
        Wed, 28 Oct 2026 21:43:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac878sm2108575a91.4.2026.10.28.21.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:43:25 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:13:19 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Message-ID: <auLO5z9kXDaHl1ka@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
 <179318601645.5872.14222392238387100610.b4-reply@b4>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179318601645.5872.14222392238387100610.b4-reply@b4>
X-Proofpoint-ORIG-GUID: ON8TW0JfXdRvjLiyaI5vXpYds7sByYSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNyBTYWx0ZWRfXw7ZCB6BRGOU2
 cHUvtXH+zz0r9v79N8nYaq2fOqpABOeWCq1/mspOOKeTCq086Bf6p9qV8XIHD7Cw1WYHbwJhApU
 nY5qVyqlx9H44rL9PqFJz4sXxLhDkEwwf9+bdcvEHEgTNZoqyjrPHTp7QYiXBK63FT2dAS+9bxE
 qq2JNfvLuMCGLS6gzR3bRWH0/XL0tI7l7MTMvmt9weFn9013W7fXIxqCLNJVrhBOGBoS0MywkIH
 5fyS6n6hbuJFIzOalf4q6DvoxkgHDXjk1SGigOrLlufe6kBMim7QVk6ptxM4gTzP2yuRXnmfSEg
 4qx2mPi/BucUR+lV/bsUaYPndGs4Ec7zn1qY19drauYqpKIKgAaS73KqOhFzzF1gVOBw74MWp1K
 r12lCb4wEDivTS3ve8+jjieBUJDJRs8Oh7OEQjYrrD1h2wdVxFzz98ioT/Vx6nAys5hWkpVzjO/
 T2kPX8Ejjj2gf7Npi9w==
X-Proofpoint-GUID: ON8TW0JfXdRvjLiyaI5vXpYds7sByYSp
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae2ceef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gdjW7vFeMs898lxTiF8A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNyBTYWx0ZWRfX4Y716ygqYorn
 dNSJNDFVCq/ithHoYKKNIySRLsnUQxC8LxzCpFKw/HcAfour6eKPj0CENXAx0dPcWLIN7poOxH+
 VXRz1LxT5li/vmnvmtVrT238JPeRnJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290017

On Wed, Oct 28, 2026 at 04:43:36PM +0530, Manivannan Sadhasivam wrote:
> On 2026-09-23 05:34 +0530, Mohd Ayaan Anwar wrote:
> > Nord uses a QMP v7 SerDes block which is an updated version of the
> > SGMII SerDes PHY IP.
> > 
> > The SGMII SerDes PHY supports multiple operating modes by programming
> > different SerDes line rates. The driver currently handles SGMII and
> > 2500BASE-X configurations only.
> > 
> > Add support for configuring the SerDes to operate at 10.3125 Gbaud,
> > enabling both USXGMII and 10GBASE-R PHY interface modes. Finally, add a
> > driver compatible for Nord.
> > 
> > Select USXGMII as the initial interface mode for Nord. phy_power_on()
> > can run before the consumer calls set_mode(), so this ensures that the
> > first calibration selects the 10.3125 Gbaud programming sequence.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > ---
> > ...
> >  static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> >  {
> >  	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
> > @@ -275,16 +419,19 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> >  		/* 1.25Gbps mode */
> >  		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> > -		break;
> > +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> >  		/* 3.125Gbps mode */
> >  		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> > -		break;
> > +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +	case PHY_INTERFACE_MODE_10GBASER:
> > +		/* 10.3125Gbps mode */
> > +		qcom_dwmac_sgmii_phy_init_10g(data->regmap);
> > +		return qcom_dwmac_sgmii_phy_poll_usxgmii_ready(dev, data->regmap);
> >  	default:
> >  		return -EINVAL;
> >  	}
> > -
> > -	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> >  }
> >  
> >  static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
> > @@ -340,7 +487,9 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
> >  
> >  	if (submode == PHY_INTERFACE_MODE_SGMII ||
> >  	    submode == PHY_INTERFACE_MODE_1000BASEX ||
> > -	    submode == PHY_INTERFACE_MODE_2500BASEX)
> > +	    submode == PHY_INTERFACE_MODE_2500BASEX ||
> > +	    submode == PHY_INTERFACE_MODE_USXGMII ||
> > +	    submode == PHY_INTERFACE_MODE_10GBASER)
> 
> So the driver supports all these modes for all platforms? The commit message
> sounds like only Nord supports USXGMII and 10GBASER.
> 

That is a valid point and something I have been working on for v2
(Sashiko also raised concerns about the possibility of the existing
platform using the offsets/programming sequences intended for Nord).

Going through the programming guide, the existing SA8775p PHY (QMP v5)
only supports SGMII/1000BASE-X/2500BASE-X whereas Nord (QMP v7)
supports SGMII/1000BASE-X/2500BASE-X/USXGMII/10GBASE-R. Therefore, we
need something like a supported_interfaces check for each platform.

	Ayaan

