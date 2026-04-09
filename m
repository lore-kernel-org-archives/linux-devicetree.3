Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D835339719
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767902; cv=none; b=hxxhRzW6+iojGjVPkT/ugkAS0m3nMAVYQQHmesmvv1cEmFr54oOPqXm+spELIUtiHn1iSJezkbCadxCh68VKs39+Ghkz3/u23IDmSmo6pMtkypaRtnoBUKcyL7qHos4OtZ2MqOFTHFtVXNqsvdmTbsDds9GIKafJ65PdSDT3fms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767902; c=relaxed/simple;
	bh=+7ooedey7pZss6nxC4MelZ08DllIp16P+HJNhzWNu+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHKcwTLu0XCyAQuIqR4C2en/QbVhVsAsBxYEMpDL1NnxF9Dg9YGN4a07nS6oorZCJr6lM4CQAd6PR75qaAp6AVds6wMPpgVsIQGQbA4jaNwVFhrUZC0TVmNITE9gG7h1rFHhwRMV7s6VNd5+RAOIy+WOl5AFRqVpUVFnZzYj0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkmgYNDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbvvuVQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkmgYNDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KbvvuVQN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Eqk18115070
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 20:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jKpBiFaOBJl17f8mUlp9yO
	Dx02+ItIktu9keK2GJ29A=; b=WkmgYNDmmM9nBoz5LTg0Yfgb+CjkMoAL/sfdrY
	NamT1UeLDONzVkV+h0v1otddrZftfA/nzH1TQb2vG8EDrnSuk9VY+K462aLIvM29
	QDKbR4xxtCbn1HhBuGakIy1Oo2rvDaiu/Qee9LEWn0aex0bxmTcyePlLAkJbSAy7
	Sz1Vwiah6FWv3uNG/TECP9JcI+WaKyH29y2BrVzMQ6+jaRSa/myu1bN075Sjy0T4
	iCJzgWjacaZlwji1l5Vp8tb2fS+z2aCowFqyCGXD65Qod7vOCCQz6gjHMhKjmFNq
	98hlMHMgz677HMRD5MgHth0o/jX7rncOQSkflFvEqvrZx0Yg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8x97ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:51:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d4032ba014so3863882eec.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767899; x=1776372699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKpBiFaOBJl17f8mUlp9yODx02+ItIktu9keK2GJ29A=;
        b=KbvvuVQNyGyFn5d5ck/8C+tz3CPCtFRMlFBc9gfpIDscTERGkE3uVemgSSA0nvtLw6
         Y+plqBueh6nekuM2gkN4+hplg+LDyhdCvZCghw2apwo6npQvL7nJ68JSATcindgrvAKb
         UxdDYG0F+7iV029sLTpaHixLBBQeclxjb7UvR08YDJtLq2PUnY64JuMFMN86fpwiYco8
         7i5WMjEEG4UnTZ7G6ZgRpSA0sIa1BI8XoC9cuUoHElvA3Ziy1KAurTTwWO5R4Wxkoq6I
         hfTE/NE+SlYLCEr+qsEg1n/9xgDFxYbCrQRyOxBtYG25jSSbeTXXy0JbycC2yGY0+y3A
         FzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767899; x=1776372699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKpBiFaOBJl17f8mUlp9yODx02+ItIktu9keK2GJ29A=;
        b=H3xZQAovMcpM0q6b/h4DCgB/Vd+GzvaL2CQ4eYHr+kHooyQU5gxCdoHHlKDNW69J77
         knoinvlaTd7/Flp8yWP2mnJDQB3oN7SI4mSXiUqOPxFLfR4qP6SAmv/d9lwZ8V1hdotE
         xH1be+/YFSQ2/cm41t4TuWtJWemv3iA0Obs4hlbi7R1glUzB3hYHMDAF8W2WGGFu4Y3S
         ifuKdLOe/ciZuGyLLq3QSKBij62Pyym4L1COcgrhXLL2C56gAMHXxg9FuDkisMu+/iU1
         FZCs6MFq4fUTO10baxjmhOKbYfo/cfpscg53C4xRejAyH262eofZEuKoVooMcbIagaZE
         86AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtfwBgV2x+rf6vYx+GvUv1ys8bZW5F+lp0sCyYzCWKgF7cv32/XFA5ittyK1URpqfhWiV6I1yf2n0I@vger.kernel.org
X-Gm-Message-State: AOJu0YxIt4Nh37mGk+1P7zAT6fMrIYMdoErzhqDCCqhmdT3JwGgaoFb5
	7tPkjzDPPmCgSBMJZ1PFRVvPC8+wXszP0Z1s3IT4a/VQ3DDM3Qy8Shklv6CQrtKWcz2oZN70xvB
	Gv38eRugZ7N1KDKWDzLypU6tewYY44nIX3FUkt6p5WylsmWw2f0Ds9GOd9A6Jh2Jk
X-Gm-Gg: AeBDieuCvv/qIgzqZRl73+JeQLjbRFV9O6qH6zckeuynIFUqtHsPVJsqMAvBqUy41Vz
	w2R2+blTACboUKPzPpniN3LwFD44BSRfDGqBYrfl/DZxAv4KZGodMAZyq7yxr8LnmDlKmH9DpoM
	+otgNooakIicnZqb+6zToZcRX9giiqhnx4pqF/PvBrd2Zga8yxYk/0Tp14nsDY1An2rpjP5CYq+
	e++tsJZFCvIQm3tMzyAeS75aNG+Mgp1ZKOBF4ph1Ekmm3JLfRPSeVS4r/x8V5FBsVrZU1NBSoV8
	jzJoB5iP7EeN+jywyP5Mb/2yC1gOKzayWmwMMgrKmerFHJJu+sWJf3rcAfhG6YcHlTuR9FQoMOP
	3xdynaus14YBo/ZO2RoNxRAYrEkJXcJhPhO3f+QELYBxekQ0a8WRt1GEx4+IREeSGQkZs32JXt6
	NL
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr414153eec.8.1775767899262;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr414126eec.8.1775767898682;
        Thu, 09 Apr 2026 13:51:38 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v2 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Thu, 09 Apr 2026 13:51:34 -0700
Message-Id: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYR2GkC/0XMTQrCMBCG4auUWZuSH83ClfeQLsYkmsG2sRmtS
 sndjUVwM/AMH+8CHDIFhn2zQA4zMaWxQm8acBHHSxDkq0FLbaVRVrj+KiI+SSj0W4feWG8R6vy
 Ww5lea+rYVUfie8rvtTyr7/cXMfIfmZWo0mitCcqb3emQmNvpgb1Lw9DWA10p5QP1gTXFpwAAA
 A==
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2287;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=+7ooedey7pZss6nxC4MelZ08DllIp16P+HJNhzWNu+s=;
 b=CIf4C7+Esdwrf0h6QF3QjWHcWclvMT8VWvgIg3cVJWiiHsCcbt5yYDMdz5fsfGMbNVDxGKkAn
 54lZSAAY7X8DXflWrVDFm6BVJurlGQquPq8/soONoAmM2RoPbsFRkCK
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfXzbjCw1RIeLIZ
 nKZD1v2yVs6PwDKqWsUPYaJimCXGmCTox6RwQxSoKOzStsFh94xQIw/wWQFqup+OSI38PIhPI7R
 6CILiEK+fzNouGxmDNXt1uPjiUkLqDHOH1/A6YEP3KjaDg/+gxkgqS89wc2V1gGp6umqdij0mwK
 j3ockv+bhy5r4j9z1Z27jqZucoSnudU7ZGs0DMJ1Q1oWhngZ/WG7PeD8eUrzDQ9tNiMTIB4DJgu
 SfOmbl9QO3kfwkcsBgAeyU8r2VbMcFC/LykGTvZxFKCHdkRLzqchlKr8m7yH40rN3XmpQil2Ddl
 tnpLnIbjC9+T/jxASAb5/14s+GjyUS4GRdRJFjlFyFPXfpDe4EQ1ozoUdnClG3zD8jvhwLmyw0Z
 QpPbeVHSJcALw1AfddIuOaXmhOW8Ke4LvkpR7HV1vKCHoW+bcNvyzaNRBH9GzfzXv3q68e0ZGJc
 0ytKBcaNHWi+lAvFddg==
X-Proofpoint-GUID: a7MMMDG3ngx3Bx0QHpgZRAbpRUO4nTAi
X-Proofpoint-ORIG-GUID: a7MMMDG3ngx3Bx0QHpgZRAbpRUO4nTAi
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d8115c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tIqp-kY1CHwBKU6mdUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v2:
- set the use_rpm flag for GDSCs to support runtime PM.
- Use clk_rcg_shared_ops instead of clk_rcg_shared_no_init_park ops
  for the UFS RCGs. This avoids a UFS GDSC enable failure due to a
  shared PLL used by the UFS RCGs being disabled while the RCGs are
  still configured to it.
- Updated commit messages wording to explicitly refer to the chip as
  the Qualcomm Hawi SoC.
- Collected Reviewed-bys
- Link to v1: https://lore.kernel.org/r/20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com

---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3657 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4209 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

