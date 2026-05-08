Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26637BE9C
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224828; cv=none; b=N7jz3GSEHDGqm09fqwEuDyIUFTBo4vA+XnkvoO8oUvfr/oLVY9TRTcoMfBfJisWuhHxYO9IhJgNG3D6nDP9hYehEgCpjZm0DAe4Op9LHSB/86Gp47b+oi6qVAlXGyt0lgihEi0jC9L64kaZR9V7yXhabiaSF8fJJ7WDjEZFFkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224828; c=relaxed/simple;
	bh=5YGi/w9G417QgIMrEKDmoqpGG4WU/TVnoOtCqviIoKE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZgpwpukfHEn8B2j4ogSxFJbl/PWJPXtALVyDr5svQwxqzcqKPPcRjKm1JYgXxA2poKkshbccywjZQiXr5ryBady//DLxhDpAe3lBMW25PHrOpRkBTeaz7g8BVu8GTz2IjdyM3dCYYzPYzDzP1lPIZWFmJkRN8j79eO0SOVJ/crU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBSzj8iM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqvFME7e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBSzj8iM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqvFME7e"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jhXk260579
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VZTVQNI8Fg2HrJNibJiJpT
	ZcKrWapAljoowoTqLwyVk=; b=bBSzj8iMgjXW0EiHkfKXmsopCqKSKKaZIX2OGg
	Rg7nYLlnH+TVsakOd2a+Kgs+Aw7xtertW29xwi2IJbA4jHI14tS6ivxWbcD8u9+A
	PPmT/nuJwH3alcNpo1C6Jaq48i3QMsHRu03llGr5UXSVwM1kju1mFIZPE6TyX0dT
	Szrteqi4rf4SMXsg7a0O1hTMWUAqta+XdSE871ekhIBzi0xuUujhcFXoXlrZ58YB
	RuA8UdovTVe5N1CXzX6y6Yl6jz/aAn3KtB3IQH5V+zr4ljlkRMaMUYFAHaMXltGI
	CD7GBz3mis1kAc8PGJLpxNlbL1Sa9ofE5eCWAEkyngkKf53w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueg439-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:20:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-836d0184333so1675238b3a.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224821; x=1778829621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZTVQNI8Fg2HrJNibJiJpTZcKrWapAljoowoTqLwyVk=;
        b=aqvFME7eOFYaHOrFIPEbZUYbjjwB9J6qP+KKlLugfuJfcHKZX2HB29GtZ3LDj9+/K7
         kMbbSHIKVm3Vh89IjhEpacb7hTqKcGXaNjDsExrrXW9IxsP8Ox8/vOCAEFccPyC4gwwP
         VMe0mtx+sCqDsWxF1pQKolCllncQw6UOkbggUvAgceJ11/1382QKrrf6tyz9R6gkMNpq
         WjtqB8zOdDrRj54Lvy/wqHXG2TAOehiVhkVLOXA+uatlAk6zzEn94wXbvVitOCK0HW5r
         XkJqNuwrVi0ryk6qZNsUP2DIa285H0A861E9xoDZXxQZZ04ZiECnL2yx9tNkDOpEu2gW
         WY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224821; x=1778829621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZTVQNI8Fg2HrJNibJiJpTZcKrWapAljoowoTqLwyVk=;
        b=GAcH68bfA2hGriXDcpFWj1Ck9pcf00O+YX93EM/X8sRqBAUTySx+pbQHJMkSkfFg5u
         gB2aywKe3x2Di8CkClaq6+ZxbTLXeoUojvhelLQ5Kt2NZ6mbRxnl5pmuDpxMwk25NHxw
         Kt5shd8N4eFGuPgzm8zvqHT2QwAgzo+2VkJ/4xXpXzsq0Chyx4Jioci4l1Xsz2J0ypTb
         HCKUz+rd8raMUgk//78cmKdpzsNDNVI5ziOtfIM2JJObfnkzjZLggargY9f3GIzL4jJC
         dhTdoVxvFtobPztq90zF2lhwt0xtpfkv+VzN4qzN0B9mi4NkPXBSaACwZ7yE82vNmlPk
         4CCg==
X-Forwarded-Encrypted: i=1; AFNElJ/85VLUqSpjoHFbmdFLOlf4BBjXWLIy4Lycruxj0hvWQoetmq4KuFx2vvnJrY/kV3eqcAeu388h/bSF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9SGaaJNFUkEmZZjvNBO4X2IJ4a1bNMXRxA4Iu1bMmYexqIpBM
	VefpoXhLgYrdern0LjvjA08+S2ezRuS+GVHKWZV3j5uYt8Pb0NjZ56k8LeZbodstidlo2lCTnB+
	/5y67qrQTv8OKMWpywyqDgchXgY8MOYdJN1/W79i5kSn0qfPQJL747KMUGm6AqJlW
X-Gm-Gg: AeBDietjnewcdt9DyB1bgIJueJc9CJlw0rrGf+GCTtvBJ/i4e16nfxZwaU6xV9aJmg5
	DGFF1R66lNs30Lf1ubJFKQux/JdJecVBYhwk1tzOleRZ2PQYNiymgJ+zonga4lpd3P1u8TcBvfv
	sRJ6KY6dvCOF9AZD0dh3t1UpAT2zadipuoFWABssk1UQMZrjOMERMu6yJ+SX5Pyn27NBP1hg/qj
	7g0dVHndh6Huf37mnT31GestUaez475d7aIGkcTbjeO+IWGz/aqlPsTyvoyZoOp6nJDOW7BWE9c
	ex3ypCtyO90GlktsWzHnWH5IbnF0EMwPsgbn+yRNp4CyTbuUhIG8GoeeN80wwNqab4e1Go/E2Va
	bRHbhmw6zSbqELCkoQOxnCrdYqAzqDYZbnGS6A1G5YWQHf0KmvdE=
X-Received: by 2002:a05:6a00:4c13:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-83a5e34869amr11326785b3a.43.1778224821032;
        Fri, 08 May 2026 00:20:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-83a5e34869amr11326746b3a.43.1778224820457;
        Fri, 08 May 2026 00:20:20 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:20 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add compatible strings for RPM and mailbox devices
 for Shikra
Date: Fri, 08 May 2026 12:49:46 +0530
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJOO/WkC/42NQQ6CMBREr0K6tqRUpMrKexjSVPorP1KK/Uowh
 Ltb8QJuJnmTyZuFEUQEYnW2sAgTEoYhgdxlrO3McAOONjGTQlai3AtOHd6j0d5gfw2zNoPVcfT
 6NyYuLSgHRzhVpWNJMkZwOG8HlyZxh/QM8b39TcW3/Vs9FVzwqjBWtQcFTqpzIMofL9O3wfs8B
 WvWdf0Ab1Z6EtMAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1285;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=5YGi/w9G417QgIMrEKDmoqpGG4WU/TVnoOtCqviIoKE=;
 b=K9WKiTtZFiHq8TsZcfqkDVqbEkZW6uvWJd24SY8hC+qHmgJ/eMcYQYEzqBfOv3ZKZ5L6SPYBT
 xYP8e7pHLmsCiYrOa1yVvhpnWI0ThUEGSsqgDY29T8oYWbGcTuoiy8S
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MSBTYWx0ZWRfX1GWuy0lCcD7U
 kQKefjfBkVg/j1eYCLVCMeY2LHaX3ERamwmgh7x2IgAmRysSy5XrScoK3YKB1KfCjVBQvvSJ+AB
 sfl8WJqKilxLUwP7QIxoOb3erU7ercw6Nzsw5HWDrvHQcGPTsi6WlhjV+FQoJlsn8zmPnMAbEZ6
 nu6+04woxcqZjEQPaz0FmvrY6MEwGwzoDZyA2aY/lcafmq3L4wvd3dyQCr4Hm/G14eLwH7UXKBt
 nkN+xpmBNrH1N7mU+X+kXahXiiGKwffc84uAu3aAcfOaDgsIT1ZmwREg8Ket9TEhBvRcPBWRVSB
 G66bDlAFnOzhhIvGF1QRp07FceeG1WnIzdM7Q5O5UQLpbuOrh0QpvXwkE812+Q+PpSIsBlbpz2r
 kGNBZ5aPbGBiUjXWbkC9QImAVzSD6UOSJrp9beOshfdU0nwrwD1jsQgbiOjU045OKAt70F6uZLZ
 7LCDHjwFpunhYPcz61w==
X-Proofpoint-GUID: 1mETgmS8oMW3Jn5OFKpcOuP6xBsdXL40
X-Proofpoint-ORIG-GUID: 1mETgmS8oMW3Jn5OFKpcOuP6xBsdXL40
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fd8eb6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MCz6-0gsceDSkw-wabkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080071

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.
Also add APCS IPC driver support for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Require "qcom,shikra-apss-shared" to use "qcom,sdm845-apss-shared" as fallback.
- Link to v1: https://lore.kernel.org/r/20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

Vishnu Santhosh (1):
      mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                              | 1 +
 4 files changed, 4 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

