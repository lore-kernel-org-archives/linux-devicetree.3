Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456698;
	b=XrTatp6BBhj3X+5X+i3DcWG8xocM3pahNV2/EKtRfRyusuR85hv9HhrvOWsYbi7Znmuw
	 3IoSmUusQtw2S+f/0NgSZGlpu/soPiSWjs5qsiJT0KpVbS4uWosR6qRzCT1uhTNQceGtw
	 y+w4aFWLMF+KA1TgVaKs+pAq1NSL/QdZdJIs4aKGQ4RU9Sn0zJgVW1uLfw4h9yP+qSQkC
	 ttGGWqOsbKq9aC9VBvXWc4wWsikzzc6t4HRWdxjRIR20nTHy0KBJDYlMNyJyHw521XfEL
	 s254ojuUSkPq8r1qrF57xV9q8Pjiq9L21fgQwS2yxu67e+WEMOipBXDt1g1/qIfI+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
	b=G3LvV88q8gYgIJ4eF6E84VlW9HcVAWgRzMTt7fVrgpjFSNFemhGYxAOE3IiKdTAJ18NL
	 c+S9YN2ZbQPHQQJd9cXA9B6um8SmU97J9JFJSp+HvUEiTvxtqxptH2pcFtosV22bZkDTy
	 UEvjc30BME69iY7bJYJdnUNAoplDh2p4QNUgR8Ec00EqDdrmk1yD/s114zHTNEEW9vo86
	 I7ieOt93mkcp7O57vpugFglwz3REYRcenl4ozByl6DFwWhCCknafolTSY7sPda2hTtxO/
	 qcRrgJ5Pwxjy8NhDmEvI1dSbG0oYWxEBndyMpXQo16bQ0hPk4I1tP12mwrMxzrnI93g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KoQDbi/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDs6zhtR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608D606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7608D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KoQDbi/f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDs6zhtR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02tn3174201
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX
	0P5nunt8=; b=KoQDbi/fgIKSgtoxa/4x6rDVtOqLkkESWPcVGOZyUKJw9Ab63w3
	4/RFYfAUdvcum7nsF9GWW0EIC41whV2+1KuqFof7LRIjRE1a9yxNZkDnZ4oyY4Em
	A9vSvWil9q/dasjiX1dFyZC8Qk8FTP6feaHiu2RmfNWqPUpQmo5vUOUjKM1wFWEB
	0DmxnRagySfszvQt8cKvvUB7ZfRdVSMgZem91y/2uuXIrTfrkfVZmUoMRk2kkBrh
	2+fyoIwP+gJap8Q+q92B9AEC+kzWeH8VlD1jlHPnojYllUTo2UXzMdPTMmUMfvVS
	xqM59tl9/xV4yJjvaJejUF9NCbNS2AAus7Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fskmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:24:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3707526eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456696; x=1794061496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
        b=BDs6zhtRm9qJj5rFsI2LiKnwY9iEFcmZ7fFgy4nsWkqxDPIMEjJ1eUCRr2MH5f8aFE
         GCdPeKr7BT4SO35CaDw4wuYbgraT5hZQQGvk/HcBJ45sWdb8XH9NyAqf5sJ8FuduQMmc
         Du7M/WuuxS6hWYfeTali3J+s7N5599T2axw+KDWpitbhAtg7oorAVIBXzxyOT/yx5EVV
         RrHRouIatQwnY+pSRkArPoN6xf14CQNuujg3lk80l2pcpudL0nCJ0/tSczV++gpPx+YG
         Ywz9ehFNKH3TTaUWHHnCWbQNxtpblTbfRypwRD/Odo5wB7clQR10r25wjDW+eEH+EZsR
         m5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456696; x=1794061496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
        b=eEigYnWWaM+RFPBfLUA7FD5onH+crEYVxFhkc7fsE9EfXes8THrTPtY8s95fRJ8igq
         gYZi3DakFKchTUs8Wp7JnoIM832LisdPhVa81C0CqDPxcrdec3fDz+yh/POSa9CgK3ZN
         unf76+FYc6EiLzRbkEZnQsRDpKPzvLIEoIjBYrRT7vSZkQU1+hk4rNOj2xVi7Mg8SEzs
         K20FKQHq7fHYQoK51PWT5W/htY/fdYUIIUFHvdSjVWm5lRJyvdmmvwMhXU7IQY4OF+Jl
         mUrzt2xOe5Bq6Y62bldsWZ+xY2bDKRc9ijJgrguUmDKCh70SStQaSj6AsRfKHx7XJLou
         lF2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIbSUz/5SXQ5u374nZwGbzoF2UTw+YFquc4k5bUF9m7Pr/Xc5A6eEkvx02qifupoZfA045gYDtLFRb@vger.kernel.org
X-Gm-Message-State: AFq9FYIbMXiZXoivRBbAorKbtx/sLbHftOxrPkz7BsZFIaoP9hOT+BDd
	eOG7aHk4WLG/1ksIWUJpYe0l3HOVqedXutJsDGwzwyqN7zc8QuwB+kvYX2RybQUlJuXxXMBNUqL
	+owDICqlKqqhXRHoDg1ArFyq9Qm+51LBiwBlWJgzEX7DS6S32SdD6ALB0OTDXiI6e
X-Gm-Gg: AYBFou20AxEuyToiSkAvnlxP98JnwLVWRquyeKDdriOxOIklFr1UA7C1YDFU/SQ2pzk
	YRNcni/D86ybjFLsW5V5gGhpPEnjyikqzVAkPVIhLi0jZ3c9514+PzL0preFXi119pvIhZ9E00R
	oxwUiAhbmloYVf76AdCbkEy9hWviczZCD4GS+Xw0K9jvDmLSe8UaNTlj5hnJWIXW1LWfSibK0b5
	3spm3ztshcd8bBY4KoqfOe5wBBymqTNRXl0O7YuAMsxQOw9uoRmHMIWKgbwGdTCizkEpMnDkVtZ
	9kSh+jueVt7qXV5CY5cuMYNpll0rMrBftl1pOseOAkZfm7JjWHNQ51ObEQ+lZsn57Kw8e2fRk2J
	rrRNsce2TSS7AKzrw46xbnV/V6JZTe/Y7mSoFRnzfrv0KZJUWbA8KhvNNvYPV5n5ICJ07WVaxtC
	cUJdMeveMFVgtjGfEBZetWa9hZlii5sxc3
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr11365603eec.28.1793456695685;
        Sat, 31 Oct 2026 07:24:55 -0700 (PDT)
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr11365549eec.28.1793456694941;
        Sat, 31 Oct 2026 07:24:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:24:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 0/7] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Sat, 31 Oct 2026 22:24:26 +0800
Message-ID: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX7kzfDrHyyK3a
 E2LaRyurvCkLsnyejg/yJoP8S1OGh7mk63WAkeAO4nBzgUw6g36RTw3XOzLFvVUaXNBjYV7yg5q
 4w2gbfe4JPgwO8NaI7ooC4CmMHJ1jKk=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5fa38 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U0NwJVSz-9pN22jjyd8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: SGuUD1lZqXVSBeUHVygtfgTk3lPz_328
X-Proofpoint-ORIG-GUID: SGuUD1lZqXVSBeUHVygtfgTk3lPz_328
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX6qrDQ/1SUgeq
 AnzrX5WWVxlp9IFdSL2Fam1nn5P9ohYJQTMMSw/t3v6P2R42pCduBGqPe43LuOx3mIHks+M05t9
 bil5859Lm+G00kJPg9d/VipRv6oJNJna8dAeNsNnZfe//M9eQAe5KWRiDsnGRVvpgzHdmsdgk1w
 HEVRaBYCiq8FI713KbnVB72Hor79tRlsjYS+U+EuBm8Cdy9D4S8rKFB1ye0n6Bsig2fjrnMMtfq
 IdPQCWlewp3l6OSulLdiVjlK1P6CJOiJhTZCKjP3+kuFqxRyAMnzLiRYZu/Y5/lKvw58eT1nHyt
 m/0QVX/+VdL0VPqJoy4poWto3Q9IoD9J3eDfYROgqE3Lb1YRZ4GTbYUhNEKHmqBTfEcQLL44Gxb
 LeGzc9V8SIcITDI5/e9NEgo43nnCUk9W1aYu8hb8Jx7HBL8o+9L57K68x5OhPM5yEwuJojlzMKb
 WrxDFhDLVIpXK0TAeQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride and RRD board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Dependencies:
- [PATCH v5 0/2] Add PCIe support for Qualcomm Nord platform
  https://lore.kernel.org/all/20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Correct pcie_phy vdda-pll b/c/d supply: vreg_l1e_0p9 -> vreg_l2e_0p9
- New patches for RRD WLAN/BT support as RRD boards with WLAN/BT module
  become available in lab for testing
- Link to v3: https://lore.kernel.org/all/20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to the unresolved dependencies
- Add PMIC E GPIO7 for enabling WCN DIG rail that feeds the WCN7850
  VDD_DIG domain
- Drop RRD WiFi patch as RRD with WiFi module is not easily available
- New patch to add Bluetooth support for Ride board
- Link to v2: https://lore.kernel.org/all/20260915015632.283642-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shuai Zhang (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
  arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support

Yu Zhang(Yuriy) (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 179 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 179 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1577 insertions(+), 4 deletions(-)

-- 
2.43.0

