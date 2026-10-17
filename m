Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D83AAF60
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255171; cv=none; b=lF3w0rRSSdDiOp/dVcdYU82F4hEe9qGNPoUSN4FoGOEVnJDSEkoQU1+aD1QjcTZ3lbFHkyQy6g41Awu9M8R1ZkwsE7xWAFG5DRVvExmHRJ5+GxtJzzHFb3iZSXBQ/o2zai05Xfu56TE/8OqYGoutDsMx/ZG9z2zuLLTArfdS5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255171; c=relaxed/simple;
	bh=VjJXPVvJ28GFo5oaYh5V0N4OmfzYXgOo11M2D9Ou1Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaPlv/662VrPQy/rUP68T3l6M2gm93zs6u6xn5o+FbxxCkVKmmX6/D53aEqn/ibQaXE6EGc4bumJKQG5gg5X4jU74dqOuVoFo79nhPQs6imxr1Hm3BcithiazDeNwnKGk15Is9b6mWjpNwUoHZZCihzzNHs5MvUe4ybRDyK+BXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqcI3njC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaSvvfce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqcI3njC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaSvvfce"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAGBv1944743
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016hek2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:39:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso2499264eec.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255168; x=1792859968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=SaSvvfceXYmvCRkB1Hsft7Hfa2rtKp/OFb5/8k61c6Ny9xnY2K0z1fhXfR2dynAXla
         sEfTL/x8SvDpUrzg7W9c/usmuEzk/4/HkaJ4CI7P7QJNF7Za0qOcb8KK16ChRr7gsaht
         Ezthx3PtrBf9HWTfUfmdOmZz9M2EcylWAiXLPlM0+UHrgR18DdxWIlCnNjFCM+/TryX0
         AV0l2IWcAxGi6WySnx1kzFiZPe/9tll0IeXg1LuynNvxiKrct/K3cckK05P8H1L87hHf
         ZjHNMaNFd3wy6DyipPGH5oGx9pneMBui1E3yL/cCMWmJwdnNUaWU5hJVNrQr1DT3rGPq
         c4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255168; x=1792859968;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=F68PFe03zoIdcr6jU3KnBdYgcVYiA25f7ooNBVs1wJkIyj8mBIdCmJDigQUCuwwHeE
         HG6ql80L7pz8kGi6EL8bV05O0wdC4KikzjDFbn49mqKZrAg3HvvtJ4B/KiOvtEsyORxj
         3BMH61cRK4D7dVa+Tfb8WUF1USxSM2oMfM45255orhzqozWFw6mYVhyUtuUK1PYVN36c
         VqGHSZxHWE74QUhRsmva8lixJdsWFMsR4pKlODAuHmy/O3qtCEtEFdOG/ckjH7AZoc9P
         nZ4fBDywwrjXAEJnyeFCEyHTqvi999aok+tsG2pLRh1OwHCcOCcGiC7HIQxFVxgCA6gb
         HNZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/KXCwNN94z7Hm3C7ZdghHUdzQBb9Saadb0U0Ecvj0m2hQJ4d+zpwmmY40vJBuC+bh/MOj47OmzuEi@vger.kernel.org
X-Gm-Message-State: AFq9FYIPKN3x4prBzzvbgmPRBzYJ3F+tLqMtTPLss1kKyKH+cs9YlFrw
	9PP5LzDogZYlCh/RmnfQg0zJqWbpRqVOqK+ocoiXJiGeBOw7jNEu0+q46wlo4x9q3pxL2JiIZMa
	h5nGm6uiijSv0VGvn/2l2Wqehp8fvvmM7bF0qeSoE6xx2HtpYWTRr5QwUhdoWcx80
X-Gm-Gg: AYBFou1cjwVoZBE7qLMny0BnQW1gyEVHtbXw6yARRZsvbPxvr5dPHbUxLRXMdgVNRok
	bWUD7GXqF0ZHeuLb19vHIAPfR4q4MwqSsEjRd2LDm3/yI64sBIfz8dzjFvnBcF9yh/vGKbBKc2A
	yga5QtzBQ3tjIhtUci93DT7mN4byq78jjdKHOQV9WJ82B7CKu2Lcg1L4JB5kWynA88wVgV+A5hb
	fxtUMGYq6T0L7Q0mU2VbB/zbqOSDqKWW2I0MbqG+v9+mE5e+j0PHeKp9MbzZCEG01/pcDZaQZGM
	UhjI/huCUBeshpDAoLULrOObBpl4a0UPnspYV5aQSxb631bml93AacYanE5oMlkiyEe1uyg+8t8
	hAyl89f2pySJg
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629982eec.32.1792255167518;
        Sat, 17 Oct 2026 09:39:27 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX1xDWZmoClc9X
 3uM7dTR2nIh9Zd5Xmd5z7N4FdFkSkk3vFZdp+pnFG3SpoZJlegcvxMB+S71PHf/lJlIsybEj8uL
 P5Mpo6fZbYbT2yJGd8T0M/BEFKdy+6E=
X-Proofpoint-GUID: Kxu9NQ_Yi0aUBmO9yw0F6gaQl5zhldxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXxWpzPM2xnixZ
 btKkILxPMW68KlQXVqyJE+k+m03locHSWcJs7Uso0co7UuevYwU4IROtQjt1pmvi8MSyPk66Cp8
 /ZbQzKUngC8lZYxg/y4A2GQJ4IfJCQrD4iLLKam+HQx7pO/6ovawjSc/2NLHVu/PNEg5hvOmEx3
 5aTBVldyP35dPRc1Fxxx+lqnf1kb51jCHl3ueJ7pp9BkbJ5JzgCM2dPoXbmpA6DEpGHTGmIZm28
 0ybD2LggnRKkTNJ/SS6gf1mudajr/0xlofRWQkGT64iPleYu7F/XrtRQexPz3oPCS/x137gt3P2
 lrpH+lZweTx9uhADMinJ+VOrcjFZokKpFdhwKy/xXMVo5XbQjRIEXPGyPG1+5rS6b7tvsSEcFEp
 dzkiKMc0+s+oJKTE3XqyDGkA6ct65gjlWSJxtgDSS7pYjv+6jG4TDbiemx4FfxcwcQVrfOd6Qp0
 FHr3IOYStklaSU31O5g==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad3a4c0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Kxu9NQ_Yi0aUBmO9yw0F6gaQl5zhldxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

