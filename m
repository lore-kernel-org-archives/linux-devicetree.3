Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C33E2778
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 17:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914432; cv=none; b=S/kgxYTRE+PUySPKpMiayutHcpN5oyChG1+1IDDA10hhLddEEHb0FVMRjF/QeHFUT7dGqHw9OYcaq3p7c5FXhi4Sh+P48DPprgolTk0eMwPbwAvfGKMQtuGryLApG8/9jyvAqVCQ9syskeOHLw7YCT0742urDgzMKGAYzD38AFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914432; c=relaxed/simple;
	bh=l1KP90LuLj4asV7zxBDG3JLI2jxQvuA1XdQmED2XHqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CowFhIf8s48kzJ24xLNDGdhbpgioDwwywFEnImNgPD3NpKRX/ElmmionSvQmsxD6YF1dDVxuQURshz/DOS5HDZfJZ8QznCcSL/AC/eyINQMOEDDKGZ0mUpMUwKlgj0ABJFl+YbSjrN44HeEtzFqokbWoSjZT252x/eaNqn9ML+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/vjQaXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gt860h0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/vjQaXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt860h0c"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4EuH636667
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 17:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vnLRN/b0NlAa9y/7bNkF1EzAAUbk8bLGcQK
	rMdeZgYU=; b=N/vjQaXcpdpIit9nwzzaY0utC5UmlTbh6hv6ZWn43dLNd3e4RTi
	fI7zgm09QbR984iuQXrQate9AKuLNJgRa27OysNGOYYCkFQAdQiu+yRlMWr13xtz
	6dM7dcb4fsMf62ZCYlYBPR3Z6UpvnbmBgLT+dj0b2nlAKqgsdCReSkz7OwBDtiTD
	sp6i/dl0A5Q2mjBFzsOQmz+jaRd82dywfvRN3QrTgI0Fuopci4VPc4xmaNottRyZ
	O8J+Ioi2Ub1KRDkPH0bWgjl7hAtL6pGx5lzwBNAEqPXHkE/huKN3zZfjaSM1rK/Z
	VDuI7yDKMgMtqzwkF8B7Hr/gw7XS0FfBC4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx499qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 17:07:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c79798cd9b9so1213817a12.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914429; x=1778519229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnLRN/b0NlAa9y/7bNkF1EzAAUbk8bLGcQKrMdeZgYU=;
        b=Gt860h0c3OYvKzVfLwL9joHgRYluivWuWXf35+yYoLUQfPG/lRAyv875CAyP+rpcDz
         GtSq2rh5fXj+Ju60m9k9iJHM/PdFqnK1PIq1MaW0ytHK6/rQZtoG6Qg2bx0TD/1GejRM
         mGLnetzM4DYErbvjCJbgfEB4MJShLscWQwEdYSUmN2RxJhy0lFpai7sQ9LrJI6jroQJS
         griF5fm6jDhyMv20PlQRS23U671JVJjxMOMCKhMpYriVfxiPtaXgnMF/oZho19ojH//s
         1WSenkIQCaeaY1ZOTkjgWplErQHL8yiFWO7SEmd+k+h/GyTPSK5jycEof2TuRCCHNJI3
         jyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914429; x=1778519229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnLRN/b0NlAa9y/7bNkF1EzAAUbk8bLGcQKrMdeZgYU=;
        b=qpiRL3hFj92aQ8TJuuWWgm/fToSB0EbnFru3TRto6NmfqzOa1w+huyycy9YxHzUS8D
         zXe0sB2jJ5C04C8+Q0HDNvtp+IhdzGyAme8kmrL9lHsMHdKmPN1xvwaoPqNFC1rpzZHV
         3YdvFUKPtgySNE9VnK7buPQcDMFAvC9gh2kGcMW7zdy3AyR8/wZszkyzj05C2Rl31RA2
         KkbujgbpdZxvFLKcNPKbRGy68KiNydBUTV83rjyE//9SEzLXJ3ZVNQKxKiqSswkUl70J
         VPJJVKt59U7Ms/A7tfZz1fVVo1pL0vukVvflceHtrD150nJH7bTEBmiWzqGpPm0dlwAh
         1Fgw==
X-Forwarded-Encrypted: i=1; AFNElJ/ImqwIPT+B80ecHO78pNBEnw8kHt6h/bnsXC8fRLUd/u77JoM2q6f8cc3tPAC6XxrhqVfvnyiDWldg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9y6XoN0GTIlWMedn36L+pn65K+h08YPAyEpq4lxpj+lkuBzIj
	HlEDe6h7CuqSze9xvJmKafR1HYBDrVhmuBnZCYaq3TCwgGUfqKsHdtN2gwKC9jc9F0Ky1KTdolp
	jrsgxxB5u/WFPa/UKQjJwqD1FpIgW4orOQa5xlUtAi8MCWxpWDbklpkVa/8p3ZdHl
X-Gm-Gg: AeBDietQbGFNlAC6PsBRm4v0pKNVNIiUHvLMDtf1+jrwJK1+4MakDoGCI8YP6BmdJv+
	uhlwf2oQoI8z1FVu3aMeSIiknaaFrZyM2utk6KxAXf21URwArnw9sYevw+d8Mq9SQ8FM1kf3l2N
	EGNL6v9+GG9JCdzPAs91RKSI4lrIoLQALwUTKycUOP3X53Rg1C50pKtVegJA4vZJKjgp92HAR8C
	xS8ehert8NainUPnAsPAb7Zf75gz1+XkPXA3TYntVVoJIOAxdT/OJ1HlYaKcXeL4TejQo5/HxWB
	5aoA5896t4gB3PY73pJUa3gG0DY0f3O58wT58HKYrf5Vj5zKHz7ofD4mRd4aOGiNq+kbUesb7Hj
	0RRWaZdyNCyr58QfCbtm8utR4Pc27UNt6Xp3sEO9O9TRZsdmJz932ndO6198u329KylW2rNwzGW
	B8We70PAKbHdPezocLihO7tFoqfA==
X-Received: by 2002:a17:90b:4a4f:b0:35e:3afb:a3ff with SMTP id 98e67ed59e1d1-3650cd08f1fmr10015821a91.3.1777914428912;
        Mon, 04 May 2026 10:07:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4f:b0:35e:3afb:a3ff with SMTP id 98e67ed59e1d1-3650cd08f1fmr10015740a91.3.1777914428196;
        Mon, 04 May 2026 10:07:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add USB Phy driver and binding changes for Qualcomm Shikra SoC
Date: Mon,  4 May 2026 22:36:55 +0530
Message-Id: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX+1Zs9Of04hpS
 OjJUEc0ANzFOXJ2fBaflu2jM0dTsWKH8pY8HPQB8G8AREN/9lFtn5MRhaIOXXf5e+lYfcOhviFv
 6lchGEcfne7LBcqAVtXy7lWUkaJpLBNBsQE6yyTItglD0crEKc3FyNA4aSDJojsNOvt25uK2dov
 62jkuyzcOZ5z3WOlGB/Bps1uc5FnnN3bSADsIWFVRytbI5Cj7nP4V9DHJFGPjk+y5pwXju1Xobp
 LNDMt4GxN3cCQzW8ena5UV8FEc2mRMD3BHoU7y7xAfbsB5hXcX1nCo5FrJtdYCjMND0UcWgFZWt
 Fec0LY/1TcZtBkHOkZGJASbJI77wuvFWjf92io/vyjjokCXQyA5fM+TTcsdqKeZrfRtrvAuqiek
 JAMC142WJOs8GQrctTyHyQjQcOp4QVo8h5q61c8CPF7CAj3saX+I1BjmS4CCP5YUPF88eaTn8dp
 htD5BXdjcd3VrvjBKqg==
X-Proofpoint-ORIG-GUID: 5uCCb-fPh0TI1IF1mpy4GPAx10FqWOZK
X-Proofpoint-GUID: 5uCCb-fPh0TI1IF1mpy4GPAx10FqWOZK
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8d23e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=_yzwj3N-3Ah45w2uUsUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156

This series adds Driver and binding changes for USB Phys on Shikra. There
are two USB controllers - One of them is SS capable and other is highspeed
only capable. The ss Phy init sequence is same as that of Talos.

Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.

Krishna Kurapati (4):
  dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
  dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
  phy: qcom-qusb2: Add support for Shikra
  phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml  |  2 ++
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c            | 16 ++++++++++++++++
 4 files changed, 22 insertions(+)

-- 
2.34.1

