Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172813;
	b=plbo11V1HOkVSsKEN8e4EqMoURJV1l8bLzDnh2YUYMi77tkicT2bX979RZPOhEsMlKRU
	 YPM9vmZCDg0hVY+JETb/Xe2vcOfmHyGrX7okMZrqyBUjYPO9A0u1C910GNj3tpHO4aS+2
	 ZQcu0RSaI/SA1W8GdkNd1Sy/8K5eFturKbwdPVN73JT9PR6RvnmmY3ZRR3jcRoaoRGEaw
	 /fshLfLlgCVHUYuc9jKlnpw6zhnE+1vFcOS++zEbZ07x28eBKbShK/G/c+ZptGVCtpQAI
	 zJRQ7KFp1JPJkSxiWW1BWHRmxFXeLozsK3mX+KMiiOY1APlVlYcVwe2Uy8GtTfZgsmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FoAuz/4JshB4w4D/ztpI8jPhEMpDSwukAkqIBtJVx9M=;
	b=YZR31PyNAuSmvUgkDySn/Z8k8riiOl7C/Xa6vpOZO5PaRBvVyA4QTICj2sKeIgfxxeJn
	 hlkbgF6ah6jvcrvt33htgQQyfLwW0GjN65yjIB8t8GAo0naPEHgcvTuB37P9UgNOnsDXA
	 JIvGMla+OBy27qeqOhFgsIROXir8J9BQzxtpUx0xuUdgHXKptN6ilsS0oLDxGjEpJKswk
	 ukDyyFF5IGeQgwGz/a8RhLIzJ2Z8l8zdTD144QcWV+YJwfZZH4qz0tlh15etI6pN2Avc1
	 Q/Klb0hHbJZfMFJD6zZHvhkUVlwqff2bCs6RKRlEWjdzpNkxrC9Y8V5SFrIckgIjmBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vc431bmH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFJiItZL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED1606A334
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ED1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vc431bmH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFJiItZL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkBio3987435
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FoAuz/4JshB4w4D/ztpI8j
	PhEMpDSwukAkqIBtJVx9M=; b=Vc431bmHORXlRcFlDzGkPmQ23gWZqtZE/uP5of
	X7dd+D/IevR2cCoMYpXW3f6TQBIa+fnZkcfe7FtniZOGvDSI6N4BSE00yK2fzd7h
	+x1rpgc6avDIApa8TObJVtC5DccQuP4kJuzDNcOvCb2dJZBDVrHP0gZaAZPZdiyt
	giqg2YKU4fkLWh7gwj0XnSOoUZUQtW0iFayf+zDqFbfwHmIiRojaavWzGq2vCTxT
	B6qGoe4e1iiqpeiSvFGRrMHc0PWDugijhlFzdqd/H8HB4NVm9JZ9KSyCA1Tza0XR
	zsqpYBGMDCcHDzrdFyDsK+gnQhX4Uy9A8Kjr4mTFhqNHmkcw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu813x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:06:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1146668eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172811; x=1795777611; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FoAuz/4JshB4w4D/ztpI8jPhEMpDSwukAkqIBtJVx9M=;
        b=WFJiItZLe6czJSvP9MX8lWnbl4vjkiV42v+3DIX/LTQd/KYEKuAEf8jrQOQz6RBcuT
         5m9mFGWbjco7+jqE9h3iBVM8TgFTv+43Y+OtjFei+X+kO4YjxVbaFuqTce4sFCTL3LL5
         gVYJnGlP4uGT2Y+Lh0uyNNutj1/A6U+CPOri4ATgwTk8MGH+WadkftNMcQXk6tAo/Eqp
         8j1aWaZxeu3NWfoq6Iqv46cMSQTHOCAupCpcLTcepdiPcIbrgYD/RUtZ4o+U9HcvJi1b
         VJ6sm5CPy1nve9EraPwjvatOokEW/DuhvAYO7yTPnMSI85dyoROLHfMmas9ISSvRuxRV
         Vf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172811; x=1795777611;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FoAuz/4JshB4w4D/ztpI8jPhEMpDSwukAkqIBtJVx9M=;
        b=rK0jZjo0MgNCo8Il/OIzVfaT7CkUX1FW1YS2M/I80DocmnsJKX8Cj0Tdqn3/l2cUIb
         1aBCvfBm3SxO6d2VtUC4O3LquokuCD1Vqjp2LZsHYn5T5iyQ/k8L2yGEPlnBEooSOXP5
         m80ffde/P4dmEO89+U/6S+ZEeRtKP+Zsh93580UpPenoXyszgjlYfsGRb5cqAsHUchEG
         ZsxTmv3IEVRsQhYFFCG5kmcHTB+r2jwXSSUm4Wo/QhcXzFEcQ7mZhquzSGbQoTd1GasF
         au+eaKH9KkKbK+TcsXtPcQbFEMs7rEiN4FzZO22P7L4kfBGn2I07A/I6RgMb3rftf02o
         sJRg==
X-Forwarded-Encrypted: i=1; AL+hErHw0cSdq7emtZ80PRL078+o2VLA4OYY9WOmUcUEsblD5eFRy/VdDnqPGLNvlCgZhXEZMT0ymRl2cWut@vger.kernel.org
X-Gm-Message-State: APuU4Z8E89/w9fRwwo3Fd3bpeFTO6TcHeGPs9wm0PHbZEBZDP0Gpi7Y9
	InlzQOTDTSRbUhiKrynw4P1Y9OLDWNj20cJaY9q83laGo8m2vDo0lGyk9cP0TPp5xVnvjOEciTb
	9T7tAw/f6uwrdkUutTTZK6AjhBnMlri0IYhWlB7p5/Kn/pIPzeDFIgUPiqBn1nBEX
X-Gm-Gg: AZFdTZdb7Npbr61Ra3+k/iQ2GWFRGGoauKO/Qg2Al/xv9ZrLsbvrSOUfLUF3AyiX+2e
	fEUp7J0KHBuh25n+KF0vjNy19P1scAtCc3r+LeJDpjfwzSQqr7l/iIen0uHS4j+h5ibLZDR7WkU
	mNZPlPoHVmee3LHpYTPyvUju6p0JYFfF3JI4jxwQyw8yxfqAVhUr+zsm4P1yi/tLOI5CGhGZ12I
	DjDk7jUQ7FOzyR02FEtpxKPNs9Osor+sa2QALWPbYxbirv4rknfy1gZIPmb28+Y/vOU8BJ9OYsx
	qE2mlXn8y5yVz+UmUOyhxQBoMEx+saTKk+g6d/wsr6MGwnEHKk8iiUFJ8OarQYCZv7WXSZhcFB8
	SwqytrdO8Y5jD9he3ntRgupdsnZNGxpoJbm3DEbw2TynteAlHlyKdKeWMIdKJHkcOOMtfWz4pyt
	57Lpan
X-Received: by 2002:a05:7300:e9c7:20b0:385:af7b:d77d with SMTP id 5a478bee46e88-385af7bda28mr2022645eec.1.1795172810489;
        Fri, 20 Nov 2026 03:06:50 -0800 (PST)
X-Received: by 2002:a05:7300:e9c7:20b0:385:af7b:d77d with SMTP id 5a478bee46e88-385af7bda28mr2022569eec.1.1795172808758;
        Fri, 20 Nov 2026 03:06:48 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:48 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v4 00/20] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Fri, 20 Nov 2026 16:35:41 +0530
Message-Id: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUpAGsC/yXM0QqCQBBA0V+ReW7BtF3RXwkR25lqAkfZWSUQ/
 72pHs/DvTsoJSaFrtgh0cbKsxgupwLic5QHOUYzVGUVSn8OTqdpHVgypTiLUMzDiMjZMoetD42
 vPbXYgA2WRHd+/+bX/m9dby9rvkc4jg8JhUrdfgAAAA==
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=7571;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=pdxjtL/I9+iniv9i80dLDw+HuIP5yKp4NIiU9QZMoh4=;
 b=gwbisBsC/M5CQj0fLbCn2iPoDx6q9nbsEsGFOPYapp/51vHA8DwsIpzqBp8dS9XAQzq9ulcrB
 +/lyzsmwdiVAZHZ9XFNeMGenqRCIxiTDodKevsr4b8zg3ICOnKYtmGg
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3JPyWVtP7D8k
 klupaWnZKxt6FVzk87YlUaGmcs0sKZ/M+ecvDshy7vSTts6m1r8GYOeCDTrZ76ZqotqQG8ffYGF
 Ogpa1NUNdjWO1Q1PCJxPG1pyEH5CwlPZu08guHfxIStG9ohhKl8QCHJyjDaJodf8PGm6C38vxS3
 kAIMCKzIShpLpGWeoUkQV8Srpd+KTt2Iey3uWfFw890RtEq/VDuujhq7ChMJEyZBRmkjZul0IbN
 +5YqNer4OVzvH27oB8n3KvjRl0aJLU1ktbn4u7oMTdudYYlvVy7l90ORVBbQ13sV/M+lQLwUjE0
 +qDMCpOmJ0eEtFuYpUzNTeUZGwZn36P2rKJygcNz8wqBG5fqXl7+MTb2g44C7hTlfBhZoaOHk5o
 QrHukqAb1B5t9qLC66yq2TTW9CFU4RTddFVTPb73SbxfkOjH3b9HbodWC92MEqbprf8nSsfS5l2
 PuM9t9Mg0s6HJZFPZOA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0029cb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fn02ttKd-iuB0E_vrvUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 53WP1S9S3BkIeHHB5F-trGIt1i851EZA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5P1zTr3Ombu4
 JyOM05T7BCsbSVZbT5dSchmBbBft+6fQqiWBwqLphxj8owYUnTqhluS8AOik9HB8P7j7RvAddFD
 cTPLQE5D5iowjkUaZpwiQRriRIQAYnc=
X-Proofpoint-GUID: 53WP1S9S3BkIeHHB5F-trGIt1i851EZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Qualcomm platforms using the ARM MMU-500 as the adreno SMMU,
the GPU TCU is a separate hardware block with its own AXI master
port (alm_gpu_tcu) on GEM_NOC, independent of the GPU rendering
data ports. Without an explicit interconnect bandwidth vote, the
GEM_NOC path to DDR can be left unvoted during sleep/wakeup
transitions while the TCU is still active, causing intermittent
SMMU register access failures and SError aborts.

On earlier platforms using QSMMU (SMMU-v2), the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

This series adds interconnect bandwidth voting support to the
arm-smmu driver for all Qualcomm platforms using qcom,smmu-500
as the adreno SMMU, starting from SM8150 (Snapdragon 855) where
this topology was introduced.

Changes in v4:
- dt-bindings: Changed interconnect constraint from items:-based
  compatible matching to allOf/contains: approach as requested by
  Dmitry Baryshkov. The new form matches any compatible string
  combination that contains both qcom,smmu-500 and qcom,adreno-smmu,
  rather than enumerating specific compatible strings, making the
  constraint future-proof.
- iommu/arm-smmu: Moved qcom_adreno_smmu_icc_init() into a function
  pointer hook icc_init in qcom_smmu_match_data as requested by
  Dmitry Baryshkov. The init is dispatched via data->icc_init() in
  qcom_smmu_create(), keeping the hook architecture consistent with
  other Qualcomm impl callbacks.
- iommu/arm-smmu: Replaced #include <linux/interconnect.h> in
  arm-smmu-qcom.h with a forward declaration struct icc_path; as
  requested by Dmitry Baryshkov, to avoid propagating the full
  interconnect header to all includers.
- DTS: Extended platform coverage from 4 (kodiak, lemans, monaco,
  talos) to 18 platforms, adding sm8150, sm8250, sm8350, sc8180x,
  sc8280xp, sm8450, sm8550, sm8650, hamoa, kaanapali, glymur, milos,
  hawi, and sar2130p. Note: glymur uses hsc_noc/MASTER_GPU_TCU
  instead of gem_noc; sm8550 and sm8650 use MASTER_GFX3D instead of
  MASTER_GPU_TCU.
- DTS: Kept QCOM_ICC_TAG_ALWAYS (not changed to QCOM_ICC_TAG_ACTIVE_ONLY
  as initially discussed). The GPU TCU is a separate AXI master on
  GEM_NOC that may fetch page tables from DDR during CPU sleep while
  the GPU remains powered. Using TAG_ALWAYS ensures the interconnect
  vote is held across both active and sleep states, preventing the
  vote from being dropped before the SMMU is fully powered down.
- Link to v3: https://lore.kernel.org/r/20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com

Changes in v3:
- iommu/arm-smmu: Moved ICC voting from generic arm-smmu.c to
  Qualcomm-specific arm-smmu-qcom.c via new runtime_resume and
  runtime_suspend hooks in struct arm_smmu_impl, as suggested by
  Konrad Dybcio.
- iommu/arm-smmu: Moved icc_path from arm_smmu_device to
  qcom_smmu to keep Qualcomm-specific fields out of the generic
  driver.
- iommu/arm-smmu: Restructured arm_smmu_icc_get() error path to
  exit early on success as suggested by Dmitry Baryshkov.
- iommu/arm-smmu: Dropped if (smmu->icc_path) guards from
  icc_enable/disable since icc_set_bw() handles NULL path safely.
- iommu/arm-smmu: Changed WARN_ON() to WARN_ON_ONCE() and
  propagate error code to callers.
- iommu/arm-smmu: Changed ARM_SMMU_ICC_PEAK_BW_HIGH from 1000
  to 1 kBps as a minimal keep-alive vote.
- Link to v2: https://lore.kernel.org/r/20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com

Changes in v2:
- dt-bindings: Cleaned up 'interconnects' property description --
  removed "Optional" prefix and driver implementation details as
  flagged by Krzysztof Kozlowski.
- dt-bindings: Added allOf conditional using 'items' to restrict the
  'interconnects' property to Adreno SMMU nodes only (qcom,adreno-smmu
  with qcom,qcs615-smmu-500, qcom,qcs8300-smmu-500,
  qcom,sa8775p-smmu-500 or qcom,sc7280-smmu-500 compatible), so
  non-Adreno SMMU nodes on the same SoC cannot use this property.
- Added DTS patches for kodiak, lemans, monaco and talos to add
  the GEM_NOC interconnect path for the adreno_smmu node on each
  platform.
- Link to v1: https://lore.kernel.org/all/20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com/

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (20):
      dt-bindings: iommu: arm,smmu: Document interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support
      arm64: dts: qcom: kodiak: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: monaco: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: talos: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8150: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8250: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8350: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sc8180x: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sc8280xp: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8450: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8550: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8650: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: hamoa: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: kaanapali: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: glymur: Add HSC_NOC interconnect for adreno SMMU
      arm64: dts: qcom: milos: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: hawi: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sar2130p: Add GEM_NOC interconnect for adreno SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 +++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  2 +
 arch/arm64/boot/dts/qcom/hawi.dtsi                 |  2 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  2 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  3 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  3 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  3 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 50 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h         |  4 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 29 +++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 23 files changed, 143 insertions(+), 7 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

