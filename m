Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452255;
	b=aXHHx1nD5sIfV0y55ivX5pAc80mtAl92kDOK1DTadbyC2VAD5xS0gj0IFpsoUMytTzaF
	 aZghPusu5flOfzDwS2g66F7zWXfn/Czp5ZBApmu5XfhgvKgJRlv6kEZggyUpBv+4zbifu
	 N51MnqaS7bit63+UZqALfTXYkm/15JBRSP8y7Tx416GMqGAM8Eq6aqfwvplAHg3/edjOB
	 mWbjVwtM7DPHG81xX0G2iw7x8k7XvkxUusU+fJJTv1FidbLNJW6ajr6E4XVoFxWEppvdG
	 4LdZnjykpZUAE4kqOP3s0+lv5WjCnf/7iVrC0+QMfbsQbv8nzHn9U9XGWODawwpTfBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
	b=u8NZZPASUInLAMXCalBzZjuxaiPmIREWtQjKgSmatszUcyN24ldXS70JADvfEcIH2chS
	 A+di6uT3uaXbel9lgV+9+cmA3CU8PW3J9yVq5ZletRnUf2MC5tYQTCCjHWp8jEcUTMPAb
	 G4JhUodGTq+LE6dMJVZs54ErKYxknOFiP0q1OdiuTfjDARotERsR8UW0kdC4GGFbUxdJ9
	 S47/b2GNSMuhU3thk9adu9lvRDGhi10IbghpAjjj+S5KEO/nMc+KgqjIAc7Ycdw9QF85P
	 uHZJLXo4MHZbaUnwr9ZC31U16VBW+Mo46GlVxGgcw2/rPVG8LTyEKpyD+3OYDgXk8eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKOljNQ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XzlS/wF9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE7606A329
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AE7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKOljNQ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzlS/wF9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02Mb3208602
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9plYplCg+Zp
	ar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=; b=aKOljNQ22x0O9QQY1lMM3nMFPpx
	kg9uOzvtYtjhpu5fKZws7vF+0AlmvqMyqMeW9wTHjtRDbpgCKGOxoSbY1lWvRyOx
	Td+s1mONSn0xySqERBXMFrRLVhwCzbx+F933hXfxT+1Q9LEwUjf16X18yYzB4O5Q
	TE9IDB5VWUTDYYouZKWPPiW4h7uBlYz9wUeNjPgAcWjMvzDQkACCN4fRIC2hnjml
	DdBlhuNGydzENvla9ZLYcJAnbOaLX7TqnQJh1BGYFogjlZS4HC+2VYJylUcnkZJ8
	0kb65MHXBnVrY63lwUzM6jp6W64xRnuo5j/Fx7FSi+DKdDGWPkgwiuBFKEA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rs9y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so1862919c88.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452254; x=1794057054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
        b=XzlS/wF9Wl5Rv+/c2jytnzE366iKeIsQJKtZPEfKNLdCPi9qYGWIdgqR4Ni43nzxSm
         U/t8CXqjbNhuFtij2nU/0LpdNlvGa8kQLxfO/xf3pNw6By1x4mtUgjY6KUEyu+YjagHU
         EcWd0t6yII+8d64eUghHGjSDvt6gUy4HfqRYfTlf8RPH5jUWFIqjPUaQvgIV4YroqlRn
         C5s9rhf0yug6P3zWIJQ1k1T6rH+WZCej9xxe5FB6NCTH76fFlY3OGM9aa/MvmUUiU+3j
         Qm6wxmXsIthwwitr5zZG1ezSJlGoIMOd8GVr1nq3oId7FiyCoUCcZni2jQEaBSbTF75Z
         6U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452254; x=1794057054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
        b=eP+rW99jAIVb8KmU1nrDjlqtv7bVUJQ+y0qPQyWgLKVqDpOnSoeTaXAQaOGADW4FFD
         EtrMYWXFcevOFnXurzGmpsCPFhj7ZXCn3TzPO3JAeqZ7xHPYPASiEcPNc0qh1oTblEJQ
         xuJp3lPy5tc0YtqMmirCsiHN/cLvS29EUk6AZrIItnwrZ03+ue4CzJBClTxpkz8pp1/h
         W5Nni5QsIryf9SaO9J81r87xlEHBZUMuyx9pR16cXJndpIHFyvdFOiazauginirv3e5D
         cC09nBxxSFwoL/naWOMd6HEuBHwV5IheDogMqdxWsdhj2X/lxUllOa26NGLCbZS9nKd7
         yhTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1m4gVbxlgzGQDsUcLT+3LZoiVGc666Wqvgx/r3QcFyQu9ToJsA5JLHMbYyKMuyEnxAc6bmY0MMw2q@vger.kernel.org
X-Gm-Message-State: AFq9FYKmd6pDXbC8CZYaFaYR70YK6M0B8fyfnAk5li0u9dt/8iB3Gsbf
	OE8yV62/matDB4JIypRxlWF4o4oVnkG3HwIkshAo8PU0tp5UYngi8VLONGljaRyIskt3k1otXZs
	ZA9XSQ60+fM907WKVLAUxOyWXuvuWTOhs6lB/HhGOkfx+LLz9DI9wjEV8rQMpC/w9
X-Gm-Gg: AYBFou1oHFc4hghvQfAcgdP8b4dD6M917miKBdeFq2iEEDuTIA/YuaTa/UUclEoS6bA
	zlfs1GTn0KzhzQpyyTo+Otk/o5UNQLOXkoc9ZYBjQj38qvvJAFV4cc0k9FwfEZVAfi0k6ngBLEh
	pE49swpaML9aPo+lIRIwSgQp1EHqh4cWnYErYtRZ4Aj+WR2DQxfUrE8xSG/aja3DZh92FjuAlMO
	S8PzWJAcZ2R7zhhVluXVqVoaNSRLSxRJybuuL7oE2t6qg8MfVm21nq6/s61o7kvzGsbcCSU90Of
	hns3UtKaY0O1FtBKtRFGj+O6JdQjjBgI4BW9JC1UAClMQ4dCJwDCPDc5PHQzb55bLmsDScKQCQ/
	wOzh99ymrU+PEyPbrjj3JopkAVgNdcT9v1mNPwY5fUTFUuktkonUIbFx4+qAMeIKLPqPoYJ8STS
	6txV6BkJ0Sxwlnpk1CgXJbzjrbmfBBikzZ
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr7854193c88.11.1793452253451;
        Sat, 31 Oct 2026 06:10:53 -0700 (PDT)
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr7854147c88.11.1793452252732;
        Sat, 31 Oct 2026 06:10:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
Date: Sat, 31 Oct 2026 21:10:37 +0800
Message-ID: <20261031131042.1200862-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: u-rqkNYfguTz83SmKFi67H2wwiLkWrT_
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5e8de cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=5r3D8o42p4VsMVMPxZsA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX1O6p8dRFUio1
 iGt5d8Qq0a7wkDzp9EWsXlhczeY3icNEtxkx/yxoBYmsTIFTEUv8EHS/pm7G0UtwxYunrPzuLhF
 919kAl9DQX/+y9BkPnXPfnqsE2kYdh0=
X-Proofpoint-GUID: u-rqkNYfguTz83SmKFi67H2wwiLkWrT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfXxm4uAVH55Xtc
 3pKFCsGQHMtMPxWrFfkPec4r6aNkcPEkWT2pG5TNlpqswyOpfUDWjLl79/NIe0fJM84k7Ob6v9U
 9ZtBAaOzZ9+qp0uegBJPQrxgTIbu4Rrm85ioQZk/U6d5e2WK5av5aCI/XfbxVz72Bl87NuLbKeG
 6ph9dko7CJsB4pmlKewRrUj/qfFZorCG/t6WCyrv63u6ppufnAA1WowlXqQuIqZFGJjiPZRD2PD
 PeIh55zG05/Aej9i5xhqHAlVXet6ffiaqJTmxkYoWBOBflyAfzAKsn0XCuPezVxSRKqwlKPDS1Y
 19oHbrJVEp1rwN3HqgA2nPCVZELZkjLKYC+Yn5+kqYJhJ7fWsxRWj0XwvVqSARS1Fxnv7p7z8qm
 ZLq051AzZY9UKj0fYR6gzFSNgrQ049qtedT2ZYknEzol3sdQ3KX/M2gTlpafu0zs23+2kB5/r9W
 gjUMamg6SyMfZVW8vxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

Lemans is a Qualcomm SoC family that includes not only the Embedded
variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
also the GearVM variant (SA8255P) where resources are managed by a VM
as SCMI server. The current lemans.dtsi covers the former variant only.
Introduce lemans-embedded.dtsi as a placeholder for now, while later
changes will move Embedded variant settings in there and introduce
GearVM variant support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
new file mode 100644
index 000000000000..80d8c75e4895
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..603a3fa18994 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..a2c70018e571 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..7597b4f27e78 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

