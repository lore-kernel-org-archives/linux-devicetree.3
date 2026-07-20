Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CEB3D0923
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537051; cv=none; b=u3AgDs686lOAWi2262nsbNNXmNpASGizZEa94tkcR4Wf86z8RRwVcIyB2fdGVbJ08/io+T2YQw5UT4DjRoy8E12qt0/Um3gKLvMmuXTpKwuTxZmTNmzvqakQMNElNDtLkZVqPucPLDlufdtUyKbQpUsDkXIxOP7rRgafFZCZAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537051; c=relaxed/simple;
	bh=GzRBa/CpmHvPCWeBD/1K7jRI5LN32M9YssWSaorgAWs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Uh0IbnmZZvkPz1jCBGAAJTdAGCdRLXx6I/4CDpQNDFQ3S4GSIwEnw7tED2bLlyEk+8zokNsndDyHecs/Z7uUr0uRTaLDOXsECs3Fah1MSvhnlWEEVligS/rjaHMB+sj4VuqYQYxo7sJehlD20eJBoetT1mQWMr2D8fUsx+GG/s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtueaTd4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+u2OvNp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtueaTd4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+u2OvNp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76vhN1896150
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vvlobRyAUUhK+cnGAKOkDW
	R7oCT3DTmgfyrHEH92quI=; b=LtueaTd4vL0UnA93YkUSSJIVxGLnVUXlcW1NxQ
	Kx03ofOrLf3wO6B4wkJrzpZDr8jSg7NTtTPqklG6cMyEoghaKuR3y41vzG0yLB/D
	5T8lX93OwS3h0Tfy4YUmBd5ZJCjTgry8lfwHAgPP8lcvOugxFqGC36gK11F1FAV4
	6LZkUvrCQvUiPK8lqTaII4Ybaw8iT+xEzSUi93//FuPoWh0nCW7qV8whG0FCkhrp
	kIaIEPqd49ONyIpdfudtjfnyk3T7sYhINX4w2ChtVVQd2jpStCGwSzj4dsAjNZC0
	wHcO5oO6oD+jeMCw5vy60PMPPBmIBRHJuMeXBPjmET37utqg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0krcf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9077b4c35c5so80590976d6.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537048; x=1785141848; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vvlobRyAUUhK+cnGAKOkDWR7oCT3DTmgfyrHEH92quI=;
        b=h+u2OvNpak63GHpWmbvHjw+zrFC/cc57A/HRUZjpILRpdcDbPhsugBefk2ldhCD1l9
         fQDQdU5dWTdT8SNoHz61ucI1/rInb9atgBxa7vYw706iXq2RJkyNwNynsPVghs9kwzKD
         YZuDpxLE4LHgDQy3MfVyCIfS6iEsRJwoRvft7DtuxeCRPXPjV24QtPjr61nVyO5mcmEG
         l4mTj7V1hQ1oMDQUI9AQKLl4lvM/SH17ltMwZxKLwvorClDHcZdRAoTeF15hzRY7dDNP
         bsYKDcLLwAlYaI+V/PE4PfeniL1ZbiNxsi/OATGihJGvkfjVkj3SDANvgqqTBMY7aFoz
         woTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537048; x=1785141848;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vvlobRyAUUhK+cnGAKOkDWR7oCT3DTmgfyrHEH92quI=;
        b=jWlWWjTeGYl+GOjwHXxVjlT7y6ODqE5VcXIQ01qoDt0/0iR2vG0rBFfltE+xBmZGvH
         JdgBp41hIaOl4ElIfS9ZNoWyYKLnT9bZxYOHx37LgV1+m7E4JLuZZcQaSfY4ggH/QH2J
         YHfg5ZBL9Kz8Z7BKdgp7C/F4weX6JQqTao7ya56uiQ5/D0dFAznFfGm5Cw4kU6CM58zl
         92/CskvCKMwK+B7EeLFrN+K7bidIe5z5VcPFASYRo/ypvEGYzw00OhgckVydrtNNTDN8
         v1m/sbngKYuN61Zdpr3sTjQfw2sOu5uo/RT6w5RNc4EzsNe0dkuYiA8JBgGN2Ie9ngGN
         s/1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9r7cDHYw73D1Jk3BvV41SQz9qaIKRAyJWl5TkqYIM+1TvKtjbgA+zkIEnDGuJ3AbmTNZ98YmeaDLr@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTsPDtw//evQJv4c7KK+jlSV4/J4XBLA6PVEmURLuXja+FdZp
	ABvb6R817uQyisSlzbJNR5QML7FSZLFYFF5DsqlvP9SdQHJk7V252U1jLHgAmpD7d036F/4GYHV
	k9W3YPmLBLeQ6vO0yYG0MKzSDXKdbABYxuQ897nTcbuQjUn8r9aOgnw4GBMe5l9T2
X-Gm-Gg: AfdE7clpnQ+wFG4nV0EeKRX0VMITE9l9qGKy/LL+11Lq+JBT8ycogAxJ/F2ozNO6mk7
	CPAL+JFazW8Z1b0BTTvR+rS/9A0W13H9/7/dIQTeBttm+erdV7pN/epk+eJ9gnHDK09HziDwH3a
	pKmOPTVuEeOFB9Dc/xEliaTJyl3Jdwbr6Hi4pfH7OxgYmVMmJaU3IbUeSFs6/QYyfxDAhcE7WkM
	eHfJVTwh0S/M+j363jTfoubdWfnorZ5gJnr7fdQDNGI2RHo16M1LY6npez0SCltDgVoX3sK+BTG
	n3WZC7yxDI/9RsjgkEtFq2VcNhYdmAlSFEX8ze8JyvktZF77Mqc0QidtqWPzl8jn2NzyA4jFB6m
	yfJxYKX3WEaEZuiNOgKKi41ReZrNYkBnKWKuDsGqPBEzEG7H1mBOWqILdU/4LcAg=
X-Received: by 2002:a05:6214:2608:b0:8ee:6442:833 with SMTP id 6a1803df08f44-907783bec64mr141899956d6.43.1784537048158;
        Mon, 20 Jul 2026 01:44:08 -0700 (PDT)
X-Received: by 2002:a05:6214:2608:b0:8ee:6442:833 with SMTP id 6a1803df08f44-907783bec64mr141899656d6.43.1784537047774;
        Mon, 20 Jul 2026 01:44:07 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm87061716d6.45.2026.07.20.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:44:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/msm: Enable dual MDSS power domains
Date: Mon, 20 Jul 2026 16:43:52 +0800
Message-Id: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjfXWoC/yXMyw6DIBCF4Vcxsy4JDgriqzSm4TJYFmgF2zQxv
 ntJXX4nJ/8BhXKkAmNzQKZPLHFdKtpbA+5plplY9NWAHCVXyFkq6TH74pA5q1Fwjsqgh/p/ZQr
 x+2/dp8uZtndN7tcI1hRibk0p7mNjiZQUvg+ia63WLnQKTSDb88F3ehiCRCOdaWE6zx/CGvvLp
 wAAAA==
X-Change-ID: 20260720-msm_gdsc2-cb9230027a2d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784537040; l=1345;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=GzRBa/CpmHvPCWeBD/1K7jRI5LN32M9YssWSaorgAWs=;
 b=mMBKRBvO3BukDTilK1sJd4kFQW7fRML5r0v5GGbLwKmyKF6h8k9wsswegPqFaz+QRfADzsnTW
 0+OEUfir98yCUc+417vn0duLDpM1dydRqJDtD3koxo+kaE1QX3FP42+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 4rk6NurEMmoD1SlPG5tjbeGpOSk8Nab5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX1QrWP8Q1E3kj
 OpX2bH4k4N+trXVD2VkUVb7oq0jk1HIsdGqHOuQw1cb+WHd0Pacnc7FsOUmM81cojPipxXQ6hcp
 vyaktRCn5aAB48zc4WN0JHjBjZmeO2Y=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5ddfd8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zZWzZaWlDQgj5UJjSeUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX9njfBlo3XyRY
 HcIMIUfe0aVeNKgqlBhwiQXoGL5UMaPl2y2pB7fxMwr3zrS8YiJzCyW1M1UaPsN20iC76okWAGn
 8gVn9y8K/QHzXh49k72B0yHZnGh3TdGqMqN7xNiCh6TIOco8ttfwQ+fG+HcXzeDC9b1vXG6okRC
 063JKjUlr+vFTHOMPTeE1CSFdVYiG57GpBWs+LNSziP3wBnF1jltNTmQda0DvDCiKlK9OTmJPXb
 b0bc8wxNr32CyudeNoJDTJGBlSWABnL9whEl8bn/jRGu1ErDhZHBZVx3ywukSF3K+Sd+R7OLOfz
 bIO+Nt+5jTH5I7xC4itZ11AB2Q3U3DcGsMcmAcA1WIQl0IVa2WAUrlieKZoKOU2p2pD36zaXZvO
 Z7I7i70I5p1AXc72nB9HIxhJPlNW7g1uPyN+4zoCdps6zViukKCM5ZvN42hdSLaNb7A/TjB60Un
 W9dMMRVTfgdywDcLm5g==
X-Proofpoint-GUID: 4rk6NurEMmoD1SlPG5tjbeGpOSk8Nab5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200096

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC powers
a subset of SSPP blocks.

The current MDSS implementation only manages the primary display
power domain. SSPPs backed by INT2_GDSC therefore remain inaccessible.

Add dual power-domain support to MDSS, update the DT bindings to
describe both domains, and add INT2_GDSC to the Kaanapali and Glymur
MDSS nodes.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Yongxing Mou (3):
      dt-bindings: display: msm: Allow two MDSS power domains
      drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC
      arm64: dts: qcom: Add INT2_GDSC to MDSS on Kaanapali and Glymur

 .../bindings/display/msm/mdss-common.yaml          |  3 +-
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 13 +++++-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  | 13 +++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  4 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 +-
 drivers/gpu/drm/msm/msm_mdss.c                     | 53 +++++++++++++++++++++-
 6 files changed, 84 insertions(+), 6 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

