Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51B3351C34
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 04:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325190; cv=none; b=ZzahrndTIFYp0TXgbc/0ZUkxOlSSbLR+iZMEyHBeD9gTRAeM/h8jvXqUorqaJxQUpifzqiHQzeY7kV3iYzeuWH2nwO7udfnIvF+8oUQoWiQxuWQQMTRv9TLSjR+pu6KPB/2Y+lo+eiSwFoyOtkFg0hS0cNZ/GuluxNIZJJcmCJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325190; c=relaxed/simple;
	bh=7RyRS8hdyF+OxF1VODllR54wF9arVpqXsDcwKz4/7oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FR/OsTqk6mVwk1luV6gB0aLZiRfM4SV7M11wp1Xlo+Vs2NNh2ZlWcB6MfdKpdAkQtm7nRKKVwG6g+CqZREnk4tVs0UxrhV6ewtn8aNjl75QnsjDd8GpabRAogGkY/js838E+PcBbQPjFBWblvsfhqPQZgLXIG4I8Jw6WLw2HHBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qqtcuoix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0CwtQNR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qqtcuoix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0CwtQNR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6824qVmV3048610
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 04:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2mgoXwqmnTcXL2DO7/E0NK1bU2ELxJUqBbZ
	tPTau3iM=; b=QqtcuoixvThL/9emAbAjLCNlQ2IBvbzsrOIfIFm4tEjQesqkw8C
	HmcgXg6RD3ya1+y2krp8Jmdb7aWTuMofw9X+3A1VEFw1ej3CVGoAne9NtF05NATD
	uJvNolqhaM+yaXS5TA5mgKdtWQmUNlAWjuILbksX2wlPCKyiKGSUCghVA5NNQTbN
	RauJ6iPS7Rdsh1kxRoxfQTJOt52xKQB3WjgxXtoIbkJn9sV94soMOwYQq2ujHdkD
	6OxV5LcMWzdWbdH9oTKjQf0mLksJ1H1AoSHtg01HA3bc/r0OU9kNf+9y+dUliqPz
	Z8yVcKtnPa3iwCTVyXa1TvFBZP1oTNdSwdA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397a6jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:59:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso970301a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 21:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325187; x=1788929987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mgoXwqmnTcXL2DO7/E0NK1bU2ELxJUqBbZtPTau3iM=;
        b=K0CwtQNRIULM0fXR5L/v6RuSohtx7+X5hbFk8XneqexYqV/Mci/4El2UQwL9jvbXvv
         Lc1WzR+O0LVSIW+h62gRk6jaVVz3zEvJg6ZwIcTlAicP+smcS3KR+KThbVgxFQRQQrHL
         hcQ2lSxt4P575sf8ZWP3Qv9DOVcMaKMXY89+gkd/D/CnAOL9iAEw916SV4aS2oWLEnqB
         duGV2AsD1/HyQUmuXoYHfye5MGylSuqzcAMua7uFF9jJYFAqBuLvZMkHmmkLfj0AkhRh
         k943ldvb0IULuQM9gsVEkhGVtb8x/OuxVrpT9Fn/ADw+3N/aIG+s6Kf7U4ojdcdGQxzw
         fxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325187; x=1788929987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mgoXwqmnTcXL2DO7/E0NK1bU2ELxJUqBbZtPTau3iM=;
        b=YuhxNXcPfskoatFOMWrKkJ/dkvWs0SH7U86FAsHo6/p46gT0OCh1A6Ms9r+qm6ARDX
         6B+XiSgsFzOQBM2KGMNOrtW13QB7nW6lBnscmJA6HSR+FtcVA1ocWITDJWomKgfbwzVZ
         w50SWjNRFinHZ3tDX/9tXiI2URPKCfoHUfIukfMDwbNIu+NKgUchBiuDcsdPOBbRIDCX
         UpSga2doMLy8NgYGVTDoNzCfbNdLrOzYM0JoTE7OT+GxwKw6SEWYgoq5yWURNiij1Z+r
         os/rGah+cxHuYNWlMEH6M1EdoapK0xHBMJd2KB1+mJQUaonmu/i1BkDascIWitbVFzX6
         Q67g==
X-Forwarded-Encrypted: i=1; AKwUvBz7Nxjgz0dlxYpfBy8XNARg7S86oGtGvRUwyGqNpUpN2l0RVlocJwAhzRpu6yuVMEl4P+579YuW0SCS@vger.kernel.org
X-Gm-Message-State: AFuF++mMyauD2im9AHajIHAO2L/GlQnNCAldEewcl5oQj1xi0jZERR5y
	REx/FyNwFgGuy//PX2UicSY2Csm4j+Fc+7T2I+OcxN9oj2GOCBT9TRoi5IXFYF8c+KfV1m0hVrp
	vhITZRySM7JxqRYfi1G+HsU2tPmDHMpUp0SMphf9eYvBZtL/K/a88ytIJBUze8RJt
X-Gm-Gg: AYBFou2Bkw/5VS66cTjsG7/6R/yz023FJe7gDBjrTr8J0hutuLJezPChcn4cjsHyXJZ
	gz9EI8Gt+aEvOWAtR6UxBSy6uZ6jptGgn9e+q8qeh84Z9VHBN6a7YBt1JXGpbMb0EEdEhaJxn2m
	bmpM6CQh1nWqO+Tx9S5ZbnhmaxyA0QhQR0nwrtp4Ycn9mjOyHv4Ne6K+4rIdHrfix9LTlRXP50h
	reWgeDoDUiHQ4YG+PbYc+QsCRt1e3DTgH6yDVG8O+GGqyEOwYAQWTVrCjwL3n+aBzc2kz96lcEu
	fCIaIJyDoiXcTE+ozPHoXh6PyBlzzzfn/ZNFEjPHtJc1/PY12Saig4y0ZMjRTPPqoa0sjV7h0U7
	XTXIxJqhWeOYzXT1ZKe1toe3gztod0u9OaCTfm1v+GOGaSQm69z6PHs+WfUok
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr3396412a91.23.1788325186781;
        Tue, 01 Sep 2026 21:59:46 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr3396331a91.23.1788325186252;
        Tue, 01 Sep 2026 21:59:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm2782639c88.8.2026.09.01.21.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:59:45 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Wed,  2 Sep 2026 12:59:36 +0800
Message-ID: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX0KUWE455JTsl
 FAeEjXh6SH4prgU27F017xGDVBYMKWIeol7J9HUU/i866qYAcVaPXt17jOnykYLQ8k0hljgAaWQ
 sR8gv3NSx+JXbZ0zxf8E9m1NCerx0PvwSWSngoR3NBZrP6Tuh/Pzw4o7ll2Z3VNG3EUXsCVL2+y
 qwFHe1sxT1B1LR6M2NTGsK8bGcGqmsiyo9zSt8cegV/lYKga0kN4wR/OJ6zj2w1/Sal8w5zO6Gu
 BHlJRzMiZIyRLcj37aW9kJkMv+mOlFCrLYFbOoc0gXbq7ZgvCyK4nPf+zL6lhapItDxcOCSBOwc
 VOoNBipbXqltqD00BpksfQeENjCyxZKkpx/ZUCp1wFpAxAly+ie4aFzQU5TwNuRr6QlKuZLSwd2
 44vjAODcL0dvu119ubTTiuCJeiZJJBltCdoct2j0I5KESxtaePPiRR3rfkW257pg8CvdLgekCKu
 NTPYaEvhZ9I3zlqh0Ag==
X-Proofpoint-GUID: 01shScs7H37-IlQu6Q3hjAV-xM8AfLhT
X-Proofpoint-ORIG-GUID: 01shScs7H37-IlQu6Q3hjAV-xM8AfLhT
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97ad43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=r0Oy5IV129DxtwVnk4EA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX+0WPNLSOjCX6
 e91SbTpjae3xxMGGuPf3L6S173/+tPLbvvzjrRSNJjY26NDo/JHbwHJLU+TGO48MckvWWGBSXc/
 oQMHxrDeKJBR8NElGp4lEYQmPHG334A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020042

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 581 ++++++++++++++++++
 4 files changed, 751 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

