Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E043A2E2B
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377032; cv=none; b=rhE1EmVtcWceFZj0gqsv9bbB+v1++CcCeJao+ukioeAyyHiNqZLmVhuslK2/fhoOAoDw/UGczkRl8lm7z+1Fs/zNwwKbNgV+4+QscnYfKLrMjOzo8WENiurmF6O9KN2im8ku/ShdSZye049/0qr1UDCq4zDk3JE2M8pVhPjYUZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377032; c=relaxed/simple;
	bh=ti8tCeK59NnVT6ZgdMt1nmI1QkUPgRpOvJOJIvWc1Ys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QNqMtDITCKhI1bA4imbOAkkSfreLIp0BiomU5zwvijm1Sd/EZ7RBGMoir1POp4mytknRS6rEygeGhMoHZZRmlQtMVPMYf+KXhuC7zdimBtmFIcogXO+naztp2Le1cVYTGlChcT1xWRe6XW5zr9Z2YE88ejRPxuNaxPOD1ZZVp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWiMyYlw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3bHpMQ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWiMyYlw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3bHpMQ5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVChj3198240
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 12:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ge4UsmaaPXwMQSgwmlgfa5
	Y2DzK0kEKxxkf2gt3s19A=; b=LWiMyYlwaOxhzcNy+70tglvwlWuXd98z7dfN20
	8BRFMj7t8Y+eEsUCzz7nqb0pVpJKKkuXowxzQXj8gByMp0Cg3+Y1jnRqe1nJDe4e
	EDNrSPaCn3+0FIgK20uGlPsGwfSsEKPsUCOtrE90DXy+Qa665KUKmbvjEuBjH7fm
	sAdJmAI7n2Xak8TAUkdLrKx5JZFY58DyHpRs5/iaxnKLdGzM3cPINVa3WHtqbKBr
	b8qVUPQdbwmNumd1LTMcSt0bYjhnITgfFZ6DRrRQVCFMnqfWJMqMYjiygvUQAMOZ
	odGgYEOe3TjLlX6PgduO+C5xC1ZrMLIDDzF5Y0YzNp8sLTPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s24s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 12:43:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so42800715ad.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377023; x=1791981823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ge4UsmaaPXwMQSgwmlgfa5Y2DzK0kEKxxkf2gt3s19A=;
        b=V3bHpMQ5QKQ/AXE2qbGQjwlQOaVru0/5VbduBmw1ISJVrwXw3bFG9rr8/aL6bdgJA6
         2ijtXYxK4cNdKK5q3UAykXxYPczJf60Fah3qSK0kdjD/FLBmHPGPHOZkKQRDauA0lLqr
         a4E0LP+Qv+QUi7efJLN+pPNR4GxbTDT8NrYRzKz3rXUXgu/82Tyu5GKypEb4GOq6s1uU
         1vbVu+c865i07UvxJdUfwHi3vRNWBcRErADb3Nf6yw9Cyxi8kta0WSzFORb4GVdr4bbx
         ACUFwUwUqhvO5+uT7nDishQEzHRJDoGW4tKyV5GdAZ1zjQUmlzEw01x3unNCEcTLzGc9
         niDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377023; x=1791981823;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ge4UsmaaPXwMQSgwmlgfa5Y2DzK0kEKxxkf2gt3s19A=;
        b=27GzyaL/DFdqGNo94M+A431p56Psg1+jDhO9eND6PHno3Xm/CGJI1ujaGEVZicwioP
         vCAzNSP2zH1TgCD0JH5akpmMhhtHSvlNYZgP9WV4pjbDdOMBhoOm2gvRQ8dN5xYrmP7o
         +JdWWGqCUiP1gyjaS98JnEEJr5DnXbhtEGDBKIXr6JTNhklm+tBtStweji2li9EfQF1L
         FJNLf2lmSXaj7lHDH4HgB4OgY4Kqx2LBx6UcTs3yado15rC3IBRQwBVErPtJNM2qI7dz
         mMWgsihCds6CS53l10twUNw2jeZmbPGmTrL0743Tj+bs0mP7pUfcZsWq8lAnnohEDE5P
         SfJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNV6daMLHh5WW68KRwD9OboZ94QXquVrKXaDGlcEeRxQ+y56r5W8VvMPNP2mY+eKqwDc7sxklaTol4@vger.kernel.org
X-Gm-Message-State: AFq9FYJcfIrnml/Er5pRtEgldJsgCdAYTaLCFTMUmh1dnAZCxEAdrmi1
	DJV8DOauoP2GUYLwnmf9DwHZ2Q5v26TSQ4grd4nl1zMs1pjjQ4PfiyaY8lRmwWSvi3BLOpMHaTF
	bGGWDUBVz4igeRYEBkjwDnPVujvPF0k92ptTl/NoV4tTY4AxfWnETQNIZYeYwKAOP
X-Gm-Gg: AYBFou2CNyp+gPPLSNv60jp65dDcneEX1aa9CTVao+13GjQ2tgZC320VT3FkvAVmi1L
	PAzmIhC4nZPj/42SK0DwIz0nI+PsOV8oEKxToDfoBqclqrvFi32AH21hKu0eUZROIawuzqK+CfS
	pm7/Dt9SdA72dP9rtGiR5yXid9NsObjZioKBCUSSSMnssgKjZIwf/sfoz9tTDz2x/XlBeG3Zqmz
	eVvWmr/pbL9Lux2ssSs4EXRh67SE0zocY8DtqLK0j6HWqfZB4qQxgoHw/zazPHt0DTWMFoauZon
	pEhFb6xIUlT3VGb8aS3RhEOmRvTG0tLyhE8/9GP6epsUL104ALle9FiAv2zAJg5EI0xMO7N3CJy
	t5wcKKoD/jo5akUCj6/gqy/mQ
X-Received: by 2002:a17:902:8b85:b0:2e4:a338:365e with SMTP id d9443c01a7336-2e600536b45mr13501465ad.42.1791377022915;
        Wed, 07 Oct 2026 05:43:42 -0700 (PDT)
X-Received: by 2002:a17:902:8b85:b0:2e4:a338:365e with SMTP id d9443c01a7336-2e600536b45mr13501295ad.42.1791377022316;
        Wed, 07 Oct 2026 05:43:42 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604437bb7sm9680245ad.1.2026.10.07.05.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:43:40 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Subject: arm64: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Date: Wed, 07 Oct 2026 18:13:25 +0530
Message-Id: <20261007-master_lt9611uxd-v4-0-5eac97965ff8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0+xmoC/5VQQWrDMBD8itG5G1ayJNs55R8lBFlaN2rjuJFkE
 Qj5e+Q40EJPvSzMMrMzszcWKXiKbFvdWKDso5/OBci3itmjOX8QeFcwEyg0R2xgNDFROJxSpzm
 frw56dKRlYxxywYqsN5HATuPo0yIcrNXK1aY3ClXnHOeoRKOJt2i1kAU2mrt2WKTfgQZ/faZ5Z
 1my/bqLc/9J9nntxQp0mUvU9KL+stxW/zFcWmFXI8Sj/woGXIK1dYSsAKElM2jVGqS63U0xbi6
 zOS1GmzJ+DnAN6z8s5AZygQglBEoxWCek+ivd3+8PPW9l/HsBAAA=
X-Change-ID: 20261007-master_lt9611uxd-b0de647ad012
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377016; l=2210;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ti8tCeK59NnVT6ZgdMt1nmI1QkUPgRpOvJOJIvWc1Ys=;
 b=6JiuUYs7MQe4Hvrhi0t+wwfyQ1kHu5VKZ1KccibgWMiCmz//qIzYEDw0LXYXZrU3xDUnfig4L
 6UlQJHkmyZkCOZcR4niBvBRHWLIY8EI5roQ8dlh7xF1vsqMWof5Y5pR
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: XcRozx71drMlEFj7xcU1Huw4Um96bQFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfXx1uvvsySgoNh
 uRccPK5tjBRhGRX5fi+qVqkKcFp1RktHR5LYfRuRd1tbluiyhEZorJNmX0482uwS07ebbOYU6yY
 BlNtRYmu5TIgFd/dcTDj9Fbe/6ycxPiNd3C4Hs4hm8aeVpm++7MLIsthOAhiCRT0o3MAz8JwnFq
 T1hnCZneOJ3J7sxxcv/uD82OsKkUdLPwPxRE+ujO0gZjYLiPuX1Mx3FklRRYlO/8hXSJEl6sl2s
 Fx9S/B8ZTaAbXEiR7dLzECwfceIrqumYouh44IFNrfJgfSJhxozvAj3ejkczkQ6Vcc6mLzEgFdO
 msSLGYcHmC+IDB6VtgVHIdO3LgkFSNT24bRF1gmXa0C5pL7ptYuXdxjarXy1XBD9BzLnUE2rBMo
 lUEdXM9lmPhf+6oWMLRdwaZn24V1F5r2uk3yOxeSxrKcikt5TmoJrDPufHxKQa6tsgEPt1UdXCq
 uI36535QLDzdhOyS7Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfX++MyRHHVOOpV
 NgfZoElF7FmeJoJqDmluAHFsqSbpYWkOiL7kNp40Uw/NaMtWIyo0ugaKP/mUIgcRcVwScBjAGBY
 7eP6ABqPc4pHbjgorVXNEJV7mX8OMWg=
X-Proofpoint-GUID: XcRozx71drMlEFj7xcU1Huw4Um96bQFa
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac63e7f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=spVTYJvaZBYa3VVWI6cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070050

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

Dependencies:
https://lore.kernel.org/all/20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com/
https://lore.kernel.org/all/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com/

Changes in v4:
- Rebased on top of next-20260929 (linux-next tag).
- Only two prerequisites remain: the display v5 series and the LT9611C
  driver v16 series, as all other dependencies have since landed in
  linux-next.
- Rename lt9611-specific regulator and pinctrl labels to more generic
  names since these will be shared with other display interfaces in DT
  overlay.
- Link to v3: https://lore.kernel.org/all/20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com/

Changes in v3:
- Remove superfluous comment from pm8150_l11 regulator node.
- Link to v2: https://lore.kernel.org/all/20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com/

Changes in v2:
- Removed port-select property.
- reset and irq is aligned as per driver.
- Rebase on top of shikra-display-v4 series to pass schema check.
- Link to v1 [1/2]: https://lore.kernel.org/lkml/20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com/
- Link to v1 [2/2]: https://lore.kernel.org/lkml/20260618-shikra-work-v1-1-dc30381263f9@oss.qualcomm.com/

prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-message-id: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260618-shikra-work-ea756b564b2d
---
Mohit Dsor (2):
      arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support
      arm64: defconfig: Enable LT9611C bridge driver

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 110 insertions(+)
---
base-commit: fcc65d3aba5059dd1105276e180c624110761d8f
change-id: 20261007-master_lt9611uxd-b0de647ad012

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

