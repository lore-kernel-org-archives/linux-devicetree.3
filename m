Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7273EA94C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207010; cv=none; b=BGnle3Jh6wNoTDr/muPf2nzSVMAedrpJW7GpOMMyEPblNNrtGZH+bi0H2S9CJmoigTzBQ0IKV81RfLyCaXME5JpQNsb6ClfsXtLU31AJSFP+FAX/O0ueq6P1tpLNTl6ONO2bFb+SkNCFqpbpifJiYjjZttXWum12ZvLkl58IhzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207010; c=relaxed/simple;
	bh=IYElup4ekCon9UY2aedkshAhRE3XjQvOktiBaogwXqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cj2z9GM9S9mRwu+IrJUbdamsScKNlBMV1Y+I5dxJmRW/udCFOx8XsCEZ+yrQ7bM3bHqcKDNAxjYvOby63ape1lCD7tfTZW29yqbNLnFhy7Hipa2WtsY4jiNdEuy1G5jeIZbbtCGZA7FrctcJqy2DOcmqM3idxzy9nglWyGrtFn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1P6Y08L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qb0HOnRn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1P6Y08L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qb0HOnRn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExKXJ1963656
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lZKj7eUJow3lctx4K3XGUm
	tqHkymP9JpVwthbn7Qpro=; b=k1P6Y08LBPqojlPrEVm51zDtBSdfYyv10VOemI
	OmYkHCUCNr1jFopm6N/ZaUcyny01GNoQjuyjK3p9k8mUXMB7MUHgOk2lf3RdgXaK
	+v3obpaxqH1daW9Kp2/mD26S2f/gQg01/xLVDCGW0QWIfke/0tbRtzZS7zOr1iAU
	weAA+qFmgEM7EupXHu5/mH9uSnC8dgcJmmS2uXvkyWvVzOF5FXb72qZdEMMdvy4y
	1I1Tg1Tx5AZUOBg5DR2D4vJv8WsrUbfls6dTWgfbOjpu+op5/sME5Si62ggG81f5
	RGOl9OQIAEutxqvZ+vtzMkUP+hYvj17CiFK/exTpcLISUEfA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t0b35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-57539ff73cbso8572036e0c.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779207006; x=1779811806; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZKj7eUJow3lctx4K3XGUmtqHkymP9JpVwthbn7Qpro=;
        b=Qb0HOnRn+dKHsm7gsWzp/qfJXZKhfHBY6JmC9ac5tCEsAUMYvfGeqR6SiyZ+ACG37f
         050QmbYvBeM0FennYt2wJkmMLogST0zZy5956dPUUtaiLFNiRfDN+4uY+N7b/LIc8Bxc
         tqZmCdNpm5hxgQtBN1sEVLPufySbHAzNgNl6AC0XoKwN+Y/sGbTV46aOwXxIEgCQ3E63
         EWzFQ4p9nDpWepAobsD9zUwQPLTlWpV/UjpU51xAQofsv8WXa2CysysmGmamNfznZRGZ
         j6uQGyAA81ADP4i4JG6MCMf379Xo/hAfwxjU177GPeTsjKdqvYrwOFsne0oFgr+VDux7
         c2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207006; x=1779811806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZKj7eUJow3lctx4K3XGUmtqHkymP9JpVwthbn7Qpro=;
        b=auCBkKCeupF7NsBfXT9QOxaThquKOeoXVr+y+lTtj51HHt38EXqx/tf4caCipGgjoh
         ugagucCnPhLfMen2ekm9A9YlofZPNVR495EyhcYqubWvL9Jt1RnUiUzkDcSpFFT+MNSF
         +Px7XvEtNdeE3Ijp3LGorYtx894obD1K5JHES3TmqB21SUxQVWoZo9Ox+GgcOLGoi6ci
         QSYKT5+9niNL0j6i+BELIPqPEhFb0iUCxBeDJNG2JX5//tTuWeXiz+e0uO8sDtedrnXf
         p7qCv6D86SSq4KP10NpoqqR2gvdqPMH5xqPdZo4yA3QWtI6+Cr1eUOuPlBgRKeejjYyh
         rquQ==
X-Forwarded-Encrypted: i=1; AFNElJ8faGfF7BoTMdwAxeNXylhj7/js26bFLXFBSVDZMYq6YBBqPlngL5nCX62xq0R1BQGqyk9HFtbf8HDg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15LeWg5C+ZhX4W4SgWAhxxFfibuXShyj9n2n1x2ld59bLNQXx
	Y1/y5hLpkWMtuNLhy3OhGehd+hwlcUVR/qEAjsZqdQUYRKs7cZ3E94Kfq0EgsvI+x/zLsCu/ANQ
	ybU2sO6HcW4la1WZB0pmOCafXxPkTyI479S16eGf3qvjYmijLOkeuwmqoRIG88q918Di5s1ay
X-Gm-Gg: Acq92OErhjz/lu7Bccp8zW3hxTnWJ1tq8vLcuKaBjpo8l+pVJRMPShV9VXxnde1JXX9
	g8eeTJW7cTmK0qE4WjYmKNdkRqNucKIdrWPL9IFEhHy3xd+8YpE8CQviQP4WpTipgvtm3nJ87os
	Z0eEAkdoK1dTiHBw8kp2y71Io3evP7Ig+csx7WwWLhlGzL823omJetMEcjOlC7JNPnXuZ4QlZJl
	3jIKijbySGtwWdH60TLf1xmgMB64HmzO2gCtBW1K+NPg1+CLho1xOuv5JMcW9Qz4hxivghNNFjd
	QEB+t4uwjRWz3VJLxdOmgv4E2TaFUA77w2HmpZB9CU9tvfXZDHp/1jnVKbZzrcedaM8NM38LqcG
	xPHUE0aWNlsJXmisMt/OUhBwFPuEm
X-Received: by 2002:a05:6122:8010:b0:56b:942f:b870 with SMTP id 71dfb90a1353d-575f5476d83mr8121606e0c.0.1779207006300;
        Tue, 19 May 2026 09:10:06 -0700 (PDT)
X-Received: by 2002:a05:6122:8010:b0:56b:942f:b870 with SMTP id 71dfb90a1353d-575f5476d83mr8121572e0c.0.1779207005585;
        Tue, 19 May 2026 09:10:05 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm357874915e9.12.2026.05.19.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:10:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Tue, 19 May 2026 19:09:51 +0300
Message-Id: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCLDGoC/21Qy27CMBD8FeRzF8V2XuTU/6g4+LEBtyRO/BIU8
 e91Qlr1wGWlWe3MzsydeHQGPel2d+IwGW/smAF72xF1FuMJweiMCStYXVS0BLyYbwE6eJiVB0x
 f0PS0pIeWsro6kMybHPbmump+HJ/YR/mJKixC24XDOeZn4XlGpPAIyg6DCd1uxGuA7eGq+OckG
 1vWnBebD6H9BNFLaLFnksqiV5R3qXrJYs3m2w6/MYyfLuIGdamRq161oiq6xF+xK8r/Zc8BQaO
 MJ4jCBRCjhsE6BB+nyeZFLyT2XLNSadUlRpYezsYH625r1YmusTfl6kWriUIBDa0PumkF50jfr
 ff7OYrLUtM+D3J8PB4/mH0QqsEBAAA=
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3224;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IYElup4ekCon9UY2aedkshAhRE3XjQvOktiBaogwXqE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqDItTS6YYBuVfzVHpex6M/W+Zt4GWEr9eI/Jps
 OOWtxxxHbaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagyLUwAKCRAbX0TJAJUV
 VlKiEACyDrVdZc+WIqXL94EflPcLB93JtgpKMOo7h80qomedxuatEF4QuaSgFJPGi7lUs6i/F2j
 ksqwk7HQWElanI19fw0UlAEANEjpDRntqd9mk6f4/gD4Xp2aXLjEsSEDqp7UZeKjXbpF+i0B6OG
 TerQ5h89UU/8Id0YW82NvJ81qANC/BgDLjQL5owX532VDqN3vX4ZNJA5uR6hoOS0QGEz0Pq2vbx
 im0IfLqn4ziDm//lGfrXOy1/GtgY8v+O4kltMSEKnSVo1Awz9tH98i6HsyOTOrg2nSSCyBRVyPK
 SJ8xge7xZd82l+HC0LC6qPKkgOhao644V4CDGu4ZCDM77xIdua1hU+rnuxN2k6iLwvZxxwTCItI
 rQ140UycAT6+oAYak3uWXOok7jAnnjgJ3wOmkMj1yro555+Z9dm+TW396VMMp0Ajt9uUjtlXoaw
 Ys2HpPBWKaB4/5oc86o9kS6zcpOpS+nSLut79I3nlDBq8sA1JYhKK/M5R0AwAAiUq2arpuwzRq8
 PDWcoVgIYSz0j6aWlW/waOAqw0Vi+ung2cl6J30DAvSRx7Ee7vjy6babr31CGq2KAw31U8/l3mz
 b3yZwUaln2a0XPUwgtvw+uZNYSLJpFBdUrLEmXE7cdll4FSR+VD9F9vTCybVpsJtaDmpynEV44l
 US7Imm0jHOjXJSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: KQ6W1KOMr7w-jcIhM5z_ttvE-A3RqP_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE2MCBTYWx0ZWRfX3s7B0VD9O++7
 s+NEiDx8rTX3GJHE53T96ZhQk3965j4a1MTKakuALhEKY8jNZyuZ29FA9q8Uul6FXBpRKDOtXxW
 ZpfOBpjIDJtn6cPXX7nt5kcQNVRci5zp6Z77gYIYzCvtoUa7fDOT0rKWOtWNBi6YMwXwhy6GK/V
 h0tfdY0Ka3/amPlUOSw4Vj5FN4ybcDGUcDURDgIad+YioxlkHdzjDoPXeEAAHT3yMZpJweB9HXl
 GXp9LnDN0bVocI4zPsiBV9vY0rQ+ZHe2PXCjuUnuLgxIAAQza6dERgG2H+3fJk4k9E2oSBBQ2RX
 hgw5g/dhrbtMYCTfwADg5fRm5qBIIb1sMfGUOfRD28NrZ0nb5C9/gsit6I5Qa2C8h7eesMP+wYt
 4hmbu8u1rkDOkSUji8mnWXiQLZevlhWvlWU511Wn2kFv19cbNA7U0M1csHn4C/JBevWwhkV4Zhf
 /hzrnt9UWGJDRbdqKAw==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0c8b5f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uut1gRGHU2sbG-ATfEgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: KQ6W1KOMr7w-jcIhM5z_ttvE-A3RqP_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190160

The Eliza EVK platform is built from a reusable base board and an
Eliza System-on-Module. The base board provides connectors for external
peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
eMMC.

Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
Eliza CQS EVK DTS that combines both pieces. It also documents both the
CQS SoM and EVK compatibles.

Do this in order to be able to boot to shell with rootfs on eMMC, on the
Eliza CQS EVK board.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260519.
- Added missing qcom,eliza-cqs-som to the EVK dts.
- Added in the bindings patch, as that should've been part of this series
  from the start. Also dropped the CQM as support for it is not being
  added. Also reworked as Krzysztof's suggested. It was initially sent
  separately here:
  https://patch.msgid.link/20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com
- Link to v1: https://patch.msgid.link/20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      arm64: dts: qcom: Add Eliza CQS SoM platform
      arm64: dts: qcom: Add Eliza CQS EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts      |  20 ++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi     | 388 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi         |  20 ++
 5 files changed, 434 insertions(+)
---
base-commit: dcd3b3004d542eb57b4acbe916919336e9aaba52
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v5
prerequisite-patch-id: a457d339aa64967766ea88eb05aa65a4747e1022
prerequisite-patch-id: 04af1479b04d515ced835504144cf09381471b85
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50:v3
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-change-id: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc:v2
prerequisite-patch-id: a5535fbaa3699a133dfd13cfa9a2a74b18b46dd0
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 7dd9c4f27c461e52a096ceca08427a724c8faa6d
prerequisite-patch-id: 91a4f29e0cf69b9cbaf243ac312b9b2f34596c78
prerequisite-patch-id: 4792ea10ca0ced5dc906080f571d54d6f4cac526

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

