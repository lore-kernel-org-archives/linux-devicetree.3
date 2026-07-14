Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180032D2394
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784003369; cv=none; b=IXs52QvVv1q6xIZxkXGgrfXiBPFxFf1Y0nhyZAcpT2t5s66g3c/M86JX30XHH/zk9Oy6H8mBd4rNe6jI5M8nDiBv3lQiWq45Gn6A5fx0G+daQGcXg414xeGgKHzk5rnm8NsVyznDGn+At+UnLWi8oxbxRl7oARWFrT9wjvO9ecw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784003369; c=relaxed/simple;
	bh=FrIKj3vvNeDjpix8chaiPLXOV0/kj+9D/ib8oQufLJ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jReglWxYsCetyuQa9RJQb9686BZjRRmovwNYSJpW+thqd18XqKX3R9/G2+vdKTYWNOzxAlyvAJsvMe1XdrvyPSCmm2QFbp9YZ5OMli+kdhfqPUxJ6rZ2AmGvCPTiF0a21DaEiOkHBdl+gyiiS1HtHf7VWP3jHlTITgb80bNo/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0kelu6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQQGZc9g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0kelu6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQQGZc9g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3fPod3366596
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=isqwXB0KW6zzsJByAXMJuR
	HwUr1zIuFFgmnPxl8189s=; b=f0kelu6yaU8lkm4icVG4/z79NoghOoKnODRRQk
	i1xW3BDEs7U2n17s/l+uFq0W9gqpFe5rR8INUc1AhjEkkPGj7ZY206ZXOXKWx4jj
	Y0GVa2zsejawGfLoW1L3ttrA/4Wt/H3dHFuCPsvHZq+sroOgHoFpgkt9QQ+LBBwI
	ItuRdiKM61lfPrrhXI4SYk9cwhjny44hlQ40TMJShP+kfTJVqRj4kJD5yAsg9C+S
	dTJ7RYWz57jpUlDaKCxyIgwppkdBQTy/D/bvh4zWjwR//T0F7Dv38LN8aIkfrVXP
	FL65BHHVdBMEfkXAVvW/yR3odwQcCfCkY3mztUvZT/ZwWFSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde084uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:29:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810960140eso4339188a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784003366; x=1784608166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=isqwXB0KW6zzsJByAXMJuRHwUr1zIuFFgmnPxl8189s=;
        b=QQQGZc9gc/tYCnpZIFvYd7SsLKMvcD7rVHRhuP4FahfaZJubNDoa2fgUQnFL//Eq3Q
         wher04FFfQ3XZXNwKX0A+eDL6E+kUcTGevZ942PZnL/GUV7qjy+FAUpFwVgiFYsVhsJP
         fM0GU+QPLDmlTJn8R+ABluPcrjXmFdyJQguElKOpr2YfTssag31NNt6cglP4h69vngTn
         ZGfLE7XrczizBQEYFioY3J9veA/aoq90w+/6rjYsLo3nYeTWZ8bNDPocjDDhIZlKir1F
         vE1a+UWbdPpYMHLjDSISQ5qUjCrbf1nNju53nx+OI63vEDsL6LZoBTbjaFwPTTBVdKBd
         KcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784003366; x=1784608166;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=isqwXB0KW6zzsJByAXMJuRHwUr1zIuFFgmnPxl8189s=;
        b=UvR+aWdV6FTpw6w5yJvNYtqTzrJcUvMAMDuuLBWITR2HDt+7FjSEyXaGg844WcnoM6
         NkuDvSusmnWeCQBO8T4DYtQ6GrTO00fB18juBAr8t3k40tc6fdkLlfuVWtWzn/yNkfdE
         T8hn6gde3VtfRJmKt9n8ZgxyK+dcK1TftdBC7gm1wyCUNfa2kBLENvMlprDD1cSodenx
         +7Wcz6g/PnNt8lmxBcBuEXV6BsyW1pPZEu7ZSQMizcScW1C+5nwoXYVMkO51ADzmDoUs
         sXvefsnQ48RSZ4Lym0OQFLchz3UYi3NJOJjZEtEOTzPLCZgwBHL7olOQ8svzXnPFYYlJ
         z7FA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/DdqqrCE2ypLtlTGvNsy+9ijRwPFroVxX6vX45nLxMAriAE+plweGppaNtmHGcOlyamr/S0A7Eh6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkn0VIh2rH9/2yJtSZ9k5t9sxUeWSPUN3vaStPFf8EBFZURjqZ
	Btb/9IAykQZUMQ9GIQ53CA89fxlG8sA5E+IpfyT+y03p5ZqRmdeKz7ZLtgA4mbFkv3zcQulyyi9
	g9vKspas2JfrYSy1qFBfW4GGywlK+3v0wAjgioBLkW42hHgLWt3HT3ukIOa6z0Dnm
X-Gm-Gg: AfdE7ckyqyBeIZSxj4e8dFBY6SlL09QafZuyp+5AeS7uuQw26TEZ+QQXq7ubkE2j8sP
	2xg2sfdVuYEs/oOG0GfwqLNh5B8+JD7tsWKnwpB4p9Aritbo/wIRGPAV0DoI/s+LIzvzJ5HsY4i
	ZzoS9XFELg+qbFmR5ggKr1JKmConEU+RaZUJgJKDNY+kK5n5NlwfewmGl0ujdoYRQentadnFWpk
	jvRaCtfyDxl6z1E5Dz3KfcxwOKHRPOHs2psyRlsSMqKpw+VOgdGerNU6qAmBfo3/qZdAZI2Eu/I
	Xj4NJh7ro2Q8+/wX3jT68SnwibBH6+Eo+fsuU6bQEkKIxPCJQVOW26iejqW1auCEqNIjkJyqPYr
	Eka1p35TOwfn6gEVZhbka3h7awFWtMMGqIA6YekqCPI8euK/6Thm2Xv5Q+71wJWFc5y7GAMIuSG
	/sJ57r2bD1ZRrv1XyDlO3pjRMzDrlqFkiY5NVzCCHY6c3IlQ==
X-Received: by 2002:a05:6a20:6a0f:b0:3bf:a8d7:4f4a with SMTP id adf61e73a8af0-3c34d71984fmr2286045637.40.1784003365903;
        Mon, 13 Jul 2026 21:29:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0f:b0:3bf:a8d7:4f4a with SMTP id adf61e73a8af0-3c34d71984fmr2286003637.40.1784003365481;
        Mon, 13 Jul 2026 21:29:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm64388999eec.6.2026.07.13.21.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:29:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add PCIe support for Qualcomm's IPQ9650 support
Date: Tue, 14 Jul 2026 09:59:15 +0530
Message-Id: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABu7VWoC/1WO227CMBBEfyXycy3Zju+/UiFkr9dlKwEhDlER4
 t8Jgd4eR5ozZ66s4UjYWOyubMSZGh0PS5BvHYNdOnwgp7JkpoSywgnJaTgFa8R2AELuwblkQ7L
 eS7Ygw4iVvta5980zt3P+RJgeG6/GiKfz4pmetV9N7FaJUf8l22F34VYUV2qvjJcQ5579vffNy
 fDDEQAPQSsvtNCp1Div93JqyOG439MUu4zobF9M7bXMIUDVTqWK2QhfdPC+WpUsJMk2t9sdzOo
 CYScBAAA=
X-Change-ID: 20260701-ipq9650_pcie-8c77a69a6881
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfXx4/cBKAN5Kg0
 ie6zx2ABNaKC7RVc418kh/orjWJTuasPnxkSjO7KbLJTbhKHq7Q1mjiO4yRPn+SLnnCU7T/zNa7
 FNxfXF1G2jEveaSlGOnKAro1I/nK7Yo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfX/YuKWZQZSosv
 rwsKm/1xqCd86J0wI7xwzsEaI7I7W3ysm6EcpWlJzAeYFAX/Y1eSBk7U01tB2jqxiYz5kyFiJvc
 dcn3+TW5KwGZi4P7u4HLKuSsGAoiZb00GTcJAQQT83cVeZDASESeyhFSaniLXjKt958h4Mt/dxI
 9xzCGBMMHYiry3a/eVW/VI2DFg9gwwTMqq8j+eCvJt/UqZZ0uXwdEsyjcHCJcQT45sfRixF+4uT
 LIiYot6U1vhRK+BtUX22wkxPE87xj2LuRYO+4Nz8ikaF0mp8yybl/86N9/uY8h83VOSgA8mndB4
 rz8nElC0wvDdXsH/vncdqVss35X7vTF5vjQCedzWiwIoVGTwKEn9/35pVcvIbOaJPiiyerif3QX
 p69tOXBoj9pH3wngb53ADftd0TCUchaPbdHFLL0WfQ2S+a6Dr6QjfRnvAF/8zp7q+/CSAswhiku
 R4IzCCrMO8wQEGHAl2A==
X-Proofpoint-ORIG-GUID: YOu7OZY6jiSpkTbBgJNxzCXfHYry4bkZ
X-Proofpoint-GUID: YOu7OZY6jiSpkTbBgJNxzCXfHYry4bkZ
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55bb26 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8PoG6d3iB0iVfgPWr68A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140043

The IPQ9650 SoC has three dual-lane PCIe Gen3 controllers
and two single-lane PCIe Gen3 controllers. Add support for
these controllers and enable the three dual-lane PCIe Gen3
controllers used on RDP488.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq9650: add the PCIe support
      arm64: dts: qcom: ipq9650-rdp488: enable PCIe support

 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 +++++
 arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 665 +++++++++++++++++++++++++++-
 2 files changed, 779 insertions(+), 5 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260701-ipq9650_pcie-8c77a69a6881
prerequisite-change-id: 20260521-ipq9650_pcie_phy-60d7df32581c:v3
prerequisite-patch-id: 0e1655d496f2d2f3df84eafd66ddfa6d7e202f3d
prerequisite-patch-id: 46b42b118c95ec605f763f3f4bb3588c2685166c
prerequisite-change-id: 20260519-ipq9650_icc-994280404adf:v1
prerequisite-patch-id: c601bc5425e90330caf3faf758296ecf364b54a4
prerequisite-patch-id: 75fe7bbebbac8801823601f17d55ba0aac29eeba
prerequisite-patch-id: b651a08f6d6933bf8ae06f3e8a7d1580bec5cd64

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

