Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BE48125B
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946196; cv=none; b=m3KN7O+aQguSC16jSh6n4PRYBeykJ1Zs3zufYA/GjqSxuPV/thjl+G+wbEuO0w9mOvufH26kTg0uXMAxi6yQ6LVeu4P2eYERcuYoY4IBu50mqng7yMrerY7tPMTZPVj41qh3Q7zyvqLusbfQuR6YbSfjAYRU+ycWOfhO7RUfOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946196; c=relaxed/simple;
	bh=G88MQNCCk6+2kZL7bQs1s3QaPljp1R/z4iWolXLINHY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qC5BavgNvywreskqdiTYGGQJidOuvr8shPprFKmLwfeCN9ZOa4OTMm9ZI0uDz0dC4WJ8/w2Ti09T3XdgN5oZviwHmqo3yxwmg8oJ61JDzUstte3epqUDx6GdGbGIp8ckw0QhGZPGuRGWdWJbrGKcHTjZL+45ie9MIq5PVaJsJdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6Xo5hkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqrIVLSV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6Xo5hkr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqrIVLSV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nmFS558019
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 13:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GP30sOCRIKoAeEz/cHgB2U
	Qvyt440qgWZHWaH/mf8u8=; b=R6Xo5hkriee5XE9TdlSXmvkMzS3TvgHZFH4Dwv
	0gBCJ3mkLJLkPJAOG2WfTKHpoQJpVOv+X8bv8oWFs7jMU8VjomAvr3OuAct48PdK
	1PJozOtTz6aX808DI6mG4CJnp6qf137aXUN6d1TYuOs9aHQXxlxAHMdlgyZZAKxT
	x1NtSH6kJ+3jLFpcquPVvYHGwd3jZHoPKc5oX+W6SisE9w1eTH4E8kEh5GXV+6Si
	IjLwsrjM1OgjZfAesLzaHs0nUMMTVuytNOfazxptGlJvXwIm+pPZAEd/2GWdxRj6
	jjvB86RWK+kUs56dl8DV4bwFrmn0ytUEi0TdeX26z8uhz4Rg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgc1sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 13:03:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso10544857eec.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946190; x=1791550990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GP30sOCRIKoAeEz/cHgB2UQvyt440qgWZHWaH/mf8u8=;
        b=gqrIVLSViU3ytUVEFVVJLz3GXybrebehYmEaca+6dyagYTfbYlrulx4WssxmjsUZlk
         FUqw38vPuiWT2MAD35LVw2AzTAu2qfNUnLUCmy2qgyVk4Ukry2JAr5xFXkgQXaQL7iY3
         uu8vJIckFMnzVKF/5Stbtr0CbmCBL6wmSWmIUqPbs3u77NGP22vvg2X5pPv6PJXvKzrA
         CsOpOlUlz7HLG1p88SsDFhVY0AUjHJBEEq0xVNnesLXRedQq13d/PnfjOCpsKRywSMVi
         XTqUI+l4ayTQhBkxn0qeJrkRFQS3gYWOu6zHCd/OYbx3zRFFZ8Vx5Reh5dmml/1qgd9U
         7B7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946190; x=1791550990;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GP30sOCRIKoAeEz/cHgB2UQvyt440qgWZHWaH/mf8u8=;
        b=TZm3hDdKyGoGwkA2IsN1gKDqJ0m162ufJdq04Bwkmn5skDuUAQy1jPae/0kWuCdS69
         YBBjX4GG3TQjVl8hBKygtJQBRlb5S/m6i+a5jfbyen7aUKGKh/4Ku2tbX6kB3nyEBGQo
         dO9lJCavAFg54btLOlwXdlI5T00/g+B9FYrU3qwxowubMeg2a0bOU1DgHR7Z2jMboGgQ
         s1mESD2AjcFtWVCVPsKg96hGkgWujxqlRlIajfbrVXgUqEDWPs/x+5dioazhnqQak79a
         eJ/RS0uWll2dL2MSr/Cn+fRqf/do00R/J5WiHvK5W+iVu1eQiab8d8ww/Y98r+F3dvtK
         tOfw==
X-Gm-Message-State: AFuF++lsiJYFCUZVsnY1l4mZ4GrbT2PZeJiP08rGy80rvgzWZBdLD1bv
	58pDGILXP4OZoIwGS+FDNHlsez89n1Y0x222SRciz1u8zPFkk0F/YypyTGFyXasW6VYtl2Buood
	arJryfW275DVKjC+5SnC8AT2QBiCjtrDjwwoIaaWmcu7RbaV7Rdqastr5xmrnALkl
X-Gm-Gg: AYBFou2LI3fAhqz8UumDg4iudIlUOXMCsj0EMTbv1rDGw1QajcFPDMaG5aNIL2FF3JT
	6Oisg9+Thf69MQTa4op390oM+WaL5xLHv+uOlHgLKkNZU1ZKtmkiaQwJ50OqLEvnGkBeRi9hd3Z
	it46LdsHij6IZ0JCZ9NLGlh+rQokuRKFU1Qa3QJFHJzFthgj+QEBf5dJUQ3AfFFg7aq4IHFjY36
	gmoaBanSHF+2a6PMDejeb+s0tlrc+VaUtmiSNBqVTeM4HGh65htg4lEIUgM5kH7vsTMn3fWVdTL
	uMMglqF7ba0LQi/LbPsi9ZadNF/vPEcxurBLtJPZQza62Dh8ypt4ZCfuehf8W0inhlTHa9jwGp4
	st6AdTTBs9glIZZoxymvTYGM1y1XMSuQcIGfRbe+1uV8t6H4PKyVMgLXLvmHDhZa8tmrfH5I4vL
	ob/5QduLURZ6Cv/QfWgVi4EhdZoE++5dPDdw==
X-Received: by 2002:a05:7301:f2a:b0:343:fdea:998 with SMTP id 5a478bee46e88-34f150e38fcmr2658517eec.19.1790946189360;
        Fri, 02 Oct 2026 06:03:09 -0700 (PDT)
X-Received: by 2002:a05:7301:f2a:b0:343:fdea:998 with SMTP id 5a478bee46e88-34f150e38fcmr2658491eec.19.1790946188750;
        Fri, 02 Oct 2026 06:03:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Fri, 02 Oct 2026 18:33:01 +0530
Message-Id: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWrv2oC/22NQQrCMBBFryJZmzITSCWuvIcUSePURkyjmbQop
 Xc3rVs3Mzz4/79ZMCVPLI67WSSaPPs4FFD7nXC9HW4k/bWwUKBqMMpIHyhcEnG2KZdvOQ4StdO
 t0Z2x2orSfCbq/HtbPTc/5rG9k8vr1JroPeeYPpt2wjW3GRAA/xomlCAPptNYG6gB4RSZq9doH
 y6GUJUjmmVZvontxmXPAAAA
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX4DziNugEeewr
 hcn0xTW9K29XP5AzflZp69hxV4BQEyB2ZHcGTzKg9qSUmHdY+EsaYUzv4JXE9ar7L4XeXQnbiyn
 a2cBibnZ1LEdzmIfqfBnNscPC7glpoc=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abfab8e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=BUjP7g0EBgjMYpCN6FUA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX/nZrGqmlQT/+
 Jn8V8NNFj/Mp85ABIVhkHSarOskKHn6HOZNDplwFDDTi2Szf1xlWfRLwnwiknmcW+0bnorSoecn
 gjIfO/yTleWzgZ1VU1FeCIvUfSdvBzczIGQw0CBIpm5mS9ufQWheny2lN8MxatJLRNQ9+fwUZnB
 eOMvSFsT76MPk6dcWn71/HseizyUzkPXuz2Fv2kf4mS6LZi0Py3XsJqZbgPG8sgvTEXiY0K+Wus
 DDbYzh3EUKqZam21rh4W/ob0Gotu93jp+jm+GQFFCLrH5OwJrqXGHebadof2+w4G2vBH6KA44bR
 +dzFJCqhklnXDIfDPKty9VJL5o76NPj/+tHD2Owe8fUwr36T4mfvLBe9U76a9PW2SJlQuwJK8Eu
 sGFY46TRrTgzoow7VWMSaExXCcHfW34MCalbJrRsFNV7+zqOlomC2yUhAnqjuNuCTqnHryhVGGO
 U0NcUsJ45LKgpB3wU4A==
X-Proofpoint-ORIG-GUID: _lKGXWAv0eOBFtk-5AGZ2hU-tfhnPhpN
X-Proofpoint-GUID: _lKGXWAv0eOBFtk-5AGZ2hU-tfhnPhpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      arm64: dts: qcom: ipq9574: add the IMEM node
      arm64: dts: qcom: ipq5332: add the IMEM node
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/sram.yaml |  2 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

