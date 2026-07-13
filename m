Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A42428494
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948896; cv=none; b=X7oOnu1eziquZ76qQUUxnCsA2wUZp613TRsxwD9JJSTIi1j5i+gJ6FlLab8SkJ20IhQP/f/DXORS+mhDmNkGPeNjQgZE6GtR11erhe19hTGhIvzXtkERYID41iQGY7RThjSeE0TX8R1+wD7k2wp6+klfWTsCap274Mbi4BJUL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948896; c=relaxed/simple;
	bh=SlOf+BhDICNYWid3SpsPo349aSqYaDdHZpfmoCBZZHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXdVzPrOilL41BaVPZaeBrmscri5hdB+bJGsp8npTSlQJzljvxr7J4QEJrMPriQthQOt6oe7yJzhIH7iU24z/93s9X3yoBPqDhS1xflLcCTH7w4SNKkeW6gbjAx9moynCVHIJf490/RypeD/ic5WEE0Z+SLbd0kEZ9pq+qof7WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LglMfE3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdYXBNzN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LglMfE3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdYXBNzN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEHdj1516650
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=; b=LglMfE3iuaXTOvC+
	Glk4qRQYP1S5h9C9BHTI8RQ5NJdjMZyMlsQsl5fbGN9kik4i7RA6B+kaxzVWS/MB
	AQ2J7J9DdIO8JCI1nDryAb8EyOQVoXHM/Gj/e3SfGjITUXUKhiiGqt+mvjpjEr5u
	Qtj5cWXSLd+AEl2d3ttJR3sh8V6bl+t0FWOUS4pVtm5zBFlaXd91t/H7WGorLh1Q
	xFp7XV18n+LvRnwDND0XpCMXYqLQvtYTEBLi66TqPSoB/JWUvFdxsXMu2LhjX3fl
	bBeT3r+MDRz95I8moyRXQ+uTEWUQMT/TAkSPos5ZuZb9lbQOJfRhS2UO7qLKesAy
	4YslnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsscab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:21:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso65369911cf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948893; x=1784553693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=;
        b=SdYXBNzN9nMDdSEet3ETP7RS15i33C07CmPLJBPp+5HAS/ZvtQB97Tc2STrUy1F7rD
         ylC9efWAtdozTUemy13jRsU5N/AZcVEyK2PBqHAbrELZfxxSKAh13mLz4cJ7LBzch+0W
         feeoCq5omZXrWl/Ps5F6si8uBszzV2RbSqWR1q17OStFDpwp5vogflKG59o3TFw/WF5e
         Fx98hQPff3V6tGCb/7jBwcxHwd7NYHC/83cHUNHBP6rt+ln9tBL8nXF1Gv/dsq9/kjJM
         9ICtNsCZvA2c9ZRLqvlt4cK/Itgkmd6fBGXRq10cWt9RFXyvzn2jyzzLkiGgNtDxfNfj
         gS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948893; x=1784553693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=;
        b=I4mnSe0i8JGe8tH0R67LKZbEfIxS8scS2cpahDvExl+JE0oU2UUjT46IY71n5O4dRT
         ml7RxJZvAYZ3rD2HM+/+3bl+TZo4kQxht6S9ze7niz8EqJtlI0r2VtD+Yrc3MC+PlaLW
         Z0qDcinjYTWp72kIm2JgDugPHFIVmxHQG4VLx+PnkVOeQMcdCGwUZpUloksdAbKs3lIp
         1x0vFOQfhopfVizMF1J7eXmMaG6wtvhFUifO5TbyO73Pp36fDF6o2gkUWr83KjAC4W4Y
         Ntuuyowb9q1wN/ppSr4iCiIHvwEZE+xcWGt459tvOAwahGGfO96Tay86EoHMAlxvtP7Q
         a7PQ==
X-Forwarded-Encrypted: i=1; AHgh+Royn/kqFFMDJAHdFFD+YZ6kTj8RRGFlH1sGVVyl4UTMOray8pzvPJfzFGwHRdOklWz3K0CrX1pYgi+V@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/Qntp7EPjJxK1f2FZIKQalPYAlT2ksM+KTNxfohLikyUc6af
	N+lS29kYggfWp/S9xkdbONICkIB+eP5IlnI/x36VAwAr7mijHioOIl6plvRnEUE1/5ceTNqV8+8
	BqQHyOd3/UVx8Vfr3NKp+GAQQ3Akiv0GxEVp2HajnayFzaF7hDdkW+C6WMsOmpb/+
X-Gm-Gg: AfdE7cl0e5jad7lAQSvU/lCpbRWD/cJ1IT5wUpcgHSbIdIEEGshLMx9hYyvzIeGkMcB
	G3DmT25NDsX6jUBy3RKGQzpOAakt6pB6Lx5E1U4cOwPnQWu2BOUCEzVQbb0496DwHjuR+qZ6e1G
	5eomspuu/z5Hjh+hacevzUHOWByV2FFuSZwROTsrIxB8hkvx6NnGI21a0pTQGW08lWPl3CK6YT2
	CE/glJe1j+g2E6VAGsPNsXktXQVmNCe5/cUy7xImGJjHzGhNPZNEUtCnJL+KUf9CtO3hLs7JxX4
	Nuldxz+z0UoBtLVkvrbCal3uROeoZrlBwUh/3bbgxmclrzQBpB5tjmMhpDUerHsFKqFhmhSCN48
	x5SDjx40jXGwCREBUSrCNTNXlYM9SMok2BfhRadPw
X-Received: by 2002:a05:622a:3cb:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-51cbf0e0756mr87983341cf.9.1783948893524;
        Mon, 13 Jul 2026 06:21:33 -0700 (PDT)
X-Received: by 2002:a05:622a:3cb:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-51cbf0e0756mr87982631cf.9.1783948892921;
        Mon, 13 Jul 2026 06:21:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:36 +0200
Subject: [PATCH net-next v13 07/10] net: stmmac: qcom-ethqos: fix SGMII
 loopback not set on resume after speed change
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-7-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SlOf+BhDICNYWid3SpsPo349aSqYaDdHZpfmoCBZZHw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY6LAQcF9quKJEcvEh90UXYXlVsW2Jh4yWPh
 RRmPDlSot2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOgAKCRAFnS7L/zaE
 w9aqD/955VoK6LaO6vaDxw6NTt3itus8v3c/OJJG0p98jDFCjD9YC2veyzrofOQ0TKWJWkmc/qq
 5L+Ac3xpoWqBjo9EjcMJwbHZA7YDaQ1QBEwbfrOIYjfwaQvPgRz543CB2Rirv7mpI1ME/ZYGarG
 Lc53Oo+GNT1knmktmT98TP8TPiwyfLnv6s2jgbfzHlQVdSxInzl6Xba6PrCJHuhMLDi43O/hvtI
 hkq2+mkJvQnUya9sbFoNnDO5XbMFOxMtggKVASqfi5yaDZVn7M8rRonjE1EbIVHWfa/toUesOa0
 P2e0vo0oOBPPSXJ3r+YZC31vRjm8PvCtAFda8qrWLHm10Na27nQ6aU+4dKx3LBtP6fXF1t/Sad5
 GVj+DwHrUg0PX0oR+JFTj8EmlXXKuaFe9+36xK4HX8ntTUknyXl/r3jEBsr+BP3e+vriuO1WGBN
 4gURGfViayyslZFJuqGaC3rGsj4SIfzqaN+4tboTUYzP7uHFYkFngFdmj/ItLNcy5oX2pCfSoIQ
 JoFgO/XoSylDbz5dTihBwgI4MureklGQDOz7Y1MVSeQl71Uo6PMERaIIUr/PlMJ2PFikXISCBbz
 B/8f1XlpUku81iFnZGKEliv4krJ2aF3MsOEoa7ov34PUKUoIyWfcroB/lyMGxpL2A5g4yFXqFEj
 krC1QUE24KD0tBA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54e65e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PjAGQVefHaMtIuCO3vkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6jUXYQOp_iUmWDtpbh2q00_o3S9paVMx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX5kfG3lKnIhjv
 Em05LKelIFRlLlbOdudKXmuv719NabpeFrcFlEBxltVvKR16jwrItTkhHnXi+SeeWrILMzIoiw/
 /Ja5a7xy9fZ9TtqOPE33tpE0cuKICx4=
X-Proofpoint-GUID: 6jUXYQOp_iUmWDtpbh2q00_o3S9paVMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX5SaOcgLGcrwC
 ZeD5Ix2uN7ZEU5cCM/OxTcgc9Jzp3aaTcsPvJiWLi8Q8iiKqJrZFG1aBT4/dBilsbv8jBSlgSJv
 2XLy0++HbI7Y4WmlkkFj6ylxYpbjbBhgGGrVe3nKJCv25UaxV93NgEMZL+5gpak59O75+mHaRF7
 yplQDrlQs6R6VqDYkaJ8HcIzxZFJmVtgxA9QhYxZ+h7J2j4atUojQL1vLXpUrb5QhpUziQJW1B/
 3KihhpjvPCHFSf57Y+Cuq2umF3l8wstd4O4KwfnmmtF4avewSm3xDz3ZrznG0RS0tVkLSBnwuxF
 iMvQ7ZYf+HoZ6z3raMLh0wxmQH/Z+EPNrpK/Br/M0RP3vifPw4COnWCpYJD23sVAXkn/Af4Jou9
 1oI4rI5eiNCZQ1447GRvsUmPGosOL/9uLHRj7FUmM7F9Bz8ru/UkYLgEM11srDL2lJUiBdCd/z4
 tuY8yQeZ3zeZbkddhmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139

The loopback in the MAC wrapper feeds the TX clock back into the RX path,
while the SerDes is being powered up. Without it, dwmac4_dma_reset()
polls a clock that never toggles and times out.

qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup and the
DMA reset hangs.

Extend the guard to include PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9d19203ae4bd7dc17aca068f5eb88ff830e4e906..e083d7d55782ec8310e9375e466be00213667457 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -190,7 +190,8 @@ static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
 	if (!ethqos->needs_sgmii_loopback ||
-	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
+	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
+	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
 
 	rgmii_updatel(ethqos,

-- 
2.47.3

