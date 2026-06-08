Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54163C3437
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926898; cv=none; b=IyHuLLhlm/1EyFZKPXBYv00xhm7Zjjn/UQk4i/euQ9Vrg5KT6r8ZEIpVEIKb2/2PZETVhZxpJmG0ebcdQdSmPX3Qtju8KPREqVZUD75nsluZTPYREPRHzUpl0LTNWl8l8PCGCAsYEyQ8NqZBEknc6KINzrC7GMrueNNPAyQSUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926898; c=relaxed/simple;
	bh=5KXu1n1MOka6nMgTyyvyWK2ZkHmYE80bVGSOgJWhOj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pf+QCIdm/remcJJflxd8mnx4+tnt8EOhXsmiLdA8NXRfigLhBAdoexDs4JeLCIzqqbLGQuIC1ir4SlEXCpNlhtL8EjgrWFsAmj5cckDvADlI5AeE4w9BOK2Jh4sG66W0Q0RpE56+NiWLVJO40p7NLOl6QCcFsHMIFziJ+RzHtF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/j42oMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7caxUol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/j42oMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7caxUol"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRGUh3271837
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VHXMBaaaX43r38R6RMvQ/2
	0aqiKNP6NgI1zIfoFP+kU=; b=g/j42oMMs+Fe0nmeaiPMbyCKM5tZKg7Ag2eOCh
	yTlu7II9SF3Vxql2ESnehbY3S6T83qBpheA+jzS9qdVv1g90eFnmz0H7lKdutCSp
	8YJbTEx/4C5q/H5vNqSy+/mUfucd/IGYNKEjzUq3JBE1FSGUSqgYZmLu5gGrMn4X
	YAajqJLRzbvNgbHAoiDob4FsMBUEBBCeNGN56R/qtSWX0P3KtAJIxMYOBr68Z0Cb
	eH8rWbA+EaQFlUjtMluDqXfauRSFGvSPAt+qtm4/yJr7AK2AH+Zz/5DUShhEfcvY
	AJ+y27sA4bwlxESIWNNvzJRv85g4SLRpetcyiD6au9w74ghw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrks8yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:54:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd3213beaso95252406d6.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926896; x=1781531696; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHXMBaaaX43r38R6RMvQ/20aqiKNP6NgI1zIfoFP+kU=;
        b=h7caxUolCmr5aKZcVG+jZKeFYghEuEIajgD2v96j6sbNH3zjNlejpxBv1E9WFOdnlE
         plWMAYUgc66WlqNzEn/PE8nnR20GpV2+5mT2v0wuOGJ88TyKDhXBbv5IBn2ztzafw8Un
         ID8BRtz9M7f/iNkdUmVoBsxPdTkC35wkr+bKlf7KkfjrMocyX4uc7MJvds/Ki3aGKSaJ
         giu9Wyz/VhsjfIbx+19bmWqmdNDeG4ke1qAyWZ5UOPB0cdHQwOSiZuwQSRdKEOQOtIHn
         POSBTp7Xsbm5WquYq6c7wv0+JtorbBGfsdyaaneTYhtEdSYGKmrIPMhYHhVzqMTEFJEJ
         4mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926896; x=1781531696;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHXMBaaaX43r38R6RMvQ/20aqiKNP6NgI1zIfoFP+kU=;
        b=ro4op/DZgB8K2vMclTwzGJbY1QoweCkF25jbUCzxtZWfAeZBe62sw/bRVXS/zQemks
         kc2mp9NvbnjpkJ0/s5sp7dTT9RDf5y3ADf+o+bFwmiIbuG1wCNyCj/l05M+EoV6Maigz
         pzuft8nmx03DznkuNSJ+4ZosqButje4gW5br9L7/Xr6sECdeZLGMHrFQKPmZsGfuZ+wf
         Hsnrm+hr8xCeLdyQqQ6a062bMuewjr2cdKYUyxpJMEj+BDbNI3GUTDb+JWB3Af9BhYMu
         We53xq3S2Xfs0y8eS3pb0C6EavgZ3qTY5UnpHl3bC3pjjzudv4szhGFd3+YswQHoLqRZ
         Kb2Q==
X-Gm-Message-State: AOJu0YzJ+VZcfT+YtX4GBhZFKaff+H0bxqQSgagOgNZHmJS0y1Fj0UEu
	nWmxtw60vwDzWf4X8yZ8huDyt28S65o83LBmhcnGefOShHrFD1Mpo9EAIaAaYyTXc9FkCJZCUkl
	jJZWH1xUiD9PSmuAsHmIAfHIzMxlwbekgNMpBlbX22T4bOvAL75rElAHZ7QWxaXWv
X-Gm-Gg: Acq92OGTeS/rjgwOTCxxKIK74W27zPFCqdSAdd7X481a9G9KLcT5/4X2lLz4dSWPGLe
	eGN9HgKtQ+c6krZ/v/aKaQy0IYlpkrG2XFdc/PtknAq9Eu8eVMacBtn+Hatlq11BmwZ6103As1Z
	XzugtePhlHfyM+wvluIP549Gkh9z4EYTLElC7Qx+xj1d19UPLm3r7DCDoYkKLHJdUxR/nQ85DA6
	PKDIvYhx1/qP+v3QLu7Jej27/zm8YijRWMBZaEudAoi1NRM5JrXzhdzRqTXuzeCbhjvzbzeDfv7
	3E9Vmfh+jAyZgHy6IY9nriDoz9hziDZhCotf0Y4/yowN+ILn49xl5ylQBlwzqol2WPCGcS6mk0f
	TYM0rvtl6BepF5g3Kvt4XUthXRc01A1hukJUxb1goNXkqbWwu2ENJybM=
X-Received: by 2002:a05:622a:2488:b0:517:9544:163c with SMTP id d75a77b69052e-51795a08a3amr237897721cf.9.1780926895984;
        Mon, 08 Jun 2026 06:54:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2488:b0:517:9544:163c with SMTP id d75a77b69052e-51795a08a3amr237896651cf.9.1780926895083;
        Mon, 08 Jun 2026 06:54:55 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:54:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] dt-bindings: mfd: syscon: Tighten checks
Date: Mon, 08 Jun 2026 15:54:13 +0200
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CQAyF4auQrm3SjIagVzEumGnBGi1kCkZDu
 DuD7t63+d8CLlnF4VItkOWtroMVhEMF6d5aL6hcDIFCTTU1aMgTRjVW6x1dX+NTMM5lfj0NhnI
 8c3eipqXAUCpjlk4/v4fr7W+f40PStGdhXTf4lcSjgwAAAA==
X-Change-ID: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5KXu1n1MOka6nMgTyyvyWK2ZkHmYE80bVGSOgJWhOj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmHTZEo9KGMUVk8BxpmjyNm9DOKUnoMB7qfu
 hcw12BUy2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJhwAKCRDBN2bmhouD
 12eCD/wN8FRAuWSrx58xHk1mCkSBOc0xnWZjU/Vmp7NUUySzrsPGgw+rjzllYoSGV37yUUSgLtT
 RFP6kVbQPnTOrhvLQd0LTqtuvmzXB565ufn2zII0aNaFSucaEqt5sqoPo0RMlBf8uY4xu+t0hkv
 43QmxGGRSEgkxuSFysuSoIeLEgNHb6s3uXpS07L5Jk5Hnn/tzcx1+SoxjPP8qesLe9bIWt+bObq
 bHqovEx/QEa85QvwTIwAWRJGizhyX5M3CpRiu/lr8ONY6GpXxGM2RD5H0RHEWsDMo6nwUt7ADGR
 Ks6xeJ9rnqr0DoH8SXuQNOX9m/+76XJQyO8QdosxZMXr81m3Pi1vBZZEiR+twCj+kjE7kTry2D9
 5vlDpDPhYfNfS62TR2g3KFWnYGM9JLem7e4KGxxGJf7jDAIA8FLFdLeQVATMTCs7mGW53sJSxQV
 kKvgk9iiwO1H1eaV/N1YTHISjneedRjAAx875WneAgpaDfXNghB3SMm8KTAuNq4sgaGvRRk3r/i
 9M0RXgorNGxhPkWIP+oLltRl+/NCAT89GBaGJMPRaQEXlG+Ux2sDxuIp+tInst8zBKgp5C2X7+R
 B9Klq4MoEGYYB+KWZPmH8amW0TySPq8/IUHKUbIudGKwjzv2vQdJEOd5F1RjOHhdr6ahgLpvAIo
 GONyyfGp+UgCmgA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: rC4cXbz4VBg40EHlaGpzUbnmC8GjlW4A
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26c9b1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s4keiGDSzyMyFUzW_nEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: rC4cXbz4VBg40EHlaGpzUbnmC8GjlW4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfXwf9VQ2VLAd4e
 kL2MwjxrbiinqhDEKSpVLKTN1VjaEJ6RV6Svt3xjCMBWr4hqZxRrb3u9Ipb4mlVPFGAN5xrwciz
 NKP5vOgTXKyao7Mza/VGEnUKqjF9r7TwTVCkdCnV60BhOWfoXgW0rIAOHFUUldc1zUEqofaOJ7L
 rtqceO5BYjxA/Z4peefhzTZtADZnD6V3OZUF+Qbxgj5RbzIu+JmXu6gp+CXG/KLoy2sgC/7uvep
 oqpZuA0dZkwhP2vxgIA73XKR+4RChn5Ohsq4QHh0jwbDedy0PsSw8KNQq4d1KASsUDTYviDiyEG
 asErH2eg79TJIONqdqkMiqH1mGQ+tM03XVmSF7D8uGtiW2h2zQQWTOZyfPoAKArZCIpd0vcRthd
 Srw2XCJbXB0Xut2sVxtEBlxe2tF5B2luVNWA68lHPBpHZJiDQDvQjJO7LJjwgrZ4VYvcUxjEBLh
 lN1FzTqNLxNQNNMnNug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080132

Changes in v2:
1. New patches #2 and #3
1. Add missing part of patch #1, thus not adding Rob's Ack.
https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/

I tested dt_binding_check and dtbs_check for arm, arm64 and riscv and I
think I did not introduce new dtbs_check warnings. Old code anyway has
multiple abuses of syscon, thus tricky to judge for arm at least.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
      dt-bindings: mfd: syscon: Drop custom select for older dtschema
      ARM: dts: ti: Add specific compatibles for SCM conf nodes

 .../devicetree/bindings/mfd/syscon-common.yaml     |  31 +++++-
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 116 ---------------------
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |   2 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |   6 +-
 11 files changed, 37 insertions(+), 132 deletions(-)
---
base-commit: 78f5e68a8d0a1123dd1b007688ccf0e6876a5c15
change-id: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

