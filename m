Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AACB3AFAEF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461620; cv=none; b=mIhjgcm0Ua3tfLmLtOmMBw8DLoRRIoRWY8KzA1W/iP2xQ5VzxML6JoA0Y6ibJ1CDvHuLpokpQZcBdb3PkZfWai9A1DegHR8q5LdyVnZ1gxR9xbc1pKBZSK0zc+TWthGVzzCCGBZEwNYtibeaId9wxdi+rBn9foduaNYE1uMqRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461620; c=relaxed/simple;
	bh=ihOpY57dJ6ptn6bsjW7kDrDeDTlFHOf9bCBC3cquFmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivTpcS4LWNNJgaehFwPe//DSxFulQC6BccbVtbHUe7DxUaW21PHL1CmP40x0Ryi5utYTSjdoTfKi/NWPWInXDzaFzzQDrZj8TXE42XaIf24YSLq9KezX4F4TOaBc0DCZKmkRF7OMwRdzYKna5ncpXLHW2H1rlP6/FKxbROBXiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exZihVhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O72fv/RQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exZihVhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O72fv/RQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3FPD417571
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 18:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y9vi/nZKDsDfSyAIlc9ccf28
	vm4I4bgIpUZPKJ7f4GE=; b=exZihVhHXKE4LPHfdLGiWPX/SAxms5HufyvbTfNP
	mDV/yVYt1FZ7X4be+GDYRSJV2rbfUzWhdAPIezaCFcNXPp0tyPlnXpxIukxZC5nW
	mIXzy6x9HRcL4M46bu5p+cxL3E929ANQVE8FmdDyiJFYZnuGwpjFBptZ/8L6saBV
	Vmxg2dzvF3TnlQFT2vflzXcX/sOUuTEb8L48I/J2DAIyAtGU2FfGTHEO82wCXJLo
	XPve2CjBN6kys2jTmJknRE8TzVG6rgqEqTqyPsupCY6NcJoBo44qHHT+hw27BWLQ
	unz2o5cKbPpt40ute7gjlfoTFQmolj6JiM7qqMsA+Fvu6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m2wex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 18:53:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so261810a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461611; x=1789066411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=O72fv/RQEHnjqhVFQgE3TsAoZX18wNA1zPeJQ7Jqz+jfC5je0PYY/tZovVSAcn86fN
         1C3RvLdFo9muZuLVRbLrRPve3kX6mjtjlZO1XscITxI0/jUi1Tf1Ek0wE/0fiTS2y/lh
         nNUDEzHISArEBycDTkxZrpt9SQ2VyR3islza54OuXKL+c8O12T05Nfi8X29Av+Bcf84p
         blqGrePublLHZr6qk5DvvX5HdCHItdRj2NyMbsc/z81WmR//hbysigoZizzdcQ+guFO4
         fODgljK4H8bQ9kEhADNSA3bDRnEfGyNt4eynyH5rbYwRN8QkjHk7WFafFEyRdthCce20
         Bj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461611; x=1789066411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=Rv8htW7U7OZu1C25IsPI6gFQ1IWK5fcFBP8kPmcZdaE4yQQx8CRrBPVElMDicBLRef
         x1w9Wp9Oj9AsC+V025ovGGmeMsPtkrUWXqihO6gyXbLyWNf5l9P5elUhXLflOcrIFHCT
         En3OAjOhPtPnGoZqOA4ZuSIX21pSj2AipuUh6N+ypT/aARDYp0w4qnjueiNl2QToewCZ
         3DnYzEQkx+OWOEjqLf+WCwj20/B+qSPnoT3DGYE/btb/ezfNKfj+RhQv+SWRmxKhVgBF
         3t7rdzJR5qdXaoRYbfZhPaSODp/mmrrJT5GdlZOi09XiMjNQA4szMekKMb3GHRKayoZC
         vxAw==
X-Forwarded-Encrypted: i=1; AKwUvBwsjBXwu+ljVDTv/xpVkGep0y9hJRLSWvm0gdtlOvJehQWCtc+Mdu8FdzWxEsfmNakhkx2TTZ6NImXR@vger.kernel.org
X-Gm-Message-State: AFuF++kCHOH3g3mLmPp4No9vDY6GR12L/y8aQboO2v4Hy3oi+Q1MLzE7
	y1mFpCOxBE/Ag5/xOnuEJiE5c6Ic/tCUXbQa4yAM7GNjk3aAZ3sOvBlIFdBdEYT4QC1OKhCXMAB
	cpM0iv/tWJjYhcpHfcZ7e6zLfbm0ftdLHsPoFkG3ZrDXbmz9X8S7iqnBNOs/Qo1Lj
X-Gm-Gg: AYBFou2HMLgSrl71Eb8ONi8bjKm/V6xvR2ZOar+enS6xScwILdMGkIW6OOK3KPP3G2T
	ovfymejhcQvboijtmvRlJnaSQO0XrqZlAwNjGc3QXXQBcd77GxnlcfxfmSGcT23I19CYyt47JCq
	ZWqpKAp2ZtGZB9lQKjuc5zHcjGUPqZabbPZVFWJdSDCM/kVJqAA4fctgbc3MFN+SbTDul/1bQvV
	wkYr4Jw/SDd6p0e3lKwi3+794T5Yvp/2IJ6bTXQ/3NtUZsRmxhJxTtMzPN3uTtnv3iWrUOx05RY
	RB1H73CI2D6L3NE+P70Gf56MTfl5tkD+PrIr18vk6sl0o+QK2TF2rusyDxtXnVAXiEeFlq+wF2T
	9qii8bjnp6+zZYA==
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820687a91.7.1788461611215;
        Thu, 03 Sep 2026 11:53:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820628a91.7.1788461610790;
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm656611eec.6.2026.09.03.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Date: Fri, 4 Sep 2026 00:23:21 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <apnCIWJ0b3i3P6YG@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
 <ajF6q5eKz92ddqVl@oss.qualcomm.com>
 <apU8Yx08/PJiS9Xw@oss.qualcomm.com>
 <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
X-Proofpoint-GUID: _BRcLinAk5pnsWcoz2WTpdjDOdpDC6kF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXwaIQscAwZJnd
 802SGsHe7apENupJ+1IeiEXSV3Q7V2t22RVIR4Y8Nh1b/zel6lMGKbEvZOHP2DxWzZF4aTQe7hS
 JtPhYz6hN74kUAu9HDb1Ml2SglaGnh54S7xMjs0AaOpNs7CKcooig27Pz8/9k/i9lmxJnJw2JTx
 S4hFAApEMEck1NLKxqoXmYPk3dkPUUnzX8bAGccuOPCcDgFapzB3nD/v5EEiZ01kQgQcTjzWwLD
 BoqwejCCg3qbp/7/SgFPFBerD26OKkNwzx1T2vVJtNwg/oQFIQ1/2PZUWCV2TN4DwNkzf/wozzl
 zMDlFXPHvS1zPA+/Gn6XfNr7ehyGNBFpBdbZVUci+2WMFZa/DR7Gmnw7Mb1IS4eKiO+svXNQhvo
 y/z37WSU9Dcsjn0Y90kMMoBdwyA9poQG/b6z2t5R+Cq5bASkg2tHFF6jr4HrrM6v6lm9tJXG1bp
 /Ou5EnIYGgmcokCbw2Q==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c22b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jdP34snFAAAA:8 a=bKGmqkx0FprkRVM0NBYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=jlphF6vWLdwq7oh3TaWq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX3ej4QKlSvI28
 0l7jCkuvDLEMgmyOxVvThK0E1npYg2YM2G2NpYM8A9H0JcRARAwyUchzE9Yb48xVeGN80E0Xjvk
 UFLSX4Adov6P9tQuIA6s0hFMNVHXoMA=
X-Proofpoint-ORIG-GUID: _BRcLinAk5pnsWcoz2WTpdjDOdpDC6kF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

Hi Maxim,

On Mon, Aug 31, 2026 at 07:01:04PM +0200, Maxime Chevallier wrote:
> 
> I've been able to get my hands on a qualcomm devkit for ipq8064 :
> 
> Compex WPQ864 6A02, has the IPQ8064 connected to a QCA8337 switch
> through both the ports, one using RGMII (no ID), and one with SGMII.
> 
> The DT is downstream, in OpenWRT :
> 
> https://git.openwrt.org/openwrt/openwrt/tree/target/linux/ipq806x/dts/qcom-ipq8064-ap148.dts#n198
> 
> happy to help in some testing as well if needed, this board is going
> in my CI for stmmac stuff.
> 

That's great. I think this board uses the dwmac-ipq806x driver? It would
be interesting to know if it also does the whole "use RGMII so that the
MAC can manage the delay" thing. While I don't have access to IPQ boards
I will try to figure out what this driver is doing (hopefully I can
track down some documentation about the "NSS_COMMON_CLK_GATE*" registers
it programs.

Nice to hear about your expanding arsenal of stmmac boards :).

	Ayaan
