Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417731280D
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 23:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775516694; cv=none; b=Q5EcaWH2bZhUc6F2J8b+67vNJabG90g/mzTYGhn/j2xvWjzNcLNisLFUHAwsQ8T/OEk40QhbPk+ywEZabM246ShsylkMCnYH6GXRHyW6bIJPp8+pfUTnHoFQ/5r9fFYgnyIplSQcIoBpUofErKqGAO4UyN7RiBZWcrdtjs3iDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775516694; c=relaxed/simple;
	bh=PQ6kFlkujbjEumz0+/YOBAnPDDNcW8WkaM8HVaueoDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L6T/VHzCWNhlyL65felRMk9KXJ/oRy0E1Lvj6SfrslWrSINDg0jsTIE8/Pae3VYF48XISPLWkomz5ClaFk+NeCOJxgpobf9vZ3tI8gjpSuemEEZgCsw0/n0bv7s76eob8YmwPY5odMYlazcvLec1Q9E7MisYTGBndCHTICaExb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1bpV+1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZ0XwRvJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1bpV+1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZ0XwRvJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQwmX4009589
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 23:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ow0rpNiShQqftCOV3v2c5h
	yeObiaytexs3/f9bNlGQU=; b=a1bpV+1UjqNKQ1uHNBcnpoYZeno/N8U4aJ3nMM
	qIQj1u1ZW/QRxG/a4UtMBevi4wf7xx+9dBvh2Co8mlLusdKEzxg628uaAq2b7pbU
	7vX6StTq5+bx+5u1DOqGBITExbwZuORW2lnUv9fiz6aPBoQmmkTUfE75qgR53lOd
	t0cRbTneZal9tnJwU8UMv6P8Ih0CNa9IOWnX4ga/cZHZRJiYFbsNy5kndRXqgQpl
	LErfTLPT6b9kYzwrF1AaNA4F3BHFLUzAivTPddBhtyIFJtedynRetfI/p/Vta+pK
	J+iOVU44Jb1P7k8Y56eaTsM/08jwyUHoB+2TpiEKx24uP8+w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkr6cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 23:04:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12bfa367189so24599603c88.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775516691; x=1776121491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow0rpNiShQqftCOV3v2c5hyeObiaytexs3/f9bNlGQU=;
        b=QZ0XwRvJ4oQdgAdE0gM9udl4ymjRS6iXzrNjCtM6fHpeWe0w5GG6nMTedEZU1ESl09
         atBRQP8/xAA/icgNGm2zJ+ec9q07jTdHwBYFGs3nSasRWEG7qSrBIAn5V5vI+WRVhh4/
         smcJ8NDgcZtabqysB4svKPGGM1rgFYHonUSjOzEp/u+p6HwbY9W8deqUaOmC4uiiYQBD
         nTdBgH9d6BIxV1pfnd3DVo/RoN8nfO6c89wtj5MtU2tLyOxA+x019bQsWSFZFyneZ9B7
         TjOXAxNfduDCSuKYmqPUMxFp8Gl0fAnspAEQXtleX7ocHmmTnEdJNdy9hEtTCaxB7MLz
         paDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775516691; x=1776121491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ow0rpNiShQqftCOV3v2c5hyeObiaytexs3/f9bNlGQU=;
        b=b4yxA7i6TA/8wgxmsPrdD+FjWvWBk0V/35tcK4BDT0t7zN4l+nh/N1EpIeNQcZCHc2
         Hg/0tvcSjy0CroBLJHCT0aBjYMPUjCiIiZl/hzdF8lH0zJ50MXU4LTmqhz1UvHX4mACa
         RBfo0P3cpxbj6+5R1j/rMYgmWU6r1f81UOPdUxaM7CDVXwliBD82kmqeW+FYM7mmEHWT
         7y84GMB3hnclffqeC/NR4toRl0Gh6RWwPpe0D7LxtTHsHrT/sql+7g8gV8xBLSPM5n+k
         0rrMDsc3eZcG8k2fN3aTNmFvMPH9pAe3KopDuVUC8Rt31b/BefP+dFO43xxm6Y1vTzvN
         nMXg==
X-Forwarded-Encrypted: i=1; AJvYcCWq+9CzMQwrBKd5hKuLb5oyYLfHmAUY3pmrOzBKLIHURqqJv02crLiyXZ4VQu37sPvlSElLARJgyWmp@vger.kernel.org
X-Gm-Message-State: AOJu0YxzFunKikMKEkdn7ykitk6cT9XhhPTRDjt3Jsjz/utnKph+IIzK
	HYTp9HOcslS/iZOzTM0jUz8tyuZZE7U3e24G5Ydj+2cRsHaHvmi0Ul22/EDj36bo4xZor5HTRk1
	pMliMcYklKaDRMCvdKCcSH8d2SLTjGKz2AbwXAJ4Ks1Ylp7hUbtL2jOsIEjTWfNzq
X-Gm-Gg: AeBDietECYwuCuFFXP4VCWnp3JtqpuxU3UR1HUTuiLyZAJjwZ2+EGroVcP6Qap1XN9o
	+48KD1xCWPCLis+iXarfFqH1YBeFz1WgvqjctBXR7sUt1hGJ5RXjSR7C065ePkrgH8HpdpM1Lec
	DrbP2LGKwY08p3kPkjPoYLfgf82EngMIPsqCCA5lbDeO3ms+iVbsA4ImVRYMY+9fcLPsbgkRIM4
	/rhrz8/GDxoV7VPTugyKzA2lqvQIpcCEC7S0XPMAkhUCx/qxp+2jnUkZuwJhSbE0xEUwtCipxET
	AwbPowUvrUGkjM1cfpKecV5iih3oLDZF8urZTrqoYIzZrr7G5TC5GKKapDF7LIELiyYypDrDHFx
	uxEaH88aIuRvxcZ1dfzFlQX671Qd/H7/1l27piaClBmqTbnIKE9HWYm8Z9j1GwoocXfA5AzvRjN
	gP
X-Received: by 2002:a05:7022:52b:b0:11a:51f9:db0 with SMTP id a92af1059eb24-12bfb6fbd8bmr7961171c88.11.1775516691176;
        Mon, 06 Apr 2026 16:04:51 -0700 (PDT)
X-Received: by 2002:a05:7022:52b:b0:11a:51f9:db0 with SMTP id a92af1059eb24-12bfb6fbd8bmr7961144c88.11.1775516690543;
        Mon, 06 Apr 2026 16:04:50 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm14853281eec.19.2026.04.06.16.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:04:50 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] interconnect: qcom: Add support for upcoming Hawi
 SoC
Date: Mon, 06 Apr 2026 16:04:40 -0700
Message-Id: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAg81GkC/0XMTQ7CIBCG4as0s5aGn1JbV97DdIFAZRJbKihqG
 u4uNiZuJnknX54Vog1oIxyqFYJNGNHPJfiuAu3UfLEETWnglLdUMEZQa+LUE4lpjWatHLteSCj
 zJdgRXxt1Gko7jHcf3puc2Pf7QwT9I4kRSpqzbFRv90Z0+uhjrG8PddV+mupyYMg5fwAj5mUJp
 wAAAA==
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775516689; l=1089;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=PQ6kFlkujbjEumz0+/YOBAnPDDNcW8WkaM8HVaueoDQ=;
 b=GLMWv68S7fULcidmATT0KBMV0+k1//HKKWxC70kzcqFv9TMdn0dS7em2C7bofGyNqqQAFoVmP
 NNjIKDP+q+JB1pKGV7aG7GxZOyLtwRaJST6ULWitoNdCJk+ZbYMreo4
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d43c14 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Q3xDJHZUcaiZJ3d9McA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: dmzbNNp3BYkZUvwCYhDBoyFxwjdH_jM8
X-Proofpoint-GUID: dmzbNNp3BYkZUvwCYhDBoyFxwjdH_jM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIyNiBTYWx0ZWRfX9KK02Jf4hNKB
 HIK/ZEnqdmfuzLwwtuA5/IxCGhW+9kkHgqu6FF8QU2hpUwQ+QyCvUJatAhTJnHktAnfF1vHv4uz
 kiLr/f7WKk8R0HOxx0Byi64ypnczwDAOjFfY+1bVPJyo7A/gXmGeiTr5bsNIITe0cck9UfHZWF7
 MOD5XDU76AmKEuOMpmJLAGEbzGlryOPZ3svy1lUoWr8N+cRf03VMaRz1WmrLk0t8k30zTAgNZy1
 he0ZtEcipfdCs92aI+lWsN6E9VzdrTBNnW04qIKGpSRVVQdA5fHVcUGNFbaL5aPnNPS9jZzStzb
 2XyadRojDJpt4OSljSwpv7uFrSQyGRZb0ooIZZceXED2yPf6UEpciutKuSGYKjICFm/+ylgpCvF
 9H7uU8hUK1pim9nrsVsJR3CAG7Ez0NGcsjvba8XxFYXkaof0eUaz/Lip26nUosTc128MzSB13EL
 NxejTYf3MwPwJnoWGGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604060226

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v2:
- Fix warning reported by dt_binding_check.
- Collected Acked-bys
- Link to v1: https://lore.kernel.org/r/20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  131 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2021 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  164 ++
 5 files changed, 2327 insertions(+)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

