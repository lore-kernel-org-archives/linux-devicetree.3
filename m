Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69551DB0B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665234; cv=none; b=jxnhzovizocpjk/Qs4MRXZ1QJjv0g/oTYMj3W32nIEi29nfLq8+BiL/5SJ9C3VFNL21ErbU+meX/cYyMzk1y6D6hJn12usUm5Hoc1Pm/zVDCjhKVcpVlomdDFRDCSSPYGWS5WSj1x7hLvmtV0vgs5qfZr7dUCtQ3O1TDgOWiauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665234; c=relaxed/simple;
	bh=Okxe09XM/plBGMCS8GFDVV/XQAWZHkbxabHUnX0rDjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srD+a/TMJcp6zxfNLYWRVRgpM3ewVB4HIzEsK7tMgLvr3NwcrTLLAHXr1TFPfWFszu6d066B2+FjEIQGmQk8cf1btiAzg+ZOeyaV7e9NB7u97RBzzI0XOlpe99UHWYQOnXVXj6Sx6UFpaaL2TgPtMz7uB/qkwjWiD48OxbvI480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRTjoDGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S36ujVj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRTjoDGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S36ujVj+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5PWP1600896
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwwsd9n1Ie2Evql/hn9vxy0s0eRY7/6wy2UffO1bNKo=; b=KRTjoDGvYXJB7K/x
	f/r06SUdeaALn6zlkn46sCke4cdJvM81SCTy0Rl6LtfqSjE960aKcQdxrkvKxlqj
	uqlyCyRZQwQMQXzxs+PmxO8QnSbJdE4eIBdcb+WdFWx4xIVLIyrkHbZJCcbpfW1u
	a1oNfwkPnajMjJNdv5fM8c2xSA88fz7GYY/vnW8jojl/gWL3oxHKBmAnnbd0Fzfs
	7cpJIb04tsvu9oA0P2InXQUxycpbRrdeQeMJx7G3lIe2S0MDJiMGDIef0xMP1UlI
	v/oZb7LMfz+Jy6BS4rTpFOSI5dAmy2kMq1Zo/Vr0kTbrGvkamdG/DB/48FfvECAq
	SLXYmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw3dt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:13:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1752241a91.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789665230; x=1790270030; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwwsd9n1Ie2Evql/hn9vxy0s0eRY7/6wy2UffO1bNKo=;
        b=S36ujVj+p2JNlsHG8oCzAkDW6QVK50jctqvkZnJtyqKiwqb6FwsPQtwamJHoPx3thF
         Y6WrNzOzXqYuL4MDvN1DvPQUgi7yxWhK5XgjZDFFK5BcsfAHnBBw2soOELhwZm/0BxVy
         St4KZfO3h0vDjsOeBig9IpzpTw4uYmvSp2UJr/SnTClJ8GMsE9D5JnWwgSTsu2fzuDuo
         w29neWFifM/4swbhw88zVPR7h5PAZyiHscK9n2/Xsp0S54M6YBPHkctSWW/UIfo8NvbA
         d2gb6y+LJqtqWVA7l4XjqzM1lH6jdrxOQrEWB1UMRx5JXQzzPPA7NLEcpXLXeMsSFBIs
         MNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665230; x=1790270030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dwwsd9n1Ie2Evql/hn9vxy0s0eRY7/6wy2UffO1bNKo=;
        b=1cvvn9hxXqAVglh3VilwHVptoWB78UVV7YAij6tbVpgWEcggCQjAgtt30MXK32Q2RV
         8+DqqWiWZxr4qQ87XuxiImxqHyYc62zZ0BSjV1HSaXW7koGkWzB0Eda0EqfOTHwQaBhu
         R1tcjB67HZz9SzxRcG33F05O9IsriS0aR4Ix+HQYyruhgELZ3iv6SnBsjPxbAWkhUDuK
         YoR58sLwFJkS5yZaJTY5s5odGy2G/UnEF0xbPO4Acd8hN2SB9scRaOoDTLGe2hXkfxDa
         eweI+pOGR1ySaMtmj22Hu2HQHyjOFdumxXJ+ro0mgAURAc/HRdTLfBlTP1pQyE/nIJx1
         8Bqg==
X-Forwarded-Encrypted: i=1; AKwUvByFJQKfDTSn8ygEnR5io0IY59mkRWMS3jHQa4fyVwDXVR5XatKAN8u/ZTXeKPx4fUhf+vgTzPV9Hyo+@vger.kernel.org
X-Gm-Message-State: AFuF++lOZGiy5gnmd68PJ3x0WnPL75ZSxeToPQH9CXck02dxKqe1eVKX
	FXZZZSdjdRHi/301WMcht5CCyHNZ5ZLF3NWElQ1cWkOg6rSsaNNQU6Wd0QY5XSNxTJ213tBQCiz
	EAwwfuKMa+mNoFrR+oop65w04S4E7Dqpzz/HwV9oMUN0cU1sQp/qH/mgFCHlH7zlAnieuIsN6
X-Gm-Gg: AYBFou3azmgHhMHeQrsieueLjKU/d5UtoR1pW+cs/dRx4+dEZO4jLh+ZvbgmW+sUxIC
	BRQo7x7YU/EcE4dC6sbu5fa6fKLK31/an98aNlbPWFTqi8gPVcfKi8RbmSkHo5EVCOpR77CbTUF
	s/xsrxS0Y0qun0kkdfHkN7AF45QlTwuHZquSZWNr/X+2rTJVMZhzZUSn9tpovCwI29S8psyOd9d
	30kx59zqpr/RXr25pveQBnsoLGAlBp2lWX1AitdS8u48xuG/T2dQyBfcrVGGsfrKYFH5qzmPuNg
	J5hD/qbGG4dHNdXSpkMRFkcsO75ZZNvtrCjKeAQg2QneaZJJynqbXwmC3jM1bXApYUIOZMPk/78
	CU5vCS85fz0WlOg==
X-Received: by 2002:a17:90b:4fcf:b0:39d:e54c:a28a with SMTP id 98e67ed59e1d1-39e1e2d7580mr15919851a91.8.1789665229890;
        Thu, 17 Sep 2026 10:13:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcf:b0:39d:e54c:a28a with SMTP id 98e67ed59e1d1-39e1e2d7580mr15919812a91.8.1789665229347;
        Thu, 17 Sep 2026 10:13:49 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm5976254a91.16.2026.09.17.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:13:48 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:43:39 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 7/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Message-ID: <aqwfw2sqhjkKl+7H@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-7-bbe3389d0652@oss.qualcomm.com>
 <178912591910.219967.8208494265030276950@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591910.219967.8208494265030276950@kernel.org>
X-Proofpoint-ORIG-GUID: 0ZG3MaaVnXj_mlIoorWFjiDZV79shoq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX9c1BZEuvcA1T
 9Ym/9KEUr8LRekpGElCz1gGfdfdF/k2OgzNoGcFw624QE270Vnjn0V1c83xX8aff21Aj0KlVuQX
 srXsQTmROMprcBVDk3mt28qkcTLuyzvrRD9ITv4lGcXhhcb4w0oSJnx92i89wJJo/m2l4tU9Fb1
 UMf4w+y2tSGweEJkwaiMDRE42nBA7OmENqJpR3VtJBBeWBB8QdJC+l3GNfFAqTeki+xF9tBjPZC
 NjlO14i/X3Fj7feVASeTz5pYf09ZqlQ1ZvHCQ6gcg5q4sMSvv7AtSFsSAP0q/6cjXcloFF59OO/
 Qa20qZ3T2dONmWwqb7pU5gMBFaWIMiypVn+1CVt/hjXWJhRAPa2E0sy03f2adHmMHI8O+YoALOd
 JU+OrF3fw21+TB2+wy9VpQPPyPD1HxQaU8CLiQ8geBHaVZFfHmeO2cqUTmLIXhrQPpmTRkEwqF9
 deVYvY2Flfl4z8S00xA==
X-Proofpoint-GUID: 0ZG3MaaVnXj_mlIoorWFjiDZV79shoq9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX6Ntxe3TmRzJW
 f/eOuSzOcqySFCYz4U3mKiy/cl790yfPUbiIEtKnkpLN3J35i6Vjc4nsAVOFxNXf67ZwJJNlgB8
 1bZmzLktDFAo1SpGcvvuHHXB0w2GHGw=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac1fcf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=WqyH3TuB9VRS23WEE1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170245

On Fri, Sep 11, 2026 at 11:25:19AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> - [Medium] For legacy RGMII phy-modes (rgmii, rgmii-rxid, rgmii-txid) the
>   RGMII IO-macro DLL is programmed and its lock polled inside…
> - [Low] Commit message names the wrong callback: it states "fix_mac_speed
>   updates the rate once a link is established", but neither…
> 
> --
> 
> net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
> 
> The probe-time call to ethqos_set_clk_tx_rate() is changed from SPEED_1000
> to SPEED_10 so the RGMII link clock is not left at 250 MHz while no link is
> up.  Two questions below, one about the changelog wording and one about the
> first link-up path.
> 
> > net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
> >
> > On probe the RGMII link clock is initialised at SPEED_1000, which
> > translates to a 250 MHz source clock even when no PHY link is present,
> > drawing unnecessary power.
> >
> > Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
> > a link is established.
> 
> [Severity: Low]
> Is "fix_mac_speed updates the rate once a link is established" the right
> callback name here?  Neither ethqos_fix_mac_speed_rgmii() nor
> ethqos_fix_mac_speed_sgmii() calls clk_set_rate() on ethqos->link_clk; the
> only clk_set_rate(ethqos->link_clk, ...) in the file is in
> ethqos_set_clk_tx_rate(), which probe installs as
> plat_dat->set_clk_tx_rate.
> 
> stmmac_mac_link_up() invokes the two as separate callbacks, fix_mac_speed()
> first and set_clk_tx_rate() later:
> 
> 	if (priv->plat->fix_mac_speed)
> 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
> 					  speed, mode);
> 	...
> 	if (priv->plat->set_clk_tx_rate) {
> 		ret = priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
> 						priv->plat->clk_tx_i,
> 						interface, speed);
> 
> Could the changelog name set_clk_tx_rate instead, so the ordering is not
> hidden?

Ack, the commit message can mention set_clk_tx_rate instead of
fix_mac_speed.

> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index a92bf4a6a2dbd..2471871562ed9 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> >  				     "Failed to get serdes phy\n");
> >  
> >  	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
> > -			       SPEED_1000);
> > +			       SPEED_10);
> 
> [Severity: Medium]
> Does the first 1000 Mbps link-up now run the SDCC DLL bring-up with the
> probe-time 10 Mbps clock rate?
> 
> For the legacy rgmii / rgmii-rxid / rgmii-txid modes,
> ethqos_fix_mac_speed_rgmii() enables the DLL and polls for lock:
> 
> 	if (speed != SPEED_100 && speed != SPEED_10) {
> 		/* Set DLL_EN */
> 		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> 			      SDCC_HC_REG_DLL_CONFIG);
> 		...
> 		/* wait for DLL LOCK */
> 		if (read_poll_timeout_atomic(rgmii_readl, val,
> 					     val & SDC4_STATUS_DLL_LOCK,
> 					     1000, 1000000, true,
> 					     ethqos, SDC4_STATUS))
> 			dev_err(dev, "Timeout while waiting for DLL lock\n");
> 	}
> 
> and stmmac_mac_link_up() calls fix_mac_speed() before set_clk_tx_rate(), so
> at that point ethqos->link_clk is still at the rate programmed at probe.
> With SPEED_10 that is rgmii_clock(SPEED_10) = 2500000, doubled to 5 MHz for
> the non-rgmii-id modes by ethqos_set_clk_tx_rate(), where it used to be
> 250 MHz:
> 
> 	/* Clock Rate Requirements:
> 	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
> 	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
> 	 */
> 
> If the DLL cannot lock at that input rate, the poll busy-waits its full 1 s
> budget in the link-up path and then continues with an unlocked DLL, since
> fix_mac_speed() is not re-run after set_clk_tx_rate() raises the rate to
> 250 MHz.
> 
> Note the driver itself skips the DLL enable/lock for SPEED_10 and
> SPEED_100, which suggests the block is expected to see the rate matching
> the negotiated speed.  Is a minimum DLL input frequency involved here, and
> if so should the probe-time rate stay high, or should the clock be raised
> before fix_mac_speed() runs?
> 

From what I have seen, the clock rate does not affect the DLL lock. Even
in the existing code, a switch between speeds would end up attempting
the DLL lock at the old speed's clock rate while the new clock rate gets
set later on.

	Ayaan
