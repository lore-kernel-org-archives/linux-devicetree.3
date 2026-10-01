Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7A52941D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867490; cv=none; b=J4ID9H9xHSn8FFq5LA8CmSsmK4C4hmivCqsOkY59A+DzhFGnKJkdt2uB1zP2UjQwASCc37JBbKOimIbK6ClTKxKd9+ytfMbE7NsczJUraoUK7WNuiOT0PJeyO+pebKP/AAqj5jvTk4vwm2CfNKfENRlc0YT7UP95nQ6bxg4uceQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867490; c=relaxed/simple;
	bh=xiztuzjHnjVqr0P8nXs88Vl/dFPvDCKaXuSdyIBPMts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S0y7ogT9z8Ka1PWYIamwlCsiaYqXCzzLvnQsxqpFFHp6je5zJgKlN9/71Bd/XVlF4gWMRrmhB5rhxqF+z87exxns2FvjNGrbJ3L0lY2UZ5/Iiht0AwJl4JU5MQ3JN7IErl59Rr+fa+ObL8iAUNFNdlf69+2BOCKY5GVQaztUl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZdZu6aI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1eYLo95; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZdZu6aI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1eYLo95"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DiuaH3228383
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7f7wIwoCtHOFJIXP0tbYQT
	JVhXZnDgQa0hYQGjNo+Go=; b=iZdZu6aIflrn3N0VAx2XILSIcN7bnCkK9D9vOk
	Cez0c2HOHx0LHsCROpZd2SxT169ejqEH3xADhmNS144LmK+kz7DroA3AzsgI18py
	0rZaFbXL/2AxqEoBzj+WhNjx6Mg7uEqdRN+xbSCJuGKBeNvV89q8wNnehkYYvEuc
	BkHYCljQMXHEo9AxtulykztidgTogNYvSvbM32Q3D+7+EJGvz6eV/2qE/DAkNaSx
	+nk7a6Itz7jCARZaRGmQK+IhtzPWiMMAh1rUnswGPqHOVGIZJ8O7r3C5WhyA/QlM
	ziSHVeDgqQxU+QsqlF04+biQvH3Ur+EqYwfpry6eUDIij26A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk8mwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:11:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so6296830c88.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867487; x=1791472287; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7f7wIwoCtHOFJIXP0tbYQTJVhXZnDgQa0hYQGjNo+Go=;
        b=W1eYLo95LPXHHndHyvG14WDmI9KYDK9CXAJ61mHGjavBY7BtLmZg7KNFVSo4D3/Asb
         1oedATy0PHbAaZbAw9DsrWbpeIP5p4YIKbx+QVvw1XHwvNKCNPSD1nL8UF+AjMHUZq9T
         pXv68mEXIdX9qgC/Lg1ESjWBJv4Kq3ozsoAGSsvBKmo1J5fCsx4TIu6U5kopothsEqFN
         5gajA8eB/OwDEKfPfLOKAazhDLAnQfoYfvl/6wNi4Vkaz93cPmf8Y8nZUe6p2TgyZwGO
         2Sw0OQxuX7MROp0+e481K1DdTtqN/Osv0V/lGdr1UZil6y9H9RRULQEVCqZmAcnlBcFp
         NsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867487; x=1791472287;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7f7wIwoCtHOFJIXP0tbYQTJVhXZnDgQa0hYQGjNo+Go=;
        b=YP1oc22h4VzXKOApnzz6fnGe4ybvNGN4MKACiSrMs10AB/i+qhu/qHckczenGqXVKL
         9+rCT3WPewYuAU88afJQ+nBkA2uotIQNjkYTQRqwpBrab8udeRnNbRvfBzmRNwnBxNk6
         veiHuhAgEGqc9sEedRLW6CdpWDOOnRciPzoWHjuBXj2a/kYKyg3TQBCqMP4zAGhAhvKb
         YXd7PWv9E6CKZVJWZ3QGbGfucdLeLGDBiw8hJHB6jtnIx3NF5jc9w3Y6X06VqMPwhRjP
         ClgTGkHkO3KDz0uc/CNBQwppy6UBkSt3gyJWcR6dP7byn/+h+txWgPuo6g/bW3vToBQN
         KJgA==
X-Gm-Message-State: AFuF++ld9LZuKEt/JsFO0I5AsbbhQJdyCuOAffVzgBYx/9eerKs2wF50
	w6Fx2xfj/1tBq8RNfvq9jHjIs67fOc/xKhbK9AFiSqqdTgG06g1LMhS9yO/CXA/bscNdvkLOJew
	4A+WSwA0rQBglca3YusvX3sDBs55yZuWnbIhI1lTiuQfq2T3MAqJZkk8PhFfG9JkfdB9TXHz/
X-Gm-Gg: AYBFou0ekxsSsg2o1p3cDt4qAI/KdVIIEioEk37+N3f3i9+Restv/M48teOzxNBfp9Y
	sD0RBawiraR5BknEDMImDan61JPvR04LlxuQUW+gvCi8d6SZ61e6B3n+C8Ca0IHeF/qxpMSng6l
	AjslfCwFoFNP0n7hsWTCAlL07oF/k5CweqpmVfKBzSW7SoBlxofiEVJ6aPDUtDarLPbWwsb5eUT
	CvvoujAhRX3xo/a5XQBcKMQtYamcA3GKOAsI4BT292cj28nPxRGiB6K0Mfv/32bTMoT6xFf8ilN
	d9F3xK0HZRj/o3BRGwqX5wy67xszLXOVjMXUz+G4A6zkV+uejL09jkQVkftJlshzkdczfTNe9H8
	KZ12/LD/q22Utz+j8bNQET0xWQ8NWa/gme7lWF34AKrGVOVDPlk4CdkcMu+yK7X+ItqEQwR6cJU
	BKh7v+cTBWFPOj7rQvO9c4N65VuurJ+9oKAQ==
X-Received: by 2002:a05:701b:2906:b0:143:298c:924e with SMTP id a92af1059eb24-14d359570f3mr4473725c88.45.1790867487076;
        Thu, 01 Oct 2026 08:11:27 -0700 (PDT)
X-Received: by 2002:a05:701b:2906:b0:143:298c:924e with SMTP id a92af1059eb24-14d359570f3mr4473700c88.45.1790867486442;
        Thu, 01 Oct 2026 08:11:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/5] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Thu, 01 Oct 2026 20:41:10 +0530
Message-Id: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA54vmoC/yXMQQqDMBCF4avIrA1oIEK8ioiM6VhHMMpMWgri3
 Y129fgW7z9ASZgU2uIAoS8rbzGjLgsIM8Y3GX5lg61sU3nrDa+0DkKaUFJe1C2a2gU3ejd5dAj
 5uQtN/HuqXf+3fsaFQrpTcJ4XRnm3THcAAAA=
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX5jau2mubQO58
 HMdMWbnddCPuAS8UBBZWdpEbEm3BBTheaNEzAen5uOCg/mKVqBssbXrcyEjoGlgXKhEEyTkEYrz
 e3Cv4kw0ZtAZR8o8BsILbxuys4qwQ8s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX8bXHigDRRttt
 0mYVzL7zT6OZUvs9rK5fF8XAMnykb6iFky8odV6bd8TvqDoYbORv2YUjpnWgRaPvczHQRBUkgbg
 Wxzvhi9lEcWbIoie2Eabfgr8ee4dRbVOEiCBRqblMaOHYj9h3JxyJufsTDJD56+hj4UEQUAC3Gx
 JfbNugFuq0gwOVt8OBbmkiRNTt0Mkvu/RSUkC7nsbekHca1ciWSiqzN3MEjw7+eQVHyDNbnZikB
 c8YWIFrwnrOIsoCUTnI9x/e4IKpqdezaSIdGWF5vL9y2yIXN9T80xUZWgAZseQHLUq7VMLXSCiD
 1He3vQ2hj4vDuemz7dOBBSqQ3TCceHmLJKk9BwOVCLVY3XLdnDa7U/4+X0O0wNi+XFy+LaAXpTp
 h/rFd7OoH3RC5YG798OgYn8fqJnTQi54XmJt5p9N2tp/xDHd0GLajNA2JPARhoxMUA5Fv2Ih3SH
 +8I0IqHcUe/uX7GXxJg==
X-Proofpoint-GUID: 6-tEl2qlQHSajvtONovavfVJl5cfmx0Q
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abe7820 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BUjP7g0EBgjMYpCN6FUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 6-tEl2qlQHSajvtONovavfVJl5cfmx0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
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

