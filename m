Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5238A72C
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743512; cv=none; b=SyveyqJFxU8BoYRaDRfHdJ6qk/hbLxnwl82baAnhMZOMoCzCAZX6/HP1+/tu/9G1wSwNPeJZmhFeXwaD0LhFZetR4I6L5eq9BN+MIu4vl6ZuXXbEvfhw73ZU0w41NyBEvC77N9iFPXLjWhH5A9BzHO9enCQYH0PCHNwy4npKLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743512; c=relaxed/simple;
	bh=UPSrXCKc6edO5S9ydB40s6TVHhsTbSf0vO6XS0mR0PE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R//zXH/35b9xX6HyDRa+Vpza+R624pdo4ACaEkZm8Ql3f/t00BAc+5ggm6BnbqN4X1uYyT2TZcPa3pE4LlJem43p/h96eaVVpbR5EezFVb18bc+um92spfcom6ED+Nzzcy0xWXVbDM5pHSwJv0Sw4mUPvOpreDGur03+XCTwiAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxngXRPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzkOk139; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxngXRPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzkOk139"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGU7S1209714
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sCtYrk6sjbNyxeW3y8q9SnPU9KdakfQHSRM
	YgYcuaz0=; b=YxngXRPnpZzt/joghPfxvMLLYq55RoTLbhK6xBsL8A756q0OEK1
	Je344Vx3Ur2vBLoKlui+nOC8vALJO7gRoFSwGhdYdvsqce+N6kTGsgNm58qbLJ1T
	i0Gqz/Dlx1ddij2dkLWqLYJVqB119aH2bSPdc1T+vLWy5wyktwADftdEYlP/dKim
	k0aukLCdxasntCAKHCJnb9Et5tk/Hr5tdibuRlof/AqB741gh1BmeNXG+yQIP/XK
	vbdNcbp5D9/7HppWvilJlzzx/tA7M+KcTzWz2vkOU+WAhS2IPGcL0iT2W/0xUJw2
	kiAt9Qk52utlTsAqjKJOlVCll5nj86MfsYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxkmvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso1194356a91.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743505; x=1788348305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCtYrk6sjbNyxeW3y8q9SnPU9KdakfQHSRMYgYcuaz0=;
        b=HzkOk139OBYexOHbVt6XCxXXWJjy0LhqGil/rDngn+6zRVkmVT7w4mayGvE6Ge70Ec
         /T+9UE5qKQiK0WzTS1Z2a/4zm6qvrgFc+mKaq7/VY46VmchvmAyVfXxriTYn5bSn+UTJ
         Gb+3C+Rola96m5uyut6/YcyAibTY4Tup3P06YYtdLxoGHRCOvvXne1TOIWd1+tuXvQz+
         DqMUI+fjZJX2uUnEm5vaSZl2jA+T8lojC9wxIsgb7AwyUamXpUPEQIyNqFyuovjmNfYM
         A3GYy9s3kuPcy4rXlSrzfwyOGoRl2xlsKZPb9L5pZnXtNmEVNBpZSzab8GpQ2LKhjyCi
         GYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743505; x=1788348305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCtYrk6sjbNyxeW3y8q9SnPU9KdakfQHSRMYgYcuaz0=;
        b=iMqZJKWH1Ypx5L8PZpyWiq2+PdBxRAH0iC152d91xZhyOEafr4KcQ7TdT91iJ7ij92
         TxxM0gM3rQxEVQ32RbQr6lhjTr/yhwxbyhW5R6AsJD4CVeo11cERq/uYOjJMJ2Pgi79H
         a73cCQfCrNeHX1E2RLQGCpLI86pkDE3iLQXqiv8Fi7JWjkO+m134DG89702xyaMfHmg+
         qZ7Zf77sv/sXOdezUTiYctvmXyGXaIKOhZtI/AQBMi3heJLZlecJI5137kr9wUXGeA3z
         znwJiAauBgAMMb4mDU8a8DDsGREHGQzWDC1xej/pMWEYNMpXVjw8EnR1Nd/ZZGj67IZW
         ffAA==
X-Forwarded-Encrypted: i=1; AHgh+RpSkDgeUYd6CNtO8yBWr9NPEvAs4xDATV5Y2rCmAhRCDpryMVMBvftyJqoRsvwhdswWcTyAA2HFNmlH@vger.kernel.org
X-Gm-Message-State: AFuF++labyz4ce2W12gAT600vGrVBfiKjBPgd4aYoha+P/jgb6wI925Z
	+drqyGr7J3yULvISpAFCL1OaU1ayssM61wp7isJiSK4d2W+N4xK10lJgXbccoOzM6m4KKmrBVQT
	afZ9ye0ipkXn2QO2CQgXeNhY2mjwJon65cj+LromYleENf66RJLRataWN1CVdvgGt
X-Gm-Gg: AR+sD13ZUZW1ItM272WUxXoMXVfig+EKqiBOeb+5ff6o5FTr6vV1GBLTlWJpTUPLG/j
	FGuyiH9HJZp2P9wlTZLptibUgDviA0Wxbdr7FxdJNOSTXqxfq3BhGK6d8uw+gGWaWi8IzxzM7tj
	fNry3ZiX0YQjbaJy4Gu647ZvxTpAU9EBGagK/ZSOnh+afVldO5uUsGPOktCnmiZTWDkjSyVy9mB
	CfwVIqGX0nwD9divuhTWO02xsApdo3273G4oTClH6pdQsPtJTBbNFI5hC4g8bwJRvg6HoFWlasW
	0tn2CTPquNXrSBRnsEdp/ZHFTfQ5sHMbyyAGdO4pFfntzVA+5KlAHIwdpgSAXEsbMd0vRSr4UnC
	f0w85EiaDsxGfsWqMzxbEZXKlGKaJJvtBNac=
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr13011415a91.16.1787743505268;
        Wed, 26 Aug 2026 04:25:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr13011279a91.16.1787743504744;
        Wed, 26 Aug 2026 04:25:04 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm7521016a91.9.2026.08.26.04.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:25:04 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V5 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Wed, 26 Aug 2026 16:54:53 +0530
Message-Id: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8ecd11 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q5OXD4evTFBxQrppJ00A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: xyWf3nMTzgsUG4JWApd7T04kLxtRnFGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX1mVsGR7BuASd
 uqiFktg0SPqUd1XlcCf5/l/d4zBqwrt1DvfL77Wy4wdbPsNN11JGTmDkxhsAZOjuuXzGAJSMJ3z
 T+ubwtGYLQtfVrYTqus3fYYam4i5y4RBQcDKXdhSByjwHyyE3B+vwbx3/nKbewIIE+clqhAnBod
 Fnex/Y8fga2a5QrOx6IQKaM3V9iU6HbARXn05El1kdOjnS091D5Dl/GszuSyyqBhCebeRfMo5Os
 RM55NaaMd9eeT5SETZFzvoFKB3edpySN2K3+iScx3sfiM5gbxib6wZHx6ZEw2lIZ/gtkbLHfa6E
 yBqApG3EbUyV1F8NuKpnhWp6hkSuiJCm1Ds1ARFokLunvlH9x8fgysLA3CIyFgw4juLrtxiFSXg
 mKeZJDGfnx7lXyIQMb0YUTvyhyuMIWZ+GvEW+h3RJl8W7B2jvuxBlcis8btUOUdRs1xwNBCA7Uh
 R3S94YNcgUvnDPniVuQ==
X-Proofpoint-GUID: xyWf3nMTzgsUG4JWApd7T04kLxtRnFGH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX1EIT5jKa71Fw
 sheZ41kyKh08lA4o94rYvWTeERRcGs9GEAy57AfT0I3GXPseJ8vd0b5DhEVq0q+MxW9o/vHVr5s
 O9FTXEzoyuqooHQBX18rKHc8DMQEjbk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260095

Respected Maintainers,

This is v5 of the Monaco SDHCI storage support series.

Changes in v5:
- Rearrange the Makefile entries in alphabetical order. (sashiko-bot)
- Rebase the changes on latest tip.
- Link to v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

Changes in v4:
- Remove the redundant regulator node - vreg_s2s, which is already defined in
  base file via another merged patch. (sashiko-bot)
- Update the base monaco-evk.dts file to make it storage-agnostic by removing
  conflicting eMMC specific properties. (sashiko-bot)
- Link to v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som
  platform which also extends the monaco SoC DT.
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  8 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 7 files changed, 109 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

