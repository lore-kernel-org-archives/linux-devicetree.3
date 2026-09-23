Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B39C3C76BB
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153451; cv=pass; b=Pzd4m81yke5fsysTW1YBfNobreMR/7sur0JmL5tU2JXi/fDYxXxXCZRZF1J99VX2qgfV6/fbT66tSuTevHh0V7NELv3uCbtkv8HsbE1fduHb9vr+gylRb/4l7u5XO2jWrD5hAdEz49szX1fKijN7OnMkHJMOc0xAh8PZgzNjSLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153451; c=relaxed/simple;
	bh=7v2013CmmvcfqVlNh6omWvZ+UMQjVGTi7ffXQjdnqL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEUkNhfdQE0fBoXgA/Ix8P8aMJ5U091iSri7js6TEjtYHy9Y0MCGt2H9aDnMsSpYNz/uKsqegln5/Y+p2K/Xrjm/ob74OUodvjWaS3gHQDBAQmyHv29mbek82K0dD860zIrbmqAxUwcichiMN6+uaSSU5Q7nx5umHaW7VFbnQ2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gum4gTJd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyVXt0S/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gum4gTJd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyVXt0S/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JMXa3853500
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=; b=gum4gTJdGnvbTqQj
	VnGZ48CvO5dXwaN703L4zRE+4OtxCXP5YLO9HxLDqbQqTpRsEzXa2GmXaZ43lhVS
	n+OKqyo+WE/T88KyggyHH+qNqi2dQVtHMHc+pizRqRZsvuYBer0Ht6ZtOc+cCjvP
	HNyGX4cKRPFjoAEVbmnwlwX/SMjRCzt+A7/LKtFh+7FiflXxbMoUMVERD7da0luG
	sp1Sp96ptBTmKOsZFaVb37aZVxVyoCL5lvAk7iceuIj5P4yKTsooBB9nNRB3o7y+
	Qma7KtaxD5RsFujeiUtayu16T088CgsnEIKghjg5R2hakTAnVU0UJ+0EUtQ1cMKh
	Bd0+6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3f1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:50:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso664996b3a.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790153449; cv=none;
        d=google.com; s=arc-20260327;
        b=ELq3uylC7zQeXVbAu7gCO0gOjSWKsx8n6veC5wZClpGbdZZglie7qxhSeuB39fIvuq
         Wl48/2QTL8De7t9+jPa0p3WKkRWaltEVzKbJGNSjqsdyAaLSu/H23AoMmO4aHEofV2Vm
         JxDoXcD6IcWwuoOi2DlUXf9K700RFe85OBZl4XusvlAopIW9b0v5olEWSB3usMblwftR
         2H31Mmli0Oirb1gbSPcWzxbNp/t6wZWeiB2O8eY9sxpQl81gcGBzZieCEA1jc9hbfF4R
         HjqEzYpTYkXjIDAdiMEVppAAqwmf4K5iyOTKuwmmTU0HV9PMWEMay2JWUpl7bLAdG2KH
         CakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=;
        fh=Mqfze/OF/oJfGAP7v0MDeE8dE6S38kK87oabGgqVtho=;
        b=akBMhT44cqIAUptJhJIaZDRmJQTfTC2z0y7mKmMosya/JhRFQ8yRulWa+aKHR8rdY1
         79b87iVxFHBv+nUn6zDYAlEWPGwCEzAgSoJ4ZqFopSEr4XZIHvdqkRRWcsRfHkK41BAF
         jujDmeVT/AThrtq9cYTC1EBVR6q88U+rpP/R6MfIyDat4wgrVjs/sBTK58dYhT//42jI
         D1sXyjJKCmcNRUDHOj5Hzkl14tH43vwBHwVySFRzOswRxCr6lX1tCx3kRGbKVioVWDUe
         7S58Pm53l9FU+5M9llHGukNIRS9WMT7NU82fUjo9hY1+glWgZ4ra4MHtsB40evJzUmc+
         TWmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153449; x=1790758249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=;
        b=NyVXt0S/U8o2KYZJDG3Fha35cml6RmzJfkFfXyqec9L9swOCxwem4AzYPlFMO+VEi3
         yZKxV0XrUGkguhcMRns8zfj9W2RK+MfOQXQCrQPe1uCTVeLSJbX7jbmFrTuSKPNGV+2j
         FqM0knIqtsHaibtDIXHc76xNoc/DR31OIkAqb4u0oLttkSOriWFtv4WyWO6XQ3SkxVfr
         sG35+JmEuCiQ+V9cy0lEr2S/LwOHx2JSUc5Vmr3oAp3cFMdfjLH9M7kkcZVqiIq/wG6E
         Sh+Xlm8CJIXKSsnfDOUrsuqZg9oS7PXALD75QJWBjQ/Bb8+4wavSBYzek0H8I8qW9q5S
         ZnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153449; x=1790758249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=;
        b=NYkv8eyReOQ9lKk96MY2wwxyzc2qKzfCkClpUBasIZL8iBI8ZkQ53LaWtiZUAoWi4/
         hxT0F1WR/fy5gf3hkzSomJo97ACUtPIapkyyfDrS+pUb1g5NSxvE6aolc1/F2P2Cz09E
         vdiY2vTGBiPAkuL9QGIrwXmbkpKWwb8YLnXW4co7SgzB9OG7dyc4VFn8+PfBurd5McBw
         v/2EQ0vWb60pU4m5Xc4zY5Wb10DeZpZGXTnG2HbKjbcl8BUd75KDu2rfonbEOjQQJPR5
         Yg47nYJUHXwEmWseNNmGFq9d7EXrtSQ+UPG1v6XwjxDJJBotVUIlBrrZ9EudvdFUnqTB
         wmfg==
X-Forwarded-Encrypted: i=1; AKwUvBx785hhammxBenJsYqagBhsKZdDKDrcZ9XUvEwCGtYhlReVKGpnZSEO6AVYf/Jf+5OaE7IfHU6abGHj@vger.kernel.org
X-Gm-Message-State: AFuF++mKcHgtsI5V9KJtGkLeDinOG3ze7i2QbCftYvHwGn2i2s54hK+Z
	YujQqd1ll5dM6lWnXNZjTcKz3dsYiio6dpDniEry2h6Hv1vsOmuxgr6TLJu2MqEeKV6d2C7i03D
	BYs80fzhuxbVlDhB9wjvhFwn+9Q0Hq42YzqO6PzyJDdD5EltRXMvN5XRrlK/xPg8Po5iXeMGjrv
	HF8n1JTCOlKERJnj2VzI025CFeLYlgCMKAHsw1zmU=
X-Gm-Gg: AYBFou1PF8DSyvvka3pFkC+MNPLBWPUV0w+lxckUyTCe+KWdvN2EByxaMTlZ7o6fiH+
	Nj5vhQLKaEReQFCSlp3+yVirorMBBT1cWV0O/R9FdCZlGRnSOyIZYD9NSx6hrv81Buzk6ELGLaj
	4uS/LI7J4XrNhbduTrx5pRA29cksnYhARxvfHR5H/kAyyn1LxkbzUTUYNh6mzrIZPS0PyY
X-Received: by 2002:a05:6a00:2e9e:b0:874:706d:9629 with SMTP id d2e1a72fcca58-87d1b6a89bdmr1526862b3a.27.1790153448513;
        Wed, 23 Sep 2026 01:50:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9e:b0:874:706d:9629 with SMTP id
 d2e1a72fcca58-87d1b6a89bdmr1526838b3a.27.1790153447969; Wed, 23 Sep 2026
 01:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:36 +0800
X-Gm-Features: AcwNN1UGyeerkYZHrx1isWt7YiSI0LmE8lI6EzIuvsSU-2kHZ8m2Q4mcnuwVcxA
Message-ID: <CAFkd8hsUzJEsDYjGSM3tsJzzwByuEkA+G4k1c75uYD-y5qU3iA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXxyQQV+p4u769
 t4lmfXwfnkVCpNlh7yDDLHhj4Ti3ArXOZV1qv/yzMzaI6Co+5PnsnlX6Fs65h4J7KayuASHSc/L
 Ii0zATRi++u8tTJwNUhLAnuFcW9AtguasKXGrROVizCbz0l7nYYAcgnac46BxD6Di2qRRhh/UdY
 aaz2KeaTdMQv8DgQJNsvtDI/rrFgdqFMN0HcHzVHCutwlu/dpM1ZXnwsdXsA4K0sFuo3QRMpoeA
 qmRYqMF9e0altvTDVzwwkIbOXkNZ/ErfBqWfX9u2uCQHW+L4+RuTAXbFB0xxokvgVqsUsm3z9dh
 pnw80iggakwgvGEOveLrf3VbQyLOrfgq3fyUUAAroNNn4vII7dtT1OUwHA98bzZ69rWozvMsax7
 7t7wk6h8cU9NN9HJg0mb83GnL8g70+7ekPyJFrky8z/cfK38U8GakYKS06JeaiQy7mjK0N6Og/i
 tg0+GpBSsIvVeTWH+iA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab392e9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=Gcu-WNPWmvmYkCXGu7wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: -4jEokEsf49JjNxVg3P2KVXcrsP3Of09
X-Proofpoint-GUID: -4jEokEsf49JjNxVg3P2KVXcrsP3Of09
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXx0gerA+mQRd7
 wxqk6qntJfVz1L4vJYa9vdqMgntXXhqFk8x04SOehoeD4JmSbUJvUFeAr0UwR1WsKlsYFXsUEpm
 InkOaN1TZqmlg8DT50CE4vyib34AL5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On Wed, Sep 23, 2026 at 9:08=E2=80=AFAM Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> wrote:
>
> Hi,
>
> This is an early RFC which adds the XPCS and ETHQOS plumbing required
> to enable 10 Gigabit Ethernet on the Qualcomm Nord SoC. This is the
> first time USXGMII together with an external PCS is being supported by
> the dwmac-qcom-ethqos driver.
>
> This platform was somewhat tricky to work on, with several new pieces
> having to come together across the MAC, XPCS and SerDes layers. Any
> feedback would be appreciated, particularly around the XPCS modelling
> and the generic stmmac register-layout changes.
>
> The overall hardware path looks like this:
>
>   +------------------+      +------------------+      +------------------=
+      +------------------+
>   |    DW25GMAC      | ---> |  Synopsys XPCS   | ---> | QCOM SGMII PHY   =
| =3D=3D=3D> | Ext PHY / Switch |
>   | + QCOM ETHQOS    |      | + QCOM wrapper   |      |    (SerDes)      =
|      | USX/10GBASE-R    |
>   +------------------+      +------------------+      +------------------=
+      +------------------+
>
> The series can be broadly divided into two areas:
>
> 1. Qualcomm XPCS support
>
> Nord integrates a Synopsys DesignWare XPCS, but exposes the PCS,
> PMA/PMD and MII MMD register regions through separate direct-MMIO
> windows instead of the standard contiguous or indirect XPCS mappings.
> Patches 1 through 5 add the binding, generic platform register-access
> hooks, the Qualcomm MMD-to-MMIO translation, and the runtime-PM handling
> needed for the CSR clock.
>
> The XPCS also uses Clause 37 control and status for USXGMII, while the
> generic XPCS support currently handles USXGMII using Clause 73. Patch 2
> adds the required Clause 37 USXGMII configuration and link-state path.
>
> Using a small Qualcomm-specific access layer around the existing XPCS
> core was the most straightforward way I could find to model this IP.
> The core already uses synthetic IDs for the NXP integrations and has
> vendor-specific hooks for other XPCS implementations, so this series
> follows a similar approach. I am very much open to suggestions if there
> is a cleaner way to represent the non-standard register mapping.
>
> 2. DW25GMAC and Qualcomm ETHQOS support
>
> Patches 6 through 9 add the Nord ETHQOS binding and driver support. The
> Nord integration has sparse, platform-specific MTL queue and DMA channel
> addresses, as well as a relocated timestamp register bank. The series
> therefore adds optional XGMAC register-layout data while preserving the
> standard layout for existing platforms.
>
> The ETHQOS driver then selects the XPCS provided through pcs-handle and
> adds the Nord wrapper programming required for USXGMII, including the
> EEE clock vote needed for PCS link-up and the platform-specific SerDes
> loopback control.
>
> This series has an obvious dependency on Jitendra Vegiraju's DW25GMAC
> work:
> https://lore.kernel.org/netdev/20260402213629.1996133-1-jitendra.vegiraju=
@broadcom.com/
>
> I understand that a v10 of that series is planned. While bringing up
> Nord, I also needed a few fixes on top of the DW25GMAC series. Those are
> not included here; I will share them separately with Jitendra in case
> they are useful for the next revision.
>
> Testing:
> Initial testing was done on the Nord Ride SX platform, where both
> Ethernet ports connect to the on-board MV-Q6223 switch using fixed-link
> USXGMII at 10 Gbps. The testing tree included the DW25GMAC dependency
> and the additional fixups mentioned above.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> Mohd Ayaan Anwar (9):
>       dt-bindings: net: pcs: add Qualcomm Nord XPCS
>       net: pcs: xpcs: add USXGMII Clause 37 autoneg support
>       net: pcs: xpcs: add custom platform register accessors
>       net: pcs: xpcs: add Qualcomm Nord platform support
>       net: pcs: xpcs: initialize runtime PM as suspended
>       dt-bindings: net: qcom,ethqos: add Qualcomm Nord
>       net: stmmac: support custom XGMAC register layouts
>       net: stmmac: qcom-ethqos: support external PCS
>       net: stmmac: qcom-ethqos: add Qualcomm Nord support
>
>  .../devicetree/bindings/net/pcs/snps,dw-xpcs.yaml  |  17 +++
>  .../devicetree/bindings/net/qcom,ethqos.yaml       |  57 ++++++--
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
>  drivers/net/ethernet/stmicro/stmmac/common.h       |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 162 +++++++++++++++=
+++++-
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  94 ++++++++----
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  34 +++--
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 128 +++++++++------=
-
>  drivers/net/ethernet/stmicro/stmmac/hwif.c         |   5 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |   5 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  15 +-
>  drivers/net/pcs/Makefile                           |   3 +-
>  drivers/net/pcs/pcs-xpcs-plat.c                    |  47 +++++-
>  drivers/net/pcs/pcs-xpcs-qcom.c                    |  86 +++++++++++
>  drivers/net/pcs/pcs-xpcs-qcom.h                    |  16 ++
>  drivers/net/pcs/pcs-xpcs.c                         | 126 +++++++++++++++=
+
>  drivers/net/pcs/pcs-xpcs.h                         |  15 ++
>  include/linux/pcs/pcs-xpcs.h                       |   2 +
>  include/linux/stmmac.h                             |  11 ++
>  20 files changed, 707 insertions(+), 121 deletions(-)
> ---
> base-commit: 6598456d72e48d779445bfec8f72114747f8b8d7
> change-id: 20260923-qcom_xpcs_nord_emac-bf296eb48e4b
>
> Best regards,
> --
> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>

Good Job, Mohd

Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Tested on both IQ10 RRD and Ride

Full test patch is in the git
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
