Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795664;
	b=T3inNfTWgjKksaDNCtXFUBNPpI90cKiew+Nsj7VNCDAFldTBSZBUc6jLEQjNgk/ytsdO
	 FocQEdprt8NUbFhXJbZoJ49xvBJSQie2YUMbG2ynaa1TNMD0i3q9eTEa7MxmgfR4Zyza4
	 tHsKhYOJxTG/W8O7X/h7ulGQWL1odhPa4ByALwWQ6W12yHW8bnTMw5c3/UAfag+5chntU
	 b+qOIe1OSeoZhLhhT5uGYYasD3CFFLRevudhSsvvOE5IFglIa4vOK79MOpnTUCTrNDSUl
	 tJqdQ4ZMBBB73Zcfjq21erhB4YK/kBbZdB/eO3oxNZRYJOjm2zvdaAzaPEtrYQpEDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EqoAs6H8wdhDTUov2PN60C43VJNKZBwCm869elCtiR4=;
	b=AcBBPdqs4/tBv2mBL5sMmIgpMwiC/tfAUkqM6n+4BcqfKOGcvNofKhfXQJRibe7QyxPj
	 7wFWLtS8TRilmpkkiVvvn5ucOO7FTbN7WrJ7o+tRZVDriZG7YyyuKP6LvaUnL8y9Mj8uA
	 mAeYY4dkThBBY0eestOscS3dtKOp11kUUy4pHYFLrRYd972j8oVWg4/Qrr+BPnx7Npz9b
	 NouFjaUhXwWm5UFsDEyy7R97/pJd6c5Y+9HJOrLKUaI2eHb3M5HMNaC8B8cWVh00NON48
	 C2nmZkdUHpkcnUzAcJ6xDz5weukyZyMBzDBgyuTv5VGf8YZvn765d7+MljRpDxCMMgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H/wp4w1o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aT1eBqaq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA50606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA50606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H/wp4w1o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aT1eBqaq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpgWJ2211850
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EqoAs6H8wdhDTUov2PN60C
	43VJNKZBwCm869elCtiR4=; b=H/wp4w1ogc4WxlF2ikPS2F3eiu2XZC8Htn+/Dd
	Hz+RRnUDu29U0HK5QRbkh9wAUPFPey13jbKHW2468L2SuPHdSNLriMunz5I2RYgr
	TkSBPw35iSuc9fbtIhneAItlw+lWkZlY8gFsDnxiR3CzHOPWXOKid+MyX5ev+i3i
	4K/AXXurj8iVP9ZcOSmW6VonrkNssybeN8fLgQLAfhwqknhA/tkAHWDNt+mwTzZM
	/kemYjH0YWhuXvq7AbJxv0viDy3S9RqKYvUMICENEb8MT6MADRLWB0b5oMZu2gbb
	x0+O0OnAErqN7yR+uOWh5hxaRTF/N2l4JiTsQNtG10bE874Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55uqgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:07:43 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b3b7d66416so102840877b3.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795661; x=1796400461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EqoAs6H8wdhDTUov2PN60C43VJNKZBwCm869elCtiR4=;
        b=aT1eBqaqylDqiiwEN0lEPlNWxS4O9Nhdk8GfgjZ7IA7WNrQ6M0ncEH3ASelfGx6AdC
         SlE+g+DJejdOfNdvJMKmTvESXxcgoAMvNlf5ZPcljHNIyPrQUjNryEbxZyVU91G28uAS
         n3ghh6j8cPcJtHhq9Wl1tTSg0/kv/4cNAUhnBIFxibjVr9rtyzyRuaGKe1GjcBKgNv0k
         KVfcK3nLIqPw4c7+O4407jebclB7VpnaOWfWmpzP+DTC4o8kp4iSpJsUAN8YOJ7n4QdK
         l8yCtMV6FvOMs9GRq/W405JGcE487v1LA/+tHnCZM4FfS+47G+JIJwx/kL00tPonQbsU
         faCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795661; x=1796400461;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EqoAs6H8wdhDTUov2PN60C43VJNKZBwCm869elCtiR4=;
        b=roRKQv5D0iKIF5MCfhd/e8jh3yL23+M2USfJa8FixAETkYSEBXwk5zjATVuCdIZZAY
         1YnQDUZiUurmhlU2j/hcviexgVzwOqg1DpjiIeYoN8B7+u3IZuaAWXGixYLI0kVpIe4Z
         U7PznabKva3gRVWK2P4HtUvISLxtPl1QKN6A/ct25c4cbzX//dugNu/XxNpY3YWSvOMT
         a5/CPFv4X33P7wyRVNN39NwSTdmXLQSjkkFOVk+570+jW+jlgwpnPST3jy1XBsvfbCcR
         NKWn+tHSIv+TIc/Ri9aFaW/jrEiKFn7HNbpE+2d1T+qFiuOJH1Q53OfMBsUetEJX1Y/R
         +m7w==
X-Forwarded-Encrypted: i=1; AL+hErEAuY347Is6T+SRv4gs9MSiZDJ0e1A1xgmuUM/41uhaEdyIcsPS81/GgTgFDRJBYdON6S6kqNuOz+XS@vger.kernel.org
X-Gm-Message-State: APuU4Z+/ynV/D6Veu82EbkjjMdG116gdwPjA09JEi9jM/jwyZ0nJ/tB7
	TW3Gy6m5bIKtjrYruWsFn2eZnLTqMDgQAkyibTZItlY9CGOk5mL5BhXtSZY+Zn/Z7cz6Ydq0P/t
	VaO2IWlofY2pwEv5LNTyWczd5k3Koe2XAn76bUY41iGrnFXqZvolxUZpOberPdbkk
X-Gm-Gg: AZFdTZeqXPBAu4lil/4xNEG8VcBwvf2qQn3ObI45vEOAhMqZ83tGREfd6bFqX2g2CEl
	e8hdVmAWDfIiPTILL+bbixdsOwHxfLADtNBteqwhr/xuEJP4Z00UiZs7mrT944deDoZCUzqSZkd
	JmWp/sAaGfLGQsj+kESORyhs7Q4YawzaOsQJ4WwFJPwxeW19EKMpPWQ2aq5TJ1HG24UI1UfpvO8
	Y0fFsyfynLmbWUjdwhboLt03fnxQ7U3ngvXqVGOfUwz6h/NQ1URu9QtOjYj82f0hUmgx6j1PyoK
	RLmcbEUq7V6liJLSPi87A0TJXE+iYdmBPZUlgVzFvqwSFUOj8mNSvc55fAMakC/yeOyCv1dNGht
	Jy1LKGkObcSlIk6yXF+IcFSn6B3e6gPROIjjBPfRrzWZU8BC05lvM1zQk74OIqTVi05zbVLaT0Y
	6tZLmbnV8IEzE3KnvBc3DABRQrIz8VcYxX/R1H230RCZa+mpA4lPjt9Blm9wn+lQY=
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr88485717b3.59.1795795661530;
        Fri, 27 Nov 2026 08:07:41 -0800 (PST)
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr88485607b3.59.1795795661131;
        Fri, 27 Nov 2026 08:07:41 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Fri, 27 Nov 2026 17:07:36 +0100
Message-Id: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMiqCWsC/3XNTQrCMBAF4KtI1qYkkyZtXXkPcRGTqQ3YH5NaF
 OndTStSwboZeA/me08S0DsMZLd5Eo+DC65tYki3G2Iq3ZyROhszAQaKMwAadA5SdhRrbajtA7U
 nI4GnwCFTJL51Hkt3n8nD8Z09Xm9R7peycqFv/WOeHfjUfhbE78LAKaNapDbLcoOFNvs2hOR60
 xfT1nUSD5nMARaHszUHosNkWQgpbVko9ccRXw7PVxwRHQQjlLSF1Oy04ozj+AJwhyfUXAEAAA=
 =
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C2c59CwGUVP0632RzJCNnLkW6lmqn/C6S/pQpmYMr6E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarKNOPSDhuusgq6UThFLgvAXDa9ybP6t8EoB
 IagmFp6EACJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqygAKCRAFnS7L/zaE
 w5GLD/9Vgs8+S03mLc7k831ABxgELeCA+i4hui5iVDXh5+q+dUkZoZjl4ASrs4s3OUKswsCwXzy
 FRPSxSAHDM9LIE2iKgfxwsBCXZCe80S59gWzZXMBQYMM7KOjtCZ7wiWuJxDe8sjjzkyCfvchF+y
 7y3MFDhYal8TN49DGin7mRcsY+lNVWHRGE/MrEstuwIQEro9XYb9O9lc3x8ypvVHs/1NnvA99sP
 cJKF1lBkWdI/y/XaDCdHHQlmTokUQE7P4d/K+tWG1cYNlu45e/EmtQY5oYebHHR0O+rCw5AeIqN
 TIiV/D01Hp4xmIvw64CHZ7zb3kJ9IhyLhg4DBxchVMtY6a1B0AryC8aCBA4bF57n2ZHqQ6TLxCP
 50NqexAtR3IdLIDaxO3otmecwKj54efL1yVgoeF/t/l7YOxQzfybjMN8+xKGskwdRoPvqPiITpd
 sDcuRIxE2SA/it94huBTaMcfUaVb8FUKtDgvs8lTx3VhNL2v0qfkVcwoZUsKbOia4GglkOMCabN
 I2vV/r9iNKqBoJwFzxsd5jZ2jp4nKav0F+Lc8nQv34H6+hP7J0KlEXdYEb89qUBq4jj9rOxj2OE
 Gt9bC2ANSf6mtWE0C3zDij2pDmIggCce2n8n4r/eczeO4Ofd8p6yeAIYhhGrl3mwJQXN6n6bi4/
 z37Jpi7euRAGIrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXzToDmmdYIsy2
 Rpy+mhB76p48C4p8WwnbUv70RvSot+I9gTsdxR0IvxWFjwVdPN+VU4p2kXHEbLsmj+9rsijz2IW
 sFOR1c4G4axKkhuPxFWWA15sAH3gdCs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX9sKHUFODBoD3
 mdLMNe3myo5mrFmji/YxW9cdCsWgpA8X3T0wc4zsGfoyGHR7gZl6SLmPY+wD38GPO0K0lQ9w9EU
 Bw8+CDve8+dECjLjC533/u98IuRHcRbHM5VO9QUudbBTccOum2PVtFgnPPxAV/8jRSyf3vSnuIe
 COorwyQQl3QdIZgcur+bzND5kR7EyFkWe1xWHs//XFM7SE4UGHPacREmhPXJcWdqmIP27BYbrAR
 WSSPpJCvnRpJ409vVN8ReAqWa0OZxXG6V3yJg6qWjOlLNHSp5lGRJtxazyhrF8ePtWamdKj+YLp
 AcAxqDS/aFv4sVWHPZcI2JSKoSbC3u0sPNHKnbg5eYZmkPKe6y0+U4nZe4XOSM1txLrpZhdKSdf
 JWw/wwxsXbNb1nCHavWTHxMsrfo9QMPZsC6j4dmxv1nieqjQfr9N1X9Mk/1iWtxUTeAOh3U8lJU
 f6FvHdkyQYR5G2t/wbQ==
X-Proofpoint-ORIG-GUID: Pe4LbRNPlW2ZNrbWNS_CSp3zrStv2Ie9
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09aacf cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=WiJAuuJCOr3amH6hrZkA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Pe4LbRNPlW2ZNrbWNS_CSp3zrStv2Ie9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches.

The second adds the ethernet nodes for the sa8255p SoC and enables them
for the Ride platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Fix serdes node extension placement
- Rename the MDIO child nodes to ethernet-phy@X
- Remove useless snps,ps-speed properties from EMAC nodes
- Link to v3: https://patch.msgid.link/20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com

Changes in v3:
- Move power-domains and power-domain-names properties for ethernet
  nodes into the gearvm variant .dtsi
- Fix sort order for nodes
- Fix PHY label naming for ethernet nodes
- Rebase on top of current linux-next where all dependencies are already
  available
- Link to v2: https://patch.msgid.link/20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com

Changes in v2:
- Fix node extension ordering
- Move hard-wired serdes phy references to the gearvm .dtsi
- Rebase on top of v7.4-rc1 and v3 of Shawn's series reworking the dts
  layout for lemans
- Adjust dt nodes for dropped power-domain-names property
- Drop patch 2/3 in favor of overwriting the compatible property for
  the sa8255p variant
- Link to v1: https://patch.msgid.link/20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  34 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 199 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   4 +-
 3 files changed, 235 insertions(+), 2 deletions(-)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261022-sa8255p-emac-dts-dbc521421276

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

