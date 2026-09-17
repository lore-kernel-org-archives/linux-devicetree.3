Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD0953B35C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664753; cv=none; b=C3QFgvoaz1ZWBI+klw6/UJgcnkuvc/P0wzoQHedclAboMB5fOoLi93fFjnAQomS7GamStfqO9/IgNfliOb9GtPHlnflDlcuXsRNp+1SJbOKI3av3N7GNMX+237WCCgUwVrsiB74A6z2OvZ2cSbN4zXjenPUyV9oSiGsjQIs5s5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664753; c=relaxed/simple;
	bh=K89NTdHV4s39TWMFaaBaEfSlU0LRczERuX7RTrIMNEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBBxS+fTIR5DukncKpmCmidHPgKbTa2T+IpVOV2NHJTeRAgvXCkVB3VCVnpT+ely7KzaD+a9UATNHtaEp8OW2IPtzpE08WRaRDledrRQ0HTtk7wJnr6ETN4m67HNeuGPTRMrEYDvn9j9Bkzv4YrRSPWhWRLFmLoorKZCHqmfrpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tgd3GC9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPJXGDQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tgd3GC9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPJXGDQ6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5W3c2887094
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RDl35+VXelpsEbre9UpAeTzdT2GlQK1m33TbNXBDA+M=; b=Tgd3GC9WhKH7gyHB
	3DIAh98G11HYVNgr+D7Tum/1A3Tz7K+TZxY4NV401TMseciyykXB269mWw6B6zbs
	jHxfmNX3FPf5ya8EI+Lfq8xbUpWkMXjdf4EbKkadvKH6l7m1exjjyvY/gzDC5dU8
	LaHRFEbpXRVi6QfKBXIC5pkGiUubaTcg1NNxtkEUXq0RcYfwi9b/FSuwcrvIzhFx
	vSb29F9dshZnr0HRO+67md7iLZ/T3xQHEOYZi6dVvpSERUVTCzylr2lcS/gimN7R
	CKyy5QN6+YXVNcjaK1+ZtC4f4DVzG2/F6nFJeK465yVXeVClC2/yU3RNeOTxoj1B
	M4X/FA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6guc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:05:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc52c1b829fso156496a12.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789664750; x=1790269550; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDl35+VXelpsEbre9UpAeTzdT2GlQK1m33TbNXBDA+M=;
        b=NPJXGDQ6fZVeygqrWbH0Ep2CqaCMkKgkt+vO0pKJy1a+WCHr6H8+KATBOi5jmzmt0K
         LQ7nhFn30brlf8UJFXe8Li33g9Ol/IwQBihg4cOoUv6/m/oLm9uirO6HkmeJmN+I8i9a
         3Ey+lElmX1yz26KvmWeYLvDXxBZPRTzNBBnWfqI1CMQDQZVSLZaLtVlhdshyJADWcpnE
         kbMQUcEav2TWdDOyNJxQDmNPJLaHworDtEH/e7wEacYWK2nLxW9iigB/s5//EK5vcUrY
         wslXmjTUGIqMVd8MtVlB6s1G97nFXNWmKLQ1EdiMxKbho8sU27JJC7zjlg2n4FyZcP3I
         UWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664750; x=1790269550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RDl35+VXelpsEbre9UpAeTzdT2GlQK1m33TbNXBDA+M=;
        b=ncRInDpnooptfLVQwfwjIJzdbiqSpG4eFf6n6NBtt/ER7RtvnnkGX16eumu3KfXs9Z
         fvHRUW59WMWL+ILaMA6UO2PYefLZJmXTekhaFkDdPAV8s3/5RSiJPQe2185PpzEI8C8Q
         9JcGMjZCSYIUM7is06kQMNd07+MV4cnRuW5cvGH9RsHPT2N+8eGBDgIeHcBb44QoYW5/
         f7ZI/DuWOcdin06aC+Q0buKmda+8b5s/lOtCnOdukA2fD71MP+RAhMqwW09vxlEmEeCh
         YAFji7+4KbnktylGB94ivU+sC3iRNlRg7D8mNXkWD5Td5NGAjuNFFFxH5NWP7BzYBxS5
         5SLw==
X-Forwarded-Encrypted: i=1; AKwUvBwCRI9W4/IgsXOerh7Wnh7Zx9TeQx/e9DVqTtNC1uR4UZcfsnX4f7tJP4bmnb8DefRNucGQjfhzj014@vger.kernel.org
X-Gm-Message-State: AFuF++n6lV+YVJkzp74Ryypj86AJ++EFlX/FZbWOWoS9827RVCdoFeMy
	TBYpqnaQ7nn2FvHr3COXVkLHWEz1LceGDame9YaIcbybDeaq/G1+IhtGCjcLzd9VQ/XXLH3XMhi
	qxJsoDjJQIqztmDIscuoseqlfQF5Gb9aXkzR4vSyJxYX+9gRZlynvo46XvIXAkmav
X-Gm-Gg: AYBFou2/nOyEWc8++O1ctiRLUKEcNkLs4Hia8P3zMBIHez2CzzpsxZoyv2fwDXdjVPZ
	LJQPT/iJ37+szuJN2eDTg0JvRzrSWxUeTSNym/Jsrkn+c20owEwk3sba5pm4cnIVGaEoOKw5h7x
	tRTNb3kjN2k/ibGbHW++ucFlP66erLZle4T8gR6pLnzou2/tdQ2cMg8EIfMY0oMz48KztSBfkGz
	Gp96q0ZXQAuQlarf9bIxgpcRfVYq8jFFoDkaIHGrF/T2p/9GMeohUMbFI9XOYqAeeq4I6uFdGgT
	Nv7uOHDWpXDL9ViPsnVRPWv60UbCiCcN0la/8NV49PWpGiF+TZl5xv4bm/Fpe2daUsspAXdGgcf
	V0vWkVu6EGLmn
X-Received: by 2002:a17:903:96:b0:2dd:ad74:ac82 with SMTP id d9443c01a7336-2ddad74aeadmr12637465ad.29.1789664749503;
        Thu, 17 Sep 2026 10:05:49 -0700 (PDT)
X-Received: by 2002:a17:903:96:b0:2dd:ad74:ac82 with SMTP id d9443c01a7336-2ddad74aeadmr12637115ad.29.1789664748859;
        Thu, 17 Sep 2026 10:05:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebf2e2sm30693095ad.42.2026.09.17.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:05:48 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:35:39 +0530
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
Subject: Re: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Message-ID: <aqwd482ftepFnbJz@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
 <178912591286.219967.4678568368277035940@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591286.219967.4678568368277035940@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX1hQ+5JJt1FbX
 GAvvnEy1CjoqB5RcJZ06Ah4YSIKU/zEVHtHCDGHdgn8HZ4bxBwuNs6HQkG0oH5/ybJUfMuChXSa
 4i7kHHaVIopsBB8xnCOilnEdtE1DgqMjLaHUK516Z0M5aMowG8jFScpy208c0mbDLCZhnrBTkwF
 v7eBsTrMknlFd+gFpu9e6+qWWWj8RSxgeWITY4HRa9FqQXlbIJ0bMHPU/tN/8w2yw3FNdB3xgar
 zT6w3wGTRnIKmdnDQ9o4DU/RDqUSE3ZPEGIZgLsT6a4lSFw/jE75IWv7xEFR6eCnmHUPtAeQKIr
 RyMSbc2Lqg4um8+yCQR+ej9tS5oIP4WSNAwn7xoVgXErZ7To0cT9xXBQsf6kmRS0HfOapee6A4p
 ZOnwg/H3Z2hZE9tt7ZPNRHgCudP3yr0p48jdvr7r2D0GJtsLPSpjKil1Xd+nXMHbVzsPIdx3NMH
 KozENF1o9QFiIoT8A4A==
X-Proofpoint-GUID: B1oaKgbqFml2NHDrMsxSKfhkQXMEqWAw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX1/4+8nCn9hDD
 2SaWVk4PaTtbIfJqqBJnowaqm3FtjGOs93/av12JqMnbBXYzpF46X0IyLtCdRYT/16VCfC8Eqww
 e0R3v8j0bbqEizK1MxII8g5LHdL035Q=
X-Proofpoint-ORIG-GUID: B1oaKgbqFml2NHDrMsxSKfhkQXMEqWAw
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac1dee cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=qlcCTMnHKW_kJwwR1w0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170243

On Fri, Sep 11, 2026 at 11:25:12AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In `ethqos_rgmii_macro_init()`
>   (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c) the patch…
> 
> --
> 
> net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
> 
> The patch changes ethqos_rgmii_macro_init() to return void because its only
> caller ignores the return value, and it drops the speed validation from that
> function on the grounds that the same check exists higher up the call stack.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index ac7d6d3e205a1..44270c25d874f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
> >  	return 0;
> >  }
> >  
> > -static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> > +static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> >  {
> > -	struct device *dev = &ethqos->pdev->dev;
> >  	unsigned int prg_rclk_dly, loopback;
> >  	unsigned int phase_shift;
> >  
> > @@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> >  	/* Select RGMII, write 0 to interface select */
> >  	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
> >  
> > -	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
> > -		dev_err(dev, "Invalid speed %d\n", speed);
> > -		return -EINVAL;
> > -	}
> > -
> 
> [Severity: Medium]
> The commit message says "the speed validation duplicates a check higher up
> the call stack".  Which check is that referring to?
> 
> The only path here is:
> 
>   stmmac_mac_link_up()
>     -> priv->plat->fix_mac_speed()
>       -> ethqos_fix_mac_speed_rgmii()
>         -> ethqos_rgmii_macro_init()
> 
> stmmac_mac_link_up() only bails out in the default arm of its speed switch:
> 
> 	case SPEED_2500:
> 		if (interface == PHY_INTERFACE_MODE_USXGMII)
> 			ctrl |= priv->hw->link.xgmii.speed2500;
> 		else
> 			ctrl |= priv->hw->link.speed2500;
> 		break;
> 	...
> 	default:
> 		netdev_err(priv->dev,
> 			   "unsupported speed %s on %s, leaving the MAC disabled\n",
> 			   phy_speed_to_str(speed), phy_modes(interface));
> 		return;
> 	}
> 
> 	if (priv->plat->fix_mac_speed)
> 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
> 					  speed, mode);
> 
> so SPEED_2500 and everything above it are accepted and forwarded verbatim to
> fix_mac_speed() regardless of the interface mode.
> 
> ethqos_fix_mac_speed_rgmii() does no RGMII-specific speed validation either;
> it only distinguishes speed == SPEED_1000 from speed == SPEED_100/SPEED_10
> while restoring POR values and bringing up the DLL, then passes speed
> straight through.
> 
> So the removed test rejected speeds that are invalid for RGMII, while what
> remains upstream only rejects speeds the core does not recognise at all.
> Are these really the same check?
> 
> A speed above 1000 does appear reachable on an RGMII port through a fixed
> link.  phylink_parse_fixedlink() keeps the requested speed even when it does
> not match the validated supported set:
> 
> 	if (c) {
> 		...
> 	} else {
> 		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
> 			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
> 			     pl->link_config.speed);
> 	}
> 
> and phylink_get_fixed_state() then hands that speed to mac_link_up() via
> *state = pl->link_config.  With phy-mode = "rgmii" plus
> fixed-link { speed = <2500>; full-duplex; }, does 2500 now reach
> ethqos_rgmii_macro_init() and silently take the non-1000 branches
> (BYPASS_TX_ID_EN set, POS_NEG_DATA_SEL and PROG_SWAP cleared,
> PRG_RCLK_DLY_CODE = 5, RX_PROG_SWAP cleared on pre-GE3 parts) while neither
> MAX_SPD_PRG_2 nor MAX_SPD_PRG_9 is programmed, with the DLL already locked
> by the caller?
> 
> The "Invalid speed %d" dev_err() was the only indication that the RGMII
> configuration is unsupported.  Would it make sense to move the check into
> ethqos_fix_mac_speed_rgmii(), before the POR restore and the DLL
> reset/enable sequence, rather than dropping it?
> 
> For reference, no later patch in this series reinstates a speed check:
> ethqos_fix_mac_speed_rgmii() and ethqos_rgmii_macro_init() still accept any
> speed at the end of the series, and the newly added
> ethqos_rgmii_id_macro_init() is equally unvalidated.
> 
> >  	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
> >  
> >  	if (speed == SPEED_1000) {
> 
> [ ... ]
> 

In my opinion, there's something already very wrong if we have a
fixed-link setup with phy-mode as RGMII and speed anything greater
than 1000. So I am not sure this comment makes sense.

	Ayaan
