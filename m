Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1631BC08F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 04:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215935; cv=none; b=gQl5uZRgiNkQzy0/soDn7EjeuAm7djplkcH5muaOnWFAfWNzRQx7ZodR7JZ8EHsd2hxcGYpbgYczA/3H4FETjRDzxUy0SQK++KPqaexi/yTXdujBqUfD0eDocWqbg7dGcGiTxacmiwMA3kQfOiW6UhclMqAgcfN3pUIm4OdOpAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215935; c=relaxed/simple;
	bh=P4C8k5K1ErvhgwFkZle4aus/aS+aZ/YlzasAP57cJFY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gmscrnx3kgBXTb/S5QAEeRhthevwcBNgDPl5P3ZZn3uqAXEd2wqW+fifii6JRCDQfEWvpnc9kSPuncifeI7/aUUAZFAUoE/4GCRUn7Ad1jxUgomgoMlzvYlp++WJo6N/Q1Bur++E0fa9lxwpuuW+c09mOoDfyFTIjPfCuK9RMCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pm03CQfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmtIrZnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm03CQfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmtIrZnw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Kw3DT2777673
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 04:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OBZL99WklIEGKlY5KCm0vX
	ttleoAmTjvHnB0CO2GC8c=; b=pm03CQfmFyOyF+C2ZG6PM84CWcx+VWB1pp3AYl
	DyPUJjNN6cRQLTemQVlWtzGwGpwWXn2zkuXyPJXNJX+WLTFWQgQwIuZU1sgOFFig
	QBZoMxwPJFlsJaGFvWmJfuOw7T/ak4U82JBbXgftnrbK7ESrHPZuPTYjbzwVxGrV
	DYOxUWKbA9PKxxJTMCpmJgmJxfO2YZVlo8nsXVvyQ6qq39vWbpv5TEW3YE/2VeWy
	Y39pQPdGUOI1y1MS4lziEm0ZgJLiwj2sW9Uc8N8NWou09HzUaLqrbu+otuLbfIsW
	ep+4K2odqYfMhMdJXxEfTGq1r1Gq0Ybrt500cURIh5Kv86jQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285hadm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:52:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so2100773a91.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 21:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778215933; x=1778820733; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBZL99WklIEGKlY5KCm0vXttleoAmTjvHnB0CO2GC8c=;
        b=WmtIrZnwCImwHREqHuEyoUnHfuAWS3MugfXZ2MJjGKTc7pF31Zag4zDNO6uFNMFWlL
         8v7yiQb4Jp6y80xsX4HbphRSGrhk50nu58XQwsWUcRt6R9mHy1B8RXI9i3iv+DTzUx+Q
         BY9eh9HOVMCqsZFBVbuD1lGNtF8/ozgFg3e/ydDMNWlgRQGi/tN5Rz6jS6fA6LRZSNmm
         dyzdnHkCBGpBA89mo/5PYRBTqPqrC2uvWo0TjI7Oue2CqYEednziyhPigU77PtDInHV+
         z/cP+E5C6tLWD4oYmclQ9VbNPF96Fq1WDTSONfKwhpgHxFawF7j9z49obd9zDKdgqUEg
         pGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778215933; x=1778820733;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBZL99WklIEGKlY5KCm0vXttleoAmTjvHnB0CO2GC8c=;
        b=MqhK7LOzE0Leh04OIygm2kfKsj0E9yOqFiBImMGiuCrkyDXJG15bWXEjWwgLm8vqe8
         HpTrThC2/5wnfXrVhz12YMzNrIhuAniM6OgX/HVi44M74D31aZ5D26JvapRLIP5lOtwz
         NDKyKLGerSt6NvwrDEyOGR6uTTcUq5iEl7fZNovfOJYxBPUvVm3E0mszC/bTKlAjeFtl
         p7U4LCOyDtRdNRUTwHUNQ/5aT21/bhWBwiFazGTM74v2QA4h+is7CO2iZiu/BAEtvWD5
         gTYGvpjKvq7qGtAGc7DaZQW/8bDEGjmnS/j4VqmTp+azSDb0Lj2nm2dneMV2egHuFaev
         wwvw==
X-Forwarded-Encrypted: i=1; AFNElJ9CVJJUZ9z0j0C9IqxbDKEQaLhr3mRglrq0i3dN3k0qgSqahxzyH6Rwas5p1DkXrfdvTFbX173gertw@vger.kernel.org
X-Gm-Message-State: AOJu0YzsakTbGV9x4qbZL6CBwmxD2kHOo7S/M7t704aGlK9OQnfnobcU
	ZLY25JU1qr+z27sPBhUO7CPHoyZquDEysxbUDeZZ3Dm5wpvKY69S00ZOX/cnmlVjwPClOlg+CqD
	s3H5ByPB5Lq3MsUq2iTvgqPAvrtBQD+Oc4YNxetmxscYXy/e7+pPmBOPCQAtqxkCO
X-Gm-Gg: Acq92OHjnQ1vmJH3X+awwJrSrWmVlwcwHDxD3TTW+i5T7IfzHjEq3K14e4sgxWaxns0
	ot/bYT0flPsLqa9UQ47VmPXKh2LPe/lc10QDcCcx0RyB94AnLxr9KnqrCSWckYMt5V1yhqu0GK2
	XKQTNDAqYUZ9bCrodk5cUG/Fwa+D6fvzNh2AsfrpHz935+8qtdWSZH4eRZ4E5gV0yJI83Ijull2
	aPoScd7QpboMkxecQlhvUpHx8mBIgf6aanb/mZt3MX8Ie4tpyag3T1lf6nzSlE7eapGVmmEGVk9
	4Jr8RA8MA/5tKtG4HWGsPdJC2TfX7nCAhCFsvc9tsX06J6LtqSkxwktAxn09JJy52QWvwmKOTIU
	2z9W6m+4fiurI9Q1EFGd4+rxJSpBvB16PJDsMIGHPvqqU9qll98Zx
X-Received: by 2002:a17:90b:2248:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-365ab9b8e81mr10834457a91.5.1778215932713;
        Thu, 07 May 2026 21:52:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-365ab9b8e81mr10834419a91.5.1778215932192;
        Thu, 07 May 2026 21:52:12 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bb9c02sm556076a91.1.2026.05.07.21.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:52:11 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Fri, 08 May 2026 10:21:49 +0530
Message-Id: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVr/WkC/4WNTQ6CMBCFr0Jm7ZBSQMSV9zAsytBCw0+xo0RDe
 ncrF3Dzku8l73s7sPZWM1yTHbzeLFu3RJCnBGhQS6/RdpFBCnkWhayRBzt6hT0R+nWOSdPIKEV
 d6M4Yk7cC4nb12tj34b03kQfLT+c/x82W/dp/xi1DgZRTV1VleWkrdXPM6eOlJnLznMaAJoTwB
 ezOFjbBAAAA
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA0NSBTYWx0ZWRfXx5nPwI6uHNAm
 stgfoq5xmDa+wohe375iBUBAFEJDj3u8tpY1+FsHAq0bOS9Vgh/BoLoYq1KeMRRg62OMAlYrkQk
 sdTDX96u9JXd6O8SSCXgv/OZTJY4huOVibmNgu13n0iTCIRpQbZQ0gW4m4djmBHcdsZsyToG/s4
 OUYOQJRpte2l1H6njBe8cd3hNOxr1UqRCgTT0qmwTI7nQuovEypDGiBGJ16xQpfaoIvN9MyJiy4
 /wKmWHMaj4K7EKCPtmL5Q9vvgdHUvAOdCAwe/wR7leUx7Q/aWgOGcORq8WL8TDqgu2jiE2uwT9b
 SQTeF0mODV+qoXdv/SLo7DkJvLCsCY796NZ8EKOvFC3KSr9DEQnV69JEDJoFneMEA+IoQDbaEy0
 m0W+G6pTFdZU/NeGWwWOgpbkGbq8LoQDde0vA5Ldze9QArpH7QEtRiG26WCwtvgLUla6o+NaU01
 YSrNLuhi8LmUADOIkRg==
X-Proofpoint-GUID: dEXFo6y6jAm9jb0ycMvtVpgA-8QEltFr
X-Proofpoint-ORIG-GUID: dEXFo6y6jAm9jb0ycMvtVpgA-8QEltFr
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fd6bfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OWuwaAbB12Tzs4-beUkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080045

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4428 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  262 ++
 7 files changed, 4812 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

