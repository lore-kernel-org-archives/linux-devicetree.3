Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB72F30
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240038; cv=none; b=MViQ4oOAhxdynOdpU3GOFERaJ93sHkdnAqhgHuRxanheKm39R6FSx1VApIQPkNbri9WonR/sauVG5QpekF90k299d0GAanmhqCD08fD5GUtEaeZMDCD+kXqUNkzI0FuB0eMHwaY5q4c5adhT2V6HDy6Bc5/Bxy4Ruz0AUcVadhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240038; c=relaxed/simple;
	bh=lWw4aCEzKRSXQ4wL1WB4sTQS1+TuOPXYEegja8UDOKQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KC/5Po/W82N4dyRyEAul+EeGP6kvjWHvO5Z9/nj+hMDsGm1cDhj5ql828hSBga+rdGBO0RW2y3Mu7jr8VFIJrGufblhC5iM0n0fQu/hx9UV8eroNBrFlllRtAvtsO6hP6IJRkZpQA29/d3I3IDYJ1Nu8ty/OcGIkUBjY4OznL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY3/txdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUd+2MGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FY3/txdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUd+2MGE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH9do2121220
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J5WA8sV9rVw4QJgbQp6cPC
	PXpbFD3gzEw6RjSQBuxqQ=; b=FY3/txdv5O6UfwuSTlPimUYs/GaDm9LvVT01Xc
	pFrJvw04+jU3B8Xny5UZhT7Ed07AWBlcRQviLj7y/1LXyblqUqDhvPUgX1Vg/Kou
	SOlKi9/7c+zWmtKX6ELH500vM7JFEt49kZWL3JUYIDT1ELhId/lB1V+7KIWbEDQB
	v5T/JeaOfrvJaufPd9uND6wGWP69bL5SLqyv9klTNKQQLD/nbvr252yNZvD+S5Ha
	t0sAdGYFGjDu41iu3hhdfGTsZXoJgQzTt6bQBUK+u5ToPUjhE3DJisXg8tj98+Uy
	Jlno794z6GKAgFrTf+5Xvwq7v/5lddKA8E2Cxu2IkJ5V2W5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttse8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so36687565ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240035; x=1785844835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5WA8sV9rVw4QJgbQp6cPCPXpbFD3gzEw6RjSQBuxqQ=;
        b=CUd+2MGESmxGnoer3ZSoyUFXiC9kzND7pdhXiVyN6p71aw4EuOcIZdJcRDu3a7uM/W
         ytCqoyRREqZ9DY21bfjZRSBhOND7WIe8qfWj4eJDnfeAKdu2psb7j3c6gE+j2Z/VrmMZ
         i8m/DYeTwCVukzG8k7gwRAWyrh3mKV/p0gduZQtcgUoL7I68t3c7ON0/VP13ptwuED0I
         H0W2yr0dWjCDeh29NCSVsCum3iBXeqjR2aD7xp+L2B3Evcb7RemtmLac8RZ1IklcS5kP
         19z2GoJGJ0XXd29w+yoDfF8u0Y7D3SHrV9m/3ZZKpTLB844EbCZLQFqKWSIUPhA8ULXH
         U2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240035; x=1785844835;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J5WA8sV9rVw4QJgbQp6cPCPXpbFD3gzEw6RjSQBuxqQ=;
        b=GLpw4EZVvhkGyJp6W/QMMmGvk/eeaGPWtHKEy0suPKZOkEYP1ZsME7BsDMKYjkqxtl
         raG/Cl9b/CTfZxv8sNFSW84lKKuGJUWAbnC/Fw0TJOr8of8JNUJN7CAsC6RsNORAO0lV
         bDsQ2IxpGUM1zpT/6Iw+OtQ8+fuBrvJMCFlC/cdkrvtHUW4N+AH4n+pyZMmV7a0+klBu
         ij4HUXGa0cu1P+OqZ88+9JqBuUg+VqlG/WJSEdg4LPiKtFwf2JLfN/ExhOl0bu+VKAn1
         yq27nmcfRcWPPr9ZiAslKbBajq9P8egi2qf41T6xPfQEFKHGJeJQwNbiBsV1feea6HCv
         KSTw==
X-Forwarded-Encrypted: i=1; AHgh+RqGOV0Gzqid7MSt6hB07oDgnBTskg4id7VLAURO8sIQeD65Jyff9tjaHF7uHwIx68i60jPW4Wl+IF5T@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpw1jsH1ZQA+nrOrNz9TvPh8OohaBUEDYFFhUtWZ5lLjgDjx03
	2+M14NQ4GecQ+5TtK6AdwaiNNhHHPkGwtkzwSUlZq4ZsBWvUzFZftgeVmRZEJG5uW4LTOIBZO53
	9KqUZO6L3qq1OHpiEVWhpO+Q4MdoQiotadsCAt3KaZBY23MUQXqHBfV+X+o4WUzA7
X-Gm-Gg: AR+sD12xQ1+4ecLribe6AdZy6QKC9xM8SWMGirKzoNV6EDFqnhrtWEK8lYS5RFiD0Yh
	IISrU+/HXkBT8rrfpJAPnuG6gAkZAZkxCXWrrgsdMo3p5599U5U4WjuoKC11sD0oGkOqysjvL2W
	2TYqlOf5LAGSgwMCDxVMjuPbDI861jZoVIlyaCQYvYh1FnBh1Qtei79AObuiPYVKsy33yxZ6yKR
	/C9rNn/h8JV0uEUTBsUmU5Cv7K3Y8nEyZcXB3kxKeRBIra36Ak0Oj/P0/f6nYrODXq4zx1CG6Cw
	8uF/sN0TCYRarKfABigVooHzNasNJ+MKdH5DRHPG1mk7fzGN74kZYU+caTG7OxWKnVTRqWUgVy/
	EWjYpNlvBVCDajE/6JZVqxvwmVw==
X-Received: by 2002:a17:903:4b48:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2d015d54a78mr24948035ad.38.1785240034324;
        Tue, 28 Jul 2026 05:00:34 -0700 (PDT)
X-Received: by 2002:a17:903:4b48:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2d015d54a78mr24947515ad.38.1785240033823;
        Tue, 28 Jul 2026 05:00:33 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbe01sm51764895ad.48.2026.07.28.05.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:00:33 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: qcom: shikra-iqs-evk: Add LT9611UXD HDMI
 bridge support
Date: Tue, 28 Jul 2026 17:30:15 +0530
Message-Id: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWZaGoC/42S62obMRCFX8Xs707QSBpJa0rpe5T80GU2VmNnn
 dV62xD87pHs3EpcMIiBgTPfnDnouSs8ZS7devXcTbzkkseH2qhvqy5u/MMdQ06176SQRhh0UDb
 5fvLwZ5zugb0lE8joIFNXJ/YTD/nvifbr9tyXQ/jNcW6IptjkMo/T02ndgk33Spb2jZxmOG8us
 CAQaN17XTVWJfFzLOXm8eC3cdztbmppzIvW6ihCikooh9Koof862hwu8sODRfsvQoIAZzw7Iim
 p5wuI4/nKiR8PNbr5fHoXfGFoojyvVzHKQEM9kF2MwTOiczzI5AIr1oTJDr1SntopOy7FnzJfr
 76/mtKfgtkhLKa6CszSUFK678MXVz/+QxLqnZTLPka42x9qXagCY0TlpEk6kb8WaIT7DNz6J1h
 0i8x5p40fUqJ0tTk0sJ17g1gN2fYEWCLlUVtFQ7yeoy79I1VxSCjkEH1PVlzA3R6PLzgGmEoNA
 wAA
X-Change-ID: 20260618-shikra-work-ea756b564b2d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX3y5sR0JbjDh2
 CwsbjkE7/8Sj+PrfUxv9bNK8XHgy7PhRCK3Q50bDOMH9qe/NKlyR1qecwUIBGurwMXpTg223wYj
 +1RUGNIDfOlcPLr8ZTvc6yQr6CVJuE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX2Gc5CEtuKdUu
 gRV+eS/ynfP35PEmyWtsMrJ2yop6/aWn00RSCCClV1eGvv8nMUf9H1nw8nkhxjIVTDuRxW/JTMh
 qKMqsUkqpcp05OpZF8209wz+52gVR5vmHUkaKDmnqXKwmM8C3L+gfteKhIWSbus0ArHtJXR1YUM
 +f0vLRY0xkhBHuBlyAqxkOuA9gesP2M+LDymxVzC/zdV7bNxALFToPyF8kTc4WT41QOkRQrzIW0
 brBRSs0H9q53NyQDXOuvugGsDHHZHTNJy77HF7ehgLZwivSYrgYhbyDIU0fTn16IkYBxPP4PkR7
 ncCB+qI1p/7WzNvX5xYpHUxGwdvl/jCuJaeWZ/Say+JomGf5X6wQ1dAr4x7L1+/KQnJPJmTv7aC
 7v6bvaBd6JqYnDUX6Uk9DB0KDJQNu4kwsROjWY2eQ4FbzbtSNGfZCAdekL8mKjYuqxQOqzJHn5Y
 k6W1BQ+fSgyhBdrWgzA==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a6899e4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZvIpwVH2f1tXK-yvfAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9vuN9gB9WPDrFzmS40p3mOTfPMFXgMUK
X-Proofpoint-ORIG-GUID: 9vuN9gB9WPDrFzmS40p3mOTfPMFXgMUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280105

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

---
Changes in v3:
- Remove superfluous comment from pm8150_l11 regulator node.
- Link to v2: https://lore.kernel.org/all/20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com/

Changes in v2:
- Removed port-select property.
- reset and irq is aligned as per driver.
- Rebase on top of shikra-display-v4 series to pass schema check.
- Link to v1 [1/2]: https://lore.kernel.org/lkml/20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com/
- Link to v1 [2/2]: https://lore.kernel.org/lkml/20260618-shikra-work-v1-1-dc30381263f9@oss.qualcomm.com/

prerequisite-message-id: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
prerequisite-message-id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
prerequisite-message-id: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>

Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260618-shikra-work-ea756b564b2d

---
Mohit Dsor (2):
      arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support
      arm64: defconfig: Enable LT9611C bridge driver

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 117 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 118 insertions(+)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260618-shikra-work-ea756b564b2d
prerequisite-message-id: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: e13435365cba0b6ecfcea6d9e5ab72838fba23a7
prerequisite-patch-id: 90f78668eb969c16ed8c2485d75a60a183fc4b8e
prerequisite-message-id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
prerequisite-patch-id: 23b24fb512c882a045ed8339b22269bfc2c5d02c
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 17b412a37859fba801efdbe451db31e5bd77438b
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 1b990e46422307e558300815c1166b90d96fbb9d
prerequisite-patch-id: d78e0b95758b82977d80c7cf18da49661cd181e5
prerequisite-patch-id: f62b00cd64ac3191e0906514443dd43e88746818
prerequisite-patch-id: 0fab99455f954a917fb65348656505cd7ab45bc2
prerequisite-patch-id: b59fd05f9b62bda86079c9d86538b80289110862
prerequisite-patch-id: 71691d8b40e36cdbff6a52c3999ea8bb2c164d70
prerequisite-patch-id: b2868bc50d74afd13c8a0d0fd62301fa9546a211
prerequisite-patch-id: f83f24719ac475317507af09bf08b4a69b02d429
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: 59cf68a3a49958a60833aa0464980f8c8d879961
prerequisite-patch-id: 5d146a518f2f76bf9fe93e23a2cfa63c73731883
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-patch-id: cb558078597001d82e7291547b0eac4bd13c9d07
prerequisite-patch-id: e04ee45d80392481fcb025858f5af6352ecf1000
prerequisite-message-id: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
prerequisite-patch-id: e9ce15b4a5842cfde130a813afecf136798179f4
prerequisite-patch-id: 2fb20282e4f0afa161797319ea7031e9f6318408
prerequisite-message-id: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
prerequisite-patch-id: 6fa1d972a8be6b346ade96ab50d5c38b873cc028
prerequisite-patch-id: f0038f836d71e64fd5fd527906bb218115c1fbac
prerequisite-patch-id: dbccb759a76fdf39e8f7fa3f9c00d0f857f23470
prerequisite-patch-id: e15cf7dc3b1734a4eb3f468e6ba8d697f4ca92a8

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

