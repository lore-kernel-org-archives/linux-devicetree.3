Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609D3C1D7A
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 19:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614079; cv=none; b=JyG2xlR9bNHtQooK8u8fIsIuo9kCEqLsja48WzAkfdHgzzZtBapC3DJtkApFvgFmJWOZMYQbi7V0bsN1+vwMRaj/oKeYmwpHKWxTViBR/E+rq97aTJj/w9Na3H3WMyQDd6Ul+pDgXEcgKZso5hlCF2GjLaJEy3ZHoiJK6ozM0uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614079; c=relaxed/simple;
	bh=+SKTiZ3DJpDnhBGULd4sVaUVBc0d5Z/9jPGH0XAffFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7Enhcb4Ug6yRGFfGf6tXSg2cSNw0nnfUWI1+sKACa1o5ol8dNzL/eNqvN4x+oSEsd0h+/qsuvEiPndttq5FARcL38yMkvtk3DS+eaDAPBvjlxoufHrcAPJdAYFZGHxXFztBAnK8RujEjR6ezSQxp99iigaZjwFDUFjJrDc4uXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z49ry31L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZcsFMyJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z49ry31L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZcsFMyJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J029X3600303
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 19:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SPPRZrtDb4yO5fESfxW514PoTShBn8ns2EG
	+MLlrXnA=; b=Z49ry31LPztTz5MhZCmR1MUuQFM51xCwzjbSsUR6BZfSi2/IDhX
	W9LoVKKmlhhE0an8RA1mh3ojNJaf6+OtjxpCyedHNhdlt4LxjGUy/XZXj8NL8xxU
	lcilXXUwcZ3YxpXzuCAacCQEPnKQqZm7Fd3DV2H7kR5R1u7gkweapcVtvi32gEEM
	N2Kj2IaXUbVA0/JuuhBkOdXp5yKGj24X5eS5GB6sHutlbxvC5aXJhOr/8RPVBlho
	hKsl2UlCRPmwsGCFcGiysTF77olmLJkMtO8ya+gc1wUupjl5gdMON7/8ky+SsMEI
	wqxIU/dQ8TYSvrJ58n+dfUwvbR9jHckVg0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfseqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 19:54:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so186704285a.3
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614075; x=1786218875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPPRZrtDb4yO5fESfxW514PoTShBn8ns2EG+MLlrXnA=;
        b=LZcsFMyJVt1g48qtvGo6eY5W/YBbQvFZbx7bz2JuCr/OLqZu8U6WhFS/bfLdNJ9vtt
         zjFBnQWZVaVQ0i3G+hucuyQuIILCwY6aLkA0vxMLq5Udyj97n1CcCU7xT6QVr4xzlrUP
         le9Iz/5umEM4R+i1VYD1Wqf3fJOdlHrq1gtnua7my5DsbUeh+UdKXG+BwPSj1RwMNEyD
         505pgsjTzmsd0xjviwzO3jFWPCMcnMsLt3yfEVkAOKAZOrSytoHEHsSFGflfejuiW59O
         Q8+dNfEbMT96YZAGLDhFMClar6L9RAt2867szjyk6W5UmBmwj2W5v9/Ip3GjTvRuykT2
         NIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614075; x=1786218875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPPRZrtDb4yO5fESfxW514PoTShBn8ns2EG+MLlrXnA=;
        b=hN+XN/EXWUH6prJFKSizf2uGDLE3K6km+GoY3tj2ql47fMLYXSsmDG2tbNSD3Xt6Ef
         VPULF+aPMb7o3sOIzlU2d/t/MSNDu6v3dIgzGflA4i9cH2CqKm0waLr8STtfOHHCzxlv
         JLIFMTI+eF0n89vFlLQ9IAJOPSQTR/eo+w9DuTXJUJCLw1JQhvwSM5uCCSsjDsZtUBr1
         smSveR0Hj0evH57diP/fj8whSxQNcJDbU2Bq6E3gPSG6SImDbgrXdahN+M1r/BTPlGfg
         7+1kB70vD4wiiBxs+X6hPdoEYugTg1B5O/UNW6L68kmOV7KB5YvesHg9g5hP49HsD/aM
         Cugw==
X-Forwarded-Encrypted: i=1; AHgh+RofqSFz8lcaLikH5pAyZVzTntI9BLuLVkRb7C27Dz9V6siTqabPLrpTuCDQz5cXICwaetaIfSO1+Tmw@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4iwscRemsJDGmq39hKHs7Dm3Iu/MyAbW63X3qJA/BsFwgUQS
	J8ByKjvJL564FX6R4vGhlfgFFakSmdeX/fYvbJphXUIg6ZgQOeVefq1HRIrv7/fOz2Bj19kuWrI
	aHBNV4qQMESlixq5n4qIHEcyZdUWIN7G7mIbBFAAW9U068Yte2rJda5QJ0koKu9Ns
X-Gm-Gg: AR+sD130iNUL0O320aTKRECRVlE3iNrGToyglFS7cmuvB7zqrlDlrwJFKXZqKIznrfB
	IWV3T22EUd/3MQmejg0UzETV+6WKF+pkOM4grO4gUWnIFHFz46GSiWTg8oE2ycMUB43FS6hAcoI
	u/MwN1kBO5DWzdC76dc/Vs9Dxomcb0qUgm/ZYV8sa00lvIcCg3lO/jfob9Eybo1i64Hq6RGigZQ
	RMWeQV/cQL8ADhtLyEgmpAGJspQ0obTIG5QD5Bd6XHBfeZMqUjW5U/EocioHChj801UVnqcnsaP
	iCDCM730P/4bGoPsjlNonL0+mLXu+AF+N63A3LndIEZzrn123cyRA09XXiKaIDPqPCKYXlBfqqu
	Z3tsWA49tQY6WNjpu
X-Received: by 2002:a05:620a:4549:b0:927:59bf:46ca with SMTP id af79cd13be357-934a0aa676emr883838685a.40.1785614074838;
        Sat, 01 Aug 2026 12:54:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4549:b0:927:59bf:46ca with SMTP id af79cd13be357-934a0aa676emr883838185a.40.1785614074404;
        Sat, 01 Aug 2026 12:54:34 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm74616955e9.4.2026.08.01.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:54:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: Correct white-space style
Date: Sat,  1 Aug 2026 21:54:26 +0200
Message-ID: <20260801195425.234120-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+SKTiZ3DJpDnhBGULd4sVaUVBc0d5Z/9jPGH0XAffFA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk7x8JD0ocq7yPTibW9I0XxL1BrJIyy+gOlzD
 NSZX+dVzvqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5O8QAKCRDBN2bmhouD
 12l9D/9vdLrcnTK8bOMcbsBBZRg80oMM/ej83hLCNFR04e302VUqcygYd3qdXXe/QOxOulC8qHe
 ddThx8z36UwYyEVVcEla/UA7e59NOZwFExn0EpAhdYB0wCSN8zm7Vf4domLByB+13vC8CsNs6xl
 sVdqyc4PYdaYFJN9BzSaR0AVb00LO+Jki98+6KHgEyDA2XYGncHbNXWBciEcpb6GR9j3DS0eBnE
 xJiUE7o+ytkyWWtITMNycfBY6N2DFLCCAXLQEztSTlTUvE3vrdKmXvEhra/Js19rCCFGZIQhfr+
 X3AUaebgIQsHY+MxZNDH+tzvgdto0O81Aksoauuv8DNMIdLX+ZhekFqh0lYXGFojkcNSiF9ooLq
 xedQMlRP0oACmdMvsrpQAxHWc+r2zP1N0dLZOUdxjWZoBkuZk3CyPo7zCheUkpXpPrq8o9fYzUs
 9KM3rmi2/Dg19QH1DJXCXdSlOewuy89Aodakd/oDnXIsIpq1Ur2owaGukPgsWbUqUOmO/x0T/Kx
 hRVd/TxXFvt2UVbt/GHScQvhE9Qt7uADm2NMDd2ve6h+6iSYsAbUoo2CoaVbmY8+FEY67697cFz
 Pd9z4wA1CCRUmz6lWpx6YM2pCRBwBmujnvdudlbtGT73WoYsP3iUl5v6PKnWUrefVSZXKk+zmEk Kh1c0HB2bXn4G2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jrfilcvS01krsglUsXFOjicKkZh2AUR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX12oJj3INa65w
 dTJYwdQ/vN2Otc935FaO6JOAfWTHPycO4nq0ghUYpH/xa/Xfc92VcAM7PAqoWf4Tmsq8VAQI1W2
 lXREnXCag80vhr0A+TjWzReXDjsI8mwDtaQoQqK559s5BjNFLoFTZ4UMThsnyFXLauAqQFAsgsH
 Qtm7m+CzdlsXrshjQl2bXiaUvtiL43dbMUKHD0IkpKeCP+Py/r0BT2/NjjX5g7CtOk/5USbUWUw
 RkD7CGGZrCoWBYni85cQzuRveM1u2pIUppQy4q33CMPqTzhOLoYLoG1RbBSvmAL+fZd23rC3U1T
 lLhGraFSQRZBRvxp4ppjEvUQtiiQEV5P0vM/9msS4i3u81kyexAYPBa2KqQFOGNu7dWmK1oKtht
 n01LTN2PqbBP8Q3I3IYvBJO30gC0lZzVCvfR4FWKzrZgsBr2/smK3INf9dLNJfTIFaOHpAWW3hH
 KWpzPyfGdKh3uIw4rlg==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e4efb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cRXCb4fqzGmq9334JhgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jrfilcvS01krsglUsXFOjicKkZh2AUR-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX32T3u0gPL6MJ
 xV29Q4Q5VZM2pDI0PjunvAkK66ALos05Q7+EwCyQ8qYYR8u4caedxP6LipwwN0uWQLvkb7wroju
 bIqyiOZrsqMU8sCUB9h7EAZwFveyh7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160

Correct a few white-space issues, like double space after '=' character,
which will be flagged by dt-check-style.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/neofidelity,ntp8918.yaml          | 2 +-
 .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml b/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
index 6946177e391a..99b739595ebf 100644
--- a/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
+++ b/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
@@ -66,7 +66,7 @@ examples:
             #sound-dai-cells = <0>;
             reg = <0x2a>;
             clocks = <&clkc 150>, <&clkc 151>, <&clkc 152>;
-            clock-names =  "wck", "scl", "bck";
+            clock-names = "wck", "scl", "bck";
             reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
index d7fa16554698..213c1c40b6f0 100644
--- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -793,7 +793,7 @@ examples:
             bitclock-master = <&rsnd_endpoint0>;
             frame-master = <&rsnd_endpoint0>;
             playback = <&ssi3>, <&src1>, <&dvc1>;
-            capture  = <&ssi4>, <&src0>, <&dvc0>;
+            capture = <&ssi4>, <&src0>, <&dvc0>;
           };
         };
       };
-- 
2.53.0

