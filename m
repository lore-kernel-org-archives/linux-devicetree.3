Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32112477994
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627575; cv=none; b=GOG26OLDR7xSzDQvCH7dmeLPYwqJkfNqqbhG+TZFvlBYBI6pBokQgRQZ2/uwI29aaLbsMm2D4z+1PorNLTPzCl4QeCid7dNxzs77MdiMtcazIWKRaFOW8LkqiGowbk+sxmi46+lGRZ2O95PBzm1sz8uReH8s2AXo8VMokykkFHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627575; c=relaxed/simple;
	bh=lWWZPYEQrsIsGdAAXnMw9QstRgjLolTF7cGTMEF4YXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLLodpkfmNWecPAK5u79aoI+TC7TxThLOaMNtB/D4/2tk0HYKTc16CYGRidaYpREm1oT+D1X6wxGbAPuvfK1WjjPSXHJGS8vSdWvw0asJy/OvQkElbVSy1HWAxetjmrhzSQcfdYJ28HmywrjaFV/8yg7JSaomMaW0XBtO9zCRkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghlKm+wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4yI9DLZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghlKm+wz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4yI9DLZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFepbV4131466
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HTLmtc9ksI3Eco4GNG31SXnN
	US7oWeItGbDEBkSUCOQ=; b=ghlKm+wzr3rwcCYPHJJPPl2IabGV0RObc7v3ufHv
	Af5mdpjw84AwRh4yDrZg3SpfLgkcHAeWBh0FHD0z0HbXdz1N5fNC9k/MBSGSJxYJ
	Z2iJ5D8JR2YlecMzmtQ7caUkP0MhxI56qJVTW5YrCMK59E0NRjz8QaTEKSJuo29z
	Qf5GaL89jZK59uwBwfBZHjYlGG8E/O5iy+LogQu4td2ds3oc7q7m9Pg5nhPEtYd1
	vmdpqekjL90bSW64cEE2Ax7UZGoodtiIkytS55m+XsyGlzKR/ojDXDN6HjvOQLlZ
	WJPlWseHn3+joMGIsr5VZocLhjov4eRdEowpDtqduzflgw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1epaj48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:32:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so355875ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781627572; x=1782232372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTLmtc9ksI3Eco4GNG31SXnNUS7oWeItGbDEBkSUCOQ=;
        b=i4yI9DLZigSd6Rh3PyiPOd2ptzLWHYvadcMSJE1uXY/yUawfFtSvwSiK1JwGA6P/Ww
         aP3SmXssyWl3kMW++5/yaCDix9U/YBQM2Uu2wT/6MTQLEv/Cjfs6H4RxuorGEg5rThO5
         6FrBR3wUKZaseWeX87+1jyr6u+Us5uD2/drACPYboipxnPaf2IuIrgdbbS/LkqtbtC0Q
         G/RrC07v+ZQhgsCE9Y0xXPLMXzMfDAabeO3CAr1zW7SnFW/GdCJTgfUjsXZvN76LvVCw
         A7r1Z0xm9Vme+rxx6a0fQg1irGzl6DHXZp45hsaMceF+0E2CA/JA4Pr3y64zVqB1fdSz
         UQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781627572; x=1782232372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTLmtc9ksI3Eco4GNG31SXnNUS7oWeItGbDEBkSUCOQ=;
        b=sXLfoP7nm/p+kX0naZYWQtGBu2FxCujALIFXNLV2wvAL5HnFGsx2A418BujKz5EFmw
         Hm2gIbZy7s+dsLMYOIdultv0NykNxLJp4UBc4sbC+QixBU8BqeZrzngqyPdR8dFChmqJ
         FlCZcV49FtWNO8nl67hwXaZW0WqDqTn8eW9QPuu+YnPNN3KprvYoC2fY0hrKcioPgQV7
         BEhh3qWdM70pw/7LmEm+wF+r6fJFcCRZN020XmyLMFXpFLHrfM4QuUtHmostaVPWz4TX
         /B1g/nMLNQztZG5NSHH5pG//1iGOOJZOppxJjWHAi1QYc1V06Wn6nlsjis3biznNBwvq
         shxA==
X-Forwarded-Encrypted: i=1; AFNElJ+ifiq551FuSiPjXRpdEnIV6jk5n6HCYBLDsgrAjI/urxVgfLBiXRhP9qMHjRsVp/NRg7xXvaUIkBXx@vger.kernel.org
X-Gm-Message-State: AOJu0YyjkDc8pYQSto56lewdOfJxGG4mrduMJzhBdoWehAodi4azKVt8
	3DEs6tznm1ceGVyAmrGBp41lRuRdiXsS0OBKYfalQ3tlDIn98GNFR8LrX2QNSijjw+XGXoBKJx/
	EojMJ5I7gQiXxionYBOxsWvqUcWI4GG3/zJDpM3mlTLArsXqxltbZkj7RZuopi/z1
X-Gm-Gg: Acq92OH4ef55EImdkrFFhJdLJJf0HMa/UpdhFInEH9O0n6AhL05/2HZf+yZnH3S4U5y
	zN/JCVUCdgkTU0/qh8q1QjS2pfzzcTQberkpZaDhXcamf1fB+XKCitUEele68r++9VWtAtzL3RM
	x2ks+M2JGFR8qEVtgTa9Jxs4X6kMehprF2JFCZJyDvblNb2AiLJAgPnfZ3BEoWvLxjWBqOgVDfC
	HvUztUm8AROVGSyO9OLnq43nT0DblVzTgH+6u3bpadJgHfRPDdeB6HxnjmcFSUic/QJnpofbvr8
	CeU/KgMvdqH8Ap3dC1W+Cf93u30ObUg7zwFa6x0HlGN0cXb7VRpw9eWVrk38JaA5TvTwsr780GN
	/tDVTTmUaMkykyeta9i3NELDY2dXt+4lnDZw=
X-Received: by 2002:a17:902:8a93:b0:2c6:6425:b343 with SMTP id d9443c01a7336-2c6b877e63amr1906415ad.6.1781627572066;
        Tue, 16 Jun 2026 09:32:52 -0700 (PDT)
X-Received: by 2002:a17:902:8a93:b0:2c6:6425:b343 with SMTP id d9443c01a7336-2c6b877e63amr1906225ad.6.1781627571526;
        Tue, 16 Jun 2026 09:32:51 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac72asm145948035ad.38.2026.06.16.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:32:51 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:02:43 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <ajF6q5eKz92ddqVl@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a317ab5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1fSEK5Xs-BiMaI_fvDcA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfX97OnyyKSxswa
 OE9G6DCKuFgAR0YX05+OLWrH9RaprrE38OasqD/nhY6K0b/PKSQH+KoSAnPMY0y+8v0X2jhPN2M
 jJndkRXIOrnnnC34TOuOzqwedRpDdyM=
X-Proofpoint-ORIG-GUID: H9v_7RpLzFLv-LopxYlig7U85s033IjQ
X-Proofpoint-GUID: H9v_7RpLzFLv-LopxYlig7U85s033IjQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfX5xtYtu1EQGb1
 402svmEV0Ry9aB4XFuEeL4n0nofVvoHot4jZMFIjcegaRL2WkE5TB9Ru0P22du66c3KEMAWFi0C
 rmWXzdqn/yBMfNzmz+RrUqBaFUzDQQi0/2xm/CoSPTEGEHFYn6Dpy14MIZfAwzHSccv/EQtVNdL
 iidJjiqKyQoE4JrzzlhKMT9MowFu35/PfU8xE6DSp1/M2ySxhI2Ak9alDL3sIzBZmI9e4But98I
 cQym9SKTxXDNfVtHfInWI/VgcIMMpO+sGRr2oxJBm7ekwWZslBUegPVnch1JhLEF4t042SPxLrn
 b5HHKK4AJ/g6bwyXJJh3nwsNGagJ25oOefKsg/i6holosU2Lxesp77jDThFznGnLHAn8OQue2Gg
 FonFMefQ78c/TTlbCG7J3QfxvvBdjcb+Fop/sYvvGbQEexGivsI8XNMehgoqniRAd8tnuk6yZ48
 t/d5REIVlnxWzgL7/0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160169

On Mon, Jun 15, 2026 at 06:48:55PM +0200, Andrew Lunn wrote:
> > > I'm curious how this works at the moment? Do no boards make use of
> > > RGMII ID? Are all current boards broken?
> > 
> > Searching through the DTS, I found that we have two boards using "rgmii"
> > (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
> > "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> 
> So this causes problems. We cannot break existing boards, yet it would
> be good to fix the current broken behaviour.

I am trying to track down the sa8155-adp and sa8540p-ride boards. The
EMAC on QCS404 is extremely similar to QCS615 Ride [0], and I got that
board to work with this series (with RGMII ID mode). So I am fairly
confident that QCS404 would not break (if its even booting up with the
upstream kernel currently). Also, I think we could change the phy-mode
for QCS404 to "rgmii-id" from "rgmii" if these fixes go in.

> It could be the best way forward is that you issue a warning when
> "rgmii" is found and pass rgmii-id to the PHY. And you also change the
> two boards to use rgmii-id. Lets think about the rgmii-txid case once
> we better understand it.
> 

As Konrad mentioned, it would be great to know if we can test out these
boards. Looking at the different versions of the ETHQOS programming
guide, stopping MAC side delay should be as simple as what we are doing
in this commit. But whether the two boards work directly with the
default PHY delays is unknown.

	Ayaan

[0] The proposed RGMII fixes would help enable ethernet on QCS615 Ride
as well. I see that the original series had a lot of issues:
https://lore.kernel.org/all/20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com/
