Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78AF52F263
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664866; cv=none; b=ntYVI9O8GJdflBmjo8tjwx5JkWABy7KFR98QPSF/FkJUesFQyyHRgNZN/b2WrQ6jTGBU8+jlR64rc9XjTSeu0BKfTqA2Vz83Yaut5uHbOGkZlUaiSkWvPh3jUGXK3yfk7Oy1bTaFH1CKqhZAQLo2LMbvEW8DSvZOOVFLucxHb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664866; c=relaxed/simple;
	bh=vhtW36zbW6U2hQRyCFwQMzI3zVApqqEa57KQyKwSLEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/p0vGgkyT9VJVMTNYvSSxCFtGYJtmG0bwL/eyz+8ch65asU+8gP5v8mL3wMLE7pkli7BlhgZZJ6hp+11rm6UV53g1ek1pJiP88nNwGJYp6BCXCUT5Hfp73+Zm9fQwZhzXn+xXlLSAXo3i62JiWoUtJmdjgVPyF6dF/tVUZoh6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpXxIIZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV1SGc6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpXxIIZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FV1SGc6q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5SpK2887054
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OnkjcGuQVl1beS4tDUCJl3BOauM32z7nrFMjHCzwJSw=; b=hpXxIIZoB3SeMm//
	wdqx6jjYrY+WFvIEVZCHerJpf8TulhvSoXC1qJ1RNO4Vs+T+kd+j7ueYnEV1tu88
	50Z21zY6iq3H+iM6BmTl1khcXxe9Aw1fsBWHRBnNs7vUIyNaH8Na1DZtsHbUIqSy
	MX7hWrcr9IoAFPCVhw4waDj/PdRfMOxXHWBH6J5g9f2YdNJYNzxkXLN1NGXpjq/N
	ejbxDnlbCgidIMBcsYnl6rThYPdYWqefeT8EnDoqtlBYz2rBU2FKvrhS0zT1k6Jm
	45pkdzom3g1PSTBOSgao6jgFGb0K1yuMuuSZSv5hppiREk/mdNUuZYgbQCLRX7e3
	quakzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6gumj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:07:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db22383e8fso16469135ad.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789664862; x=1790269662; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnkjcGuQVl1beS4tDUCJl3BOauM32z7nrFMjHCzwJSw=;
        b=FV1SGc6qvZ6EjUBbgMcSagRIaDIbRt0enFnVxloI1eE+3D5r0M/gcHRepGEmXeQFWM
         42h+Z4wCOuyHTZJ75mtDVMipunu6pqOkNNIK4DRzuYNRo/jfZtmRMPAYB462kZg9l5zD
         COeCxaml1vtBwQj3QfAcuwWyEzuLUo2I0DwdZvsabjVmwMl45LoeX3ubY3Cv+P6ZEa8O
         tYMjqT9WPoT/vf2TO7kz3B/J1pfSaJmGCuqHutHw2mxuZaVBGyrZMh517Ju1qehiEHx+
         On71sM8LgZvTCfvCMgTTpm55V0BM8HKI8m1+ZRehdpVAwLDnkXGl8MtfmzjUrJqeggFY
         XTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664862; x=1790269662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OnkjcGuQVl1beS4tDUCJl3BOauM32z7nrFMjHCzwJSw=;
        b=dTIVfTb7yQmqwad097bk1yNovhW7nxGdmhlAMHe88n3IaNOSwJp2QyNG6y25EbNnrD
         znQngGkEcmx8KnBBBtV1zFmXoF/8qmb6tfWc3ndXSzIMbBsR4V3OnveRB7ei4SDql0bi
         u1nQV68pW0rmYUSI/Qo02FA0lp8RDuDmV1ZDs8a1+giXBBInZ37qyYEPzJJ+tyQe1R2w
         +VlvaB0tVjqFSn1xSCZ4P1p7NYz4I2MMWpWW7lWD5avBc7XKFhJuadHUWwat7GfHl/9S
         dw4ZfCLt8mcW8hTXcnEyP+ez7UXyqp1NtXlcGLEvKXVYw1GVLccvb1OVi4alcRpsNBZN
         kbDA==
X-Forwarded-Encrypted: i=1; AKwUvBzT9ctIC/0OJHDAVvp+2ddagilXx4gmLO2DBcF44kEKIgi4w19o1AjLwTaJyO+/VHVsm1cF2Nlbj/Kg@vger.kernel.org
X-Gm-Message-State: AFuF++kyqol8+JFoxFPNMhqzw0FUUvnZIM5GcqxjOorhpX90i13iLQ41
	gNDab8UYhGLazIT0qpd7ikNcGGdCuSGefBik5m36tqHKpv8VBm+hqdLMRIZPQtRMUUIPq+RSmHQ
	b96DtJtrc90xOerImCnKbEFHRwezZotlTlbLv0xfIPHYCZgq1gqzVC4iKYQV3RaQi
X-Gm-Gg: AYBFou0nD48cNN4qLgYgOCKVa6ZKeY/albJs2kWWNNVj7CffBFDB6yKVn/pXigzlSvk
	WIlO20Q6SpNfc2OOMFoBKWof8suEai41Ial1dCNK1/epiUfc6Xpt/m9SBotXivordxL8tOIyHRO
	dQOhOWaTuuKQC7Vb7kQV/FNglhndgLoT9Q3OsRoU9JkV+429TVKS1rdzuy8L6+DzGGghSubHM9x
	J5qhtOmyhXzbcMwBu2WKnKTv6abHvzRS/NZYqTSXUFBA5bFxdFt5/XNj7qdTJl3IGrRpVmnbpGB
	14v/ALTKAupuIanN8eY05sBaQQd9QTX5rcSF5N9GNUNWwajykG5p5evfW2TdjDcquRSy4jkUhoL
	H3dwyJopHtH+iQQ==
X-Received: by 2002:a17:903:11c3:b0:2dd:ad7d:72e3 with SMTP id d9443c01a7336-2ddad7d74femr10397465ad.26.1789664861520;
        Thu, 17 Sep 2026 10:07:41 -0700 (PDT)
X-Received: by 2002:a17:903:11c3:b0:2dd:ad7d:72e3 with SMTP id d9443c01a7336-2ddad7d74femr10397255ad.26.1789664860991;
        Thu, 17 Sep 2026 10:07:40 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8e6a3sm30492845ad.7.2026.09.17.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:07:40 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:37:31 +0530
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
Subject: Re: [PATCH net-next v2 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Message-ID: <aqweU+PCLaXi0fLh@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-5-bbe3389d0652@oss.qualcomm.com>
 <178912591493.219967.8863321460780410702@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591493.219967.8863321460780410702@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX3RT2Tki2ayKd
 SdbT6Mkkb4lLz2bfr2I/zSlPw+KGNkJcNONNrKQeAuYftWqN7uL9xhv5+328EMHDUxhv/ialJGc
 Kw7uvizZN/AIhsynbi0g8xYC3beNw0m+PxDWW6LIQJQObSnppoKyiuc/4YxYMdgexZCR3T6/1kI
 vQbTfcQSo9vRJ+vRKEnqYs7MJGwbw2glSkGLhy0fYw1uGelIk6tzRoOT2R1SOi7S1zIPKGCIxQd
 FUY1MM9G2DGt7WEAQHExJcJB+Mh57bFYJBfnQiL0SN4TwPJICWj3QT8BmnpQeHs0Tq5SpCpRhR9
 lrCFYGJbUdkyjxtYfJBYxs4fV1/n45GOQSXTS4qHjXKYow5tyQ8hqJjCUfzO3szQBQyGODtXPyt
 2hWpnnPeXnLcyU6q6PN0o+9dGj2rW5Z7ZoOLmikjI2EyDg0K8iW4R/tcuKCWPKahw+soMEsC1NA
 D8eUZg/HaijjjhuxYRQ==
X-Proofpoint-GUID: l51k7xi54JyJEwrXHIa3RhbphKdS5rVG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX3jyMzdX0l6PR
 +Arr50O7azw9c96K5o0ZaV13lkLqr1cJO4h0ahum3OPk1J9C6KIHS7OkUfTGqCt+xVxV6a4gLUV
 xVTTYkXNHk8WF6S5KZmHkzByrXEfBe8=
X-Proofpoint-ORIG-GUID: l51k7xi54JyJEwrXHIa3RhbphKdS5rVG
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac1e5e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=vOTgahw99eS1XjnIhgcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170243

On Fri, Sep 11, 2026 at 11:25:14AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] The patch is worded as a bug fix ("fix RGMII_ID mode to use
>   DLL bypass", "Also fix ethqos_set_clk_tx_rate()") for two user-visible…
> 
> --
> 
> net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
> 
> For phy-mode = "rgmii-id" the driver now powers down the DLL, sets DDR
> bypass and programs the IO_MACRO through a new
> ethqos_rgmii_id_macro_init() helper instead of running the generic DLL
> init.  It also stops doubling the link clock rate at 100M/10M in that
> mode, and drops RGMII_ID from the TX phase-shift suppression in
> ethqos_rgmii_macro_init().
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 44270c25d874f..53fb9de4d92c7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> 
> [ ... ]
> 
> > @@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> >  	if (rate < 0)
> >  		return rate;
> >  
> > -	return clk_set_rate(ethqos->link_clk, rate * 2);
> > +	/* Clock Rate Requirements:
> > +	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
> > +	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
> > +	 */
> > +	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
> > +	    speed == SPEED_1000)
> > +		rate *= 2;
> > +
> > +	return clk_set_rate(ethqos->link_clk, rate);
> >  }
> 
> [ ... ]
> 
> > @@ -493,6 +539,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
> >  
> >  	ethqos_set_func_clk_en(ethqos);
> >  
> > +	/* For rgmii-id mode, the PHY should add the required delays.
> > +	 * Therefore, power down the DLL and program it in bypass mode.
> > +	 * Program the IO_MACRO as per the settings recommended by the
> > +	 * programming guide for bypass mode. This will ensure that the
> > +	 * MAC core doesn't add any additional delays.
> > +	 */
> > +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
> > +		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
> > +		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
> > +
> > +		ethqos_rgmii_id_macro_init(ethqos, speed);
> > +
> > +		return;
> > +	}
> > +
> 
> [Severity: Medium]
> The changelog describes this as two functional corrections, "fix RGMII_ID
> mode to use DLL bypass" and "Also fix ethqos_set_clk_tx_rate() to not
> double the clock rate in bypass mode at 100M/10M", but there is no Fixes:
> tag.  Should one be added?
> 
> Both defects look reachable before this patch.  qcom_ethqos_probe() accepts
> PHY_INTERFACE_MODE_RGMII_ID and installs the affected callback:
> 
> 	case PHY_INTERFACE_MODE_RGMII_ID:
> 	case PHY_INTERFACE_MODE_RGMII_RXID:
> 	case PHY_INTERFACE_MODE_RGMII_TXID:
> 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
> 
> so an rgmii-id link previously ran the full DLL init and had the RX delay
> programmed by ethqos_rgmii_macro_init() through
> SDCC_DDR_CONFIG_PRG_RCLK_DLY / SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY, and also
> got rate * 2 from ethqos_set_clk_tx_rate().
> 
> The partial mitigation for the TX side came in with 164a9ebe9742 ("net:
> stmmac: dwmac-qcom-ethqos: Respect phy-mode and TX delay"), which only
> suppressed RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN and left the RX delay and
> the doubled rate in place.  Would that commit, or the original driver
> commit, be the right Fixes: target here?
> 
> Related question: which platform reproduces the misprogramming, and on
> which hardware was the new bypass register sequence in
> ethqos_rgmii_id_macro_init() validated?  Grepping arch/arm64/boot/dts/qcom
> turns up no ethqos node using phy-mode = "rgmii-id" (only sa8540p-ride.dts,
> which uses "rgmii-txid"), so it is hard to tell from the changelog who is
> affected and what the backport risk is.  Could that be stated in the commit
> message?
> 

Since there are no current ethqos users of "rgmii-id", nothing is really
broken in the current tree, so a Fixes: tag might not be required.

	Ayaan
