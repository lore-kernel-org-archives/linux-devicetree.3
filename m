Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F835295C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016747; cv=none; b=GypS1bRyrh/N7Ueg1vmsanaIlCaDKeOxeK6+dab0Z7Kh5B3b2X+hUnn5zg61oGMY9QPkC0dIw5ut99AfkL/mT5lt/iYvpj4CeJv0DKveEg28WAi6/QA64hKo+mVHd3MSBnxp9DalQp5oqvy1ONu7i8qkb3zwV9CqxnC/8wnwXLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016747; c=relaxed/simple;
	bh=3ESj/5SnvDlYmVUSeBbRulZwu/xrSL5Nfdz9nul+puM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bNBhi5DL3wNTf64oi0WD4kl82hQQv84OhoQXUeQWGJvZ+UvVyZJRLaXZERkUjLH65VPbOIXSZY2c8CXrJjQ+E3ub3fxKuZlNKS++zPjVcjmjlK1j4o0hjP8Yxd5fsRL+iSR/V7CZbMtWWHOQS18+GtV9hLW9I+SHdE1+tIDHeVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmWxMGA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLqSzWwL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmWxMGA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLqSzWwL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0A3qb1495540
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8ZCCjlhFkc75JmKiJofBGF
	JLFFcLRGf+rA6b4Ybf384=; b=ZmWxMGA6/AKbSzFAGIg4kGOuVAQdU1z7xwnIaF
	GLaaoyXXQ+zlYEf1WpJ1AOw3o07pql309cO4bGq9hPU8WBzCnNDK/TVdMnRh0IOn
	hXNbMMaDOIiRAiutjUoca+b2RmYPmcYojv7lcJmVC59Il5Oy34qqtuSvUbFCYYQY
	ALLwL9gwfjJmVxzzQ733RlyqvVP4I7XZ0qU+hqyQENiwpFzuN2/UaXMrNDUM4aEm
	49pFMi2g6fV9nu2qnoM554mIv7tVrP2fcjBvzGfAptVnDIBek1dWLt5N/ZoWMZdh
	TIRuEatq+VEngbebFx8ZoID2sbeKsyqJtY2sT/KRCIZpa6tw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef01585ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:05:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-135f2aa4742so3870832c88.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780016744; x=1780621544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZCCjlhFkc75JmKiJofBGFJLFFcLRGf+rA6b4Ybf384=;
        b=dLqSzWwLWpg2/7ysSZl04Pu2/ePOizFyKqcxdDbp9G0PTmB823L2wJe8G+OoGvbkBl
         RGmp6ckq6SISS/phpjWEDeja5l/K8WBfJHpafNQQ/C1kOngFbLGwnxhH/ASo86xvGzhg
         Zx+RdwfsNXwvgigYOIxDo7E6BhXIvv53E8lgX1cAQWKDqnf3/fLQtOPBGnzjxmYbIbmX
         cJ+wM5iFuPwaG/eFsubnqvypP0sJGG7v5dTyGQoIN2FQIYDp/IF8T+i9F2g6HicB7JjO
         iiZZ7MNymryMKb6ZHHOTWo/nV71nG6a724tredfxtUYrjFZbPNPV8xvmqEIv9aA5gNjV
         +PEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016744; x=1780621544;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZCCjlhFkc75JmKiJofBGFJLFFcLRGf+rA6b4Ybf384=;
        b=N3S55wPUyket5VAp/SP5pZ5n/fA9hZq565Ove4dB8ZoEwjFo7Hbw0MfRoiJ5R6o6xV
         UPEaJ6xhQpVcvstX1Mp7ZfOC4fhHbEd0440d71F2eO6D5E+2tf6bLM9GKNtBJQG9JwNN
         k5kcfZ/6V9eb6KHraca5e++Q6QdjjmV9lfu0HOPnQdbT5A+L7BR5Fp6RpxjRFfAJwgO2
         AUa6ydPwpdLB8ejqymYeYwFoYu6g92l0wOnYAQ0xRl328ZIUZaxWbr91eqISsVgaKnV8
         w05gGFSbpfyyaYaPdGcUfT8hiCrnv4+YWsnFGBLACNH84kUJwjPdFVv7dGnHu/0L9TNq
         hvlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QLrnmdREnjE2aDNb1Zht2hWhq+GNJPz/N7AbhBdjfjrWMtr1X3BUXo5zj0jgZNOmTdGOp5XH740M1@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4XfsCVNUzUkKlUx1XEcclwacV9GB+CmdYBq8ve1JIa3c+Fl2
	8aURerQXSRxqbkn/ZXY4feVtTO7fnAIg/HcpE5CBRn6SYhNFrwCXACVCZ/+2DKkhx9vIVMwxDCQ
	MH7oMPfM5QR1SZ4TiLr7W23gdYOsjZ+9SIQ+iRNHL1j3T6m9xAK0PiLuBEhM6wlXt
X-Gm-Gg: Acq92OEtTTHOG1/31BvG0yZNDVDJLMKopODZlDOrRbjWNqr4znRa7NzDJaDRm+VjoRl
	hjooahAROg9HjrVXBNu4gFA/JFOvpLk2Sit/ZBcRWB0UUd3LWrozPbx+t3M5GEXiZhxXd5IlM3K
	mcRljBC5A29YTzeFPN/rUnry0ect/iVXMll/9guNl/9r2PvyY5OiPwnzFQNKdmwGwK0Zl7/inUv
	lgWKEAH2Kyo7ynICLdBhELfL8xT9Qk5mdY8/ugaAX2F1bruq0u+O9Ql/D94TIMpWCcIs+P/vZCX
	GysUs5ASo/dfyv1jVBbcgdwaeFtaUjXldSQJG2gmfCzpLDh3BZj80IQ0BYR7rRj9Og0qXCoorf4
	hR94Hay4MpG3FJwcWqkwu9t/DnMP/K7wjlSsQ1dEYN5aanuu5Xc79dioohwurYe/rZMqwCJ+V6y
	R7iH7Q3nL2
X-Received: by 2002:a05:7022:48c:b0:137:9399:fc59 with SMTP id a92af1059eb24-137aeff92efmr257218c88.21.1780016743744;
        Thu, 28 May 2026 18:05:43 -0700 (PDT)
X-Received: by 2002:a05:7022:48c:b0:137:9399:fc59 with SMTP id a92af1059eb24-137aeff92efmr257200c88.21.1780016743105;
        Thu, 28 May 2026 18:05:43 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm179812eec.5.2026.05.28.18.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:05:42 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/4] pinctrl: qcom: spmi-gpio: Add bidirectional
 level-shifter function support
Date: Thu, 28 May 2026 18:05:34 -0700
Message-Id: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF7mGGoC/4WNQQ6CMBREr0K6tqStUsCV9zAsoHzkG6DYXxoN4
 e4WPICbSV4yM29lBA6B2DVZmYOAhHaKoE4JM309PYBjG5kpobTIVM5nnIx3Ax8gwMCpx86D46U
 qG1XoLivOLYvb2UGH7+P3Xv2YluYJxu9ne6NH8tZ9DnGQe++fI0guuCx1dtGyFXVubpYofS31Y
 Ow4pjFYtW3bF4AxUFzTAAAA
X-Change-ID: 20260527-pinctrl-level-shifter-929b286f583d
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780016741; l=6363;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=3ESj/5SnvDlYmVUSeBbRulZwu/xrSL5Nfdz9nul+puM=;
 b=hELj2pyvmwu7ZYnq9s5o4XDh0mJ+XOsdYKUqpdr8dZcCWDxgm2H/lPsTHQhqk0o5y7pwmyXKF
 amcXdxFQFp6DTfCWmfx3GUqT7lPmtNhTqqnoL/bXX0JcUOjHKR1QiEd
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: 7l-6lsWmjaoDemnsipsv9sVHJY5NSh8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwNyBTYWx0ZWRfX/FBxKbbCwydR
 0OelloL4oVqR+IIyqyDZ/YGJvWzMb00/xmb+8V8b8zpOUPzSYw1rUU1sJTudTdznIBqZIOEpK+X
 rgskB9QSIvMEcIE7MjTmuHYEZ2l/KMkHhtUPC4A9/LTOzjhzWazNxmxQhhp56iRNiT/ijksFcHn
 hYm/IYLgpx9V107Ml42zsnvMlBWa+IisBke+2FmDzOjl+p36+pOTvtsTZXxM3w+nPOI8A5qK3yD
 pcyS4NW0GWeONU41tF0bhaB5AhZiMN5Dqv2iKsJNSTmbd4b9zU9NsQNTx6EMSp05mWd8OmRkUkU
 ifqstuPNAKeVobBvPFsjLVa01WSZ0dwiuDJ4lk9Cf56dT98WqNYOq+LVD1X2iFuytWYR+hcJfdI
 uRhKHAVOHvk2Y1IF+2eKIEuYqdbNhhMPPO9XXXXvv3NfEBJiIr0V5GXXFUJyMtRiKyRvFHOxJaX
 lLg+3aG2Kl7y0ZWfyIQ==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a18e668 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jnkyZqLWQS9AGQwLeBEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 7l-6lsWmjaoDemnsipsv9sVHJY5NSh8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290007

The PMH0101 PMIC introduces BIDIR_LVL_SHIFTER modules that provide
bidirectional voltage translation between 1.2 V and 1.8 V power
domains, targeting open-drain signal buses such as I2C. Each level
shifter shares its two physical pins with a corresponding pair of GPIO
modules, and its enable state is centrally managed by AOP firmware as
a shared RPMh "XOB" resource.

This series adds kernel support for controlling these level shifters
through the pinctrl subsystem. Patches are ordered from infrastructure
to driver to bindings:

Patch 1 (soc: qcom: rpmh) extends the RPMh driver to accept write
commands from devices that are not children of the RPMh controller.
The existing write path assumes the caller is a child of the RSC device;
however, the SPMI GPIO driver sits under the SPMI controller bus. Two
new APIs are introduced — rpmh_get_ctrlr_dev() for resolving the
controller from a "qcom,rpmh" DT phandle, and rpmh_write_ctrlr() /
rpmh_write_async_ctrlr() which accept the controller device pointer
directly rather than deriving it through the device parent chain.

Patch 2 (dt-bindings) documents the new "level-shifter" function, the
qcom,1p2v-1p8v-ls-en property, the qcom,rpmh phandle, and the
qcom,pmic-id string required on pmh0101 nodes. The pmh0101 conditional
block is split out from pmih0108 and given its own required properties.

Patch 3 (pinctrl: qcom: spmi-gpio, rearchitect) refactors the driver's
group and function registration to use the generic pinctrl group and
function APIs (pinctrl_generic_add_group, pinmux_generic_add_function).
The previous design treated every pin as its own group with access to
all functions. The new design allows multi-pin groups with restricted
function sets, which is a prerequisite for exposing the level-shifter
function that is tied to specific GPIO pairs only.

Patch 4 (pinctrl: qcom: spmi-gpio, level-shifter) builds on the above
to introduce the "level-shifter" function. When selected, both GPIO
pads in the pair are disabled (high-impedance), and the RPMh XOB vote
for the level shifter is controlled separately via the new
qcom,1p2v-1p8v-ls-en pinconf parameter, allowing enable and disable
to be represented as distinct pinctrl states with the same function and
group.

With all these changes, the BIDIR_LVL_SHIFTER in PMH0101 could be
controlled with following settings:

    &pmh0101_gpios {
    	qcom,rpmh = <&apps_rsc>;
    	qcom,pmic-id = "B_E0";

    	pmh0101-ls1-en {
    	        groups = "gpio11, gpio12";
    	        function = "level-shifter";
    	        qcom,1p2v-1p8v-ls-en = <1>;
    	};

    	pmh0101-ls1-dis {
    	        groups = "gpio11, gpio12";
    	        function = "level-shifter";
    	        qcom,1p2v-1p8v-ls-en = <0>;
    	};
    };

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
Add following change to address review comments from Sashiko AI:

- PATCH 1, in drivers/soc/qcom/rpmh.c
  1. Add rpmh_put_device() wrapper to avoid casting put_device directly to
     void (*)(void *) in devm_add_action_or_reset(), which would trigger a
     CFI kernel panic on indirect call type mismatch.
  2. Add device_link_add() with DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_PM_RUNTIME
     in rpmh_get_ctrlr_dev() to enforce probe/remove ordering and runtime PM
     suspend/resume ordering between the RPMH controller and non-child consumer
     devices, preventing use-after-free and hardware state machine violations on unbind.

- PATCH 2, in Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
  1. Make qcom,rpmh and qcom,pmic-id optional for qcom,pmh0101-gpio by removing
     them from the required list in the if/then conditional block. Update property
     descriptions to clarify they are only needed when the level-shifter function is used.

- PATCH 3, in drivers/pinctrl/qcom/Kconfig
  1. Add select GENERIC_PINCTRL_GROUPS and select GENERIC_PINMUX_FUNCTIONS to
     PINCTRL_QCOM_SPMI_PMIC to declare explicit dependencies on the generic pinctrl
     APIs (pinctrl_generic_add_group(), pinmux_generic_add_function(), etc.) used by the driver.

- PATCH 3, in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
  1. Switch from devm_pinctrl_register() to devm_pinctrl_register_and_init() + pinctrl_enable()
     to defer hog application until after all pin groups, functions, are fully registered,
     fixing a probe sequence bug where hogs would be applied against an incomplete pinctrl state.

- PATCH 4, in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
  1. Guard pad->is_enabled = true in pmic_gpio_pinconf_pin_set() to skip the assignment
     when pad->function == PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER, preventing pinconf
     application from re-enabling GPIO pads that were explicitly disabled by the
     level-shifter mux path.
  2. Call cmd_db_ready() before cmd_db_read_addr() in pmic_gpio_register_level_shifters()
     to propagate -EPROBE_DEFER when the command DB is not yet initialized, instead of
     incorrectly returning -ENODEV which causes a permanent probe failure.
  3. Add qcom,rpmh / qcom,pmic-id DT property check before calling pmic_gpio_register_level_shifters()
     add make the level shifter function registration optional to match with the DT binding change.

- Link to v1: https://patch.msgid.link/20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com

---
Fenglin Wu (4):
      soc: qcom: rpmh: Allow non-child devices to issue write commands
      dt-bindings: pinctrl: qcom,pmic-gpio: Add level-shifter function
      pinctrl: qcom: spmi-gpio: Rearchitect for flexible group support
      pinctrl: qcom: spmi-gpio: Add level-shifter function support

 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  66 +-
 drivers/pinctrl/qcom/Kconfig                       |   2 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 796 ++++++++++++++++-----
 drivers/soc/qcom/rpmh.c                            | 173 ++++-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   1 +
 include/soc/qcom/rpmh.h                            |  21 +
 6 files changed, 845 insertions(+), 214 deletions(-)
---
base-commit: b8f192cec7dcb2e4f04ee57ab78d51777b0a5729
change-id: 20260527-pinctrl-level-shifter-929b286f583d

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

