Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746155;
	b=FycxrUwsp1C5GWqlFf0AYqr4NW193uZaReHKeUWhRspGk49M+J8M45iGZN96TjHAm911
	 jfWd2gDt5mMZopJMcNC/TjeguKdgO6w+cgCTv8QF+DyYKoJPOHeFI09xf8OP1II2WQD6U
	 khJWcUehv4I7nBB9Fu/HgIKuJHDK13ls/Xk259CAiLbyhrj0QW2BuhFHTiIwz3tNULUR5
	 Pjrotg0sXgd0ZBhnh8ICaBw2XelC1Np4+Svd4mx5iimha4J8w4k2K8vU17iV3KY8T9oj8
	 giCB17l5NSjFg7NfGSFMjLml8zOtWHvv2u6XsIbTJfmjUCgQs6tEMD9wUs6nwYBPP3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
	b=pKRx7lgrGDhBo1IlfOGiJGtuyQJoQdPCW31RfZ/aOt07ZktteAtWwn/GqxpL0Xo03zwZ
	 MDrt8JkUn7TQI9GOmVO+ukTCWA9e4DevZXBM6AGyGk7CDzQX89PkJm2UmeHG4BQcpg/FU
	 65A/1WgoDI8PiH1UlBdk1kELqQq8UJljQ+fiYBvlvRKbwuV8l94W9Wcq3ZUQRnNfvHhRz
	 LDeuCkIIRVbQ9pF5FOvNzCxTowkBZSjg7Qa6Icg/R+t/0kVYOF8KUyZmnmu+c9l1OPwWE
	 47CHjtXpgzvkD6FTdksjFsqKh2VUbFsh2vCGuuzKtZAhRI2Bje2X0GG/0RzSxFfAhGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzHQAA5c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3TLefwg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12537606A32F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12537606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzHQAA5c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3TLefwg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FP6j3168409
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8W2Ztl1Ru6WUtOrWa2GjLb
	kwbA+l5960sGvM7MImZEc=; b=MzHQAA5ceP4GBO1qmggP3nFzB+ZdpamOrGHLT5
	IdbTd5t46Bydl+X8p+ConErVYsa0eP/J74BJ2mJCB+EwqfGoWsaWbn21T27D6hzY
	fuOWMO/IPdzPVdp3rvcRpkC74/GHrvl0h19jiEgOdujiyxPfeEFUfOkE0ZI0HHRP
	we2x861tUwlDh2Zcm3YV1hpoj12xxQMl4dj/O1O6hNAAcDM6n2tDLvWDCTy5QgJQ
	4us5ufaX3trxKes7d00yokwxS8il6NfL6ARqKwnhcqAWFGgcDTTtOZhb9QiZJzOX
	iiVzVsr6XpUWgl8TZBf3lfuFF+o11kYwBd4kv8AzP9tY5pcw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpau9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91becce058aso19629966d6.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746153; x=1793350953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
        b=P3TLefwgjSXyoWGfRoEAzqsuTwFiYeEzzk6aAWLRRhiya4HbJkiSuXXuAoD0yo32v0
         3AZuSb0ckj9Dhd0L6uEg9zzW2q+mKns8KVIrio6hOsxNuDkw9KIna3s2GGAhBGIdzf4W
         HKILBZl7VfokWLqYGKcE+E6F1GGE6PoILMfc3UxN2GWtPbaJ2KZy/fVFjEIMTge6fGMJ
         geO50sJmFieEhcOYCdbDcNpuuNhCswHEdZGXl9YLTWzwOtlXQUlo4ZoFW50yp4Yz9w9L
         WHzkzOvnoCE7lGR9sGouYOyTkDGb8gUCYo9vMUdBWEn38yHYqQ2wk2V/lD6ULpRsjduh
         Lqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746153; x=1793350953;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
        b=dYZP5/q69kwILVZEGKXN0hVQpmBB+W2lkn00F8AKxn4pI+8oRbK2pmx1ea9at+NLPD
         4vIJKgAEsjws4jOc9G4B0emqJYg/L+10J/SY8gCgWCIloAS+eB8+np4j6J7NQolKFCkx
         up2cBqNKCkt6RoU5zZXIgHEjO/sqxuAbqDksX1jBe8LXbFnOrNqrz1JWE5NukOOCUf5y
         qJDDBwGXppyt99GSEJJRi8V8mFnOL6/EZC1u99mq6Lt7DDu9UhiPNrsH0ApaA3smMWXe
         EybmTYQrw3akRIRoTWCZ+/s5lr7heqS1CyRjy1lxF0DVuIb9PNfNOMOwOTxtK7Vzd0NG
         gJoA==
X-Forwarded-Encrypted: i=1; AKwUvBzBJTxbtd116wThK/E7idp6bLKlMVaYu8RFBpl66oioGhSrqHDV4jHjQZLTHqJtMC1dcsZ9nRmBoXBc@vger.kernel.org
X-Gm-Message-State: AFq9FYKM/yINmcS8toKkuK+zIyR51x/JS+EXgUT2bkLIFekFOv0V5fpN
	Zo0QHRwSvKeTRT5U6zw4HsiYv1w0tyWkQ9u6+QWVyRIPBs+qsif5n7HLrszGN/x4EOBnd+tQAng
	szAuWoZ4huAIjzorAjNmrdaknL1oITK0FAfIXUqtcJ208MlcxH6Y21MiVa/8jB8MM
X-Gm-Gg: AYBFou0w66C8nHWuxAydNl68PejrfWgyJGzpZFw8rnMEt5RYlIkNsmxiuQLnRkKp4P9
	m1+xgNWJHGDWYZMFGNbYpHCSqKQG7Qe3eZiuFeBgGp4QUp/ebN/CkZlpjJMXkwop+zVETWRUVB6
	04QPNxERqY8ilGI4AKyKiIi4A/JI3cTyom+1GAaTWSfDNZaqFSEektgXZnShAxj9CI+5KRUYiTz
	umnkN9crTiowngTbqFKtN2JiSayp3nhQoKWAnF9SSHN3L7njpmXuqdpCDUbWCJ9JFtH7nfHHfeT
	CDn551ejkLU4Jm/xGhRBU1Emw9V93p07PbPyWD/fThhoqXgrqDkdw5jBhY4em9sLMS6F9glnYuf
	HOOrUmcDv8VHnlAJcZYQferw9uTBk
X-Received: by 2002:a05:620a:450b:b0:93f:115:7338 with SMTP id af79cd13be357-93f6f8796d2mr286960585a.54.1792746153125;
        Fri, 23 Oct 2026 02:02:33 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:93f:115:7338 with SMTP id af79cd13be357-93f6f8796d2mr286957385a.54.1792746152617;
        Fri, 23 Oct 2026 02:02:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215437d4asm23076245e9.3.2026.10.23.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Fri, 23 Oct 2026 11:02:21 +0200
Message-Id: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ4i22oC/3WP0YqDQAxFf0XmeSOT6KhIKfsfSx+mmurA6qgZS
 0vx3zutLPuy+xK4Cffk3ocSXhyLqpOHWvjqxPkxCvxIVNPbsWNwbdSKNBWoiUBsRcZMwINtoA0
 C7bkxhDkhlYWKtmnhi7u9kV+nXS88r5Ec9qU6W2Fo/DC4UCcj3wL80F/+gUXs+2+dHPYDGk1Zi
 ZiWhFVWAoL0PHYxoE+71X96kXRe7feLmcZx/I+T/8YPPUz9Ha5YgIYiQ32xsQdX5g/aadueBKn
 lCSkBAAA=
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RCKtRuKFrR7tGXSvR+VOJ0TS+wAcLe2hylKIV4cNKmM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2yKjD+FzEB0z7TSHAVjvTmQXHm2qerhgN6dXd
 AbTbbAZ5U6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsiowAKCRAFnS7L/zaE
 w8d2D/wNDEtZzRy7jn6lzojLtaiBXzd5mY3y1IqsxfoY+aadKSLVvBgphSOaPhb80fkLhOXTz2T
 lHehHjK2hkHa0QW9uz+H43bvogsUBwmCnV+NCwNYOKHUxkcsdGrhoDgeuO1mGdCAIiIFLB0BShF
 y//KtdPrHndS3Qk2sO0ZoFIe2r5JM+iwUIoTaOD0JdMV1H59v72lB1p53xGVP3+kUz+gfhmBdpA
 3p4ZN98H79GldtdbTFP211uA8NhWS4MnjXftDuyJVf013TeoQ65WIWMgXo8tO852cw3iO1PgfA4
 yFWVTWAEvOHFFEy88DQKWyFDkkwf2j7elXx//bHcFZ/zhXqozNY7ZXVJL/d/2FLZ3nLIxhjjcuy
 jWnAIV11UWdtBtyZtVLAO8j10eD+blQOQku0+NZBwIYW/UoiJunenREBCOwd68yoD39GU2CgMIu
 cbUq13y13O+aL1Znt8bdUfq7tqPX5UtiS/ykHmyXbv53ViRvm8iAlzLBI5Pvzg2ZQfBEumNGq62
 BWQiP5ClSsS2+atiNE4PO4zG1HqIHCoIf1/n/iUQHT5L7Xz38DkhCL+Msm4b8ts414cFFUb6BMz
 CUtPzW0MPBkKrsqyVhioh9JACmliAjXpVqFyiiinBogccPOHyXvOr5lDfTj0FzX5etvoHJsOiqW
 vUKZM8efPUgOsmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX2GLgoSDxW6G5
 /7KQl6N4UW760iAyGtuDQ089h44Ahhkz3AQiR3LZxv/rW1mLfxw+9Wt0/pG8PqmaB0KsOLq92mM
 /01qZMOnL5WjR7z5z93ROExzmkkCUk0=
X-Proofpoint-GUID: GbDg9EyjS6BufjHUkC0kJInXncHlpo2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX3U23ge9n4GOT
 GpoMZ7l26sTb6xd+6NRi8oNDv0DAstYUO7/1X/Vku9mZF655VXfitAHOzeil20l+XTH/SBI24oQ
 3bBFvq3LzDvIPaXH9FObKIaVLT+eu+iKGY+vW/mkODyiZOlFlHZnLV8Mow+iPpZBpDZo8xJdW2w
 sPPAIolEQho82wWZqW0YXm50D5uQcB1COthS35dIqEai+j3W/3a9m2VUBtu94ON1MR7DfrQEb7w
 2ySKhsuHoqlVgy+EWeZnIx42fctNIz7zFjRhVhoh6iMgEe8EgJOPo0rRMz5svHrI+3sE4qKOm1I
 jcvtOFIWvs+mF3UO8dk/x3vMP7AVDYskLEwa8B5RrWO0xk4RBXMTbzBJVJlEO5qqqYJypWnoF2u
 oz0wcI5orYmuuSHlkT8exlp9NMu2anYGXG6o/WH/evm7GVIc2Ea6OlOlZ7nNRLq3OHMflxVnJMW
 8jVyl3qVzuaN+62Goig==
X-Proofpoint-ORIG-GUID: GbDg9EyjS6BufjHUkC0kJInXncHlpo2c
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb22aa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fcLLu9nwmMbFcDYE2AgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches. The second patch should be
squashed with Shaun's series. The third adds the ethernet nodes.

This series is rebased on top of linux-next with the necessary EMAC
changes already queued for upstream. It depends on the series adding
base support for sa8255p[1] and the SGMII PHY series that's pending on
the list but has been positively reviewed[2].

[1] https://lore.kernel.org/all/20261015023711.721837-1-shengchao.guo@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans: make the emac compatible specific to the embedded variant
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi    |   2 +
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   6 +-
 4 files changed, 245 insertions(+), 4 deletions(-)
---
base-commit: db4ba5d3b1ed0db55a16ce32764f8c9855013db8
change-id: 20261022-sa8255p-emac-dts-dbc521421276
prerequisite-message-id: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: dc952656b431f0bf8e2411ee14f50e7884cabfa1
prerequisite-patch-id: 27868f2a4c4ab6fcc455b250f3cda1cf1c7801c9
prerequisite-patch-id: 341b5a589bd5eb68854ad203e1facd93e1b74192
prerequisite-patch-id: 18b6ae4d5a6da83554473326a956fd03c7571b7b
prerequisite-patch-id: 5293d5db8a1231f0c1d4ebc0e9aad6862e8c06d0
prerequisite-patch-id: 7391f02c4b57ae6afb088fae3150ea215bfa594c
prerequisite-patch-id: 5666ecb900181a3877c902983bb1c3ec3c3058a2
prerequisite-message-id: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
prerequisite-patch-id: 16cabeddf5ca2469ab9eddf6acfe1b86c625d11f
prerequisite-patch-id: 0a76ec6a2e4431d679f4918b3d469c9644dd660f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

