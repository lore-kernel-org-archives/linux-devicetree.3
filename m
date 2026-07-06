Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26779416126
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344045; cv=none; b=FBUrsBJ2JGkoAHrTHwp1gW708nRrk4gRlYZtfvdNNa21K9hno7GVDyThgG4zGgsjxy5aACoZCUaSpwDvyh9cpykXPKZLebeCEvtJmR15R7LELtfxqw/aziMRh8XHRCO5HnFjFl0WPica4oheW1DAnTzxLc2c5O1cjpgLIO2cr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344045; c=relaxed/simple;
	bh=r4nzs6Q+Vb/dz3RA3Qk8xYysKrUAYteRCb53IwmKpR0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WQrJmlHwxH6nIvF7DyUR3AxyNS80+iySgbKLo2O6U60zy3Ydc2OeHu1aUefy5RzBYAe+JcYjvcQwu0XYFcLVNRWJItT12+ECRclIQ+ej5/fZWHGrq2vSXGGlMHO0v+d2YtWkOD7IsKcRJYPnePuKtF4gJSuhBvbsLSbsGrk9gmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGdIn+mS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acG+fKQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGdIn+mS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acG+fKQm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxV65219072
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S+/dKj/4QSkaC6Y1b0yb4O
	abzlICyIBStrbgJ+vgezg=; b=JGdIn+mSzwbuvFvd3FIrakLHr6yq9g3AK3u3t4
	dt5ddD9yRCYCF9fvCcetIJpc0+BbCncAkFqjHqJedvaabYzHnHWzhnafFUOPEYZJ
	l9JOi6zOiwdjZklD1fWP9n3QVrpSaVWOtq/DWZwGEmcDKM3fRriQAsRM66axz2Gg
	TqdD72zv7R+ApRwvcix0LJKjCQF3pNXNWYQ9o1XXJJVDTOYb74r5Gvp55l9HJxI8
	fSCRmc6iRWhM3f+halyEgjR6bTMRjs3tfZYyDtaGOaZdgo4bnqSLil3Omx+iVMeO
	YuMkcCqUC7+2DGmCoaMHWDfps1AMhD/Zhk3iprmmJr6+Sy8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs984j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:20:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so505530985a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344039; x=1783948839; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
        b=acG+fKQmVPMSAQqc8VWae0EOLW7SjTUHwrqiwkE4LCel0adtN2GR7nCYIPba7T+KQa
         04hUjWeEhvIjquaI8sHB7VT+Px7HtYm1XZ+p6DbiaMFLCikPtWezvLXl1qgEAUsvmdFV
         QD8qAdXCmCyUG6jXoTh5ofMaRrt5wZZ90k28T/Mj9CspbXjz7l2v8ruFGraIxvXurryS
         opp9H/Nvazdzwphz2mS+ZyX1QC5ln+rd8olhiCfBkutSgJtIomy4XXwcRufnfnA3/qO2
         eAeAqvOb+PQ+kJ0Vg9Unp6w8dV+O0z4GtN1VmXJl/IFbwOs6qAPz26dPdXBSlukw5BZJ
         Zr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344039; x=1783948839;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
        b=XHo9gp/W2mgj17qdDK2wuEGqi/qL/59D1ndVuEAi/IaSChC16o9uyBLMokj8SBy3mo
         WtHnzUnV3JKApTh+H12pCcydb2PHFaR+/y/vVGXprE78lYIMkGujhFE3wymQ2IjUqdYh
         RSQqOxdd29jjKulUjh5E/A7XRfjQXjFr3pn6mS0Pv8wo+ACvCy3qQTQPyEvNA9dKU4b0
         HdYVZr0ypbv/AjouDtsVcFZ6m8vl3FuSXUdOUc4MguZosnuoAwRJuUtsOkiumYY0WCKE
         t/cPDwg3jTSLgMN/V02pCB6EHOaXyCnFjxqnfJFwFtpPYP+b8BonuSo5r++RzGl8e26/
         bhwA==
X-Forwarded-Encrypted: i=1; AHgh+RpNqBkn2snvMbaTiWdt/+83vh4OJr31ybET5YhbgJIRM8HRdVNpoc/gmQF2v0NNChSKQa5Lh2w2+D9/@vger.kernel.org
X-Gm-Message-State: AOJu0YycYrfleHk48LUNsdzVwya1R5cQ/jvt1HDIs5J1LMOVh+i7ioWd
	DHXrHeMjSShU1XjGYSafo+9X0vePK0Pk/VHvdUl+vcX79dieZ0za0Xuw6LDLsQq5/jJ7V0XId1d
	e8hr60ZioPXTX1XyW66VreQqWiaAKHDl4RPwLv/MpOVpIc/vBDkjLFUGCL908rupT
X-Gm-Gg: AfdE7ck6EwO0i0HyYRRs4TtShZ77i31qDbN/RaSO0OFlamVCAAsxaf7fWBtfgod40Ej
	3zOoX0rfDyFiPKS8Ze6Q6TloQXbuyu/QaV6FFgogql5u2es2zwZwWmmoZib0IJ0TkSbYM7PJFFs
	Q/HbpbmUMUnFiv1Ezv+34OGlI9Xjh3pV0t/iMk77Eu9K2PDoNuEsAo7pVz9ZQmSkd8MaYn3u7lr
	g8wCrvbJacGMxbnH2VMLtYPabTP6UMKqBm3ak1qG28WvnXoQMUMe0MhiXWlQatcBm4ZQw3ODGj2
	1AKpzSS/SChHpKB+ewEjPr4fG4dMOgY43mDHoRSmcNGrqYc8w0IJxMZKy3/bLhDWKt3FHPCSG1K
	sCiRQkrm56n9y+RnLcwvOsOBQcyZQzhJvl0Mrod8J
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id af79cd13be357-92ebb55e04amr64066885a.34.1783344038132;
        Mon, 06 Jul 2026 06:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id af79cd13be357-92ebb55e04amr64060785a.34.1783344037495;
        Mon, 06 Jul 2026 06:20:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v12 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 06 Jul 2026 15:20:15 +0200
Message-Id: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCrS2oC/3XSwW7DIAwA0F+pOC+VbcDATv2PaQdIoI20Jm3SR
 Z2q/vtopK2RSi5IYHjY4JsY49DGUbxvbmKIUzu2fZcnSG8bUR98t49V2+QFQUAaDKjqXPfHavS
 WtD5V8ejryioGktrXGknkc6chpvY6ox+ii5eqi9eL+MyRQzte+uFnvm3COT67DqHgTlhBJckbV
 yeMzHb31XZ+6Lf9sJ+5Sf4TCGRKhMyE0YZNcCTBhxdCPQksVjepTCTDzADW1NG/EHpJFLPQmQB
 sZJTeJ2lfC+EnQehKBGdCWZMQLCnGuOvHcXv+9l9563Gbh8fLZ4ABkdYAy142KpBvrHwF5kzMX
 yYMErgEmQw1GQKU4FQwK5BdQIglyGZIWyIT8v8C2hXILaFiRi5DtbZOqmg4JVqBEBYSyWLHwaN
 fnAQKJK1HXqPwSTEVPwwf3YvBpOB00Jhcgbrf778j1CUzggMAAA==
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4nzs6Q+Vb/dz3RA3Qk8xYysKrUAYteRCb53IwmKpR0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uWhtNuvAg/7TbC2mCPqok9Ose0SbrE4DJGN
 YmzDZncOMmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurlgAKCRAFnS7L/zaE
 w4uZD/492fkF9KRUF+LhghAa5/B6yl9bIZPy2zmr+NuB1+uJHaG8Hm7kMRTPkhlNyJSB/uNjOyJ
 3rx9WO2dctD2xiQZk2pvLGnQin3nhR8o8cdlI6jzfZU5Nty5YuxTWH+WSqDy8q4YHPLJkW5WrJ/
 cEg8EZ8ZXm91TLT5VPIbq6iUtnTH8sySH/S6i/SB7TOlIeHUkUd7ksKug0gi8UQkmTFR+dNjdUS
 hlMEDyDza6mI51NADNs779EiBIhvvCDTHiOufvj/I3R+f+aswn7ia8ZmBCt6fu8VNVS8VpiMc8O
 qtLik7F9rCndGqr15FPOyH52xLeub9y0ctVr0AA8S4jaKxSIQA3F7tp1jcoLdRLAOck6IOnLm6u
 nOGOFVyHF8GIacisPRWGV4C/tRFDWrkD3EjexAq7l9PfRjz55yyQ1R6w+h5v/syxebW4+llB1ET
 c2IzGDiX1vjnqUp772AHLsVpKfAlm7xlZQMfsCyDi0qwXa0Zs94ts7Mvrpz39Zns98kZSC2b6jm
 Alitu/+XYQnjlosxKtc7ZVaV89r0cMYnPF9lHDa+QOIF4s7cSiSQXFjbz10LFMsDgJWQUO1FSsw
 D/AHRgWBdv6SFHNx1NhhkX6Btid9yv9yzDw3OQraxBv4lnjW+ta7AYdKNXZKGbmmaC734+7tNNO
 xGyF3acpcNwjnag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: R3Qqq2R1EF0BJqloVtybjX14xdHvSa1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX/D11NmbWS13n
 a4YFwqkcq/rx42pxKKZJqOu6hfpQAB0ZYLqYaKtHiBBsGOE6Fl5ORaRy4MAeB71pLYvyov6Z7fh
 DOXZpEx0id/4AqYMpcZjQjUYTxg0K11L/MLQpo6o4tmiXq2oGqy6795+mhSAFdSSuEdnaqbMce0
 B5pvKK8Sc2q5RGaNLa/QcgM4ePu8urHRdZG9hOpLZKpZNXLMYzAL9ZTmYT6yi+Ewxk0ay8HlOaM
 NW07hJoxMzddBXOfvQs6XfMSv1Vbl2+GAiAkhNQnx4CstuwezzUjNFl4PPPn/8tV97Ie64v3EqZ
 jo+dKs9qP9PbH/IgpXesQ692XZmL8UpsH2b+uMf2VBTCseyN6m+YDtR2Z82YWsYzf7+7MKAEv+b
 wicBV058FDKsk6F++BGuC6MnW5cHaJFuE0mRIw9hkWI1Ap2aL09lTcIWB0BrlgrloLX3CfQq3BA
 +bJd36FB2sLdguyfn6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX1Vb3E1HAR1GG
 m1vw9qbfsiQUqdEonO877lbDPCnK+zyh6CJmxZzJ8zDS83iT8APz05BshISMmS8XVAbsykY5pbP
 AmwMcQlLgNCJu5ORjO4Cozrtk7KaJRI=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4baba7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: R3Qqq2R1EF0BJqloVtybjX14xdHvSa1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 ++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 230 ++++++++++++++++-----
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 161 +++++++++++++++
 29 files changed, 573 insertions(+), 56 deletions(-)
---
base-commit: ca70e9a43a66435fda3a9d37f90c9c3b7bf211f6
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

