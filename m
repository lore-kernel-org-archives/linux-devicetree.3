Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526A317170
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211693; cv=none; b=rZJHbFg+pI1sz9ElEBDd1GHfi408rxjC9ARZSll1OH7VxdCrfNVitRDiYsUxApswWJ23pSHqRLY3s2C/YTt+GFl0vCiwzSK63P8zDBjm42rg4QHMgdS6xJ6MLKyvEEiHnQZYkjPk2yt5E8lrdyVTiJvUZurfelgO8G8UHYhy0x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211693; c=relaxed/simple;
	bh=MwhhvygqegwVnPDpW9RwHJgvDzXcoinmHS7+DbYP/MQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bUJdAZTWkTp0TQRyEOLR7TvLM3q3kdSfUV4AEwusQQLS7SQD9wUTjZ9SbFBsOjOuUPt6eapWRK+6n2oMlhFsqOO3qqgLxBd5k5ACDHRKnNezV3JGOjnCYqU47EZj5DDFru+xFZ5D49voEA8eQLQ7Qmq/BwllTbLATsvgOxwz9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdtTGntS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOp7VLOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdtTGntS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOp7VLOA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExGui1237885
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tHNaBqFD+p5JbhQVWdOQk/
	1p1Uv02C32Qb3jlwthWN4=; b=GdtTGntSyMMySfd6sAFGASYMI9QlcqLr/iLcLO
	GYYuzeNICqrWW1lBoFHG2IgbHO19rSwNtTQc/qgAjcWeHqQrhMi9F+1i7j04b52h
	L8blWH2RnHv1hWKvHxI5sLftCbgt1qudLF7Cj89HOBzyHZKxYCVPdUtdBohX3LpE
	iRxrBRe3kCeWyqBgvulOxJfd7yavwK8xOuVmqeT2JVJAUKiYWEMt1O+plwas7KEP
	wZ0LuaXumJrMXvjdTz0sEbJ0Vir8AytpEfwbv9xicFptTT+awlkbnE22gDpOAHis
	HyGwsm1tnp2jAXXbHPdExFzkxjEdDN6czVVBrYbhRSY+EG5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3srpbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:28:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso57815595ad.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779211690; x=1779816490; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHNaBqFD+p5JbhQVWdOQk/1p1Uv02C32Qb3jlwthWN4=;
        b=JOp7VLOArKaomnC9bsjXgInmOqmmXpGpgW7fOOd49Sp6kFad1vo2M7WwOHoLoiYgxT
         FkSCoSWQ+wcslDNrgGkZMETbPmSUutbUkJgSLsDPfYvPQ69sUQi7YsjVIxxX+10YhYu+
         6wptjci+d2qwxzzc37j6+226eJ8yfnVNO5yaFtPtUgFMLxU/kEDpjXPtR450nHLwcdD5
         JlaqZu3iqwkV1bmYgIEQD05yONAyU9uQ6NifS8FzSGGEE7tw/GVFohSW2Hm/3alYo+mr
         jeYXJwnz3APiFVicQyeka5PuopuIQWVz1gyNmXaoSMrMI6kHznU+5uyFBKGRTij743xO
         QJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211690; x=1779816490;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHNaBqFD+p5JbhQVWdOQk/1p1Uv02C32Qb3jlwthWN4=;
        b=mD+rTFycrdscy0DkCIH7IkBOT18FZiWk5SEXBwEtqOKfscpIiVTNqDiIWwlkxzYPHD
         M+LIomId+YRhfba3+Bwtqtll/OtcIeh5CYcr0qSNB03dRhJgpX23j+xNC0yEI/4zrP5E
         PazsOuUL1VgGR/l+uKL6TXlrdd+qlqCun2bajkhsgfJklHbujIjJJaeUPGfibpSn/3bt
         Cuoyi2WHBgD/yc2dknr3uy09BOdF54SJcoiiWexjZyRJRRHNn0HUnkhf0JaK2v9bLIVD
         HXrKksk0FG9cvekaGlW4jhq5cfa/Ds+AzQK2sc7lXqeXQ0ThZKt69DHGe2pzsDuyaHAA
         0sHg==
X-Forwarded-Encrypted: i=1; AFNElJ8CBeDuFrML30qLopn42+n8HlGz31+bPXdfzIz9FsJzgC30A9Eoev3wKdR+m7wsOopBEf9JPWJmgf0B@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNtyBB7oW+jXoAM3qwDbJm4eYUjIEyM4V5+o3iITG6YP0Nwmo
	ZLRaHC1GplM16XvYWpmjg80UrfsLu5z51LCpk6bKbyyU3IPRVuA3EabM2QGJyioePerUzzeDI02
	mwGILP/tFkotCZCoOZWts5Ej7khs3IjPGpdaZWt4jbX6weRq5G+Ei87gp6v4ogyHF
X-Gm-Gg: Acq92OFp+lqpitnxKV3G4doZe+ssqws6nt0H0Q2bHU6Sq0sb53gVR3TwibPe77Bs6oG
	h4/nls90BxmoHa4Kh9lJB+P3owPwobU6Xy0CFG042DWUZrHC1nxOmWy4g+sYq9hgGmLC5naWk31
	rzohyJiJ1gA5JDU501/zGsdaNzSrXbu+aZDTRY+wkVeTSJCzy2VkMfkvxHZHuSskV2N1VdExrtC
	/R4FYiuqGU1QdAhk8+l6QfTaQuf22TDcD8bQzgLhAXViIkWNXFnbJzmu3lI6GYHg6HuQJDdQBWS
	c4FJ5tqhMpfja7RilVMNQpz6K1ynsVT6RBePe+RwkjhklivAlGzecrGL707MU99pFbP5MejZRxP
	2DCwA8ejLw7vVl7dvqJT/zKsc0oFK2i6sP/iqCfiQ/FzLITxG8Q5m
X-Received: by 2002:a17:902:d311:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2bd7e7e4ddemr148525515ad.3.1779211690398;
        Tue, 19 May 2026 10:28:10 -0700 (PDT)
X-Received: by 2002:a17:902:d311:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2bd7e7e4ddemr148525305ad.3.1779211689906;
        Tue, 19 May 2026 10:28:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d125159sm182248365ad.76.2026.05.19.10.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:28:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add cpufreq scaling support for Qualcomm Shikra SoC
Date: Tue, 19 May 2026 22:58:02 +0530
Message-Id: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKdDGoC/3WNwQ6CMBBEf4Xs2ZItFRRP/ofhUGoLG4FCV4iG8
 O9WPHuZ5E0yb1ZgG8gyXJIVgl2IyQ8RskMCptVDYwXdI0OGWYFHhYJbegQtzDi7YCfBRnc0NEI
 7V5QoFWKhII7HYB29dvGtitwSP3147z+L/LY/ZY7yn3KRAoU5nesyd7mqS3n1zOk06874vk9jQ
 LVt2weQOtXVwwAAAA==
X-Change-ID: 20260430-shikra-cpufreq-scaling-aff690130063
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 5EtZxdKrD3Df-J7u8YzDle48j5F1veex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3NCBTYWx0ZWRfX+t8QQ2kET7Kp
 tFPIsrg3PxgbCiPrD2QbTLtG0Xz9fu9zO8s5UChLHHZXi9Nl6Y45a+srZhu/r22TjP7LL0vvBQZ
 9XYzySIemTK9gJSU6VKZ+WOn+B58atkGXYmqc6GuWnWFYnMNJ99JRA3Sg4r534yj7p/PRs/QVFX
 Q1mo29CinBe9j4BU/qc8L9sUKh2DSZJyKUjgg+MpCTE7qZ31VzUfjnqsobosZ1WcozfRnKkNjfx
 vQdRXjpuZgpwFI0yodRLPLtsTImMNbHx+a511shAPPHslEMzxN+J0HhNhN1MWQQgVRU+XYVUye0
 JsbUVq7dPQszzPZcOW+cGfQ4Oz+CRLOraqZ20pVpmASaFrgflsECTSO6rMOqp4Wq4BV9XCGDH+3
 xPC4fOR4ZKVi0CreFRKnu6sxyVaX+gdkYZ50O9QPMBgky2YZ1v2zTzdGW/x7hPUUeWLghN5NNQW
 sjwHocCWLrKAH4mdc+Q==
X-Proofpoint-ORIG-GUID: 5EtZxdKrD3Df-J7u8YzDle48j5F1veex
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0c9dab cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qdwp8Cu8RznD16sri-gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190174

This series adds cpufreq scaling support on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Dropped the generic compatible approach, and introduced Shikra
  specific bindings [Krzysztof]
- Updated the driver patch as per the latest bindings changes
- Added R-By tag received in V1.
- Link to v1: https://lore.kernel.org/r/20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com

---
Imran Shaik (1):
      dt-bindings: cpufreq: qcom-hw: Document Shikra CPUFREQ Hardware

Taniya Das (1):
      cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC

 .../bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml   | 133 +++++++++++++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c                  |  23 +++-
 2 files changed, 153 insertions(+), 3 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-shikra-cpufreq-scaling-aff690130063

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

