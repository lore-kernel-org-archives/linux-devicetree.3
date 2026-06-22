Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202FA3B777F
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137350; cv=pass; b=h/nBr3LiCiWArui+g9E8cPZIHrSqaBWhTsw6LpbAJJ/qkB9an5vJGIKetcjfIhvVAVaU5ivPVkCSA3tJWIN1RhcwncO3uPGnIRmoJnGFkRJVNQbufn4T6QpRzDLYNoz5nfAtSv95PVG0tAo1mOgnDyLLoGQs6IzxPhlD3DcFsAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137350; c=relaxed/simple;
	bh=j0PcU9FA9y/fGAXF5DL6Fd9e9DH01a3HLpwe/GGgy+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeBWiRu0TABZ+KJ0kM0Bl+9awXEIFH6SGWmIZCkc2ric0GZV4aDMEpjjX6BEa6bLbftmVsP+9AHsqga0rjmj8Dq55ccy4CVFE9Lj6a5mj1YhDRYaFNEfX5nMQSyFbpSE5RD9QedpFZZc0t9RDQMg6pTv5QIvwRwyZj6lFk/zyac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwaS/eYc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5wPAl89; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwaS/eYc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5wPAl89"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGQXr1364364
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=; b=OwaS/eYcL/DzLaXf
	I1rZ9Es8Me08EuamKRhDMc97a6z+fUKPBv6jqxHySXCmkt7RTZjO54SMk8ZST7KK
	/Riyy8mXHLFXsL/S1tY75ARTSoyvAKxa9+ptc+0wpmJ+ncL1xfHzMEujzXFt0HuE
	dQbUAu6CVzDaVj8uDX5JrVFUKI1oS7dxer0A4qU4qa7wLBDEfuLGHrNEFllmcZdh
	uWDX86fw6cB9+VOjFfHfGB2Eb3TksgAmgDjcMz3L3fBVeQYEhJvC9vm5uaqpm7Y6
	Xv/7ScvPZ12lQWGnuCLLxDzci2h2C4F1iYNtjslgxLRMjzhMlKcHXB0muXIzcIMR
	Ttt0DQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5pxm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:09:07 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-71f4e6ff16eso5794566137.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782137347; cv=none;
        d=google.com; s=arc-20240605;
        b=hYejZ17WXJER0sYFLyutnJL1jz4FpwUCUoen0dBpjrzedpWPJOMM5s37yBGpi3CJOy
         hlEjkxzrHR2jBYpF0+sroH4Meqh3XHSfTlGHfgf4rAUbhbbJ52rTINw5XrhIqHpMk8ZH
         atpWy2+8S2f0i+0FbsBaroxA3xnx6Xesgm4ueGTb5tY96yzxPLjb48gskcfIbMeel0PF
         iVW7GsWwTh5RXvBQUVQGjOregg8Bra63V3RLvKtCP21cRhEsuPRLYfUZlRwt7MUag0vo
         QQ+P4rkWX4Wy4r3ZfrSmvtGlPu96WpzRolSsvA9MZRLPRs/jhk53MEYmjF7o5WWeHgbA
         iqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=;
        fh=Cf6PAQX88h9J0QlSxo3mKstNXz92wsblcM5kE5kVe3o=;
        b=UHAHwwS9ugW9iG7VI4NC9O7oUMsLOuMVGVycJ0ClQeZnXXnLKNHrszzKAIatslOC7C
         a+Lc3EUzMIYtAKVAl6fB84HV1DFrK6HOChlT6FXSnhWE7c6pakGqfhAxzLftxjlRcXF6
         5a41lq9uqfIsdIqhObH/lleFdQcJ0Jfwi148P8YcgBfVzW7Z8BZM65rvZ6McvYViUHEe
         tqEnPFJYFGkAoupm/uiV31R/IMxZ1uXajs/i1dZBLNThIBSj2bnDPuApI6V3cgUqA/ax
         +ATeSw3S37HKwnMa8pzU4fwj8hBlvCt1gegm0RLmuBulcqCT/BrvQzymCGJd8Zif+URA
         Ekfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782137347; x=1782742147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=;
        b=Q5wPAl89sRPVWrcwAKdbOYLvdAIJVIgOH92VgU84Bn6SPGO2PrTXcrvjV5zhJSI8/n
         j0udyGRq8jetcaeOk3IBHWgyoTzakqgczhaUjGqjnSrGXTV/JO7qvzU4Z2HjR05xob85
         TIVERPK4aUOPGxPHwtyzcBliml2fdu4PZQBfaUIdZ1KW7k3yOmUVXEdql2j8EjUzQISK
         THVkOf9R7z7yMKs5nsE+PD+LBwsN3jDMAR4zSgFSOXyXdKsmXhKL7nucwUkQEXUltXah
         BwEXfjfhX6iXnPFZg1cVgECBd0RynCiGwisMAYEI3KcxccyO0M2qwrTYdLnD2EcZUqyE
         JA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782137347; x=1782742147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=;
        b=huZqhDgdw3jkqlrGDBZ22rxScJBeWj+bwA1zxQWjyGG2zTEVupUJ8zd04RJOOuYRMg
         y3U8nlc3oa6ljzGyTazPigdoQAl88qGJ8TyOCeZHgO4EYrjCDMf6+UBK/JulTXMHwbHW
         zZjyhp1dq/XPR2G8nSphof/B+4iIS+k5b8vEIMTvlX8yLrajC8rh1iwYwHh7KxyOFrgB
         UY1b0Ksrx7WALTIvTYzC4n+wKWoNadYuvv85PI0UUH5UizzNsQXdT7ap9P9bj5rPpWC3
         Tmcqg+91zDWD5k94LYfsZytqVOqWLv+sAheRgTpLiOo/BcCbgKsmfpc3ZHb32wnz58Mb
         hRqA==
X-Forwarded-Encrypted: i=1; AFNElJ98GFqclRZRSXnJw0Sfe8d0tXmJIECP5JBRLF74LRg9ILKau2Opqz2sVmFUizYisya1V8WBt2MwfI0e@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaww4dqV08qC7leIcLoDoYJ+0uW2XmVkN4nhgzH/IGtOHoTVa
	0zh9LV/SpxQzHq/EdCiWKEgbtz4WmdWikf95dcdhUT/6IZn9dzQ2Dh8iT3QF9CR9QyrCM7ESxna
	7QRLDPJnEA9Og7XcLtR+GaagPIRXGQIgVQWjiN1JS24zY1Y/nvK/BZmFWvu5zvqGaMzDg7+6NCw
	TzeAy7F8Ygc+5iG3MimPhgS+kq4nGEPNu3D3Q9/dY=
X-Gm-Gg: AfdE7cm2q0yZ/FP24eScoCOtiJ9wsHG+F8qBypXspbd2ODi646/JeppMu1F1ZVu7Ld/
	nK6JT5r9doqOK5dLNzmHY/kDva9/y7mHtwOm2wUAgOJjo4tPn5ZmENGBKDI8IENOHRc3kKksFa/
	fNzViuvVOfS1k8DRUq31uTO3p7thJZRPpUErcKm9GklvBK0uN+Clr2VIldMjCCftlFtvw2Ae1Gt
	bW9uE8m3LRRifX+1sa0oCjQUeS4/isQE1hV8z5OXsf2LkIADXbXyBXhP/kIFddCVGTUHworIhDm
	LZXO5LZ/Ag==
X-Received: by 2002:a05:6102:94c:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-72a767f94cbmr7292343137.3.1782137347225;
        Mon, 22 Jun 2026 07:09:07 -0700 (PDT)
X-Received: by 2002:a05:6102:94c:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-72a767f94cbmr7292276137.3.1782137346809; Mon, 22 Jun 2026
 07:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 16:08:55 +0200
X-Gm-Features: AVVi8Cdxu7NAlkP6yLvTDdtoyFpBtKVQYUlnmHNky4ya30e3n3LB9oUky-fhdQQ
Message-ID: <CAFEp6-3De6r3XwSmnKpMSSf8KK3K-esDAhTRKN41Bng-Yf8dXg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Additional regulator support for the Qualcomm SGMII
 SerDes PHY
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0MCBTYWx0ZWRfX3PGFj53EvkpC
 CbtKdHqGLitbFxtEl4GZzrlE9V04fE3Y5hHVljjzDBnI2H4O2uvqgRfYicU7Hvq4r895NFzw7oB
 FyCMM5cbsPhjy4hNNwMd4EchEBGU1FWjXeT3y4Sg7cwdD8ggRZ609sGal3zmG/dLnpLCpN3UEPF
 ZeU3ytl9h3F5MWNlVapek9XKpfBTaBzu7qb8vxVotEAbMACZO2BAMty0ovixXp10GekUA4yICnq
 N2zc2i2U+BXjCgNMnfTuBUHaj9KNtwFehiaKa+IHdw0ow+0k3ra279eq5X/g4sThzNt0Qtsw8so
 6WeTj2nV6sI+pyhymc1VhSew/ZW//TazgJcCuqqOELhr9GidwntgWirwhvovLu6F/ykQU3v9GnA
 ZUiiNw86nPgte1traFBPQ9VslztGj2o2lBNyLV5TkrPRgXvUIkb6ByZimYkBh1WpgSQeFVs8q5z
 us2UcSiJegoyAsNQXHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0MCBTYWx0ZWRfXz2LVYl2xYVUT
 puN0rA+IAnwYhKHj/6Cyz+AXQjNhp3Y3i7lcswFLkm1X1ETCJdx01D60Evh8ZX8Yq4EsVAqXYzT
 /N8lY+woVwGYTeJj5y8/tfU/piDJZok=
X-Proofpoint-ORIG-GUID: AspvVEV6yZMPuaPlZzib5WJ9AggbzzGL
X-Proofpoint-GUID: AspvVEV6yZMPuaPlZzib5WJ9AggbzzGL
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a394204 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=CcxlLIvrYPQ71yEhQx8A:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220140

Hi,

On Mon, Nov 24, 2025 at 10:26=E2=80=AFAM Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> wrote:
>
> This patch series addresses a SerDes power-up failure observed on the
> QCS8300 Ride board using the phy-qcom-sgmii-eth driver. The issue occurs
> because the SerDes PHY requires both L5A and L4A regulators to be
> enabled during initialization. If either one of them is disabled, the
> status register does not reset, and the Ethernet interface fails to come
> up due to a timeout:
>
> [   77.105651] qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STAT=
US timed-out
> [   77.113447] qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes =
powerup failed
>
> Presumably, the issue is not seen on all users of this PHY because both
> regulators are often shared with other peripherals. However, the power
> rail schematics for boards using this SerDes PHY show that it is
> supplied by both L5A (1.2V) and L4A (0.9V) regulators.
>
> This series has been tested on the QCS8300 Ride board, and the reported
> issue was resolved. All Monaco and Lemans derivative boards require this
> new configuration as they use the same SerDes PHY.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

This appears to be a real issue, but I haven=E2=80=99t seen a new version o=
f
the series or any response to the feedback so far. Could you please
follow up on this?

> ---
> Mohd Ayaan Anwar (6):
>       dt-bindings: phy: describe additional regulator for Qualcomm SGMII =
PHY
>       arm64: dts: qcom: lemans-evk: add additional SerDes PHY regulator
>       arm64: dts: qcom: lemans-ride-common: add additional SerDes PHY reg=
ulators
>       arm64: dts: qcom: monaco-evk: fix the SerDes PHY regulators
>       arm64: dts: qcom: qcs8300-ride: add additional SerDes PHY regulator
>       phy: qcom: sgmii-eth: add second regulator support
>
>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |  4 ++++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts            |  1 +
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/monaco-evk.dts            |  3 ++-
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  2 ++
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 24 ++++++++++++++++=
+++++-
>  6 files changed, 36 insertions(+), 2 deletions(-)
> ---
> base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
> change-id: 20251124-sgmiieth_serdes_regulator-027fc6b15216
>
> Best regards,
> --
> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>
>
