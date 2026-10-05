Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13E9377A9E
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193714; cv=none; b=NgYKpHLRS/DcRDNYE7BRhnnMALYWkfpVQTK+jrWsG9pqBxTYu5K6uQjwSKSRa3n6qiz8J78tMLA9ucOqBdzLHo4k4mHlk5lHJlscqvYvayHHMkrtWbWONvFtnHRrNPnVXPym5Bfo8CdO/n9EI6YodcbLO+NS57dOEVPi7kNqrcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193714; c=relaxed/simple;
	bh=z9ZKfJBnvHjkl0/CtSeNAQyka9+jUFUILVKgLbgudgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n2tJgbLMV31E+Q5rbGxXzdi8t+jkb6t3OZyVov4yMkMVr1CNMLlAeJBnSQkbZdShzbqGC0S93X892wESTuXWzoAmergmpiIbNqg9pK8+Ephboi7Y8ervYPNsHcdi6dZG5/m4YoyfFVIOGvJMy3Ckzdbi7haVhYxhnptzhgAd34A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPmdwh1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6n3OFuY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPmdwh1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6n3OFuY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xO11047973
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AT0s8lSVdlJqvZFz1ZDNTq
	fDoFU3JFa5rAxP6+Em7Jo=; b=iPmdwh1s3f/KG9XykpJH+iUaEJwmFTMJJ78aAg
	DNmLKn1fIWJLZzPhGWNXXiXZY+MKOrdbS7/zsnSXdfMA53O33+xXPZR14cn4LyTw
	5jcnTPSNKTw5MPOhOc7P17kexD2aFdegzSrPOmTBI6w+juNEHNnVPSyuoqPc/vPf
	PFt8Z3oWqFDBxmcjK2G6m3NPLuv8cfDg8QidwOxWM/HF/24f5weK/0J3Y7xbgQX+
	3N0N7vGcLLqD7QStd/WWvjWBr303B6rEoDQdfsLI+RhUrBjobZQVeKILosaZ34kF
	nY6q2ue9m0oBWyxYgGan6OJr7pKO5zJI6cChNnT4Vyi0LyHw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvew67u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 09:48:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so1045902a12.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791193706; x=1791798506; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AT0s8lSVdlJqvZFz1ZDNTqfDoFU3JFa5rAxP6+Em7Jo=;
        b=K6n3OFuY+iUUGYrO1Zxb1U1tSpBwrKs8tfbGb9R/Lea2G3U8C8Ks3DbKfCUbpH1oDY
         WpSSFChbQdwQdv5HLNiEQ5TawkJ/rRpz5yUEc8kunMfj6yHx62gZPyl3DJwQeaGvpZEW
         MHro+pUGD1p/WUzInN2Bd57Ikc1TAOyLuS4HPDkl6UFUonqxmOaHlSZc8mssL7uuSU8i
         pCzcUy09e6PhqbLxurjJCfMdbytwDkful2y9Ipn65HaLyHJLli2wuwFxMScQ0szZ+mPS
         u++x/okKGMiuCWxy7Wywbm9AF7+mYLHmVPsQ3agX4fklQ81qVxrIHJUcTRhIOpB014Qj
         oTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193706; x=1791798506;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AT0s8lSVdlJqvZFz1ZDNTqfDoFU3JFa5rAxP6+Em7Jo=;
        b=mqSVnHHLN9RH2ioYvOHiQ9zfiQeJvBqbZOdB3B54mbrRrfFzKQUW05tmvUYN08qV5/
         CNbVkdhCx9TyDgOug9T8wMYq2kRsUWu9CiQ/6Kypxx4P/CgehomcLkpNF+asmLhjRlI7
         7TwhtmN9oCJCarWpTHGnnwXhT8UZ54n0pJ/q1Mwu6DY2+pf1xU6qDYaos1yZ9juPPypi
         Iea5LJRmZLr2HTfGQlifqe3PptC7Tzor93G26SJE+oNjhRevag+u5cKMiysEzp393w0B
         FcSCrgoOCwkFvn28K6SNvBRBAyCEEcJeiF5fYfSps2oNgzllFFkLfKybhs3irivI5QbQ
         1DVQ==
X-Forwarded-Encrypted: i=1; AKwUvBztvAkFKU7EsbYkcIZT6IVjoq7zIP2kkAHgze24avgCZdvqFsyDdZj/yvhz4FCemwx5oPkhc7+1zLTb@vger.kernel.org
X-Gm-Message-State: AFq9FYJADw+68f00lRchh/imnJvvTqBNxwhmNUcrJqEMoXYjjUTNEBtO
	b3Vy7tpbbqMA1N1uHtgErsB5OSHKV+3S7NGn2HIc3kUGnkLkMrjvE2H7AFujGjhqQvL2uhe5HJc
	F1zQLTTxe9pXnRXHX9f6qhMirpuAaGj2ldcTqKJ0Bywz/m0D48fifSNdz+OoiBgAr
X-Gm-Gg: AYBFou3fZIcoErserB5jdhH3BK4G+CwgMZMfn9i+/Fs90aWRABPNVrtAG1uGLS3Fyks
	ewqQxuW5hxSviQrab83N6mUORmAlqu1fh5NQDhtMS64GfhMLnvMBDy9MWIWSOcCy0AyMXP9iQok
	l3rqgHyOxwoAZjnyQBRHqzwqE/JjBg4GhkAZDhOsoDplN3o6PLOo4wuAolrkVJcjCafTRqHtJIM
	pHwyJrTy5mkm4rqM595jjsDz18YF77uqr2jgGP6GH+7cxMBhI9QM0WJ/3YK99L2TcjpZCKo4OTi
	T63tLGMaT7KbFQvB2TsuQ7jSBfwwBug6Noshe77w6OCiIBQ+P1JKWpWW1CNM23PuQ2toebPofYe
	ocwErmEm85YHDtYPtF7tYRCAT5Fb6Qg==
X-Received: by 2002:a17:903:986:b0:2e3:39e:188a with SMTP id d9443c01a7336-2e49b81f81cmr86730665ad.60.1791193706221;
        Mon, 05 Oct 2026 02:48:26 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2e3:39e:188a with SMTP id d9443c01a7336-2e49b81f81cmr86730475ad.60.1791193705714;
        Mon, 05 Oct 2026 02:48:25 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecbed5sm4751605ad.47.2026.10.05.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:48:25 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 15:18:09 +0530
Subject: [PATCH v4] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-bt-wcn-clk-enable-v4-1-efc9f9be9119@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFhyw2oC/33NTQ6CMBAF4KuYrh0zbQGpK+9hXLRl0Co/SgE1h
 LtbNDEu0M0kL3nzvYF5ahx5tlkMrKHeeVdXIUTLBbNHXR0IXBYyEygSVCIG08LNVmCLM1ClTUG
 gMsIklTLSmrPwd2kod/eXudu/s+/MiWw7QVPj6HxbN4/XaM+n3j+/54Ag0RClqY0yira196trp
 wtbl+UqHDbN9OIbUnOQAA5rrVChyGWWxz8g+YE4Ip+DZIB4GOFxIo0S6xloHMcnROLVcF0BAAA
 =
X-Change-ID: 20260925-bt-wcn-clk-enable-9de068334aa1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791193701; l=2644;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=z9ZKfJBnvHjkl0/CtSeNAQyka9+jUFUILVKgLbgudgQ=;
 b=YHlbBXsSKKZFtPOEVYK/CN9/MWG9yZm8hYxXZUKRDRs1dad3ZxH5w11dNfSYCaGZak5vX1CBL
 VNH7OLYny81Cw2+xy3jkx27QRkemwQaxQuMRmruaYhKGmSGldjTHgqT
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-ORIG-GUID: IwveV4iCtOzwW3PWntwtvCEa_LsNXcg3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOCBTYWx0ZWRfX/s2DcqKFtfZh
 +mKqNv7BtB2zfGnPBKn9GGxhFsztKV7iSsddRXcC8aZNyYmuRENtOfH2/VePRhfEOStg1Ft6nWp
 Li+D1y/F5wvdfyxOFVDl/mpgztHtV7E=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac3726a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=AAjP_CEppu18DpECG8EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOCBTYWx0ZWRfX1e5x4wpuMXSu
 3GOq045LILyF0z6Z98WfMDI7K1mLTglw3loamVRP0HKtCw7IoT8mhg5hrCUrF/gojnzX44Oakg+
 TW9a14FSWahnTTAl+zx5P46rxKflvY9ZhhLkJ6Ma/+2lvGCQIQmw4cyQ8gJSQi18CN9KhHLF7N3
 Hr8vtawqgyZqKTpPjFBKebYpRVo6l+2xzhHWmNLJAjxYxZ9Kj7Uy8sEFL9K/3r7D7kUhOiKTTQd
 Q4K63L4azCkHVorMbK+IJU0uxMb2xdum8zEUcG4gYPWJu4phoj36nH3RnMqxwouLuR/RX5GsXr0
 3jRFjioqNTOK+uPUvQLGTU3/JI+F5m5idSESQYSOHeprmP8uYC4ggS4pTcjmTfHvyo8m5Kwj/U4
 5fOVc443IT8FmIMNGlHW35Y9OF29TVpTLfqzc6LdvbW7+16CNm9QvZ8uqJXzAdlohNbWOe0KpvF
 Qll/gZr7iTEWsSqwuwg==
X-Proofpoint-GUID: IwveV4iCtOzwW3PWntwtvCEa_LsNXcg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050038

clk_smd_rpm_handoff() votes both active and sleep RPM resource states
for every clock, keeping them non-zero until a consumer takes over. On
Shikra, the BT WCN clock was surviving on these proxy votes. With proxy
vote removal on QCM2290, the sleep vote is no longer held, which means
the WCN clock must be explicitly declared in DTS so the wcn3988-pmu
driver can manage it during power sequencing.

Place the clock in the wcn3988-pmu node since the PMU driver owns the
WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
Changes in v4:
- Drop cover letter description for single-patch series per Konrad's review.
- Link to v3: https://patch.msgid.link/20261001-bt-wcn-clk-enable-v3-1-19291563b927@oss.qualcomm.com

Changes in v3:
- Merge technical details from cover letter into commit message per Bjorn's review.
- Link to v2: https://patch.msgid.link/20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com

Changes in v2:
- Move clock property to wcn3988-pmu node instead of bluetooth node.
- Drop hci_qca driver changes; clock is managed by the PMU driver.
- Link to v1: https://patch.msgid.link/20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..48af2bb87cf3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -45,6 +45,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm4125_l10>;
 		vddch0-supply = <&pm4125_l22>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..90aceaa6e1e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -52,6 +52,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm8150_l8>;
 		vddch0-supply = <&vreg_wcn_3p3>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-bt-wcn-clk-enable-9de068334aa1

Best regards,
--  
Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

