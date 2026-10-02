Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667A47FAF9
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938056; cv=none; b=HwqsB/j4VH7nu/wXNV+FU9GWwM2ch3H+mitC9I+/RN1gWjmE4JynqQtJxKL0o1Ask59Qe8uFGN8AqocM7aJBu/l7tBSqCXpNjfRoPFjG/kR+r/M4lfpiOKqjF9vvGwf8i5n+Q/49ZbRVoyENj0qqNXYB3v5fjRKo9OndF7Sh8SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938056; c=relaxed/simple;
	bh=ve/BU+TMT+pGJv7kXC/UDFkjoe1hOTogshGgfNsRmg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGcZel7cMoAJ4HM+4xghHvySo/T3bMp4nZCWv+AOKYCC74I71Nzl51Rvgl+TxUxFHZtMmgPcAoz0S4tNSHKVLQ3tHEiKqcTW9sGiRVDOI5QLHHyeUAdLE6C/FpripHOJRmtjtaviePR1VfhQcI1bt/W6voDr1dpkZvt0lS/WvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhJVSV5v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAOdjTm3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhJVSV5v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAOdjTm3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nSD62062046
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=; b=IhJVSV5vFC0q2ZUY
	Qd2FzSsm7hvsr6ovyMFYBM0WT5pEA3ZJfdURZPpALCWI16rqhXuPgzaADppok3pP
	0O8Fxzz39EeMOk6l69J6T6f5nd8vGRha4EvIJYsFZUn5pgX+5yo/RHIIYZNS0xlK
	A1vNXqDFsNbVbYkdBOJPcAMg6Uh6U6Avjqpi7+NqH65CUJYvkirr0+4Nx3yB3w3C
	ZTLyyCNc4n+f3RFEcKjVHoEoPBTCn10I448I/C4oucJf6g0CpZ5wv1FXpkQX5Md1
	8MjUdEQuxK90VqkCAuFGk7UQW3Zt/5x4eEq+x97b7Z70cxm8M/FCKqkSgUuv6S9H
	FLiA3w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256ms54d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 10:47:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1466ab2bc8dso11187348c88.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938051; x=1791542851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=BAOdjTm3cWATx0eNBi/P72KjuyQhIl5a7nEQrhnhNM9SJ2bx6NF1N83WH/NrMnh02o
         AC9jR8NBjpv/fnOL4rk1sy0L+U1sQ4uJCS80YVhsrbVBnWg7fmJ0Kr1gOzo+hvOXzl8+
         EPgXIeGUec8TPMlNKSR4jb3h9LOXVgh3V44bz02xTHjybxcZLdoJj5UBVc+35NrTq0Yl
         ABstRpudKEv58sWwMU0Da53ksjlGWe9/pH/uIo8ZX3a45O/NiMSNyzRxSzWnnAdb27Gu
         N/1SiWvtsfvoVM/n+bWpWTyoiYCZsB4VbLo9R4OHuLQJAEao9QZiuyl1eP/wrVE7IOhB
         o68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938051; x=1791542851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=PT5nt3CrwoWzbYxp9nUV1rbOGMKxY6LfyGx/ELPmavLY5s9e+s9dGmEuzV2b/3eBfK
         yJCvTGnvzNRjzgFa3BBOA9MHrEPZrrj6cki4a2C4KCO3KqdtUvpIT/CLjhtNODgveAF+
         rvpeweDuWGQ+PZ+vFNfuDJui1z/xMnNSA3dJU3fvmRHsHnuCK5fscXAObW7YctKhVhfQ
         oJuScu6m0XobwZ34tXolVNEhW1RnPqp3zJKKd9+30cl2cX5WC4eAIT7/u0hiF3Z6jvws
         SiFIGsUtEhQUYSPC7i8VScfDNuzwOSO2qEXPuJA8KadDBvOA5CbWt2GyYlCXuo+k8T4M
         TZSg==
X-Forwarded-Encrypted: i=1; AKwUvBxdKeP7nJY528lrorzHOGeKFqQCmmtHBQtRP10OB40J0eDhH0BnO3kLtcNXmQ4EhjPjbaVSIGew9qKl@vger.kernel.org
X-Gm-Message-State: AFuF++kb3W7klyjQcTiYYFYKRIzuCm/Z98vU5xM7y7AnfDavQW7ENOjA
	Z6ljFhIFfedqw9ambpVpeXtCPMhziRj3Cb8TYIO0X1xdnvzvPO4J/EPpAhRxUAbbDxrxcNi4JDb
	4CG7XmERdidP4bRbaQX0D7CGP/PkgBbQ1PthjxZs9zbg8nHV2jmrQBYR/Yq7529GXFnb/H+OE
X-Gm-Gg: AYBFou2SwYMTznucZPWMfXdDa9TrykOXVDqjepMYMdk3rvXJE7R11NvKZx66szuFBx4
	moJe4kQPwNAmL9ooD/SfexSjTE/7IpKKNgjki4jzRK/l6UU74GS0Ejh0g7uxF/Boajouun3zD4x
	UbXMkGSSyA6YBknrkuZfOr4WovJ+K6XZCdd6FFYzW7SObHltqPBVDNY5sWOVQG+RYhz4EoL6mql
	AGv1OwPcBQMqXgzWW4HONVPh1wy8teCDmXndx3UYrrC8IV7+TtcGLskrAri/0nyceHpz0d2aba8
	bPA67oYJFp2m0cP8y1qEcZA1ljtjrQuGvr2HV6vE2AuzM4VBKMprTZjyN354r7seEYUucLt9QOd
	M/X8xWKraYC9slEvHxP+vhnuckm+s
X-Received: by 2002:a05:7022:ed04:b0:143:2984:6516 with SMTP id a92af1059eb24-14f5c4edfe1mr2299243c88.37.1790938051299;
        Fri, 02 Oct 2026 03:47:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ed04:b0:143:2984:6516 with SMTP id a92af1059eb24-14f5c4edfe1mr2299189c88.37.1790938050544;
        Fri, 02 Oct 2026 03:47:30 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm10645191c88.4.2026.10.02.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:47:29 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 16:16:58 +0530
Subject: [PATCH 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
 tsens
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-thermal_bin-v1-3-5a29be7e8ec5@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790938020; l=1770;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=TcfZeA/waj0J1JOXR5aaLYuqHVj1MdThFVHzlUlOpuM=;
 b=bZGu1z48lKEdoWOkvzW7NaXcvtLG8VucQr70EyzMUeWH2md2HRpwHpDjQn4xm9QU6nqhSbZzG
 z1MVxkgomV6DCiGcyyBdI2s+PlvMFyBNyEHDaa7nuJiCo1IypyjvRND
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX1rJtoKov9iTh
 xq2SbDUN49zHPFRaxjN5fIB8S9IbM8PooWK/OKtzumGFjzpUX4rfSYjoAqvlh4T4fg8j9nRw/cL
 BUwzdM+ynPLXlBh3WrSXn8ujJSxd3IM=
X-Proofpoint-ORIG-GUID: R7zcJOfMkbhnSq-Cvc-xWjLhH0tCsIuw
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf8bc4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: R7zcJOfMkbhnSq-Cvc-xWjLhH0tCsIuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfXz1M8dcc0WMIs
 IfOudhayGqqysuzhA7gz45VRKp4/k7IUb1Mgvtr1j8rUb+kEeeSnOyxKkZkyzEY3hM5jDIlWRX4
 94DGmZ3wX6mXA/bIPHtPaaaB0bdlUl8uetog424XL31RjaaNe2fP+LwdYzW37yWHg82AHhM1qvS
 trYyG1/aZgzTvpuxz6R6ld7rTdEw6qYKl54tg6jmXWDfiPxs3sZDapIzO7Ip7UfIGZja09kaKHn
 zvegdXbaOBlvXf+UKJGY+mjb5Kj1i5DWUxEprVvnsn7y4S3PQFJe1+1Ai51I9O2vpVUJB4Bx+r7
 d9FVgXJW10dqIXsCaopfJVAx+LBZSsLJpdCIy+pvd1Vc2zjfTxIgU/gPMpp6duvFxBEh9yrn3ih
 MwQyLnOKUSzU0kbJedpgE3gJqi/X9pDfZFvrwg9HIVMRJt74huihCJl8KI+u4fqt5BZ9sQmH+Do
 moT+vnF8FSBZwE7HEPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 5a8f7673e730..6899f07ec218 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -65,6 +65,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -244,6 +245,13 @@ properties:
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
+        # hardware-binning fuse cells: a single i-temp bit
+      - items:
+          - const: i-temp
+        # hardware-binning fuse cells: jtag-id and feature-id
+      - items:
+          - const: jtag-id
+          - const: feat-id
 
   "#qcom,sensors":
     description:

-- 
2.34.1

