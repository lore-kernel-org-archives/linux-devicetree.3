Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356EA3E63B8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992044; cv=none; b=qqVuDJVkzOQI+H6souaHwseYvBPFS7l6f+VeiZEK38j68qw3kbHWp87PtJQ0y2fxz4QBUtDEGgYcrDSVEwTpZ6OkOWOc/xurPkrxlD5sN96zxapzOMNlcP/470z9vNYhShCs8HTbpDJyfIbNNOfGbQlngXL6P3UpciMcNXWyzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992044; c=relaxed/simple;
	bh=GUd8KmrY6YvMPNUJd3CYw8tyEqRQsScJ1bSUPwtgd6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y08SFDe5jiSaheg3Qp8gWlCageoz9nY3UAiuSsz3uZEHGdh0DyzYJmLha89qM2pCIYkd0YUzlpzRd4ERwl0tj5x6EdXFmXBMUdqDf3QrNTpSojjQYi7+zXuNqulfCWBNVCcl0uoVr8pyiuJRvnrD5l6I8z+vxmP2WP0oae6+TQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNvNoYyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMy1rzqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNvNoYyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMy1rzqX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rSwq1517760
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vQL1iwRWwLr53GF4TzTp7Y
	TossVt8/CEfh2zZGXZXJM=; b=HNvNoYyLH6161KwvICPj8ReDzkcsDcQ10FIDgv
	btduvwKShMSzr3ACTmqaE8g0zPp3bd+1JcWiVCMvT/ltfSd0NSI8zAvxE55z9J/S
	t/KTEtDsxIekiIiyhnw0o8Xiw7eHfsSHPX98ARHVkrNpABJWSXqrQWEUJqJ0PWXR
	OAxFUOC8pZ3zJ2m0xFpE/K6VxEd+oaSHGIPX92ykiZRRJ7EJ4jncmgi9CeIEvQHe
	aBQAi4aCn1ZCVFIUV0EeiYd5aLZcgS/e/ppP7ANFKHXcleu33SyrTp/qutdb2ViK
	ZsWN/T9ifohoHOdyl5L2SOK3TZwdRyOFcatAe4RIhieRyFAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr82mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:00:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51772325a64so71296601cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992040; x=1781596840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQL1iwRWwLr53GF4TzTp7YTossVt8/CEfh2zZGXZXJM=;
        b=NMy1rzqXZWh8VLhMj4lV+w1Cp4k9/X7EUuP/95nAg5/u364SOB0EYH9/MkV/mbavEB
         NJk8qxWv8f9ACVdH/9v8HA20FkTm9oeY1EodUwUW6s5eAkHvQwZFJtK2DX1XriGF82A7
         JSohfVN8cvEMyusyV2mjmtyvSTt6cbzu1QiJmFneoPyId3ARgj7boXRX7USo/4XC+mNm
         SpMydIc+AeEsCz6SvQztrUeNNjwUG5Mn7egUr4FhMwGl63wU66cXvnnTYHQi7lOhekmX
         /O21eT8uA8r1b3c4k2au/upMuDrv7AIgw65A5Nm6oalM6xfICLTYAUgwVQ40DOJuZuER
         /BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992040; x=1781596840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQL1iwRWwLr53GF4TzTp7YTossVt8/CEfh2zZGXZXJM=;
        b=QokQu5mSy9ZWnzswcS11U8HxKvvaQb1w4yp5BMcFUpM21cVdA5TKqWRkhqKrdyeI7Y
         7KdAXEp2h8hfIfvo9tqRVfLLs3aIv/BYPyaPAjJV40tyrpaEHsa0NPvJoB5DQ2dWpDEH
         +xc8nTDqLcBDa05rSntxE32SqiaxSjcOdnFezVt31HKMLeBLCrJJzS2eos/H/TefbTha
         FYFP0/HVqta8/HMIgUnLjbu3kW0JNIMLiVOo88Dn7CFgFi/KlA316SQoWkjdwN0bcm8t
         ETBggYFVcGW4cy/k5N/35GzAZU09Ol4RipTQDBp50GIS5odyNXP1/dQa/X46aYebLiPN
         8s6g==
X-Forwarded-Encrypted: i=1; AFNElJ8sEIh3Y2MX7T1SQPWitGd0MaRmm7CJlnCQjIBsAvBVzEMQhlCtoejzWqfFe8kxpZyleqQlI4Xg7WMx@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRh0Bfw5PExsvcgARQ7P469jgcCtBPuyJAVxZSgtB1VMkK5Uf
	dKE0BduKzbssDnqeM9IocSR9qCfZjX3KDGbtq6chEcjt9Mf17AD0al71dWMKJSFBRqZegUrwpFu
	Ox1+KEyOJYDry3MM2S9Fp6y0bduhpLmF4e8tkM0HOCyONg+7JoS78MDO2KJ6zCMJx
X-Gm-Gg: Acq92OFm23nIHx3hpGXIcFsSPm0I/E+YWJhLIXAc8b0TpOVcm3FA6FN3expscqoe6Fi
	GpBI4BYSdmCzBJTgail6YrZnSi+iN0ZkbQuEY3K0+EiLai2ekjTWemXBbYz1ihSVEhey5t6PNY4
	pU14WwiS2kFlylSp87TVTZAB2WZpssLSMn51/aWDNYd+21kf77qLRUS9UUlCQti8R3PdlGact+E
	kx0rdt92omumhK3G3xvdvauVoutArZTOTgIDW4WhpdC6Ou/BStPx2F6N2c4RlRsXM8PP3kEnKR1
	8eecTqEq1/EC/yIS1Q50mtXkNtLyZujhz7opLoNjh5f2S8NAjO0KTS4Nx72xyC+BpPaiWoDq4MY
	oQN/cMHAp6y4WXMQHjcnAqGC8mElU6uJT5bQ7
X-Received: by 2002:a05:622a:1c0a:b0:517:c6d8:780 with SMTP id d75a77b69052e-517c6d80aa4mr46189931cf.56.1780992040225;
        Tue, 09 Jun 2026 01:00:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0a:b0:517:c6d8:780 with SMTP id d75a77b69052e-517c6d80aa4mr46187951cf.56.1780992039523;
        Tue, 09 Jun 2026 01:00:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm63605930f8f.34.2026.06.09.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:00:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Tue, 09 Jun 2026 11:00:16 +0300
Message-Id: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDIJ2oC/22PzW6DMBCEXwX53I38w29OfY8oB4M3idMAxWust
 Ih3r3Fy6IHLSiPNfDO7MEJnkdgxW5jDYMmOQxTqI2PdTQ9XBGuiZpLLkhciB3zYXw3GE0wdAYY
 vqC4iF00tZFk0LOa+HV7sMzFP55emub1j5zfQ2+FwmmOZf9lYqwmhG/ve+mM24NNDKix5zTbEz
 ZIf3U9aGURKvAcVO4OCAA6VKBtT1VopFJ8j0WGa9WNrOMSToEH+BzV7IBlB2lSKq/ibkfkOaF3
 XP2z/PT9FAQAA
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GUd8KmrY6YvMPNUJd3CYw8tyEqRQsScJ1bSUPwtgd6U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqJ8gZk94kvJRyae4qxbp66nnRVao3x1JpJYWTm
 JYoEahmjsaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaifIGQAKCRAbX0TJAJUV
 VjVWEACkORza5jtsMdTkHUaOOc38bIm3pUuHhLEXNxGi+oggIvVhswL5m6WDZCFtKkmf9i2z9um
 hOO4GKYtW9wxkMIylOK1eddUOroLhP6Susa+Hd/WKst3TMUOm9cM89y2BNRMEexcjXN+Tdsok4m
 2R+sU5wDw1npgfN9oxbkMn4ACK1qzDUPThR07j8CEy+PV/rEzhjWY2HazwEaYs6dliyF/Lq3kkv
 kCsHiwY4chiHvz0GdLPWwfAPNcn7YnIVZm/VEMIJSNmocrCTthWLUfmX8+AsDc5VwVRg0xtfnGJ
 dZK8CYCYoUg0gS8+ShjOj4lcON7Y91vbwPm7Jvh4JjbDxoK1TnANYJZUL8qRPjF/eBxT9UYSpzn
 zCyymEWNSu1s/fkK7IanTNVLri1zGrGJ6S0PAIEML2DfLbT9eZ6x9TrxQI6ACR4jbWq8ynkvw3c
 sopHJkcODxOSv+4N9kJCJfCbfKcIaDZqKFd60NjWZ+P7dQ9pPIkMZBqyLxt2PqDq63dIVtUG4Hy
 n3yoIdwzTWVjZirGJT/UzFqxXHTA9gVE3JVlHpgCAnlf6Kf8zsJzyNpbcyhwsOd08qcaMXSkE9E
 xZKicBufn07kW/lwiSvjP3W4gqKDuIIp40ggwL8WaGw6Eedatpz+dnuW574RnLvrB0IUEgUUYYN
 djB7QOIkNZgTPPA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: O_-aLLv3s99f-RMlAJpkYhD7cdNf6LV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX4omOLljKJAHt
 oQxSWwbymos5ozLtgY56qabWSwWEF1a1rSbSqlJYYs7ULMp/DaYK6ATIkJcRCK80eMM4vMCbgWz
 fnZ5ifzDiIkUDrP4JQfC9/pqtFanzdgL4JTUvmYgFDeWavZs7DuWSIAYzIH0vjloVUjByLL3GIx
 7G8NZKwvCwOq4cMpOYGYDXcCXm3nXGJBdLnPrDZ4QE4AcBHBMcC2eF2zFjoXTrtBPJJAk5YSfjg
 ARWEYtizEVF5HiMkRHmFcoS7Jt907E1zft0DSgzKdV7h+LZJXr3FNJxzh+gXY+lC8YN2nznMl1Z
 4Vmx1gr8Om+mSUERi7ObNkGB/k5AoGVLFjg/fzA2FLPII0TnrvlBIonY048+21SC9LOAS9/py3V
 c9nHAK9oj5176LSz/kJpTe0LdLEnNSsGHPzQ3fRD9ZaVT12Xz1AluFlrbgABknO1QHvj8A2KY/b
 OQaInVWNuDLWwRYbM2Q==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27c829 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VlEDaxusOxULEvL3EEEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: O_-aLLv3s99f-RMlAJpkYhD7cdNf6LV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090075

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
Changes in v3:
- Rebased on next-20260608.
- Moved the gpio reserved ranges property to SoM.
- Picked up Krzysztof's R-b tags for all patches.
- Picked up Konrad's R-b tags for last two patches.
- Dropped all dependencies as they have been merged already.
- Link to v2: https://patch.msgid.link/20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts      |  14 +
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi     | 394 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi         |  20 ++
 5 files changed, 434 insertions(+)
---
base-commit: ea8a803d3ef1bc668d777516e00c3bb478d17c23
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

