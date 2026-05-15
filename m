Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83268346E43
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851378; cv=none; b=eucZtxGT4SoX+glTFDIV0pLBixnFZc4GOEIXzwFyxz647JRutPw+OHROxBa34H1OO5da5buEtpl8nDIQPJ+kwfoZYw4a66Vykh40KwuEfwbdCFUF2a70mIz19e14iShcn00PWA/hEgT6pCMz4l+aBkYrLl7XMaFk2rMqQ+xUi18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851378; c=relaxed/simple;
	bh=sSUIFlyTdGphnPcJtIwcO4v8RFoX7ktRnFiV2qQvGzE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=py+0MoksSHlyYpsJAlrqZBY5bYXFY6wM18jhWK2SfH4k9f6y7M6q15ApnyMAiwtqZls+VOMVzbQdU5j46VO5Yni20A1h+mqTCbD/K3uALAxS7mNOd9WcqriyBOHxd/n6g7g47Q/epAgLLPS1ZyatBfYEH1YxkLVcSVVcOJoCG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npDcxgHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDDYr0/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npDcxgHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDDYr0/N"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAooaN655515
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UOMh76nkmcH6HFMr7LSlJY
	t6Qv+NpG1JyI1Bpp5yqCw=; b=npDcxgHzp8JSq9mjBzpw8QH/aVFGRSDKZLD6Zt
	LPuoopni3isi+vFp2FwfnYi4uIerpemUg2QdKRHvo1dxe7kKony4yTn8E7uvibMW
	4mJOKbOMsyZy1GGQL0TiCWezLWIWwKpa1KT8nwmSvh1JBxpk8hYIxMqPn3zTqz2F
	EdZFUVt70pJRoinvRbOGVywAZl0PkrndxJUGvvTJT2Gy1RaKAcqTqvGAP41p5xEN
	4AdBqqwMiqRr4d5xY2oyQoEui1laBjuBPKzlvvqYI/2hH97JmLUChObtM8lMj+al
	GkpNeTUUlRkYPLmQEYuQ96F9m3/4KjLI/RMZtBz1fw89aQjA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1puegj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:22:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314220f28eso12659617137.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851376; x=1779456176; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UOMh76nkmcH6HFMr7LSlJYt6Qv+NpG1JyI1Bpp5yqCw=;
        b=WDDYr0/NNgLx9goe1rzVlgkkwbsPxXk+3N2ytlbKN7YUt7d+ulSbEXK/yHStZjbfH6
         jENKNmVPCZwAlWwGAokeEFMqPpO/7ncq01dYbe2B8CVoBhlz/PFUrEKlWlYdq2d28gTq
         osP4JlcWfC0/j2nMrDXb5g1+Zm/+UO4ykK/H8l6O/QoYdujl4MMGJYUyCrS5OH87HjfZ
         u+2J+Gz49kYlcble/7Ffr0t+OgRSGRewQEU9pFyf3yNtgLJdlQskoUKgr9co2xt6zfzn
         +m//kOz+WhcTgfOeTO6OhjainabrxXE4TeONgnmmQuS5x2mRyh5Nl9PasiLzxGNDAPUG
         6tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851376; x=1779456176;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOMh76nkmcH6HFMr7LSlJYt6Qv+NpG1JyI1Bpp5yqCw=;
        b=YYJUtyioCgeaM6BNJf/SLbX7jye7l88id3WqB6FvU2dsxf5ConpOzZrGCvEuseWbqr
         Dl7LyJ6oznVlqlI6wiOt9vKvtjmOWwPJnK/zI3pAYtqVukDqTYwNMDzNBDTWZC5AbkvB
         vt127+tHvrG6NmhBV+zcO3X7Xa+miV5Yyar5Z1EoieQTs436p97zg7vdhHnkDhhOZ40s
         sH5Ve0LpUfhg7CKW4JLhvn5iCuJAtQa+YUNrvFc1MxRR8SWYQMDlA3/XIqD2njwuxn1B
         AFdtEUpP44Hk3RuA/j3hxLTIXnpNjZ1QZW1528An5XOQ66T1u5LpW8iXjocuCT0tY+4z
         wz9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Z/JSiKoRR/hhsn5AEbYsQ+A1kNI2qGVcj/muXMeTZDAAXTMUMzfcmRK4NdDUPVXNi3B62spYs8EsR@vger.kernel.org
X-Gm-Message-State: AOJu0YyViRTnRUbevxNb4wSZTq8kBUKOWj+ZVFS+7JAvXMr+Qk+oVRgd
	HPWiGOj8KmNx/I0hD2yu9Cf1sgx2lZf4C8zUp/BSbRB3ImqVBFUTTjX5Co8qk4gRNeGwWUMu6LD
	iJ7vBrpyhhen862fS4J5/p93BBRzr+YwZcJTF8nNvqM1gx+cQwiBS+yIjsRVXedgb
X-Gm-Gg: Acq92OGeX2Qha7u3XUdc19KbovCPTwNd067lF+Ll+5zDjM1bMSj59NUJs/Bd4ADBUKX
	ixmhoDzFcKRfr0Olg7GfIOzqtxt2scLeu1oYHPkq3u/T460SxJjckYbF8aHbD3enKTy4APfXnMZ
	Trrr/TlNPjXOrjNrCN9tZ27WBBuK6xr4Xc63TGvxowIM8h1F9p9qH1E3q9eOzkwHyz4lbJr+vXR
	nlM3DBjemJWx0XYRrjW18jhBWpbjqcgJKhuA8CFVPnJ6Vka4nTqqc7QCTBojEPv76c8bv9JLGMR
	xSrMsu9iP4dUfF7hRtf0hfGATp2E/C0HpbGczXuYVXtagOJriOGPPpoCPKAgwiOU5RmDclH2rt+
	CIPBLSaPKR8tq/mgzqYGrYiUnN62A
X-Received: by 2002:a05:6102:605a:b0:631:4c79:b1d2 with SMTP id ada2fe7eead31-63a3f99759amr2133915137.25.1778851375698;
        Fri, 15 May 2026 06:22:55 -0700 (PDT)
X-Received: by 2002:a05:6102:605a:b0:631:4c79:b1d2 with SMTP id ada2fe7eead31-63a3f99759amr2133851137.25.1778851375095;
        Fri, 15 May 2026 06:22:55 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feae166dasm17889505e9.9.2026.05.15.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:22:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: eliza: Fix debug UART and add
 more support
Date: Fri, 15 May 2026 16:22:37 +0300
Message-Id: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0eB2oC/51RyW7CMBD9FeRzB3lJaJRT/6Pi4GUMroIdPE4ER
 fx7nUClHjj1YumN5vktc2OEOSCxfnNjGedAIcUK5NuG2aOOB4TgKmaSyx1vhQIcwrcGVwh8uIB
 DMx1g0rmAjg5OKSPQNI6pDrw26JWTjXWW1f/GjJWyan3uH5gm84W2LALPjYznqZoojzVmNCHYd
 DqF0m8iXgo8jPCO/XVYDS9jpfjTn3Y0wkQGOvTSCMO9Faqf25cs+b7mOVed33iBxkFfYdc4VNb
 bTre8n9UrdivkkxRiwWxTjDVRNVDbCEQhHoCctQJo0DNCTA5h13LJtTISre1nyZY2joFKytf1E
 LNYw/+j81kAB952oqm9+8b6j0S0PU96WErc1oft7/f7D71N4IT3AQAA
X-Change-ID: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sSUIFlyTdGphnPcJtIwcO4v8RFoX7ktRnFiV2qQvGzE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBx4qqbFO2YsndOZbfDrEzQ0VCYMsz/NsB9l2r
 W9c0XPvArKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagceKgAKCRAbX0TJAJUV
 Vq3WEACPGeWJV4zTOtpfxIQBkQxL+z40b2RxhTHEfEYtCAdyR1XkouScZ8cewSahHMbqPfL3JPw
 1+IdW/KiRd3ecWIdpzoVLu+AlLcahNhEpwiOGTDo75x24ZqV02ShsBKwYAoQ/n/0DYJP+x19Kn/
 rmZZ/DEXUKiLKVUXcUMU9NYSd2WQ0uw6TPA0tKAC6mFF8qQ3Ly6NAjgILC9bv+f9dqDWYfQoGyq
 pNvsgWG7TLBmt6q9ok1RqjErd4bfvx0P2OHe7HGIDm4NX5iM6FqdqtohjGNFuVwjQWZc6A23bpY
 5A+ViWtewqwCmRDOYIIX1frWenm1lWRUV7+INIU6ZxhQ3h/RVJcRLhxTqeEgiESFsTx94cnxkdu
 ajxvSAe5lHJ33uMXME0AH6nMheNwukLi3wf/HMcDqxEmlK7/3TZoIPkwk5A3LFiZK3s0lWp22pG
 G45JFRm2xVqyOPEzYdMnHh3blb8OZHMk2ZhSjLW0Ma7OazjTlVmUVkTaRa+A0Ykx9ZQsUyxn1n9
 NXGsACJCQRfpEbJX34XZf8dp/ygw4KzEZNOFMPV7SgX4tOlRWIYSDxZVz76ROmAZLAZOPKjTaQA
 583FWr/0SSDoF/DcUeXbeMOySHzE4NSG2TJoFZ+vcjnGbRrI32Yi1vzUdsyTXiCgHN5HN1By+9q
 MOTBF1KFx1k7pFQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: v8PWICiAY-fpyQXoZjaR0fJyUtQzZIpq
X-Proofpoint-ORIG-GUID: v8PWICiAY-fpyQXoZjaR0fJyUtQzZIpq
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a071e30 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=D2ZgMfavIviQhfRa-4wA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNiBTYWx0ZWRfX9mat7srr2i9O
 s6atHxGRTj9F4W1YK1d9R9W3CPfu9+j0YLBeAAEV6TuHsHYATCmPr7Xzpmiajig/TqTl6BbGPP/
 LVFZdRveLjHPsh+VS5cJtNrU+Nob4p7wEa8SnOR67FvSRlPOyWuTiQhN4B5iaWidjY4Jfl/E73r
 rf3TXcIWvLGI5rRMw8x9KTecUheVkAHlJqSAXh4csHCcxGW8j2BdUdddXIKC1b3fyaeMVYg7txL
 Annd5Qeed+3Po6U9MxJiKTT78eJ2aFx8hRqsb7x8kVuZK5jxg89tfo/lurZI5rWBBSFcGAMnH7T
 /WG7xmhUqGvKtKQD29ho46VZgM91UuESsLJJqDq2uby2/WoRmtD7UV4ExgKcDTo9gzbcXQFvISs
 icVinz75tFPGQ+Fy4ckrj9CzhmR1bOPLDChP1/32pN2DtrdPPeuCdJ55AX5OEY08lKqjgO9phze
 MLgNVzh4jQT/hV9jDwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150136

Fix the Eliza MTP debug UART index and then add the missing
QUPv3 WRAP1/WRAP2 serial engines, the matching GPI DMA controllers,
SDHCI controllers, their pinconf state and the LLCC system cache
controller.

This series depends on the following Eliza binding updates:
https://lore.kernel.org/all/20260513-eliza-llcc-v2-1-27381ae833d5@oss.qualcomm.com/
https://lore.kernel.org/all/20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com/
https://lore.kernel.org/all/20260513-eliza-bindings-sdhci-v1-1-b2cae44163c1@oss.qualcomm.com/
https://lore.kernel.org/all/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
https://lore.kernel.org/all/20260515-eliza-tlmm-group-qup1-se4-lanes-v2-1-ebb630de0dcf@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/

It also depends on the following patchset in order to build successfully:
https://lore.kernel.org/all/20260515-eliza-tlmm-group-qup1-se4-lanes-v2-2-ebb630de0dcf@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Pick up Konrad's R-b tag for the debug UART fix.
- Keep the GPI DMA controllers enabled.
- Drop the SDHCI ICE register range; ICE will be described as a
  separate node.
- Fix SDHC1 bus-width to 8.
- Drop max-sd-hs-hz from both SDHCI nodes.
- Link to v1: https://patch.msgid.link/20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com

---
Abel Vesa (2):
      arm64: dts: qcom: eliza-mtp: Fix the debug UART index
      arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes

 arch/arm64/boot/dts/qcom/eliza-mtp.dts |    4 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 1533 +++++++++++++++++++++++++++++++-
 2 files changed, 1532 insertions(+), 5 deletions(-)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v5
prerequisite-patch-id: a457d339aa64967766ea88eb05aa65a4747e1022
prerequisite-patch-id: 04af1479b04d515ced835504144cf09381471b85
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50:v3
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-change-id: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc:v2
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 38ec6b086b5d9e602865adb1c0ab30d12304a5d4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

