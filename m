Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBDB3B83FB
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895596; cv=none; b=txgkJvog9/bTh72gnK9RmKAkKLU1ruFqxcNobgPf8tFrwEzrUoS5bUrS15pqpetN50dm3uX71u5HZNYp3494D9cq9/PUeQUcq1kdI+jSYmmsUHp78KDeTHFM7jmmL/YYxjGDwDoJpb5lILV0NTXqO6MBHFAZOLxNWDK+/t+5YNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895596; c=relaxed/simple;
	bh=LcV03W46H6g3SUm1iaLCXDNF1twNf9lkDV/Hbq5M6Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EhQqBt5vh03QFXBJvrBW73/MeUXiEeS/eN3KycDw4+Hb9nP5pAYINGT3zNwbr95QyXFTe7Aeh8tpSonvxpySJAhFzr3lC0jrhBymXWRpEI7opxp2H8h1Xv+uR8Mkpabgynf1whH2dAiaNijAWbVdzhuxQxrOSORYU7I6YLhOkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxTwa8I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrLjeaNY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxTwa8I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrLjeaNY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GIVm480310
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lP3vinKQxRygXko5Q2tIE0
	8DQYBGJ0utHSduZUN2bnY=; b=QxTwa8I2cnjQnvsCCOWWO4mbf+tzTQypQNfMWl
	xFOOEfkc64hKnH64WCIze8Adjq/fylI1OC/gBIVVLPnR+bslVDVEE1m1ICwIOu5/
	y/2jHxO3y+5KvageeJbKw4ZrutbxjZr4EB0txR4wnVx4HVDNUxN9mtc60BKK/Fm1
	CNAuLsC1LEwausxbw98t7NK2G8XFAeNgWZj0+DbNwpKzXFLzKqFDp/G7Zzjg9Phv
	OB0/2CUasRtlz5vH8aOifa0SSXE/wITgYcjMqi29rJOlMbhsfNMAUouyf3e85pZt
	MxnlN05YMxln0c5KuKRvDG9ugsk71QWqor9tv0bZb++Air4Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tgj07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:46:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed9113e03so177500eec.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895592; x=1783500392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP3vinKQxRygXko5Q2tIE08DQYBGJ0utHSduZUN2bnY=;
        b=YrLjeaNYRvi1a/ObQw9A+dpvW67gJ80E6N8Hg2vljqAdXg+LA47OWV/6xIK+FWEyj5
         c5SvpfIn2GELD0aDHRi4vBJWdjYMzN2nHnMu28sMGKHGW0SNOwcp/sCPSJklBAKYNIj5
         J+xAb0rElqF5XCl2mECnnj16v/Qe2KoApZXPCi3YPlMooLYKXDwxpDPENUg5OeDoyesI
         Yn/NhYfrz8U+2fr8ngqlcASHs8/MvF2MhXWdgu5uGnR0FjlsBgRUFGXEFgCPnI+cr0vd
         +0NNyRdFC7rhx7itAwMA7AJwm9f8lAXrtYLHm0bUJFuwnbnjIymD+GcQo3uVfpTFOexk
         B6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895592; x=1783500392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP3vinKQxRygXko5Q2tIE08DQYBGJ0utHSduZUN2bnY=;
        b=RQ8HCNh2zeXhhZ5qRF5tE7VbLmhngAClg/pOk7TSvBs4bgFxjMb6TI+GWs09Wzurvr
         So7pXR5KRi1ZItPSPiFlR92ch8A+y4BDRaXFp2hCtcze6H5xd1OalKdIPci4h1uazCqB
         SC+2ZKSD5bzDeCEFpIwG7k07BvCyNqUHzSyBtzC0NOFsK/7rzOZyR3gqKEDRhxxHacZi
         YlRDE/66VPrJe2FuZ/gDWmTaZ19JHTqg6+kV6QdUi/k0ERj69bVlnOmzDiadHwFPHg4e
         zlS7ca78RRdbiGYKILKu5KohWgNpWw2a9xGmmy49fFhWui2YVqYrSAONc8CZBw3g9Y5i
         O8lA==
X-Forwarded-Encrypted: i=1; AHgh+RpU8fp4Ijyj5yAvyTudcIKVsbWZKxHkmSzczuZmwI0M3d9QgQmFmzoAAFBJQJdp/ZL45plneWDUm/+a@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5RnIBsqxa4SpHvG872aLgq/nBvet94mBSuk+CNaNPRZBuCUV8
	frfWtFalr281ap7uCLxghGMZ2szvu7tZNQf0OmHJRbu3mDRkXLn1GiE7+0VzWejp9ge9SRjijpN
	+SCAx5LaGeDV9lbgV3+h2aeFHsLmepLEV2FF+KwIFkJlRnczlp4SYEaP7LiLg8D30
X-Gm-Gg: AfdE7cnE3CFCU4mhLaSLhfOMkk35yk6IwavPDIuv/fc013RquKPZS5ntZcwjF/YYRa7
	+Y/MHgDYviPipAhRXUZ9M85lLZzV+9cZLYyyIAqf/X8agmw1t7zqNzJSD7jE2HvMORJCkOAfKnF
	d4dfTYYlX2O5yCrNb1+sQYS8V3zN0j9aWYUlpWW5DrEN0XhlOLYcdBzGjWnOcfPiqGEwMtKMl5V
	R8sPqdCUGwvZYOpoRz9kmeY8w2RiAxxoGeBNL2LbnNKSKAaUtTBAoCNMYQ2dkUkjDNqvf32/qEt
	sEGQiWuzuveq7rOnnqOqoLaRew/Sviyg4EZXFmKwZaXaQfsh9jqUMkp6/UBnFHdczXQ2X/7mpVC
	s7f/U0bMTEqLgQorT/oysEwJ+IaPYNTHxVHqOfUl+DhCW3oU0UClmWvZMk64FllaFAsAqZxiV68
	U03F9rpcyy46VjChVCSe2p/1yAQHYVenuKHR27ebL6
X-Received: by 2002:a05:7301:3f07:b0:30c:ab96:7302 with SMTP id 5a478bee46e88-30efe949021mr955954eec.18.1782895592444;
        Wed, 01 Jul 2026 01:46:32 -0700 (PDT)
X-Received: by 2002:a05:7301:3f07:b0:30c:ab96:7302 with SMTP id 5a478bee46e88-30efe949021mr955914eec.18.1782895591825;
        Wed, 01 Jul 2026 01:46:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm4891524eec.28.2026.07.01.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:46:31 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable ipq5210 in cpufreq/qcom-nvmem driver
Date: Wed, 01 Jul 2026 14:16:23 +0530
Message-Id: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/TRGoC/y2MwQ6CMBAFf6XZs5uUKhj5FcMBy6vugYJtMSSEf
 3cjHmcymY0ykiBTazZK+EiWKSpUJ0P+1ccnWAZlctY1tnE1+3kJCW++wFbX4O1tQE1azwlB1t/
 p3h2s2aLDckh69Bnsp3GU0pqItfB/eqZu378BV+/LigAAAA==
X-Change-ID: 20260625-cpufreq-4e017fc09de5
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: mgE7A97DaNHrsFGPOTnaDVFzoynb0tOx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX3sUzOF2bHjjP
 NF8WBsR1P47pGeYiwFLhzYwSsjJpQurqPGflpU9REwjoAHUnCe8QUr3zTtQG/d3d2bgCv9RIRG7
 DCp3qx+ZE3Cq3Ac5r51L2UlGEbbYvNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX8hZs7MIlEHda
 cuF/Hx3quQrGzx9Rl+fGNwN6n+azaN731QtgiUz1UY2kXz3Q2ZOBpyr8fwZFB8l0KlaTT3vcuED
 VkwXU8OmkdhxICZf7SMpc60kMMSLjU1AD44Mw57ThqBUVwRKiSR33KLYLrvopzjb86QxSJuPHVp
 FQW46WPUp6/yme7gnqB9nQHFQLpiPIvoJdhpz9CAUjPBFEpsOZp56D59W2/+ECeGNFsVopHqhBd
 eFtsctD7TWUw8/XEkATw+8Oh+LozTT6QRd1Y5YBF4EuPpKHIaofCxFV1asJCVFgv3STT99B324x
 N18O6JyBcXBgO7slpFw5DCMiyHlLF6OIALpJNfs6RzIRaqnHkwOVnRs/jHqpR/jgGmP7pgZIoz2
 F8RDTPaj4/Y2Kx1/K30cnuBuA8tl9tJHd9zj+tjc8nyUEfKvzoDKSDwqqIO+PzqCFr7TWAdDHlZ
 Y8N1ZoedazXhTSgq2Bw==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44d3e9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9X8JnDGoADxzNrPhSwgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: mgE7A97DaNHrsFGPOTnaDVFzoynb0tOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010089

Document IPQ5210 compatible for Qcom nvmem cpufreq driver.
Add speed bin identification and match data for ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: cpufreq: qcom-cpufreq-nvmem: document IPQ5210
      cpufreq: qcom-nvmem: Add IPQ5210 support

 Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 1 +
 drivers/cpufreq/cpufreq-dt-platdev.c                              | 1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c                              | 8 ++++++++
 3 files changed, 10 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-cpufreq-4e017fc09de5

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

