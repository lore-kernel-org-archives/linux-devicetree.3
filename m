Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E8D35DA53
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619759; cv=none; b=DEJasW8aXlhx9u8KnRuxjuLmxp6jSS3v2n6SpLFrRNBr+j0L9+DJfXicorW9AGPf0KJyv2xf2NGw6D6n1w8sWI6jLUwULvcXxK5T4JcqVv5K3jHxXejUIvGdRnflUdoDy9+lqDyCWdE3S3l3Kg4ew7SQEAoFVckQ9OBtmQfnf3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619759; c=relaxed/simple;
	bh=Fr+3q/m8eQdZKnKkiBfMq+f+wZxUQm+q5ZEQU3G7Fjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XiqcNZz7UHLNcAzL58F9gQ1egdQzRcE7M2dldHgakpmz9Iu/ndJq1zSCeuu2IREdDruj0VhF2WBtBkcmRSi/vaPHMrD2YLVKWDErlT8M4CIHVsYXz+U2uAHNycaL5qvz2kt0v7Z/SA3mCMSTxxTTjkcJr8/AP96Zna8xAWbK9IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cm9EcFcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HD8gVCKa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cm9EcFcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HD8gVCKa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6415L72U2480929
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 07:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KhFirPZNgW5encf6J90dux
	StBhWjPPuiggwSFINADfg=; b=Cm9EcFcRDVsv3ek6IFzzrWfUF4zNIljnAPNXhc
	bdMok3LPMXjI0HEnysFLuX8sQGSueWCFvfN0gy4BDUoLxJ/BmVDAlTT6nHDcF1at
	Wyzc8xIHfNhP4LOItrwhS1DSdOzYQUlhBXNS3fjrH58KQsQTyjImzxOHQ5gnWlKq
	V1Pc6148c9UPcjg+ed+QEnPcy77FFJ4ELoA7Mm6szfYGakA5sSD1I3LjGtOoGlYJ
	9CYBQg06nQk3E0GX5dv4+NDPjag3SjrQqCwgdqb3oRnisZml4w5RiCeA2ccS9iLI
	uKNQxbEJNVdxIAi5vuqE48o0ls8LPGKCmXqhaFDxk4LqCktw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6kduk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 07:15:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so4336716a91.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 00:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777619757; x=1778224557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KhFirPZNgW5encf6J90duxStBhWjPPuiggwSFINADfg=;
        b=HD8gVCKaxGwlSANui9BpA5uOAA/U9rgEThNvqqj8xt4moWLOdflonLBXflylN8tLt6
         jp+jWind+dNoyqsva4vhcDFzssi+WcU5JkvH8MDzzo/IltGhqdeDuLu/R988JMca9ZKB
         JC5r0KtH0dTLIDqgtEnSTzJKuju1m1UlI+NcGyNwiYFzDjTV3tyv1gd3UxBDWSfOUULv
         dhkFUvVz3woU6XV6NfCTFWmhQfB9NGO1YqS0SYeeD9GiM8jSAAggbxl6InpyD/O2CKnS
         IPSICfgu53xtAZK5HvB2331fkZnGdPLA/PdJMIZC2ZZ9N+bz7xK+k5M3t1Dxd05vdgGm
         5EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619757; x=1778224557;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhFirPZNgW5encf6J90duxStBhWjPPuiggwSFINADfg=;
        b=l3QqT9OdqTlukCgeLBQ0PbAIiev7U+yTz0sdq/ydTWptLVUD8NyBmBOailFoiy39f4
         ZZRMnN5vhyn/E8OKBXtvgbdC2UU91A58T5k9ZHL11gnbzT6SXaJ36zQ2YcWwatiZecJL
         oR0guwNi+74NkB97qVxFjtMONIljYuf2D4A8gRzJDUXtEjpgUKsSHqKNjpWGBVAjdpvb
         +zre83NaK5FSd4z5aFtPsRUn0ie3XMPWfl/wPBUwk/ywNPjv76Xudm0kKLz1fy+AQnwY
         TfbBsLn3IebcA1NBsTiwpNZV9175VMEWDpGd5RHKdZjMxRH/qwWXoNDQ3LwEsdjAYcf8
         eovA==
X-Forwarded-Encrypted: i=1; AFNElJ9DEDX4Y4AWXQN31+b15GSVmisdUcIKTNu3tjJnhIhqKcWQeNV7ZIQFfxgMe+HvxTQJOKVpb5xZHtRD@vger.kernel.org
X-Gm-Message-State: AOJu0YztOt6EDnXfqVvBCBxR6J+EreeK6y5QvBlppAiZRBscqwZh3kiN
	M1cEzsp9KQFuhskB5rXjKihLrVXmd4CvSeY9W9Cc+chOxvRVTI/KLgiGvL+RVnQ6rBt9iJjXlrs
	35m0NssDw4+1eHDD6rs5o2OR40m5kMSgtbU9niNvc1slXNv1Y3f3QPVevwhLKwrZ6
X-Gm-Gg: AeBDievC1mvTOIg9EUXobUZAgOM4alyKddgdBcnrI2rs4w7OiZtQxXIOVu5vCanRNNS
	HPwzTmudYrbZOXuUNlhnwoK5wZamE8XpyuLCmMPfrCql8e5xvIog5T+E2i84UNZ3cr7Lki+qTb8
	6sGXEHdKyaWNUkERW5tFVQmmpWy8V1pZBKwEh5/0/hYI22M0ssj/lXhiGurygLhNhMenzOW98TP
	ppbmDG8QfVx3mks74hj+zbK9T/xBJg2SPJ+TFVdsW7UHjrXwDt7M6mK/P49ldPyLE0jYMBeGOmw
	0SqUgFtsy3uhYCVVcXI5xOFtVPgSVccCd77zN4+OKaFYjx7vwXIEFmcYdM0/LWwGITcq/xCCoMR
	0zg6Yww9WDwYm74n07jk9QHVFfzMcR4nSYGV82uIFyv2OJMr4Hf0HWzFidpmv8q0=
X-Received: by 2002:a17:90b:2d0b:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-364ef67a4acmr1762296a91.23.1777619756408;
        Fri, 01 May 2026 00:15:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-364ef67a4acmr1762272a91.23.1777619755945;
        Fri, 01 May 2026 00:15:55 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00b094sm1424265a91.9.2026.05.01.00.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:55 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] Add cpufreq scaling support for Qualcomm Shikra SoC
Date: Fri, 01 May 2026 12:45:43 +0530
Message-Id: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9T9GkC/x3MQQqEMAxA0atI1hOIVgp6FXFRaqpBqZoww4B4d
 4vLt/j/AmMVNuirC5R/YrLngvpTQVxCnhllKoaGGk+tI7RFVg0Yj29SPtFi2CTPGFLyHdWOyDs
 o8aGc5P+Oh/G+Hw0ID+9oAAAA
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: mEwTyVWumkXz-bYxOqh9PU03gwZJdDsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA2NyBTYWx0ZWRfX4WFDu2xbOo5a
 8DrY7GKBprEfKuadIc1sjsP0nVcpImB+88ZweysSrLctPo0v3wC91jp89j3EXOAqYWIW+tOk4vH
 9yKRWghioAQyXIdC0wd6uF0mj66INi0fjx+myKc54i2eldX64bO99GP+2PE1mH+Lxf5EL8ofUOj
 SYUY0JoZKDYqCr/WqOULt8KHZW6hfSV13bUyMHnrSme2+1IYX+rhFPvjeQEuQferWnkhvyv0CpZ
 GvPQW/FxGuPho4NkugIleYwzMv8p/2XBBN48lNc6XjI8CNa5GXgJEF/nlmi2M2kQ+LnnaMW5Nud
 gHRsiz9U5YAhbYrgi8C+uxRs7UAedUZXZNiB98KY7BPvCVSm0gGG7V5ATp8Y9t1aiBQd0wvlbEA
 EqoxcmrgCTl+9FDum6ckcJ5Ob6rogTLfgOXFAc8bgLzD1gQgPCCFXw/c/eBeHtR4GP1bEfltldr
 twRwcWcOf4kHHrxZFrQ==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f4532d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qdwp8Cu8RznD16sri-gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mEwTyVWumkXz-bYxOqh9PU03gwZJdDsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010067

This series adds cpufreq scaling support on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (1):
      dt-bindings: cpufreq: qcom-hw: Document Shikra CPUFREQ Hardware

Taniya Das (1):
      cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |  7 +++++++
 drivers/cpufreq/qcom-cpufreq-hw.c                  | 23 +++++++++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-shikra-cpufreq-scaling-aff690130063

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

