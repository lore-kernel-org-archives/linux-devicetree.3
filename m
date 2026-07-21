Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189833B52E7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622223; cv=none; b=j+3+4n/nXZnW0eOnbpnebLGbFon0gUXQ4b/mNodMpnVMsqb7pv6q3ynp3lkm/h0zGuHUuxnwcqqaBE4l85nduBmOX+kDqw87TxAQ6ALnIusUHcBPH9J5I5axI5DhDhXQnTSTybhbKXdUi7m7+WLyxg1zZZvZE9U3SVatqWg5k4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622223; c=relaxed/simple;
	bh=IdacYcGD3xtUJHQO5lneJTXXBYWWe40tyiy07TVghxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pPQBA+dJRq9m1UVt+H0ctr6iqCGotZu+VHi8u7VaHqCdQUXfCBxFzmtSKyxsjuAlpBX2aVCbccOUoM3m+jyOsiMfVfmbI9GpkBJ8fKAsjfHBtuo6R78Li/DuM32s0yDGSyQ/pHuxxbpEoEYpdCgDml4dymMlIRiMnLpg++NR+E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ1J/Raw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZOsUpsd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ1J/Raw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZOsUpsd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L3xq3o568625
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NJWAl4QaR8sWRyabhnWLw+
	xVs+hhrOsgojMdV2OvA2s=; b=IJ1J/RawMb1OUGmAifQzgWzMOFaOO6703/KUd8
	aeRTomGZEUmvfmFHgaK84xxZCUIP+CNJKXhoL7OO/NF2StlQZLY2iV0X/sDPdQNt
	0j4YwRrcL8Hmq/IBWPSIS2y69T6xs/8XX7so9jgRs4g0/QTLyJnnp3bYgfXm1VUH
	m3vqBePFvWCwTFEkB2NoGpwWyDfRLnxe01s7CtATPu4Rz4V3eVdJp/KSoRrh8Enw
	HwxG5e/0SMI0TJhvwCxFij3kTOzGMKhCbu0RLQSJQ6JGT2jdsKnkRCWNvMU7HmQ/
	lYDo3PHC4vCnN52LK0dqkckQAx6x9wCTqzMBPJlajFhohMdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvs0jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso95060591cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622220; x=1785227020; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NJWAl4QaR8sWRyabhnWLw+xVs+hhrOsgojMdV2OvA2s=;
        b=cZOsUpsd3mde9CHByEiAZFMPH8Uzu2XQdwtpwz1MtKZwPGKxkEuxBbYAY2fiFSe/Qm
         IlXYUAx2jt0oX5u+akycxfAlhxeCt0tw6MyaowPbzQIRPJw81pWabfQie1LTOL3A7H9D
         V8OCGDxlMGlkQwSbUEmYaHJQxIFWKgB8/7TAjU0k/Q/2h0b4i5K01Jmkki6gA2huInzB
         2e/obS/0xjFBCnQLQsqIPV247w3p4Pc8SY2DqmKGPTDU6TOmOU5nZ3Xrjzvu8X36v9GJ
         76mXMWA2YL8w8hbqD35S6lBqJfbcCqpm3KXtU9WEYKkgHY7PPip8/7kny3ka6X0loXSs
         MsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622220; x=1785227020;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NJWAl4QaR8sWRyabhnWLw+xVs+hhrOsgojMdV2OvA2s=;
        b=jUJ8MzYzP7/PEKVxIrd+HxssLFyQcAT5SvBSw1fBVg3QgSwK5n3OvPOHa7htKuKfD2
         D0ZBUM/KLCu74Ioiei7hb3Fuimvni5asBDPjpH9IudDqso1XXt1y6qFzX4tb9M4Ghe1q
         65z6zJVFDTwATtPdLgr14HJ505ECgVTKC2bBq75SN8yodNwcOHt+6a5yF3FZX36khJxy
         Qn7c8/tbJYxBDbMg4GGXxYHTFuTne+2eLGsdVPJ06NRth7fXeOb5P3hnKYmGo9weulkD
         SKz9DPsGKJDMgM+O//+tEhxTSHGzYmloBWIIn/WBfDpsTAcsgRPm3MO+8Sz8HY1SmFSU
         wxhA==
X-Forwarded-Encrypted: i=1; AHgh+RqDwW3aGD8pYd+/cfBwMA0y3lM9Us0CWR0DMq5w5sBwqeg+wfQ6dUZxuIlV6qcc25YupKRkqpGQFA2v@vger.kernel.org
X-Gm-Message-State: AOJu0YxxYYwwXrjCkrD/6BEFkS8wbSnZ4qnuJSKaacb5unlcO8fOa3uM
	yLQ4LW/BC+FR1BgewweUg3WKqhZj/q+TNpbaV1SiVh/E9ANTc58LAyuGZLDLJeiXVxEdW/QhVRt
	zYp911/Ii91loOx5Xyobv8+/Hm2lQ3xKXXr7nDhQyrK1+NI71tVxJj6cYv3hJaKH2bleqxZMS
X-Gm-Gg: AfdE7cnri1IUNS0pjjY+Pp+uzxzpzFnmwBZREKwwYuh/TlpSwhiTS0JFiPsKK1QeIYt
	h0DVAa5I/541ukBS7gYQXsWMVZ6Tr0jE4cRiNcMH2yCa3n8Q7yctyQ6W68UFUQnlnlPuTB4RP+J
	ESPnQbGL8LYX5CyjKXIe/bvIqAVSViZpf21ow0FrlS7Xj2HA1387AsEmfsvQq7P6JVUSUqzJuQy
	SX4E/oKcxvOTwR1kDp8xLycp9dsYwS7E7Xxu6xnfO++0J8PzVHd/OWO88co0jHwiaNvV1seGyk4
	2mbB7QFZBpEpRPrNRaVzByBOB+yvokoF+An7dx3EVpwWHGNpeJBN7xuCeY5l4V66MVSzQWHU0o2
	N09o9/9au
X-Received: by 2002:ac8:5ac6:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-5213eb7b77cmr170419371cf.65.1784622220115;
        Tue, 21 Jul 2026 01:23:40 -0700 (PDT)
X-Received: by 2002:ac8:5ac6:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-5213eb7b77cmr170419181cf.65.1784622219627;
        Tue, 21 Jul 2026 01:23:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm38202194f8f.24.2026.07.21.01.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:23:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] remoteproc: qcom: pas: Add support for CDSP on
 Eliza SoC
Date: Tue, 21 Jul 2026 11:23:28 +0300
Message-Id: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAsX2oC/3WNQQ6CMBREr0K69pO2iA2uvIdh0ZaP1ADFfiAq4
 e4WjEs3k7xkZt7CCINDYudkYQFnR873EeQhYbbR/Q3BVZGZ5PLElcggYOdHHIK3gK17a7AVDcC
 V4sJoaYr8xOJ2CFi75/57Lb9Mk7mjHbezrdE4Gn147eJZbL2f4/jHMQvgkEk0Sota2ry4eKL0M
 enW+q5LY7ByXdcP+u3JmtMAAAA=
X-Change-ID: 20260713-remoteproc-eliza-cdsp-07701ba2b956
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IdacYcGD3xtUJHQO5lneJTXXBYWWe40tyiy07TVghxE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXyyC56fkeEERXrJX5IrjaA7s7BA6GulO9JJnk
 oC3bY2Fp/aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8sggAKCRAbX0TJAJUV
 VoMjD/9xQA4efZsRe3m+kaw2LmrFt/WLaN8kPP4S96PFpgy1XWmFup3QdV+cg3tudRf3awc15bv
 S02ioXDfIp3Fr3sNhzkP1fMKrPrKCvMI9mfAccN+GymQ5Llsbp5wzPauPKeSAhawlQ6oKGivkFs
 fMMeupK6QyvhilaZcLdTVTYCzCctOtPS/yVAjDEWueRmbewQw7NxfcYsfhKwwls1gkyH3POm9F9
 PpLbX41E3ryKdAff4YjFRq3+JPemuSti70jl8JAEwa5XnkKAdnbeMI9LnvfLoDXLX06NF7WDm2J
 JyESpU3Nbmu9dU4Ntl22fYCKWPQg7KQ+zxERbvcFO6VnR0nkQqQTAEbUdMMM673qRJRp3vcKyoS
 nNL+c4tB1EY4GRmEnUlkdSvueRygSkejZMc7UAEnvny5pQcH990CO9k9P8r3nLkNkbrFzQf6Rp5
 Yah7OBlsHXJk/5KbOuOuhxatoaqGoMP2bvBriIE+P7c5xCMUMCddCVvPhuFDtAJ8C+21q+HdLRu
 4bveG12t3AuXDBOGwDBZcCjUYtLEDwVZZFnOJh/4+jNP4E3fd8XThfx2uhZHpNtm4T6mrP6I1md
 B3ce4fF4hZq7KQN+AHJcwaedOPFGvRqnFlZO40rzmjnuqJYNrGdiItMhHvnpunS9l12brl/Ot6R
 IlvOBR7kc2fQtXA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: RfNzNIFpWxiS4jWUkkuAo6h0YQuMIO-f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX/JkpUYze/GNx
 bIIML/sQSK7Lhr+Z1dJJ8CziIJruB6ymQDY144t3sfjVro7uUY7wx4bTReRSaDB6qFgGeVIfNne
 5TrQaSJQUO25lowAxdQM7SQTvZzmQJQ=
X-Proofpoint-GUID: RfNzNIFpWxiS4jWUkkuAo6h0YQuMIO-f
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f2c8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=UevxoewetnaWWcJ7pQIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX5Khr9cXcj3Uk
 qLmfSsDcbbsDtxFCle1E+XC/eYAhmJJRDajIof2V/8eDhM+WLz4TBeFgXkAi3HsBoHkQBbnOHCH
 aRsueoKLywKnCrh5fNg1wjBtuTf9QWKBjGzMga/2/nStiN6enbgMISy92A2TFp7f+L644fJt+PJ
 LwLQgBKuoPOuJGUIFopAzWmca0eI8nkylIUffnINEHPnkzQmqOhXjGn7daIhdxJ4PI9WqhL28m/
 dj9b+mjQU3BVv+fS25WOhaOhzX4Mm7o8WJ1WLT+CmdiZz8fvcuVGco9mebeOitXlwYLqGg9zipf
 GH+OoRUfc7jxQ40SAC2CKw1CZmUZT5mj2Bk0WVIs+zT6ExHhXnJwFJOEKe2WWd93e6jblNXrLcr
 kz8vqC9F54hnOtfOrKRXJLu5L+by+0XnbqGk+50mZsnQEbdN7vmIcRZE1pH2hEWTYrtO97/g7BC
 5p/tdIE2PfttKalDVFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210087

First, document the compatible and add the DSM memory region
and the NSP power domain, both needed on Eliza.

Then, add the driver data and tie it to the compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260720.
- Picked Konrad's R-b tag for the driver patch.
- Added maxItems constrain for devices with only 2 memory-regions,
  as per sashiko's suggestion.
- Link to v1: https://patch.msgid.link/20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 42 +++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 26 ++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260713-remoteproc-eliza-cdsp-07701ba2b956

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

