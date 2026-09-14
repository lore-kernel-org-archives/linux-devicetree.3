Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A87040E8D3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375419; cv=none; b=mq0tNEQc7OIM9Mx/JogbxF2XC4D2PG5oNhDKk1biTwwZsptm3z5b7SfFZGuD4RolDikxNSqrxr4i3EMEUGmHjb5aIECOLaTC1HfLSxCVOR/8tENDEpNgbqiux0SUmszoh87KRV+wOYLc1ZwCOFIH5WQfMVh/lvaldRfSOvOnc+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375419; c=relaxed/simple;
	bh=nr+Ex8WrN5Wz7qxFW5WrMSh2JP60oS1cFwUmSfg+KVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y91aWJKcaw01ea835ZLGiGjyI1D1AIZwzTMtQS8ti0EQCInwv+uAvE9z8w5RspPghE+RiwpsArC4uwHiydEM7Shxm3KW1Wc0SIYTFnW7n4DTLxj2Aj3b4fsxjufkBFSOJt+ysfCA/kkKF72P1rBDrnQMLFtM1yWwN8JWxhZ7GHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuwUcd7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIBGekcu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuwUcd7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIBGekcu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8SiTo594729
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736M
	PnhZ2lSQ=; b=FuwUcd7Bm7ncNaKvvBUxpXOUtTbRGeim2+yATkF93Ngn/NA1Q9I
	R9W7CZbui9nzybwiRomKdi0fX3wm3B2bYWR+QCsu5r83raydU0rD0/V7qG1vNt/o
	g5xG6oMCi9CbvzPdZhH8zsFCp2C9aMDBdTSsJNae7sQH/uaYkwd+1seGbfUjzB73
	67FKjmDvITQtM27tJCQkFGQtJdP9trEh71WLGg/HhC1fBvEuAji8W7qIXkZahWq8
	VpDZBs6cs+MKjbqu3iCCrIMyLBAE5DN0VEkEVglYFFySg7fGB0PwSTqevTEs5JUB
	wAm47JU5YZ6bdTgaL3r8+KTC2MvfS2UamcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr1s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:43:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso4112031a12.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375403; x=1789980203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=NIBGekcuxwrvUcbGI3+5KtCOC2J8udkVi5B+lop3a9v6gGWGUGriK8rMkJqvLDRFcW
         GQ7uXVBfjwl6JoU3lMadkAVJ95NLd/6DxAP75jlxBCRv39YHShS8DvXcro6UQhH5p7pB
         NBRe3ISjeXev6lAjjlz7XGiMX7BIqGEDO6iYe8jvZXyUo/+a2kKC/wf640rtwZDni28V
         4d45KHwZ0PPD4lbmIQqcways7jate1VngntKYLV1PimiWxsHOoUk8yyv2fQl+wrBTvbc
         F3wO4rl/fmmPAlugDrEuOMMi/lH95PH0NjxP0Q4RY9G3PN2C5Wg4cz2/tNuT5lOhmNot
         HDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375403; x=1789980203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=HAkOJ1QXuKsFpbjyZi8R3RvFi+5bCD58LafLpoowDiAw3AbGFuHjrTIDUD3UncYcjp
         35WHlz6IJjjiQD7KFyG/krhCXh+ayaWenkUfGpkRcpjsF25fs1QPsTe1gzdYGrKL6nF8
         w05khRoLQ4VlQ9ww5NS61ZXZ2tyHIqV3dIbPJ2RdHgGd+Lmc6FCowQkvKQdVNUGi7KZF
         g2rX8CqZOD/8bxzl0wnv3p6hQT6q+8zGpvOPRKCl38pHtad4wp3bqYYCDlpvA04SRfaU
         XDN513f5p737lsjk3KC4HRYqYqbfiLrKzrgXhWYAAdJMfJPh0bltN5u+q+TDMz1UVUVR
         JBhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7jom9Dd3sTtVEJO2x8e396YmC8WBg0yd4vDYYvQy6/1B6kdrLCZEmgDOGT7EASlw9xinoqQUvebYx@vger.kernel.org
X-Gm-Message-State: AFuF++lbSlQdF5aeeaP2BA/QCBRyvmaYAIVftldSpSBbBpY8788aO8ly
	JZaqN+sCWClR0HBBFeEAL3TmMIKSKHdzsFyQdCSe5bgsI0h93gmCL3+rol8QVvzEL/DqkjnmTDv
	Jt7tEtR8VNCkacxpgGQ3RUMuZQ0ANNATP+cuQzGPajg/4ss3P8JZGh6XoVBc4BI8TD5EJSxC1
X-Gm-Gg: AYBFou2WlANklHwOZldKeAcjbmJcAKAdhSSNP4LixRmBuQZGV6XbQdRbh1x/6G05R/e
	9Di6MpLQsfxQ5bA8Px7XOwGNsUxLIdKsDLj1tcm/JprgHdhbNPEDHfWkrHDrQnPyP+T9Ijrc9UP
	BvpJfZXZ+Scdkl91Qa8vu/4WuMJ4pcp1qj7uivUpK5++6pZbzdyTKBQgFkmCf/fBIfRaeJY7XaG
	QzvDiBgxdU9gsRmXus/sR80uRWge0nMFgkvW/lJQPZ5e5/6LxnX5pfPZ59624a/gT6r6QcoFrb3
	nPaR1nBv1x+6yjbhEbTrovbldZ8uQQRHt5WYUwR/ufn2Iv1w0VQZJPDKfaSzpwXZesFHwuojreT
	fq3wYta46a4LatsTb0FsUd+BQ2W4=
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171801a91.17.1789375402743;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171730a91.17.1789375402241;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 0/2] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Mon, 14 Sep 2026 14:13:10 +0530
Message-ID: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n-y66AAxPrfDs3E8-LhUZxpi0zdiphi8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX5d9LbAm3OaWO
 WHwLDhnCP7N0pFsY5fmZROJNLa58ZKHbHi1v6bOrATKynM3hpE1X7fE04axeLODinLxlr2EDqjr
 Y7KZhD5/J6JqonHoacDWMMq00/2z1w0=
X-Proofpoint-GUID: n-y66AAxPrfDs3E8-LhUZxpi0zdiphi8
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7b3ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rQWQmZZn-rtmdnU4JWkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX0OTPor0yp4Ef
 RqT5pShYPjfeJijilh8YrL3K5T+YhC/3upNfmtMLN7lS+TpBDhj8iXBTxHEYfzz33NRETFY1yb4
 /mdPZ6tSHo+8bNbvZoJo5bcKQGXAByeXl6n8kW4FodOI5J0v1MRoR4YYRnqys5sLZ8IZOE8VTrC
 2ikJ35N1uSoBauu+HqaFTBF1wQbvrJa0zWIJqniOWJzngTrwzz30/7/ytlVvLE5jU8wbk2+49eo
 y+dg8eu64pk4tBYoBWPOx4RJBOCOwFM0Gb2usxivi6xWAWqZ8MgRT9f9+1tWcyGKds9M+HubrlT
 W6M7UhHbq3zMJvFxiFtH1pWyZKC3Dadonpr9F+/SLeTU0CQ+l/BsDwcbCHY2aEM9XMU+BTx4BYB
 E4+svenfv3362ZwaJRMN88cHpRgK4ia+lpnYtsS/kM0gKbYEHoGXH4lfsJjhNcHROs/RvqXA/wW
 xdlDS9rTaPVG1mtOLHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140121

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

This series should be applied on top of 
https://lore.kernel.org/lkml/20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com/
to avoid merge conflict.

---
Changes in v5:
 - Replaced WARN with dev_err as per review comment.
 - Link to v4: https://lore.kernel.org/lkml/20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com/

Changes in v4:
 - Dropped 1/3 patches from the series as that seems unnecessary.
 - Added maili cdsp pas as fallback to hawi cdsp pas.
 - Added Tested-by tag.
 - Link to v3: https://lore.kernel.org/lkml/20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com/

Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (2):
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  8 ++-
 drivers/remoteproc/qcom_q6v5_pas.c            | 49 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.55.0

