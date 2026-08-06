Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99E36F41C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033926; cv=none; b=eOwfk5p9PCgEV+4uQhFb0URclGWOZppsc6sklKeVRHdC6QTbNWvcW213n40AD6/bqTJIl0MCTirFcteX2vpk5lmXt0sSdb3JkmBY1gHVkt3ExglVJ6paumHsNeoMOI899E8Gxf9MlAgDvny5U1ebqZfp2ehZfmCudH+N3vkJ/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033926; c=relaxed/simple;
	bh=r0vG4czXXWS1Alu1n2sb/bIPPDzvST31Zmg/XwEF4eg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cCGmwQLg/jKzNdj2dYGB2WrP/VbOc/8L+YKXIHGG2egAj5EJWoiJBSfdqAyYkBdm9MMjt4fY0NRrwYXWuEybwYAMElt8pOFZrj0zo+vB+n2m9uXCS3AjpKI53m9b8heLfOIlCtkqnAhM8WktOMnQjSz1SzDDPgeaQmo5KziIeSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6mPZaE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZlianBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6mPZaE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZlianBD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Emvxn2279907
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 16:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K9NCjEPSZKAe6x+aQQALZW
	yrdxVaHfePmTOsAlBQqHk=; b=d6mPZaE9AAjUZ+D/pzxTmv2nCjNKUyN35HqyhB
	hu7Ou0/XuYO2+Icr50RBczmJoTH5GmfYwxXqk89soZLUFd/EMuA6lOPE4fJ88Rhu
	QnWQ5avUtXjQQB1OjOMda1DtD0Wwlu3+R+6/83AjW05IdDSE9z4ujxiG2yw87173
	eamClNDSPe09p7oT+gnaUB0GGem/UIRZcAEwe4kk7Y3iGY2yJ3cRL6NoVoR57SZD
	2dlyongMnKdIWAfQGd1S48WXAS5Tg375E288NvbhhqnbJfpHnirNiErKjIoJnHVQ
	QvUkufe6zYUhL9QkuFzE8WjxK9HYy2ccB2vnKjv2Lhy9t0nw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8kdfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 16:32:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3070958a91.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786033917; x=1786638717; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K9NCjEPSZKAe6x+aQQALZWyrdxVaHfePmTOsAlBQqHk=;
        b=BZlianBDQzkACrhKBtwwt3l5gyfuz30dIxOX9fE3qHPAbh7JghHmO1ew26FFMeByld
         ysfZK9iRUzxZ+K7Yne3L85ldPHJftaKfpQb6U7EVxx7sukDaNTJ9HPddN8gugRrDd4Cq
         V3vvfD3JtdZFOz+ifACg5eMgw5A4opsqY6V2eXMAIvMNi/XiTUWdneh7uTIpCbn8hMV+
         39M7ljZmfFBKulsHcdaZ7Chc2XeAW0zP3pHe/9SzKq5nRhd638C0WRIpQ0MrXy0aUSFC
         YZp/fRUfIbNE8ts3uVzJXu3XGZzfViBXNAgGygKsm7mF2azWe9MKj2D3tnmRGQFuILiT
         gNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786033917; x=1786638717;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K9NCjEPSZKAe6x+aQQALZWyrdxVaHfePmTOsAlBQqHk=;
        b=Df9qZhCQvydRRv0XKYao1ywumI5G+Gu8NBSieLNo5b80W2gis5IvaWkYgNNAewrysB
         AvUdw46QiBId0IBMtLq/CWefLHv7xgC4oIzs/KHBK24hT0i5mT+CHnjg05iLgbnyRYZa
         lOnn0tNvU3ugAj5paofWAh3gricM4d1GywJzV6lDOqV76+AukfIDVrvKRjvTFJPj3bOc
         Xe2WXkPAX25L2l27kSoRpGwty/BhDuffCvOFBDHjaOhcemqGLqTw4raV9zn/Lct0Rgb5
         V0RvprS6EkqgvcUI4PEkiPxvEznDUYwOXdrmJF/bagygm789yxrndBN3EPmt3F0A1FYc
         Q5qg==
X-Forwarded-Encrypted: i=1; AHgh+RoBcgNxnwFx4eZyVpxSYrV8NxUUd1qLNAKI5N/OimG3BZ6GpPmQVQKfyGGKXp0fZQSLaDOcHFdNw1Ff@vger.kernel.org
X-Gm-Message-State: AOJu0YyDbnC2XiA2GDqdv8YeAUHcrbRq5XFDiujQCq1KWMHTHcgvlpzt
	JBy7q8Ij8Tgn66mPpgCG522PTU0CDP/jvrLTnANsH++6ujkSgvcv2LParHrrVG09GOtbMVu2iDb
	cSM1zmTF1TwO2Nx1W96NeaLjXWca9df8mfri5ezkK4WWSu4ednTsjaNQ8c9azba72
X-Gm-Gg: AR+sD136k9Rs6t8NIlAfTTHfp20TaaqG/rrEny2qfuLM9edhlgD7d9C3YzoHUUtnan0
	Icn4X6lsxUKlgdCd2M4nqmOb5o1g+DdQuLZKjAuhWeEsoovwfByIFxxoJM5VsCY4yOek2D7zJpu
	iUhxA2gGprE/J0z2TFxO1C0kOTyiCoDWpAaQeUSvWqiO9KhXHD40oBlUGprpPfNZLtlmgPBKs45
	7z8QCFFBGeNkZ5Iy6QnWXlXO56iEHOjr2mXdthfu0xBzR+2XiqUELGpoZPWhQV7rIkKmfyu8eGI
	V/F2VW0d/PrsZRFLvUEsOgucts/2dtW9fWYgAkvX7d6/yecoQNDjhx1eODefmDZbE4rP7XlYNK4
	Kbyda5OaiRdW4QyHu2mlspRbnm43v3XMY
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr18657955a91.5.1786033917488;
        Thu, 06 Aug 2026 09:31:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr18657273a91.5.1786033912201;
        Thu, 06 Aug 2026 09:31:52 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2fdsm1853168a91.12.2026.08.06.09.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:31:51 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add eDP display overlays for hamoa
 and purwa IoT EVKs
Date: Thu, 06 Aug 2026 22:01:19 +0530
Message-Id: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANe2dGoC/yXMWwqDMBBG4a3IPDeQiJe2Wykian7tlJLIREUR9
 95UH7+Hc3YKEEagZ7KTYOHA3kWYW0Ldu3EDFNtoSnVa6LvOFOxY+wXybba696Ic1kkVjyw3ui0
 tckMxHQU9r+f2VV0Oc/tBN/1fdBw/K0oAQngAAAA=
X-Change-ID: 20260804-edp_overlay_for-next-694510b7de51
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786033907; l=1279;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=r0vG4czXXWS1Alu1n2sb/bIPPDzvST31Zmg/XwEF4eg=;
 b=GWcME2XePFGG/YoqboDxDjo82KE+cPdaSbunkz+1iZA+3zFwqb9GmQlQ04vjeaawlsU6GoWPq
 W2VwuZrh2ChBdUH82UWsYi5eLoA5m02caPzqeSCn2S+r1CI5QSkfCnC
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: FOA247SBtXwv7nFUcD3N4RxzDgncRMBh
X-Proofpoint-ORIG-GUID: FOA247SBtXwv7nFUcD3N4RxzDgncRMBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfX1Ao/k9WrEQyB
 RVf9YIapdyY5TPK+3TlXWm7fCU9QhUVlZKsHcGv4IU5ToDDwSW47bwNY+H0aaaGSyKYZ2U69qag
 E/R0VdlAGbjGw7ZjHVgG2hwR5bYqodhlnEQA8c/Te88vB9cmlI3y5L6L1jWH+UXqG2rFmaXI2fm
 FqVxyGl97PYOEBczVLlPL7S/7nsb8Mz6xeLhL0/ZJatU/wS0fLUU+7nNS/h64pvzfeP/11X9v/b
 J7Qe4DgLufuDrT+csxxfrexR3jdu1JcJSngxz+DWexgFaNOK7Wp61z4DCYf8cR88qaXdUUqVorw
 zoqoZbF49M4/Yz11exByIUJDy89X3e8Af+Ie7aS4Tp+SKRBrkRqDES8NNUTCJqKrxCm+vwgO4iS
 OmqqOh8pc3P1j1Ut8VSpi+Imq2BgD7b0Bi+44s4OI349cueyzjW3UbsYOaVWP4xmfgu5cfFVP93
 wEB+2gFYmVjvH34QLNg==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a74b703 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2-AlfWxrE5KuxYGhlBsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfXy8K6LIUUkMM9
 rwlHH90grpootLkp4gRMPJluddoylkIzhec3RQQWV/y9BHfLi1xWtE8rucUTfMsPchTRNLOlku9
 MZ2TkG+yZXbi+lSyvogbvQXH0sTNz4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060129

Both Hamoa and Purwa IoT EVKs are available in headed and headless
variants. The headed variants use an eDP display panel connected via
the DP3 controller, while the headless variants do not include a
display.

Move the eDP-specific nodes out of the base DTS files into separate
DTBO overlays for each board. This allows the base DTBs to be used
as-is for headless variants, while the composite DTBs enable eDP
support on headed variants.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Anand Tiwari (2):
      arm64: dts: qcom: hamoa-iot-evk: Add eDP display overlay
      arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay

 arch/arm64/boot/dts/qcom/Makefile               |   6 ++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 5 files changed, 258 insertions(+), 214 deletions(-)
---
base-commit: 56d828d0b65fb3451a23b5aee961531add7cf0fc
change-id: 20260804-edp_overlay_for-next-694510b7de51

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

