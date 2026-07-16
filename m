Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369B233DEDD
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784230232; cv=none; b=P513zw4oGrRbIl1IebOjgiVathRrnSWTUCvGzuFFXN19Cthk2fTpSLk9kZ6vssaT0XSXOArSaLC3HNuto/cGwHt0JEXQI7fBfnIF6ZbPtiWec6vTl8zgK4phnX6pPWd+7qn/HiK1cz/YU0Z0Rm2rXURvxIArkGL9y9cBf2NYXGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784230232; c=relaxed/simple;
	bh=7+kjdIETTbd6TB3sMsAXDW8uXAI46dn5o3CEoOjW10Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nd7+Wc/jy2y2tmlyJiZDTMHzus2kEYlSIJiKctai90P9q5sDnDSUO4x7z3OeARatKOFeNoerz6epK6iUTO21IcPrKmXGB96yfjTSlq5p7hkmeRJQ5yt2HngbM4nPHa+XxIUHbdP4lqkCyB7sus+/KPI3rrZNJZ5sboS5thhJvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFL8Axq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jx/MHOaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFL8Axq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jx/MHOaK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSfUT3481356
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OmgzavjA+t9HD8gEKh5IXy
	ozyL391LPswgJOayOxdyw=; b=DFL8Axq7sIYwKEJHTLQm4f+0RL5aV4C5hkKmgI
	yUou0o+923ogm4JA/UvdgQXOkjgG0dCLSDvZqAbe1iWqmrG7CVNx+1Sbvi0Da3QE
	KVyyr2sxT5rDiFTC0ODyp1UcTyDGZkiCWvid1leQXXO10TsupJ9P/H+OT5uhv6II
	BhcuaIrEFotqFVuSJ19OSinPoQpszDcL7avd7DVdP92eiNspVLPnANQ5Eiptazhk
	zdwsMjQ8t5tI07vxij9Bliy4/skE4PldZOLthAPRDnc8rR4oRTz11ID/lPsaqWY0
	8tiTfoysCoPqIhHOYPpJggFnX0DTzVTG9Lz6jlGiAALaaa6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf35gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caf4173b1cso67981055ad.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784230227; x=1784835027; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OmgzavjA+t9HD8gEKh5IXyozyL391LPswgJOayOxdyw=;
        b=jx/MHOaKw3NTThBL+WLFhAc+tZk3w9ajRD7vGIlovqy4DZurePDL/VsRQQ457rHen4
         J/KzxvMI89WNHuwFzEUjxHxn0OAIvg49bk2Vq6HZm5KjwSwYPgOmpuNJhrd91cPmm9k3
         ZBKJCnO1jcQFPIcY2uemo2U58v2um2aNRrvvgTd8LSv0Q17oHXfD+5XOBpQuIPYIGhXd
         L8mNh+ccD+wAP6rtjEIFDkyGtj7fOTWIblpanm8he42aM/oXjdj1Kd+Ueq66/a9c1Mbq
         578zo4vFzZfRrN7l0cleArbb7S/+ygYZb9aCRX5XtczSnaSnhGGnVLc9sNTS/3aL1Pyr
         nN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784230227; x=1784835027;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OmgzavjA+t9HD8gEKh5IXyozyL391LPswgJOayOxdyw=;
        b=XQS/fTi5HbLyB80BbKnwe5KW6/J265qM4qFfRsAhupxXWse92g/WzQV0SM5/U5I6Ut
         ZkxXaFcUV/RRW4W2dLIs3JLYxEAX4thNjfwZSycI1/gRhTP16wHiOmRlk1Tc+17w47vH
         FflDp8XXgHs0t8xjpBAmjE7rpGTgaShkDSo0rICkmL5u7HFvj4oRPlC54IjZbqXgXROg
         n4yY9ONMz/+IPR2Be+F8OKw/CtEbPnVLVa77zxb7bbhmNeyRrqqkUZwdAombW6gIjSFZ
         nReDj6JmOKkBYlxsp79rUrt5P5pno5aWY1v7reD2n93zfXagnx8tnLzsznboOkmd7NAi
         zAEw==
X-Forwarded-Encrypted: i=1; AHgh+RozharO/AU9YZm3+5hg5sFjQ2d8jkRtIRa4B3ykKsA+/RwOXC24GFsLMYJEQ4Vefgw2qntHMcuTJIY4@vger.kernel.org
X-Gm-Message-State: AOJu0YxwbVp2IQJNkZeaFEbXga5ek9EnT0l1oxBSI8KWXpMT34M7clOc
	KsXADPpXSCGVfU4/0eoqW87Ke8F+/XY/9EI91VU2p4/axeB+NkgQyw5U2zSdDvkeic6dE3BWLmv
	nax6sHzwmJhxICeW1jeElT7DiGQjq0OmZWXc6Z1ppElroYO6GmDGXDALA6jUFClth
X-Gm-Gg: AfdE7cnylgaqFdcZ6p0qCJ301F9ZYlQvB3sdU14pH/TbDsmLQgpD8lVjSabg1FozZL5
	ZuFXUi4cneiWMt1Wphq0WHE67bA3IE1j+vZZU0DcvqiNl8THaNdaLW3Bv0XP5bmYxy43hajKk0o
	7EtEC2Z/r/nLGGdXcDI1WJ7WZsm9ePH/9ePxaJw1/7n/ttUB9nDwYPpgeMM2QzuVI+9YdbbJTlu
	FWaI+pLfj2I/7TxzraJNEoe4F041L8MmpomzdJJ46FWJ0wQIyiclstOIty++oyB28lMvkY2ZCTh
	ZdPO8WHbF2VP2cg0zZDb+uuLWH6gIMyO0uC1MOqIKW0ImSn+kT1S4viK20j6vW1QzWWxw51hnHd
	lCijioalU8uy7EQ6EpRwGvNYg9Q==
X-Received: by 2002:a05:6a20:d0a1:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c3a5dd3c26mr556557637.66.1784230226645;
        Thu, 16 Jul 2026 12:30:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:d0a1:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c3a5dd3c26mr556523637.66.1784230226146;
        Thu, 16 Jul 2026 12:30:26 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c2b17sm21468394eec.25.2026.07.16.12.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:30:25 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v2 0/2] arm64: qcom: shikra-iqs-evk: Add LT9611UXD HDMI
 bridge support
Date: Fri, 17 Jul 2026 01:00:12 +0530
Message-Id: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYxWWoC/42S22oCMRCGX0X2uiOZnFdK6XsUL3KY1dTD6mbdV
 sR3b1bbItSCEAYG/vnyTcipytQlytVscqo6GlJO7bY0/GlShaXbLghSLH3FGddMo4W8TKvOwUf
 brYCcUdorLT2PVZnYddSkzwvtbX7t88G/U+hHxJhYpty33fFy3YBj7pvMzQ859nC9OcOAoEDK2
 smSMSKy1zbn6f7g1qHdbKaljMy7amUUIQbBhEWuRVP/HZ2fr4od7Q9l7/7qXXmXCcZQ6meTELh
 XTbEjG4J3hGgtNTxaT4KkwmiaWginRo8N5ewuDzabPF+kDMqbrTYIgwYGnohrFYWsa//H6uUfE
 hO/pJR3IcBidyh1UAUYAgrLdZRRuUeBmtlb4NodYZCFZa2zUrsmRhUflkMN677WiEXIjIeBUUo
 4lEaoJjzOEfc+gSg4VMh4E1ytDLuDm5/PX0buJxrKAgAA
X-Change-ID: 20260618-shikra-work-ea756b564b2d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: u1mg7ec6iYT_4ckHdbf9IoepyNpKdWwD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfX8tbgwoyaM2Qv
 DvMQxjrIKmXlEs1V04ZHrhWATObscoo1vksc4BZZPQvOcEp2SOuTSu0PWjLlq57TNDFqg5u0TvC
 pKPbm2TSh+mld2Xjl6+B8XeUcCrM3uS2ZQL9rWFlQF0JQ7yIqmRjezTGTyyEFvQ3HRFK/xitJKl
 R1rKOyHBucAEJKxMd+ELbLFgWQj2IBpsgjWg/VX9+9fugZdZ/othHrGKCdGDCmQwJcbSrzjXqba
 GBgTeuqZK68+3M6BIZr45PlKuhJoMhSFEFLC/ZdC/03mZANlG1cZWfXPors4hJWgvLsOdgrK717
 RVXrsNx7NkG8Rg4xuKoeHTLjrHxgu7GhXqkhSe6utzBFbLlTDT2FTTSB2P+/j9FLZvDyivdxo+a
 8fs7JNwlXuKYaCvnQ3aw7disSkMiG9yriI3bBEf1mVimLMc4xYAAJ0lyrr7mjg2OuE3LBAmEK0z
 brzbzmm1tT0MweCgINw==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a593153 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZvIpwVH2f1tXK-yvfAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: u1mg7ec6iYT_4ckHdbf9IoepyNpKdWwD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfX5wejTxxiwOIJ
 IqVgVHAav8cpZ4IKB6PkIw0mRdfQYGE7ewkLxLQl7zpIeV9+Xtb0s8lVt8ZitRlycinQuDQckZz
 kXh8uRISlXI188iB5agtapfEyRhTP2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160199

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

---
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

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 118 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 119 insertions(+)
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
Mohit Dsor <mdsor@oss.qualcomm.com>

