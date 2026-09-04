Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52F832E729
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555973; cv=none; b=m1qfJLgW/cvZ/tOsYWu5Hqwou5OlJ/nhM3IvEQ/OQNnrcsecKtlN41/ozOm1J5TCRzRutdx2TDFdkSMkONxaS+FVbi5kLdrNLWE91HP/+asYC5vYWknyFSHpgDVHoo87LCU5xA/qJ2pk0ZB05+1rZqSd/f47yM1h818w0zqN6Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555973; c=relaxed/simple;
	bh=FAC+Zj7qwKqYw7fFM0u215FoV5ND4YX8fjub2SpnxsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ko0aoL4XYcDe+hwkZjdwe+QOOGbpsx4TCNzCT1tJPJ+N+doYY+IZYJe8u+fnSCOeBtMZldDwPx73BX+EBl4fX3wBopNnCLIskuGhiT6+e65f7sf6F18Gx+lmTyrvtR7Ltf+EbyMWe4wbn3hy3VkQZ3yXnQERtUp5LGT4H53dYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6tqP/YF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKCa0LoO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6tqP/YF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKCa0LoO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KbTCj731490
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 21:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pmKN2/HQZks0tpmHaapx54nu
	pIE8cyQNKHSbzgNzJiQ=; b=f6tqP/YFyo1lXLN2qbefS6WAXA3eHAq623fvow1m
	GSNGrPJZg5nEgTLReHGhb2yx4uLZTnrbVXNl0kXlLZMhTuhA5yJ9hvnDZplw7nXj
	Kz4i8xIo3AGWJhWSEFIoDJNio5RbhzAFoBCnAXJQep6LcAClfkDmd3i3ZSAmXg1F
	qSpPZv42f5QJ2mLUzoa3mQyMvAy2c35UCAG12UgfnfGGFuQ0s34wvxW4rUCGiKfr
	ajgOY+nOGJvkz44ft2VqlxQtvdPf6QkZvjuuMybFBebozZfh37kVd4XrNPDe4L4g
	4p+ZPYHvsfN9QKUhKNqkGWuPklMZI+r7Y5pkwjoAL8EzVQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg011j02j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 21:06:03 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46f9dbad956so831406fac.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788555963; x=1789160763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=LKCa0LoONEchSlXArrJKU+N14L4f6KaML2w//9AkBNbpMIgW4gtNEDQSgbEw8Ks2NA
         UDe7I4SNgASNfS2K2CH1d0rWzAqzG4xGFolr4/N/f0U2l09Dr2uGfsVUKIt5rx0MBBLA
         +xmayAPFM1VaSr3O/jdpF5RPIgXfv5IW9X7aidegCVjS+nYEcBpWQC7DQJwBVVhrWsaU
         NLFpubswGfgbxJV1Rw6tNrYWbceyfS4URyaduiOz4dJnlThlbJJXL06+nknK5a3/tptN
         2/GjPIIF54j0ma18SavM15MB9BnxB0vN0kziBZPahi2MqzPOjJP3BrFP3VqmU2/xh3pH
         kLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555963; x=1789160763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=gOCpIt1JXBD01JStBzqa8xg0EnVQlF8w5RF8zYUjVCCduyLJlhhcopo7zHRADCP1yU
         Sw5SX2O6FkA/nEkCQgBGyTVORgWLafgCw8IqxR51bQqouaLgprBA/B//2lObUu9pJL69
         YdlcuYMTNes/izhTl5z18e+zPXvs+t6jrT6Oo5zmpzisFRT+cnGw7mG5GzuS2ZNEYAmd
         Ooxef/UuZJx7UoF3nKWLsB1ByLCcO1pAdisk1Z8iFn5u0h3/8Ack6waer1Cgl0t58iwS
         jr+Ikm4u6VS4jhOL/+fJ8q2hcNujs54WNxxQd7LzAdTCVKTrGAIFFQQyQsdyIrBO5mzu
         XRWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4tQEBLVZBDRRFZGC0pQAcdOi4WH0c46fgOaojLXTcjLHcMKig/fBeeE0U6Q2cjKm784mAW1aOl0kH@vger.kernel.org
X-Gm-Message-State: AFuF++l7ugNuaDQe7Q9CbEbDLn9d3KQ8FpiQggzpkQz5PlkrNi1S8c0P
	a4NT+DK/RHF0VvwnvdZZJ78fWVSI63u6whO5heEm926on3rTBOzYJrLMvmlD73C5CMx5jrKuT3h
	fuMEjZ44WqCToJk65UoDDWldbM6wKXd55Q+FIPoKWiDA5vyNoy46s7cNYd/eQ3ruu
X-Gm-Gg: AYBFou1gB657OddAkN/7zC2vLQA7HEKzK12sc4Nyv74Waaq8D7PjBkCqx231HGvuJ88
	IM7xTBZJOxGFEsyzEW+QAgl0SZAvll8Z5dBeABV4vZeudLOno/lyorvXIIuF7P+9fo2Tzx4jh1P
	x5RnuDwhK0qROBw2o4O4o6yMN693QTbdGWiByKmR/BU91rLnJeH8ABOHMj14yqdkuqiD20HYyMs
	as8VR9BE5ePOW3eDTq/1rseoePDu5jYb4g4iRrPWs56ynLuHXPo1KH0iw0k1ssSxGvNHR6HNHTi
	fw0LPtkVqxzTg7IG1l6zzz/8TrZh2w2lG53aPFJJLYms0WlXBeiec/YLgGlFq+tfjxoywGKaXma
	MuUhaXLhOFOCNlg==
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403418eaf.14.1788555962993;
        Fri, 04 Sep 2026 14:06:02 -0700 (PDT)
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403371eaf.14.1788555962494;
        Fri, 04 Sep 2026 14:06:02 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm8692399c88.13.2026.09.04.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:06:01 -0700 (PDT)
Date: Sat, 5 Sep 2026 02:35:52 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Message-ID: <apsysH9ia4x96a2g@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE5MyBTYWx0ZWRfX4r8q6CM30zfs
 U34BuIHEh+BoRL0+N5BkjAZbB/wkg9v5FOzyaP7HgDV8sFJuqpRVavOSngeOSx8r5YcMJEHIn4f
 Yrr+7hNWnW4mumZ4BGYmd18rA67Jh7QQrE45aEuhH+ufYJVGawLCBIG0jC6PAkoiwn4lCoGLjg8
 j4yb9oEX8VROzM4SItcQLWwoSwIL+3e8sPAeroGfIU0kMwwIT6pE55Uqdze0xDngHjtc/K/vIvX
 hdG3RtfDKAhpmp6IWaKujyeJ1kMSd4gbIiedPIfR6KyX9mD+BWZ1N1gpDWX0WUDmIcpzp7YRhCt
 KAkjygEVvp32qNRD0nVvQESjcv1YNuCdfdQcPEfpnuBXSUdmdHGy5XQ8x+OF+ik6Ea4v1oEmmq3
 2LpqRoynUeIjcd/f63GKQiVRZ2WMU22fPtsUxchgaawQc1koqHvQoXh/kFHpo5gOjl2STVzyPZq
 FKNziQCjIC3CggrTYIg==
X-Proofpoint-GUID: 5A9tVJnxHrpu7KaH69knAE_blV354JjP
X-Proofpoint-ORIG-GUID: 5A9tVJnxHrpu7KaH69knAE_blV354JjP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE5MyBTYWx0ZWRfX2D7TMIif4Nwz
 OuP/UR0VrAEOKvpCEls1kbyipniBvdkbJkJx9FXeZHr5LUagKqjWyrOBmS3rQetcOQyKY80AEkO
 BsVfhffxpN0d3pvJsBXz3FafFTW8FIQ=
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a9b32bb cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=T3LL355Ksxp6dEOEn3QA:9
 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040193

On Fri, Sep 04, 2026 at 12:13:42AM +0530, Mohd Ayaan Anwar wrote:
> This series incorporates feedback from the RFC and adds the dt-bindings
> and driver changes required to enable Gigabit Ethernet support on the
> Qualcomm Shikra SoC. DTS changes will be sent out separately.
> 
> The series has grown from the RFC and can be broadly divided into three
> areas: PHY power supply management, proper support for RGMII ID mode in
> the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
> required for NOC access.
> 
> 1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
> power supply. Patches 1 and 2 add supply management to the DP83867
> driver so the PHY driver holds the regulator vote at probe. These
> changes are largely inspired by similar work done for the QCA8081 PHY:
> https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/
> 
> 2. The generic RGMII fixes from the RFC remain. As suggested, an
> additional patch now emits a warning (patch 6) when the legacy "rgmii"
> or "rgmii-txid" modes are detected. A new change (patch 7) now
> initialises the RGMII link clock at SPEED_10 on probe instead of
> SPEED_1000, dropping the unnecessary 250 MHz source before link up.
> 
> 3. NOC clock voting (patch 8) now uses dev_pm_opp_set_rate() so the
> required VDD_CX performance state can be propagated through the clock
> controller. The Shikra binding (patch 3) is updated accordingly: an
> if/else block constrains Shikra to exactly six clocks and requires
> operating-points-v2.
> 
> Testing:
> The following boards have been tested with this new (proper) handling
> for RGMII ID:
>   - Shikra CQ/IQ variants (with the TI DP83867 PHY)
>   - QCS615 Ride (with the Micrel KSZ9031 PHY)
>   - Talos EVK (again with the Micrel KSZ9031 PHY)
>   - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
>     regulator for the PHY power supply)
> 
> Changes since RFC:
>   - Two new patches add supply management for the DP83867, replacing
>     the gpio-hog approach for PHY power -- Konrad, Andrew.
>   - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
>     operating-points-v2 for Shikra -- Konrad.
>   - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
>     Andrew, Maxime.
>   - Updated binding document for qcom,ethqos and snps,dwmac.
>   - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
>     "pcie-tile-axi-noc" as the only additional clock-names.
>   - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
>     probe.
>   - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Sashiko raised some valid concerns, I will update the series and send
out v2 shortly.

	Ayaan
