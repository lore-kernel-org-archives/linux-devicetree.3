Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019B314D16
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504132; cv=none; b=JsyFflswhAbnx1J+HNdSQACgnv8leF/LZWCvF42aeksaKLqgnubtmmqRXM8iauMj9zDiufrLJKrbb1sm/ebYgR/xBu6bUdWqy/AtSy2Qadn1KC0DlCzPPuqwSqbjR207H3dyZ7GykK6WhLp3qahQGma/EWVWM33fBvEZmTdDfOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504132; c=relaxed/simple;
	bh=iquhnVX83va+93/Mcr4oasDJq2ojoyyvQIfd/GlAlpY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pyZlT+iPSlqEdS+3cBzz7YfbHBLiORrbmk+8JdippBHelVT/HYNYvLSytI8couwRuKmE5Spl/IrQh5yopQGPjS56UQVnNXnz+ORhY7Fcqe9f7FUTyLkzsEddY++eNzTQ4jvnOJ43V1ppcUcoivkqqBoWEUTnYi3bIlz4scwIQQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPCkH5qF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWFSx6J2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPCkH5qF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWFSx6J2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668890FH2083263
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 09:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bg+Lut/Yb+GhISLgjp4dKi
	W1om4zG/Mga19fYgYPmo4=; b=RPCkH5qFs+pR8L5rXJtY8U934sI542D6zTEOEJ
	w5tpbZMvqZrtOXW1DRbPxOPyK+o46Brgc6yr51As0GlXycFq6ydPM7WFx1GjcuDs
	DqNjf1HE7bI7YUiTYfghgBC1NEc6cy7tCy+zp6yPJt++mKemS+yWpK22zmdnGQeq
	cnvxgUBTYGpONQz8rXHoQ5DsoKfIAjYZCNBaRn9T8JkSs5Pf345Wiu225VF6ht4C
	sV8307Slu0c9KtERsi0loIfFOg1vf1yhva5cIA7xoJDBesl93Fi6dEdOBrV2Kaz5
	fuGg4M0d1rkBZEyb9Clqeg17ze4+5bQ1rGi3h3EtVin5isnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw8xkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:48:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so5544051cf.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504130; x=1784108930; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bg+Lut/Yb+GhISLgjp4dKiW1om4zG/Mga19fYgYPmo4=;
        b=AWFSx6J2NeVABqnZIu+LTDoWmgpimx3RyU+uaQVWyzNPYS8Yf/uyM/5I3e+IXcYBjI
         mjLup4ZQfoGAYqeEWYg9juu9rNQnOfE2bgkpv1/aMqGKW2ASH0Gd210YJoFuIbdVvlfi
         4B1a171dpgGn7wdrndYnQgzjXk88bqIWWCbNbD9IoihbHZnhDLqZFIs82Dkdk/2ifknM
         x7QBZ9mFEfM5uMPpeglu6Z12cBQOfD90Xsd3BsPRohxCCcW3EfxfANZj811eLnHIq2rR
         pn2bPSP1J36ZVTMVKkmm3AqY9ERdHiHk8FLUGM9XuqUiHhOSZafs59Fb0kYX5jq1ZIem
         Uv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504130; x=1784108930;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bg+Lut/Yb+GhISLgjp4dKiW1om4zG/Mga19fYgYPmo4=;
        b=pA+K0PaBgByft/39qcDcmG6DfGDKkFcLR06Mj3n+VffAEhupsHJ49F1G3cU2NvgqZh
         0CzJQdUhH8SNZTPKMUDCXHDnS/UfkqKgOizX5fY9wC/QiXRfEMHmLl36qHSwj72llGJg
         2T+XfNtzbsooB0B2beuHykI8qzDEH6/w0jCTzbVwfAi91RxpjY5FZnsWbao8CgaxdO+P
         06cEA5tNdUpascMNB2/8UdhCQ9olsqElZXHiR4bdnsBoc1a4GXZIFd3GHVGIj0TLYgPb
         BdbB1a9cHaNXBV1omUH/h+jhwqbCdCp+XAmPvh1DyJ3nT/9J6GyNh2RyROk3nblG3Rma
         oVtA==
X-Forwarded-Encrypted: i=1; AHgh+RrYyDoivtRTBCJRoApaBeLMQOMJ/K8CoexugkN9MHkLVR5s754qmy4o74RtASDxzenQ1yYg0nNm1mxz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq7qPwq3BVPFpHX5KwDCZImJfNLvfaTMMP6pbj46lo6iFguICE
	Y4vUYS4T8C0Vtb/hssgpfJByIpa1QkiMqPn9qF04R5tP5Z2Df4nkKTwr2SHNZuhPp1ryQvwU/Kp
	sTqUtpUna0K2avmlq1l6BvdxqYVdT+juBjQdamd/aK/eDrGkX+n2UK/NAdGb9mja+
X-Gm-Gg: AfdE7cl/J6DB4dTqGpE9YjC+tf8qvTgL6Jd8t48Y7tXnuvr9gd5szDDYr8boXbYTH8U
	yPyBVg3JB31N2Sj7jqxSN2ClqnG4CllrH+2QkVXnoWePR+Jf2pcu3xcCkBmpparJzdZ4TCUyzMf
	CpnJDFtUO1/1n+9gb+CaSJzRIG9W+3g+78FiuQ0UvaSv4WhPRzZCFvfQDJt4G3Cj5ARFT5XPEbf
	UsjPuwyCyql3cX3mJV5X+0M4umIT0MLFAN0K/FB5xlElEmvN598/NCxLqiD2kO/IE/tclPZ4UmQ
	1mPKUah7Wa4/slmVPPZ1KQenOkHyfezJGcoEzySocunsQavEErQXqVtDYaI4blQvEh21SA4fI1K
	Ak2PdPo5HSFFNpI8YWenL7Q88O4Cw5RGD+84=
X-Received: by 2002:ac8:5c94:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c8b2dcc55mr19609021cf.33.1783504129658;
        Wed, 08 Jul 2026 02:48:49 -0700 (PDT)
X-Received: by 2002:ac8:5c94:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c8b2dcc55mr19608831cf.33.1783504129280;
        Wed, 08 Jul 2026 02:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: clock: qcom: camcc and videocc
 improvements
Date: Wed, 08 Jul 2026 11:48:38 +0200
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORuoHczpq4iHpokzgl1tNhHG3
 n2dHr/L/y9gUlQMLs0CRT5qOqaK46GB+AhpEFSuBu98506uR56QNLGmwTCGV4xY5D1rEcYxZ0O
 icOZAvu3aHmolF7nr93e43v62mZ4Spz0L67oBrxh0B4MAAAA=
X-Change-ID: 20260708-dt-bindings-camcc-required-opps-bba9dab23638
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=790;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iquhnVX83va+93/Mcr4oasDJq2ojoyyvQIfd/GlAlpY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz4Wh0klLWrSZ04yZNrXrg9VdmMik51Ayh/+
 iHOlV+5zZ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c+AAKCRDBN2bmhouD
 1x3WD/0d7wgVy5SI1+gUM+2P6bGDR7DlABiIIMl0dEbWlyXg0ppYOMiePNVz/KrOYEXMd3tOj4h
 CbeK0zY0knnAxyaWFNSTKj4bdWqzJcm+AAXCp6zht2GPc8ba8Y2qqBiaNrCa+OBbuBWWCg4Vhye
 gAqMHvJeqgWdDzO0VYHXGRrFR1RM1DRJPF/RBIaai6Vw4dsJS/hzFNQuWqFAN+QPmZTofKe1j2K
 byZHt4bz8kIYIZf7tH6tMyCBYYmbkO8CyWY1zJsGurD9jrppj/MC8VaUOq4w6SeHy7iVukmj4kV
 axIgPayiKI15MIvr7D5xjZPP33IR92rNFbwU4T+drSYdSPNygCtX7RF42dV9Z3oUhhIbbyb3mn9
 EHNdPzDieJDAepjiOJY4dbSAgGe18ECZ+RX0pSwbgnES/Jgip5sEq16HeNdHyUJdXTnnXcecfFW
 ATWhUjgMTduDmVQlF6tW6TEm0cEFoMdK3NvdaUiZh8nA7zJiJN0gJzjxIoCyBy5xBsENoEBcphe
 4EBUyoiyHbjnxWf1sQuCED/R9JToBU5n5gbm4xTg/gtT56V2Kb9FimK1eYpcPSUxmd0I8ZeWbar
 34SA5cHTJrYVTSGjMwizgObouixr/Mpol7JCYjiOPDdrzjcuR7qaADTthcVwClsHTiVPToCR64z
 tSjt5HhS37iJkGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX+H7af8NxA0G1
 QBAB/7IldLMzuoZdS+6ggB7t8K2FdzM8hSF2AqKu+Wj+xCZgzqWqJLyJ5Iph9kLkjWuv69Mo3+r
 sD7BFAcOYDSDxLUO8sMrHqEU2vSxc273jSMhj7PD5YDcuXEeQjdj1itdxzmTY7hTVDqofSaoN6t
 pVCTWZ3xUNyDhMZM6N2oVN6i0qUpbGJcRUEg9N4i4qG1LkruX3crY+kFmjSkrg0bOWOkuGEg7ht
 BjmBZTht7Hv3bNhIELalkNspnlN6aKvpLEswzV6uPAEu5DPn0z+3QBY7W7tQWtZ62+XlFpaRqCW
 KzPllLQHcZ4Cd+P3/rBXIE4q0O+y0YF6tQmyPh1+EPwjjindwXTt0+jE38CSwdJOCvnieAR5f59
 mFqCdL2buTVofQZzj+lcu04ctx10fWhib0GGT/GNyBrHdifRouGu/atxsN9szJ3aLCC4jddfSHf
 ZeuvSOyC5kWaiT1mDtw==
X-Proofpoint-GUID: OKAamYiVAlb2RpQcChH1On-6GVW9Ad0Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX4C3rGMOyKxSO
 ZRoSeIiYA1X/cpahC67bcFV9vEEIVuFosbc5weRSucNReqYpu4Kbj7uM1x/piK7qC2jkAqW/KTY
 oM7H0UFDdu8xtm5AhSB1boKq0QfEeYE=
X-Proofpoint-ORIG-GUID: OKAamYiVAlb2RpQcChH1On-6GVW9Ad0Y
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e1d02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FyscYusVtPSbMHA5wp0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094

Hardware needs certain levels on rails, thus document it.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,sm8450-camcc: Drop qcom,sc8280xp-camcc from "if" block
      dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8750
      dt-bindings: clock: qcom,sm8450-video: Require required-opps on X1E80100

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml        | 12 +++++-------
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml      | 13 +++++--------
 2 files changed, 10 insertions(+), 15 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260708-dt-bindings-camcc-required-opps-bba9dab23638

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

