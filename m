Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D5B403AED
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339305; cv=none; b=V/5pK827zYKw85g037LaIBBqLtaxjFcCwHBfK8raH6RBk+TK8wno8X8eAZQIfycwR/xImwaNbyfHBR2ZdCr40xwQl469eNPfa5YCK5WNPHvaUNEqppnLTauRICRTuO+rORK9CSDvkhMOylwYg9eHCqiSixjDiF419bHMxrs1WWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339305; c=relaxed/simple;
	bh=8ZsuMNcUVZm7mjhEqLDBiWrZTq0eM385R2TFVoGgUt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH48Hoss0kzeB/3YodY+/HHGujRJrwQyTFeikAVm0MVBimFQmUnl9cHdUsKzRgRUQWUp5hHJToOPBV6+Po+0wuR7xL3Ib6Liu2hw+XHYFH+LSbcAqqNFDIuSgd4ltaJzxNelw2WSgQXc66wwyvO9s88vzX1DGvhpxkf5eKjTxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuEYGAW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfiztdPP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZuEYGAW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfiztdPP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VkXi3758964
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NUtxacGWOyKrAPoUx9C+oFwy
	O6QG1COqD5H2J13aHfo=; b=ZuEYGAW5iJmO6dipQxvLvliAOw+tAc83D7b50ul2
	NBJ9LlOIqAwZhveXSqh6YcChyvJEIq3hLXpS1l8/RozKrKI9+94p30tahKiu6/wc
	U8MUIXRCIE8CmjjzCCIRH9rJ5kXbBd4EqIXt7l6Dem7JLcWPOqCOIYhrsOES8jyA
	+SqmupwzzYthypqe5mB1AbcROr9/9E/c4z2d4xSOpT5diqgdhIDUf/JxeGW3T+rC
	IqFLAIDC9een6UljZbd+HlScGizZfg3xA1YlL/jv7cXNbtAS4Tgvn7GhKSmuTeIr
	zFG5H72i+fzzKUlrWEPFZ6cXnAlJ3H5Sii9xkbJatbreGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ck0gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:55:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so232044085a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339302; x=1788944102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUtxacGWOyKrAPoUx9C+oFwyO6QG1COqD5H2J13aHfo=;
        b=JfiztdPPaJvPHVqP6vBxXzovlO56WjcR158M2ICw+3aGOT01VCKQM7lGtH1sYDpS+3
         P3VrzLnL8wDGJCsK7Mrpm+6skVp2z+4/5Om6kSclReQcl75lP1+DG1w/oVBqOV9Vw0Xu
         BJi7kUvDF0vqdsZuwB1Xt+e1bG/TC1GBEMoXS9kdxtRb1E0SSOB2rsenXr+eRurLQW4s
         MWX2IU7BVwQ+cg/UqHTzDrYVr4v55sK4zTIpn6Jrr9tQJ63SlLNRfnlWkHE88uQrySnr
         1pdEzwM7yan2+7sUboyqKSFvgIB4ppJoODEkmNupTHOO2LJEFRWIhQf60dwb57knwopc
         yIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339302; x=1788944102;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUtxacGWOyKrAPoUx9C+oFwyO6QG1COqD5H2J13aHfo=;
        b=K9DTL0voqlCB3a/Ng+/4VHOb3wFudFpBcte0IoXWUpW+uET0kcyqAz2QRxXxHFqSsz
         OLgLtqXwd9fAPLuv6J/v6VR1IkofXhcQ3Ppk7gF1DKsnIzdASFdgxH0F7yxPvj+7YSR3
         YYx3jxD9dSsupJyRfS+STJbsnb8F3JEfFxCqY6AdvU8b068Ja71APmHafIl+tzWNQYrp
         3qGUQtG02hZsL/z7NTOSwuaWYmb+2qdP1y1KI/Bw8bloB8yV6P1KlOBtSlzWrc818tRK
         +MIax1XRVVDIbWhHZYJ3NyIlHQQTP1rZPNd9V9EphennKkyR5BySdtYB6eJVd1ItasCj
         hwEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRRtG7jf7Pncl7hbOq6dgfHGlg4GC2ULZkDxtYpuUjfwBLI5cpqAogGhHWk+SVdItIWdgejhPZro1c@vger.kernel.org
X-Gm-Message-State: AFuF++l7S1rLp+ljjAtmr1Ca9BTQkNGifCQQZLBMMGZuZdnZ7javE6wN
	5Ufm7P9aNGorOilVa1kEuhI3grcm1ZAzjx2NuGr90Gy4m31VgY6xpegF1LB7jLvCQpjvISAu90R
	iLO8LRfYZIq7fF3v5B0u3U411ACneSVRgWinA2XeJ7Bkvp626YYgagO7HPEFIorH6
X-Gm-Gg: AR+sD12pEcIJx2EU0t2ub2PLk4smukYsrkm/+qVaMeTG2eejrBcdeZhmBNFS07xABjh
	8eQCYbY4kzrVp+GemOFANsau2CjizaoiFYdAQxWTJbz9U3GyvTvaQRS90yl7w+7MqSC9iaG1AaG
	7Xt+Nyhjbrtx0Ebjj2RdmC1yPaGyN1z0pFpVqDOtg0HR5BgOTzYNJpm/YyKJvAGFBRnn/c6rmrJ
	PD7OKMiF8AyfXL9RntBNX5EGG8FxajKMSrGkUzhmGWl0QGtBMNnO++W1cu/+lI+bIBaMR3LKTQa
	DwJdUkndC+LhHLWktTqh9xxojazODjUm98R0UoWPHjf/zOnhfI5pwao0XOtqswQPa4kOBdUgE0K
	/ELCI9FrP6cu7pLQ=
X-Received: by 2002:a05:620a:2259:20b0:939:5c74:5dd3 with SMTP id af79cd13be357-93960cb15dfmr284865085a.9.1788339302015;
        Wed, 02 Sep 2026 01:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2259:20b0:939:5c74:5dd3 with SMTP id af79cd13be357-93960cb15dfmr284862685a.9.1788339301509;
        Wed, 02 Sep 2026 01:55:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce45f4f93sm52361235e9.0.2026.09.02.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:55:00 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:54:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: x1: disable ps883x USB4 capability
Message-ID: <ox4rfazd43csfv6jkn3shorhg3qkgnol2lyoxs34dhj7zxileo@2hirnxvga4sf>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-5-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-5-cec86d0b909e@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97e467 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=bQQhJZEDtjE2e6HM2JoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: wdYdJKx3vsNxeVjtvHO1ako5RYul1RTk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfXzoqJECJPsYAZ
 61OuJL8PpqS7jIka3Pe06NAbFUxgvSAwjiXzDONkFUcIYdsCiY0iUkm26CQZpEENeGdi9oqgtxW
 FLpK1KWqi4GWI/rhWIfBnM5lX2Y7UAM=
X-Proofpoint-GUID: wdYdJKx3vsNxeVjtvHO1ako5RYul1RTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX0GF5YHoRxkC9
 NyC+g1/Ojx/Xz3FiTPh7PdzkQC5EzVjw6TaFfjYRo6y00Qm9LeCM4VoEfVvPYHtj9VstlMbFdfF
 vYArPPiYamJymgPPSxdV3ScB8N8Ew7WU4V0scFi658IDUfDa7bduw85dPjEWmDqu9Wv8mFaa/Oq
 7NyRZmfN4kQUN6xwCpAASf0mo0Fbh7or8+ESOmizTE+EVEZciDP1Eyoe/E/aJ0rH+2Kr9bqu9oS
 uetU4FKWHa7f8WKZ8PmFL33lLYUlbU58xN2rEU3cKlu5wW1+q8ghc5fGXf+BJtckV26rGHCsIw4
 3qzWdAK+kbRyN3DkP5zSbYIlce2gl9h/V9Gt1QesBgtq9xX8GM7HPjW01DS6mUBOnL6jacAJy+K
 B4FtBVvgtUMphZWebxT+3YH1Zncjv0SWP/oU7S6tKAACmiYEaxcijfc3n3bVuD/R+NXooKhLRCg
 OdClc5wpna6eiFN74QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-07-18 19:06:33, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add the "parade,disable-usb4" property to the PS883x node so that the
> retimer driver treats USB4 as USB3. This allows the combo PHY to remain
> in a DP-capable mode, restoring working DisplayPort output over the
> dock while keeping USB functional.
> 
> This is a temporary platform workaround until proper USB4 DP tunneling
> support is available.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Assuming the bindings get accepted, this looks OK to me:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
