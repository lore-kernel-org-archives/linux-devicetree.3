Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78013CA92
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121882; cv=none; b=IZfB+zEOuBmxeHlhHmkIdH84859sizsT+8thms0g9q2p8oWisyFi17Lp0pVPXbub5WM/aZATHK4Yu3TXXcnu+7zJiP14hpHCaG0v5GQlzCWcizDJPhvLJ0BUPVloNtbyf/OgM2eMHsL85UB6thCPibjF8BitcbBY3NtLiicHXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121882; c=relaxed/simple;
	bh=1oJNVnV8beOaRZ1Ot+GYNsmqLMGppySNe2KXhKrBmVY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WgXKjjq4TAY9C9PWM1grMT1eHKr6kZAYbCQc7VTft5vxjHgh9O5MGJe4LMaOWZq3WWl2OF5YU5tTvUZNZQwnSs6bfq8vftaBreEz83KXwQSVzFUrQeudVj6o0gHylh4MURQTi+OwOaYPI3HJlGdUKUs7OwIXkGTy63jPvKgdwrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lamUCdUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYVOj20q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lamUCdUK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYVOj20q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI77K11873652
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=waCzY2zXIz2kJx9LDaqj+2
	979FNXVnLg8fppO1NrYSg=; b=lamUCdUK0NOUIPl1+S5APIpjT7kXgyy4WXAXBD
	HrgL3OA0n9p56gBW1H8HHGAfLIv4rpra1IH6S2C1jRfn89UGaGK/gGvZtPYWaKnH
	nYZhu7Q9Dhb1RKB7MPUW/oRNnf4hIfWaj/S4NAlN27lcJQ8oO70Hj1oRrcstPpVN
	9vSmgAEX9kyMtU6tJ6qTojoMQXxRhnBznI35Vsg2ROUanD2jcpWIrEKKALa7cLVE
	eSLtq3lzjn9ccgLGdSt/i/3yjJpjFPuXGOPyq7NLVhHoOJxkKyHrmo/HcAACP+wN
	eLRjP3TL/6T/3xw2AAXJykdrMNdrQiVoiMn/qZt3jTpwCetg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4unx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso565609eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790121878; x=1790726678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waCzY2zXIz2kJx9LDaqj+2979FNXVnLg8fppO1NrYSg=;
        b=LYVOj20q7lMFfIDuA27vukYTC7DCRePH+Utspd8vp6FuyQG5OSjXCph2+qJEF5BONa
         mdFmSTbqTwhxnPQHJL755FCrCEPt17/8R6xOivetQcWs5Px2XVpATMQELsEiwoX1sIfH
         TENfIZwsu3wmLzsyzhFSzFWz0Utm08/NxsxhGm1+gFxiv+d03rvdiRY/RUzcKUv3YjyT
         a6D/9sWYHFj+z/XpFcUKJ+PvV6kxgmUI3XGt1Fi5fXdijzr80pGDlNNyJxJtbZS+5OaC
         wRJR3t5OjELK2kzteshCtFaGwyMJg3l5eWjdxDx2FScu467vJnI5QGFNRw5gndjpAXsr
         bO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121878; x=1790726678;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=waCzY2zXIz2kJx9LDaqj+2979FNXVnLg8fppO1NrYSg=;
        b=Z/ALPqOmYnvfSeGTuYiEW3cneeUqxHr6iV4PUmLjhb04qonhX3qk8dSf8lW3q+ZX0f
         FxhOC0wOPMD238rD7m7pOpI/eW/7VY65GcK7IaW5o32Rn9tsC6xw1oiL5E9mCfnT+Qo0
         J/+VvFpJzhg+XNEkIoCAgKh3i6jUY/pyxL38mJJXq1x3pTDziNd+UQscykPIdLOx1por
         HTXC4mCOG6JuIGTCej1e9LCViIXVY3AehkzwfsgfOGAceRSqynbljZLEn73o6CQz0r9Z
         iXvKNIfkmm2Ayp3SECRS7Lx9EwVPThJqdxA8JPPtk29FtG2eau/EZNoi5Qt6jtKPj66c
         Nilg==
X-Forwarded-Encrypted: i=1; AKwUvBxBKyVmQJNZekWn3xG1+8KWvp7Xyx19eQAk4vh2aETZ/wdqxEY7fxjB4IdbtqAePMJZMQZl8J3SmTot@vger.kernel.org
X-Gm-Message-State: AFuF++n/OsZCFm1QdsDf5uKRxMe0taK9CwvE3xSzopEgUVJMw4pVmzzF
	SZsNKp5GK20fERf66W1FTqkMcg8SN11AHZmBkTuH43Z9yHeBSCNhYw9IODPQ17IhKJW7l/IHhPA
	QePoxUEmg60cYp5/6CfGETYt8NB7toHxq7XDreWgdHP1fSF7AylrJcOH/l34WvkzicKXWD86y
X-Gm-Gg: AYBFou03UGJYIFR5MkVQQRzGHCJxZYZPACv3OBSUTZLC2XRaxjeoffzeOwp/ZAa3JhI
	9x89Pt62ZDIVBMKkp27L0Y442eSTAmbk8Nw2967QyoZcA1ktW1xDgzNoT12jm5nQzJAbDlgYbTL
	xVzMtGxqoDZDK6DxEUf3xuGI5M8fXWJYi/rvSDtc1Ursqhch4XJ/2URDTLP5gvHX4+hs8JuSp/2
	l7Z13H5WLroJrAhpqYoDFoOWP59Mkm43+t3KygbebeDNOlDR3/AtD6Hr0P27ZUxI3yUliWmynEi
	JGX9DoXggOuq+3M04HrfC4kAxPhNCwIkofClZDoG62MpOProyR0Ve/c1+LnvFWyVIP0gee1wGfq
	Gf3Z/cZQKIc50SOhUdzGb7AAFjct2
X-Received: by 2002:a05:7300:560e:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-33e8d8d2575mr986119eec.21.1790121878296;
        Tue, 22 Sep 2026 17:04:38 -0700 (PDT)
X-Received: by 2002:a05:7300:560e:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-33e8d8d2575mr986092eec.21.1790121877640;
        Tue, 22 Sep 2026 17:04:37 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm1688347eec.1.2026.09.22.17.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:04:37 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Date: Wed, 23 Sep 2026 05:34:16 +0530
Message-Id: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAXs2oC/x3MOwqAMBBF0a3I1AY08b8VERHzotNEmQQRxL0bL
 G9x7kMBwgg0ZA8JLg58+BRlntG6L36DYpuadKGbotdG+UPsjLhDPOKctEVQa9U1ri1rZzpDiZ4
 Cx/e/Haf3/QCXGnkVZgAAAA==
X-Change-ID: 20260923-nord_ethernet_serdes-c486f715f383
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790121872; l=1845;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=1oJNVnV8beOaRZ1Ot+GYNsmqLMGppySNe2KXhKrBmVY=;
 b=Cw/3FJe1gx1Yrc0iplXbdTlz+ALOknKOL/xoeIcwIpW9fZvXg90sDOj1nOebhwTIaOtzmsK/a
 9ryl+FlPf92Due5QmnPYqcRtDJereC9zIqjgkrsrssMy8fkB26XDIDR
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfXyXXik13189CH
 d6e/n1QBaRqOwlJwZqbthakrfuk0HUkFxmZA2CCIO/JS7YYt1/X/jO/yGG3rGdB5HxVw/PdP7x+
 zezGN7739GLaxaCed9+P5rMNXN8g+E3fNvOd9lBNJLJsJBUvShlVzlnrpwVO4CNeDkY+dSfBycU
 Qr70671i02vWZZq78Hc2VRGmquyO/lzttZLXpfHteLHnZsQ3UJDgNdCmHwgzXj3e3BNJPyLBwzc
 eQuKPASNruQWxxy4LwDoj7A5QX4bsqT7Iz3mWfLFHu2qte5tVf8l36HpH/PFp73ptSo6+DPtjP9
 Ms7sGSbEJvG0L+Xlir2g3VpyWPhskF3oQMI49IxxVdUf9kG3+RdeG4g88x+cziI5rF/US+AF+jv
 67OF7/rF/4wzlS1F3j+bUYpvp16InFr6tIzI9SKN92lnEsW3J8Fq9vbQhbV/MHYsm5x7I3p1yLq
 q6riDvcpFvNM/N7PcRw==
X-Proofpoint-GUID: VoYkHoMVdjRQ6MmheNY9KajmgWk5nxpv
X-Proofpoint-ORIG-GUID: VoYkHoMVdjRQ6MmheNY9KajmgWk5nxpv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX3gaO14CUtUTs
 ISZArFCBvumJRp2uSqw0ql8+KvAcdScbIyp4TrBqkNYqr+jDlbo7leqDr8WB9sT+DwwirAYsAVv
 9nL381T3ZuxLYbgjtm/EXJtSM1y9nYY=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab31797 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKVqoz1RRV_EfAR0khEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230000

This series adds support for the Ethernet SerDes found on the Qualcomm
Nord SoC.

Nord uses a QMP v7 SerDes block, which is an updated version of the
SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used by
SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerDes
to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.

The series can be broadly divided into three parts:

  1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
  2. Prepare the driver for PHY modes which require different SerDes
     programming and readiness checks. Existing SA8775P behaviour is
     unchanged.
  3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
     sequence and readiness checks required for USXGMII and 10GBASE-R.

The changes have been tested on the Nord Ride SX platform, which has a
MV-Q6223 switch, running in fixed link USXGMII 10G mode.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (3):
      dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compatible
      phy: qcom: sgmii-eth: prepare for additional PHY modes
      phy: qcom: sgmii-eth: add Nord USXGMII support

 .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 ++++++++++++++++++---
 5 files changed, 219 insertions(+), 24 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260923-nord_ethernet_serdes-c486f715f383

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

