Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAB377AA1
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422024; cv=none; b=nABej5itiIVLDr15wAZBEarlf1ZT1HjfViUEewfwTP9WzL/de0IMVnLL+SMy8q0/v3AUapOlQF+MuPCNpTYCidM3+6MN+ol0aOPWcG6EUqq4OHezGXoV9TiWvdAxfTqyiv/iHcrgc61JLvsRDnw/2W8UmwLYXTwnKxHlaL5WjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422024; c=relaxed/simple;
	bh=AdPchfXsCQJMDBk4lR6KMgXheIpXggHP0WxqUt0lzGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I9+hmVflPGlc2H56uFCHsB8VrFlcgvklt4/vzOxxd+3e5tf4urDveExrT4j+uHoqTuqDWetRS+DEHJDRgMfqSbcs4YBislQhc7WgHpi0n8BXzpXjHBAV2pUadzrLFJlc/CjLjX6yCk3+3trJ8/Yk/p17S/PTBbynhISHyceNTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRvkp291; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtHOutNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRvkp291";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtHOutNw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837Lv344124143
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LhA0v7+rttf/9iRNLvM4UJ
	HnE3oXqpEsh3RJGJCDhJk=; b=jRvkp291gXB0U8Z1GFg2yYuYYMkbo/dWuNrXBL
	g/zyp2XD2qrXxfX52hKYnMB56ZDO9Am1eHhi0/GKEnFFBVqg+Sh4NlrjVeFmKYpz
	dsOOzk3QpLlV0S0XY+ycDeRs7/dftfavJP/vSFoqfr8DayO7NeOQRc+BqCpSoEAh
	WGHX/jGru9/3kUrhShRxSsyeX5lRv3sizriG4RYCRw8n2+sR814KAMf9ZGUJ3A7N
	so33ZyHq5o9zLOrbQchbrMEpU1spTVBQ9qB+8UpiqT1M5GdBQZm/diSg8wWDh37g
	4OQgqOjDEqLvOzAhDhGAvnToM40Fb8w5dzvWW1VegsVhfVjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg40b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:53:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so302137885a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422022; x=1789026822; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LhA0v7+rttf/9iRNLvM4UJHnE3oXqpEsh3RJGJCDhJk=;
        b=TtHOutNwOasC6qgdl/DZSZeKtTwwhnoS9NGlt7j3Dguiga5ps8L/mbL4P88A0fUPjB
         NPsPeKPUYzKl9PFyR5Uu+jBrmni71uIczjG8lzbiYkv51Zu2kwP+sh17Vudc5NS6X4VQ
         ZraZcb7b4dxKDnl7H9DSjQYzRcxtKdmF8v6Uar0GgenT0Q/2WIXNY0tZq+sDG95tYQWM
         UJQCSiWemL3cgPYpxUj0IasAUTw7ql4OI5pXbmTY5Xtu21Ks/Myw3URLz1nmMLZ71eC6
         NHpcpKS+h96oj6HWuShf6x2M0qDREfwKyRmkZizX5JrBC/G6p7xd3zVbH6hO1gpFQDjd
         jHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422022; x=1789026822;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhA0v7+rttf/9iRNLvM4UJHnE3oXqpEsh3RJGJCDhJk=;
        b=LrJ6awlSyzLVT4s2iuhuTAEpmPIjvUKs3vc0V9lPYOq0YjP+hEw2vg1eECM2d36wzP
         5TNxjdxyvd/BVf8OvBsjQKOiuLVW2s2vEteeKaBKtKeM+4uCgJZswhX255s2PG8H4LH0
         GGSTla3Fnjz03KsgizySOgM4druyRjk6Rh0R9d4ovQd2arrhjosGEDemQF9fFrg2XiIS
         Uz+jGxEhqtqfe+b3Yr4uhnA65KCvKFfPlvqdxQIohrBArSmHJ26G//zeAg3u5NI8EQRE
         6ZxRoD/8wU4ul8qJe5FxiwlX+CihoudtrWlnH8Um1K8Eotes1BNiQ0BOdZAG0iX2nTCr
         AMLA==
X-Forwarded-Encrypted: i=1; AKwUvBxHRYEy+In5EnQVdjG1NJ10Sm9F3cDhdDVhS8SfC33Mo37Ap+6SltAqIbF+7YvxzN3Hg2sUSqYSEPiG@vger.kernel.org
X-Gm-Message-State: AFuF++nHKQru3BtXSTJIki2ZftXXNgUZyLIxcGMv4fa4Cz0wRvdD8CEo
	EEus3uDu7BmvhcCR8XyQpXWHK8xyl2+WzSWSYdYvwD8gqgZvFwaCqu0QRB5nNs+BcefGC74C80R
	bo7pf+tWaOL7VrDOmVb7TrYPZNGWyXlVXrwh6Cyp7v1bsGPDOkBO6e+bVUz8vUWEL
X-Gm-Gg: AYBFou1k7nwlKoaMHlGdne/HM9nxsmqhE9MXGyblMchJ3Kqvh9FUKsyLmzujhnUUkbs
	QF7IrY4Cy+hDPwDriWESazDiWoVd6E7ETHAdeLNw2K4cPPQWNeWkxgte1brKhechzDRuO5JX1sQ
	YNKMOOegSG2SP3lWFppuLv9lUoPyiqyctGFZytdW4PpaTUbLV25xeTmFD7h5hcdGsEmG/wJIr0I
	2c90ZRovomtOHp2aSi+Kpd/D6N7T49qnl1vRr4zITOH8FvRGTk/WvTdaZcK4XfVFOkmgiqx/USM
	4CBkG9gVQvW6PPr2qKk8+i/IvE1aJ798xYY8i5iGKEUbUzF0Mn3tTvNWduQQWeQ6molFAxk7So7
	Uh5j5azKbig1lXQ==
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr226674585a.13.1788422016787;
        Thu, 03 Sep 2026 00:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr226672185a.13.1788422016377;
        Thu, 03 Sep 2026 00:53:36 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d1fe2sm57232225e9.3.2026.09.03.00.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:35 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v2 0/5] PCI/pwrctrl: tc9563: introduce support for embedded
 GPIO controller
Date: Thu, 03 Sep 2026 09:52:56 +0200
Message-Id: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBREr0L+2k9Kq4Wy8h6GRW2L/EQotkAwh
 LtbcelmkjfJvNkgukAuQp1tENxCkfyQgJ8yMJ0eHg7JJgbOuGSlKHA0hJNRFylQzytKqbmyZ1G
 1kkEajcG1tB7CW5O4ozj58D78S/FtfyrF/lRLgQytVfcqHVWuZFcfY/6a9dP4vs9TQLPv+wdh/
 2PSswAAAA==
X-Change-ID: 20260731-pci-tc9563-aux-66a29d438f60
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Xu4c0BqeJ5cJfigoNkSZm009_lhKaiGE
X-Proofpoint-GUID: Xu4c0BqeJ5cJfigoNkSZm009_lhKaiGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX4hKNi1zPwDYq
 r0NyTlcEkp5WtmQAgJmVFGiM1aYLZr2QRGYCnyDrgV6m/z7LSefE1QsR2vA/F+57npU4Aa0RUgx
 odDL7dYSVsHLQaRI+UcLMIzseQ23b4u3aMlaMNotaxHXqhYJ+hytcxqLaJNqqKz8KEwcwFteDx8
 2AsXROU4FnLp0uWOhrt2DHBm6T8dxAYMzcDjbERUJ4rimRoERY6WUvArTX40rFwVF0yuiL8MJuF
 2rUBeD3umv6ukBTyDb9VoGBhPRBfBi894kWPpK/578vEJUbbLD7sEjYQZ0tWMNK3hhOsTGsSkwV
 ARlr2EqsDnC5whtu30Za43+9Oj4o4IU74XSh+j0TU3t7cUhNmtXf1L/D3gOMqT+KyzS3aTIik/d
 43gPoYuTtpSGCnY9Ao6ZxzSzr6u7zSUmoNKKnyfI6yHk0nYyY1WER9rQyI303IlRbihV9gJc7JD
 EXtiDXvR0GEGqeyE8dA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX7Ko/7Xj5H6+a
 OmCYEzz00R7DW5R8B/Cql7sfgtD5QVO87zRdgTAdoHN/aHlM6iddA05Rnyij1xDRNdph41KYyTw
 EFkQny0cAC5pz6zzTyCfALYOTSnlW44=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a992786 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DaOxmBnbJEZ67lbDJzMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

This series is based on pwrctrl upstream branch.

---
Changes in v2:
- Fix PCI_PWRCTRL_TC9563 Kconfig dependency
- Move of_node refcounting management in tc9563_pwrctrl_adev_add().
- Link to v1: https://lore.kernel.org/r/20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com

---
Alex Elder (1):
      gpio: tc9563: add support for the embedded GPIO controller

Lorenzo Bianconi (4):
      dt-bindings: PCI: toshiba,tc9563: document embedded GPIO controller
      PCI/pwrctrl: tc9563: add GPIO auxiliary device support
      PCI/pwrctrl: tc9563: switch per-port reset to GPIO descriptor API
      arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563 embedded GPIO controller

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  31 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 165 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 319 insertions(+), 15 deletions(-)
---
base-commit: 550ecdbab0f51174202e7f9f6557673090bcd5eb
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

