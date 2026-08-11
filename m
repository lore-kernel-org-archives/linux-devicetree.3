Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFDA3C2790
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463601; cv=none; b=GP3UF9LdXSJkrQ9gWEN/2NVDkFzjUtYNKLq+j6mO+4aFee0bh+QiOQZ8pMPdU/IxfonC5kltIsIVENL/lwTk2p8IPCrBnZ5i/uBN4ao+DScCDtLLZ5CJp5NqUs5gcRyI6HVbzhFoRy3t9c213rT/ivh0B/WoCWJZ0VLVd+/ElsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463601; c=relaxed/simple;
	bh=mPMlA5xOjDPdWn1TITXvRoCLjo/GwbDuz1l4ucd0Fzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mjxKcD7BJtpYx8LLI5PudLftVxkNqzT0fvgcagfEW6ZNOcbGxwISXpoXRFaYWTu4E0eZ4h7vHhAahI9f2vTpR4ATf6+8kH8kZZDSlTEW8kTnbHyI6wqqG3jmayCjmbA8bFoysEtfWnMzV+DOeX8UdwPg91M/wv/s9fdAp1SjAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDqAvr+W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AC2INtb9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDqAvr+W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AC2INtb9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWiIW3718138
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeahNzQ7WHemvKSq8PYawZ
	E+IsIGfP4Ho1yxQjj56mo=; b=ZDqAvr+WxzeqeafI5D1WuvYlVj4dGdvJkKMg02
	yQsp9u/WiPdq+4uPo3Lmcq0D0jerqXwv9jY3RzVGfPmD3gzjBaoP78TT8Bpaq04i
	kNDs/TBsGTlEJuH+wTvwH2aRFohAxpVne97hfG8lFkOqwclE/bkszn45fEwPGTIg
	qo3fwvg9pjdtecGPNbrAXUPr3l1usfOsUOXO45MmIOOr9waXD19q/PD0BeZWK4WM
	2MqNHkO5/11Hy7oLcjMzI6Nz7/qhra3D75fAWNh3Y2REyGlS9d8Up0e2BKVaNcIl
	dYQCY5Rp2QZAp5+H9olzHaD63UdfTlfudeTWo2E07ib74xvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwet3r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3879700a12.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463596; x=1787068396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LeahNzQ7WHemvKSq8PYawZE+IsIGfP4Ho1yxQjj56mo=;
        b=AC2INtb9gNkf76QDwWLEp11MvkTetUvCUxZO0BqKOlyjX3DOZuYzsT/g83N/bDgVzA
         k4es9jKlGJu/bCVcWKklt3r8WB56dV8RUjBGUkf7HkqoaRk36i3kuLyAmnGveTzDsY+i
         86BWTrp7EqrCUGbMW+RV4wlY3JGdMGT486Pu5n3LzLhBxdzQHuptmJzUiSxyGYU0B/PR
         EEKzwgjtjHqKseyyjkHXKwD/dN/c1sEv9qho8yup40iVwDxfOKXiieBi1su3F+fVjKn7
         GlELIqoB3hYVe1+eyMGyJamiYTbAgaBNCuD4u+TEfFNZKJbq4hGAYAqd5aNRaYnhE8N6
         aInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463596; x=1787068396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LeahNzQ7WHemvKSq8PYawZE+IsIGfP4Ho1yxQjj56mo=;
        b=kPgATbfETrJsirXZltXErMfJBIZw45/kGXtMqgfGvhNb4ydxAvW9zpH5C+UJ8eRC23
         NjdrVY0FLyuHrh8IdTtJfetuWpWJdauW2XGA2kKOUE9OXk/C+KlfiiT8nWVZwCPlqBdg
         +BwofWVovrrcIazsOUDFp/zUkWv161wmv/VrkpnDw587mwhtwtsQtXyZeWseSs9j2dbg
         oF3P2mITsWLORHZkTGBiBHXfyVPRQJkRRCzVTGhm2tIObqQ62ooNHJ4k7w1x8x1zLbzd
         U8Y4Pr+O9gcYZXeXmb144GjTwYJAOPYqE5P8AIQJSzZ6sqYO0HIuDDhdbGKBdRcuaXaC
         sjmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZOx7aHqVLnQuGDfoeKkp0UiVJMGNDPsyVnT7sDg4GZJHo/rSsTza6ZNcw5PqNdOOqhfVSYlOs3QZd@vger.kernel.org
X-Gm-Message-State: AOJu0YzhPiGWImNDPgxrRQ4ImaMzuOjkgcB5WL0dukA3XXmjMVWEtQNb
	JYRJilXZto5K/avCaGDFBZTfpjC53UTxb/k1zI0FIEu8bqNpT27uBFtushLO+BHgYtg7EDzGgaw
	DyvGOAvJH2OqGz1DlZQQKZ5ihAzg0WoMafxvvCUXlmN7EBDbm/1GHCHHRrpASxNMJ
X-Gm-Gg: AR+sD11Xs9B/U0NJNSgNUwgeeNJh0wjMQcVm+q1+b+I1G/iNigrqV2yhh+DxgswmJy4
	CsUUia0lUu4nFKj+RNEbE5tKBvix3fr9NnbrqG5FwuRhAZ3+iAjwssjyz3Elpw99BXvdEspfwfa
	0d6l0wk4B7TZJatkFNhyNmKRMPtLw0m/985CCIf5ujWn25abG3cxsYC/s2zBPHqu9Zm8df+1eqg
	ZMD2QqKutiJiDWyUSAYF23GMHnR2HW77QkEhOr4k4ytVYgSnk/dVVO1TeHgaFDOPjjgkq0mWp1B
	0yLP9MWH0rP9kVcbZLAqXxJCUKZNbJzONc4kS8oMNyFkH80Ji+SF/B79c1tpKV3bNSf7H8t/Ym3
	DUQebGrxA/bz9FeLx7kn351umgGg8bykWItEaybL9Jx54Qn04eedv9SRllNPFI6LGjhqjUbkH1s
	XzwjMZWUBD7w7iwmM1xARpaaDsKxnpEn6n6QU=
X-Received: by 2002:a05:6a21:a0b:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3cc2ba5a436mr6340884637.19.1786463596192;
        Tue, 11 Aug 2026 08:53:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:a0b:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3cc2ba5a436mr6340828637.19.1786463595712;
        Tue, 11 Aug 2026 08:53:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d726f1sm1143032eec.26.2026.08.11.08.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:53:15 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable icc-clk support for Qualcomm IPQ9650
Date: Tue, 11 Aug 2026 21:23:07 +0530
Message-Id: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNFe2oC/22NQQ6CMBREr0L+2pJSW7SsvIchBkuRb4RCPxAN6
 d0tuHUzyUtm3qxA1qMlKJIVvF2Q0PURxCEB01b9wzKsI4PgIucq0wyHUeeK39AYprUUZy65rOo
 G4mLwtsH3bruWP6b5/rRm2hRbo0WanP/sd0u29f6bl4xxJuujUtLEE3W6OKJ0nKuXcV2XxoAyh
 PAF5vXQ+b8AAAA=
X-Change-ID: 20260519-ipq9650_icc-994280404adf
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Fo8WUuxEcAbTgzaAoEi8Kv-D0zEcgYn6
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b456d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=20KFwNOVAAAA:8 a=9qVWJoeSOig1Lw2BGOQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: Fo8WUuxEcAbTgzaAoEi8Kv-D0zEcgYn6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX1adBo39lTtz4
 fer6GpV6tmPKUXIF3NTU6HO9XwLRSMd9r2QKXDd6/ixEO71HEfhtbqImzO0Yu34GmQfQ+Pagmll
 4fTS2uhDwlWksR7dz8F9zGgksGOOKtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX35Brq1Ff3RLD
 nSf0GZoy13boa6L9THFFG4lGVjVq4MLi3ex0g3kPDfsBEzhsrE0qQZyGz5j1fNZ/1kJN7anrYOQ
 8Ig84bkxeYMTjzDN+R9AEIKS3nK5saQgLr6F0BpSumHxQm3uIHyn8OF1KpHF/eMVLqQjxfJPwYk
 xQX0WfcQUN6TlHvgwCooAEZmlofuVX05r7DhgBes9jjqWzwDUToDWlKPFWoD8vzW8HSfFOQTYWx
 VvZv/NzBCpMCYRtVKQQk+bol6HPsp51VoqbsHld0iKVveXASfT+POyBdxy1Uifjl+3qhB4oUoXy
 u/6+JzdRyz96zon5ZiqjCg7/fDT63oetPSFnvUKALnqX5IOFSbzB4ponwxK7U9eAyEdvFXo0mai
 /81aUiaf2fk95Xhla9LllxzHubL1gBmPTM9etyMMpuoM0iUnbxsnhwkgxSOc19lu2Sf6rpAmWt7
 HU2bIivS8f8JmrvU8zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133

On Qualcomm IPQ9650 platform the interconnect busses don't have separate
RPM / RPMh controls. Instead they require direct votes through the GCC.
To unify hardware descriptions (and software interfaces) between this
platform and other Qualcomm platforms, make GCC export corresponding NoC
clocks as interconnects.

Add the necessary bindings and the drivers changes for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Picked up the tags
- Detailed commit message for the dt-binding patch
- Link to v1: https://patch.msgid.link/20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com

To: Georgi Djakov <djakov@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      dt-bindings: interconnect: Add Qualcomm IPQ9650 support
      clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node

 arch/arm64/boot/dts/qcom/ipq9650.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq9650.c                  | 22 +++++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260519-ipq9650_icc-994280404adf

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

