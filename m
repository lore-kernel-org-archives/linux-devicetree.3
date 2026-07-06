Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95143424650
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341092; cv=none; b=sSsGrPeR3X3HoIH3tPiPRzUKx4c11YrFge2j85QyIxrLBzqjZsIl18x1l4y1E/4K4JFdQs/o+Ilq/F+ilpfKpWPpp+UGjN0DX1VIwWI28jSgPaevX/naLLYS+jnBke+gE5u/s5ndWesHLrIbkXzBRkGx/oP2f56b3ipqtliES7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341092; c=relaxed/simple;
	bh=UHo4xkxhXu6Z76ttNH/JDj+16srAwL5/DttG6yBH1yU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bZYGRKGbD1UNi8aomoF2nT2D7MfXLj/4tZyKXFXJx/NyeydTfK+eNyaGIRHJ2Tm2QUmhq2uOAwZDQ0EvAcpVfgATQMprz98NlB2pii/PemXA2xFfuwMOxOw6PkzDwabFHFOX8KcJ/preyuyn8TgjEJGgzSSxelQnIRJ17c82Ics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1bMyFha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Slmja+cz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1bMyFha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Slmja+cz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDZK238262
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ookh1o8hZ7t6KURFUreTDn
	sNzX4fHQw5h4RKrUfnpoU=; b=k1bMyFhaeNA0HQXVjd25ZIZ53XVKWYoTFB2vSU
	Vx8Mumswd6Nh2S2yGUPlG7S1EvQEaHF7UuA9jXzsbJBsS5X4vRf8UAM9nFJStZSN
	UEi9JqElqlzW23NpdR7cX1FgZoSbE84YQCP3fbjfduyGW6fXJlKZmtjraaPiyXvj
	BlPkgaFo8iqiy9HLvittPIl8ht6wdFibldQmuPM09AYE4fdNClY75BhbbvA7Cqn4
	jZQg809xrQ5sSZ3/T/r87piHHOlaCyOmboijYMChvRCZFglxBQE9c5g4SocNUauG
	6pcuwyRzBUsTyfEaO2KThAk/TZNWFvj9/+2oY45nXgZ/07eQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88xdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:31:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-736e9030d93so3246299137.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341090; x=1783945890; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ookh1o8hZ7t6KURFUreTDnsNzX4fHQw5h4RKrUfnpoU=;
        b=Slmja+cz51j4UhDif1T+07KmFrSAiB/L8XuCkKCy5nCfk91mwWjBoD72iZHnZBy4ex
         D3FEkX88vuMSMqYaQ4YzXpxO5go3OhDtlBIX1I1/jlI2+Q95ibVr0P4wazq2R+/PiNj+
         R41HqCSm5uVaYNyyXNYF4j/WwgCjy5kOA1c0x6CQyQPwzchYkUSsyIgFLJmXECv6XEM+
         JH0HhjbTlb1shKux1cEFRPeEN8asFxFTcSeR+wUCKVfQBYd5dDNffCmVSYnrNhjWRSXq
         YTB4m8w6smGeBg8z+9eTE9TcdJRAq7yT9o2iTBGDWWsHCcmxEPfh9+ZrfnXFdBV/zVgO
         DF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341090; x=1783945890;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ookh1o8hZ7t6KURFUreTDnsNzX4fHQw5h4RKrUfnpoU=;
        b=ZSxQTktRlV09tNouCVKf4bmjJHMc1ZzZJTrsHj5187raQkX7wisLBfFcB2QfrBtdib
         OEFwP5kPlmY/67EHgoczTA8u9XNX1je4j6sXd0/GnIaL4Oeeckpc7qf4N7SYV8laijSu
         JJod3yjmvjhTvdJXvU4DMAzv7rOd1oJcsSsExLNUCMBvgXp+f/AAbd4S+0VOn3bY0hfB
         Ov0NJbBiUWEJPTGvuV5KB4ydF1szwI/AQmTx28eL2Nal2PV3eP2V6wJVV66a7CVitFSe
         3f+5K7EC+kuVRLJfqLpdh5HxTGv+XTb78o/T9aY6ii6J5Lcg5aIkC3ollUl5PyfxYvLx
         QRKA==
X-Forwarded-Encrypted: i=1; AHgh+RrTM/ZfeYB6+N9C5qZNnXTwvmROfj9eHtOXH3YIP5ekvWVu0TlYC7P54u2UB9aHYrMFewK83xRu4P55@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zzW6YPjEbP6mGVxIHrRvrGFmgnhVTUJx/XLansmyhLxc8dvb
	VNrySjDNqMCiSHkF9MNs6xEsK3FckNTdwlcXzQ22h5HqxfC7q0Sp4A9t4vt2XOKUb8VI7rDuAiA
	VaD6CjAFDhPKYy1BYR5TnuqRrr5a4lpPBs7zqKIJYUC4hckXlc4cbxlub/LhC9BY=
X-Gm-Gg: AfdE7cmCUsZUmvqXeWnYfokhhZAw2a3JoTIToPXIK+GM89Vmi5/oDE7u5YHuX4AqWuj
	uvu1M26c00Ue5C51KCUcCxbgfajQh6VGhcaupQmcAbAW3DkEd0tKCGCKOBEQ+z+hB6yyOcqSdyC
	0pwzQxOgvdiFsM8ZLEKTtObgAul0zozUIoQ7/FfUve2xA/jiefODEoQkjJovO11MKdTJbjLh2iK
	vZJyE1BaCDLh9n0+YafeytcCqoBcu0Sa8PD5/CgT3Zad7bgKH2Cy5UrFTpz3BMcZzba0FtYU4Mj
	cWbOrIfwjyA8+Nd6UgxzhcnOK4ukEH64gDjkMi+dMi/exxEku8p+Jz6D0zhbvyO4yJS4CCfsyP3
	81JqbbAqZeXBexTV0PMFTAEw5lOSDRh5a5f2w1N29
X-Received: by 2002:a05:6102:5125:b0:73e:8694:c6da with SMTP id ada2fe7eead31-744b7f71886mr117437137.24.1783341089301;
        Mon, 06 Jul 2026 05:31:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5125:b0:73e:8694:c6da with SMTP id ada2fe7eead31-744b7f71886mr117383137.24.1783341088826;
        Mon, 06 Jul 2026 05:31:28 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:28 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v3 0/4] regulator: qcom_usb_vbus: add pm4125 VBUS regulator
 support
Date: Mon, 06 Jul 2026 18:01:04 +0530
Message-Id: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAigS2oC/33NTQqDMBAF4KtI1o0k0UTrqvcopeRn1EA1NqmhR
 bx7o5tupIsZeA/mmwUF8BYCarIFeYg2WDemUJwypHs5doCtSRkxwgThjGBpzH0aSso4jmoO2EO
 Hz1zXvNZCQlmgdDl5aO17V6+3lHsbXs5/9ieRbu1/L1JMcCsM5aYySkF9cSHkz1k+tBuGPC20s
 ZH9qIrQY4olSiipWZqKFvSAWtf1C5N+igoIAQAA
X-Change-ID: 20260520-add_pm4125-vbus-reg-95c858c6ae43
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=1904;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=UHo4xkxhXu6Z76ttNH/JDj+16srAwL5/DttG6yBH1yU=;
 b=E5Pma+rGFEINz9HLpoMbo0EAd+DLuN9X81OtAf1VoUueH7Z16wYQjXz/X+rB7MJ8ZxISzGriD
 5qBO6n28EahDBmiPN23EyCaBVxCGb2aG+XfGa6ajRnxWl0L5i4+41Nf
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX61TIwtIn8fj8
 6eLb8uZ18IgBMIpNmCghrN2qUor2DL+rC/0jZofnwcOhuUXI/6AwGiWSAjWSXWIYko2gmtTbKjf
 2wNOwA44VS1WAN2xxgltfhpVIkSJnsY=
X-Proofpoint-GUID: jKtMch_nf2Qwalq2vGbdUiopy226AETo
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba022 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R4MlLg9bFeQ77G5B0twA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: jKtMch_nf2Qwalq2vGbdUiopy226AETo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX7cEhKGd/JEPu
 yxrzUJt8vspXTSiOKwaQem02Szp3yUYgsl5dErKurjc1iKFFkNLFg8WFE55XkzESmPpnDtk4eaQ
 BAk3nGYh5gUDgo4OH+fNuThAfwv0kh3ZzGh8juSBAzuphqJWytdyxBcb7nf0cT7KEDVfibOVTj8
 BZoRs1bZUfaL87JvCNxVH9HESKzWmSux/1Okp+bhw/NzM+HVMxOfjdkI/ri2pGvGNcwp0erPMIN
 XxA+irZDmYsy49Fq0vv54KSymuJMUuO0298muiBYR0owEbRSFt5sqaumSTHzO96OQ0bPMJReuAQ
 CGuGC4VxqfOUX+gnOm8cpMH38aRQehk+JjRxqc275nIOLuHA6JK3yVpChPqkWWgtZ5KdiqR7aMQ
 Pk2WTZRsIdEC0LRb7GMhDA2Q6N4EPgP30AzGl4g0PeoQ9hLN4zGssSd+z/0P5k8cmQb3zSAvraO
 9Egx4EDOFhzWXHAs/yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060127

Add support for PM4125 USB VBUS regulator. Unlike PM8150B which uses
a current-limit selector, PM4125 uses a 2-bit VBOOST voltage selector
supporting 4.25 V, 4.5 V, 4.75 V and 5.0 V output.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
- Updates the Vbus voltage min/max to 5V as per Konrad's and Dmitry suggestions.
- Split the Driver change into two part as per the Bryan O'Donoghue suggestions.
     - Patch 1: Add register abstraction logic + PM8150B support
     - Patch 2: Add PM4125 compatible
- Dropped Konrad's and Dmitry Reviewed-by tags on the Drivers change as I've split it into two patches.
- Link to v2: https://lore.kernel.org/r/20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com

Changes in v2:
- Fix the registers name and unit-address as per Konrad's suggestions.
- Use microvolt instead of microamp for qrb2210.
- Link to v1: https://lore.kernel.org/r/20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com

---
Rakesh Kota (4):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
      regulator: qcom_usb_vbus: add register abstraction and PM8150B support
      regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
      arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints

 .../regulator/qcom,usb-vbus-regulator.yaml         |  50 +++++++++-
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |   4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   4 +-
 drivers/regulator/qcom_usb_vbus-regulator.c        | 102 ++++++++++++++++++---
 5 files changed, 138 insertions(+), 24 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260520-add_pm4125-vbus-reg-95c858c6ae43

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

