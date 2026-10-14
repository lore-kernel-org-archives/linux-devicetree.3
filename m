Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF79850B8B1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982982; cv=none; b=Wb0Kbe/gjWk0QrIR9Ai41PJ/VP0mRCSfpa0XIrWpUrQQaiqaiinbOBnmndSveVRyFByenoB80kJHpxfyeqTsOsAqN3VVmztw1kd9VDrULhWP/p8YIRdv0vvc22EB/mF0jcQmpe+gdphh0TA5Mmchs95mG6zUYAMppfHe2TfqBTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982982; c=relaxed/simple;
	bh=gAIkzzbj+i1WmP6eC8YcuDBzKhsL6Sj8KUpou2Ontc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fNXKrx2bnFjer5m/fe1iKPtDnGFo7P6a1DA1mYknFkKWvnaDsaYjXeENxifpdhlMkDWkf3h/luJ/ppU1cCiG3hWPn79TIcYVPw+kQZmjQ0yk5poA2WxQEnG+Q8vjSrzrUVk8HXBV5K6qHAWt3YFGnuB7tpwGf32l2j8nuCpfoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjdQ1aBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3I8RPzX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjdQ1aBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3I8RPzX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8oUnO3000901
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ux7RAlOhQfXB+vgOyaQ7Pa
	ZBU7B8R90Yjj4MScRSDv4=; b=MjdQ1aBk5jFMTJ8Q9zDgopnG+1X6urbIQkCsfD
	NU/8nrsPFfSv5ZWPsIynz/thLByYZrTiks22vFPVI8PuQ+lp9GsLqlmwOPsS0tBr
	14DaMWndKiRSRj2uC0y7mqEAVRJaTUL6uE4KMAREY2VBgfaxYeuXBPuNmg+ge5vr
	P4wa20uNROToDVVzctdUF7xgrcwfOLe9iuKxB4QdEHPtQKLBNiIDttBi4aOHLWz3
	pIt10zgm7V5l7sZjPu4HeJ6E+vhbmfpv9Ajk3FR6ik8/HWBGJU/SWXpTuJmWhoUV
	klKV+0MWV8EGHtHBS2weBaui+xm+Ay8//ZADY0dIqcwY7vwg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbev1u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:02:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e199541d01so6088778e0c.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982979; x=1792587779; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=;
        b=E3I8RPzXe9FTzyn7vrXdIBF77JEMhocrWqb60mFpkKVToSILOF8ElJ1fxSDEhSLgRU
         rrLc/wxF8r34JPOLCePblEnFquTs1ZTaI8HZPKkFIXWnFoHLhwjvgMe1v2Nt7FsbWB5Y
         UFre8fLE8NmW6DNHPF8P7rqHBFwnhAnQaFsAFIl2EDfT8JRxNXYGYapou/j4Pm4h8E98
         BmPQIIHSS1tCs4d9ojKplimDAef7A+zyiCpGcjirhbk66Df8ax5pfgaGcWt0gzeskL17
         DWW2W7EgTsthpVI99gd8o72yTk5Rcf6qThAF+/yyvxbrl6ovtHT98JLxZkMinrSBEC7/
         FdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982979; x=1792587779;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=;
        b=qebeAGOswIW6wX/gd+UbpkR80uYhvh5J/JYS6ZsKnnXJqdN8RIeXC9n320j5H0jrps
         EFHs7DRxroaPdbfbZ+YaJKy7r2BCnw/uQkpM6Gbp5LiKOeQtXHgRe8NHfo5U0vFQxAgz
         j0DApmCSa4dGSZ0lNksdYlsppsJZWuTz0sq69SHs06ztAxPVJLN+vOEDNK9qjG3h5h5V
         aAZjrEFtdsxQC0YWX6NY+dEqHkVljFyueAWvHtnYAGjghF4YJyzakG0ryivYJLMcXcBq
         r+WV0DhSEPjl59jfrllQhd/RowjFePxJ9/uA3aH1NX5B7WBHeLhuK0ZrYEzRf7KKHtyL
         V2IA==
X-Forwarded-Encrypted: i=1; AKwUvBwRAHCYXLg8XVWLjpuyx4YHUpEEAGN4rTrGreblWLdjfGsAGuHzMaj6e3TXScJ0vxCT0J7vx3AvXD35@vger.kernel.org
X-Gm-Message-State: AFq9FYKOesVa25U2p9KRs6RFgIxVYTKjBbjMgVTiJ5LyXgckbrJTAlKx
	/f5mGpi9rAKsmYSOZ7SoSZgqswLafj7V7687OmBqnCAu7oXPRNRvIX4zCg6HBQ6M70ifCblhhco
	yIHB69cidg5T/kK8qZi4royA/dV95QETMmQvmPcH618mvBrQwxycNHNM+c7RNrAY3
X-Gm-Gg: AYBFou1Fd2jUdN9DKWQWUghn8HjoouKc35b4Pd131NrRGf7+D7lnywfqrqME7ytB9HX
	R1DxKv1eORBhNNK4r3F70GRxC1eCwwlBh8tbfjh/+KqAGwLnpYQ/TtCuWbUWc9oqll1SwJ03iUE
	ZUTAP9PNWEdncWEJ85ffjcnrRmir6s99Assm808bFPvTlRoEoe3BtOqp6RUOgQ58Qzq4co7VWrF
	f313uPD1yq0qd3KHupSDIleOujrK/f4ea8Wi3GcMQJ47HQf1seLaw0nby6YZcgBINQBCmfosxgf
	Ro6bIdo7BXf90oO/wSIDSh2xvNWm/+cwz8pJLFDd4mJxxgKKVa2UIJsqulpGQC5RRMJGDK1ZjTM
	/TxYSd5JwEg==
X-Received: by 2002:a05:6122:32c8:b0:5c9:b444:7afc with SMTP id 71dfb90a1353d-5e91f26d597mr5314161e0c.1.1791982978515;
        Wed, 14 Oct 2026 06:02:58 -0700 (PDT)
X-Received: by 2002:a05:6122:32c8:b0:5c9:b444:7afc with SMTP id 71dfb90a1353d-5e91f26d597mr5314129e0c.1.1791982976482;
        Wed, 14 Oct 2026 06:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
Date: Wed, 14 Oct 2026 16:02:38 +0300
Message-Id: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG59z2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MT3SQT3byy3NRc3dS0zLLEIt201GTj5MQkA1NzU1MloK6CIqBEBdj
 EaKUgN2elWIhgcWlSVmpyCcgspdpaAOHta6h4AAAA
X-Change-ID: 20261014-b4-nvmem-efivar-fec3cab05755
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2683;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gAIkzzbj+i1WmP6eC8YcuDBzKhsL6Sj8KUpou2Ontc8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz310HD0lY/yh7SQXr+ouDyDiI+jw0Q581NH+F
 JEam2z2hIyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99dAAKCRAbX0TJAJUV
 Vq15D/0QVlTJir+agRbJm7HC5e0xE3vUhkeQLvsNriJkdZ1tqKjcyQ+n0YkwbN9hLa0QYWFZZyY
 OqYitq5DGIO0suxwwX/XOw2o+Ow+l3k28aLpit/w0QPwOjKzvRjHk83542VZAuhjxyFqJLKLUx+
 K9dMFA12PjhKgsuntHrs1uYt/Inj7Jkl3DQJ3j9twBTgHg09NHJtwzIWGXwbkeh6tbQDVLp8HES
 KaOrAs4GriNIjx+vz9xdpcX4Hb4/RcDSDcD4ByaJ8zXZy4TT5Q6y4SlqEkHTKE3FS9jpIt8VuxW
 fDMly3YtPOJRiL5/FyVez4F/rivUHkGfWeaQECiUUt5lYvqP8e5u9i+Yjglvac6bybOEvn6mFFl
 ILYkJH1xyrcIQ/xDMwzeEYU/QEaYnGA567CBIEN3YRuMHG6g1NdI3Jnb2K36TFdyJcaoWFeiiVj
 oDM1bLYAN2ZxwRykR3gouXB7AMcsVK+7JPYtie1nI5ktBkEvTHUqRWeQmKw0gPdFbk2rXh+mLDc
 wYISR4d9Hkwgoc6C9C/T1UZbM1MpYLDMFB2rczHTTmBXlHrvi1hLGQ52IbHDKQmgEyV/RSJzUfG
 PIlLey0I27FkXIMhY1T/nLodKHy0vr6oS6ELYmznE91cSCPq0WkwdeTZwnx0brjBoGrgLDeChzA
 O+eeON62CtBFnDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: h3OJ41kXC3O_2-JjAXA6YQ9Pd8t-Ibwz
X-Proofpoint-GUID: h3OJ41kXC3O_2-JjAXA6YQ9Pd8t-Ibwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfXy5P0pAPv0Bqv
 MwYlGnQZBPTEXUAEDOk1hmYWBb7yBM6rfXDpZvKuRNjfR0//D8vWuDXDTtJzJK9HHZo1FxFYvJo
 KEy42QvL6JuaZ+YfXj1bJzb+IuM1Dw2lEJpkeDVr3MLV9uj/rVTzJ1l0j8DoG1qoDbj3rKTQVIG
 G1NMJudiMd2KMG9asAkkz4yAgvMavhePd5dKdXCKgcP97MMvNUBmdA/L2ts4Mu9XvqnTpyc0hLx
 7Mz25bEwtiJ5c4c8EbwnDNN6wuxt1tlKuveUjI7hFLnCVQ5+20/s1/m9pYg81u6qyhCJNc4XYgA
 rqoudeoC6zNweWMIB3A1vbZxqd77ovAazITn1iLT17d6otCM+H70rGlE4VnDO4M5+xEaGMDNtF5
 iuDAnhm+X/Qc/YWveFR6ldKTHQEGRWsPMEe3Vuwbw1tcQs01Zh/mEoSpyxQg34dGXiSR+Sxu8ad
 VsmR0d6K1ydruS4Tn4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX7tK3rvUcP9le
 Tltb1kF4sRG/PmD6MlbdQ2h82dnYZ9BhegsXvN5ky77VcJWqooAS91vj0TV7SZHTAhkSwsovlPo
 QtmH4kzlO0sypzUJDffqthOe21Mk9wE=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf7d83 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5qUZDwqhos4Me9Bi-QgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051

This is an RFC: I do not expect it to be merged as-is, it is sent to get
feedback on the approach.

Some values a platform needs (for example the WLAN and Bluetooth MAC
addresses on the Qualcomm laptops) are not always available to the kernel
in a convenient form. They may live in firmware-owned SPI-NOR storage
(e.g. a DPP partition) for which there is no straightforward, universally
working way to read them from the non-secure world.

As an alternative, this series allows such values to be provisioned once
into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
provider that exposes the contents of a UEFI variable as an NVMEM device,
so the data can be consumed through the standard nvmem-cells bindings.
MAC addresses are just the motivating use case; the provider itself is
generic.

The first two patches are the actual proposal:

  - dt-bindings: nvmem: Add UEFI variable NVMEM provider
  - nvmem: Add UEFI variable NVMEM provider

The remaining three patches are included only to illustrate how a
consumer would use the provider; they are not meant for merging as part
of this series:

  - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
  - wifi: ath12k: consume a "mac-address" cell
  - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable

glymur-crd is used here only as a convenient example for the consumer
patches.

Feedback on the provider, and on whether sourcing such values from a UEFI
variable is a reasonable approach when they cannot be read from the
SPI-NOR directly, is very welcome.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: nvmem: Add UEFI variable NVMEM provider
      nvmem: Add UEFI variable NVMEM provider
      Bluetooth: hci_qca: Support BD address from an nvmem cell
      wifi: ath12k: Support MAC address from the firmware node
      arm64: dts: qcom: glymur-crd: Source MAC addresses from a UEFI variable

 .../devicetree/bindings/nvmem/nvmem-efivar.yaml    |  73 ++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  22 ++
 drivers/bluetooth/hci_qca.c                        |  48 ++++
 drivers/net/wireless/ath/ath12k/mac.c              |  14 +-
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/efivar.c                             | 273 +++++++++++++++++++++
 7 files changed, 443 insertions(+), 1 deletion(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-b4-nvmem-efivar-fec3cab05755

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

